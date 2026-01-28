Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F48D46C0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 22:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8UhMJ0xKlVz0a7BlwVvXrSz12Jbk/HvXb373WDUkSrk=; b=RIW2MMVzIXdyb+SpDfcdtCm1v+
	Rq3r+2oINY1+0a8/4FLp6x5IQK2xx+OqDh5fll5nu/jZlt+cV3irujmSGBwBnbKizMREFk3fQ4kZv
	U4EW5Ad4Ri/+koh8Qe+prYVpVzfRtipVIlM6OFBIwqlcqjmIomIGb7nRKXilssQQsX2aUARPWkpQF
	TZzamiz/iCXSVuy5LmH7B+ScdiGS4MoDWxJXV3Fijk1hFU7RCAVf8ClXbjJAOmlxcbRioiyHsvgBI
	lxC52cSKbZ0o3dA81lG7EAkW+XcZiItfwiEY5KSNFlv6CIEHrMWtbkXYU6YGkpc3GXnA5c1Vh4g+f
	JazzF5Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDab-0000000GrjB-0M5P;
	Wed, 28 Jan 2026 22:00:41 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlDaU-0000000GriZ-2BF9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 22:00:40 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A91E1EC0252;
	Wed, 28 Jan 2026 17:00:30 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Wed, 28 Jan 2026 17:00:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1769637630;
	 x=1769724030; bh=8UhMJ0xKlVz0a7BlwVvXrSz12Jbk/HvXb373WDUkSrk=; b=
	Vuk4lMUI/POEfPTmp4MR1IIIYQBhzcqzMh9y5+BnGlhCvJFPXWzrkHQ5bdujuXDm
	jHgUtAyMTaHooRq2HGC7YCTx/EmmzRQYrmycXK9MBwCMVEe2LB31Ib2QGbQVrpTw
	BtxZKPfOibN1NamuYxNwgPLxkAJz9jBjWpq7UBHrAyshC5NTrAfvheUEpaNjoe6P
	XycK4i/PukF2x0of5+jaMSV8DdhaB38Pelh+8tLmgFCQqqibYmimdYkWV7dBJSzT
	tmUBDToIuiJJG9qA3OPbDBgCUKQHg1ts9UH5dAAb0YGHnjJoxMSArgI8pfT98CBE
	/K/ZFM2LyFBdtEVQ0UB48g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1769637630; x=
	1769724030; bh=8UhMJ0xKlVz0a7BlwVvXrSz12Jbk/HvXb373WDUkSrk=; b=f
	hVua3WHPhdsh3aMCBqX9LLqRRd7d3viH+PTG3UX2Gd5aOSQpndV/SxosXo0SGv+H
	kjkMx6necYMkdfgHjQOF9KzvSZjF1WxgN9U95ilY/ltIt0GkFT2YKdM7MrRV49r/
	04aS60dOkICimuhBDkNpCQwlT3zIynqIVRaawLTS2+inKmporTAKFItD/ORT7AAF
	xJxz05djsCORKC/u746Vo6uSu3IEkW8Z2bPbjmzHa7T0URPHAfX6p+AonG4mBNeI
	HR5qEMoClxTrsHfDt4hIl/2rR6AXpaGe9x80lEQxqDu7/5kzxMzwpv/HEfbzI9QO
	k1riSIfUx2owlfvs45hnA==
X-ME-Sender: <xms:_oZ6aeN8iyQ08vjMn-WXPkwn723Yt42qlbJRET1cL2--KfGpAKCeOQ>
    <xme:_oZ6aXzyarjlvqp4IX7b9fQXU3cZpwfbhduTIv6CODvLN63QrC08MaoNV9aJy1lYa
    sKAxmo0IxKlinYXalfadPNYm9LbaS47FqlWx1KIdVZjx8xSuCxxTg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhtvghfrghnughovghsihhnghgvrhesghhmrghilhdrtghomhdprh
    gtphhtthhopehfuhhsthhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehjuhhn
    rdhnihgvsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhhsrdifrghllhgvih
    hjsehlihhnrghrohdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgv
    lheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehsohgtsehlih
    hsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:_oZ6aVsoozEV9idojAcMgMaWMqYMd07QwrFNb8G0nB4kZfofh4WYMQ>
    <xmx:_oZ6aZYPzmXImuJykVzwFvyjIZywyFFcAfgeR-DmSplrGljgdC-fdw>
    <xmx:_oZ6aXzdDftPZMYIW8otmVJTxyy_mk1QFhkvJmFkT9POOdsJX8Y2dQ>
    <xmx:_oZ6aRi6Ag_4TxVrDdMlZL_ZeY05eq8MelD7AAoryyu8gDgx8rUFQg>
    <xmx:_oZ6aeHMo5CMFzds1JEGWqNithUYp26cjJf5IWPK4IjrwKQ-kP1aE0-D>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5D2AA700065; Wed, 28 Jan 2026 17:00:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Agif6myIRndF
Date: Wed, 28 Jan 2026 23:00:08 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: soc@lists.linux.dev, "Linus Walleij" <linus.walleij@linaro.org>,
 "Jun Nie" <jun.nie@linaro.org>, "Drew Fustini" <fustini@kernel.org>
Message-Id: <b94d1ea2-8092-4692-a5ec-02d83ae1c1a2@app.fastmail.com>
In-Reply-To: <20260128203455.38569-1-stefandoesinger@gmail.com>
References: <20260128203455.38569-1-stefandoesinger@gmail.com>
Subject: Re: [RFC PATCH v2 0/7] Add support for ZTE zx297520v3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_140039_010420_5250898D 
X-CRM114-Status: GOOD (  21.04  )
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

On Wed, Jan 28, 2026, at 21:34, Stefan D=C3=B6singer wrote:

> 4) The CPU is a Cortex A53 running in arm32 mode (in the shipped firmw=
are=20
> too). It doesn't appear to have an FPU. Reading FPSID results in an=20
> exception (so vfpmodule.c/vfp_init says VFP is not available). I tried=20
> enabling p10 and p11 in NSACR, but without success. NSACR seems to alw=
ays=20
> read 0 too. Is this really a Cortex A53 without FPU or did I miss=20
> something?

I've never seen a Cortex-A53 without FPU and NEON, but since this
is optional, it was a matter of time before we got one ;-)

I assume that you were in EL3 when you tried to write to NSACR?
From EL2/EL1 it would still appear the same as not-implemented
even if it is there but disabled in EL3.

> 5) Relatedly, are there any advantages to running in arm64 mode? The=20
> devices are relatively memory constrained (64mb), so the larger binary=20
> size from 64 bit pointers is probably a negative, while the larger=20
> register set might be a positive. I doubt switching to arm64 mode is=20
> possible at all, but I'm nevertheless curious.

Support for 64-bit cores is actually quite rudimentary in 32-bit
more, as we are missing a lot of the errata workarounds and ARMv8
specific features in the kernel. If you can figure out how to
use 64-bit kernel mode, that would be ideal. There is a
noticeably higher memory usage even with 32-bit userspace though,
so you'd lose several megabytes of memory as you said, and 64-bit
userspace would be impossible since the aarch64 toolchain only
supports hardfloat.

You would also have to deal with a practical problem in OpenWRT,
which as far as I know does not support building kernel
and userland with different toolchains.

> 6) The old removed zx29 code used "zte," as the vendor for the=20
> compatibles. Sanechips is a subsidiary of ZTE that designed these chip=
s.=20
> Are there any preferences for either "zte," or "sanechips,"?

I would stay with the previously used one

      Arnd

