Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA40CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=; b=fVol4LFiA1FJk92vt9+umRUcYB
	nIpn/5VM6kWTl8tbhXnGPktOHdb1Aqaw+XTIFoueJOonEYTIQn2NLYw7OURYHo/dASFVTPfKXMwpt
	6csO4ut5mX2O50JKwR8E5K/S8eoEFa5xNAxiyJ37E+6izdi/JdaV9ZIdeTFs7CdpmnAeM8rG0v2SH
	MuEl9bJd8Jy8Jn5TA+GzcxgG7L0OgwA0CcjdoNRACMv+cqZdwIORXy4/102oVRW8+v/1vly06JhFO
	RBgp/H6VOBx8rmKqYF0F5cSR5iPWxGph4wwDE4Hmnicy4DbHt6ZTZWjfVNOufs/UQbZ4DtfDZvz1X
	Wg+YTG3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCoE-00000003GVO-3PsZ;
	Wed, 13 May 2026 16:51:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCoC-00000003GUs-0FeZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 16:51:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEiAlS4161609
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:51:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kvW9MFUmG8rvh5PNkmsY1wyy
	sIDeA/uWWz+EQKpqk6g=; b=OKhBglmbyQEX6oq9vBhZaGVssws+8Oa4lvLJQKfB
	4FEJkO4YRuPf1HRAdUShy1fygbwX1pfjz83GjEUwa93LLuDPghfBuLMvFuTG2SLD
	+65p0KgExqbkudiKV2L3KmrxwRmWK6rQVhZrlmOeYqa2bWAX+GcJA5dtB8wV3MiC
	GnZ3NhJtQRhAf+nKH6KnRWLrfB406qwwwvtg0i/brx3tQ7mz47ZA+FOIjO7TZx4I
	4kb1qi66BpS1Ytc8S25d0HiTqTyte/pKRc0O9kDA6FXxAa/VYyTTRoUVFDq585jX
	2c4sPuGmX84QWsN5ESl9w2jikrBUf0wOO+0tNGV5gplOaQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91svw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 16:51:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6329c1a6710so2639683137.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 09:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778691102; x=1779295902; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=CG4daNH+GjrqBsvwOkQwl4a4FMFKY6Hy44iZ/bxppPgMCokS6g1u+4Y4tpUic6vDNv
         e1/0uFPED08i5OXoRsrrO/xdvqrm417A3F6o78NXVsTOb7gkCt7cKVjKu5h5KPTGrGuV
         VehX9wzug4htVEH9eDH+8M9gTlX5cbq63vWl+bAFeKvzQkSar5RLTOtKxwxbt/c9yxxA
         F0d91kBUu/eKqPXH6T9PObZwWnZSmDqf7Du1AKkq2ZQD3vqPSZJwcGZ01xm0awXnNzYR
         xmNQBojinsCKj9cAkmXiDO0mspyHu3q+u9hRicU4vL8BFTQ7eq2KMSq8Xz7NDQBtEOIx
         2Kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691102; x=1779295902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kvW9MFUmG8rvh5PNkmsY1wyysIDeA/uWWz+EQKpqk6g=;
        b=L2MUJPomG8YczVfvXtl++Os1JlASCKxeqh6WEVqkze2HwN6DKv1232XRxXNKNd00iP
         rKfGAdC+uHpIWvHhQTFfO+7pcJZRhBDUZwCptCg4dbe3xKhqAwKp2We0fU/cGzKzuUNG
         4q7Q/5qQQzx5L4XhTZgoxrt4opjHrKLXu2keFRZizwfJAgWRYJsX/oqGJT4NlXh2gevp
         vwCIx0R1vDVFwRExrgbba2VP8I/HG702XaubxE/MXdNRP0WXymXFzU4e31Khgq3k6p4C
         k4kT3PEDNjSKBSaCyE19VYjmxvrwME5CfNpywfoHIujk5DY58wFEd5wPmtjCLUwN2bk3
         3Q1A==
