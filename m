Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B5C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=; b=naA0cT5ZPpyIoYigJxxO9o+PkG
	RlJFnopfL6tHFm/kz68nhhHRYlHWxdRJWm9YCAIJe2+MsU8wCF/LJpB2sxiH+u9FE/BWrTrkjSmFx
	XxFPvEMjullZ2G5U0EJ1vxOG7yODeDq9rACAz1p/Z3JU/ROqhYOGJqdHxpZ/H+IaYUsANRzP4digJ
	0+k001S2a/mmHc0//AJE8EJqe3WLHBuq6q9l50RlKQzhfAIfkKA0D9yBO7RcVir7xxRO1iOunH6Tj
	OxkrgYujZFv1ik3PsjvQ98c2WZMcqwndANOAwnqCRxoaSfLMLrMqrwkqwdLyh1MlCwTiHVZjSIR16
	W1bF9RXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR2R-0000000AdqS-1Vf2;
	Thu, 30 Jul 2026 13:43:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpR2P-0000000Adpb-1hpx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:43:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDLEg1062938
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=; b=WuBkjEPEQ6+jaMAP
	mb7/eJ2DfGQPN8Y84dNiQ6j+CFSIFrqWAsxwUjY42fZuux0vSgKE4CwYUBxJX4y8
	YW4Lhs5BtJG87JVyfjtLs88SO1AZ9VVRACBDSd1dLjCwmFixdKS+k5Jq8L/SkslP
	dy7pA3v31WKP9bof+R+XetAssoV7ZE4Lakkcg1MI8X0lJ3jGB5a8srg9e6F3+byW
	ZbuW12hYQtj5jkMBvX09jKqK0u8ngTBgksd9BOf1ZQrpL6/nfooMFvXsBvRTHLkC
	ktGGj8VTarBbnRPHMG+yr8jQnddWlMP8CDG+t94qhxht+gDofuOu8d9l73N7yi/E
	UvDZVw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfr7qh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:43:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c27616421so3820091cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785418984; x=1786023784; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=;
        b=G362i7UTG82fPGRFGTR9xYLJhshYxSHC4z9d6L8yS5o/9lZriYUzfpACTR/5BwNFEc
         bZFVFJh984yb4Owdr8womxgg6Gl2RR707wSpLbwJel0t3Gx4r5/en2WKYKeH+r0xRhkR
         Dj2OflLH+cd8zGrV4E5cE5lVPw8QTnxAKc2TLxRYRvIdabhXAqaTznrLGIi+McxJaCYc
         qmhqhm5HH+Yv9rKXIqlDLfC1B84wI+8wJOjzDqUByeqMY9XR78183S/r0gFZX2vXz0sf
         JCeHrUdjGnxtjj8DhTtKfERexRxIW8nFTiFMGTTB6M16s6INhN8viyRaM+M7tsuVnJCZ
         eyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785418984; x=1786023784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIHC0dGoCfL4jo/TTDqxxd8bs6eGi4j6fVBGNZoeJSw=;
        b=MRxIfwbGfQNyqJIyaPtgkJsioQPBA5UhpOIujLvYcZxxOjrJTqPZO/cVGK5dMgo5t+
         Z5C7vPuZixXx1WIecR9wnU1x2PKs3E7iZhfNa8wttoo+zNT3kXckNVTI3ueVSppkeQWs
         /Yn0sr2XiCbrNBX1bB95U/0CkdJexB7PndoCONZDbdhb9gd3eELKZto5TG1ZrJRCrkXX
         cXMHbWK870qJT5iixIeAv9iCQF5iOUJbxj2bb/PrdiubYLJiXoHWdH/Z1fpkYr1ZaDqD
         A8M4N7QSUppFpgvPzh0jJBA/RgbIlg5//3HQRKkUmnHvF3tLM1r8bmJCfoH2YvqmKmwM
         VVYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqy9GJTTnmELJ9nQpaiIsdq7DzUTugU3rwhBB27VD3lpua8EmOndFL/ntrTz0ucvk7aFUYXaTJlgAmgNSUGfPOR@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0zFdircgjCu0dv+yFbxYQT12YI4Zf/fxioiy/3EGSHBmBNhC
	/Vw/Z6WAbA/LiF6zqE71FQXPpKyCJuF/6iBo128po6CDrc6v511uNI9PlLxl2c6vWj6Pa7MQ+AY
	rfrTuQAtA98Dn6vCNyzkpf3dmtFerzFaiHEmmiJhI5QBDIqXHL/zXG9UJdVFmNX7piOG4lMzTCE
	9+jQ==
