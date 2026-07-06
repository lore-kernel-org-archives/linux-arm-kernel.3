Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DA7C44500
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=; b=XJcP5/ADORMrgz+4b7pA6yYLEJ
	V5hePkZ3sU2V6CMq19oRtTuzZU+rjLB7cgYAW0MeQ+sXU6SbyzceB2CSvpmb6bmr8mGFLLfE3grV5
	V9jXQZwGCGfKaokKvJIWSt7gdFLznSMBbfwQ0ucBsb+7d+PZdcfkkEVbl6KZzftJrP5M+liIVxvYe
	BpvNGTO0DCUhbPA0zO/gQ7pApK5GydCdcSQu2WYAe9s9cBY1iv0uShkZkbOf8wB5pinYnLtEqu0V7
	1c2DL1EMu8Yj2JfJsjPcQqbb4CHKeyzxXwuf9TmxcmoK+txbA1zd1O5fBb3XyNx1RAhH/EEnaT8Wv
	R7cGArMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghAb-0000000CJFJ-3WHp;
	Mon, 06 Jul 2026 11:07:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wghAY-0000000CJEm-1YTC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 11:07:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666Ax7K0245529
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 11:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=; b=psP9WYXzjA6tVY4c
	e7rvWCUSBKLLxlaKYYldlfSj8q4wfEcWRj8z0GEpzslEP5lCPfkuOd0puPbQnESx
	dpHExnPs3jZUFkF3Qtj6ig3uQDhfh0W5LGqf+KBRZb95RDDco0i3w67KSO+AaKVA
	n1cgehAjkLnlQ//KiQS7HScVSQnbA76/tV75eE5Z7o0INDuV2vgr7DyOqtXFS7qn
	E5O7ExMLndq6u/rPHHfCpi8YSgNdg//4RILbabVAENfoj/nOPHSpNCc/o26wbx24
	s5P8arb22Ut9h7Xjcaw9TwZ3SEgi/xD2yyezhU4wYLHhkhdyHFS+rvennSmICyqv
	8A/g4Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98g7ha-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 11:07:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c07313be5so3271121cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783336040; x=1783940840; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=VXm+3klGOSz5Fm+N0wwQkgm7uBzzya8d4yZ5NoqtHPAAqcNw3h9w4egMyr543kqK9M
         1kbvvd0SLU/t/yqMy2OJXPqGFsYVvahsSKYB2Rxn2ZGq3yF04mB5TUbpsEEGY635+pca
         FbFK0iOMAh7wFhvsif+amETP1lg+4U1n8lhhC5T/n6QRp4l+yQOuKqxYEuxTMtKHk3WS
         DwMdu2Gu37vZFj2KiaeixN3urMgm8rFEf5ImvpHBlJnc1na7m9WJKxkx/EwRmIiuK7EI
         BYGI1fdueIU9t7wLtI5hTvwoIuEQ9QSKpC3wgdvkcel4/GJ8qvZAqbfmVtXMKhd6ZNZG
         UThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336040; x=1783940840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pBztFgeivDEDVCYAqSb+ojmxplpWHAAOO/i8mhVfjVs=;
        b=QCLorILnUHeXwgVzf11gWWFYkOyAfn7KKTGtzcRQyPKaY6exFlz0NTb+SpuQXt2DiQ
         L8yNsC2NT49DxQeBQzyPGZFV7JK3ksMzLBDmQMQHy6nP38Zpvp4E8snwJSfPhXVutVGN
         7ndg8BXR4/TvJDRHkdtHpxKNh+kCbaO/Np9RCsDQJDzH9Udzj3kXt5uoH3d3kLdIckOw
         cWKHwAkSjON2yIsDLUkgtTUV5JvYbU+2G9gUHGuk0HVRG5DHiWU27t/B+MPQKPRPMu4N
         OKUhqFhBVhy3IKNfhDWlnJw9k4D+aHkH57EzzdD9noTE3zbB3syXs/H7QW/KDS9rSoJd
         B1yQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvxhuANZNtOhZNqpDr+BefHHOAOkYfY0SaU9Lmvqo1zip5zpvXG0U2nQg43Z7CZoM+tcM3C31rolj6/hd7F3Vb@lists.infradead.org
X-Gm-Message-State: AOJu0YyyQtUOQIoT0BKyAKe7evLgIs0FyuCmFFmRy3eP5gq+MqFV0LgL
	TDrJTw2JApNVrOkL2x8rfht6PZs7QXgqiVZwv5PrZDbB39cExOzjGS5qvHlD2bMnnnqFTUZseYb
	lQMDUFsbioKsuU89iyIDCSqAiLgL02Tm7aPQUDQQdzs9lMDmSKs9L7/MJEIKfKMebpHg6XoSsAH
	m7qw==
