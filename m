Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D3ACD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=; b=llvNAD0Y9IxO+l+sdYt1RvYZQk
	dKUUvPbvKrH4bOS7U6iToc50u6ZIbuY+Ghwa6Cb8er8as1Ht1/qyBu638xefDd8Gv5rKpe2SWW9TZ
	wWYRO6ARQduN7mcUBO3Nnr1Xx6JzE2v1Jf/Vb+F7DUez+YIhlZ4VpzuNlbtlqs6O4H9EZ0z8KR675
	OvQN8ttY9SB6Ek0rHAM1HiBuWMG0kJbx8brpU9fL8GAXtAYSKBf4A9NpG81Z37U6I1kpVtZp89XKV
	ecr61etD3jWnoZ8ju31RlrDiX7kqURhma5WcsjldpghtXBefq03oTHMjW1QUgb6Xqh3WHFX27aNiB
	l1gpGZaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEmn-00000007A5n-1ZmP;
	Wed, 10 Jun 2026 08:59:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEml-00000007A4X-31Nl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:59:45 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iLJB988932
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:59:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=; b=n0sEfToNSM14fwTj
	I91GHlIR7zseYUqKJ2QJfHbsQxHNC+13qoR+XkAODFzRxhkvZqAwOrVdyB23poEt
	z09pL53tCjnKDsNRgUMfnqPopUYWAZQzMFgoFuMeRqSPX5CfjVac001Q/lIVpImn
	7BGZtR8Jmu86RU/Yc2Gb2QrSUti2x8IMtOuGb5/kurUr/qf4MfVgHmgE/4Y+1Pe+
	Q9EcXIubdpvvPXqxuZnHGdeFRimZC9IIrigaHAt2HBYNe7G+iffxgEWGVo8HlSXe
	Rha5fxzcxkrekZ1tO4CyL24k3gzoBcvMoR/9qdgBr7U291ovg0NUnzXkd7ufUMmg
	k5fezQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq2seghme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:59:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5178ded346eso12831251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081982; x=1781686782; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=ghbtgy7VgL9SsGiNXpj0n2Kc5Uf2qYd5AxJLaJAgp2rY23J+/G5N6JhFfJjlTAforr
         F1vcrP5WoNsMZ4k7rZSWJHhG8NieQRZ3ODnUd2wkL1KLB1i+U9S75/gabqI8Y69inlHy
         SolVGX6AKk2sKRXL9fqz4/FUmACniGiBIesUfVQS/wrqR23YNGPDhUDlxsWS5OrZ52Tp
         JVjdACizy8mrar7o4ahwRwagTgrRadXmz/KbNrolLdc9ll/3V6BgxcoKkkrdhgtMGb8X
         A+Z7AFM2ZvaTF4TVXCOgRUPo5Sn9coHEf6Vfv12s07L+4lgj9gfS8he7RFXtPESd3tHd
         J7kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081982; x=1781686782;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4Odi0h8mvRiXoQLG9GdfnXsVeRWyJkyrEIIy370Y/I=;
        b=ph6ZRGMWVLy8843m3qkHGrdUr3S/JRlnUxmkWmbiPxteg1LWkWHcbEqWMMcZ7iKCz/
         s9x26GSzrdyi8hkoxcKd32P9mjeM2Z2ohfqAl/HvIR/5gVyCIW072uZpjLJkgC9PQnf4
         fS521SL9k4M4OXylPx3gjxgF35z1f4bmu5ruicEN+Pbv8uBH8rSevDwqd1rUxSEHWzwz
         8HpRF0oYaOOAzWSB7Srrt0Fc54/spGn6E6pw74YHSu2cndFG4Ct0UB3QJQVqB7VlTjxU
         jq3mOSyipCgjihGrgL+XoF/kmKVb0TJLcvKcaiCGHp+ZBOGp/2zOmlnyhvSPOqBE1B9M
         cBew==
