Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8068CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 14:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdfR3+ghXfvid8Ak9BFhtOhrGJNHg3UqEP+sC26bPJo=; b=f9dUf8LxV8qPKnqXT/oXAKWO6l
	HYJqDI+pf9s/nZzsNkmxtC7Gw4HyYmTKDjvuOWq/avujfQASXAAtIUjjvzgvSL+qm8RU3AFmAw9JP
	AHL3ALaFalYwrKNWNHzZs6ATABKn1YW104xC7d+C3DYftNQ3v5v1jX6b/tCsMmsgTs+roItaA0pIG
	Evi6cANCDbgwC70upnVTOZ4bykAX6wlLJSVWGPMydnWd4mEIuVUoBRvyuIAybs6eoR6x307tq9tH0
	dIVATMau6sOdWB9UP8oTFtNdyRsrnwWXyL6qJUwiHZA/g7KcDRcJwLr1+7GEVzh3L9Z1vgzLZPxZB
	e35Dbgww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUBL-00000003ovc-1lVX;
	Thu, 31 Jul 2025 14:22:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhTbv-00000003jKz-2V8w;
	Thu, 31 Jul 2025 13:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=EdfR3+ghXfvid8Ak9BFhtOhrGJNHg3UqEP+sC26bPJo=; b=s2aPDoKSHYE2kKRj6gIVVD1GOV
	fcyxAWhVigRK5nmd4r39qvJYfsh15mYv+up49sLyMVgmgm7fdKeXj6Tz8jcov+sqW47LaViq+O/08
	FiCKhEKVmsqLmQ0JaxVWMq4ng6kFiYqGXXUx75iOnj6mx4t/NmSeMMj9FH9AsQb12ZZ55EQQgHLnP
	IE0IpOIQkNRTLTp0NQKMuk5DBt+odJ9HJ8FN9vLyk29Z/24LDNtQ4lKOt9lEoGZmmEAHFhbSTLMVC
	b4OYu5XIloViojkcFakmlrrMcioISbGwOtsjg2jyrZ+B2nvw7ptg8weOVx0KeeA2p+xD6aM6MZPfu
	Oz+uHF3w==;
Received: from i53875bde.versanet.de ([83.135.91.222] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uhTbQ-0008Cv-68; Thu, 31 Jul 2025 15:45:48 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, kernel@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: [PATCH v6 0/7] RK3576 thermal sensor support,
 including OTP trim adjustments
Date: Thu, 31 Jul 2025 15:45:47 +0200
Message-ID: <2664626.Lt9SDvczpP@diego>
In-Reply-To: <iafobb7h4nphjcujm34gig6vwlzfveegwewpayehb4h3tayzgv@bxpdfmhf2hfa>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
 <3560770.QJadu78ljV@diego>
 <iafobb7h4nphjcujm34gig6vwlzfveegwewpayehb4h3tayzgv@bxpdfmhf2hfa>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_064619_662315_7D6E066B 
X-CRM114-Status: GOOD (  16.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Am Donnerstag, 31. Juli 2025, 15:27:03 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Sebastian Reichel:
> Hi,
>=20
> On Thu, Jul 31, 2025 at 10:11:23AM +0200, Heiko St=C3=BCbner wrote:
> > Right now we're in the middle of the merge-window though, so everything
> > I apply now, I'd need to rebase onto -rc1 in slightly more than a week,
> > invalidating all those nice commit hashes that end up in the "applied" =
mails.
> >=20
> > So I'm struggling with myself on every merge window about that.
>=20
> Your are not supposed to merge anything to your for-next branch
> during the merge window anyways. See first sentence of Stephen
> Rothwell's mails [0]:
>
> > Please do not add any v6.18 material to your linux-next included
> > branches until after v6.17-rc1 has been released.

The general idea is just merging but without updating the -next branch,
then after -rc1 rebase + do new -next.

But as you pointed out, this is all cumbersome and doesn't shave off much
from the amount of patches waiting, so as most of the time, I'll just wait
for -rc1 to start clean :-)


>=20
> [0] https://lore.kernel.org/all/20250731133311.1a3e3867@canb.auug.org.au/
>=20
> Greetings,
>=20
> -- Sebastian
>=20





