Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2980CD3E79D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=; b=TMTIu/AJ42E3NlaU/La/xkcmg9
	NdWzBqnfv/yyT/gXJdxEFFtEozNc7FBdPP4Wx5H5/TE70vNBg/ap/XdFsuvnzIvVRa3qyLVjkQb0g
	75qE4pR41diKlsoGZVMDjhwx+zXlbl9SIDrCQLOGT9/qspFwrUMuBqHUy0oiLdarWE3Fw2GuywCL3
	/syEP/FPzG1Mjoos+ED8oHMujC0Uy8lxRd/2ZM0zJNtrrvD2Ss+6ZeNJ78vfsL8wUzwka512dSrat
	yTy4QbRAluLWRDkWoFyFp20kggNMfEexxS1c54mthj+3MO0czHZZJb1UeMCeQlyQpummGDB8J2XLw
	fy3nze/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbDG-0000000GKi1-1sj0;
	Thu, 11 Dec 2025 07:35:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTbDE-0000000GKhU-1VRK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 07:35:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALRSdk3701314
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 07:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=; b=ljBaAdt8ofjlpln2
	NRTKr1GoLJ77MONpQ9sYJ/yoR9+4gNC8bgAh0PqsGnio+RoNsT1T++/rQS5QdPnV
	J2crG5Zfo/KdVSZ3rOKm2/FlkUFQhDO7zXk+FcN3/QHJN2AN2k3tStwhzXIS5nkJ
	0IgcMtvMh0BXQbyuJ0ri6nHStMhpJqWrbCjngsfB3PYM8CdZGG8WlzJMT3pgV/Jw
	ZuSlbyTuAnB5/uJFy5YmcRR1upxw6B1W5ohiPUzADmG+LIMrVdZYsWEfNEvunA99
	YI9mdAgBVbFYYMQ2HXDsMA7Q5Y61E9r+Xf1CsbtxYOcxXJHzzuTsCmebfsY5rRJB
	DKk4JQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx1faf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 07:35:43 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso979061a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Dec 2025 23:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765438543; x=1766043343; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=;
        b=H5uPOm0ai5mnPjkwIBoiUhfizdAWJRDm8z3TmXVDonchAyI7d4Z0Bb05GV0FHQp3Rt
         nnHJMb2nLk//6CKP1ISpL1Qo67e7f0dTMpJGmmmg/bGdcyrpOouAaUluBJELYo2P8mnk
         xR6aisfkl0B0hPALEqexQaLIDSfJS66+i/G3zIqCn1iOCpDbLJn/tLvR9cVs/24/Ebcu
         N+YxsJONjo4S0aJwcndhP8gdICbUo3S41FPQsfPSFfe+fLqS7ZWG6VBmr5bKrRo23Qqi
         HyCCFdo4DcywaT76aU18ri840arfMXRGUO8jBXVlm5dWdU0dTrn9IH2euzkoZQ58OUzt
         KhQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765438543; x=1766043343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DIY8edF0E4U3FuA9JYM+rHVY1TkCGGQQltlBEhuFt9k=;
        b=i4fHjBLDKEB3OmWhfo5Z5eqKkNQNx/j6mcFG3y3jXgA/AGOfSqy/tf3v2C+sr7Wbc/
         GZMDefcrGnvnBBmL8rjmY8Ku6ld7FPw6ZAujGqEUsTmRVLgHhECMg0cvXOJHooXa4CO9
         0edn5akX/Rj9Cq4D6KxFPYg5nIbqYx1cLVxGy+TQEG5CaVEUAL6tacHzwCsBScNsWvs+
         R8UhkR2M6c5/hXwc37BQ9T3B600g/LRfDbNPeK5Hxw1bR1dynWxkUH26kFwg79NZLCt4
         549Fn+KqFl24GL67RtajLsNO/JoYl7dM4gRTd2OU2hY+Qqeq2D31kvR97CtS1zfiwx7J
         EsBA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ52p52W7kjxQWRAOvNRDf74jDFE53jRScpzr+t9F6yBL8hmt9D+Bzkrr4B7uKW8Z6P5gS67Ml1u2p9KpatHL7@lists.infradead.org
X-Gm-Message-State: AOJu0YwFWdvfhEfsSqQ11ESWnJlP+/5jz4cpJDThR2TFw5KHIDxQzYGT
	BLd8HMiG5uCtfOpbp2utryUtRijO5YfZ5+PFc4vgVFSMNF0kTcfUUuI+drV1dxWJ3nEUForfU8Q
	3iJG/d315guD7Gq7zlzI0v8tDNn0UPy3EL/kuSQlfiPunsjqtM+LxBn5k6KbgI809XfRjlkH0pk
	JqIg==
