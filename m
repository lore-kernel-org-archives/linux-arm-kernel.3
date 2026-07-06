Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FF7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=; b=0tnloBBvAArehPgQ9B/+HNOyUN
	BhpB8TxMSuziM3xpYH7TvbfEpAB/M0cdYbo2s8gcuj3NLzFoprNhROW9jR2D5vMtxbws1ckJ7jYOW
	Fanh4Nhk5RqjIAeSeJn0Jof9oXEU+uavLU0162OpG96Ec5ZVmI8LLSNl6IwV9ZUsZ+bGyywIVPx0t
	g6elP8ScOdjeSlqGmCbyv8jmlwTb3MOPscVuTnnu7cihhN/m9NnlQ5wUY4NQtnis89aCLIPBnTKqy
	CH8v200I78uId/i+dt9HcTWAfsxd6hWoRdyPh8EVxCQecITPM9AM8eEEcBulzKPXWPbr1GUvke7JF
	RVW1a8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfhi-0000000C2WI-2kfj;
	Mon, 06 Jul 2026 09:33:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfhe-0000000C2Sj-31XU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:33:28 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693rte107424
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 09:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=; b=oV4pdxOFkkgiwhy3
	KqQkRC/eNXZnrAUtWwLiMjuiM9z75nTKAlsexWfvJ06t8B6RMx1uhJ3n+CvmsGvq
	ijj3ukeTsKiOA9rME3WLIRqParkCUvFsqEPrM7NAllVPF69cpNKHrm7/RWwAT6kM
	vMg+2abWKTLmYA+EcGRmtq16AxOY8VT0/lyNrcjvYE8Iu/KXBPmqxB0UsElSBR3Z
	/QKljMdrTPLdXnr2gHXPBVEsuD31Zvk0qxhQQ62aXHKcLHuRx5e3q4ykx1HopZd1
	leEUczyCwW6zfkO30AlDmc8rEN5RBb+JoFUOWU3w7EBRRWhjz0nS5NRLA6eAMcwo
	cVsUTg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur6p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:33:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef4a54f86fso7563976d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330405; x=1783935205; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=Uw+Zi/POqNV9a0S4gHdeN625ZR0bxN2yDgME2jBbsOhAt3ZQOYqtqLPXKJMVoUvoO8
         1V52Y11B+6SXfdzHNIbpo/lrN+jeEwK/Bi/E+SrRaq/YxwJmZac1jRgtoLMwEkCkK3Oc
         Z7VVJzF/I2HZtYYsVvOCjNKBz8H9+Da+/0IrcWouZDqncG6KpNJ6YLoO65Ye5DK2DqpR
         ypKoh5Yi5t9cTo2t1URFf8uzCO6hiZqOrqveHNq8DqMzbc8BiUvq045U1VNaH8Lw94mV
         6zFU5+6sbiQ6yEs95aBVor+/qQfbZ0468n0/KejvNetS0eQfENEuEn7kUYlJeKanVTnx
         9Odw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330405; x=1783935205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CqI3glLxpjkIaZ4hS8KAt+z85sv8/xneAfqqjsT0BtM=;
        b=f9ScjEtvn7lFymzX7cuAxAb0iswOFMG0/+zTaLknp+KFjfqfO3sMFN9s+0PMk6WZMY
         KibzmeUVfzDQNbfal1+yL9luizOK9u8QFAWfau1aX+8XPGDjhPJoKO3ekv+U5xuDFAb3
         SFR/Ce8QV7uz3RBRpiUZGq6XkOLNYeeU6k3RcgtZsqFpOqjFJ2+VtirvTusbNlU7T9DB
         lPQCc8ohdnD5lKb9pu1zIdkIPLp6yerNKcoO0vZ5N7jtfcInbGrPEX/Wx6fHJnEvuou/
         4XIgNhwLCKEwq7jpR+bwcu9l5AddhCL94vAxWMxnpgHWmZm7hyxtpX0GXHokXCrdxcx6
         2R7w==
X-Forwarded-Encrypted: i=1; AHgh+RqyQSl9pru3ZZygxipumP/7b2ZrrcwxBVAByihv5ZYlmKL0oK+6tR8icv7ivmdBUFlMtk8TjvZNIuXzP2/BLft2@lists.infradead.org
X-Gm-Message-State: AOJu0YyPxQcFAZpICxn3i7sWFt3TQ8UhhLPo6I4VoDT0SPPxvMzr2wej
	JMvm/eXIrS9tr7xAJmeIxh+8dmEkxxpxdUB6rSL4zZezybzChueBfsNX7SHIu7KSpXyVd36gdRT
	kYgaeF+w9n1SDluYbp7r7fuCh0uxPnczZo1PASUB+8I1Tv2+UXxOddJs/cPid7QDLgFecz19bSe
	CwdQ==
