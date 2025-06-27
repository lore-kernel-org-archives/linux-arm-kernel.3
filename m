Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD1BC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 05:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a2HGv8LGZ8DzKrZFUO2v+eei1l2wUynW3XD4JObL1Tw=; b=SlV2YhMPAlpw7ZAaOMW35OVioD
	73lDrs9XwS6lG7eUVyi7N8pVtVD+O7zI/+OY7vUTwmDTtDLmkmJZKKutpn9HmgNzm6Pb9tuTJNeFn
	+wOmpmiIHwYo+2GElqNbNxAy6RXIYUXV3WuJxrx5SdJyqxOnVO25Sp2EPZ187b10fiV9oXbGRxrAj
	Z2mFCxx8BxEllRavXPjZnytuQBE5rcLSzatlR3lQPYyu+98enelZ95kfgQapGcoU+xNJWonyekwEO
	wwuobTMsHS6EWNQi25hqNJvJuO6fNK5qiowqcCUcdXCLdaeiV0NKH4lXg9wlC09bMn1GuPdimD09f
	visExAxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1H3-0000000DbKL-1JUx;
	Fri, 27 Jun 2025 05:05:17 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV18m-0000000DaPw-0D1A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 04:56:45 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-4e7ef5d6bffso461586137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Jun 2025 21:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751000203; x=1751605003; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a2HGv8LGZ8DzKrZFUO2v+eei1l2wUynW3XD4JObL1Tw=;
        b=jNaJffBybNSh3AqqevNSvp1HJwivlRQY+/SI1lC9qw2PBE703cdSGMp8Ivd4jTUL4J
         nU+p3Ka4eMYK0u5wtqSWbgGtcnIZSOU2oM4JUo+Bn9+EUWLVhqUKFdvEwKLQFolHjuWs
         aty6H3G2J3HPOuB6BkB2PjzBgwXZUzRZR7cwbB+rBiMsWVQ4j5y8+NmLKG0LaL8aiQP7
         RWKFLH2afsAG/5aDK1shfwKbQjUDr9m2FXzxP+JyiP0KL6Sg4I9xxby/PhBjyKzqpyVt
         Xm2xrCLighTXsMmbNn9NhI2kDN5kp3pAbiQp73wN8VvuLDkNnMdG0r7ZjmiIdMuc+nk1
         E6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751000203; x=1751605003;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a2HGv8LGZ8DzKrZFUO2v+eei1l2wUynW3XD4JObL1Tw=;
        b=GyeMolRSSbb2k8J8m6r6QeqKHAYe6S48Z2vcysnvTjUD2XArKV8DGPZDTn1x605bHG
         SG8SCtkQseKS6T6wcOaTMvQk/07GgwCVsK5Jj5dltoI1aOIoeErCFI8xw7gVcfVDL8GV
         dt+JmbIDyNCPYIgzchg1WsJglqmZ0aF38npY77KuEUPjfrxWaZD9AVyn2mrSbuprE3ue
         VBY84uRi2A09tyQQQvDKB74MvO0EiMK+b0TS795I4V8taecMW8fym5H5hNTA/4SqCUPp
         mErJ8ve34VWGV6MYykW+Zat44jNLNiK9ekA7GxYgWpBShBTkEBDI8BNWqfFNESSv1jiF
         tZHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBH1ceVeuKE11TKy05jNM5PEROxOxJRB7prYzrgw4+WAvquCvLk+cMkHihB2GLwX5RhffN/I/p5+qguBYxQLOG@lists.infradead.org
X-Gm-Message-State: AOJu0YwuMqB2zMnnzgPsrfEAmaQqxTeQWxu4ovMdIFAylTFiPsTu1RUw
	6UHMeNGjTNZ6W+su7ti220lTt6cRoV98koYEZQXoju+1ho1naQvjxMleUbbYDsYmJabSiSQJLmT
	8PINPfDPwuo2VUcXn/+/mbTmn3EpObz4zFGTj9QvZyA==
X-Gm-Gg: ASbGncufzRKM+nX7FFohhtiC4Y8CwMdRDMiMjvxSmmX8Ef2TKhpw0CTuVo6sPaVR3Uy
	9dE+xJ+dpXw7PhfiGh+fGJKx408buDMsJUNlGVCkGF0LZWBgyYEzOKf05E5sBkmMejK0s4oVt6z
	VFC8RikvAY7MhsHr78JwYnad3r3I2nLYRxzhxyQ5jRVQ==
X-Google-Smtp-Source: AGHT+IE+07qHBqPDCXthKdPHB/7LUX6RLsYmY1o5ORrW1h7tii2FCLcpiV2074k1N7ZSn36YN5VNYrTVJdSCyPltG5g=
X-Received: by 2002:a05:6102:442b:b0:4e7:b728:e34b with SMTP id
 ada2fe7eead31-4ee4f57ed09mr1865136137.3.1751000202837; Thu, 26 Jun 2025
 21:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org> <20250627-exynosdrm-decon-v3-3-5b456f88cfea@disroot.org>
In-Reply-To: <20250627-exynosdrm-decon-v3-3-5b456f88cfea@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Fri, 27 Jun 2025 13:56:06 +0900
X-Gm-Features: Ac12FXyCRtmqlVxLH-ZQ8PS-fwNE9eVFG2Sf48qY_m8XFevvCiJLCVczBK1_h0o
Message-ID: <CAAQKjZNbEAiDC_2dUMKZHyPO4nS9TM7TrdjyNx0uLcjvh=PyZw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] drm/exynos: exynos7_drm_decon: add vblank check in
 IRQ handling
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_215644_088075_E31C70CE 
X-CRM114-Status: GOOD (  23.85  )
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

2025=EB=85=84 6=EC=9B=94 27=EC=9D=BC (=EA=B8=88) =EC=98=A4=EC=A0=84 4:21, K=
austabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> If there's support for another console device (such as a TTY serial),
> the kernel occasionally panics during boot. The panic message and a
> relevant snippet of the call stack is as follows:
>
>   Unable to handle kernel NULL pointer dereference at virtual address 000=
000000000000
>   Call trace:
>     drm_crtc_handle_vblank+0x10/0x30 (P)
>     decon_irq_handler+0x88/0xb4
>     [...]
>

It seems that if the display is already enabled by the bootloader
during the boot process, a vblank interrupt may be triggered before
the initialization of drm_dev is complete. This could be the root
cause of the issue.

Applied.

Thanks,
Inki Dae

> Otherwise, the panics don't happen. This indicates that it's some sort
> of race condition.
>
> Add a check to validate if the drm device can handle vblanks before
> calling drm_crtc_handle_vblank() to avoid this.
>
> Cc: stable@vger.kernel.org
> Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm=
/exynos/exynos7_drm_decon.c
> index 43bcbe2e2917df43d7c2d27a9771e892628dd682..c0c0f23169c993ac315fc8d7b=
cbd09ea6ec9966a 100644
> --- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> +++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
> @@ -636,6 +636,10 @@ static irqreturn_t decon_irq_handler(int irq, void *=
dev_id)
>         if (!ctx->drm_dev)
>                 goto out;
>
> +       /* check if crtc and vblank have been initialized properly */
> +       if (!drm_dev_has_vblank(ctx->drm_dev))
> +               goto out;
> +
>         if (!ctx->i80_if) {
>                 drm_crtc_handle_vblank(&ctx->crtc->base);
>
>
> --
> 2.49.0
>
>

