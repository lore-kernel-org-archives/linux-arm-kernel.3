Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB7FCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 02:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=haCzACy1VwjEhPVktl6DfR/M1mIaZzLk35CXYf7U7J8=; b=NAfjGNPcPHSG44UK81auEKYsZ/
	QCC/0c4Ik7lmlouktpK4JdSFE8XzzkWpiUhvzlsYXQqFws0LrTnKPW3LwWkPysEDZA+2WoaTCOK9y
	xFosLQShsvIRG08rpU+JDzTh2lZGVqCUT0CsRfAwZhQ5iQkVC8Oc4RgEJMbu2Slam7wmjZcSSjKrM
	AncKeGBvv7Ed9a2/CskRWWT+OVDt4OQiFPsTfnTu8xJIYmjg/Ojcr387b65M2Ewfiq4m2zfJPNoUG
	CGfogrKlfGUSIVyTJnIHBHOjP9uy46nD2kmkHwpu9qAweEunc8CSAv8qitAerkF63Jrv77XNQYhPz
	LBQ2BWwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbip-0000000E8D1-3eW9;
	Wed, 03 Jun 2026 02:52:47 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUbin-0000000E8Cf-3xbx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 02:52:47 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-bebbc325000so429814166b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 19:52:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780455163; cv=none;
        d=google.com; s=arc-20240605;
        b=a3++mXol+8VEP/5TwOltqH1vON7VQUvsE0ixqsA4vX/8YfKS4iMm4BboiRbtILUK+I
         zu9ECdlbMZG8wE3Ji8l9wxo5f7Kz1ezv1ZPhLvk435TFd6khJTdNAReto4xAJqzosmEb
         TTFocrlgdvjb7ciaoCxl7pP8YOQMkA4xXA9qMnftluN6bF7LqEWyMoDM2n8UDSLz/3EO
         V2fKTvupVgw7RMKkiHf+qUXdxK1JzroKh2jMaFqzQZfJnbxkfJWg0XDsi4kvcjofEjjJ
         6vvTybvNHWuV/7ndIVHxDDfC/gQuwAzjZBQ0QTmwEiF4771mjaQ/DNbVisiUC2PkmoWy
         q3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=haCzACy1VwjEhPVktl6DfR/M1mIaZzLk35CXYf7U7J8=;
        fh=u5yfwPJ/RRrO2BOgUbtp2kIROApeRGTEqfSsyQVdAXM=;
        b=QTSvp90GV+S5sA3sdxfnAioE+Q8eXukZ0OjRW1sIlFBnHYGR2pT47aK1GVsKf27+Hk
         B3huKZtZlKU+wgH6H9MuzWCJbuGujIewAiLeCvfXb+QhKNIJzgPK9cr1Jpc3qfEyJgVp
         ivZqmkLmVFE/YvuUBSVwVDENk9mZ08k69j3pLN+4C7PdE0gFHBb/ILV6xE2s/ToC5dO/
         fhOIrNSMUFpoP44hCOisDeXqUNM+QTXfO6AnZMnjwk0+Aa82Xb5TMUuL/xKt9vFwuDVb
         H/lG/fgvUNhUMMComoDYMA44IzGB4YeCeEZU7EvSnpPZdquUPHOxsHeIMpipmMYr62ni
         Vaqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780455163; x=1781059963; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=haCzACy1VwjEhPVktl6DfR/M1mIaZzLk35CXYf7U7J8=;
        b=jtcyTNUWwJrtO6yooQmK5qXHmVJ2cDZDxj6CLSrF/jWWIqHK1rlgEQC5TXGKkJH0Re
         Y1vpKi8zrdf95hETcVJhozz06QWxP/kqAadx0o5oKgtghuIcjLFTCxF/AjQZvVFU0TPK
         2jiPrx0Orb2nh/82XUR0rycxQIVf657sCihA7thVu62rRyaRWrBHNr19OfqYz7LknNdp
         DRJa+hy5ectZU1cE6FqgBrc4Dx/AoJTo5WmJOgoeChgVSeMpA2Ry00hN0WLCnsqbV9Rs
         Rei7S9LMXr2Op5eXyJ5Z7NPAm2nPJhFxMVMtC3F1QN9ulV97NKQFihQkcxudkjSw1Nek
         4BHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780455163; x=1781059963;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=haCzACy1VwjEhPVktl6DfR/M1mIaZzLk35CXYf7U7J8=;
        b=JMYrRvP78ye9nX0GumFD82JsC5L3/pr/zcxqTrXETlSb3pTCN2h1tNJDW/TX4wibWJ
         A3oJq+O4bNT/FIYDfB3Kwa80nfnVZYny+9c+xmHYuCywH7bZJtQQxmRQJFpzpaGGVKKn
         M5mee0ZtbklpX9BYB6I/nhR3Fy81HLq1Xx4WzzveSQgprU3wBbOHDN5W5ywVMH7n3kcS
         9GfCAcyawiMQ3DR3+E1RVWGh0g7z1gP5UixEsPTU7ucuWs2ktMFx38TGapZYCauXhfXN
         DzVshxa1Rnh9Wt3Uata90lqpJQ9yiPO+hld0gXCtqlCaozJjfUDfyBD9Khb+v1ugU9a/
         eIHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9A95TIxVucuZLoqYfPvk4edVR/GdFnNphOfptK4Fn8JvALL3DhuCOwQvJzVGpNlpFHdq1XGFRRNZkOqip2q1mE@lists.infradead.org