X-Forwarded-Encrypted: i=1; AFNElJ97wyMCvNpEbNCWlD4qFI9PexHPx7sE76JsYFK4s9L4ogPk2WYUMMdqYa1rL7UMaloMAcPsg1l5GpnsSCbjuiyE@lists.infradead.org
X-Gm-Message-State: AOJu0YyHVZm8Xf+VeLbFvEHMTcbV7J9HApGK81SJCyGoggcKmqKrdPWA
	IRi9c4M2qLwm16ejxxCy5BxETQFkuZzbWwWWV+IwSRVxzGNLnFQ0FoiGWVhysHXfrhBzvq/0onO
	gkZnB5PAxwRF4W5PzNsssIZHrN7FCL+I23jTQtlA10UHWDl10Oy3Epm7MfXcNC56CuyPJgKXlfY
	HGsw==
X-Gm-Gg: Acq92OFyKax+6wAgWG/WeSLW55eD8asAwmzzjUR3j7z4gjQYNvOm2f2xwS//eubAKIl
	nTKwupsZbLmtm0vJqHw8segV4smqXa8y1SyILLLenCCiJ/jc8dcX75t5VSzPjH61dRSCOJHCFyA
	16Zk13qNw/d1YgGAji2akcfcfzwK8KzCqqfHjqzhHpsX1Sgm9USi+tuopFISfb1qoWidQErghRB
	1ZCmhs5vu7DuTk/7V/H3+Z5O3F/bBec3vY/A+gEsRhrBEr9VUKCS7BEINXuF3dhL45675PDjdYL
	yNto+YSMlgkgkE2+l1o5icRNXk3Gq1oTWt78/ZPPvAowEz5XbRgWTwu9PwxHQExw2kwuHcGDj7r
	UYojnlu3r0o+dOEQC/BkbzFhKOby2SFFWc9jCsJ8aO1MhkBxCKOwrl/Zz
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189881cf.4.1781081981885;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1186:b0:517:6162:daf2 with SMTP id d75a77b69052e-51795bc3ca5mr196189601cf.4.1781081981503;
        Wed, 10 Jun 2026 01:59:41 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051770c7csm1164756366b.12.2026.06.10.01.59.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 01:59:40 -0700 (PDT)
Message-ID: <0eedf3d0-79a5-490d-b1a6-44a9eb60e0f8@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 10:59:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574,
 QCM2290 and others to ARM64
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
 <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-clk-qcom-defaults-v2-1-0c67c06dca11@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _0xRXKGTBarj1mL3j4ynFqDm3tB0b5dF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4NCBTYWx0ZWRfX3GoRTEej/Vwy
 WgEpODtdryMXa/bQVu6tgp0VOMeJ3oms2yCfkAN8TWMBOgKATwi6AN4le1bvifD0GMAL48OG0qt
 Spo74+b6scuzMfFlVgvmwQTu32ChPm5B8VXeK3iOYmTz1pgse8taLIN+j6+YcsSNxqk8t1tYoji
 L/KhgEhIx1t5KgRocKoBuvGOqWbZrjo/Tak/VYFTf/dYG3nMvwvfOviGYjwL4l8Ji8wwHMJe1Gd
 bX6BIrEkbNqsaSpCrJ7ChORzE/03VgidqGpN+9HTn85CgdLuHdRgbGbMAiys0CwcWI8uo6Sb0Bb
 Jw3sUTFi4xihM5l7epOOCLi0kogANxBvWOZa3bqkK0fl/7IuLH+onQXhjJURkj7ZUa9dQRr6+V4
 DgBTCqEL8NUcs+vCRuGmLg971HHTngmywzE53THUlUUNarbenyC8NkXLdUZZW/8PrsDQi5nf6uM
 kp+dSGAF5yDYl7TOR+w==
X-Proofpoint-ORIG-GUID: _0xRXKGTBarj1mL3j4ynFqDm3tB0b5dF
X-Authority-Analysis: v=2.4 cv=Md1cfZ/f c=1 sm=1 tr=0 ts=6a29277e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=XY21xBfZkjNNQA91HVkA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015943_888622_6A2634D2 
X-CRM114-Status: GOOD (  12.59  )
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

On 6/9/26 5:32 PM, Krzysztof Kozlowski wrote:
> Some clock drivers for IPQ5424, IPQ9574, QCM2290, QDU1000 and SA8775
> already depend on ARM64.  IPQ6018 is ARM64 only SoC (at least upstream)
> so should not be a choice for ARM 32-bit builds, to make kernels smaller
> and user choices easier.
> 
> IPQ_CMN_PLL is used only by the SoCs already having clock controllers
> restricted to ARM64
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

