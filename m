Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69FB2CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QXGtU590npYGoj4oICVTI2h7kmCmRCpE+pANWf6Qbi4=; b=d6iNW0+YBu5bKBcvJ6nHprVaLg
	f1eDv6RD8t68OTNrKfRFpASsLG9RI8/wXYQaTwBBOMnipJMHJk1FxNdy8ifYyFI1zIDjYySvGLKPW
	8vLe7/nNk78uDNVF/zZgwIEmlHX9G4OtV1pZH4m5kNNBZnFRlzzb1ndX8ACigu0e64+MgpvvD3myt
	67bqSWnMzDBrF+Qm1U8QB02QCdPPGPCSLtXkU/qEPowjpRJa2jEm2wD2vNG1pvin1NizSKaO53SGl
	9KDCWrNKchv0P5GEe1HLz0px06AP8fbs9IaglT7Z+g81rCi0jwwzThrfHYgg472s0Wv/4jpd0n5GM
	uB0Xmq+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1xY-00000008qHi-3RLu;
	Tue, 09 Sep 2025 17:16:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwtg-00000006svf-0Mt7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QXGtU590npYGoj4oICVTI2h7kmCmRCpE+pANWf6Qbi4=; b=XyoN84QeLfbHeN+frVzaIxFLzd
	9iejIKXff5vKpCbFT4/jYKRSEe0XwhJaZ2SYvxoUiPawOj0sanXdGWafLdEilvkFDEYqAziOL4KNe
	S1WAnKV0kDkktrRAKvceTSax1dl8Of4Rdfocqs/HXOj79/YUr0EncSzEpxRou1uKU5MTM2+Pf2G//
	VSUCfDqz22jEWTZlDlBEq4el1Rp9Qx9SWWxl3FTHlPRjZHUNRRvd6uZrCDWmGS3x/MdPLL58E+aHL
	SbKf6whuw23kgmc/ovBInbzGT3+BnWYBK9tV09H50jLqCRUzYjJ+o/TdJaP8Ml352xmfoRijLyKdg
	A4GCqxqw==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwtd-00000005KyL-0Pi4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:52:26 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-45deccb2c1eso7077945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757418743; x=1758023543; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QXGtU590npYGoj4oICVTI2h7kmCmRCpE+pANWf6Qbi4=;
        b=nMfeZyciUGezOeaLWWUbFMERURtay6xXfwcQ1bZeBjmJvAMQ1RvmcCElQEFlBw3fR1
         oHIcmYvkgw7UWMkXEPTzDGJAg0iQyttTZqBEF7SXkSsS0RxDhbolKR/QXadAFgURVm06
         M/3vy16nowjhpXHJ2HBjGgb5L8grMjfFxYPLStWvfNB9Wr76ujWv/andQCE97zX3yckT
         kwLQ5KfuV/fKOGVhyH9tK+Rj8yOwIVkK56CUUCDPzkEYUMEkaYPcJ7RAnP1r512AOOQK
         yQuSAtCmjp1ptIBtS/r1rklTwqYSWMdt5+3ydmbb1P/wSj0nKb881qnKB+Tni0wVXGtA
         17Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757418743; x=1758023543;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QXGtU590npYGoj4oICVTI2h7kmCmRCpE+pANWf6Qbi4=;
        b=GqNCFkAWIsLdzd/b7xl4VOtoyh+BA5/oyuHu+z0vr6gXXYKXNcyq2u+ReV0U3oi+/i
         lEAIZaZJhdsu0hkQxaoeshoZFyfBMjUqq5Weum00W/Zf9xia8gEoIz4TMMBcfoJF4NTh
         ZXst2Ezi9Xs4d7Fe9NM5uG52nDoHfLyHBn2o0X4NXf8FJ+koDxGYLJbb6QiDr38DcSoM
         1bR5vj9zCWL1n3/R0fiA0h2tgKJMoqJ2+6O3eXblbgbXRU3nx8j481dt6hpR3RoCOSdq
         rI3QhTxln/+2DIgrBgC0ffJq7ykgl8CuFDh+4QFfD5o9Uu9YC/+LafX/Ln+DsrCj5M6y
         rIfg==
X-Gm-Message-State: AOJu0Yzw2Qcx6mQlkzqujgxrdkkDDu40PFv2EE1YF2dO7Ni2Yd9hNvYa
	hTbmhbUs5fz/WY27qyziIxWpuXiu3ZIMsLf3SkgZXHmJfzwzsDpSoQs/wiFYSNaqJfg=
X-Gm-Gg: ASbGnctbFfnNU1F6/wcU6TCOUoxxa8fgm6I9ULf6umarkXNPbEgX9TDR4dwhxPK+qv0
	97LvsQCAZNXiS0g109UK40ZOI6WRRxftxeObh8SfGFNQrU9dLADPBaBmOHrdAQLFq2bFX6nkKBx
	DjQnCelgKXsFAjkiHRzE3boCTpma8ez4AfDROoehyIumc+2H9QnspJ7UMmK+52sO7uOkqFuhdMb
	6nVRJcI6/+60CXkxfkosSUnAHFF3Y+7FXBhGT6ZHV7AalaR6mtkpO3Sz+m7H4tQds9dClRhEzVX
	jgioZ8fGYjBSFcoBmpBA7RwIXeS0DfFo9h5gepH9FVO0rRihX1qag6E1hs/xOiZmW7oj3U0huQq
	dlIZd/kj2JHK2l7f1nAilWx98LlU7RyRXlwDetaZ6Jp0t+D2o0MJf5RddpaJGx6lLk065moRb1x
	Ek9QOIJIuCj9zfDvZ17RHSjOWaedM9Rw==
X-Google-Smtp-Source: AGHT+IFBwGxPLPPfzkQid/eqWAjFaBlrJdMzc7K78u4G3kBOTKirNH0Ail+EfDwQ7kJAYlz2Kk0KMw==
X-Received: by 2002:a05:600c:4ecd:b0:45d:d5fb:1858 with SMTP id 5b1f17b1804b1-45dddee8e80mr94844295e9.21.1757418742913;
        Tue, 09 Sep 2025 04:52:22 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df16a749fsm16413565e9.19.2025.09.09.04.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 04:52:22 -0700 (PDT)
Message-ID: <cc9a5ee4-76d5-4efe-a39d-d4ef240b2aeb@linaro.org>
Date: Tue, 9 Sep 2025 12:52:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-2-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250909114241.840842-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_125225_342433_7AF1EC53 
X-CRM114-Status: GOOD (  12.95  )
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

On 09/09/2025 12:42, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add device tree bindings for the CCI controller on the
> Qualcomm QCS8300 SoC.
> Introduce the "qcom,qcs8300-cci" compatible string.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 73144473b9b2..d50359019501 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -25,6 +25,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - qcom,qcs8300-cci
>                 - qcom,sc7280-cci
>                 - qcom,sc8280xp-cci
>                 - qcom,sdm670-cci
> @@ -223,6 +224,7 @@ allOf:
>           compatible:
>             contains:
>               enum:
> +              - qcom,qcs8300-cci
>                 - qcom,sm8550-cci
>                 - qcom,sm8650-cci
>                 - qcom,x1e80100-cci
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

