Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A475C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=; b=CnlL8oi282rASofBBIPpmT34v3
	GtTIsNYlmsW8PT2EQdTRM7OiPjUwp2gdStzF2TV2wXq0dzk5iuxYhfg57dX6fLv8Cq2d/hW831uq7
	rNTiKZR8NPMGwDG8ZCVKi6ESRYYcAGJsVYnyYl2zjvdfZowfOv1FuC8T60u2tmMeuB+4HOZEjsXDd
	0kFyhZyhp0OWgJ8l4Vvr2BqjiTs9tmoggqLd8Rt3tH23g+P8+NmwP4vA9EXp84v0fI2LuoQiydN5Q
	8ulWjuvWZQYABdQ92wb7JHHQYzie6EdR/YYWR2SskRcSHi0tT0pkAge+iFmgsdkBndF/1oTzInoxK
	M4k1gQ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VkC-00000007NFP-07hO;
	Tue, 15 Sep 2026 16:10:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vk8-00000007NEX-1MAQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:10:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAb1R460718
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 16:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=; b=hnBKmLPc/w5CBx7L
	Hq7kQEDW0G5F7lCOkAJgkT5xBUbGtpZhr4bPIZNsh02QWms7UwsbelepREjSlbPg
	2a1w9HjYLi72sAHL8Hb2A9/VrBvc6fiR+uubFtdB1uzi1PvRak8YgvmuL6O9sJwW
	3LPUJ+NVYQo00kXQpcOasvbhhAu37iErP632hLUROCES/gNNta3gHuEjK1bQ5KJS
	9JBP8g0OhcnIm/aTtPQLvco9neG4H3fIh9vu61JN6Im6WJE2NN+NskYYOt0nNJCV
	CpBCitmwGkUTYYrBlq+UH8g+SuaxYBO90xMzZ3znQrtZ2HrYM4QbQqhBLs7Jyuul
	BFpFiA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jetm2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 16:10:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980989f5030so3593625241.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488645; x=1790093445; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=WMy3DOveRaamCp07sUot1OElLJJC7Dyyyp7mV0R3eWpL2GNix0nU9K968uVsMs/ii+
         W5waKFeoRvg8h/FMcwQb5QGV4f1EsH6/FBhSTBtoNsF0DXatdUJvWl3Kow439FQaNeDI
         4GThLxr8A0ms/osWeiniDHOuHYoKzudbx1DYg11ACgJmwnzxnyhu9mmBGWYTP6jAKIFt
         T3hWjcVIJhXbXPrEcmZxhVUo1J2M44TNRvEFv2DJl3hOegGJ/x41Th80I39eLSpNKvyS
         rYKXGdsxvwHm02gbbzslU89TAPfBe4BG0DcXbwmAGjrLaeWT6+a1f0qW1uzFR986d2OP
         JY/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488645; x=1790093445;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TDiG55CoXjTJx/VoxQIpkqirtSnmUSM30sr+5zJ4CM=;
        b=ZUuRGdipjm70OFSdSBE73XFpH15d3MxcvvbaOEQGNMEHWW5ajfmnGH9Efn9Z1ESP/C
         fvftcbkVixZVll9Nt8ZuxB3SCQAv/BBQHEBOARflu4inHowHptLclNVAm+obqAByI+pQ
         flMer8H+YVKm41XlFdWzMlMkxZ4imrclkEHChrajZ1P4aRtHUYivOUBfN7gw45l1+6Ek
         D/hWgYXLbB3iMAR1tDSCnrW431+MH276DqjBHUzSEzP+Y+I2Lg5Y5nTtUWtJenExjW9J
         amLhwOPhKNTaY3Em1DYVhuDMmku1kE+K4f9j30apHkCh4pq6xF11F+QTciPoL6p/Awic
         H65g==
X-Forwarded-Encrypted: i=1; AKwUvBygZePcofcGQ6MqmFN5JYTwIvPPKTKW8XPbWh97H6/SYjkX73eCOZRRLVlVlm3mwwYXYGzsqD2KlT6xbuB1HUOv@lists.infradead.org
X-Gm-Message-State: AFuF++kNRwKLxaIcJVoS87Daa9FW6yVwH/zCh0iByy5ly172BljLXKOi
	UKoJs+Mzu+2vV36qsviC/kGbz1DYyMlaxhF0ZWHW7qdPGK0BmROqSIuVSX8/0rg71uPwaiP0ywL
	3lTOPRRFZ1ZAcXCgiizHTmfYsAJo2RUQlSclZO9due014Vwb7CFIe81M1iXk/7rtg1NJ3dEHAA0
	Slgw==