X-Gm-Gg: AfdE7cnoCCZ3Ed1LMUBTQOULcK6EU6s5HkIif195o6gGnhDuJ9y6I8Sl/V/edT4ZGWR
	DK7SuyZc82RopIzjTQfv0LwWfA8LKUN6KKD1bhsmf3Xd8Ir3qwDCk+X4XQGn6n6KAS70aRtF8Lf
	0RvnYpEw/jBvQhEJUOxDQRTbuYCduLwGb8Z9129skEkjVmde6uRa5qcLuMIH6NcEKuqgWYBcWXw
	391qT9YBG6TP5zc4mV8rq5UnvzP5umNCank8SumQfhe+STZlaRuI0edhbPo+101Wx4Z40MqCFBy
	oxVCHmgtIefOjQ7FMFGGMLYhgxcCxvTsfGl+0g7Av1VY12i4U9gq2D18hb5x6d+7uE22yQ1vNY0
	23Wf69kIb7iGqTIQy1zfgkJnSg4qPljqPlSg=
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022811cf.2.1783336040248;
        Mon, 06 Jul 2026 04:07:20 -0700 (PDT)
X-Received: by 2002:a05:622a:347:b0:51c:2101:f0 with SMTP id d75a77b69052e-51c4bda6c05mr97022121cf.2.1783336039446;
        Mon, 06 Jul 2026 04:07:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b6055039sm720881966b.4.2026.07.06.04.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:18 -0700 (PDT)
Message-ID: <10b0ad51-8766-449c-a51c-979364e6c781@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 13:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] arm64: dts: qcom: eliza: Add GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-eliza-gpu-v1-6-c9f1354dbd29@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4b8c69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=UMfccTTTTeY9HYHi3ccA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfX0qQ1hoznCBeZ
 4GujBhqL2nEyB4Y7Sh8Zqlx0DQv8CzR9CCwIXMSfhxcvuHtZUiCFkofK8HBRuV1go3LkEJQvH2S
 IOyoB/od2guhPTee7I9T/nFMqiRITrtPjcUNbkCyF5qBX4UniszuKbEgBXeQy0SLgMWlye6rlul
 QnwiVqJMEA1oaSpQdSSyoIuoKdA2S5JbKZWOruLhJvViG/N5oonqH84CyrI2HNuQWYVGJO8UdWa
 tCl/NP3zDSAR6uN5xsiwYYwF4sL6cqO6V4Kg1tCZniW3hMm6ESHV2J3q6/SrmG65cgN28i8vbkI
 KNnNxNszRiZUSZP+kWmpxhxA+cWhJO4gXu0HJ4KPVnc3yFi+nWNht1ErUJ/lWSTEEo65GQJsZ5Z
 rp3jyHynRiN9Xw5h3MqQ3F8dlFKDK6uGxtGTk5ket12sdYCxMVwD+1nuFTR81c0gA7r9v1bnE39
 BJAbedoIU2vXWCLdnYA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDExMiBTYWx0ZWRfXxxkcaA/txUl7
 fiALiFJtw1SkeqxwXL/3O2FhBA3pzWvqsB2jzkVKnk/24ETjJOlLG6icJPuNv1SCHXpALUE1Jmv
 hpzA1wrqVt2wGqbWMf/O+AEEuFC+/1g=
X-Proofpoint-GUID: 9UgejEfuxom8HEv12FwSnzK3uzwPnf46
X-Proofpoint-ORIG-GUID: 9UgejEfuxom8HEv12FwSnzK3uzwPnf46
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_040722_420167_DE57E667 
X-CRM114-Status: GOOD (  19.58  )
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

On 7/5/26 10:14 AM, Akhil P Oommen wrote:
> From: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> Add the nodes to describe the GPU SMMU.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza.dtsi | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
> index c5635f22e2a7..e5b8377e6c3a 100644
> --- a/arch/arm64/boot/dts/qcom/eliza.dtsi
> +++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
> @@ -2674,6 +2674,44 @@ mdss_dp0_out: endpoint {
>  			};
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,eliza-smmu-500", "qcom,adreno-smmu",
> +				     "qcom,smmu-500", "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,

674 is the correct globla > +				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;

This list is not quite correct. It must be sorted by the context index,
to which a given interrupt corresponds to - the driver relies on that
to give you information about where a context fault happens

Moreover, I see that the interrupt sheet has the bug where some
interrupts are offset by 32 from the base vector, and others are offset
by 31 (i.e. the SPI number doesn't equal irq vector - 32) - please find
out which mapping is correct with the right folks

Konrad

