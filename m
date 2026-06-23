Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB91CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=; b=M9Zho51j++Yqgvdz3p62N4jUtQ
	7JFCqK4SzRG/R8daPQ7XH/gCgMK3m+dKLET0318/JYsUZR0maeiMBOiBJblh34kI1f7F7U1P5fnk/
	77mV0aRenxBW6H877HQLOf9X2kfu8O9iXTwV8ICDqdYgw4T5HzF3KEhvr5K/loyzZnhqu2aC+S0gL
	/EIgNYR2hYnLSJ/k4hHjQDlM30IZShMCROQyjSTCkd+E8k0PMNZa8Jm/8SZQ6XziVAaFdENmYGOFs
	bcCSOcYO3TVd4ew4llpwmaLagU6MAvUsr19Ho/YRbqML98L/tluAfCtXuYNA/G4GJgo1+9XtELKsj
	LKJQ+wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzE4-00000006AyZ-0j98;
	Tue, 23 Jun 2026 11:23:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzDz-00000006AxE-4AGH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:23:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsL0c042137
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=; b=cbXilyVI6wW8w1uJ
	sZXyG8GJmlYGOYwDI2JQHfWE9oF9tIeIQbhrCZjn0pvbKS7li7kBxH98HzdSka4y
	hFGhL+SDLgFikzzemVUbKThM20Xlmi4hoEl9jd/jv+nKs+Z2syIh0kPDS1LDNgf0
	zO1b3dSG+qfnTsNJ8yodH4frZdovKlS7FD6chm/9yp+dQxem+d78ngb3/OJwYiAE
	5uQbWjnerSM/+XhuM0y24R/kJCS2TUKgaigmEShJh3qp6xGxcy7NkB2TFpvgcnEG
	CEuHH+22bN0XUk1ePdfwwmZUlPpdf6ipYArWe/Vb+os/huSVJ6y1B4I67aRCdlEH
	mNNngA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr3209j1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:23:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9229581de9eso32357585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782213806; x=1782818606; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=cBrIMqL7ajC4gji5DjkGV3nmTga9hZL1cALdZXOmi2ZlnNn6Jog4FblBj2P6GlN3aQ
         5BPQbN4myWD4KnV5jjXBg8/KkV9SHDITZR71RMrH7R09Ts1JmFYdwtheqHm8VXX0NHzs
         HFOYjX0UE9A4UQ36V1WuMffOxffXhXtQzf2wz6OUMLcJ8LJEBMbMcYky+TL6piGDufBw
         mqvAg37Na1KWl46gfYiLptpWnUHp8zb0HZ/FQ9cM62ckb73hgNzWmGrZPOPwMDFG+c6H
         oodkIHCqC1IbssztSOIXnRSOTcn58F7lZ7BvnL6VClsxHa4xWCQgkvseoerJ97hGcQ+N
         QMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782213806; x=1782818606;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mAVIsyi0roMiNG+3y68083oAhmj4zDD/EfEM2kSD1qg=;
        b=s9Oi3bcD/yLo6FWYsW8gLk8PXdR7HeFTjcVeq9CJKgRWM/WBkExCBXHu9dsDpXq1sQ
         104SML3FfZaka9wSNs0po+vfRxFYIz09BcP+znibnhNnEkzHIzJ/9XuwlvfSQbCsTWam
         2tqUj1zss6tugHX5E9hSsgjMUu4NQwuVTfnmLeJuDf0lYeZGyG9HjaQvOUzQxhSfR5f2
         kR59NrRhyrmPEyjJHDq5ueHLcx8brjgWYWM5R6NLsdypobASsVxpy1XV9dlW0Mxxt0uK
         rHaLM+st/iw/n5I1n0CVF057fqPjdwKdmQqoid3QDpi7P/0PbFODYJFbr/5ormXtKO6G
         Ysnw==
X-Forwarded-Encrypted: i=1; AFNElJ+dmV48e42LIRlp9pSyAqFYQTWLxVApWUVdrGQZ+SqXcBW2+cvB4LzSF9Z+FYjUEIwZ3p9RLJkHSGtLkjsTe9Vg@lists.infradead.org
X-Gm-Message-State: AOJu0YyX6NkCk4qOaZaBjqZmLyKuGRYoOvM88Pbf/+imgRa6/flFvhCV
	GTqck8Nyxyd1RCVKeAmXkX5iznbKe61oL5rHznZQwF3LDoV/b9YZSb9UFdCwo4QyhY/S6ODPvis
	UhK2I2NLxE9jghdYDpqc2YwLUN8PE/tVM0c11IG639szlEs1xYrOR8kISuByh7tcJLxNUKqP4CR
	UVeQ==
