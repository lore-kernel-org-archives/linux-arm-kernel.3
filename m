Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9A7C02185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jan 2025 12:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXrGw1rP9QJxcAwDB0fMFoC+lLq/IeQVe+guwr0qz2w=; b=xdTFX3YwJgd5bnR9GSmIY0zE/K
	v+ftg0BF09ynPUaFDyJ/q7Ckjr6hoMWZLIzcthPnsJOY5SWLv3vlvw1ZbovW+oyg4XxvSLKblSyx7
	x05uvCId+1bI4nmPUIPI1oQ0LmQT9vID3kKMpgc5R7lt5Y7BlrKDs20fw9842buI3x9gsuG9pqHOI
	n6uHfJlslhpPKhEdDi7QuS8AwDEBB/q7ZQyIj0CWMsG5X1QlR4h903vBhFGECjzBRnR6kizBhQ6xY
	gn0sG+kmgw7Chgn2ob05r0dDjdtU1zxF5uGkjWEhI67zRcKHitAokFWJ1uGlyCGYrVe/hb4os3lXE
	HgF2tbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7uM-00000002Lcv-06oD;
	Sat, 18 Jan 2025 12:26:34 +0000
Received: from fout-a8-smtp.messagingengine.com ([103.168.172.151])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZ7t4-00000002LVe-2MC9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jan 2025 12:25:16 +0000
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id C76C61380165;
	Sat, 18 Jan 2025 07:25:10 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-07.internal (MEProxy); Sat, 18 Jan 2025 07:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1737203110; x=1737289510; bh=CXrGw1rP9QJxcAwDB0fMFoC+lLq/IeQV
	e+guwr0qz2w=; b=be5FIzuHqe2+OvZvbhhUlMy5HM+aI+Ar2XXE9aopaaiMNCIY
	rHe+g/JG7oAQEPuMoXrRysGtBNs1WOVq3/CqV250nibX8sWZkS9iuAhBdToZ3j9a
	V0wksAo0KRdxa7TlZveU4oCQTLAFAxx2UPOHlmhDh6SYayq8jfOUAhqyTDjN5p2x
	mQQbZeOaoK1XgCRSTW5TeilAvE5tp9s+rME3fCyRkjH3xozC/p006ZarPpsSnZG0
	8wumFthsIAAL5txykXcHzZZ+7FcTMmy6UYSYCkNhknhkcd1T51NcMm7V7EjhYK/s
	eODbuSXnPUChWwW6z7dyYEytuKg9tImSR8uxOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1737203110; x=
	1737289510; bh=CXrGw1rP9QJxcAwDB0fMFoC+lLq/IeQVe+guwr0qz2w=; b=O
	11cyjEZ9/geHrQd7GBSkaTOBHDs0Fh2sI/ecoy/RDOk/EzNhpkAJEqm6vgEyZhAP
	y1/N6uLeu71kUS7+ignUQFtFGiyUI+NcQd+WE4wc2WNLIFut6XdLtlqm0V5poT2A
	FK3XrG9wFpBIvNRd8ZKyL5yyajp14KeRQMa4zv2gfHt+xXL6Kbc426qmngUsqyNh
	yxHNY2y+dVRlO2/2tMaiXFgVoDrWe8Kfx7nlc3XqrZ0Y8imiTjK2aa7RyIimPzXA
	vyGnjN0sOGvAraNv6Mu8wDXP0kYM/qGfd5jToWHkBoATjZOkGwtd5OmI6CJIAjmh
	2AtAZI3/Nx3acVPwN++rQ==
X-ME-Sender: <xms:pJ2LZ8LKzBadFI-kPBSebold8OjiFXe6kfRYanY2KmV_6s6hSZfi9Q>
    <xme:pJ2LZ8K8KiLfyr9eD2GsbL7MbpicClx4M1NDuxR8TBv33xGdXLSNmyDG_U117oUEs
    TGaEthTfW14zIrO6fo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeihedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveekueef
    ffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggprhgt
    phhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtohifihhntghhvg
    hnmhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtoheplh
    hinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtoheprghsrghhiheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtth
    hopehmrghrtggrnhesmhgrrhgtrghnrdhsthdprhgtphhtthhopegrlhihshhsrgesrhho
    shgvnhiifigvihhgrdhiohdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:pJ2LZ8sCASiP6L5kEJ1S_wC5IMGy_3vDR2VoDaFcFD0RA4U3rcVjjA>
    <xmx:pJ2LZ5b-99KkTN6cMcgS57bt-Tlov8DAUHHbn1HeAuRTi5kJ2EeP6w>
    <xmx:pJ2LZzbu3aRrWiPM9zgJLCU1waI8nSJdE-vbcI0v6z-5Cnj6SuAqyA>
    <xmx:pJ2LZ1CNMYVHb7iYfQjzDEnkaa62g8MseZuLs1DhUrmjqaqIVk0C-Q>
    <xmx:pp2LZxM08sXzLKlQsV864WOFqVC-FVyLtUdwCKXzLAK8fDNOTUMIotbS>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6EBE0BA006F; Sat, 18 Jan 2025 07:25:08 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 18 Jan 2025 13:24:47 +0100
From: "Sven Peter" <sven@svenpeter.dev>
To: "Nick Chan" <towinchenmi@gmail.com>, "Hector Martin" <marcan@marcan.st>,
 "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Marc Zyngier" <maz@kernel.org>,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Message-Id: <aef452c6-1e12-4510-8fb9-1dc597cf69bf@app.fastmail.com>
In-Reply-To: <20250117170227.45243-1-towinchenmi@gmail.com>
References: <20250117170227.45243-1-towinchenmi@gmail.com>
Subject: Re: [PATCH] irqchip/apple-aic: Only handle PMC interrupt as FIQ when
 configured to fire FIQ
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250118_042515_271901_85FBA7EA 
X-CRM114-Status: GOOD (  16.60  )
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

Hi,


On Fri, Jan 17, 2025, at 18:02, Nick Chan wrote:
> The CPU PMU in Apple SoCs can be configured to fire its interrupt in one
> of several ways, and since Apple A11 one of the method is FIQ. Only handle
> the PMC interrupt as a FIQ when the CPU PMU has been configured to fire
> FIQs.
>
> Cc: stable@vger.kernel.org
> Fixes: c7708816c944 ("irqchip/apple-aic: Wire PMU interrupts")
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  drivers/irqchip/irq-apple-aic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/irqchip/irq-apple-aic.c 
> b/drivers/irqchip/irq-apple-aic.c
> index da5250f0155c..c3d435103d6d 100644
> --- a/drivers/irqchip/irq-apple-aic.c
> +++ b/drivers/irqchip/irq-apple-aic.c
> @@ -577,7 +577,8 @@ static void __exception_irq_entry 
> aic_handle_fiq(struct pt_regs *regs)
>  						  AIC_FIQ_HWIRQ(AIC_TMR_EL02_VIRT));
>  	}
> 
> -	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) & PMCR0_IACT) {
> +	if (read_sysreg_s(SYS_IMP_APL_PMCR0_EL1) &
> +	    (FIELD_PREP(PMCR0_IMODE, PMCR0_IMODE_FIQ) | PMCR0_IACT)) {

That's a somewhat unusual way to use FIELD_PREP and I'm not sure the
expression even does what you want. It's true when only PMCR0_IACT is set and
your commit description mentions that you only when to handle these when
FIQ have been configured. Am I missing something here?


Best,


Sven

