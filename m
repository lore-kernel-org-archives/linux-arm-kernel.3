Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D486C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 18:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=; b=VlGQM0WTnV9gC7JJlf50VX9n3l
	iZJMtF83BnQb6OhUIztzugPSraLewgGFLPT6FPZvBuaXVdIXfqd+jyIyEu4Sd1YUv4NLNDBpCRPGj
	j0gj6u8NOdrVcPsy5yiv3hRRF4RbeShRg+rXn+Q45iAbDg3r1srQGXifFLMcpuBicYMQJDwbFCEcn
	zeYxqzzJP8U0lETNPTbS0uO+bXbIFttwq0eqWTuwQkUeQV49SzUb6Vl0s8u1oiFl1vN2+5eE+4B/a
	/masL+QtFPT3tlVzTq75ZaUWnQU4903ahPulFBmqNAQDXSo/hgReezO+EnQ1qAZUxaC+9UqY2qnL7
	bP7EQ5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wic3i-00000006k6s-1QfX;
	Sat, 11 Jul 2026 18:04:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wic3e-00000006k68-3b0T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 18:04:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BHohBF396078
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 18:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gi7mAsPzRKDSQ0PcWw7D/RRQ
	waT6XIdXYVfkOrbW+f8=; b=nlhG9iGsUHzeL/pnhekXb0cQ7HhewmN3YpC/275Q
	H7XLy/KMwJ1+b2ZI6OhPtuAo6Z8h0M3Sk93fuuw6etBHnbb8uhshs9nhBrbH7cXK
	kLDDcoqjYUC/3uGM5+45SVW8p+6sZSFJfJv0b3z3xXUPkUl11kDeKHHj+2yU1iqn
	MfZ4lmy07AiA54I8IgdSVpsGf3QdoK2PhqnNf55ddEZm42f6cBpi2GhxyMIqsFRI
	K2/6eB0NZjIc0yVfUEniZZQd0WjQ01GTIzxTbQbZZsqw2JnKlWlBiJz0tCyvOI1n
	LdoYGMsVVVbE0IVeC74yZovJiDk1dx993brLSt+EelMtHQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf9b07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 18:04:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8c689b5fso21863851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jul 2026 11:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783793049; x=1784397849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=dVQteqfxZI9EUq4/XbfCfHvFlfQ7Ks3iNJXNnq1laLfk31fS2KexRYYcDV0km2C020
         Jk28J+/b3nXK2ynxPQbaz74MIY+HaB1z9roJNu//YGaLxJfiyiuuL2Mf4ensAzPVb8FQ
         QS6pd6I5iwYKaptRifWn11XMdO9OKKrQGBeQ4lsgGjEFSskDeBM7lbDfBdffHLo+eGI4
         sUWcEAgUhuAx7ziBtcr8pp+BQfBv1a4TZdmHDZRSY/S2DhSZAA0ih+DhWNgFSOAXdw5L
         m0J/q2ypWU9pGRSx9zR9aV2EUte0IuOssa1WCDDZ3BmHwVXteEwh26N6QiL5TeZqnnHp
         xgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783793049; x=1784397849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi7mAsPzRKDSQ0PcWw7D/RRQwaT6XIdXYVfkOrbW+f8=;
        b=aSdRdmwlQBkU/6wXnmmD3tXsngdylPh+shDjISz4sqpgzztLYPs45iEikhXW6jVW3/
         jsTdG7BB63+/q7/rkPCh3cwluYw55NuWRxUoxgAtBhWZLrhC4T1gv+bA8JSHe7aujkGc
         ybFeMUz82LbMtyV0xpHVdld9bJ8J4MH+/7PBU7ktxclvhLB1Jmq74rai02drcCd0v8lp
         KZWx50+EhuxLbJ3/+80OvVAWy78zSVJORpfNkQoBpANuJzLPD6PEyB9MXSMCCxZr4v5V
         ibMSVAhMcb+eJH3L3IV4+ObjwzNYLzoiVmm4M+5HigCOCcPXR796kIPxu56BkVzerxzl
         UMzw==
X-Forwarded-Encrypted: i=1; AHgh+Rql5YZtnpCwu7ZITcYhMCZxMUCJ/gulQE4Zo50MiKS8Fk338DN9DBl56NE18LkA7aKGdwobmnhfax8wcC7Yx54n@lists.infradead.org
X-Gm-Message-State: AOJu0YwxfvOIa6fNqRoHSJO6WSVFStbFRu/pp64PiQb+t08p2LBRw7s4
	hGy8awPXCOHnTQVGFCh/cqsyHBx7qMpAi2l1ZKyK/9Vai5LoJ6DXJn/BOWQEsbNhe2Llv9WzJSI
	i5Xi+lxmyiKes+RlHokhm5xBZjrAplbn5/nJq7xY/wd7GcJfaWIR7UF8tchXyR89Q25Y/23DuZv
	BGSVsgzg8kyA==