X-Gm-Message-State: AOJu0YxgmA613SDc0RHFckj/1IKE34SwISYvtbG/tlQp3JrtxVpop2/D
	x/p9w85tYhNddA/XtuiRVOmn69GR6hdQaosK8i2G25a9f6SJZ9RWK+0rXH9HFbCv3EuBfUcIeaI
	wTpdqSvtPjW3ODACA8NerVowXDIjBU7s=
X-Gm-Gg: Acq92OFe/R9YNPZRQm8/4b8B+iiNQmGXj1o6eKSv1ZUFdT8MGlPu7PJGFO1Kr5nujsc
	/mxwer+wrKBnmuBPNaq1L4NPtWMGJ25xSEbbfRAg6nknCKEut8ZkdeSgu2/G2GVWRnsSUjtYXB/
	tX7GjBnkz9lXTAsD8U+NIFTF+GXAGQXGb/C7Ht0lafqu2dgi3JUGEkKqOjVTL9jYbw7tOdqmLcM
	Lj5Z16dP2Fs2CwMxcNyFWzGf8e2tU3dq7NR5ObI+iP4CH8suyxw4hoSEP1Y4cIiYgskfLcesnhb
	AVm3xtHT1v9Sm+Jn
X-Received: by 2002:a17:906:7952:b0:bee:4ddb:6729 with SMTP id
 a640c23a62f3a-bf0b32b88cdmr45709066b.35.1780455163306; Tue, 02 Jun 2026
 19:52:43 -0700 (PDT)
MIME-Version: 1.0
References: <20260505003252.2886028-1-dbgh9129@gmail.com>
In-Reply-To: <20260505003252.2886028-1-dbgh9129@gmail.com>
From: =?UTF-8?B?7LWc7Jyg7Zi4?= <dbgh9129@gmail.com>
Date: Tue, 2 Jun 2026 22:52:32 -0400
X-Gm-Features: AVHnY4Jgu1-ziAloT_3M6UL_04UsPmj3eqL5tOmM7rr25gB3-A3ycr-DrZ9fp4k
Message-ID: <CACrCO_VG11oDkLODimguZKN2xHHa7ki40RofZ2Z5UxvPkxgOOw@mail.gmail.com>
Subject: Re: [PATCH v1] ARM: Feroceon: Fix OF node and mapping leaks in L2 init
To: Russell King <linux@armlinux.org.uk>, Nishanth Menon <nm@ti.com>
Cc: Lee Jones <lee@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_195246_003828_9B395310 
X-CRM114-Status: GOOD (  22.41  )
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

Just a gentle reminder regarding this patch.

I would appreciate any feedback when you have a chance to review it.

Thanks for your time.

Best regards,
Yuho Choi

On Mon, 4 May 2026 at 20:32, Yuho Choi <dbgh9129@gmail.com> wrote:
>
> of_find_matching_node() returns a referenced device node, and of_iomap()
> creates a temporary mapping. feroceon_of_init() currently leaves both
> resources around after init and also returns from the of_iomap() failure
> path without dropping the node reference.
>
> Unmap the register mapping after the register update and put the node on
> both the failure and success paths.
>
> Fixes: 4b8f7a11c9fb ("ARM: MM: Add DT binding for Feroceon L2 cache")
> Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
> ---
>  arch/arm/mm/cache-feroceon-l2.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mm/cache-feroceon-l2.c b/arch/arm/mm/cache-feroceon-l2.c
> index 2bfefb252ffd..1fe931a09d79 100644
> --- a/arch/arm/mm/cache-feroceon-l2.c
> +++ b/arch/arm/mm/cache-feroceon-l2.c
> @@ -373,16 +373,20 @@ int __init feroceon_of_init(void)
>         node = of_find_matching_node(NULL, feroceon_ids);
>         if (node && of_device_is_compatible(node, "marvell,kirkwood-cache")) {
>                 base = of_iomap(node, 0);
> -               if (!base)
> +               if (!base) {
> +                       of_node_put(node);
>                         return -ENOMEM;
> +               }
>
>                 if (l2_wt_override)
>                         writel(readl(base) | L2_WRITETHROUGH_KIRKWOOD, base);
>                 else
>                         writel(readl(base) & ~L2_WRITETHROUGH_KIRKWOOD, base);
> +               iounmap(base);
>         }
>
>         feroceon_l2_init(l2_wt_override);
> +       of_node_put(node);
>
>         return 0;
>  }
> --
> 2.43.0
>

