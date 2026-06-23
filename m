Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426E0CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=; b=MsKENKw8tk6TXQi7YU8RVNiIYn
	zVKz9l8Tr/DzarOFbQYYqpMAUVVq5pb62r7d4hkugW35204gRG5hrdphMXHGs+nupS1cdpuayjiCC
	9C6EGF7T05XnxONR2iia4LsgqFVFRf5WDpP6DZ/MLvoC5Gwd/yYVv8FOB7GNaZklKjdm1UXfV68LI
	MyX4U6XlxV5dlu9fMiEFFLJg39q2DGoiFTVavzPHq4siGhe3RKHFt7XJjYq1G8FMe3l0xRMr/UHgu
	jA7nN6Svaqp5eKuq4pc1CFndRUrJORf06c2nwSuNNDpQzABJQ4MDnZ1dQR13JfJHPDarB6Zate8xZ
	jui8ht6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyu9-0000000690e-3Lvb;
	Tue, 23 Jun 2026 11:02:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyu3-000000068ze-2wJI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:02:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NAsd0N3664083
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=; b=iZvUU46GibMAwNkz
	AoK7VQzXe+5QNe2NDKKB/mgDiLZOo5GlZXwA/ce67JAiyVLIDN4WwaqOHLLQYnab
	vBvCZ3Q57JQwnF3JshLMTYyR5HF5NGIzzMJR8TWC0N3NYhPMFUx2EqA7l1FU9dU/
	pE/LJoxOVj7x+BnGbz8TfH44/R/DMg7zLiyMOoQRA32bUDzWZk5OtUyWaNw3eKYU
	NgJRdeZH158uWFnqlLx8WmF415Gz2na1sFuj6vDNC8UOplKUTMJStLdbfZlvJDV/
	I5V3KoTsvE4S1ZFmAaijS5B02SRmfvlhsOw6zr0k2+KJfCEwCdUBW0vIlHeZVjAe
	fnjmFA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyp29gt7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 11:02:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c4271166f3so313003137.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 04:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782212570; x=1782817370; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=do+g+odq+B+LBTJaXKLrg/PSccB3z6UF2yLCRu3bUtkIFZ+D/aAwISH3L9c8PRprwv
         5U16Fv8Bxhw6DlYMw/gKt2Lo64gkbtk0qEq1n/f6IIYHGCTPC34HAg/yhXOPnbC1ukjS
         97XluuJU3iGAQH6bpxqn6X1N4hsggVF838EAsg/qKPzX9luSOh8aFGgQ+hlwTEZZNIRs
         z7nyrCVk8nlFXPejpAlPUsOCUm1AcS0sjdGeDofd8Qu0VbeH/7VOvoPrOapCOgKCpVzA
         gSqbTHtxY5uqh7OfuEQk4NEXoTD9Td3MsHEkQvWVtnheaptofJekv9CIyPnDfkdAmYwB
         sI+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782212570; x=1782817370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3Bur5W8WIf69VnzHiI+arDhtZRA4HK1lbpmUhai2O4=;
        b=heLlsX0rDASyaATNoT+bhPkzqN9nfaPIEbEiZhS9e0M2UwVY3BR451avPNgm5LeWCG
         o76E9oH3lOHJWJi9aJBxK9a38eI1VWJC+3GBh2cKnMbwZMCo2d10qe0HHOeZ79mT4wZp
         wrWlaJid4bGnKadHIF8WoOIJDP17WeaG27p0Aw8lgodHywzMd4ARbSLqFMysPVU5EPj8
         NtyOPwLxhTrS5eAePHF14PAUJOA3GC+eHew6absZQZxNzxm8uPerXwf6e2ixsrIGqRZp
         iC+Ld++6KZP1T1ZBAFDI7BbqdwXkeugnhs70ni+DawJkz+o5RyhbRKXSTZqD8LIW615e
         IORw==
X-Forwarded-Encrypted: i=1; AFNElJ+qngVog9l8o9qA7xBB8k9BsfrYD0cT+7Zar8LtY8BhZ2XU/uS4+KDU7oSoS3j61GT4uwoqa1AZIrX9ypO1JFi7@lists.infradead.org
X-Gm-Message-State: AOJu0YwgSKDvpYYsRQn4GXKUZ0U8hm851PdQ4A39Ned2a0OxhY4smTKx
	EdONnwrvwk2hjHCmlNEcSu8TD7SSLRxhWKugM7uDj9jmauzrh8YnFoDvgiOmM59SM8uHJNoqi2M
	Psp340wRMojb2qIeW1bBFCm6vCyX8HeyJz5jgsC3JarqulKtUKl7daFy+HTSoXLlKBIXcCqAHwT
	wr9w==
