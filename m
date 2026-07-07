Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63096C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=; b=PgQVJWzfjx3wscedi1uUeh59hj
	ezGiwH0t/rlSFY5n2aT6RAYHQFABa6VYywonTipCW2bEWuJLj7A3c5xSEpVsiEI6w1h9hiTNyjh7q
	keArI8j1t1Inz9Hb/4VEvexyDLPdQepC2wZ1sMbrIdcWHQfiKGLlHrwSkLEQUzWy9zF1TLxH4DEx5
	tC1z1OgqU6DfZKD/wvmXzREq5lBSOA+G2hgjBWViXCbpkQhjb1+BavqszygP0QH8BdiHFk7XX+e8p
	g2l/iramCsz8McfIOnVkddTS+GhbVYk/yiV8gVN1HgNKaF7jTNaV2BWb3AKOsm1UauY7gh3L9COqc
	YE4GFfxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0g3-0000000ENyD-2npi;
	Tue, 07 Jul 2026 07:57:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0g1-0000000ENxX-1eNu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:57:10 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66748nAj2674844
	for <linux-arm-kernel@lists.infradead.org>; Tue, 7 Jul 2026 07:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=; b=fcckQYcR8YaWsCne
	8OMkkL6BP/ynJXTTEAsp4qAeFWCCSjtyss+7TFUrogT8Wim7hJYNpi6snApgBjUS
	TKjFsDx7XkHgKeZK9JiMftH9grco5VxkAWTNiTqHxZWEj/V/oxN0dfTwapDvVIWT
	6bePbgvZVPdMCveLWJJfaMIlrvyLikhUIiTSt/fsGYitYyYoUna2vUuaPvez1i0n
	/3jqUl9vCs2hdmUit562G2/k6yzexF1+ZLjJnm5PTbhUMXmejpIIW1bSTc/kxYf1
	EkBuvtu5Sku3r6Y8ZoITOOI0bomB3zl1EUtfCs/cVdSxe+O2z4PmKrN46N5ra0a+
	idONjw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8qj79ak8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 07:57:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c267931ebso23641341cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411028; x=1784015828; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=NP7PYRTevdIkM+gUlk6mm9EELJ9FRXto/8EQ+nWGuBOcauA3gplzuF+FpbY09upNsV
         TgsTzErUJX3gBAbOzeTmVd3ciAKWQKttT2pUQ6EID+O0vjWe8NrmmDiVOAJmd0zPFFg1
         1SRQcX7onvMOxXi8t8XlVR2tO68k7A4KdR9KshyLWH6qXpRfantcgUSHNjheMM0Ecsm4
         NhmhYqo/foaUCcEAd5h6yvQrfNyLxIPhStLr0zXhfjjIcVfnn4Jddv3k0GTcNE4FA7mD
         6LyRO2IeA4ZwGwWnRa4WTIK2gIEXkwUyWJyo+Hcjb9uoASjh7xtqKf7nlDzFkhleOzSd
         pd6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411028; x=1784015828;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7YpaEdMecakz3winsJqyzZ3JM2BmdyWxm8Cl9jEyPXA=;
        b=Kxty3XR042vpTeWf3vAlcSN4S11PRhmMPEaspis2xIdOCLvHZdMC6ax28qHuvAhyG0
         p5Fcs1g426wyXy7Mm48v/UbwSji1fSP3hVM7y0zHhs1qG9zSJhVYwNNH2vWHQ/eORCNI
         Ipnw0y0DxcMgYVAMOeEwwYmpgmwca7ldwN0yAuz46MjRPXuCQWZMfcy5OcpjsXlanNBi
         mUNe91NyP5vCqJ17n3pjKcU4vMiDFGjoGyemfNOTt04XSdI790wBXJ4jmqjALuo+2JNf
         6otmIUP4YoE9Zn2FoO89W1XTp74O428DlI7klyGfu5CnEConNhNbcMX+Jh8a4nDFORMF
         DZog==
X-Forwarded-Encrypted: i=1; AHgh+Rr5W2Vuz4+QihK9+vrvZ2ksvstVnwOMpETndH1sgJ+Aggx/eyRFNFaOXw2vI0bVBH/0+lf9vyGf2vlmcQgs9wXM@lists.infradead.org
X-Gm-Message-State: AOJu0YzkfZ8E0k3yW20mDodVPhnvf32985MaTUCY/JirNbzHgwrPerXD
	rl1/xphWkSOQclBpik86Zk4owWN6o4lm13RL/WuGjceAqTfNiHo/vk4ks00kzgWra3aDE/kCTWv
	O1mKpSnQIocW/RsOX6+95H+48ZF0WLrLyOa7rup5V1ZWnlKHt/doEF8pp3ERkdIEapzAOD9Hcly
	enUQ==
