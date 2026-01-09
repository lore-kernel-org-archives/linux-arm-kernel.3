Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5150ED16816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=; b=l2ACGTsjWyVtIGQ2XpU3kY0y3Q
	hr4VGD6fzx2zSinwn0jt1aAVTFQbcMPRxD/hn3wgb6KUyvqZqIcNiE3qiC09ejCe5Amt4v0QyrkCB
	doDNCcL73DCRh82ENvkVD1waHHru+WIUp4/+C0XmwuE/QZdQghqFGBx5a87tKz2U9mWI8HTobcf8K
	GcmQP7o5Gv+P5bLyak8gPcywwYYkjWZJXrU+FnMIZiJnRH/DjmU+sp3foCmXNb0uqhYJoNUEh1mjh
	lTuSifH1fwpQpLTxwpazLC5ouLaM0S1cFKXg8tISZtJ7luO1R3Ru4MQBOMK9op5LdyzySEwbKQIGj
	oawNmOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAgG-00000002DYM-0s2A;
	Fri, 09 Jan 2026 11:29:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAgD-00000002DWc-3esA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:29:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6095nBjw3019533
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 11:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=; b=TkGDZOumltMRFjsF
	ICltrjTdVAFUG62nJ8XJen9TX3bKmgEACfOP8mq6ZuzjuweaqgTTd3ft6I09NCNb
	763ipdEueEENWJZGUWHdCh14/bYywB9nKK37ynCNLHUb2FFc0iSqJSd6qPfF951h
	OjqXOnZ0xHNj7gb9glr3/74gAGzNRB9WiCUY6uZ8utRU8qUZugrGvmsIG19PKXoq
	kawlVvYrFh5yO1lKG5blir+ujYEThkMRfrIhUidvAQiMlC8DlN2/9ZrYl+9i7Ugf
	gU6vL5NYGEkqf4zHUxWB5KyBY/ol38pbm1AaXqedUJZVuxCWN93N0/STEXx09/5b
	hIa4Dg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjjk3jh50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 11:29:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso3889982b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 03:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767958160; x=1768562960; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=;
        b=KPCWlD8dRhBW3Q/5Q70TbTOgtWb0WtZBei33rQSybU6f5zs+5CiLzPhUk7cGHPVNqW
         7RkjxXEMLdUH3YxI3sNQgzvmni3NrBQg8LeUoMfEItVf5ioGUvEkTSVRqRDcuarftIRP
         E5aleSX8JVMy2oqi9es0bOck5D+3CJ2I+MjXjCBkyafNYtGMvOIYBPKp8BGn7JlxucYc
         t8k3V7ZzljaVAXUwGFA4Dac5aCT7qpXjMISXZE2Vb5j6WbEDoo8AB/k7IC9Y0zoxw8OO
         e6Is12difLmIvFMvEDL+TKMnGb4svf+fPFkFfA2LpO1nBo95wPxxyqOaDGb1WILw0a7h
         B1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767958160; x=1768562960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BVW+etPTwHng1TzFtm9HNMleUWiaF3BSfRIIx9dFhSU=;
        b=wRPMkfzSipTKj0wA4mWv6qRhZhcFX+ljoHX6/CQaDmQ0u7KVLB5vbr4ApfRptMyL5e
         pfpWthTUO49nLLezO14GAOML4w2+nX2/S+ciNZ0I4sE92BH3fzIzfoXr8vVNmRJPeenB
         i0akfK2q6suTO1U3FRsU4PeGOS1r89j/ap4OmSFhzdnoexH93DA4VqVe9hsLgpyD3y4l
         +Co6Rdm1lWbFgp+Bk+KMZK2PKAY0KNsp3Q118+jwLtnis1YKezm1hgwj5cNjxQyp/rE4
         YGacEs9vaJ2K2FCe74KsUnLnFJsOBcKUH8aRKhmq1h1jOgwoGxwGpOmtIOxxvzipXZe3
         S7nQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6AyHVQlTi5K900uRy/RSN6Xg9XPm3xh1oxZIGWo9yn0tDyVeUlUaoVC54T4TFMy2UMJeDor8Hg0SGc5Lca0Yb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+bQNpN0C69JnC6tx4g8oJmUZ17bWXF/rhL97YVfJkXf2e0J/m
	0sFqRenIifpWOjxwY442AADQ01bli/+iCrETwSciy6Sc5xXw/Kn5IXEMAMf0tJ/xEopshlDtBC9
	5WnZTg8G2BZTA+z/HIaIfSZSNUenYBaeuL9glVANxCvNYhz2HFqy5V8uBUYvJWlIxvqNhnFcboy
	F9GQ==
X-Gm-Gg: AY/fxX5mUepolnjsc8gdwUVFdOrq5HA7+92DRoKCaOgLHTTljt2j3Atcq9K3bOrAwau
	6PaWgH+P9v0HxRMdLpx1ayPzyCMCy4iSf+ZN5dqVkuXdaa+ujvTam2kARklFPCJmsV7hivfP1aG
	tACFZzw5lZCdPf6sYX01Z0JKdOpJDaBz/4Y7eQEPWbEGw1UEarRniFVJVl6xOxUjVgQkFKnMLTV
	OztadmgBz0GjcSRU3xWrHHHpdbct6S2CY/xqfETzgkEXK3H5nUMjLSscnjFKYYG15+7Liad5PzL
	eA3Tim5Ms1/Q5T9SESpSoFW0+cq8vpFHaSjv919HG2L8SoEw1eIRmAUNAI2IEwO+6+EpW+sl2j6
	gCh0cAz9Ego+Pka3m+V870eyO5KPUpL3R5zc3