X-Gm-Gg: AfdE7ckRhuchWGaGAcMEBuTgILgfDoHirapi4XkTAxEz+I+UV0DYTHAhTdWv6oWsH80
	+/cZIYAup/cEdzn7aOZYzHJQ42SWiqIiBgZ2ePAMLWN/pdZWoryec9RyguINQc36xHDhJVLKExC
	E3kR75B2PRlxTlOVTz12tYI/FcLyRB28lOZdFr/VAEsXGC2L2NHKeRPwTvqxW6f1TpLBpUtYTT4
	GGBMXRZg9o9jz82Chwpce5CQl4j9GgxwTYi47EzlL0vCM1ZZVb+tlJbMGQCefOGB8rtje/Y725Z
	AMkyI7oIdFxdRp68u1J73XPmRFAKPUd4i+CuT4VEx03ou/hHVTdwcGYLwqVORDmqTJTNmhwHiI1
	yXa+1q1ygJu1HxhAMzKeyYyMD6Opa4QlqpTU=
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080757137.6.1782212570296;
        Tue, 23 Jun 2026 04:02:50 -0700 (PDT)
X-Received: by 2002:a05:6102:3f14:b0:720:2ba:5299 with SMTP id ada2fe7eead31-72f3ac9650cmr1080720137.6.1782212569762;
        Tue, 23 Jun 2026 04:02:49 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e498cedsm491816166b.4.2026.06.23.04.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 04:02:48 -0700 (PDT)
Message-ID: <e1e492ab-884e-442b-8410-cc100c54fd5f@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 13:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sm8450: Remove unneeded reserved
 memory nodes
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
 <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260622-sm8450-qol-v1-2-37e2ee8df9da@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LdAMLDfi c=1 sm=1 tr=0 ts=6a3a67db cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=dk325V_gTbMn8ZHce38A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ucvaAC8i5b8jwvwENP6Gk1ubAMC-Hwl5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX4EV5AUqddWQV
 Fjj37RWyGUj5ppcRV6ZBECiDxuzjDRyVR9NnGeRwAdUNgDwau63awB+I/52Q0bQkKoXju2OahI8
 nJ3KFvBnt/4+djRWv1da3VFoGb/Ejx8=
X-Proofpoint-ORIG-GUID: ucvaAC8i5b8jwvwENP6Gk1ubAMC-Hwl5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4OSBTYWx0ZWRfX9Zfai8bg6D8d
 GTHjZKjAPObTeAMQgaBKjySRc8mAmy8p+bNimAcOInisxBYo+rdvn8Sj7FFf049bdhdqcs6KAtt
 6ZFhqcH8QkrG+r4eT0daub1b6CyriUpEI73YHIw9j7siXqPnUzzRVPSFK4DdjcnlBuwVINyp6r3
 Wem9/ddqsw3LFjuZdqn1LNVbd5Rbk2Kv3R5fosa1N8AimnJdk1fqS/bihZut7TT/winVfA6IqDC
 i7WOaOS/7HabFkrU/SukV81PcJFptSPNogTJ2W6TQwksbGrTQhzgSg8UgUZndws+svp5jpmVuHq
 BG4uhCzXH20CY67DyFB1HjbNYkW8su+1GQBfce3bycFbgxVML5CYOFBj7q3W/1U4tDXfaHEQqlm
 E++9uTO249ccUstKFf+A4hq/FtsRo3mPnCBj0jyX2QXgirHwStzYPaOMR52iGVp3lrh4A3Q6zew
 0/WGK22d1EWZfxIRGvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_040251_752348_CA099771 
X-CRM114-Status: GOOD (  20.12  )
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
> These nodes are not present on downstream device trees and only take
> memory away from the AP.
> No crashes occur without these nodes, so remove them.
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 56cb6e959e4e..e34e3c05bf74 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -752,11 +752,6 @@ oem_vm_mem: memory@bb000000 {
>  			no-map;
>  		};
>  
> -		mte_mem: memory@c0000000 {
> -			reg = <0x0 0xc0000000 0x0 0x20000000>;
> -			no-map;
> -		};

This is mentioned in the memory map description, but is not part
of it.

I booted up a 8450 HDK and it doesn't even have MTE, so it's
probably valid

> -
>  		qheebsp_reserved_mem: memory@e0000000 {
>  			reg = <0x0 0xe0000000 0x0 0x600000>;
>  			no-map;
> @@ -806,16 +801,6 @@ qtee_mem: memory@e9b00000 {
>  			reg = <0x0 0xe9b00000 0x0 0x500000>;
>  			no-map;
>  		};
> -
> -		trusted_apps_mem: memory@ea000000 {
> -			reg = <0x0 0xea000000 0x0 0x3900000>;
> -			no-map;
> -		};
> -
> -		trusted_apps_ext_mem: memory@ed900000 {
> -			reg = <0x0 0xed900000 0x0 0x3b00000>;
> -			no-map;
> -		};

These exist in the memory map, but I'd guess they may be unused if
you don't load any trusted apps

Konrad

