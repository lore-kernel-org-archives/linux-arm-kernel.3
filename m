Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81181CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 07:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=; b=UrCBA+U71/sCv0VBbDulab5pLP
	l81bz9tiBHFIaFxjWc28Ki4R/OMf6SuVzO2HURSxdfYNIhF+894XezoVhooqrXdEyN7nvHkM6S7X7
	mathmSXpU6CHSawHTGn3j+kU1EfaUdOsr87RWMsEnd3bfSaYh25aBWxtq9ijTy9VAjdLiGS/rGO28
	XiA7jwtkp8rqIff24WXxjeHx1EHT7HrLxRPe8rO+4CBvkKcUI30FsLKYCukwr7XEEmeMttH/Pu3MH
	qg4xkB51pF7hpguG028FzZwyDgGZOakBsjnJ3BYa/cUPC3GkhYQU0zMsWtjo2GP64/+kRTT8QuVeK
	6ZK3B43Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwhp-0000000AVkS-3jnS;
	Fri, 12 Jun 2026 07:53:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXwhn-0000000AVhU-0IZC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 07:53:32 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39667fd6773so226261fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 00:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781250809; x=1781855609; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=Xr8wEmpNVumtawOHhYNqLUBQVQxe4OwKIbAMNieLuaQsk2wEiW/ocRH06cqcoS0udt
         u8StuKiehaa0xl7Lok31CuZACuglWjeeOGLjxLofrSihGPcRMl1VAXe9Jc4UjulZlHwf
         0dtBm0vz85lSCHwqFs7Yq1PlXNuC2YiIjFZZBXH6DyKDyN02I/gJt2tzY1xdiLicyXmf
         W42/1KUpJJHXTLpU6yWOxBzEBPJEVSJdj8T7FVi0kKM3KA8ixSWXgdm99Z86cFlon7En
         8W2WSFqQ5uH0n6tpJCFfdhIIGF9kWz1pn6mV+Q1KS58VMVZMubI9c56shy+4ITW88hb7
         MlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781250809; x=1781855609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=167FyBYxKu2R9OXqpMqI8bsA1a709piqQ4Ou6o89XRk=;
        b=eVYVoLpmQrEYqSjopBXE+mYle03id7vmXbc/4F/uphAwwR0vHO55DZJansuseQMTOp
         F9i9K0pRm1F3blySOGtwV8ponCzEr9eTCg8bYNZIL8pTbr/p26LWA8cTFLFbTcSwuFg0
         7Vd+IF88TEnSPsqcRjFnzLSaaKts9ZlqntKjIN1nE/7UuSXIxQhT2PbcwLHrLdnQwUHT
         wquDw2EW3xSroqloWLQRGbcMMJ5Dt+tu+hvtcgxk5tPtKGEN6vS0Qbvkv5lJyN9+1X6o
         ITCA++uqRWv0yMZP4UPTd47hQQt8Bj0/4CkZZfMHh+MWKfUUgEXLMfl7pMAFQbbssc9Z
         prBA==
X-Forwarded-Encrypted: i=1; AFNElJ9sPU09g0u7bFGbXREgqdmxBSfT1Qhp37meKS7Taxy2S2oA0THLfVM+RCsV2gFxNxP6kb+w+pWGooBrwTnTpXpX@lists.infradead.org
X-Gm-Message-State: AOJu0YyPYhIIjolc4YhhHQ2fsnvjVJMYDmVYQpbeEfqMe8cUYZbv4f2K
	B48Y0tHfx3IyRlhCkNg3g/4hNxBZ/+1/KyxPDuG3yRGh6ZRun2ejU8u5PBK/QUsAReA=
X-Gm-Gg: Acq92OHKRV5oBcMWfezcvnS5XyrY2FD4kazeuwvqMqoWyOkpdc6kdNEzhQTuvlzV2Ou
	G9r1Tprhwq1gMtkKHijYzu1SRvTtX5+b23BXdKF2k1L8RYSbs0Peozu93GeaTWLLv1k6PS6fwss
	I8FmhFhpfjo7DVQcbJ3z4ohP5vMg6z8o2BWQyZl2mJZdSetLvfNUhZ6FmfrcE6sR8SYCp/TUuoG
	rDO9uT6Egfcl6GWntExrnV/HjEiy2DBzVRkLKHa7PByV+LiNmqtB09VJQ0x9f08cHpzvDo4Mg0r
	Pupl7kx5+VmZC1pOCTjl9sXItAbpp7HPlbsp5g+lZUoUskW4CoUHUVymSEYimP4P6iogu+LuT5j
	wFmhUuTrPhYANoin1CAbVtkHPn5RLxJS4lGfnQs/33lOgS0ONnRzIYoK/dfnj43drbQA2aTNxCo
	CLCSiuWHEsI0fUde67fWU411g/9l4uDhmCJk5UARWh5gLt4nypxCKquUXUd9rbL75fYcRv+96Xx
	3CLfA==
X-Received: by 2002:a05:651c:890:b0:396:7fd1:f574 with SMTP id 38308e7fff4ca-3992b03d73emr2255821fa.3.1781250808762;
        Fri, 12 Jun 2026 00:53:28 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f1891asm4038351fa.21.2026.06.12.00.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:53:27 -0700 (PDT)
Message-ID: <a63182bf-ba40-414b-a630-511e97938529@linaro.org>
Date: Fri, 12 Jun 2026 10:53:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_005331_503370_FDD3CD47 
X-CRM114-Status: GOOD (  13.86  )
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

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

