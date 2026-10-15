Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484A5CC6B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=; b=Temx/SGPIpuDuAKPhMjw6e53wu
	A+vGq4T2ZXS7poGSL9LLehKpo6P0MZXfMamXfu0B0rHeX5beYVacm7+Wz7iiUrGtUIrWLSz+UNQH3
	wkatPZ7ci3NEhviIuoljmB1QMoX2NXZ0NnREMamtiCob/c/19ynhRH5Gi9eBidTM7j/MfHX3XwYNx
	T9PGGDVc9thqCkhSR+GJ1l6n/mrBDg/Xf5OHGjiSBJ0zPoqO4NdWkAgS6BNAF2Egl+GsrMPK+sZ51
	524MqF+Hqj5nEcc7zcVbKUg9zXAUoorhQ2PFVvNUqC+J4/Ux3SE0+HZ232QfmKjK2Jxg01i2dsVQO
	jeRrGMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIsp-0000000HT6x-1YCv;
	Thu, 15 Oct 2026 10:40:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIsm-0000000HT6M-34BS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:40:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgqt3510187
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=; b=a30+kFIREsx8Qgbu
	iEq6xPiywjQNZTCmMZHbL07xnHF/EGA7Z6JD3asLsAygukqydnnOjWlIt6Gzn50v
	GwsgS+kghaty1SObscPu4YyZ+awnZWbPY1CAq2tjrfA0smLV6ChQ+2keXbgsG1Gl
	DwsV2Aa3eWa9pKRmqmUiqAf7np4LGVk8NQbSbXIGqxlhJlt+KhRQNDEqJ6G3T9us
	pMiaPBRoW7zwEyioMps7ePV/qG8LkWgoipNDr7w7sr7WO9FZv+amzYzfUMqITyHz
	11XDo+7Cs6cM6xKlnt9P5LqfmZXjcdGqzD1zO2h+rTg5/s/FbueOY8ZcGbk7Kf44
	7MAw2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9kem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 10:40:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f12bb489aso5263585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060819; x=1792665619; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=AxIh8vj71hGm8VLR1o7oXC34ipN+NLGj8eAKV7snPRYneiMGwCnF0w1zIpvVwbtceM
         aBEp7WOaNtfK52HbwOd/GAxk4lCLsyUU+1+BNH3wVib6zXOfw/OOq87gsuIZ542JFNM2
         6wDqBv0u1dSZzyi5UJ1USauwcmIb/rhDLkaPimMOljkUy8v/lrbOk197xlJvP3Gmlv/m
         aCgIWhJV2v6as/KhE/lyJWxcM57jckyTPSvQluYs54CiowDo+t5VbBM87rQNNS0sJftA
         +8KDQDEfPojoZqj/yBsvYICvnymjVEFkLMkhBcyDU1txvtblHI7QriOb43L9o3HMHW/j
         mrIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060819; x=1792665619;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDkTEDZ+Tm287BcmQ0yabn9uz9DG09p/BFAOF4zStoE=;
        b=eAJxpSRbyT5zG61i+ZWOs7+wST1ypGZhqTuH9CQguT4M1qSOBHHbkp3YhdKyRo7dsi
         QJ5M6QO90BU7jhn1Xztv2pm+eW7UBtxwbTWPG0jsXqSyyD24/o5U9Wdmpaewfg8j+Ls4
         zzgmKJNmyo1+DNGP458s3Xd1VnomFeQTrgqqkL5aG/8tjPeWUlPRdJeJMiXQpzj0svua
         QwEyaGwBi6sZYu608c1jis/a4WyGESnITQwKl7CQOsZ3R97BY0o9Q52VE4BGGAy16Cz3
         Vb5/qvho0CyRGea+YV0T42Hofw82vk4g9hfx8NSpVG/IoGC/dIu1z7eqXM2Cb1ka43GZ
         6f0g==
X-Forwarded-Encrypted: i=1; AKwUvBzzHsJn+QAWz33wqY/6UMOlXCNi2wDJmKYkAJ8WNtlhMm+XHHOwCMPmoUVjuRNlsjQiYGwIPEwoCBZSiVlvP5XM@lists.infradead.org
X-Gm-Message-State: AFq9FYKWON2vLrVLSfjyVIz6INJ0kYeP5QiVIz5zMJi3+xitLhieaoXk
	EGNR4PxrMNchHpgKQJWaRe/VkMigAfHDZD6CSNMn00HcDMRADwCwjpcc+XGC92TNDJbPY4ayyY+
	t5vuBF1Vd1LjyWzi08ocJBP4FC6rwIsvtALDbdZzQPZZuCZwNbxQKLNBz80QPrFMwyZxAUerOAK
	7eDA==