X-Gm-Gg: AfdE7cl3qBBxh92yI4egSeOD9hBHPYiEH/0nhyL/yXVRrmudpvBSAdzJtfKOHuP6YHe
	R+pTQXx0pV1hcEhUZdxmvnZnfO8kYTRCYulzhD/01tnSqGYz+6DcPqD2gfSa7F14WaSGU0r45HD
	rXX8PxRUb/6bad6Y+j5gO2YfILzVsje5nd7s1GMccHWbNKTxilXu/W7rPY1mv1pyqbxuoVB+iVS
	Cz72ldu2Y5kDnTMJhdyMdMh0cZqIg7igq/0Zwn/qQ2jDeJjJMi8a1LsEM+qn1KOyqqjrcN7lEBU
	qAMD35mkW7nkkpPtlJynApbfWAwaX0mhIesMxzTXBsmSekA/j58hsWuJ6C/vWhnUPg8wjLemzGT
	8BC3LSZgZUP1+EiVjDw342BAQNapmogAtg+s=
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106703756d6.10.1783330403626;
        Mon, 06 Jul 2026 02:33:23 -0700 (PDT)
X-Received: by 2002:a05:6214:2503:b0:8e9:f5de:d5fd with SMTP id 6a1803df08f44-8f74caaf417mr106701416d6.10.1783330398707;
        Mon, 06 Jul 2026 02:33:18 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19d9e701sm3807545a12.21.2026.07.06.02.33.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:33:17 -0700 (PDT)
Message-ID: <14c366e5-f030-401e-b51b-62d833f9dde9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:33:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
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
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-3-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IJyDHMX5P0T6H6yvw3HbhHJ5ihy5b60T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXxi5J369kGfTR
 cJbnD+t4z9W8oV6ktW3d3rVYcbyf/YNXfGGap7MN3W0PlvqWPJ6zhuSDAN4lpmBA06PmQ2sOjvH
 UlQn2WL9PN1vc6KdLdvCH9GP5wcrYMU=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b7666 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX0zrcq6Z/RUBU
 VmoL1hNtjpV/M8qUCaTFkAh3b2yifwBEdnCtsWRaml+suArDF7xd/V6USBe9/9uKd1Y3C4W4q7Z
 d/HorAPVkhbbqso7e5RPjeEFnWvM3Sfzh7HTiHOH/AebqJZuvfOXunfE4SNVm9F2IiR+2+EkC9F
 zzE64Z/h38LFQ2BybcriFYiDynQqWTcAKUrOP2GCOSlgHhSTFja5i4FRSkcFbEOXK3/QYBBe/GX
 z+3b1RZX0VkcZ7YBH3euuxlEEN7dg0T4eCqEwRXblMdZ4sdvCHJ45S2uMMDqDBXo/OvfYYjrui/
 48kAPbYjx0tIexhYGJCB74w7hGBe24QTysFs0qt3W8EMSoYfFeqbGXq7fVQZxacSJiyNwMsWIPb
 EQDsE4oVvq74owHtlYXy6t9Q4YRgFIZjh8Ye+zi6Ab8ATazdyzCYQTtduo6unIthpfn+zwXXqra
 4gsCkUfCPAUBttOamyw==
X-Proofpoint-ORIG-GUID: IJyDHMX5P0T6H6yvw3HbhHJ5ihy5b60T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023326_791467_44C37AC4 
X-CRM114-Status: GOOD (  16.57  )
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

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> Add the Adreno GPU SMMU node for kaanapali platform.
> 
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali.dtsi | 43 +++++++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> index 7aa9653bd456..19eceecc2a19 100644
> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> @@ -2601,6 +2601,49 @@ gpucc: clock-controller@3d90000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		adreno_smmu: iommu@3da0000 {
> +			compatible = "qcom,kaanapali-smmu-500",
> +				     "qcom,adreno-smmu",
> +				     "qcom,smmu-500",
> +				     "arm,mmu-500";
> +			reg = <0x0 0x03da0000 0x0 0x40000>;
> +			#iommu-cells = <2>;
> +			#global-interrupts = <1>;
> +			dma-coherent;
> +
> +			power-domains = <&gpucc GPU_CC_CX_GDSC>;
> +
> +			clocks = <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>;
> +			clock-names = "hlos";

Let's match the property order of glymur.dtsi

for the contents

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

