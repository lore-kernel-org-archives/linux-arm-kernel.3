Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4114AE63C8E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 12:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdSz0Z3Yvv3FK1yVmSaxLS0CRwbiu1gJvhI7SEWm/78=; b=DQIakBFzck/vRb7KhWkCkjaYQE
	ocwYTAfdwEbvCgsoFrfRFDwDOAgKzcJNRI90JmpzKMc6kEW4sJ0gHADaLnahEORCGfB57mcBuFpC7
	LloakD/vCPUYlzwRjykDem15HYpmPtSe29kIygyvoWbJvWi8TQAT4PBCftOhuRk3ES9H3iYXjvYNb
	FUt1hb0FZ87VNxkU3enrUqzaqNtp7OsDaeX4ubh43UbZqqujAH00lclsA7QQR6aHU2DsmojF9Xq3Z
	Tq89TXouYjOm+DKI5/To5CsQb7fbgsOzroOR9MGIqCW4w9FAKZuB5+UNpTeRTuAk5gK9COSCAK4Lm
	CvR5O6Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjymg-0000000B99E-1JBf;
	Sun, 25 Jan 2026 12:00:02 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjymd-0000000B98I-2cYt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 12:00:00 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 284971D000CB;
	Sun, 25 Jan 2026 06:59:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 25 Jan 2026 06:59:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1769342398; x=1769428798; bh=xdSz0Z3Yvv
	3FK1yVmSaxLS0CRwbiu1gJvhI7SEWm/78=; b=bFTYzXWZhPfhALhFpi3e700yHY
	G0dyfiVXxTKY5dkhjIDq+QiPVFwCc5uDU0JpgPyqrlJKF78bQX6KXD2ypoVRealw
	AS9YUC8fus1ThEjwoHSzOXLhGPnj+/V5jjuZILHPyIYC7w/rolyXucHn3PqEBSep
	ogpOcLm9UwBErQVjcYRojrRvBrIf5F5HGB6bsfU2lOkfGaw2SQOx89phkaGpzN0m
	b7XcS/AeH/gOWq91meFWiBKVXqfWfhEuIY8FdiktfEyodjunLXGG6eg5QFkbaDBm
	pYkUdNhszAVWOU+m6gjaKsIJxYm8HmfscCyzK3MYTKMEQ+iaeSG6Wk5fyAUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1769342398; x=1769428798; bh=xdSz0Z3Yvv3FK1yVmSaxLS0CRwbiu1gJvhI
	7SEWm/78=; b=u8jk3QBBQXDeLNUwfDlP/qRsB+VeP9/0WefKgxCC46/k01SVs/N
	U+3nNcuck9Elz7eZqay+E0YlxcFFSv9QuPljdXZ3r6vcQR852CubBYdNkmdXUqYz
	QKdSbtXzIakC6XXolGquY0+p+SrqHdovgXagcRmBdiiaMCjvpBz1M70nUhIz8dHm
	Js3YBl0Vq+lnvQhptsCt4E+o7tz06g09FGnB1zsBvAq7TskPluVD3EIArkbACpn0
	WXPC49x8HrLqs14IM06eawqhmisfJixS6g061WNEyMUqIwt++eaz9apRFCga53g+
	W2H3PU+cn9pr054LIEFXwHmR/dz5T60Nv9Q==
X-ME-Sender: <xms:vQV2aZoO38EFyaI5Z-A8yO2wykUoNHyGfxgmsDlx8554YvWc0WYTRw>
    <xme:vQV2aT2kgbcSM-EY2AkU1Dseh49efMXK1bSngRQDHvkkqHg9y1bM9yAaUtsVl_U0R
    SPPlfs0hUPczQd2S4GQWMOK9Tjhr2_p8hyel7R5bsxqraPX-AKpJCI>
