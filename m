Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D7DCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmozr6MMdfPUDaS8e/eCWoR1xOPrRCMQtMyGELf3lMM=; b=1MiZ598C9PgOPuJ7NvLZKvc02l
	iaZwc4P6gV5CouWIRMmwKfHrzel0oauCVfS4g53MIzzMd3KOWUxw9VJ7zoe4273pxsnudxxCN/b/i
	paco6yzMcj57Ob/i+IIQGglsX7B0G/kxrEd5d6VDMSyotQfPxLMwl7rO6ne1gGQQdGXhgHHv4HGOT
	0nX6JMf1qTs3jBqGod/vFYo19klL33Zz5U7pNXjcz2z39LPGSIlqKFkcWBLPWe7B2XpLaN3F9p1j/
	h3ORVyYpLGrHSN5xNLo9amqvz77um8GFOkLt1hSXsvJJEebM8wQnr7f2u5hQid84uOLFpLM5ewA1w
	AQ3NxJZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWIGY-00000002Pjd-07cL;
	Sun, 07 Jun 2026 18:30:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWIGU-00000002PjI-2M7E
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 18:30:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkGh4336452
	for <linux-arm-kernel@lists.infradead.org>; Sun, 7 Jun 2026 18:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmozr6MMdfPUDaS8e/eCWoR1
	xOPrRCMQtMyGELf3lMM=; b=Uz1Zjp1p6qTYu9mtGwHAYALResZ/6gX6Fp254Gdn
	XoUflZe15R/kn/00n75mLDIv33AROORimVj8g5jfec/K4XinYwokKNliOXdsCR5f
	C3yWIqid+ba6HekqSIUBpT3xDtH5aB1F6AB4npnCOX33VGrYEQI51fR8xIsEcZ+4
	k2aZvqw90zRBjcwd8LX0xB/YwaDvhUW5CaML9KmqXpJh639orWim8cy8pCRpMdqd
	CzslnQ3npTY5Griiic8lZFmnHSCuVrXz9FpHolwtqFnVG9lCKH4YucSLBS/RF/h2
	uz0xJrczpz78ks2ApU0nbwTdzDGyIRN9Gfzde7g6UWykUg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgv6t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 18:30:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59ebb69acadso2255404e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780857028; x=1781461828; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmozr6MMdfPUDaS8e/eCWoR1xOPrRCMQtMyGELf3lMM=;
        b=a2c5SqlJKCGStXmr7tfoRbQWMzSx64FdW40TQ5wazkcgeNWrEKJrsktLUIIpttL2Nq
         kDEP0wGGcdWdI/96BaWJ+AGpmYCMEXEyQze6SKXca61FAG3PjuOcUHbk5dZJNvBfOKu5
         gX1sKpuL1+r2ANhvDjRphyJpGiwWp7hMt0kBhXANivbAXP/vkgC0g9l+07cXRsGnUovZ
         olue6lDhTECJ4NUXd439kILqSU+IZBgsY4u0T4X4xJ2Nerx8mGrGMMH2lmjTuD5GY0Jf
         TaUVSmcToHBrdVv1/8eWQ3oniaWRJTVugQ02ji1p0kVue8H1bm2ogBrIo2AXUerUO+kw
         Tjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780857028; x=1781461828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmozr6MMdfPUDaS8e/eCWoR1xOPrRCMQtMyGELf3lMM=;
        b=YmMKi6wBXNNdhZ7Y2jltol9hD//ZL8kXZOCeWKNV56Eq56Hc+cbhpJOG1wZytPzFNb
         EIQf2Ot4SnrWyGU9eeUDHLAuy3zZ/5K/Z4f4SK6ewF2/ZAvsJVG+nqwH15o/X1f0EMuG
         TQBGrX2r/nQf5mEDLk57xVgzfQK2dyCveB8N8NrFPOW/f+7AlBipbEztFnyR9MKDn2mz
         +3G1gF3L2GcZ9IJzfs6sF5dikps8gDzZhtp6odVf3lDYx23mzQOgy1GBjLy3aw05/y7f
         qqoMmJR8pZyfMtY90o9mjPdMCAy6rJ5tRBAEWVu9x94D8vywGrktZtryHqICW5zdjBCr
         WFIg==
X-Forwarded-Encrypted: i=1; AFNElJ9ruZAFtFi4iTDjSVzesjAEeAwswtYeDDG90A9SYfp0ZHEd7P8D0mJ1cXl9VTRT/FEx+Ko2Z7m3eO00qb9N9Pgz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4SE+hYbEhyZljJ/JxX0b0EqbVTzP4zQS4rEJb83I73IChVjgg
	9pkxeVyJyPWTXQRm75ipJsElW2FWIjDZsWdk+U2gi9en/lqRMm0TEhm3EVFcgZVEZkMQi5DtAyo
	ONjPY4Gzc4sil3KDmcxUIg8Bzw461YCeoKv/31MKkUsb6bK7zAO2RAlbswJ63QZ2vlRCVYy7Ioe
	LxMg==
