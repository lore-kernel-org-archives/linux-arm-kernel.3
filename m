Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA86C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HAQjGeRZHjyUwhLQVrzoyan+i2a1c9ZmrG0BP4f4QSE=; b=EurRqJ/q1rAEz78ifbGd4fPTF/
	MirvSYN/hh2ZthPxHtIq4WLtIEModRLTxJzXS5vuBLXuBvrUw0cS/yhI6Sqeh0rCHINaotBatxPKm
	JOzr7/hXokq88K8ZlnTMh8V7mLkZ1lKAreEJRvcp+qE68yYCP+yIrsvh5bsB4Oj4q6i6eIy7m1631
	pzF67RI4WpEwOmdbEWB+g3UskOsj/5fc2w+yxKSgAMWZIcDfe2tLjAY7vBqFN8UC5YN4S9398t3ho
	2Q3qK7vgQf7heTZWCNgksRwZhg0FAAYJFsIZufP8U0aHNKhns+uldoy8yL+niItaagQVf+Xa+LuDy
	p7Usu8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRHD-0000000AgDF-4BEk;
	Thu, 30 Jul 2026 13:58:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRHB-0000000AgCC-2A0M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:58:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UDDE3V1372956
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HAQjGeRZHjyUwhLQVrzoyan+
	i2a1c9ZmrG0BP4f4QSE=; b=JtDGpmHEJRmAYidb7xSW8UbrE6V3u1IQjp+WDhkr
	XsgLWPuDjJe//HelvH+nb5W4sUwseM2j5J1QJ7M4iFam4BlMoZ/5ou+24aoJITmc
	n1FiKdbsXbu4FZSJPzkCNpJCnfgUEbacSyeut+7NkPh+7IoiVIKMKTudfbhxRoXH
	OSFgsCpvJOYDJP/vjdvZ9GbyFzQmpAsd0jUTCB3zb4O6ATuUuZHxtvTtxTjcF3GG
	TwrGNkBlKvGg9kJLChk+4LbaSFCWrmkcTH1I3xF4QHRpl3V+kp+q5LUe9gD4YjtB
	+oi/x297yj3NAjW6h2d2iKiWwxTEgQxh6ZH1xl8EgBFeAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr70bg96k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 13:58:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so26716381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 06:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785419900; x=1786024700; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HAQjGeRZHjyUwhLQVrzoyan+i2a1c9ZmrG0BP4f4QSE=;
        b=PVa/zQ/qCUz9uBC2+l7SZLZ2EsrxFIpdk3xyTSDOFGWzythVMzr1k5NbVmKSHhbBGT
         KZaumgCQBQdPojzMOXUdyOh7rckGz6fH2zjehu2ZDwcvYYkykXeGDXE4ffrt8DQcLuKE
         pdBSYXma4kCBNX6uU/V7GsL1MQq8sufoYtiUE68Plu4Vd1z2G8xTT2dATxgQxXVsy+zu
         DMwlKxCW8JZUyXhyjR2QZwuFKu0Px1p4/JqiWXRQ3qk0YMZNc05AhcYZHDfOxtJoiBMY
         jLY0Cz2DxYtmK4h33CfbCAIuA/4jwpCiWe0IAiQEcfU+gJBI09PkgVpeBaKtVtec2C24
         zILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785419900; x=1786024700;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAQjGeRZHjyUwhLQVrzoyan+i2a1c9ZmrG0BP4f4QSE=;
        b=RzxRPcIeTt+Y3Bt0XKbzqqUS/O3AxUIZxIQGE+5/TueuQ+gZALBzmtNJuA7OIBnzWP
         E6heZOBf1k8ZnsZRATlBxwIc28sMteySeTg6UiohjLeO8qXFrRrxp/wS5Ho3vQDFVAeH
         aj0cIL3zrk2b5ZywjP7zqLut74c8oWkvp+TsA7UE1JrIcCpXHiijzB9ERAkwuqN/tIkm
         ZR2ainTehlX4Xhm2/XOz+ZyqxEgzK0FmEKdqGXSdBWwFLAC4Ibg67G0SkwQzOvzxKYsC
         Cd+q7nThmXHUYL0tDk2fJETi03kCwzSsP9BNQPMgAuwuPWlrvfnMgZHmrJkOHMRrt2hM
         0hTw==
X-Forwarded-Encrypted: i=1; AHgh+RpcvxctfZECWJ/gM0G8Xq+XOE03Lj7PODruS8pRCbQtDomt3A98+1Bqz9NaDBbwoZpwALo9jny28spHKsEU+Ly2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8wZxyalIhDlsu0hu3T5DxJjXZ5cxNOMov9fwBvJ5++ToVxpB6
	S7EoiVnGSn6xB6S5fs4oW04zfmgcIXCQzqHkw96/WOcXNJTTxujd7C9XBcEFEBYDzba/Wy0WwEZ
	T+XC0XUnriiTPyjFcCk6xRqPJRFcBA94sZUzd/v0SO3KyKb4gkveg7pG6+1XTK/YPfFqaiuLrzS
	DI5A==