X-Gm-Gg: AR+sD13OVgOaWDtWOs4YpS1AhtI7DYM90ojAg2nCBKEfO5kO4W/pA9J4skDGdD4rrWp
	2LfBkLBFnMwdzGa/iKiBRXLgDBAh3bmDx4h4BFuAD2d1RQwji8uw7ly5Twh4tNNryVK7FkI53Dn
	y9xCA/jpcB4R8+KAae/Fvs4xT2rsokJ4cGpnRxuvVE7VIVQ47fPqCtM4k53o3zzUpoFjrYNNZQE
	nZFAtQ3iiOWG1S6KQcb2fV2eSUa8VSq1gILRQjvyYtkVe+FFbkEDq+NjFs93Qsx3ttUSJ6VPZNv
	++gqIaYIIloLcy0MXlt6vieHEOvuni4vAyLaggDQlx68e82vlFxJ+uMmYlJ/2ufPttFv8Q8c9mO
	AJJaLuhhIrDoTAC7ZM52BenDE
X-Received: by 2002:a05:622a:a98b:20b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52b42b7f23dmr3221731cf.2.1785418983825;
        Thu, 30 Jul 2026 06:43:03 -0700 (PDT)
X-Received: by 2002:a05:622a:a98b:20b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-52b42b7f23dmr3221211cf.2.1785418983387;
        Thu, 30 Jul 2026 06:43:03 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b6dbdesm66080166b.36.2026.07.30.06.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 06:43:02 -0700 (PDT)
Message-ID: <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 15:42:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Joerg Roedel <jroedel@suse.de>, Russell King <linux@armlinux.org.uk>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heiko Stuebner <heiko@sntech.de>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNCBTYWx0ZWRfX+KH5t9Fi6nOx
 BLvHmmNNyhuBq5dEeUsxQLnMir0mTIGiufBf1BCScMKnHBDPCMmXvgSw+E0N9gM5a6+pYB5hP3s
 bHRLpMzTSdqPmAIb3MwvcEU2N9NJYqnFF6IIVPkBWGmlv7DA4Pj/ctM5ZGgEWc1j/kqUrjO12O4
 XbxyiXMevDc+2zIDRl1gckvEmQ7xs+2C4ubeLykVSkcZA/OIM2xAYGTEbjyBWDeUJBgoSZirLOB
 7M9IeQMo2lb5baM/4PlpAiEZKwOKC0obQfTclyPL/ZoFPamX/Icv5/OMu5LwKEiv2Ni+TsZUGCe
 mSJKE+klS94nHlQlC6dAHWL2g4arvm4p0RIktaPs0g9MfYuLECVl4RcD1xE99ivDNa9jkM4UINl
 YSaYmzZazSMxWz3mJYomJWZ2g/EFb6kfxJtaV7B5nIvTD9uqAWWeASqr4izT5zxm4wTD7pD+sG4
 Iv9VMjtVL4iZBDTlK2g==
X-Proofpoint-GUID: 55yWfcC7DytPzv1-7XkQM9m3TqukxoFp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNCBTYWx0ZWRfX8pczDSbUG+2R
 VSuIo/uy8+03O9N6ha3Dd8ULBWcWm/Lx8VjvEOG9f8eyqZ2Y9EHJTTbQyldoWjjFv6QD1yd5ipo
 18dYrZmOfw3YeHwWE6CF64Tzn0r7VBE=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b54e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=mSMHI8jCXtBZcuwA1AYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 55yWfcC7DytPzv1-7XkQM9m3TqukxoFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_064305_562668_9F3AA38E 
X-CRM114-Status: GOOD (  12.12  )
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

On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
> dma_iommu_mapping for every IOMMU-backed device and attaches its domain
> to the device's IOMMU group. That domain is neither the group's default
> nor its blocking domain, so when msm_iommu_new() later attaches the
> domain the driver manages itself, __iommu_attach_group() refuses it:

[...]

> +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> +#include <asm/dma-iommu.h>
> +#else
> +#define arm_iommu_detach_device(...)	({ })
> +#define arm_iommu_release_mapping(...)	({ })
> +#define to_dma_iommu_mapping(dev)	NULL
> +#endif

I see this is prior art, but should we support this config being off?

Konrad