X-Gm-Gg: AfdE7cm99/MZTRBRp7fY603gQt7Kpty3U+Ly4kCC22pOB58vFlB1Tg4Sn02l4ANdvcC
	xtuC3JqYy9Xjm6zcnZ7wyg+DOjuN9Nac81O9KukHx3wWlFIekUxjTvMCGirBIX2Hl/oc7WK6Df7
	b+1nAw5a2izmE5dqB61nIqtmijp7eD7oEzXzPItPkNq36Hl7V6zd5YFF413WeOWo+rUT0Fx7mdz
	5XhItPbves0OP74ykxBOsKpziqZNLD9eMc0+alvt1iE/XBB88zBYttnJYY/AGNI5RFoVBP1oy8S
	LPJpHSrnQ+iWqjji1EfDDmxFwW7WigpBDWAIlSEOrZyJMOuc8hELBYUv9VMjYT8dd0XmIdhBSMV
	s8uVK3rOPq/6NlIQF0fVoddcov1g7BBeHBNU=
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504350485a.1.1782213806269;
        Tue, 23 Jun 2026 04:23:26 -0700 (PDT)
X-Received: by 2002:a05:620a:6cce:b0:920:6579:bee8 with SMTP id af79cd13be357-925c6f59e85mr504346985a.1.1782213805798;
        Tue, 23 Jun 2026 04:23:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e49a759sm503098866b.6.2026.06.23.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:23:24 -0700 (PDT)
Message-ID: <27db2e06-e3ea-4edf-a0b9-1baac1d5bb50@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sm8450: Modify GPU operating points
To: esteuwu@proton.me, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-phy@lists.infradead.org
References: <20260622-sm8450-qol-v1-0-37e2ee8df9da@proton.me>
 <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-3-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX1QQf4nfhtypH
 x/fuBtHkS3gIL6ndcbXq3diu+o3fYbm7OoxTJpNpQYLMdriLvYPBowzBgaklMS7AXL/RgydGmyr
 +skGGwoe0LCbsqwNOLfXF2vQ22HjJO4=
X-Proofpoint-ORIG-GUID: OxXRldg7EzuOvhrFdBNvSsihwtuTyNpR
X-Authority-Analysis: v=2.4 cv=HrxG3UTS c=1 sm=1 tr=0 ts=6a3a6caf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=yh-zqMWk-TAmMPKcllkA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA5MyBTYWx0ZWRfX52HIZQt+oUN/
 3J/7pCGQI100f/XlVBwWktmmeRgTxYHp38BHvK/YYyzFmZYF/BllXpU+1hoauGPVZ1Pg/KYMZRn
 NI5Ckf+wm/ZpNZe5VgfTQXCbdcuFeYTtz0rXweYHOFz1Cxi5RT3uNk1VMb6PQJHqbhXgzIEldWV
 jaguJWvGVUGSzhTDjCHDg74ECJ4pLsRbEpgriRb2CQNQ3H28Tm8FwAlPFTy+2kds3RbfNuuEQ3P
 rI3Xfm4hyEKzYQE6P91+DvoNU3045rreIVNYudikffatrggQMxEUKL2jJlc743blqtshM3u2lnM
 TZ6fK22Nj6rPT4b00mACms4/UnvdocdoyxMuYMhoAC7ecd50e39+r/27T3kZ6GvAtEcQv/MI+eu
 lJpHkiAJxKNoh5Xi4jTIrHUb6dkvcLOm3Hcxg6+lRcv9I0F858ElJ1yHYvQJjENhF6OEYXPNsN3
 Fp0nHu2FJtyE/8Z7nEQ==
X-Proofpoint-GUID: OxXRldg7EzuOvhrFdBNvSsihwtuTyNpR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_042328_147472_9DE54988 
X-CRM114-Status: GOOD (  17.99  )
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

On 6/23/26 2:54 AM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> These frecuencies don't exist in downstream device trees.
> Both 220MHz and 285MHz belong to SM8475, and I'm not sure where 317MHz
> came from.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index e34e3c05bf74..5e331a25e22a 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -2495,21 +2495,6 @@ opp-350000000 {
>  					opp-hz = /bits/ 64 <350000000>;
>  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>  				};
> -
> -				opp-317000000 {
> -					opp-hz = /bits/ 64 <317000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
> -				};
> -
> -				opp-285000000 {
> -					opp-hz = /bits/ 64 <285000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};
> -
> -				opp-220000000 {
> -					opp-hz = /bits/ 64 <220000000>;
> -					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
> -				};

These are valid frequency points, although downstream didn't advertize
them.

Funnily enough, the frequency plan lists them as:

LOWSVS_D2 -> 317 MHz // in downstream, at LOW_SVS
LOWSVS_D1 -> 285 MHz // in downstream as-is
LOWSVS_D0 -> 220 MHz // in downstream, LOW_SVS_D1
(the above are what it says in the doc, yes, lower voltage for
higher frequencies.. certainly seems like a bug..)

LOW_SVS   -> 350 Mhz // this and the following are in downstream too
LOW_SVS_L1-> 421 MHz
SVS	  -> 492 MHz
SVS_L0 	  -> 545 MHz
SVS_L1    -> 599 MHz
SVS_L2    -> 640 MHz
NOM       -> 734 MHz
NOM_L1    -> 791 MHz
TURBO     -> 818 MHz

so in short, the existing map seems to be OK

Konrad

