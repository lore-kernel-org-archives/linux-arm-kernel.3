Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CA7CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=; b=BmoLoxCa5Eep15lfE3+wh8QAUw
	Pl1poMt79/tIc1f7M1lrMy0+bRaKeIulTvumC0kPdLh8cFjxfOoAb44iBS16vWbNqd8ULYIieTCiy
	WcrlfzaoiiEQ5hoiENq/IAOGhrrDsFjSDVQZWtMYCXLwXbVwZzHx/rnOGFjo0DCvNg1rtlngXQJpt
	CfYKtvj/UmZnwvtccq2nvIY2Kl5sTsXf1akIfl5IKJZdFhyKDexk7qBubQM0wjaCvPcmtRQcwydVU
	Fzf4uRNPosQsGlXs49TtVgsAQi7IjU3mYG9x9PKitf38xkbnjogfiDyaIJ4bEXsX6NvC7RIQv+Ihu
	ju5IwVfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcefM-00000008mBS-0lKd;
	Thu, 25 Jun 2026 07:38:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcefJ-00000008mAn-0xJc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:38:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P3eCdC640305
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 07:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=; b=lrOc8xepROZ3JvYm
	Blh/tVWTxMfrAFsytf47oi2cXGKOnmJTQBAHBS7WDEWC1oFwIpeo+fJAbnHYlUVt
	0NPlZXMKXmMffFqWIx6gYoigCVYtCcnekQxAjj//4dWuFi97QZ9+3+FsGvE09mR3
	I5hug8Lw6ujgZ5XE6773IU8y7J8UG27FOycsotkLXNwxRUR1Z8Uz1GPLwx+50QcC
	iFySBP4eSgnA53OsKtsQlahGfTUkq6lIMLUsBG60NyGscxbTGKZfJSSh941kx8DQ
	xhHUeyl5ZF+MNKZX/6LoWR9f5qOz2li121y+hkS3koONnjTBQrLmVC5cnV8NdMMc
	FOI7MA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0mjbtj0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 07:38:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517796be724so3896841cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 00:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782373103; x=1782977903; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=kdkGWmqqm6RDN4l1IQ+pnCCtw79Ml6B9KZWEvKhsP5/vFuMDDdzQHJfMzKkWjfQBLJ
         SpjgNYnIBRGiLkzpj1iSJf6CgEJ2PL0/UrlAF+9AcyAjEnvDtRM+GJ3N7QPLHqPHJuJF
         tWgXV5xZPQC69fRtaZDKQtHHk49orJ78rKsKK2aA7hlVk7z9uA/W/qOoU75cqh1GjDA5
         ZCoS4w+GmAGJAepoBxWGtzxiAkRfVeYKGiBYwn/uk1XB12ClRoGX33Ex4fjVJJqAUp+s
         Dho/u2o0smssYjaVFPydy2CExrX4MMqO6EjQAkBZd4nr6gTEIQCgplG1MkkEaZq7dc+K
         UuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782373103; x=1782977903;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0kMOW4i+4XV2WgAdnsOAr0reBkKZzZYazMDcvSB30UE=;
        b=dnGD/CyAUHKojFTrfxHLgcTEtTPwlafG4NlpUdyT/VwErzCJru9CyQSUSUErpTeQPj
         GThgdY5SnSQRxCZJY9qfeMgPfJ4IXSft3vTS/lBmt16MVpDOtsx3ThSO3TNT1B7i8Pwt
         xq44MbM4E9VnM+HSN/FqhC2D8cvtq3choBgx/4a5R4wJZ8giOkGsDjo3xlM2l78MS33K
         6CzJ57iXxDmSIGiY1yLnUFmYoG31xGcBC6mwXrqMFhViviDiP8AzJInHrcIsqhRFd1bL
         T9MFRwaZHh+oi/5jJAStOdNJlimh2XACDU2ncVcZ1RZn+Am15q8hCtbwgxV3w/DrGjyO
         qKMw==
X-Forwarded-Encrypted: i=1; AFNElJ/MeWcOGnr+7mZgSMwDuhY11/IBedXt3jbLKULmP8tK63q4Wunk8m5Z0aM4Ei9e9a2H6DAUFGs0obIP46KffjdH@lists.infradead.org
X-Gm-Message-State: AOJu0YyT5U5IAKHaNDceRm6TIvvH933DM/e9xwAMOIalmwek5wp5WK3y
	1qzgS3zaq5kNEMFFtvDDWeV5m3FcHxRO1J9ZcKnWtZTuMirNK5qcZHDxXr/C/+wDiu1ufMmeTav
	C7W9u5T3ywo+eqHAJDRjT7wMcZ3SJlCSjlwm29B3di4DRqqCHDCXKXIKLbBa4r1SjiMECldmNxL
	ML+Q==