X-Gm-Gg: AfdE7cmtam0L+U0//MY1sSPwkhxLvswbSslMC7Zt92K6dqb0di2A1wlc3VshCF/uleo
	TKprOnZu/9p/vVnLnjvFNV4HdLd6qbkAiedyXikWRLvbE7DRk8G//eS/MN3pIGf28GBnbTPT8wa
	g+5FK2ylOoyv3U6rwjrb6vD4zGqtv2ldxKa6+NDHXAeo5iqmh/ZA30kBWVJrAjwovbj4vDDTbuH
	HxIR7cDhUjDOc53G/iZeB4di0X/xE+9y0wNSh8vR3rvXmA/QdBdR4IR77FM/LPgekCFX9Vnw0OG
	6s3EzGbxRU8qJCBPrdDghY02U5R9PulehS2kt3tLCtXn30e3OpleY5q7PsjRoLIi3EwGvLU8mTl
	54lxE1GZ5IoGo5HH/wvDZWcFIY+UpzxarepXMP17VIwBXntKbXQsnhvr2ovJlAvHwqFz9GshJgx
	C7kwn5zcjixVWMsmAtYYya2FVl
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273431cf.18.1783793048968;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
X-Received: by 2002:a05:622a:58cd:b0:519:ef86:127d with SMTP id d75a77b69052e-51cbf07149dmr36273101cf.18.1783793048432;
        Sat, 11 Jul 2026 11:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca9ddfbsm1478518e87.54.2026.07.11.11.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:04:07 -0700 (PDT)
Date: Sat, 11 Jul 2026 21:04:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
Message-ID: <vbsdddrjoq73h2tal77rdm573ydomwsagr7fujjh7znw3dnbka@olj35zj5pyzn>
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
 <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
 <6123a923-21dd-4f69-9ac5-02165963027c@oss.qualcomm.com>
 <b3541802-3035-40ee-8327-a65bd5d2dfee@proton.me>
 <4g6y4q2udludhwmoqc34afwj5svra4a4j5bmpqza7h3av2oov7@6k5r7a4meruk>
 <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c11f9ddd-8533-426c-8a88-0ed461f6a30e@proton.me>
X-Proofpoint-ORIG-GUID: Q9b0CjfOqauH9Eqou89cUicv6Vf4uOgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfXz6c704kW5vMQ
 uh7qn4TJms/qxv3MvMu+SpLU6xj68OY2/ER3wNvoQDORGHTE/3z3+5KGmkOv/GLWp29BxEqIcj/
 dQRWMzFv3BxgY4aW+ChQu0JwFXQ+awyJ5z+wh+wKMCq5bXe9uMkvskM500L6jvnso8VG4Zb91X6
 WEec/ZEm8uUhdagNoHAfExh1UUTHmCUCG+0P8ojWcIeZ68AWF+vKL2S3jmOf1DXTh5KMMEDlL8H
 IBNXggJkAgr+/MPx3g0itgirYWnxAhXPNONOycKfAornzhvcNDxhIG0csEeDTO0TLF5RfiC/zqj
 OYpNDdnh2y12NUMz/kXu5t3inHS2sJvcRW07Y1nhX0Qys+F4bEtoirXBicd9C0PN6bTt//RkWB7
 JWyDy8gQvzA1eTpGiQdEBfFBkJ+pTgAF0bcGAxHKM9xln75o9jC6EEpFYo8RWQoiUl6rfrpgCmC
 vEgsQL/2K1k/QYSHPfQ==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a52859a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=A3yFiG93vv4HRecOgxcA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Q9b0CjfOqauH9Eqou89cUicv6Vf4uOgn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE4MyBTYWx0ZWRfX5puZmDCNLvJd
 RFICnFDZhzr2Qs2SIFg0gXz5aFXEBvNsefleRD0XarI4Ckymr0hAjy4+P5Fcjc+K5Uck55OOQKN
 Vw/PXXYywlw/UG6Xa3VoFol1RGxdScA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_110410_937569_CC61D0A7 
X-CRM114-Status: GOOD (  16.51  )
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

On Tue, Jul 07, 2026 at 03:19:22AM +0000, Esteban Urrutia wrote:
> On 7/6/26 2:24 PM, Dmitry Baryshkov wrote:
> > Please verify that you can actually access those areas (boot with
> > memtest=1)
> 
> Thanks for the suggestion!
> 
> I actually did boot an SM8475 based device I'm mainlining (motorola-bronco)
> with this parameter.
> Deleted regions in DT are as follows:
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