X-ME-Received: <xmr:vQV2aRx-eHNgLqTDzxOV03xS56dAa2aygEL_cr_WnPqsE10qppTEBlQTgo3JqeKy8vi15KNwJGe-69BG21UgODbLazVpu-Gi1Uc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheegjeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtjeenucfhrhhomheplfgrnhhnvgcu
    ifhruhhnrghuuceojhesjhgrnhhnrghurdhnvghtqeenucggtffrrghtthgvrhhnpefgvd
    ffveelgedujeeffeehheekheelheefgfejffeftedugeethfeuudefheefteenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruh
    drnhgvthdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsvhgvnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhgvrghlsehgohhmph
    grrdguvghvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghp
    thhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:vQV2afhf41cSMDJq7gxecTDPY8SKwpkb-tvOu-bS5mjRKpAhdU8EIw>
    <xmx:vQV2aUrw9jMHh9Bm9Dt4XMRFUj4PlkFkx-dvzD2InX2AEv5P6fXhjg>
    <xmx:vQV2aWieI6NizH1BR83pnUDSLHRxsojpyX15fP0ZNRwHZIULPqPObw>
    <xmx:vQV2aWP9Jn7LCgu3D3xdRGsrIJykH4Z26QCthcc7Vhv6gCpBDfaD9w>
    <xmx:vgV2aR3lbRR4wtI5UW3JIi-qroT1PNI_KGPmdouTHm-eHJULVd_0ERFv>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 25 Jan 2026 06:59:57 -0500 (EST)
Date: Sun, 25 Jan 2026 12:59:56 +0100
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] irqchip/apple-aic: Add support for "apple,t8122-aic3"
Message-ID: <20260125115956.GB1667597@robin.jannau.net>
References: <20260125-irq-apple-aic3-v1-0-a2afe66a6ab9@jannau.net>
 <20260125-irq-apple-aic3-v1-2-a2afe66a6ab9@jannau.net>
 <5d4ef8fd-55c1-42c3-a18d-a262997ec302@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5d4ef8fd-55c1-42c3-a18d-a262997ec302@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_035959_705998_0583BDD9 
X-CRM114-Status: GOOD (  21.80  )
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

On Sun, Jan 25, 2026 at 12:42:38PM +0100, Sven Peter wrote:
> On 25.01.26 12:08, Janne Grunau wrote:
> > Introduce support for the new AICv3 hardware block in t8122 and t603x
> > SoCs. AICv3 is similar to AICv2 but has an increased IRQ config offset.
> > These MMIO offsets are coded as properties of the "aic,3" node in
> > Apple's device tree. The actual offsets are the same for all SoCs
> > starting from M3 through at least M5. So do not bother to follow suit
> > but use AICv3 specific defines in the driver.
> > The compatible string is SoC specific so future SoCs with AICv3 and
> > different offsets would just use their own compatible string as base and
> > add their new offsets.
> > 
> > Signed-off-by: Janne Grunau <j@jannau.net>
> > ---
> >   drivers/irqchip/irq-apple-aic.c | 27 +++++++++++++++++++++++++--
> >   1 file changed, 25 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/irqchip/irq-apple-aic.c b/drivers/irqchip/irq-apple-aic.c
> > index 3c70364e7cddd6ed6285595f136146ab04b897b2..f4efc325bebad1ae6119aa4eab47819a267da207 100644
> > --- a/drivers/irqchip/irq-apple-aic.c
> > +++ b/drivers/irqchip/irq-apple-aic.c
> > @@ -54,6 +54,7 @@
> >   #include <linux/irqdomain.h>
> >   #include <linux/jump_label.h>
> >   #include <linux/limits.h>
> > +#include <linux/of.h>
> 
> Did we miss this include previously or why is it added now?

It's a leftover from my initial (unsend) version which read MMIO offsets
from node properties.

It was strictly speaking missing though as the driver uses multiple
functions from it. On the other hand it is probably safe to assume that
of_address.h will include it implicity. I can remove this line from the
as it is confusing adding it without apparent reason.

Janne