X-Gm-Gg: AYBFou20vkgtfajk3wORGFAWFpjm4HSQMVYNG/l5t7W2fxdz6wBAiARJdSle8g7zLWx
	AcxACKUD8bpu6OZHsAOICYw1CEomgJvu+atIsdbcWz+wljynyR//xOmTdjChgLiaa6oje2nORxL
	+9Lwub32QzbEy7V4voTyOh1+9l7M2Kd1sxCjJa0qzaIIAkG/dTn+DVdqJmO8ds3uJKiasfnTw8l
	u7vbsuAjxZI2jF5PqGWm/qZtL+WB8fWtfpslbE0KiJ8DEbx/AhvHoop+LI3i8FnTmeX2gRlo4e7
	P7Hp1YhPsE9qLchUFosdi3+ybJCbZFT8Jy9ZKz5uw4ZwIS0lP7MshBj0w3/PlUC2jeiHPASCA+c
	uCJ0U/5HrA+qAbq5d5jDIGU0hdqVW
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251467e0c.7.1789488645593;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
X-Received: by 2002:a05:6122:885:b0:5c6:6c75:81c9 with SMTP id 71dfb90a1353d-5c993c753d6mr3251376e0c.7.1789488645134;
        Tue, 15 Sep 2026 09:10:45 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fad3sm78795f8f.12.2026.09.15.09.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:10:44 -0700 (PDT)
Message-ID: <d366d3b2-a054-4945-8c02-877921a6073a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:10:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP
 tables
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
 <aqlbFwMZp_TAExFq@SMW015318>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aqlbFwMZp_TAExFq@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfXzOLsc0G60U/y
 Yiw+gvq3UvLzYm/YjZEx6VNtiEBOEcuKJJQWOzDt9UCeBV6bgFcgaVm+RdA3zLjXcci266VlveU
 gWZ9hAcp6TOmQj2jssvqkFi7DPGRvwo=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa96e06 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=IstA8FdGA62tgLsOMVAA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: EFaFc9_0KoFNIVhsh4LoYnPgYpQZRItN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzNiBTYWx0ZWRfXwW6NWlYTJjUt
 n09XTKIt8wGTR7pSdOF5D4QXsVS0QYqgsLuxE/FJ4qb51e6sX7aoh99zwkztE1XsUOjtDWkc5Jy
 ZtiRYdfUpYRiYeUVo54RWvO8YDw6+xpTFJcix4Hi/hVRy+VY6uaVOAewXmyp/mGprhrS4SkZZIJ
 tQnGS5moOMxfzmVaCg80oxsdXSaD1w35Al1vpTF7UDOdL5B2ASzJEVqq0qgyP9/nCKU7QyiU5Cq
 T3+kbQN1TmslLMG1hDLVUXg9COWVttLaGU7hgAIl1g+DqcQmXAOn2jjC7NQlr2V8DfWe38aYnKF
 bUeLG/jxz3SjZWPbUWY0Zz+5azjMuQA7mnt1ft6+H/lIM0EODm1r+dpFFqn/lcMWtJOfVNwIICn
 gWnVc8gLgDlfc1gWYPS6jDVA2bhoJealS5Jsx2KZo8J0ZFIhYIKXJM4N6t5mcnpfBBrwB3PjWaH
 JbukwHSmourBB8aqZQA==
X-Proofpoint-ORIG-GUID: EFaFc9_0KoFNIVhsh4LoYnPgYpQZRItN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150236
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_091048_481030_DB678670 
X-CRM114-Status: GOOD (  14.50  )
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

On 15/09/2026 16:49, Frank Li wrote:
> On Tue, Sep 15, 2026 at 09:23:09AM +0200, Krzysztof Kozlowski wrote:
>> There is no "opp-hz-real" property at all defined in the bindings and
>> new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
>> warnings like:
>>
>>   imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
> 
> I run below command, have not found above warning
> 
> make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8 CHECK_DTBS=y freescale/imx95-15x15-evk-pcie0-ep.dtb
>   DTC [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk.dtb
>   DTC     arch/arm64/boot/dts/freescale/imx-m2-pcie.dtbo
>   DTC     arch/arm64/boot/dts/freescale/imx-pcie0-ep.dtbo
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie.dtb
>   OVL [C] arch/arm64/boot/dts/freescale/imx95-15x15-evk-pcie0-ep.dtb
> 
> Anything wrong?
> 

Older dtschema?

Best regards,
Krzysztof

