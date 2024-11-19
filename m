Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB6CD44157
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewyDYtdkrySUZBXm+3V/A88CjcALgKhqSqPYvg0yYxo=; b=BHMTIDHKh/MPVj7bnpKvt+71jL
	pl8rTYcHKuwLpnxwWsm1ORG8FkqV/vAUt2OHQCRKattO37adpY1E07x6DmRWQmhTdV9npa9Slz1+1
	mrcAcaE67SMWnQP4V+wf98dCuHRLdUlzrMnzyoPUtIib4rA1vPoJtnwWUu3MEDKiJHPVINBhPMb4S
	tZNky5o3rnQ/Hil7wQGvqKpxc9YoLKoSr8DoI6nqBei/T2RlPj6nzvvu2hg9Z1Sf68Wzao0MFScXB
	TDKySFSgYYgAvFxJLH34c9u+UkfBa6TXiNHyfVL3xYESubW/9SJO4YNnt0exXGb/0Lkd3oil1MJHw
	QU7X3SSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDO2q-0000000CTeU-3M13;
	Tue, 19 Nov 2024 13:13:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDO1u-0000000CTVn-496K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 68DE85C4688;
	Tue, 19 Nov 2024 13:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1ABC4CECF;
	Tue, 19 Nov 2024 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732021950;
	bh=26iJ7jE78hzbeXxIg5NyK0lcpo0yHtsHxP/H6F/2BwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ps+uVD/+GOPfygU1hJYy3tD5S1APowDUjJqo/p9zABIUSdwNLCQjTTIbt80W1xxHS
	 2JaHdZH52qD+52q6E2z9JaNb92w5T1CoZ2MViCXNXbiSBcL9+lUTYXqIp24KngQzGp
	 aGvwNKBhupQe3ZXGYiLHDN8gFR9DVCDHiSy0Xgh621wSUUugE1KZIo8kJNarVH96Mr
	 gPUcQxd45bO03tgAg0beRVlRxt4XvGk+axS0JHr2frC1fOit0h2fR/PMJA4SM8etj3
	 49wTJ3LdgnCVv4D2hYjO+Lf9NWujujk71OKyBU6U7Oj0e1g+wuJM8YMIM5LR/TTFVX
	 KSXe9iRo8DvCg==
Date: Tue, 19 Nov 2024 14:12:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v6 1/7] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <gqzwfe6wucn57plnte3g7c5xiri45mnatieviewgchkpeh562t@gha4sfrutjuh>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-2-andrei.stefanescu@oss.nxp.com>
 <18e7a32c-a8de-4e5a-80aa-248b2090e346@kernel.org>
 <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <72b3b5e7-739f-4f03-ac40-a9cbd37972b8@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_051231_063981_23BD2EC3 
X-CRM114-Status: GOOD (  21.31  )
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

On Tue, Nov 19, 2024 at 11:44:23AM +0200, Andrei Stefanescu wrote:
> Hi Krzysztof,
> 
> Thank you for your review!
> 
> On 19/11/2024 11:21, Krzysztof Kozlowski wrote:
> > On 13/11/2024 11:10, Andrei Stefanescu wrote:
> >> +
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - nxp,s32g2-siul2
> >> +      - nxp,s32g3-siul2
> > 
> > Not much improved. See other NXP bindings how they do this.
> > 
> 
> Do you mean to have the "nxp,s32g3-siul2" compatible fall back to the g2 one?

Yes, compatibility between devices means fallback.

> 
> >> +
> >> +  gpio-reserved-ranges:
> >> +    maxItems: 2
> > 
> > That's odd to always require two reserved ranges. Does this mean all
> > devices have exactly the same reserved GPIOs? Then the driver should not
> > export them.
> 
> Yes, the driver exports GPIOs from two hardware modules because they are
> tightly coupled. I export two gpio-ranges, each one corresponding to a
> hardware module. If I were to export more gpio-ranges, thus avoiding
> gpio-reserved-ranges, it would be hard to know to which hardware module
> a gpio-range belongs. I would like to keep the current implementation
> regarding this problem. Would that be ok?

I don't understand why this is needed then. If you always export same
set of GPIOs, why do you export something which is unusable/reserved?

Best regards,
Krzysztof


