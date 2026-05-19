Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA912CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=; b=JBbXxxJ5KQG8XtIR7jFwpA+pn0
	eKNnGGSyXFSAIZAU7+X4Y9SjhVKfRDNWxu+/TwG6b+W7CG4hOB+rYJx46OEsrgR4pn/9p8FymL3ie
	yP4uXg7BsHZEkfqBOYbUBrzI2318U89Pu2fdgaDxyeXai7E3NZzNqNfa5519O5QJXKgCP9OtTxzWi
	96In2DUFHyG2HpkmyC9VOksLRkFGc9dn1CWCV6FmsIecMWlQxWWVkkZ63rWmo53TpxRm1efBRecRd
	TKvviKmbpJVWDsw+j56ouNyu0auQOk9bCDyZ7vUlbotjEyHJNWshew1hT9PVX8frAv1GBwacpHC/q
	HcolV+rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQim-00000002gW5-19sr;
	Tue, 19 May 2026 20:07:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPQij-00000002gVT-48Zk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:07:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwh3v1725496
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=; b=KsWt/+AyyZ18HDOx
	3R8LW0sLoYxT/yBK++2NzOnX6QsXBuM6qaIFxOhY9uM0QMxP89hsXS+STtIVIjZb
	q6Q+66jkiZi6a6AKeFu3gMWazqKWXFocy3QtkjQkRc01JXxcGT1V42WmLUq7EW4u
	c5DVIvmzOBUshd7rFamrs39ROOZ9oi2QGNO57J63HrrglLeeMaqeRUHznzVrYKop
	4Y1viN1hJSt6mj0IHah6oSkP7Q4D4z7+hLGJT8DEM8R2btZAPkrUCgywyxKI2gZK
	udS1x+f4qzqBb+KvCsEay/rZSX12ClS+9THvcYLnynXzpb8IEKMkGxDOHhHnn64L
	syErBA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qhad1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:07:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5758156cc93so4846290e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779221236; x=1779826036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=;
        b=AwyJNCSCj0afHc8FSsTizfcMlyj7Qo6GNkXM+MP2RMEbMeQDCs5vvAYxzw97S5Bt+U
         hIE8siL5A0Yx2NV9eYDHgT6cdrpfvka/vl7bZuWPQ404mllyw+Ywcd9EV/qnivU2dnxE
         K8LDL4vxuh5x4RkHbfm+3GUX98pmn8yNN0ic3wny2oVf13Ir4eqS69ZKghpG0At210yZ
         96x5agCclcunRF+++r18T1cl35y2kNsggUcax0ctom2xDNzUp4c+7z1B13uoi12iaTWb
         lLV5rQwVDF4MHAVVFx08vfEP/R8JPx2m2cyaYp6obcX6ri677kE9tWVQLu+/xfWWIzyu
         qNQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779221236; x=1779826036;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ba9sE4umteuJuCK8CmKc37MvnxwnoKBH6bwhBFlN/h4=;
        b=ok5NWZRPf6pw6wkqxwyvgyAnczx/1G6t+YJD0p+gHjfPsZw+pVYcN+vwAp5iwposHn
         YeYS0XoXkI40K+ANgQaKZc28JsSnhXxb8+JMw+A+Yv8vVobhRYf5Ew5BOtWpwRXRV5Xk
         3FKo2Ofi3nh4HLeY7Nk4//rfLoou3XRFmPeOuYQSvIOxBcm3E2UzpePX0PNzRickh7Ue
         RqGkLTQ7MBb5dx+aqakvxUNk7w6398oPYtU/GHV6o6WTSP4UH+Vys/Dji3NMsLzAwx7i
         1kU6WRV+PiWoPnfeatut/TjvwC+aWtb/1ObdnTrUdYjo6laL/GVfqx3ipIPDFFWbJ6U7
         +Efw==
X-Forwarded-Encrypted: i=1; AFNElJ+czteWm6mwMV8+0kb+wcKSclIb0KViFoZyhXwUhwqy6Trz38lSXeq4xxcMj3ch2rEwiQF8BzunowEg7JxCo0j1@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4veBFhZ2/IUTXUYXB6D/YLGHcmJOr/6zTi2hFd1XIoun0S8yj
	iltz3Tw7BY1aaOzp73I2a4DeF4RjGXkjCmWsjVnSIYbjuhj9QcXa/MOULzxqxfNHcQU1mawovDn
	9FyiVFnnnp8vndEoxFtJ0lahCuwwi8kTTVrQ/G/zAmlFhNQ5NyZ0VB2VVeyLcB8j9gCEioS+I4q
	iphg==