X-Gm-Gg: AYBFou2FN3Q7nPcHsuHINHcs0t5q+6iLPrwnHuTgaBz4yDggEerIAEwdoYKxCrDkfuc
	H+dpkDS2ZqFoRWdD4eNRojf9YfKx9RD8Mx2PQ/oU/1A97ieqamGKRwzWe3q1w81iTY0N6wR31f7
	5OluyNoJQ9XENqSloec2tFQW1GfzfA0zYKRHHxpbyOHEnlvpS++RqNtyE4HKyjIRiNXTOwS4MTx
	WW81kXNaly2ZkHiFuusHNEXwNPoP8nEKUd1n1+Whx6kgIt2FAfPCvb4Tao9LcRDcJW/UtvxS6tQ
	P6jN7+YisFsr81z+vC6zk7f4Pr0ER9H0OL9ApOrB/LR69Z0ivWNzd0y8D00k0lvwd9xWg5yi2D2
	vVsVGpp4zvNT1jXMoi2/+3w==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396443385a.3.1792060818945;
        Thu, 15 Oct 2026 03:40:18 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr3396431485a.3.1792060817539;
        Thu, 15 Oct 2026 03:40:17 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3f0c3sm107372166b.44.2026.10.15.03.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:40:15 -0700 (PDT)
Message-ID: <890b127e-746e-4870-9a52-9b716854ba38@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ARM: dts: qcom: Add initial device tree for Kuno SoC
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260929-kuno-soc-support-v6-1-a16afafbcbc7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: pQZYjTmU17LTDGSFnjfCFiq3LPwH-GdT
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0ad93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6qbC1cy8WFjiKmmiPwMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfX7cZL/LWWw+0p
 ZC5ipIfoEH/zhEoUS/UcMz9zGVotW6pOpRKG8Y3Ccvh2WtTXGpfawYTDJ0Q+urFLFbDKOTs0TAw
 SnO5ZQwO7b7IrlOt+Fqd7VM0UFZ3+LcDkRYWDxY/OwuR7IKDLe2bjQNIMA5xA2PO0DF4ei0Q3ZN
 qlGQYBmGhSKqC/GA19FpjGlDOs+EXe1moic9G8d7nkXrK9eW6mASHQuvgWiypjUVL8O547raof3
 h1UXy4S7IBI6jl9IDAxsCV6nY3lpnx837C2ogecYO/cG5Ag9JtWJyeGoTKGFwKyvrsHv+W8C0Mp
 K/94MxtReqfO0yVYs9sfgQmL3DDxyNlb1LRDV6/B1uDYtKC4CLhbNXKC0+D31gLoXbt88uEgv2a
 PHg7GBhKXgZx8j6h8YhAiftELdqvohMn91Vc5QstXrsgIKK6C0VGabcS5K4RJTfH2EQcyJFqgLA
 Qg17xiRYWoDkXREfXOw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MiBTYWx0ZWRfXzp4uolYCRCI/
 HbuVv+7HDu1+hKJtj219WF5tb4E3A66zElg6kqnIRlsnDiMK3HUhmqFPB//eoWYOF/w8dJ2DxAN
 8rYwVpxN5LQJ/bqBfCLbuD1/8g01qhw=
X-Proofpoint-GUID: pQZYjTmU17LTDGSFnjfCFiq3LPwH-GdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_034020_893725_3D1098D5 
X-CRM114-Status: GOOD (  10.86  )
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

On 9/29/26 8:46 AM, Hardeep Sharma wrote:
> Add SoC-level DTSI (qcom-kuno.dtsi) and IDP board DTS
> (qcom-kuno-idp.dts) for the Qualcomm Kuno SoC.
> 
> Peripherals included in this initial set:
>   - Single Cortex-A7 CPU with PSCI idle states
>   - RPMh RSC with clock controller, power domains, and BCM voter
>   - GCC (Global Clock Controller)
>   - TLMM pin controller (110 GPIOs)
>   - Interconnect (aggre-noc, cnoc-main)
>   - GENI UART console (QUP SE3)
>   - SMEM, hardware spinlocks (TCSR mutex)

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