X-Gm-Gg: AfdE7cmeI20fcoMwfgZKNwUOVdTRJLozBW6A1J+CQB0T3i34iyaTaNpk7GSgCqVeK/B
	uI7TEbe+fPMaw+eK+09qVdqLDC4+6ehnfFRjQRbgpZ34bMUkyCU4V155aPNC5S5t+/yWH2068OJ
	ICeKBysoJYCJ0TLYtoPQgUCzWtdfZRth6VhkfQ6xje3o5Dv1zToxo92IKg4ppkbnMRXrKcxg+wx
	o9pLJJt4/kyHg6a85F4JhhDtw2DRKWJIOJDXSsBcr/G3lCVa5ISIWOk0fCn0/Zvn1zDv1F7FmXQ
	vJCT3oyXBArs3FsAVSpk8+qwPac5pIoYAJOntGqW2KhzZb3zNNy5wjOolCYSOrO2Aqmk/+zUkrW
	bAqauPyamIRLBSduhEP5nDyh7gW1TarqpRWc=
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10886091cf.8.1782373103370;
        Thu, 25 Jun 2026 00:38:23 -0700 (PDT)
X-Received: by 2002:ac8:58d3:0:b0:510:144a:636 with SMTP id d75a77b69052e-51a72ad2276mr10885901cf.8.1782373102900;
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbedf971sm120256666b.62.2026.06.25.00.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 00:38:22 -0700 (PDT)
Message-ID: <ba15ebf4-ea95-43ce-b612-8df25a9f179a@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 09:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] clk: qcom: dispcc-sm8450: Fix mdss clocks
To: Esteban Urrutia <esteuwu@proton.me>,
        Bjorn Andersson <andersson@kernel.org>,
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
 <20260622-sm8450-qol-v1-1-37e2ee8df9da@proton.me>
 <65873506-1a9a-40ec-ac67-60f61a0b4b4c@oss.qualcomm.com>
 <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9bc524b9-c6da-47a1-a7cf-abeb131416a7@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX8757mt2XWkPg
 5NCOdQLIa0CLl+hO18+AI+O73B3gz9bLsySWvdwLwnN35HdigF1zJrZa292FSlyHnippXcgQEJH
 HELb7U5IM8p88UBV/0XaJEzGCFvbi50=
X-Proofpoint-ORIG-GUID: _PpXLuiGnoDVFfI-BHsbxbnCA_ajcIq6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA2NSBTYWx0ZWRfX2t2ScVFKfv34
 1sgRDZwueokVGoDaMVavxFv6MxVH/4daeLDzVSQISdOejx1oMy60TVUJlNKcHBMd0V9JmZUA2sJ
 h7+EHrEordmMKpjo9K2zD8oIJ8waVXfJu7IKbe/NGhTK4C9Fl3k440n4/sxPVB8bCt4vcnCkI6s
 Dl9IgqSScDKYz01K9H1mws6b3BeoU+KDJPZNQr+OOc2TGjNlVW5NjVdxFdRe6sDcPF19BA/Uut8
 YnY2+QLc9HDv+xwnIb2D/5KeQDCajFVPNvttU4g38LUvB8ecZeanTBIVw98n8bB+PzzChomcl5v
 Q1cq+dbtWOGJ/hk2OOqcQPNpJvkGMCVPScasI5DCK0swyYsFTsgo843Pg2n3c1xG/xq0hr1XFnE
 tzCNFEGXsHt/kdTUsc5WcVYweGlsj466BLi2kWiSsJQ9KtrIqS8gKgnA2yF3OaLPGWbMmLCWBIM
 Aq1X5CP/Z3vH1BILLMg==
X-Proofpoint-GUID: _PpXLuiGnoDVFfI-BHsbxbnCA_ajcIq6
X-Authority-Analysis: v=2.4 cv=TcSmcxQh c=1 sm=1 tr=0 ts=6a3cdaf0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=yUEngxm9hVyLX7FlFv4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_003825_277018_51F6B511 
X-CRM114-Status: GOOD (  15.40  )
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

On 6/25/26 4:22 AM, Esteban Urrutia wrote:
> On 6/23/26 11:50 AM, Konrad Dybcio wrote:
>> This can also be fixed by migrating to use qcom_cc_driver_data,
>> which takes a list of alpha PLLs to be configured, and thenthere's
>> a switch-statement in clk-alpha-pll.c that always assigns the
>> correct function
> 
> If this is done, should a patch that migrates to qcom_cc_driver_data and a
> patch that fixes the issue be sent, or should only a single patch be sent?

It's fine to just have one patch, but please mention that this
actually happens to fix the issue in the commit message

Konrad