X-Gm-Gg: Acq92OEWkPf3lJ3sO/9VWFB9v4+BgThAYSCrHJxoUWKjtPiV4jGAZVLVzQRPe1VTMOV
	NKt9tZxSU3vN2X352EatACIyXTIandzaPePnzDLJapVp21xVAYibKXmvb9bEm703h56P5eNXAQy
	85EPf6caTItz9hUjYrxqIpX+K9kZOSoXbNOcZm/XxpmXxE7V5vZlvauytQ5iAyytvwE6xECfswQ
	ItYIhHwHeBQFk4sxw2VsT6m4p36D5jUpzxI2cWT0KML+1iD5mQ8ub8/FQg8wt8/PCM9zuqoUlJt
	GXUVl0Vjnp4n+4MUHHvYndBb47Hs0qmwyFEp3VjXnPqWmLIwk9TZwfMjETsKpxB0wmGBZJHu0ks
	EcVNvzq+jXCe3Ah6PTg2Rmi+LoJdh4Q3JSLCjh9h/5eYt0rnng+XR3jZqm48=
X-Received: by 2002:a05:6123:128:b0:575:d035:8cb1 with SMTP id 71dfb90a1353d-5760c096bc8mr12568325e0c.13.1779221236376;
        Tue, 19 May 2026 13:07:16 -0700 (PDT)
X-Received: by 2002:a05:6123:128:b0:575:d035:8cb1 with SMTP id 71dfb90a1353d-5760c096bc8mr12568308e0c.13.1779221235900;
        Tue, 19 May 2026 13:07:15 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feae166dasm131131645e9.9.2026.05.19.13.07.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 13:07:14 -0700 (PDT)
Message-ID: <e8a78a17-7ed6-40e0-9da1-2e70be5560f1@oss.qualcomm.com>
Date: Tue, 19 May 2026 22:07:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Constrain clocks for newer
 Qualcomm variants
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, kernel-team@android.com,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20260519074059.61405-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177919680700.851863.10253442471292780349.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <177919680700.851863.10253442471292780349.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDIwMSBTYWx0ZWRfXwnPZj1IynhyG
 h1NeYPAh47QkKezdbV74zKlPiH/hfYH5ZMooPzhNr+8YUHbQOhbINcBklJwhnGbkhgp698fWBHw
 kj7ByxjV+907WNwycdno8pKs1jbS2rHTXfGlOsl2AGQpMc/oA0IEZnvOhO0IM+FSGXjkVl+ds6P
 YhyAajKJcwjs44hEpoldMrYfRtqSpBsYiPTUAzIQ0AmT5AjERep/3fCnYWNp/PByx1w+s7gUiXD
 pB/cGicUWXOZ03NysRm08Xj2rVCJ/G8HJddGPdsJsnXDvzyPOfhc6NbA/O4EeXRCRsHd01waBe7
 AxH3pY/6y9jDJf6+UFXxdK5Yz/uguPTmcPsFcy6LMrFoL8mWcOBsDYtt0DguYyGMHNNCtGTmenY
 ori4cSf5IBhlASP81FprotjiO5KO9uw+gh5HYZU+A0ro0NNn80oHz4qqXWr8790ze68k+pkNfax
 7YRbvV5o89Xnw9Jl6jw==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0cc2f5 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=-VkZa0qGcWT4bW_tupkA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: JVW2IkylN-hfUwlRoVCdXRJ87Lv4qEll
X-Proofpoint-ORIG-GUID: JVW2IkylN-hfUwlRoVCdXRJ87Lv4qEll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_130718_033389_6ED920BC 
X-CRM114-Status: GOOD (  14.56  )
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

On 19/05/2026 17:23, Will Deacon wrote:
> On Tue, 19 May 2026 09:41:00 +0200, Krzysztof Kozlowski wrote:
>> Many of SMMU on Qualcomm SoCs come in two flavors using the same front
>> compatible but a bit different fallback:
>>
>> 1. For application processor, usually without any controllable
>>    clocks,
>>
>> 2. For the Adreno GPU, with some controllable clock(s) and using
>>    additionally qcom,adreno-smmu fallback compatible.
>>
>> [...]
> 
> !! Please note: this conflicted with the Glymur GPU bindings update. That
>    was trivial to fix, but I've also queued an update adding
>    "qcom,shikra-smmu-500" which you may want in your list of platforms
>    where clocks are disallowed?
> 

Thanks, I will double check and send a followup if needed.

Best regards,
Krzysztof