X-Received: by 2002:a05:6a00:4387:b0:781:17ee:602 with SMTP id d2e1a72fcca58-81b7f4ef1b0mr8391917b3a.28.1767958159717;
        Fri, 09 Jan 2026 03:29:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEXnYjMu4puvMm6nxYJUa98/3GAc9CeW5FaojpFB0W6CqLL53DeHyB5cvLk9bH+2EKkXFdCqg==
X-Received: by 2002:a05:6a00:4387:b0:781:17ee:602 with SMTP id d2e1a72fcca58-81b7f4ef1b0mr8391899b3a.28.1767958159142;
        Fri, 09 Jan 2026 03:29:19 -0800 (PST)
Received: from [10.219.57.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e46339579sm1667009b3a.18.2026.01.09.03.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 03:29:18 -0800 (PST)
Message-ID: <b0a39971-5616-4768-b08f-b359cabd2f6e@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:59:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/arm-smmu-qcom: add actlr settings for mdss on
 Qualcomm platforms
To: Will Deacon <will@kernel.org>, konrad.dybcio@oss.qualcomm.com,
        robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        robin.murphy@arm.com, joro@8bytes.org
Cc: catalin.marinas@arm.com, kernel-team@android.com, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
References: <20251209052323.1133495-1-bibek.patro@oss.qualcomm.com>
 <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
Content-Language: en-US
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
In-Reply-To: <176764799410.1451727.17568755330994660848.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WtAgmZNx7-quCKRojoAv0ebbDZpxwlVI
X-Authority-Analysis: v=2.4 cv=EazFgfmC c=1 sm=1 tr=0 ts=6960e690 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y7gZjIUQjNkmgTN75kQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: WtAgmZNx7-quCKRojoAv0ebbDZpxwlVI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA4NCBTYWx0ZWRfXyLSV7DSn4YNm
 iyoK/cVS0QYVEuwW/yZQoiHF+7SYVoo6lqzdnPcxFGfwp5dBCkw59LKtNdTwbHEbPfAyfD50SZk
 N3+ctyCt6fyxWJ6ccU1qiFRPlGq7wtoB/7qZ33TOvAIpArydycrIX9wvujKpK9XVPDsBhz5Q7ht
 MZyqqQGEq/njSKmOYrLufJCSECRzLPzRkKooKDqyvhj5eUfoeP6TpOTMrcvtSe3AQ/nbZ9LJVUy
 gN+mLzJEotxgw52QRpNGjJfKWzdS2vJ4Zos+7L0dqK+nw/dbW/bRIb9q/uScEI4S8WzI444YnmP
 vI35iWgzes0cQ/CmgRLnhH5E3tpfN2SFmYh54CiH/HPL8vM0vKJzj3Rm/Mn7vSe5HiV8DPdEAaX
 W2SYqzt7PWs9lNZn+ZHFs4JfuvymdUnI7KA8zDvNp9BC2hbKN9+01JnFpFm+zEOCVN15JPkBLXs
 Rs2iqaQNvYcxPE0wJTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_032921_920497_9042F569 
X-CRM114-Status: GOOD (  18.28  )
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



On 1/6/2026 4:28 AM, Will Deacon wrote:
> On Tue, 09 Dec 2025 10:53:23 +0530, bibek.patro@oss.qualcomm.com wrote:
>> Add ACTLR settings for missing MDSS devices on Qualcomm platforms.
>>
>> These are QoS settings and are specific to per SoC thus different
>> settings, eg: some have shallow prefetch while others have no
>> prefetch.
>>
>> Aswell, this prefetch feature is not implemented for all the
>> platforms, capturing to those are implemented to the best of my
>> knowledge.
>>
>> [...]
> 
> Applied to iommu (arm/smmu/updates), thanks!
> 

Hi Will,

While reviewing the applied patch, I noticed that during the transition 
from v2 [1] to v3 [2], one of the SoC entries (sa8775p) appears to have 
been dropped while addressing the review comments.

Sorry for not catching this earlier.

Would it be acceptable at this stage to send a v6 including the diff below?
Alternatively, if it’s easier on your side, please feel free to squash 
this into the existing patch currently applied in your tree.

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c 
b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 456d5146831e..718d102356d9 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -43,6 +43,8 @@ static const struct of_device_id 
qcom_smmu_actlr_client_of_match[] = {
                         .data = (const void *) (PREFETCH_DEEP | CPRE | 
CMTLB) },
         { .compatible = "qcom,qcm2290-mdss",
                         .data = (const void *) (PREFETCH_SHALLOW | CPRE 
| CMTLB) },
+       { .compatible = "qcom,sa8775p-mdss",
+                       .data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
         { .compatible = "qcom,sc7280-mdss",
                         .data = (const void *) (PREFETCH_SHALLOW | CPRE 
| CMTLB) },
         { .compatible = "qcom,sc7280-venus",

If neither approach looks suitable, I can send a standalone follow‑up 
patch, either on top of your tree[3] or on tip.

[1]: 
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t
[2]: 
https://lore.kernel.org/all/20251124171030.323989-1-charan.kalla@oss.qualcomm.com/
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git/log/?h=arm/smmu/updates

Thanks & regards,
Bibek


> [1/1] iommu/arm-smmu-qcom: Add actlr settings for mdss on Qualcomm platforms
>        https://git.kernel.org/iommu/c/f91879fdf70b
> 
> Cheers,




