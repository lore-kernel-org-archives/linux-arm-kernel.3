Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B497DCD4F39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 12:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=; b=GBJqQrl+xuSUlwKSjz/vMdXky8
	XKxYiQZi9QS4PxBE1cnV6Yszq5u7G5Z9dnoHgMVMyA1PCz+6Kch6qIngCv34XsYVdr419PK4Lxlb9
	t0XkT9geqERjEXJYCmP6uHracQ498T8NfpCjkLG+WpxMC3AoVlolNAhdsT7YlSlAIdlF1wzp2tuPt
	YHgek8e1Sd3Yl9JjJj9cBKucgsWo74Dbg5NL4VsVp1xi/59/pgCbitHLiBlLkqhcESydVEAzhaBd3
	yu1bK/+H8Wz5b4mZsBbQteENL9Fkfd7STzDHPB0ZQDSQDgydLE+PjBikyUhg/+hCCxKhSFqmDNXkQ
	HvlHZ6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVIc-00000005TRP-2zzT;
	Thu, 14 May 2026 12:36:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNVIZ-00000005TQ7-2RmT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 12:36:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeYfB1717897
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=; b=YdZfUXijc1B63K4O
	JdArn+cNh/r/AmZB/J0SRCcZ28FQsxxgqDgzALCmvHrC6TZ4czcJ5FSfjCVxIdLo
	m5wiUrTeTxnJ/Geh+XNmLOqRuJJHLJ+E7RGvS2ygDQ7P67Gp/VE6+L2Ue5sBctVH
	BcvvCPsVXEJYwbtK1F6ULFfEP4vh+3tMCFzVpzQz6u6wbT0/KOEcco6smNCe2tx+
	2WikL6CpTdyaCDtwnYRf16RPCqNwjI9OCSoJm6P77yHVgLxbj4DTGXUUg7br8UT2
	RUMKUMe3kAUtmfFg5059U3y59k9H17t2qLjKS7i9zCV7MU/ScqOv4z/mAbF4AjxN
	AXdELQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e57y7hfdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 12:36:18 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5751eff95d6so462969e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778762178; x=1779366978; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=;
        b=Ehf7VTuxmvQl4Oi+ldBPP5WezS+7UUbBrDqhsM0ghXR5e99/l30GECVrOJHN2adCgh
         V97RDvQq9CQd4/u04ENYK62gWfSPPsnI6lx6tO9AN8Nub2yt4y9o5NaJttYlaH+k69ZJ
         NOUoMcThok+nwc1GZR2HKLkC1yESTNkY/ITG0kIiVG7cl7syT41slI66ac7LfDWaUpGZ
         rureLYA+RDDJ8NjQuc1GsEAJhx6W+MSu/4eACSswktRznD7u99sKMUyVxSgS/YOy3y/Z
         884R7XAs01M/E1nPxcjfKzaeG0IgXmgoVfBTsfesHEdkjcUCIf4rfybJtNsvDU3CoLqj
         aXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778762178; x=1779366978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L3E4RMWJDlN4oTIAm3vwmxetHRc24rPFl0tCcoD9zto=;
        b=M+8oxcJLA0XWaldPwMowUovtfr+m82jreTpELNArqknWb7iYgyMWxTarOcHqPEZ13Y
         7NTYQWQON8ZblzsxmzrylVRem7nl6CxLwImBwMqwtOIqTX9H6W5xxs+VL1bryfyy640P
         5d+lvlBwGz3AekKWj6rlRj1pTkViN8qZy15ABPLAyNq9Pp9b9DrXxohiZyp1175dOEEm
         TyPg094JDeLCk7yKq4qxmpILF3/Fz0jdmEFqZ3cdHnl2gZyOJGC0p15LnsCJbipYS3oM
         uluRjx/WSA2A5oz5UUkjgqPQ9eup+PCmHIIwverDR2DW0/i76ljoFg/U98GRPt/bOW2l
         snog==
X-Forwarded-Encrypted: i=1; AFNElJ+4j6LcWbibir9S3Lx1C1psIkQxEFEdq1cY9ihKG5pFBFHGo8cdCXfCRYcLH7FFKjosLOdx+hiuFSMee/AGFaQu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6IdxkTCrnvVqL7lmh/jVJj10S7C7ih0SP72WBgZKpQJJlqRyp
	3TvwqXPbLrnemN45bzs5TUqo0CL+kAs4VGKcDNZEBEAbAUKwL+VDvTNYNfa7kOwDcDfZxViBScN
	ljNcMsZ0QlJlbT8apwiugqbAlteQNY2Lx82JKvue7tnPvLQ9JLF0RkIAFYEb70lRkKprQNKvaFC
	RrEA==
