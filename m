Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B655DCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=; b=1S/0484jlol5tk5fuzRrmT8nF6
	Me9zu0LK/jhjiZf6oUEIwNdTzMzd2teRy3+PMovVcoM5ZD2hJRoVodm+8pVMxeEUhXHD6/QsTCO0C
	JuWQha18tGRJRSCChSAQORSWJWeh1tskTWfq7ivif90wUfQ2XK2BFFGUYS/Nc8uGnZOO6KDmpdJsk
	AKYBbA4Jwn4ILbaS5rDOP+Ry6s7VJutYPeflPj0bcvXtkFvdkzURb+tQ2SYxDUCLOS5NZGQHiXn/N
	xINLa4u1NTnz4Mm7Og0ibnGDb0HYgadroRqYYZqe51NBXXxZTQsYiL/ATXybeAmi/E8SNO3csd6U1
	bKX4Wi2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNscp-00000008Rtx-0lMp;
	Fri, 15 May 2026 13:30:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNscl-00000008RsM-3Syg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:30:46 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8kZZe1714932
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 13:30:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=; b=ooi9Fdk4FtLbsM4X
	cKhHYk3K18NMUCkkpPFmubAdUK2LhChC8Roo+7ztd4me2ZUswHCenloPVM/Nu6pm
	cv9HTdq023eJiZggnPF0UVJvzL5DntK6DjmzGWtLb1JGEAV6wVkkYZS+ZttyGDqe
	dljQ708hOUjAyf9CIH0i7QSRbKy4QdMLtBs1oATVM0z01x4ioyD9wADN85jMhAlw
	sTI8cV7TFFJWLOccQy4xSqrVXbczdPw3YJ+pu/UWDh8E0MEd0VmMliplqy5l9qZ6
	DyYRswoq7Uaigj5gMCNwmMBrl0EzKObIESEQyXRecjGFY/hoXeKnnB5TdhWWMYp5
	c0x8Mg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxt6d0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 13:30:42 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bd00a65673so8366335ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778851842; x=1779456642; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=;
        b=jag/82zMXV6hYqhQO+eQOvOw9FIZzUOzqHgZhKmhZQQ7/m36RCZ62KqlXmvy5G7ljk
         ZEMA7hVq410worwxZ232d5/XHv+ngoJsLR6kfojnxrOQr4h6gCt53g46Mfcu3kYi+J6r
         alMbcfhcQV5ene7xWhu2mEf/eZmTbXHUJo9CfL500wS6TprGxxnaAsk5P+DoxJrbM6V9
         /p/YdA4S40eQWtz0B9sKXjZkQScrGCJhX8H2utl7TmoZojC8Ap823YbSos46Pz4pUp+z
         GIwji8BVl9uPVA+IAqlz02gbST+EQ/J+R8f0bUulHkCNcpLamZK35SzmaHfbCiBgpS+W
         f3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851842; x=1779456642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNBPjawQmJSnV08ZoyTHF4GbC57zg7+EEAvYbW1jGOA=;
        b=pMDeqEAF9B0nx9OwpXEMyZJuPtuRvMkD5iZmCbXIWZuxp9X6ZEUfO8mOYilBJmtD31
         0lZEAVHvxTZqno3fMvSQ/6kOwLHhHuVwOpOVlBcM059WOExyfIMpDE5KmN471bDzUz9Y
         hLqN7GXrc4lf0k5FNgSp1XT9N117j/Zj+e8QKUeGREPjGblbiAzgAmWGvcbv0haWNBT1
         Uju2gXkyEyzEGQ7ON+A4vUMyB229R8/xHSpEB+3k+rs6Cxe8lWuDmpYTxbOW3gq68A9V
         3WYYztU+030lHFOXnmQfrNTwYmN51i/C8CTIFzODDOIe7bU7OZTk8ByInRXeEvK19UAN
         BNDg==
X-Gm-Message-State: AOJu0YzsjkGXZHWJhXi3SK9QHpn+pbZS+LhkXW7MeBtLv54d1Nglx6f8
	e4W2aSanY1Hm/kyjKgpcMFbOde+JiOgzogT6u04XuW1UFr0qslT+jjG1n19uyYkwwA3EBOZ1vWG
	MhhRXZmycDCq0Pn+AHer4A7HbhE5L5nP7ASN6cNp6TOrCKXGMKY9d7JTDPjFyZ8SfcMd6RSbE9W
	sysQ==