X-Gm-Gg: AY/fxX5XS/L+DVSGCCsxNPH6hdzY5etQRh1sK+BSvyk7lyTSRFTWMyseKPeoxe2p1jR
	APqHpbtF3yqDPyhkkGnxPIJ/PQ6lzlNSSdp2nTgstzEN89fnWfh7uMEGAN1LstdGvy+EAjFj9EZ
	wtS83hmcGfjtU2s9/nCMwxMCF83S144e2TCOBYC0z3A6cNzqZVaYPX8+YzSQ9rGw1EAWYWNhh+h
	Oc14eEL7y3P75oOZOm4pQlEXXg9XneXdsJrxpJ0U/92Pamx35lnDPeoOwJuyFsPXjqSKeankGhc
	7BgtFXA60U3TKXbVA0J8nifTqe52mcE1zpqXFBWWltsprcuLZwnugtDEkduES0T5puF/IrN1Muy
	xP3/nsEnmyRyLRaz8xIPqxs8rdKyqqjI2tHrzGty3Kd8dB4zYCmD+bsQdVbazW1VbAKY6F9wYqX
	8=
X-Received: by 2002:a17:90b:2e42:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34a7281d762mr5366730a91.14.1765438542521;
        Wed, 10 Dec 2025 23:35:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGvIG9rHKDb3pmerPApO4qZcY3ni6sXBrpH4zkU8qilpPmVJXBVULIIuqu0qMtN5qRAsrbSqQ==
X-Received: by 2002:a17:90b:2e42:b0:340:bb64:c5e with SMTP id 98e67ed59e1d1-34a7281d762mr5366694a91.14.1765438541736;
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a928381c1sm1033740a91.3.2025.12.10.23.35.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 23:35:41 -0800 (PST)
Message-ID: <44b8df0e-2786-420b-9402-ee19f4cda0d2@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 15:35:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        James Clark <james.clark@linaro.org>,
        Mike Leach <mike.leach@linaro.org>, linux-kernel@vger.kernel.org,
        coresight@lists.linaro.org,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        Suzuki K Poulose <suzuki.poulose@arm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
 <20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com>
 <176543802198.60924.10267408914731981420.robh@kernel.org>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <176543802198.60924.10267408914731981420.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FCPcaRd4J5mMjp2ZkutQT7R-3Zcozr6U
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a744f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0awkmHLjsCMGZ7zvgVIA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA1NCBTYWx0ZWRfX7u7ytiKWNNH4
 Vaq3afTWTgJof/Mn5tGtObxnilNG+LGdP23qswcWXTR7HcRvk6Ha8wi+trpD9fXioMGlecojN+M
 oHRQg4rHuGcc8vsUvxMV0yOtrahUR5XG14Y18SFHoOkAEj1sAKhREALeb6LzS6HtF9aE295ANTW
 3vAAj5xFw3Ry7lzFvrbo+fNUJPn4G1knEcUpMFlgv8BV6PJu6sdlU8oCDxB09mV1WJaeAyWdCvM
 wuMvjei/rGLp9UnSeHAiz9yMaA6lna8YIpTq0FK5txaSOTmyFWoHgN/FI6o14D1Yue161u1dXtj
 DF2Rgvo+WmF3ucsJCAcFwffI+Qw7BBK+XT8yTS/8atu1upY1ZbFJvPtSzKaKfX+agrx3g9tO4Pa
 cvClEOVLUhfGjulZZop8R+le6oUS3w==
X-Proofpoint-ORIG-GUID: FCPcaRd4J5mMjp2ZkutQT7R-3Zcozr6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_233544_419413_BD689559 
X-CRM114-Status: GOOD (  21.14  )
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



On 12/11/2025 3:27 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 11 Dec 2025 14:10:44 +0800, Jie Gan wrote:
>> Add an interrupt property to CTCU device. The interrupt will be triggered
>> when the data size in the ETR buffer exceeds the threshold of the
>> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
>> of CTCU device will enable the interrupt.
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Reviewed-by: Mike Leach <mike.leach@linaro.org>
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dts:36.31-32 syntax error
> FATAL ERROR: Unable to parse input tree

Will fix it in next version.

Thanks,
Jie

> make[2]: *** [scripts/Makefile.dtbs:141: Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.example.dtb] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1559: dt_binding_check] Error 2
> make: *** [Makefile:248: __sub-make] Error 2
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20251211-enable-byte-cntr-for-ctcu-v8-5-3e12ff313191@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


