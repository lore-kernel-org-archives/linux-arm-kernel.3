Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4CBFCA18E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 21:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=; b=jqfyus+0yYfRNAG+sqGtGSMs2y
	0tbZw1CRADGGT3ze1BYoHkEzirvSf1uOsQ/hbk8corf5KR2lxZR17N3IK5Ysv2vi9s2JRMBeNfQip
	SuUKBOoKjOP5gojZkhUxkQhflG5zsUY5/G/5+3XpBA4tfnnZ9hViXAR/Fz4GvUFGiVPbPKkG2lU9X
	6lkvmJ213XsVAWGXFRZmW/FHb3MJ/AZX84F2ZdimdaVrObqjnv642S8c29Vc0KwJ7l7L8nra68Vlm
	HCkoTkFFGDBaGq6/ciHUJbdtLh9DmeYhO0D5bIjHP98o59i2Sayxyp+U3+KoP3384eAGthUWOSt3l
	SQ2jjruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhyD-00000008AZ4-1QP6;
	Mon, 09 Mar 2026 21:16:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzhyA-00000008AYj-3qgt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 21:16:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBh0w1660014
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 21:16:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KLgWRaioXqeIrwHgYBcxPqE/
	kg4Fe+2f2o7A+PfgTZw=; b=eYrTi12bsFRg+Ep63Gvyrpkz6qz+XZZnxJnhHzZ8
	Afqkljn6AGFqwUNG6Hi9uCb6ZzQda58iRJHt3K5YZu6fE5lb/rlDs3LPJDnuIy9X
	R2Y9ER606cwX+ZHgCY8VFLE+xAxUWo2O4Thd+KKh+iYlFQhrYQ0g6GO+JQptJ4KE
	6f0gsKaivSPOXL1lrK/xqQc3elp326ygArdomugL7e78pyCIveo8V0I+Gp/yH752
	qn3L1fJOi+1y8gGG02UGdrOgFKCLS1JmoihvFsIZX4/Br1ShuSsjy4BmL2Iv75+1
	0Iz/BPpRhzYykPy9UUlKCrzFisiTC2PnI1DfQMHXc4YBKg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr41b5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 21:16:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7de0e161so1210402085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 14:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773091012; x=1773695812; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=Nm8hnqofCXSIXaUstmtI+Pt0icFYXNXxDIplVVSpCfgjEPnh8Iwq8JYikdO8H6J9Y4
         yoaD3vG6KNCS9i6AQBx8q8ptgRTM+kgVpkIFg2NZx1CHwwpRKSAKMui3q+renkny4Cou
         sXCmyTgU04g73PClFwCCxWl6FLIxfmS4r8YlCLcehV2roM5a8wQAVl0Shnis3ie5d0E8
         9ehqbHO+ZU83+4M4W+hrs6zOq/rg9EOJgIWkXY59H2kXXnW4HHUB065wEQe6ZrC+gkYO
         pECRnjdpeYNET5PvdXh+2jhKgHErpt8kw+Ecyy6A1oeOSTIJTMHMy7LhtB9aEpfAo4YK
         lGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773091012; x=1773695812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KLgWRaioXqeIrwHgYBcxPqE/kg4Fe+2f2o7A+PfgTZw=;
        b=SGL9TsN5E65t14nTiUH2Cb0eT+gVK35PTDixPA+SxGAgNrcYzha4wNfq6gJmdmBW+J
         gQWeahKn2EEuB/eqA+3hRnnDYYi5xEoo5swCMZ/QFoilnATZ0iRtEA/KH7rgb6PQqRue
         c28SEz9rCZ0nWURcuQGL+vz7ehgNq7Z6WIfHHaYhXyVUiIH/VZj6Wgw130NL9ak2YVEb
         I8frLfBiC9B+F3CtIbS/ic1q2cIhgmBt0XgN6yAx2wnaO1Xlof4DisHHSUef+rJAshT5
         55xLWxs0LPDADSE9meClkJ7S+3GBxU1Qhb+8xtn8Il5K2H2S2txrQ8InizXdN9VlNuFW
         ZktA==
X-Forwarded-Encrypted: i=1; AJvYcCXUBxcX0M99VbOQoK5yUkW9N/w5fEBonKPfQSO5Za2qTcj0GNmPSQG6jVaYvr1RP1UdV/eKA/yG7ZWvxJLF1FrZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzOxmCVW+S2cAOTBzH0VgQqunr2yBHjSEllaiQPY6CD8F8NbE5q
	NYS7ZBRi5V8+RasfsuZsZZ/TmkJMk9hWEDyH0UIPGOZe654RjWI/YQjx6t7A+I2aY8mFolYGjoD
	sfnmwciyOkA1SIRT6xw0OEtlN5UDwiwHCCI1CEiGLGI3KixcuDW4Iv8c6pFERS0zqW4LfGbehGl
	dwsA==
