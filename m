Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F3F9C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=; b=ggE2e95V7XVU8jcKBUz0gAFtF4
	hKxriDMwM9v7OZhvPuMGA5OBvROEeFoXiYGY6Qr0zwJNesw2Yshsru3CdOHfww6PuWDe6jeiMwIH9
	l0JlJjQRqThqTV78+bFp8PHvFrk2xj3iW10g83FMbtwSh9wK3eunRppSFjjVUMnVCAvRhFsPd/91B
	nBIFHiY+g5Fum3WhyTH/vUMmBL5vCvOs9dITLx82bh2NoDWIllPXPI1yiVcl9RVrN9kXCSETusJpS
	PGbbAw0HtfC9o80ML+2WjtANcHiCNgN4PNH6rF6P7IrwMQiO+cioN+AGTSlmFvTyUdbjYJybn0t65
	ju6boiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuV7-00000003QwG-3VF4;
	Fri, 16 May 2025 12:49:21 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFuT3-00000003QcC-0hRN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 12:47:15 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-442eb5d143eso19394285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 05:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747399631; x=1748004431; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=MNE78l+DPH3RDdL7dx9/PdzqMTCTDKU1jDrNhB8EYUL8kNZdLHkFm/LBcwioIVKFdu
         k8ysof5mI4GIHyCOVvxktYGQbWdr5YAr9svSsfNK8Xny9slNYFRxKHLsPZ2J2ibtbQ0Q
         NmvlQlcjq+M6oJGDciA3n0KMhOuBp72HK0uG1oHmX/TwEHNttc1cZfWvBrkpSpQqzrO+
         Lk7EqK5XTXmP4fZljLtMBe338hBxbA7csxgYuXA0Yc2fd27W1Uw2ERC3zIdm07zFknsA
         dNCRF4IsTAa9bu86M8Wv24zgxfSrCl4I/5bS0JKcGuvWEkQ104k5pU3QJAT2953fFuIq
         31eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747399631; x=1748004431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=It4olg+vj/PaVXUOML7Uwtxb8afmv0kwgYzH/XkHr3k=;
        b=b4//HIfz1ssnHBozdhpZDMy+HkMUkHVr5mWKlSxPCJ+m0UogGqC96W2FLyNuL0eTf0
         XGUqha+EdSdXM2vOn0S70JCMydShSooeSkiKZgMFIMxat4O+xUPrTZ76/V8nAcqeSkwZ
         VrrsPsTtrGtd8KhdXMiBhKaCVRegyOSB1vBHgMuHrB65fHjDfYWHxGBWtBEfl0ea/R6O
         R59LcObl3hwyI2WHHzap4J8RKDU6YJu9k6/X8o83xGs00YvRbnXMFZUPne+Dop1+ng8M
         sJZWHML6m4xBYApr+c2PSXThzANUG1qWoFBwTxgQqQq7qywNHvx/c/Sj5VYBo3nvHvha
         7mXA==
X-Gm-Message-State: AOJu0YyQm6gqdsJfFxFhVhoBzeNq200kYmHxR7K8tr+Gcs+mIQkzLyge
	FWo2edELHQE+gApJ8dLhs5sGOFmzYBnVjvb1B3EoTssRcL314B3lJFFGnlMZyDQ7mdg=
X-Gm-Gg: ASbGnctRFGZThJwHxkwWLu3WVEF1NlMiNeg73RcqhPMwWKwqoJBmg93IA2rAf9tN+9/
	qgRju0ifzfsvlGDm0iNCtTCZBYf1MCXXXKjj+DcsThXj7RG/MSUt7w2fbwqW0B2RWTkYAnjZdlQ
	zejBdOKHz5W6GfMwpRD8076sOWVSEcR9+jNki2dCBGEunaUGHcVi05JwJoEMOQCgnNwg5xybTc2
	sCoELYjHOIw+3xX61uJJHEdo+OR2Fd2AbaNf2bScTqP5vHKaCLUr/O1HfIFSeH/+yh7ChGW9dOp
	bqbtBl8jANv8BgHfl8GJf8lnRX8jxofE+dUu/6imjtDw3J1JIhKxtfNppaHMGyabkxzMN4E1qj2
	JSTXvJ+aUnCb/jW8=
X-Google-Smtp-Source: AGHT+IH5gScMrCCTGF//8JROzSasDHWVQYCYlgMKE4a0wf2w3fuKAyBSQp+DJif8kHEnseMXKCoH5g==
X-Received: by 2002:a05:6000:144c:b0:3a3:62c6:d2cd with SMTP id ffacd0b85a97d-3a362c6d48emr1641333f8f.14.1747399631142;
        Fri, 16 May 2025 05:47:11 -0700 (PDT)
Received: from [192.168.5.157] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62b5dsm2792986f8f.55.2025.05.16.05.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 05:47:10 -0700 (PDT)
Message-ID: <70da4bf0-a36b-474c-8057-1ad056573e01@baylibre.com>
Date: Fri, 16 May 2025 14:47:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] arm64: defconfig: enable display support for
 mt8365-evk
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20231023-display-support-v8-1-c2dd7b0fb2bd@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_054713_445118_9D461174 
X-CRM114-Status: GOOD (  14.42  )
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

Hello

On 20/03/2025 09:48, Alexandre Mergnat wrote:
> Enable the DRM HDMI connector support and the MIPI-DSI display
> Startek KD070FHFID015 panel to have HDMI and DSI display working
> on the mt8365-evk board.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e615863..1e2963a13500b 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
>   CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>   CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
>   CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> +CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>   CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>   CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
>   CONFIG_DRM_FSL_LDB=m
> +CONFIG_DRM_DISPLAY_CONNECTOR=m
>   CONFIG_DRM_LONTIUM_LT8912B=m
>   CONFIG_DRM_LONTIUM_LT9611=m
>   CONFIG_DRM_LONTIUM_LT9611UXC=m
> 

Gentle ping.
Is that patch can be applied please ? The remaining patches in this serie
do cleanup only, then shouldn't block this one.

-- 
Regards,
Alexandre

