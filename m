Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFBCCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMyV1g4zn80PbhfAc9iWBO3qy/khW3/zllYxtdudBRY=; b=xOH3Xw/wP0j9Yzt/S9fYuTqivI
	Wql2atyK8dyx+Sg+G5NVUesGS93UNyBaJlG1AeK+g5rB6bPJBSxiHKv8yw5rhucZvsUSsjpLbM0BG
	KvI5yS0Bt1FeZmiYAvDDVKTkp2wlRJ0aGOFJJbXwFKNhXE+kiUkhHNrA+k1fkqdjB0KPZicXaymM1
	edqSnMeI8Jpcbyhcqcv6+Pkmi6DBx2O/qwuxk8kZQrFfW3EhOaLo3f9w7LCSYujpdf3PikBmRDb3u
	JxiybPufoSZ5ftTKX2FjUIKzT/CILP5wpdPER94uwnklf4Aa1sVloOLJy+WSrDs1gMFNsfDs1Js8a
	Rpl3eTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsw-00000000khg-2SeV;
	Thu, 21 Aug 2025 22:35:54 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7KX-0000000HPlP-0C19
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 15:35:58 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b476c67c5easo806439a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 08:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755790556; x=1756395356; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMyV1g4zn80PbhfAc9iWBO3qy/khW3/zllYxtdudBRY=;
        b=k9gamD1Ns3QDxyOh86l8W+gQGc/uTDgIRwc1D7t+SXcSdCsDpuTT3757k+iQyCxEeS
         16UqixBGFS3910xy7oehBnRswAMQ99oEkeLLurjeLEOAwRjDjtZVmx8PSXq4bV3ZOdEt
         2cJWLsJGRRdwaIVx58akdxm2IfLmgR5xUrBbtfS8QAYXWh6qk/o1x10C5TQNACd572/7
         lEbdupE+gCsCxNya2Lj4/lekH0DNQpsTFfu4nHu8JyB1fMlczed0cp5UV11LVXdtkXaQ
         /fZ7vr34L6+0BIv12UOO0IbGrJIUkMDfi8ERyWRv4Wi1LK2D1JHpflGgqdKAjMZHbmgk
         IFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755790556; x=1756395356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMyV1g4zn80PbhfAc9iWBO3qy/khW3/zllYxtdudBRY=;
        b=idEPb3Od7V7GfYCSfejlJAIEGM2mTFdCoZL6yMLZ/OFlzfK+9D/JhnbOGNNyfQVX5V
         QPSI0iKlHYf0DZp64JutUZmnCfJLTmYa5bXSXT7AAQCrdamNuz55a+stot0+3grKkNYI
         O1OwTeZ5NLZyrGGlM/NtGs4plUEcbQtd0BY3kVmPoaQJEAiUIR4IN3XvbTCC6YxkIWD8
         fOD2oIpGe3vTSes/MlC4jMf5ci5ezSOWsOXjyMywb1/3uhXvgrgR93bHGGw3UiUijDfF
         yNpoJr0rqtDd1xQ7NqA3NmKcbu0AMVCjUmXiVrSLgeQdznjjAh25WwHowtYBS5OIsXSR
         FwgA==
X-Forwarded-Encrypted: i=1; AJvYcCWyg5zYFdSJsi9cBB8RJdYBDrCOGzLbYEucjJDGwtusZvirJtJAKLw8XWf8vKZlhFTvZscOxkZBAVxfFQ8LMbFG@lists.infradead.org
X-Gm-Message-State: AOJu0YzAjgpPWDSYCTpdl4gQ6UJEhqdR1OAi5R2Zpr2ZR7o49xlJ61QE
	PZLWhF7z+SYgRxBHKVoNSTzGNNZ/h5YA/kIAn3lDG29BgZ/2t57FVZQiEqhBLw==
X-Gm-Gg: ASbGncvjFxvETqkMnaMqCfeT/XMVUZ3J7VwjuaagJZN9SDyveYxcNBvtETl6xOsr2LL
	2Lf+3DJtMmwPvXRFnvuzFu/Zm6LzV1NohmOEMIQqlfs38RxX3R0gixmJU6yF09DA6pXdFRJL2OH
	3jhbKf2pJeqEsWn/3ocXR3mA6vANTM/E9UkqXBuSeZid0WN635ddoWiSC66iAyKZxO5z6krv7Nc
	DJ1ZNaWC+jb+2NOTZd3INtDUWQOYMQAbywnsw4nvjh2F6Traixnr3EdPuNb5OYjRDiAAo+hCP/a
	zA9XbG9YsEZFIH4zWi0IJyBINL2lcoK2oqeXsREW8cCZL2gJjCofVC+/7wAEK0rt2YRnN60ED/V
	wYWWrRgMQqDvJcfoH2SP2lvKF5tQnSn8qzrSm3AV53vmV0A==
X-Google-Smtp-Source: AGHT+IGrMWesMUWnFglIGSBoWLu6F3+7GZd8RAE67E8bXFw1pRYGmeUsNSijIB145sp3eYLYZFRBaQ==
X-Received: by 2002:a17:902:f54d:b0:235:efbb:9537 with SMTP id d9443c01a7336-2460238be4amr27003675ad.3.1755790556289;
        Thu, 21 Aug 2025 08:35:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-325154b70e0sm71365a91.29.2025.08.21.08.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 08:35:55 -0700 (PDT)
Date: Thu, 21 Aug 2025 08:35:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Message-ID: <8798e925-6c99-4efe-a0e8-5cedf04a3403@roeck-us.net>
References: <20250818021826.623830-1-sw617.shin@samsung.com>
 <CGME20250818022433epcas2p15ec2e45f26f6ff5fb69f0b1e377616f4@epcas2p1.samsung.com>
 <20250818021826.623830-6-sw617.shin@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818021826.623830-6-sw617.shin@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_083557_082987_4AB7F312 
X-CRM114-Status: GOOD (  16.23  )
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

On Mon, Aug 18, 2025 at 11:18:26AM +0900, Sangwook Shin wrote:
> Enable supported features for ExynosAutov9 SoC.
> - QUIRK_HAS_DBGACK_BIT
> - QUIRK_HAS_32BIT_CNT
> 
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/s3c2410_wdt.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 915d3c88565a..b774477190b6 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -306,7 +306,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
>  	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
>  	.cnt_en_bit = 7,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
> @@ -318,7 +319,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
>  	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
>  	.cnt_en_bit = 7,
>  	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
> -		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
> +		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
>  };
>  
>  static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> -- 
> 2.25.1
> 
> 

