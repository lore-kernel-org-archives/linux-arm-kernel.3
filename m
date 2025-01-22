Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1B7C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 13:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NB6Rh/OFeXzQHL/a0mwC65e81QBFBxkxQjo9tidAdio=; b=l7AWUl1RJPPNHoi4tsisepYCUB
	kAxamtfr79IHeQJNj0xXTBFuftnytNGg+9qawHf0DC2fK/kVV2u1ety1YdHYG7c4NpEkXSiS2PVPo
	Q13lKTyrxhGCQ7YxLGh4Uom+6vK+Y1fyrpW6hXnClasIgn3pVmkQa3IA2KsReef/0HAfRd3mv5mzq
	IF8ilHi1EaTehsRdxw3puNyH7F7Hz4T1/mWFKx80fqH5IxoIAWEzaiw9fwB8D4a8myxbZRYU79HaX
	c/25GpUUcppJOJ070yD/1hFYCjc25X7RMG3kkzcAFOnPvbiLaTCDrgqPouZAWTlujkIjpJaB9qIZv
	QYWSG5Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taaph-0000000AHph-3HYK;
	Wed, 22 Jan 2025 13:31:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taaoP-0000000AHYT-3l7t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 13:30:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso5786245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737552628; x=1738157428; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NB6Rh/OFeXzQHL/a0mwC65e81QBFBxkxQjo9tidAdio=;
        b=mnhEGFpyKiuOm6kBFgPheSk9LzkrpHjEI8aOIZvpk4a8dlH2qFz/c4y20A6eN1P4Ke
         vB+OB8C4sSp/hnF7ew8Hnjv4PjsejY+vp64PpPRRKvMtSPbOXv6Ih3jnB8UvNT4Zi8IY
         D97c4catTdAdU4ug2twLWdky+U+DIAQ8cyBO5V4a7myszblGpqPy7I+WZUWEn6LPBNJb
         m6hsrGbStKsu+Z4Y+i2WWIwtgB/BDNtsZvPSlBHUNMWfWKDHK0/TiAZw1AWJKjFbo5gq
         E0YRH31NY9hi5i7iDYMYILsqcyqBjAY205mBqLXdFnB6fO1sQoDmcI/sa0dxeC4Q6VfN
         W5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737552628; x=1738157428;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NB6Rh/OFeXzQHL/a0mwC65e81QBFBxkxQjo9tidAdio=;
        b=mfADJxUSotSlJO2JVeb9j3vqTX8WvzBRIptxcQ3m44UPA6JcELoU8vE2oz+cwZXdKC
         A0YQHtXcS0QWsoQ+bUvhtp9szRV6LCpg+HpIFcHN84K6ZLmQJt6sfr0dsRvpXYa337FU
         4GeHPRcwQ30HN6TlFZeK1xiEgIY1mBpHd26wthef5VbIQZtf07sXvj2vhEttAyKyetcY
         Ll7/mGo2Hn4GCaOjdQKMYF8hxgRhX4/s2L9svBO7/UikN2Qbxfp7Awc2/EreYkqJbB18
         JSqkDRiR/NNEJ/pBrUAncLr+f8NIaoMap3oRyKLzEOQAP3TSAFgbSfTzC8HAvz6ql7e9
         093Q==
X-Gm-Message-State: AOJu0YyPGb3Np2qbzgF1VCobFpaZFPuAFH87TKrddurOqFxUMxyVwMZV
	xYrSqCdLkFfFBquyT+BvI84H5OTf7qJ2VfAMq4WvvOTXeBGCNcHe2Ogznx4Fhbk=
X-Gm-Gg: ASbGncvzVLIhaBMyWQyDN4wB1Vv/uf+cpBnS3L6oxeum0yLyN6pM3kOV31kIyd9G41U
	Ak5brdfnprZ2dukw28dnFmcY8LG4whnjMrz4MZztBg+zssvhlQrp9By58J7mYfZ4/Gh7SOaKN/X
	UTKimp09/++cmQjubk0TStWcbaVpuEHppvr3FRH8payWzbOaQ70TqH9ZGn+PIqx9MzaIfKf1HK1
	LR7C1rNvlBy9W2ICQpzaHgQrwGqO0YdIEzLsWPm072Lb1onUTDZP9Y0tnfJAll9yBPIs0z3EkVm
	Mot8wZg=
X-Google-Smtp-Source: AGHT+IEs9lAWF9RKOmcaZzHtX4TIStHBK+ZBY/o7F7o+SLwozXV7t/wh2J7X0yEr3mWNe9q0TILkWA==
X-Received: by 2002:a5d:47a2:0:b0:38b:e22e:aee0 with SMTP id ffacd0b85a97d-38bf5b02a75mr19062848f8f.23.1737552627762;
        Wed, 22 Jan 2025 05:30:27 -0800 (PST)
Received: from [192.168.0.35] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327556dsm16278714f8f.71.2025.01.22.05.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 05:30:27 -0800 (PST)
Message-ID: <f0079c85-0ff9-4663-9ba3-b208b3487db5@linaro.org>
Date: Wed, 22 Jan 2025 13:30:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] media: dt-bindings: update clocks for sc7280-camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20250121180746.1989996-1-quic_vikramsa@quicinc.com>
 <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250121180746.1989996-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_053029_941986_2021692F 
X-CRM114-Status: GOOD (  16.94  )
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

On 21/01/2025 18:07, Vikram Sharma wrote:
> Update clock names to make them consistent with existing platform i.e
> qcom,sc8280xp-camss.yaml. Rename gcc_cam_hf_axi to gcc_axi_hf and add
> gcc_axi_sf.
> 
> gcc_camera_ahb is always on and we don't need to enable it explicitly.
> gcc_axi_sf is added to avoid unexpected hardware behaviour.
> 
> This change will not break ABI because the ABI hasn't been cemented yet as
> the dtsi changes are not merged yet and there are no users for this driver
> as of now.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> index e11141b812a0..ee35e3bc97ff 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
> @@ -55,8 +55,8 @@ properties:
>         - const: csiphy3_timer
>         - const: csiphy4
>         - const: csiphy4_timer
> -      - const: gcc_camera_ahb
> -      - const: gcc_cam_hf_axi
> +      - const: gcc_axi_hf
> +      - const: gcc_axi_sf
>         - const: icp_ahb
>         - const: vfe0
>         - const: vfe0_axi
> @@ -310,8 +310,8 @@ examples:
>                        <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
>                        <&camcc CAM_CC_CSIPHY4_CLK>,
>                        <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> -                     <&gcc GCC_CAMERA_AHB_CLK>,
>                        <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
>                        <&camcc CAM_CC_ICP_AHB_CLK>,
>                        <&camcc CAM_CC_IFE_0_CLK>,
>                        <&camcc CAM_CC_IFE_0_AXI_CLK>,
> @@ -343,8 +343,8 @@ examples:
>                             "csiphy3_timer",
>                             "csiphy4",
>                             "csiphy4_timer",
> -                          "gcc_camera_ahb",
> -                          "gcc_cam_hf_axi",
> +                          "gcc_axi_hf",
> +                          "gcc_axi_sf",
>                             "icp_ahb",
>                             "vfe0",
>                             "vfe0_axi",
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