X-Gm-Gg: Acq92OEljEkQEiISZ2W90+DWrvbRC/5Hxj1Cu1iLVosz+CiK/SMiCW06+WZLHEP7f/Q
	ugLxPxmXdzkSUu8H45ODcXhOTkCsrhu6um+bL5fpObCHd8G7oKVp5EJaHa81pZVCPDWZ1JJXrb9
	8p98I7pnZlTAE/3zY+LxSD4H6UjHNF6DGUyMaxwzROJrIy1J/SW1kijb4oJXTmx0zfsdtZXmL+h
	987S6HqXCNz//b5CiPT7YzjPMKYp74opQJ791R1OYCX8s23GnfeFYD5iYRGqZOgBUwYt3I4iCkH
	mnEFvAIxNajin+P/MtHcEezx2rAjStCp/wkVy9vFl8hGlfLCoORS2LY0IaeutSOHQvbWIDpPnLo
	OQMyIFLMnp0TcWVh+OJGIvvyOB8InhUYEUYK//pOjvpKUk8Oq1gqxzvYSu4rjlrmaPsWf4+dGmT
	W8iRqnoVefpJQcRg==
X-Received: by 2002:ac5:c7d4:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-575e6f5a3b9mr1298040e0c.1.1778762177966;
        Thu, 14 May 2026 05:36:17 -0700 (PDT)
X-Received: by 2002:ac5:c7d4:0:b0:575:2300:9f54 with SMTP id 71dfb90a1353d-575e6f5a3b9mr1298009e0c.1.1778762177520;
        Thu, 14 May 2026 05:36:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4bcf7f3sm85198466b.2.2026.05.14.05.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 05:36:16 -0700 (PDT)
Message-ID: <83958f30-59c5-4b15-a62a-92da02187c08@oss.qualcomm.com>
Date: Thu, 14 May 2026 14:36:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 42t7gPi9OSR4-ul9Y6tiW_rC05o7GWy_
X-Authority-Analysis: v=2.4 cv=UY9hjqSN c=1 sm=1 tr=0 ts=6a05c1c3 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 42t7gPi9OSR4-ul9Y6tiW_rC05o7GWy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEyNiBTYWx0ZWRfX9YkzG2vHFHxR
 /c1B7tnIMkJzIZCnX1d66yx4cLTtHub9rb/hAA5xn1V6f7jRAmh/XCiri8edpqKccs34LpbqMtJ
 gyt+ehZD0rNqKEzWeoojMuzIHITHZwUgn9N+YDp3aRM92w4r/SttHqfvJPauRkWXSim/N8r4Bmh
 uYSpWFocB+LOmovkvHMY7jUEFkPNpFGp8Q7uv0rCDSy55SJwoY92ek6Yfy5HtdP+yPLaFo0/0Sj
 kTQYXPOb14KNqwOZ4fHhblaO9Napb48oAJK26TFixvZ63PS8NplMYVc9SdqtpYahgrzf6YwEn4W
 /EJbwrYxBkCENCr6A/arKBfl/VFYtavkQawE++Ia6U0wDxdhHkN2ENNadl1HhqSr6ET1EvtlAta
 YtiCibojdHFvBQC0AZt72O5/L9kkfu6OV4fkR11YdjXy2ZnGxwyG1aq2ozzSOg8nUY+6lLcFwxC
 kuDLzddMBgitbwqsa2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_053619_632514_BFAAC131 
X-CRM114-Status: GOOD (  18.19  )
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

On 5/12/26 12:23 AM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index bab654bbd6d0..26a4de9c8d45 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2597,6 +2597,47 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500", "qcom,adreno-smmu",
> +					"qcom,smmu-500", "arm,mmu-500";

The lines are misaligned, but please reshuffle this to be 1 a line

> +			reg = <0x0 0x3da0000 0x0 0x40000>;

Please keep the 8-hex-digit padding for addr


> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";
> +
> +			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
> +				<GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,

likewise, please align the '<'s and align the property order in this node
with Glymur

Konrad

