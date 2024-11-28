Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85804D69107
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 13:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpJV3sxc/k5d9E7bw3woxWxWCXGkw8tAeHxF+F42yss=; b=XA9wSsBKu+3Bx94N9cxXXg5HWH
	nmpW5P38jfPIxa6Fn3rMycvxfZJ/c9lpJlD1GLId9LjSFp5VlVq4A32eG2pcyvWXxvrMFWv4ye0Fk
	tciIe3OejptxqMU5C2TiowFRvqUSowYCDIR7IFn1jPB0aH9l+r2MjSgl7jZy6PJeCevV9TLHHyRCW
	Qojq4t429Iiv9X5KIW84cIY5eiKhVCYRGsiGm5j7YFJe806JZ6rewh7wliC+39oGnZrdSf1m0Whk1
	jmgt0PO+AmbSJQqe+t8kYqxePBeyb9D1inoYo8pzu1y/m5X3oLU0vMPSI9eugozP6vbUSfHUs15mC
	ruiw3FTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeLG-0000000FbTd-2AtQ;
	Thu, 28 Nov 2024 13:13:58 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGeKH-0000000FbML-3VV4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 13:12:59 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ffced84ba8so8066511fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 05:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732799576; x=1733404376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpJV3sxc/k5d9E7bw3woxWxWCXGkw8tAeHxF+F42yss=;
        b=kZoK7wAI8YWtjLP0eS5/SljxQ7XIZqVCT7B3YuhRlSUa0yH3CVexfHGvpw0bW+aMxD
         HGiBr4n2bHerIROKoFdBxY4lsSXJC2GuHfjbMBkWMQNGmQldX+pHAi2WLudMJ2QrevnB
         cDW2MQ0i7bO0Pf8+poL7/FFQFlJAVrMSVI4HViXk5Zvb9iWB+4n8boFfIJkrvsEGugZY
         0SRHN3c8Hg9EMnAssem75S7ejIekpsOnFWP7hMztw4fH7JNWgdClNP+ELSKDofR/oqP8
         C3mu+HLgtFQNBhvbzyATntjS9Rs37QOKJU/xikpH3NNpRwlcjf1ym/NnhyY1fJ//mChf
         LRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732799576; x=1733404376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpJV3sxc/k5d9E7bw3woxWxWCXGkw8tAeHxF+F42yss=;
        b=EEer+Dzj8G9adUF8XbSdwrNs47yPZhQ16ZExmfCXcoLbK6wUJLu9EcVCJYOsy8X+zG
         FWWsFYk0LjhWCHeiJZRR/Ru1515t9mZxWXuEGNQLm3l7107EAnLyvVUMHsHOijLBy4G+
         VgkbFJLq9hDgZuThSLkvyEM+2icr5xQVlNHPkY27GVprEVbG5wZJx/lj/jyEpc4Ybotk
         QoNxE0X4KDWs/Cf55C8tGv3er2gYPVI/YS8T7mJ+l/oKRJN+1nR6xjDSX2MPquDe/xsj
         BNYgG6kFAuZwvj9qSxpFYcT+UWwXDWFyXJXCVmcdK4OIeBpSljpoY98Fv6YySIBUg9Mn
         ROuA==
X-Forwarded-Encrypted: i=1; AJvYcCWDr66dKXK7FUhlRSKjNiBHPVYxwXTe9WFr3w4Rxq9sW0aFna7UMOt96uIDzE2DOlIun3sMSXfyoFxbfUOYz42R@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa6h1M6mPxifm0jeqq59SFb26We9dWeq9jvzjzX8+qdnhpdyOP
	m30qiA2xIgsCw8K3btKfmeQjQfBl8vV9Xa5VbOs4hf4lUcniyAxPd+teeQ1E8P0=
X-Gm-Gg: ASbGncvWfX0w2Imal7piLeEgTVXvwbLJhso30foUU5S0BMq+1/MJuE3LsrJ7CAM4OGA
	SuiPay+uoWNiY2DBgbuyKs7nkIVeDItFz7Cgsq+Muw9Se8Bi69BwZ80dju0rSyvbuQoYRwa4LFX
	969rL4EFiu8tg09+dUUFLTGEWnr+tFEt3qQ6JCnfg27TX+WuP8TyLpdQ+UKz1i2FCZE4wRJaN9q
	G8PV+AVPuOI6VVZ5eSoLWfaJ2+rVR6WrbCaJOij02OWjTwlNQDLXPfg0JV7G4Dlvzr98m9/1J+R
	IKSBpwV3FYojkCPitP2YcM+y2C+Msg==
X-Google-Smtp-Source: AGHT+IFEsWiYySQlUxeUCEhDU9UTuc/5MMtH5h2wIuS5BWZsJk6+mrBkFYDCQpE23ITXxkYf+O5fdw==
X-Received: by 2002:a2e:a816:0:b0:2ff:c242:29cc with SMTP id 38308e7fff4ca-2ffd60231a0mr39764271fa.20.1732799575587;
        Thu, 28 Nov 2024 05:12:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffe1daba82sm1273441fa.0.2024.11.28.05.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 05:12:55 -0800 (PST)
Date: Thu, 28 Nov 2024 15:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_tengfan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
Message-ID: <evzdrhzrr242ynfv6p4qhtjpgd4allzgw3osxalmtyfxzsjj2h@vingsirpf5su>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
 <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-2-26aa8a164914@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_051257_886379_BDFC1062 
X-CRM114-Status: GOOD (  18.51  )
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

On Thu, Nov 28, 2024 at 04:44:44PM +0800, Jingyi Wang wrote:
> Enable clock controller, interconnect and pinctrl for Qualcomm
> QCS8300 platform to boot to UART console.

... which is used on the ABC DEF board. The defconfig is being enabled
for everybody, so at least let them know which board increases the size
of the default kernel build.

> 
> The serial engine depends on gcc, interconnect and pinctrl. Since
> the serial console driver is only available as built-in, so these
> configs needs be built-in for the UART device to probe and register
> the console.
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d13218d0c30f..3d9e48940c96 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
>  CONFIG_PINCTRL_MSM8998=y
>  CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
> +CONFIG_PINCTRL_QCS8300=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_SA8775P=y
> @@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
>  CONFIG_QCM_GCC_2290=y
>  CONFIG_QCM_DISPCC_2290=m
>  CONFIG_QCS_GCC_404=y
> +CONFIG_QCS_GCC_8300=y
>  CONFIG_SC_CAMCC_7280=m
>  CONFIG_QDU_GCC_1000=y
>  CONFIG_SC_CAMCC_8280XP=m
> @@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
>  CONFIG_INTERCONNECT_QCOM_OSM_L3=m
>  CONFIG_INTERCONNECT_QCOM_QCM2290=y
>  CONFIG_INTERCONNECT_QCOM_QCS404=m
> +CONFIG_INTERCONNECT_QCOM_QCS8300=y
>  CONFIG_INTERCONNECT_QCOM_QDU1000=y
>  CONFIG_INTERCONNECT_QCOM_SA8775P=y
>  CONFIG_INTERCONNECT_QCOM_SC7180=y
> 
> -- 
> 2.25.1
> 

-- 
With best wishes
Dmitry