X-Gm-Gg: AR+sD10n68uzSyzAoIctg5xCPnLs9G8+kVQrfQmv4tzod6Z4GgbaS3ZaJx5522gOG2M
	eXPZsUJFRZsPBSss8+QBfh1Iv3lvUGAnNwSQYbzuQA4ia4z0VkMWh9E/70se9aAvkQpAX7JiW53
	HrFzZDpfthRceKd29rVC9pTc0pyXLQHG8CkPFP0zQSu7bGoInR0yzJ7ndqMHTibMQN7tKzdKBx7
	g90VMcp04mqQV3sQ48AjJZ5mF+TYE/slAe0i0DEVQh9o2vKKPm87Zgfr4fq1qGnmcW37Y526XKT
	x1H3GfDtFohhWwAukxeeb5PedMOlAztCDcOP9uEhRak1rZE4vgpIxvVWkHppRy8TwO/XHNhlDVZ
	gcEvKO1jbk5wtM6KMjGcEbwFvzR6nhR63gevHlkznJR9OlM38L8Ag7OCtWUK/HhfMZW4THwo/+Q
	bvuVH3RwDCPDqsxw==
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr27808661cf.78.1785419899823;
        Thu, 30 Jul 2026 06:58:19 -0700 (PDT)
X-Received: by 2002:a05:622a:281:b0:51c:7b12:1200 with SMTP id d75a77b69052e-52b386c480emr27807931cf.78.1785419899145;
        Thu, 30 Jul 2026 06:58:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db94febasm343902e87.19.2026.07.30.06.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:58:17 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:58:16 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
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
        Heiko Stuebner <heiko@sntech.de>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/msm: detach the ARM DMA mapping before attaching
 our own domain
Message-ID: <h3rfonvwkxkmschyypytwgwxbmnq4rou4iyk6iq577c5tcfdl2@zrz3xhfzpmlr>
References: <20260730-fix-qcom-smmu-v1-0-b12fa067804e@oss.qualcomm.com>
 <20260730-fix-qcom-smmu-v1-3-b12fa067804e@oss.qualcomm.com>
 <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e55ef12-6c4a-42b4-923b-238b3739ea51@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfXy1VFVUc4z+mj
 oVr/p4YrZCJIhUczo9UpWAJstFcvMRg9NGb8AHGfcSbdzpYPq0VwmYiYa2j1uq8pBiKk7gHXLDA
 q/UoCxz2wb8tZRyyywrbThP0gEnByOnas10rtZJ7DN2jTbjyDes8IkQvGHpWWyIz6+/JuYwIVwW
 SmHiT+c2AjqosFbqXCuVobZWh8MYrvo+IjHQddQDDR7xN+qchYzMRbUEgdSS6iefBgjZ9IUv0eX
 9u+NuOF/O4yQtXnrrm8LpLf8dNN9ToBP9+6lCG4AcjuNbXe8c6AUuHIxciBv64139MMlnssj1Gi
 KhR269JYgVx0HEBPAka9NAqIU1TVP1D88UfwlGXt5QqyfedfhxdO3OquL9rRtXz0+2TjYF4F4Xh
 MvqsaZUfBmOQ9pZ8PlRR/Mq1YVhTZZDw99TCdOeOWxSHfB9QNB1FoG5FBfnQ0UWK3o9DFHWw5x3
 AwwF45rz75beGJx2rdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEwNiBTYWx0ZWRfX84MLFt+ehYyN
 fwSOBf25USIjDMcwfIuniS9ajh9kUyLF4rSutsbcXcU0/nHlDjaDfLDPNhZ6auCzAMy9XuFDBWe
 YHD9ZHhTiml992yyT9DNoJSNAyhGvl8=
X-Proofpoint-GUID: YPsa9HDY2UTQa9Yi2iG55AAj0jnI00i1
X-Proofpoint-ORIG-GUID: YPsa9HDY2UTQa9Yi2iG55AAj0jnI00i1
X-Authority-Analysis: v=2.4 cv=P58KQCAu c=1 sm=1 tr=0 ts=6a6b587d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=iwl2vSsomdHTBBcAHCgA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_065821_549480_BF24A50C 
X-CRM114-Status: GOOD (  16.61  )
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

On Thu, Jul 30, 2026 at 03:42:58PM +0200, Konrad Dybcio wrote:
> On 7/30/26 3:29 PM, Dmitry Baryshkov wrote:
> > On ARM32 with CONFIG_ARM_DMA_USE_IOMMU, arch_setup_dma_ops() creates a
> > dma_iommu_mapping for every IOMMU-backed device and attaches its domain
> > to the device's IOMMU group. That domain is neither the group's default
> > nor its blocking domain, so when msm_iommu_new() later attaches the
> > domain the driver manages itself, __iommu_attach_group() refuses it:
> 
> [...]
> 
> > +#if defined(CONFIG_ARM_DMA_USE_IOMMU)
> > +#include <asm/dma-iommu.h>
> > +#else
> > +#define arm_iommu_detach_device(...)	({ })
> > +#define arm_iommu_release_mapping(...)	({ })
> > +#define to_dma_iommu_mapping(dev)	NULL
> > +#endif
> 
> I see this is prior art, but should we support this config being off?

Yes. For example, on arm64.

-- 
With best wishes
Dmitry