X-Gm-Gg: AfdE7cmuOOFYtCJOaABfyF4NV9CA5iLZE+zrmFPuKEUzJZFn55tmOp5CZnq/co5nbVd
	FvArKyP/XXC/huztQe53RXRSWNUP5W6p0QDlXxMrAv4hH/pXPTQpxfG7mur7CNmR6UNWu00a0bV
	k2NArPH1CI5xceaDRvGUOfrYE0Z5o2t7KNs7HvqUrET2ig/H4m8uY6E4mjqnFl34tRNZ+Q1ED3O
	uyQh/7iy8XYVobj0qW/x6fZzppEVW26kEaC7N1tfVu2fmXBgAtTuBWKzJOgwG8vbp2SbfW/O4Rb
	4zevXzlJCH9i9WBihZ4L/4nY8TIVAdKR1uVueKZV40QeIvcg0NnjQe/n10KdnRo4mWjlMzym8th
	KFgZtANB99szLOmrDY0kGpDl13g0G2hux5zU=
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80136191cf.1.1783411027791;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
X-Received: by 2002:a05:622a:9c3:10b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-51c4bd5a87bmr80135851cf.1.1783411027315;
        Tue, 07 Jul 2026 00:57:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad82311fsm75880366b.8.2026.07.07.00.57.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 00:57:06 -0700 (PDT)
Message-ID: <c9fc2770-d436-407e-998b-b7ca49ee344b@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 09:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: Add GPU support for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-5-6ac53de56314@oss.qualcomm.com>
 <e2b7e03f-911b-41cd-8ac4-044492e2bdbc@oss.qualcomm.com>
 <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <b11cdc41-e88b-4815-9349-453f1bd5f14c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: e4cnSwPu6RedXON6XLvNMoKLEUiS6AvS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX5eF46swlZahN
 xzaImZZb5w92ShlFTUfRphUT31Zm+H8RKJ0t64Kvw7EzFSx0Btylwl6Y0xu/Z8FeDi0Q1wVXJI6
 iKSEns9inGxlXi6RdPzyx2S9x0RYQWkpzpEMoLkRjXhZu1wRBzbsl0L42TGNNp8IOhBr8LCHA7e
 uyYptxFpSWV14LnqEiC3H2itJaUVk+vfdTnVOa0MWif9w9aA1T1wPWmdHJXdXSC+vxL4OFGcuJV
 VHWwgXZR6JtTEJDTa9clDEFDpvAihWBBsUHW1DlEHM2RoHchsSn+CDdr5JYuA/XRJcRNb2jWIzr
 uFEpA7laXq8AaxjILBrmpkCztzt2cA227KTs5JZfXMF/l2N8aVlQl2l1BseBGrMz2JOmzVpw+3n
 QyvBihPGn7WRCvyyeTXsmBU0aWDYiSKWpga9R6zAOPghYUmXi9ALT79RHbj8p8a9x1a/I4Y6xqw
 dy1dvormm5VChtA3Qxg==
X-Authority-Analysis: v=2.4 cv=PIM/P/qC c=1 sm=1 tr=0 ts=6a4cb154 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=w5vk1yBYWc5d-UbTd4AA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NSBTYWx0ZWRfX1Z9G81z3R8yn
 W0uqh31iANB1VTgMn31HIo4uvlg3QCflMN/dpAEb3TQIXq/aYK6OU5NnK2siRiu+oPAi04wcKL3
 ZuZvalCzYJg4gsPPcrgVl7A7yEDHnbU=
X-Proofpoint-GUID: e4cnSwPu6RedXON6XLvNMoKLEUiS6AvS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_005709_555128_B5ABB5A0 
X-CRM114-Status: GOOD (  17.80  )
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

On 7/6/26 10:06 PM, Akhil P Oommen wrote:
> On 7/6/2026 3:07 PM, Konrad Dybcio wrote:
>> On 7/5/26 10:00 AM, Akhil P Oommen wrote:
>>> Adreno 840 present in Kaanapali SoC is the second generation GPU in
>>> A8x family. It is based on the new slice architecture with 3 slices,
>>> higher GMEM/caches etc.
>>>
>>> There is some re-arrangement in the reglist to properly cover maximum
>>> register region. Other than this, the DT description is mostly similar
>>> to the existing chipsets except the OPP tables.
>>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +			qcom,gmu = <&gmu>;
>>> +			#cooling-cells = <2>;
>>> +
>>> +			nvmem-cells = <&gpu_speed_bin>;
>>> +			nvmem-cell-names = "speed_bin";
>>
>> This looks good to me, but I thought that on a8x, we're supposed to use
>> the freq limiting register in CX_MISC - is either of them preferred?
>> Or are they just hardwired to the same thing by chance
> 
> I believe the other register would work, but I don't have a fused hw to
> test. OTOH, this is what is commercialized.

This is the answer then

Konrad

