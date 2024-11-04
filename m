Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F99D132AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXfPeWafmveGhp9XKGGoB6z88NY3VZN6ji8tXCrwgCk=; b=ZYTFgwY0KNHpmILT15fA0vmpKk
	Q+TiyQvieWGWYxWF1cfWfk1vIhjYVR5vsH1woKTJtcB34srAOaYokhX75PZS/EZO9PFhFDeTQ2Yyx
	XPRhaeAgTmMROpSS9NOSD51g+havdiiE9BQF222M2FtSQdzEkrptZ8ZaffJVeiMapPlapg7ZF6zpe
	hgbpAK1GyKdiK3rq0GLgDjih29D/z+mXAN72lmtlfl1Yv+urw3cjbQOzl9DjV9iobAL0AqbJZstvF
	lnFZqJ3SG/dSD2sNaX5UfxJkYEdg1KG897ThNQdwz4Rb0z/sHAhaY6oTe63YgqpamRxTSoA0SiTAr
	1E8cp1ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v5K-0000000DTQi-0gIe;
	Mon, 04 Nov 2024 11:17:26 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7uzk-0000000DRsZ-4BCf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:11:42 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-539e4b7409fso3897349e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718699; x=1731323499; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fXfPeWafmveGhp9XKGGoB6z88NY3VZN6ji8tXCrwgCk=;
        b=nuVCfREpiSMCYnsUZpebc/DUPZtUbouY65/meU2gzIev6u4eG230sy0HqF1VzyZQkG
         v5L7O2gLRiQjFd1rePymC1+bMrda3aM6b9mAcj6fpDjixrgPq1TZNnPIAsOIBmZA0X9z
         85t5U8B86Os5tkkG7tVBt005WsGefTaNEie6eJJonE5V5Hqstx2Ot+A9XAZMj+RyNSnC
         zH4cRAgYkz+L2YMwxyhzwX5LZqeYF2hUiM1F1p2lW4ibjCXYN7MUEvPTBo3K5JQPhtj0
         43qpcKepL5QnDWjmsm0HOE+O4JjWicOC5Yt0QcO9vb2D/hQcUAG2HDcJWkaVJ1NoaegQ
         MsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718699; x=1731323499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXfPeWafmveGhp9XKGGoB6z88NY3VZN6ji8tXCrwgCk=;
        b=Nt//oF+1jMjAgcYP9PRWYcig/rodOPm9g0/881sEaNllhI3l6A0toOEBY80P9bZV8W
         Nnvx2LM9oTAzxJMkx+jsgIQ4g6x7O1aaYMyJqectSe721ZmL7ONvOZab4Qb4gPgXxx7R
         9ut06SOP/Bs3RweXxiI8VW6jNm9aiGmwJHMqEWbGycKkvdha/CM8ncbEBZ1ynfwJvSyE
         cEt2uV/bL1rjAg5mQRBGNTmBdQIn63ynVxAfYSepTo9RKTvtamIP5MwN1tc0ZO5Vordw
         raE7471s7VCAjvC6Vcjf0u2sJofmOawmi8h3jBTs9yd/YW5MgQuPYgHDBW+ATul3J3m3
         j0KA==
X-Forwarded-Encrypted: i=1; AJvYcCVuFy7gpBjsedZMNTKBg7l80MnZiXNdu2cdBNdxVBCRnSGppqMV06qrdL3fNBJFh7q+u6RbGHl7g5B8iJ9+bhuk@lists.infradead.org
X-Gm-Message-State: AOJu0YxCXz6ig7QUuT8yG/O05RHwDToUVArTsMOy43NHnGpPlJgq9g8D
	mKoDDn2j6sDj2MmXtnI21UeGXP0ZYwMvLKxV+DmP3WPzghz0jog906MlrRGBmI4=
X-Google-Smtp-Source: AGHT+IGqEF0e+IXoOCiPA1wD1EErF4DZpjMchrltLY3F4aIzKOLMtZB0smShDHkNlyYp+oQw+xv7+A==
X-Received: by 2002:a05:6512:20ca:b0:539:e263:331c with SMTP id 2adb3069b0e04-53c7bbee92dmr4530622e87.17.1730718698968;
        Mon, 04 Nov 2024 03:11:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde091csm1646261e87.251.2024.11.04.03.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:11:37 -0800 (PST)
Date: Mon, 4 Nov 2024 13:11:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 5/5] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS615
Message-ID: <ovzq44ymgqwnretjmifaygqbjaxewxyx3ritjwcvb2d7hio26v@3i3xw5x3icym>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-5-9dde8d7b80b0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-5-9dde8d7b80b0@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031141_067552_CCFF8CD6 
X-CRM114-Status: GOOD (  16.34  )
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

On Mon, Nov 04, 2024 at 05:10:12PM +0800, Lijuan Gao wrote:
> Enable clock controller, interconnect and pinctrl for Qualcomm QCS615
> platform to boot to UART console.
> 
> The serial engine depends on GCC, interconnect, and pinctrl. It is
> necessary to build them as built-in modules because the debug console
> must be registered before userspace is launched. The primary reason for
> this is that, for example, systemd opens /dev/console at launch (i.e.,
> when the init process starts). Therefore, if we register the console after
> this, we will not receive console output from systemd.
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

