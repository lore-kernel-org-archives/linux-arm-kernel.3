Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FACDD767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ww423lfHl3RJq60oXMLHUaPgCkzs8qQvv8BPeWX9FNU=; b=gZgfCOj9mXmSXg6UB5fD1pHnwT
	D4UPkQKwNWUi4eTQheFC1YzKZ/1SV+lbvcc5kuKxC6auH8MUkOwMYOfvwsYc//flcYhABmopqSCJP
	OabCDjTmaG6riW/ujJvuYCtDUqGbKzYp4LLFbFzw7golacHlNVQmMdfBP9o5fQinhlHP/EeUADASs
	Q1ovTSKrOWhwEyyz+5UpaDrpNtnT20/UhHP4QXTVoaqEyYdhHN0rnnZqCcC9pSs4HthfwcGNPXK4f
	/3jkNk6CUyTwqIgUNcuOQPVDirB/SJBce9iR1NpS/vENt+aWDJriThE10rMzs80jqawbuufXQ6wur
	FUbp/0Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Zdv-00000004Suy-2I19;
	Thu, 31 Oct 2024 18:11:35 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6ZbY-00000004SWp-3muf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:09:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4319399a411so10695395e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 11:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730398147; x=1731002947; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ww423lfHl3RJq60oXMLHUaPgCkzs8qQvv8BPeWX9FNU=;
        b=oO1XdbD0oQGE/YyM7ahfSg+4ChXPDQ8ePWrHs9WX6uqtuio6bmrQtROeU3LImBQ8rY
         U9pAbQAIGGO6wCtH0B733ARtpj5Ga8iYO0Uw6GJVznvG9sfkJB5Y2MZ2rNQ0ZuVrIiR0
         RYZzLFJbwQ+bVoInK3KOjwcqYcby4jEWjWcnXXbrbMTax172t5Ey4wlDIUGIRYaAsqJQ
         IvOOiC0LZhCo+IZTkkFfc8Y7X7iX7NimokBd16mffKFvhJMZ5+0njts6/DD4w2d794MA
         RbjPw+Nkxv+9SQVX+Qrh1cLtJ58pJyL/9UbnP9FSzQsAzXeZY0c5LHJJVfZ0IL58UIXY
         JGrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730398147; x=1731002947;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww423lfHl3RJq60oXMLHUaPgCkzs8qQvv8BPeWX9FNU=;
        b=DcZAme2iyoqpk9zTbDBtnuydgYRmLwRM4fiWyJLGr7ZIb1AEYu48XN9fFQ0cstzF6l
         FFw7Hghc1cNGLpXq/n2+CSaxqyGdGJow41ScdjNm34yYfVzRlqNnffJGp+MZP4TzK+qm
         C6hU/B3BbcmidOp5qVwg5Q6ke9ZOWkyJSCp7PaBWO2aY3Jnn9wQMawtK+j/bjeyWWYvH
         F71iHDyEgHehcvqeIPgwscQSV7mqje68YcRdjoLNutwwiRevU+mLGWQD66q402mjUtst
         +AGDexhPKCYOzUbAiGD+QONxu4I0jeQBQa08NlGlPXpAkbAAyW8XuTmZVgZt8NRu5D5Q
         4HhQ==
X-Gm-Message-State: AOJu0Ywa7U5rxEXxeMlOqKqVk/cB23gK8YiwvgX2gbaaqseCyRmrk2FP
	6dhWIKuje8j09gXaEBInCWMYBoF9S3N21a3eu9yF/1MLhxxl+GPb8KunYaG/tPw=
X-Google-Smtp-Source: AGHT+IGUTRQz69TQsAsuaTFQLcFekqsDLfAz6CitU1HfJ7lLbNV0dp4jvalOgtIpFWbq8+MW+JPV4w==
X-Received: by 2002:a05:600c:4f4a:b0:42c:b9c8:2bb0 with SMTP id 5b1f17b1804b1-4319ac70637mr167227885e9.4.1730398146724;
        Thu, 31 Oct 2024 11:09:06 -0700 (PDT)
Received: from [192.168.0.17] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d473bsm2833645f8f.35.2024.10.31.11.09.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 11:09:05 -0700 (PDT)
Message-ID: <299befa1-63f9-4fff-8d5a-0753ae620c11@linaro.org>
Date: Thu, 31 Oct 2024 18:09:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] arm64: dts: qcom: sc7280: Add support for camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241030105347.2117034-1-quic_vikramsa@quicinc.com>
 <20241030105347.2117034-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241030105347.2117034-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_110908_981787_B55D0650 
X-CRM114-Status: GOOD (  13.08  )
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

On 30/10/2024 10:53, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SC7280.
> 
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   arch/arm64/boot/dts/qcom/sc7280.dtsi | 175 +++++++++++++++++++++++++++
>   1 file changed, 175 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 55db1c83ef55..690051708dec 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -4426,6 +4426,181 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: camss@acaf000 {
> +			compatible = "qcom,sc7280-camss";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,


Order of declaration of the nodes needs to conform to

Documentation/devicetree/bindings/dts-coding-style.rst

i.e. reg should come first after compatible

---
bod