X-Gm-Gg: Acq92OGTpJmiAbqnkGzTVVi6ufil5oxXN0Mpq/D58lBD8jQ/ftFAJWQTWeFmujnIRKy
	FDMwpZvuImKHJP8PL+kEgMV1Aor+pWDeKC1ieKsWMi7FtwDzMaPGuM21hcfuQbBjWADjj1Up0HV
	s3qrsj/oujWZL3eT6mRTKMPeYxQG8Bw7ZTDUMUINvKtUOmVbm/6dlQKCKvT+sdjTU3LzzSg0bGF
	vMtkNoc86JQB8l6HqucAkq5N2/KhlyH92Aj1EXJp2cUZoWAn+oO+1fCqbsNasYw+6e7iYsA2kIK
	9xvalwGEMSWPoEdVp8HE/SxWskTTbl76EDyzN2Vtxv6mvlioU8esFxRyyPTB/VfUVfofk6RxZZd
	ATKLl/fsM3YQ6VjHOtEm1Em2G2XQBfqu1r/MG8gc8Ke9AvxrnubBVW0MR2TnRHI5Lk+w4UL0rWP
	onC2V7d5CJuvtgYHw+asw75Gpy0NLI0GEpFDVv6H+LVHYNvA==
X-Received: by 2002:a05:6102:5346:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-6ff05e2d9ccmr5876337137.23.1780857028294;
        Sun, 07 Jun 2026 11:30:28 -0700 (PDT)
X-Received: by 2002:a05:6102:5346:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-6ff05e2d9ccmr5876331137.23.1780857027872;
        Sun, 07 Jun 2026 11:30:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b9862fesm3196569e87.57.2026.06.07.11.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 11:30:26 -0700 (PDT)
Date: Sun, 7 Jun 2026 21:30:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: okaya@kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: hidma: use sysfs_emit() in sysfs show
 callbacks
Message-ID: <nsjfphscjzpxicu3spn6mcpyvmarqsb656lvflalouyupq5syx@leeejbjrohws>
References: <20260607163119.78717-1-dennylin0707@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260607163119.78717-1-dennylin0707@gmail.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25b8c5 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=4Z4V4W3UNDWYKEzNDnMA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: P1eim_T94PXyl7T5xbmfhCRLCtiZbAxF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDE4NSBTYWx0ZWRfXwMHp+7ElAseK
 /tumbpR1s3SjIVD/FtIoHo+KzJcgm0+nPgIjVkFinHEQXC6NWqiude3uABVz4MuE38HSmYQBTLc
 zfnKoDRcI5HP72I1DyjDx3n/xFLO4GNJSemvpvePCuqT1xlPld/OyaDTCwZ5jcZHL+9Va7/Xi87
 t7ULVo4kqAbhIjxQVSMAhU1c4mVvN+yM9O/5ZZA9Ojt6U2DX8biLLray3QMnr3o0xBeqEis644r
 WC46wqxQV40o9CMJGSPwBvPwTalLDOZktftbuAbJZIir+7z2UoErIrKLrwwvqhBTAOGonOGT+gI
 Yz/n1Fvrs0SpkmAepxT+WUG8n0Eu+zBOtH+V4DjIs1hjfIa4ibCdENtu/kDhdlisMyFUjIkWNZz
 g8HJozamt7t7tnLRJ3epag0NV6ChaD3MQJnCxbOaZOzqmJzYvTv33AIP95S5VKzc+StVBketQBp
 o+Eq/2YBz3+1gZU1uEw==
X-Proofpoint-ORIG-GUID: P1eim_T94PXyl7T5xbmfhCRLCtiZbAxF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_113031_439300_3F80EBB7 
X-CRM114-Status: GOOD (  15.31  )
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

On Sun, Jun 07, 2026 at 04:31:19PM +0000, Hungyu Lin wrote:
> Replace sprintf() and strlen() patterns in sysfs show callbacks
> with sysfs_emit().
> 
> sysfs_emit() is the preferred helper for formatting sysfs output
> and simplifies the implementation.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/dma/qcom/hidma.c          |  6 ++----
>  drivers/dma/qcom/hidma_mgmt_sys.c | 19 ++++++++-----------
>  2 files changed, 10 insertions(+), 15 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

