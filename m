Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F88CC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 10:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1csdPJkrYHqiTa7aBB4h7tPO9DoYuuIveSxw3PXJbts=; b=1ID8MfKsXdsVHLsxa63itQf9WO
	0S2WD52WTtYSi35E2EhWrrjpAQd0Aegi7d/qNlokVRbZYeFPNxKT47i2vrTlAoHGlKS7nJsMSX7l1
	SM2+dW0W1ZOXtJtzb1lq6jogTnKQV/PlVY1QwXIYlE9sG06lyjddLG3uEsm+eRBm2FTmYgfWFG7a6
	RAXV208yIyGC5nmChzaaNKNQg7Gm2Bk5F6cD2y2mxjcPabyoUyfu34caYrGZl9rt8xOIjNCP6mswE
	OYaa5laH3HpR2eHIV63mWtQvHhibG4KCpnIv/AeNjWmTEoS/GYV6oR6pvNP1mAWpe+XiB5cYuFuMZ
	eERs7R6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMwO-000000009LT-2QkA;
	Sun, 06 Jul 2025 10:49:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYMtU-0000000099D-3Anq;
	Sun, 06 Jul 2025 10:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1csdPJkrYHqiTa7aBB4h7tPO9DoYuuIveSxw3PXJbts=; b=Fv7E4uY+Zu9UYX7fPZFpy6q6Fn
	4qZleqGkmvnnsKgTWZalmNha82+2YZxq21TUUsgBclr3OO9eQ2wEcv5puHoYGgVyP/J07OZBhRsAY
	uCy5DyjvCYgO4yuiEfLjAHOaMC/PWOrfEJ4MkFk6vvRP3ZMkF0q3Oa/HqWRjVFvqr4vwB0Fr4qm7O
	BRXdTRhGtCmeL5El4kJ7JJ8J1PsQMORmIw7bZe/T6jyqegTYDJCsJgzdY/CBbSzSq34+Yy+/C+LWx
	RMFzxrAK4NrmIUo/Oaq+s+yTBJAipo/tyvE8PKUDZhXsvDVMmBx+vrve3XUiIIDxhTqMGj6xxAtIh
	T1KPJGzg==;
Received: from i53875a35.versanet.de ([83.135.90.53] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uYMt8-0002wB-6E; Sun, 06 Jul 2025 12:46:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Piotr Zalewski <pZ010001011111@proton.me>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rockchip/drm: vop2: make vp registers nonvolatile
Date: Sun, 06 Jul 2025 12:46:25 +0200
Message-ID: <4207630.fIoEIV5pvu@diego>
In-Reply-To: <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org>
References: <20250706083629.140332-2-pZ010001011111@proton.me>
 <OWFHI491RHadO01jlQPA34GX28LC7SseKfNRwqQy4etkkJyP1YeF_0EDdAgpSXx5RW7go62EAOkedW5nbyn_hlz_K-NUrnNJeDFWv0OOSO8=@proton.me>
 <DB4WNMVBIWYS.273Z54K6O7DTM@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_034648_797864_921F0BB4 
X-CRM114-Status: GOOD (  14.27  )
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

Am Sonntag, 6. Juli 2025, 12:37:40 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Diederik de Haas:
> Hi Piotr,
>=20
> On Sun Jul 6, 2025 at 12:20 PM CEST, Piotr Zalewski wrote:
> >> With a new version of a patch, you're supposed to add the tags you
> >> received for previous versions, like my Tested-by tag [1].
> >>=20
> >> (unless the new version has changed so much you feel they should not be
> >> carried over; you then need to explicitly describe that and why you
> >> dropped them)
> > =20
> > Forgot... Should i send it as PATCH v2 RESEND?
>=20
> I don't think that's needed; the maintainer will let you know if that's
> desirable or that they will add it (back) when committing.

The problem is then remembering to manually collect the tags from a
previous series.

=46or my reference, it was
Tested-by: Diederik de Haas <didi.debian@cknow.org>

So hopefully I'll remember now :-) and there is no need for a resend
at this time.


Heiko



