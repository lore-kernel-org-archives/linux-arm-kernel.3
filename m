Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03C8E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=; b=bR6ja6ICii2xrWcTs5gCef/eWz
	Q6+SpjGhyjwO47YscGqZGRjE/aOkIatfKJyiV9Mr1nqStTdBRl1g6DBkDu/RIL2MyiytYm22JF/mD
	iFwyjz0WlzH+WtmPNVsZZytJOOhF5qTyUagf9E0pWE7S1RIlASvZcV0mWMfYQHDtCcnChWqj8IQND
	gQg3oywLC/Xbw8DTSqZE8JjK/1D98fHnHLn0yTmdQ4+5RT2bjesAe9lOVbfd+JfU6V6L7N70dzajG
	FGgNo2PQWKWFd61lOxB0nHlwDs+/ROOHSqU6xEMeKiW+avK16qBO8bHpQ6l4a+lhOC6Vv6LouCl0f
	CePaKfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Hx-0000000FNyj-2agG;
	Thu, 05 Dec 2024 09:36:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Gn-0000000FNnM-298d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:35:38 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d0d3dd3097so1054039a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 01:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733391335; x=1733996135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=yKPD88CCJtJ+Ka/kWooKfYw46WHvSa7fmTH7I0lhrRNirPUxTnGnOWowTlTE2K/2gW
         lfC0Zy5yuP/Lz0hGXw4YGmPN/J/rAT2MxYsKpt4N0SyMp/vDClKmBDe/M0skUoSgx2TL
         VHm06Tr3a1YYbG7VuT902RMBBjvGCQV4eOC3383R30HFiu+cljXMCk8Yv1CFFLqEukF8
         VORnxOW5Tkm75FQ3fXlDLoQiJtPZW9ddDNmqAwJvhgEmSdp7Ae1f23UzRbmNhwDt9EA2
         OGlClszgl8Ud1RjgYGjOjQZVBSJ0a+HfOQ2DD7qCARu5vFggB1AdaI8vooV/IKdbvsYW
         sbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733391335; x=1733996135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tjDqS05st+cDBpUDwPN55de5TW7/RedGp9MsJFKfa1A=;
        b=XGBliw8wSqlLMBYVd1vEoqleMCT3B1qnS6rugHT9YzzhWOvGzdsz3IklVaOu/ub9dt
         9CHr/btDdoaTyp2BNphaba0YUBDu2XGPTrrxlH8k28YwrKVZ0eWLVq/7T9ujeb0eucNX
         sDn6mq7eJ3FpU/zUdaqm0ySTpKG0efAXfgs/z53zYrOY/AkmdM60XIjpd88/eyMd29uN
         RG5k2WdfUnU+bwS6D8GBmfdur4sBgLmHZ2JXrTjSwSoZuXayCEoNYQnelP7Nk4Rxs3js
         EQazZntuPHPIQ7lXA34keIAKicEQBW2BkD+W24FkmxXRAb8LlrRy+8xlOgXKEmgvp/+x
         WGLw==
X-Gm-Message-State: AOJu0YwKzJjTYUnaHce7unxmnWtgXCo/cX0ciGEIMyg+fwe+eyDGOcbD
	vlhUMqqHiKcNT0Yy23Kjww873hyQZJ5RfPnEDLJMtmndwR8DQ27sHz0sePdhBqg=
X-Gm-Gg: ASbGncvbH0K2zgBffEIFLLiApQKfPHklGj7redujBB8e0fcXouB+FOTTKFnl8K7O4I2
	OykMcSDnrhCCiaflJ/55gkTU+ZsnfKe1r6XzobSKv5Zq9PeM7ucS51YKdjmZPBjBneJwQHkvDkR
	zvdDt0Lh9uTMQuQ3uW/IsPwxHlovWdCTUGSUp3KWrMN8MpOCepX0/9duLuXoHt2RnFvPetIudir
	+vhTMxtSPKJnCZiiSSuVVpd5TiWjJ6PO9us6ppgP+w+mdSjqoBMFovPW/s0ojc=
X-Google-Smtp-Source: AGHT+IHFm4UZarfubQus9XeHuRq9CcZZpSvgMn+7LHQv0GsiN/Tz1ExqT9VocSpHFgTuSVRxvEIx3A==
X-Received: by 2002:a17:907:b98:b0:aa6:1678:fdc with SMTP id a640c23a62f3a-aa616781260mr394843066b.58.1733391335136;
        Thu, 05 Dec 2024 01:35:35 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa62601b609sm66188266b.109.2024.12.05.01.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 01:35:34 -0800 (PST)
Message-ID: <51d340e1-a62a-4851-a2be-545580bf4088@linaro.org>
Date: Thu, 5 Dec 2024 09:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/5] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241204100003.300123-1-quic_vikramsa@quicinc.com>
 <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241204100003.300123-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_013537_556780_2D532092 
X-CRM114-Status: GOOD (  10.53  )
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

On 04/12/2024 10:00, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 172 +++++++++++++++++++++++++++
>   1 file changed, 172 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..e363996602d6 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

