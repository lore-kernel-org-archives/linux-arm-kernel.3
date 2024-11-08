Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9504FD5C0C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 12:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kq963xpGzs8PuttsZgEZMCnVIjDE8HFsbsdeCvCZRvU=; b=dMFRO60fjSWIgcSH8VGxHBmSqF
	zUna0vF8Xup1Br7732XDXfPY3eq1ytJmjx0PNfMwdA6SHQaQeIXQ6aB/ACbIw6XAMZSK5+sDYh7QE
	oZ5AAnwsYiomxwlkJHVrdVWZ6ParSlu/DBfQi18lAF9OiBmuBBvy+BTfEOqYlv37JeOpROEnihDS6
	upXzVAqabIt3jHZJljx9PdsJnzqewXpMjlWSuD1mYx8tv4fdaejVdt8MvjXSlEteYFpu/qFIaMni0
	V7nlCEq7arBChRHgNtxgycILGevie9sI1WH2MLYJE0KyEqiO8i+wIFGSrzSM0TY7vC0rKxX3bFZ0i
	H3dfQrKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NqS-0000000ATAo-2fG1;
	Fri, 08 Nov 2024 12:12:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9NYz-0000000AQEf-3EUg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 11:54:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94034339;
	Fri,  8 Nov 2024 03:54:32 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 678283F528;
	Fri,  8 Nov 2024 03:54:00 -0800 (PST)
Date: Fri, 8 Nov 2024 11:53:57 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: John Watts <contact@jookia.org>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
Message-ID: <20241108115357.691b77b0@donnerap.manchester.arm.com>
In-Reply-To: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
References: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_035405_889668_794EE499 
X-CRM114-Status: GOOD (  23.76  )
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

On Fri, 08 Nov 2024 12:40:16 +1100
John Watts <contact@jookia.org> wrote:

Hi John,

thanks for taking care and sending a patch!

> On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
> single output, even if the outputs are disabled. As a workaround assign
> DE1 to TVE0 by default.

Can you say *why* this patch is needed? Is there something broken that
needs fixing? Where does this show and why wasn't this a problem before?

> A full fix for this would include logic that makes sure both DEs never
> share the same output.

To be honest, given the isolation on this patch, I'd rather wait for this
full fledged solution, especially if there is no pressing need (see above).

> Signed-off-by: John Watts <contact@jookia.org>
> ---
>  drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
> @@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
>  	 * At least on H6, some registers have some bits set by default
>  	 * which may cause issues. Clear them here.
>  	 */
> -	writel(0, regs + TCON_TOP_PORT_SEL_REG);
> +	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);

Sorry, but that looks weird:
First, please explain the 0x20. Is it bit 5? If yes, what does that bit
mean? The commit message suggests you know that?

And second: the comment above clearly states that those two writes just
*clear* some registers, to have some sane base line. So please adjust this
comment, and copy in some of the rationale from the commit message.
Explaining things in the commit message is good (so thanks for that!), but
having at least some terse technical explanations near the code, in a
comment, is better.

Cheers,
Andre

>  	writel(0, regs + TCON_TOP_GATE_SRC_REG);
>  
>  	/*
> 
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
> change-id: 20241108-tcon_fix-f0585ac9bae0
> 
> Best regards,


