Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC1CBCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 04:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=; b=VMLcFyyz/bT5pL0uIccGTS9JcW
	pb1CIqE5PxytrkP7khcNldfz+ugea3GOWf5ln9fdp5kwwL627CNyTQILY6FPgtrwCe0O//PWxlzy5
	m/YK8iazOSIFX393XZLc/K8gxOz2gynO6JAv8lKQfyXVzOBeDvQaQc/eI+ooNWFdSfKUAalkjw400
	xSE6dnkTG27oegWBrLNuOmTuI4tvCch0DvczZO3/M7eK8JvHa+mD9XZ8F0frbKWLzgKaR8Z+S+JqI
	zeuMpLulPTSoVIjTdZiZCeN9+u25ndwWk0V08GLGAYuN5oiW2pLj7Q0g4+PvR3RODov76J62QSPW1
	umfdKe8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoa9J-0000000CKfp-3uEb;
	Wed, 20 Aug 2025 04:10:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoa6g-0000000CKWr-18PP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 04:07:27 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2445826fd9dso71456475ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 21:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755662845; x=1756267645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=;
        b=N7g2ofJ17FZ1An9DZHB5hKfypfudl08iI3agEndtApXYefcmNvb+u6kkhldEaFNHP6
         VxjVec9YQmpEif8kPyyGGG7K0tpZ5edCCVsBMPiB0XkiMf3bpILeFsPX+/FylWVm5EzR
         ABM07XtKtZXhDo3g3oxB4FQFOoHqAdSpVHmOTEpSpaeOAfwZgedikqhHNF1MPBm6bUsJ
         oQODGqj0sgPfZ4GBdiiXUA7oMyr8ooV9rn57LNkzm8Uq8g2xlhJiVMT4yrPEiiMHi9DK
         0ibcQUm8YQofgzYMkqJprMB8efAe/Uu6KGFcGEaHnuJH1S6fqLYEeCYVMZO/UIyQeMhZ
         eiqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755662845; x=1756267645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=61TbShyZGmEFoOQMK1FLzfzRsfZunqsPJaTJZw2MfRg=;
        b=ZDIQZoyA0L7N354tmpxQRzx+SOSajtT11/vsA9YsRYbzezBxt2xeJ8KKj6ZFp3TeFi
         kTkYKtqvTr+o2RJea51f07pjfXPq57VhTOknkojhjLicUDNCSZ/xlitcVrtdkJJ9hc+B
         j7JuNWn0QSkQWAmR1H+j6yGklkC6kH1jq9v5pk1amPp68Avq5aLYco6fv88CzT+NILTL
         WylyLPqkH5IhT9CYX2T3D38C2eLTjsl1W/D7yKvRR2BxmzAAIp6SOCubGaY9+qniNULS
         sKMuAHc8QWMPeBa0625ETI5t3VJj3B213r0k09k71FP/6w5UHRjM+gccpPAK7xnAPGak
         h60Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4Zgs2EfBak+HlIdsc6alnTkKnhiFQrhZOqB5uvm4urPE+rBUf123osqkG5JxDO00rcR6e5CfdzB5bDz80sQ1W@lists.infradead.org
X-Gm-Message-State: AOJu0YxAHNmx8EA7oJa+R29Wpex+/jkKPBx1ko2JUGBWGP0zTF5xUwmg
	zMNmucsQ7ekYTIqcQKcS/FAdclkJXTuYKAeydaRinF37znD9XX4o69A0ZcqRWB6drKA=
X-Gm-Gg: ASbGnctNnp6ilNFlB9Pd7AFP32pH+kqxnFHkFlkR4qcwvr/ilov99GlIydYZtYjO8h5
	vpxtwSTbWShD+a19lPNU82uQ2ttEeGvqN4OTBPEb4BUN2obwNWQF4MgYmDElQU/wLV1EjUYu7GJ
	zx5G6OULcGmz+0MRyFO69gz9Dk8RI99RRkIjoREUD7BISHjC2gTYGNnZEbFq6Lj2fioE0fAUU0n
	DCvZGPa4Aplygo903FAzZatSxEdkyDpR4TPXqRqpiyysfIWrVRFm4ka1kzAvZTA+hHlnh3p25xk
	Hc6ZqlSZpeiqZteTbbTZGqCdgBaJxzXxBvk5bnfrLtyo1jI4ztMotnqEqzmM2mU2khAjmIEiGyj
	ZM/LZRRFwKTa6hcm+ucHxEnbG
X-Google-Smtp-Source: AGHT+IEF8aL/OwClRkLK03kIO5ZYX/8TW6kXe9vwkD7+3xAbrkceAzbVpiAbQQ6RgDwBHRsjj6oH3Q==
X-Received: by 2002:a17:903:1ce:b0:242:29e1:38f0 with SMTP id d9443c01a7336-245ef14b770mr19823785ad.24.1755662845050;
        Tue, 19 Aug 2025 21:07:25 -0700 (PDT)
Received: from localhost ([122.172.87.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4f3bfesm12339785ad.119.2025.08.19.21.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 21:07:24 -0700 (PDT)
Date: Wed, 20 Aug 2025 09:37:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek-hw: don't use error path on NULL fdvfs
Message-ID: <20250820040722.fdf2544cdz6k6dcq@vireshk-i7>
References: <20250819-mt8196-cpufreq-fix-v1-1-adb60a3082dc@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819-mt8196-cpufreq-fix-v1-1-adb60a3082dc@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_210726_320092_B3F34D90 
X-CRM114-Status: GOOD (  16.26  )
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

On 19-08-25, 13:21, Nicolas Frattaroli wrote:
> The IS_ERR_OR_NULL check for priv->fdvfs is inappropriate, and should be
> an IS_ERR check instead, as a NULL value here would propagate it to
> PTR_ERR.
> 
> In practice, there is no problem here, as devm_of_iomap cannot return
> NULL in any circumstance. However, it causes a Smatch static checker
> warning.
> 
> Fix the warning by changing the check from IS_ERR_OR_NULL to IS_ERR.
> 
> Fixes: 32e0d669f3ac ("cpufreq: mediatek-hw: Add support for MT8196")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-pm/aKQubSEXH1TXQpnR@stanley.mountain/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied. Thanks.

-- 
viresh

