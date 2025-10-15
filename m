Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4441ECCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 18:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=; b=MLUgzHTf1+I6O6NeLOOJ+yUlBY
	6xJ3FCEYYAJU26lmO8EQ0/Of2gorRkAoQlPV/ZXE5gXr0Nh6ENT2+HwDQrQ7782zvqrSwOgX9Oupt
	1lheqlyUw4pVXtZzrVyHAlk/n7Vsmhgp4RUizAQtEWvduAnv0Bbh1gLQ6YTcqY850CTEu8BwSTDsG
	bYouXar8q+YaWYnGmSnYR78r5SqXWdMA8bTQFOClP3CjTzRoQerXajhJdY4JLU6w8Ds66MXsmjev0
	QL57962IyDPj2CvQf1V4gJoCvhqAa9yA+V0mLtUFirFcX0eM6pDOehRGU+ymsOI2i0fkNbJNZA1XH
	pVLAi7wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96RQ-00000002dig-0DCg;
	Wed, 15 Oct 2025 18:41:40 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v96RN-00000002dhy-3J06
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 18:41:38 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-582067563fcso1144199e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 11:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760553695; x=1761158495; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=uicdDIUq0cb1qxWRzf9Mi9BApyE0t/bN2IkysghHwAaOrOkyHg6A+dcO1myL7xLkxZ
         BNKuvPu2XHMCi6s9Z/oh+iwuG2OZ9ENzjTf5zduBjdCANOk+RT/4ozGUBRw4pCkz6EGV
         dfZTSQA8781O032MwqMBLdJVje/GOICaJNGet7m/143kvpLaM2yXcs+VmNX3wiz56Rkv
         s/b63UbFSZElByVFcJzRg/l5NktgKnDY5sG9dWbQNsoo1mIGbqL88V9TLVmfHi5xt5FW
         ddUOW7HxUPGO/7RXeHklFmPMKJ0NeR4siuTQl4aoE6W8fiaXm2Nyxl5du4MycUjY6+/g
         UfMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760553695; x=1761158495;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tJlLj6BAoxjVSk1NLTz6D1jxyQjoorCPPfMJr/rohBw=;
        b=Cs8E2CDKjsmDvnJZerikQTYREMIZKLYQG7n1isYm9sVZnDxWhM0iaqXsLx9h58m85l
         bvkqeAsSjmiEe93MNFHZSuIM1vbe/M7cma9x2356XVPPEe2/fNUiwrohUFdKoFp1mnaw
         X6gAowRE3rXgleYmP8UjNMYQfKfgmAS/+fWdPDsdA1rart4GDgMbpKh4nJGxoX+i8WFc
         9lRf+MExrOp2r1e3mQi5j+zrmlZ9ixKpYc7ZZwHL6wU4ZgJ4hTycp97lUFuDT6ZT+0oX
         0VnjnPK4QrBTi1wYOmZD/y0TV24rr0wnbzI7fmmVGXjO5KB/MnXQtErrwCkdzs4fRzNB
         Po3A==
X-Gm-Message-State: AOJu0YyE2YzJX893kDepxdP4xtX3qvoqmBejGBQ+aT7/1m21vlMgPlT1
	Cff0kbGiWUrrMaflKKhyNGFhzKnES9xNk6MWQxVb2qZdCfTEndB1jKLWOpDDhB34r58=
X-Gm-Gg: ASbGncszmkIsdsmbd7QBx7rMM+bsO5j/00TxdjFciDyjY/p5RJxywjUHilF1W0X3b3y
	nUMFt9823Yt3PufRbIuYjfKfaV2wGNaLCAl9949GGcvhF/UNP/Dux9AKTYXgyF5pmLhmEoHruV4
	CSsjsHILgOZGIPZkQWgcpzDfzQDKdCqyiXdX+0Mg4BR/p6rgKWq/aCinRbBUKT+Zp+3rjkCkGrV
	T9RLB8et7u95XuvfOKacCmZLSsdfMi/ChEPpYZCNfpx1XVAS/Qly+QfgFIlsKLT6QqN7CJUoH1U
	EDMby36di5er9PUvlm+oF6jV+5YUhRVpApqK8jhICSWct1ZRSsorSub5VNc0lkh+iD6E6BF8l0N
	ccABXn85bqTVlTz/9wnNgTPvQtVxYFtU/te3liiP595CSlJB43Wgvr18YKq7qZWCnbz8xkjM0Gd
	0zwEHLceXIXPxlcixLh//GuGrwrBLaePphCeg=
X-Google-Smtp-Source: AGHT+IF+omlnIj0VW42QBPNVZc431CsHdQ7EPsBKi1Mx1WFqeaAKSz1ndgSM5DbxSPhZLcvdHjBrYg==
X-Received: by 2002:a05:651c:1987:b0:36b:9ecc:cb62 with SMTP id 38308e7fff4ca-376099f239fmr41529381fa.0.1760553695443;
        Wed, 15 Oct 2025 11:41:35 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm49223291fa.34.2025.10.15.11.41.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:41:34 -0700 (PDT)
Message-ID: <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
Date: Wed, 15 Oct 2025 21:41:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
To: Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_114137_856254_E4BB15CF 
X-CRM114-Status: GOOD (  18.43  )
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

On 10/15/25 16:01, Vikram Sharma wrote:
> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
> CAMSS binding to reflect camera sensor hardware requirements.

What are "camera sensor hardware requirements"? You do add properties
to the ISP.

> 
> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> index 80a4540a22dc..dce0a1fcb10c 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
> @@ -120,6 +120,14 @@ properties:
>       items:
>         - const: top
>   
> +  vdda-phy-supply:
> +    description:
> +      Phandle to a regulator supply to PHY core block.

What is "PHY core block" here?

> +
> +  vdda-pll-supply:
> +    description:
> +      Phandle to 1.8V regulator supply to PHY refclk pll block.

This is a copy-paste example of a known to be wrong pattern.

If you open a QCS8300 documentation or a schematics of some QCS8300 powered
board, can you get a link between the actual pin names and the introduced
property? Likely there should be nothing, which resembles "PHY refclk pll
block" over there, and thus the description of the property is misleading.

Please check other similar and recently added properties, like it's been
done if you add a voltage level reference (and that's the only known for
sure information), there will be no need to guess the right voltage level.
And it's either incorrect in the description above or in the example below.

> +
>     ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -160,6 +168,8 @@ required:
>     - power-domains
>     - power-domain-names
>     - ports
> +  - vdda-phy-supply
> +  - vdda-pll-supply
>   
>   additionalProperties: false
>   
> @@ -328,6 +338,9 @@ examples:
>               power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
>               power-domain-names = "top";
>   
> +            vdda-phy-supply = <&vreg_l4a_0p88>;
> +            vdda-pll-supply = <&vreg_l1c_1p2>;
> +
>               ports {
>                   #address-cells = <1>;
>                   #size-cells = <0>;

-- 
Best wishes,
Vladimir

