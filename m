Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15284D116E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 01:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=; b=RqTJGr9OjhGju4UQp/rk8I6HpX
	TsE8L0E3KQ/Kk+3T6eP7+9SOOHOT7kHFjbI/Y/XDUumdkybb12XiL0yqsNRx6FBO779S0mtFo/cKC
	vYuui9d6jsEsrEp8GR4UaxB5cTKWz5tAOu1XuY5pb+GFV8uRaVxiBW6KNCbZV7GISCIylwZPRKuoz
	IHWm4Znw3/5iBhSO2AHazT2+9aNMp5BFWenoWydF9WVjlzO3v8O1PwEVr2k2LgpmmLSTIcBDVIoqx
	xKMMBIqDZVE4eBFDIJlmdrhIZnCy4NwYcJ2B91xq0RrDZ0ktZxxqjJbrEA4VMpWafdSscltzaKLNX
	/FpBwkLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQeM-0000000FqFI-3aty;
	Thu, 27 Nov 2025 01:18:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQeJ-0000000FqEb-3nAb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 01:18:21 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so1820545e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 17:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764206298; x=1764811098; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=dTG+6dSIakxsTfawMmWH8HCuOAd/4dAZpsdnvoNlLRohzdU56OiO1U2s9TggIUWAaU
         K+42NYcNk8xROONbc8ValFxn/B2pQXElHL0ekTR8WYn+2O+LGnaENa6lvajbBoWEKdh+
         nr43wIGV9OZBrCUMGAJA4hlwQpUjbMJ0tEfUz+DNXNuEOD+D0QJBmQ6smc2s3txHRru9
         eBvWdHhEkcBYm+FqWln+Mydp89XLVNAlHb4lCv5f04aCMH5dr2HKE3egCnMobqQofGHi
         v8osS/KnNTvc0KC26ZZEP5gd0MKCLpVksCyjz/Ex3iU0WDx8f0ste/D2Jr0gJAsOsel/
         toWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764206298; x=1764811098;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HKgOFooMWN6cAHuCEA8Jqj3i0BZ6TtQryqGYElbczIg=;
        b=COytMPhWtT21S2L/kbYBTyKuSIFjKPAYRFGyln4o2B229mQGMCStwrvBpeYQJn0oMY
         RXFa+S0Ds7w2HK6+0SoVe2RQr6yQ10cXsOzHMhj75Mu1aKvc37oejATnkc0rwV2oQkyC
         Z8EI0w4Z9JFQhdKzH5ZJwpmT4yAu64AJCN74moNJFGR5und0k1rqWWKxkEs6Zd83aMxO
         CoG38ETNMcyQhiTKtAmjWayfpn07C482eTlzsp2IBZSN5LV6Yv9p5Ku3HNAN8foXRw+W
         r8KyCRpWHialrOtOumO5r1PfhuwRnSAvw0IaD4mJgEpVqNoTTb8X3d32uQElxJ6jlIV9
         DFDg==
X-Forwarded-Encrypted: i=1; AJvYcCWanr4/9galsrhIQ7l6lW4h11N9J8yUT0Qgqnhpy2l8noBul8N7D8ALv+wb/qoT5jHtMRt3Ots0n1GH9L0ARQih@lists.infradead.org
X-Gm-Message-State: AOJu0YxYjkNWuURCJkkRQvV9mC2KFlk3KXUyBT0+d1JxC4iNi6OYN/B/
	qQ0a7+cDFurL13kyd9GzPYiXkvzkM7VCWqMy9ttQHHIoqjsV+NY9FGLLKmpPXJ35leg=
X-Gm-Gg: ASbGnctf8ZPoC20NtV7Bx6nTru71zU5QjYtngotsXWOHAl/aFB0k4K1WBzrMJQyoA3X
	FueT0zMu9b8eoDlCUsAg+jdd2XxdmbFLmeWk5hI2kTPA9n0HeEZduNfQitJN+DtD9z4/V7m68Tt
	4BJbSIuATgz/oQicgv1Pqq1aXtGZWIPySf/GtbHiaqkIXmZBpfHRueTvMUbHjWl+9G1ci/A3Fs5
	ptlcZBSeBOpJQVe6VeamtuFgCeTWauR5QyCEKK+bbbAo1ncZY2aC0yVxb6fHGk3VKFbAc7n0rj+
	eFy4h10qvAZ8DoCfHT7wj8zrgbj2iO/HSkCrP3spHzVpsmeBzqzZfn9VtXIJVd9CQqG2P+W17pZ
	6EgfYmyJQznaM+YJjh8FBzk07pndPyH7KRazUh8xc6vEEzCSpfuAIWuEXdCCmUVnZlUtaVqtBhj
	YyfX3FVcW51TQpt1F3myV8rs88dtbfqAmP
X-Google-Smtp-Source: AGHT+IHKRsRzIcI/YdpyjCx/e6RWPSP3syqAgwQHcfAEZoMWkqQomccWOuW4YSvp5SYEElJFnjRGrw==
X-Received: by 2002:a05:600c:19ce:b0:477:79c7:8994 with SMTP id 5b1f17b1804b1-47904b25e63mr87066215e9.30.1764206297510;
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b1075ddsm207261215ad.3.2025.11.26.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 17:18:17 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:18:09 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
	javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 3/9] sysfb: Add struct sysfb_display_info
Message-ID: <aSem0a7jTfCNTdX-@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-4-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_171819_964217_03D38A9C 
X-CRM114-Status: GOOD (  17.78  )
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


Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Add struct sysfb_display_info to wrap display-related state. For now
> it contains only the screen's video mode. Later EDID will be added as
> well.
> 
> This struct will be helpful for passing display state to sysfb drivers
> or from the EFI stub library.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  include/linux/sysfb.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
> index 8527a50a5290..8b37247528bf 100644
> --- a/include/linux/sysfb.h
> +++ b/include/linux/sysfb.h
> @@ -8,6 +8,7 @@
>   */
>  
>  #include <linux/err.h>
> +#include <linux/screen_info.h>
>  #include <linux/types.h>
>  
>  #include <linux/platform_data/simplefb.h>
> @@ -60,6 +61,10 @@ struct efifb_dmi_info {
>  	int flags;
>  };
>  
> +struct sysfb_display_info {
> +	struct screen_info screen;
> +};
> +
>  #ifdef CONFIG_SYSFB
>  
>  void sysfb_disable(struct device *dev);
> -- 
> 2.51.1
> 