X-Gm-Gg: ATEYQzzIzEH56/VQEnFdYDt3UfsTPGRnmpn/V/mQrEltmRpqTM3zQw2E6Tw7H758rgO
	ylquUFHHJ7CmevxFYMDHeGxozG85f5Ue+NjFSp1JznNTH8EA2WJ5olGA69nPBJ7791xtPN6uGAE
	+BfPl79XWHzt47Fr4sqxbkMfpHukWGRQSPsV/S3k5ICRZgqzNG3IVx/x7unFukkfAnQ+odr2sAs
	wFJAyiVkZ2529uIYjohzCpodlH6v1z6KcSE3Dr2UQ6CKOucGqBx7z/v4g+sjrJHFYGiql7j3kKL
	MMin6Q6U1p6Nd32Nuf6WLsblPS29o7lZZP1qRp/jPsqb9HdeTPuiP7vUTi/2EubpGMXrAZXXa5v
	4GoSfm1eJYg5ZnJ1ero9i3MUcqxHarswNS+sDaDhJHHa438sdMcDXE5kMGBZTVQk/bWGIhaFurp
	Mr1pm7cTpmWYrQM6CLZytGcWtXTdm8J7n1kDE=
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566976885a.78.1773091012392;
        Mon, 09 Mar 2026 14:16:52 -0700 (PDT)
X-Received: by 2002:a05:620a:2946:b0:8cb:3d7a:c009 with SMTP id af79cd13be357-8cd6d4b5029mr1566971885a.78.1773091011890;
        Mon, 09 Mar 2026 14:16:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cbfasm2323612e87.14.2026.03.09.14.16.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 14:16:50 -0700 (PDT)
Date: Mon, 9 Mar 2026 23:16:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v10 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <3plcdobbd6teiluzijzk33yepbpsur24tnmjr32sco7a4loptm@xmzmsaurvmvj>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-parse_iommu_cells-v10-1-c62fcaa5a1d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE4OCBTYWx0ZWRfXwc/+Uc7Cs+h0
 bUQIGPMdy1GQxB4B3rqZa+C7Lc5FDzJRu1WxJpw3ktERKDFnB3471rPp/7Fk1UtaUihQbvrAfLz
 qmUNMA4vkuGdRYm2CXnqnwHYxy/2qWjfNH9Zv9D/gY8GV9ibCYPxD449IBlz9UUIxwXM8GyLbFb
 RHFiUsaP4DKbsGbfVCVFEZ5Ta+q59j/aHug8kr3XZHHX7OD61+eWap1QKegcN8cgzFij28+7rmw
 8u/PBDJtZLyUHxG2LnIUac7DYIelmJwXPS+NpqkV+hxTG/QazbFFAjFsF9jDH8gMKLUi2QD7FqQ
 psL4aACEn1/1BaVE6kXpKFl5keKPIE9eBIIdEchtLh432zN/voXn6BhUk3PRGx3o+S6Y2q029Y8
 mQu3vr9l8BQl4LTwSse3v4hg63GhX6/ibciXq1y1ClrL7frebzqdUwZXM9NCC6qRRepYjjNk25s
 HXNYkS9cqyPmBPDKARA==
X-Proofpoint-GUID: VepnyIUCw93a7tVQGDma8Zm43J5hdXWp
X-Proofpoint-ORIG-GUID: VepnyIUCw93a7tVQGDma8Zm43J5hdXWp
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af38c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=7CQSdrXTAAAA:8
 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=5ndfpk7zZlG9lj9R3R4A:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_141655_080081_2F4263A8 
X-CRM114-Status: GOOD (  20.41  )
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

On Mon, Mar 09, 2026 at 01:03:37AM +0530, Vijayanand Jitta wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> properties, give them some wrappers to conveniently encapsulate the
> appropriate sets of property names. This will also make it easier to
> then change of_map_id() to correctly account for specifier cells.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/cdx/cdx_msi.c                    |  3 +--
>  drivers/iommu/of_iommu.c                 |  4 +---
>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
>  drivers/of/base.c                        | 36 ++++++++++++++++++++++++++++++++
>  drivers/of/irq.c                         |  3 +--
>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
>  drivers/pci/controller/pcie-apple.c      |  3 +--
>  drivers/xen/grant-dma-ops.c              |  3 +--
>  include/linux/of.h                       | 18 ++++++++++++++++
>  9 files changed, 62 insertions(+), 16 deletions(-)
> 
> +
> +/**
> + * of_map_msi_id - Translate an ID using "msi-map" bindings.

Which ID are we talking about wrt. MSI interrupts?

> + * @np: root complex device node.
> + * @id: device ID to map.
> + * @target: optional pointer to a target device node.
> + * @id_out: optional pointer to receive the translated ID.
> + *
> + * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
> + *
> + * Return: 0 on success or a standard error code on failure.
> + */
> +int of_map_msi_id(const struct device_node *np, u32 id,
> +		  struct device_node **target, u32 *id_out)
> +{
> +	return of_map_id(np, id, "msi-map", "msi-map-mask", target, id_out);
> +}
> +EXPORT_SYMBOL_GPL(of_map_msi_id);

-- 
With best wishes
Dmitry