X-Gm-Gg: Acq92OHcRdca7iM9CD2nYoe1ojmtXNcy/gi1IkJuiL6jJhfI5S2AkTTqsvfh2vLeuRq
	EkftbOhQnYZpbrspaHSduBhyow2H+zR4ejszR0fBdSv59jgPJ7zUwY8mIxqOu44/0mv6t4j9HfQ
	gYLRbLx2iW7Tz5nEsCsdothk/barT/AYXH4+CByUxK+VLpnHgQBYFLS+5fEUqvpLMG1qo247e7p
	3nSw8yXNRslQyquxPPiJsyA0KwxLh/mfdOoGV3VMCJ71RMnKK6c/nDPLuRat0LsvfgDJiytwmMU
	VSgcY5Pts1KHlRV5OoAz2ZLxUJiuwiy/fcMXNxznllGwNGhygYGpSayxJ5/PCCRmy2QmR1wnOAc
	JItXfgULYbwuuxBoR3T+uELeNB9fMREhsuZfblhokktSo434HtQM9FVXAlg52+54YGcxhlnh12n
	1DaA==
X-Received: by 2002:a17:902:f78a:b0:2bc:cf06:221c with SMTP id d9443c01a7336-2bd527d773dmr69792295ad.21.1778851841896;
        Fri, 15 May 2026 06:30:41 -0700 (PDT)
X-Received: by 2002:a17:902:f78a:b0:2bc:cf06:221c with SMTP id d9443c01a7336-2bd527d773dmr69791705ad.21.1778851841358;
        Fri, 15 May 2026 06:30:41 -0700 (PDT)
Received: from [192.168.1.10] ([122.164.84.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe6b8fsm63057275ad.46.2026.05.15.06.30.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 06:30:40 -0700 (PDT)
Message-ID: <b8f02a31-b175-4dc2-9b2a-5765774b4d88@oss.qualcomm.com>
Date: Fri, 15 May 2026 19:00:35 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: arm-smmu: qcom: Add compatible for IPQ9650
 SoC
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_smmu_binding-v1-1-04defdaa140c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a072002 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pcck7Iv2+kD8UxzcD71x3w==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dvW0RAlsEONp_D_cdWEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: QYgQ1N0jBBo2HEiLSUGeJMTRuxo25trr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEzNyBTYWx0ZWRfX3pO2tQ4QnyHr
 o5fnKotk6nCzVw3BXe4ZSq+b94ZcyZ1uQNdISkpEyS9I9Nx34vNHpkmgym4z60+J40gnG6iwg5I
 WaebTRNP+1p0du4TMTnn+k0M2SQ7H29+S4DpoheillGAHTQyKMwku0h/gn3xMta6erTYGvE/DWS
 vw+atGWJyxvPo09Re4VlqPZ2jgzDz9nttTOuY224T/P9FyAQSPSb+T4jDTldzXAM3XFITMnoAyj
 n0Mljsu+tNN4sRYPmiHVqjyo0USkzT+tj5papS8LIeHwbfKy9LWK/J6pvR/F/bnO0F7LX1K2gIH
 RY8iA59YrOha6ftOnCP5a0C69+mp+KGjOyIEyZOXDYanU2mnR97vP/LgA+5dFZp1XQ7MK+RcbKc
 syyIBM8Vxx+ku0oANUPQKsYw2qq30MUbTsFZJNHYjn+czFmDZep5MAcD2eQpghvqJdORw997QxK
 QoWt3UPU6/KG2wJ0Xiw==
X-Proofpoint-GUID: QYgQ1N0jBBo2HEiLSUGeJMTRuxo25trr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063043_878579_FE999DBE 
X-CRM114-Status: GOOD (  17.25  )
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


On 5/12/2026 12:17 PM, Kathiravan Thirumoorthy wrote:
> Qualcomm IPQ9650 SoC include APPS SMMU that implements arm,mmu-500.
> Document the compatible for the same.

Kindly ignore this patch. I will repost along with DTSI changes once it 
is validated again!

>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 06fb5c8e7547..226f16711d67 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -37,6 +37,7 @@ properties:
>             - enum:
>                 - qcom,eliza-smmu-500
>                 - qcom,glymur-smmu-500
> +              - qcom,ipq9650-smmu-500
>                 - qcom,kaanapali-smmu-500
>                 - qcom,milos-smmu-500
>                 - qcom,qcm2290-smmu-500
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260512-ipq9650_smmu_binding-36dc05d39860
>
> Best regards,
> --
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
>

