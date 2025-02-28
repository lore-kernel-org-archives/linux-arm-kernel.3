Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE39C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 06:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UwWIKz2ocQO8lKlTLMYiX1hlEMOEiYylG9oMJg+Rd0=; b=vChvpVwuMdsbe9uMFjOs7nfIOu
	UiyQhg2vOAIRW9cPvwlCW0bs7rbjLbbknzPPsS+vv8FH2xsS/lJXFVQZb6XLqFUfIY5gE1cEChypc
	txhrgStHCJEKjG8wRwG2DL5XWP8IJbINT/6wmsQWsFyHvcB1XHkG6mS5Pf6JLVIJlIzwKD8J6rgvL
	45xWp3keYL3YX/yl0nlbAzqlmUmTQ9SzPPIXAoQmEg7M2RFsrpFuJV4fjVl0lw4/PmJvf7BAwPJBD
	qneIaKkINEn8hSGC34+x5TFhDFsv8FO20VWZ4/gALlKGejSZwi/0rwrBm8n1s1pDFr9sJjfiFWEFG
	p2gusGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnuGq-00000009ukH-27Rb;
	Fri, 28 Feb 2025 06:54:52 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnu7K-00000009ths-471J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 06:45:04 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-54954fa61c9so67087e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 22:45:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740725100; x=1741329900; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UwWIKz2ocQO8lKlTLMYiX1hlEMOEiYylG9oMJg+Rd0=;
        b=tU6x15SusgItzTkyexhFJNZ5+BEY/ObqaRkDkw2npm6QsA73wop7xli4PM/OGvsA9g
         3b+Wwg8Omo9aNt5bjuIGkdj/gfrcSrQnnCGjRqljM4NiHREwJ3phv4LEzbmZYE7fgFcH
         QbNTfOvIy04Qn8/os7jLriQTcvTdf3FxqUPKdrNu4FRzkdndLeTtiNhKJCuB58XrGi1e
         j1Qyp+IWwTxPtIzl6HBB2msC0rbmwfoln7CTCdcgwv68pq3LzRCBrUmIlKhOU6ZIThz4
         Q5dHWI3g3VagJmAB9Phlc0qjGTSlspg7jZVETz9Vl0OUMyz3wILySOXJO6lVqhMAw32G
         cw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740725100; x=1741329900;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UwWIKz2ocQO8lKlTLMYiX1hlEMOEiYylG9oMJg+Rd0=;
        b=LJyHn1LbfHq28Mb/bKg9VybRa36la9Qpmn+J2ABzRek0NE+oRXcXfMQeuN7f1lJa5D
         SNZde69n/ZKwQ9snXme4R1glpaR+eaD58M+z3OCkCZxgns1h0lPcHN0/n/Ei0TSO8/Pd
         KYTyiXRwQQCVHge+dRLe6NjJciEtSPge8T5xB65VX8rOHTJMhR3tYxSk1hbEZJ27XLbm
         Cb87QiQ91YdzKuqkO5ebxn9EE/IVeEnWvu4l864RrFdFcgSpCFYoHB9L1oHLNsQUSufp
         9WYVkZnJmnREVZBmv2N57ekF35h67aiibh09mc6l5TWm2bt4mkqUZHmRCNaVlQKNOEfH
         RhwA==
X-Forwarded-Encrypted: i=1; AJvYcCUFYPKr41e6CaiO+A4Lgq2ChxH++TLwUW6YXk52Zak6OzEgUgV/BKwnz8SwgQhmMhRKJu0VPVYk6Rb1Pm+jGb76@lists.infradead.org
X-Gm-Message-State: AOJu0YyxpKtupWWiRNAb0NsGSBo0E6rVWlb0bk9sJy8BJ3qXsjnygreP
	SVTEw449668APmSeKpeGebY1VxtqnmW6PooTF2KPCvNEr2fZ6XQKsBJPdqa/regT8BuPfMGJY7K
	hD0g=
X-Gm-Gg: ASbGncsgQwkqPo8uZCZtUaS+Grxu8mH00aI3VyicN8l4/HjpPS0XAJpJwsUI4l4fUNc
	T/G01sno3GC89UN5AhIT3kpmujFAWKYSlDZi6x1EyKWR7xLETvV7SAf4N8Da0JseDGI5NURHXMs
	GaRhPDEXqYP0GfJfTaXIEb1djUTaLxx/Ibh7E0gqfX0FxI2DlNHfKFLmTd9A4f/F+STDHVx8ciH
	CD4SkTy3be3LEzmwEjoaGcQ6LOq6i/qnet8/huv5DqQkCDfeXeaY6OM06ZxkKhSRLR4HKOYoqVb
	L0BsTLHkk2Z9g9iBUYFRkZM07o0cXQEToYJeG3Idh0dB2Bh9GSMCUHsj/LyWmmOpQk1f2QXVsBn
	sb4a0BA==
X-Google-Smtp-Source: AGHT+IHDB8fBe378tsuV5Q4vwcGascJZUy+amYGeXzsNguWtg8036c86qjE7FSNVxZDOzRfFY6BYFw==
X-Received: by 2002:a05:6512:114b:b0:545:d72:95e5 with SMTP id 2adb3069b0e04-5494c107c7emr1034250e87.7.1740725100131;
        Thu, 27 Feb 2025 22:45:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5494417b853sm385815e87.102.2025.02.27.22.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 22:44:58 -0800 (PST)
Date: Fri, 28 Feb 2025 08:44:56 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable DRM_DISPLAY_CONNECTOR as a
 module
Message-ID: <nzv5wokyetzltnmuuufehdztreorhd5s426fs63shrolr7b57q@fyswxst5u2ay>
References: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-arm64-display-connector-v1-1-306bca76316e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_224503_028593_8673DA3C 
X-CRM114-Status: GOOD (  19.69  )
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

On Fri, Feb 14, 2025 at 04:57:11PM +0200, Dmitry Baryshkov wrote:
> The display connector family of bridges is used on a plenty of ARM64
> platforms (including, but not being limited to several Qualcomm Robotics
> and Dragonboard platforms). It doesn't make sense for the DRM drivers to
> select the driver, so select it via the defconfig.

Gracious ping. Bjorn, could you possibly pick it up, as it affects
Qualcomm platforms?

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index cb7da44155999b59aff95966f4cdc9107f2af46a..dfcc754962f7a40377d1f8e0f16983af5ace28f4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -911,6 +911,7 @@ CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>  CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
>  CONFIG_DRM_LONTIUM_LT8912B=m
> 
> ---
> base-commit: ed58d103e6da15a442ff87567898768dc3a66987
> change-id: 20250214-arm64-display-connector-c1c1569f9799
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