X-Forwarded-Encrypted: i=1; AFNElJ86F4I3l+eIpErnNFclfFy1/9EcXD3BSMfGoqQJUDawe0umi4RRdazRwu9xdsPMgkVcegNDpLiNHPvB7MN+7Nsd@lists.infradead.org
X-Gm-Message-State: AOJu0YzMFXtSQrpmonNTfvXdanI73Ug4v2e2YxGtHbKvL80y0JINYp6o
	fzqmFI7cZOgEA6Gaa2Qdb3I2O5aDB7cR4CbKmhXtlQeDmdtvWEZ//SBhT1ZpvkM7Dl3Ml7pK6w9
	fkO79pCc1HMUdGDeA7TRXXr/eVRE0XALicGkmJXKppQI+e6+abtkYdKdwUGmz8fU2g4V9xn2bwq
	wFVQ==
X-Gm-Gg: Acq92OEnT8/6UAxFOaWCv6GW0oVRgeQgMGYBRRPpo3Pbkksc57+JvhJEBJdqUGOxQAC
	W3d2nwZyoNWoXzOV6ZDlQOfbTLf/k//oteuT7M6PbzKNUQtBBEzI8a6fHr50NvbiJhUgHlZCrBM
	hvUv0CFp88BzxWybmiiW12HZzqJPGXfV+Rzl2kGcGaihgnQJKJXBijxmWAkh7ddJ9xwxKjrjxIu
	NTqaikSbe/aQ+Py+R82JxXIT3M7qZPWy+pr7w2XduRh5I/fploqFA896Sdhd5/ogwp/aXc/R3T3
	Vk5X9qS/bJbnejhCjryLWX0Fk2agq37ZY/+t9mXKf8N8Hv39S6K2oGLwLrxXj/4IhxZtdOUzwZG
	tySCm6smChjF5mkxtzjhGZ1s8SfMte22apGFTBBelR1UJPk8BlFTiV+RFozbhwqKrfb15djvdkx
	uM2CjX5G1MDegshK1R4Wd1556qhzbbterSzeo=
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437841137.7.1778691102262;
        Wed, 13 May 2026 09:51:42 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:631:7781:fe89 with SMTP id ada2fe7eead31-637728ca842mr2437801137.7.1778691101711;
        Wed, 13 May 2026 09:51:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955dfbfsm4156067e87.46.2026.05.13.09.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 09:51:40 -0700 (PDT)
Date: Wed, 13 May 2026 19:51:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: kaanapali: add the GPU SMMU node
Message-ID: <ergnufuk7qx7b3xsccdifdhlwfoxka5k4y6s72zpqvcfmv4uxm@brakkpiqkqhy>
References: <20260512-kaana-gpu-dt-v1-0-13e1c07c2050@oss.qualcomm.com>
 <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-kaana-gpu-dt-v1-3-13e1c07c2050@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LZJimSp0wbih6ANgXcLQztL5_HffmleP
X-Proofpoint-GUID: LZJimSp0wbih6ANgXcLQztL5_HffmleP
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a04ac1f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=54KNg95dvv-uSQ5X8vIA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE3MCBTYWx0ZWRfX6RB3TLqeEg4I
 hn/XKqKTP3TiaRxiOFX0zVhpJrkb05eHWFwaLsQkmeZgS44XBLO8SZP6GAjfAtc86m/UG5+wIGf
 VDVz/+lc780mvmCYjbiXHtKAprbbQDJccpDNM+jH3Dbo9tjxm3Be9aCKJxEbC+uq2T7b5v4wz+w
 zjA+hUCveS+X/MjtXLm1/W2GRbH3McXNkTWP54Ska+BGcTum5bZfnQxELnw/IRY8AAYXpXHR8PE
 XnBA2pBqp3Bc95R1s7TgXMCnl3u/EbYBvtKef7YifkVpPzGbSqI8iDIQTJfyLbHr4X/XvIZJ5xf
 ZpI8Udwit3ZUXfzbwowEDgTdfXEXDdh0cHCt3IpLxhbiHbH6phOz9FygDfF/y9Mzg+m2L4BmSW7
 zOnLawZpW+wl126yxpyO562b07t48VRRJla2RRStRYoByCcruqOwPedp+c4Vs2KcQ23Yl4S9Rlx
 WbSEv205468Pb7SQnSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_095144_112049_58987BAD 
X-CRM114-Status: GOOD (  18.06  )
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

On Tue, May 12, 2026 at 03:53:17AM +0530, Akhil P Oommen wrote:
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
> +			reg = <0x0 0x3da0000 0x0 0x40000>;
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

Please align on '<' symbol

> +				<GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,

-- 
With best wishes
Dmitry

