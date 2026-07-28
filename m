Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE237C531F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=; b=puEPfhvO2z69oAO3s5dw+DGRgp
	rDG5DGdi/U4jyXkvamksUiWfnxs5fLehXjSw7w/YzxlRKM36WvChx9jYrPn34L8b2kPPmKJU7BnhS
	pNlkwT//pI54T0TgTMdG2WCO98pUl3mFqTrQAC9oCR0xCq7agffx0OD+wtHXN2J3E/89GVpV4fn0/
	8gbEPYCrE5ExbtiyK/DBZFWaj2Bj3nwyTldGBYqhykskAA56e/vh3V9CcrgIyuQL9yWPe9wUYQwjM
	tAcGFh1e6n1MD4GeQVxEcHAY670Xg3p0fwUGvkiF1Ll3VPBZZm9wgusnirCJIoNzp92kruuB6Vi/q
	qvVfRJYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog58-000000055aO-0Xdr;
	Tue, 28 Jul 2026 11:34:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wog55-000000055Zv-2bV5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:34:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHRvf2367469
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:34:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gbo+tER6P2agi65+IoK11DMG
	JudcKhnoP053vnEPwzE=; b=TpNp3W2Oolckm9QwP32Ki0zrr3+eXlkVSRJxgTpc
	dOvS4kJVGPq8EpW3KdYCXMC6GL21HF1+SUxsIUEY+50un8chx1Q20NBl0s/w2lpb
	tdMvRzHZuuYefLKBTi/YahSW9JEBDT3i9Fn4e/bqTnn13ikgHOnw2oCky9nfjykS
	iOgcNvdevzotQWJXvlG9qz7WUQTpv/Y51/bss4rCCAW45ipiUdj2eBeybrv7qr5t
	AWbKT+X+x++79ZHApw0NKIP/IK0MjrDEbruHOHP5Ew7tmrTiuUiG5YyOntpDHsKu
	sO+oYyE+1kH+pPVHC9jns2tXo5A3YU2Ky2cNf7TtxYzvgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c35s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 11:34:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so55059751cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 04:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785238482; x=1785843282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=GAU2nj8s5pcZd3IoVMh8Igt1Mdv+gj+5tu2Btc7pYWoMC1PyjtiTwSLh1+Gcnm+wGv
         dq9khQVSelrE9ts1DWU7FaFXDj0iEs4WSwUFdM5VT04Xzxa8k21V4701/aCAXGtRbS58
         xvQg1RNSOfRRpzndxU0NmyUpTo7CR7B7ECNG3+qIkVyP6olvTi6KeQ9o6z1LqcXvSnO0
         Ikck6Cw184Mp+Ym3X/nxdi6tcBzOjDiFoI8R4exi09bXSWLlfOD8pyfsi3cS8jAgHUIy
         d1VHrkgShuErgdv2UEaTtD8wdB2vy4cls9LY5X3V9X603oW0cTqXzemmkmo/7f7bza+M
         V0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785238482; x=1785843282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gbo+tER6P2agi65+IoK11DMGJudcKhnoP053vnEPwzE=;
        b=LK9T4erJOVLYg2hBurXYirKTBBnMIf3N2FCygMgTDsrUqaQ53oNj7g+YYmhQUvfty7
         LWixXhmzJnSDBKq76bFeZs+XH8c2iYVCScr0uYXKJ4O7cdg38I+sDotofL2sq3KY0hTZ
         TRxXiSvv+UxVFvEBF5ak8BuhoPbqPUbfHwZQ1zwfoBBIZd1pI9DJMfzvXbM1OTmMXVXo
         FIMajMsvn/Rk0Mwv5h/yGbzn+HwEzJ4k7YT/WL4GIaNESA4ZULn8j2tOGVC8QUp9wYSJ
         WN+hAdK3/El2km9dBb8qIud0vBphMG93mxjNxRHAAoDin+/FVrnhu6ixDZBeg7MjHerK
         +/Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rr8QqeOVLg6UnnqffZLWhPZwV1SnqMs0r0b80Z/yCehsrIu8AkNWLaBP0wD+iTkK1eCMu9AwrNvSvDk0HR8gr9l@lists.infradead.org
X-Gm-Message-State: AOJu0YyhXROB/zyqBDFNhU29minCNF2dUs51DmUMPYOdI0glgaYUWDGn
	KlcskTttfOzOgqthyGz7MP9osUmBhfD6vB3DMd3c/fayukv7fLQJZlewVyIX92/kHtiWPG0KUL0
	sjgjVGhH4qwiGE+Ob35I1BWRoKuAjFueSZloRn8PEq5ylhKtMFvi2S91pSmMudjDSQEhfypeXtZ
	5QbA==
X-Gm-Gg: AR+sD13o90ibgKnqqiXR5DlQXezTnceWV4KF8nVqbv7NZoC1h9jHsrGvrNscwDqKRxi
	5QpohfPtxBLZcifBSDTzsyoQu5bEa8TI1dzF8WvVhAvnnZq5NCy0eARpPBrMo0+W+7SrN2YdlNp
	iAbSP7wGtUWnLHZY2bCvjQk7QM08/DwS21fRzR5NTtUuvoSO72Pl4flVpP1dHK6gowvb3OALHuN
	fYIla8dbzLYRduholOntl4MTcEMXAYPoO3h5p8IebeO+bQ5y6YbfYz1RqbmtkinEfMbLNgBl4dq
	5ewsuEnMSKJ7GmkrK5u2FDn0qeFvX7h5QLr7wRsnkEzWGGyhUTMhkC6R4ChLooUaS69K0i77LhZ
	o1UYeeuuQ16bJa/AlDi2tK2ylnnP/E6Xj/evxGENcJ39PpFoxX6sbeWr3uNXBQJ92Y8coZ1xrI5
	dJu2OZcOQEZa/2WQ==
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912541cf.35.1785238481982;
        Tue, 28 Jul 2026 04:34:41 -0700 (PDT)
X-Received: by 2002:a05:622a:138e:b0:528:320b:305e with SMTP id d75a77b69052e-529d6feab04mr15912161cf.35.1785238481464;
        Tue, 28 Jul 2026 04:34:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be090b6asm1974708e87.36.2026.07.28.04.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:34:40 -0700 (PDT)
Date: Tue, 28 Jul 2026 14:34:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
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
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v16 3/3] of: Respect #{iommu,msi}-cells in maps
Message-ID: <fuqnxdknkajqotzmmlknwnthqpku7as5kpvmgogexl5bi7x6y4@tthbasf5lqvc>
References: <20260603-parse_iommu_cells-v16-0-dc509dacb19a@oss.qualcomm.com>
 <20260603-parse_iommu_cells-v16-3-dc509dacb19a@oss.qualcomm.com>
 <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f5c974f-425d-47a5-9fda-e05de1f39d79@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfX+5syBuQRfid9
 c/qIBFLb5CwEon3+j80YksJI3OJlwRhgLgSeS+DXJsGtEOgb1y6CNnnNSLTzFRmRtj5/pjuG1Y5
 d60sLcFTMxthAMNu7r5hmrUmyXLPU24=
X-Proofpoint-GUID: 8KbZSLIL7lj5eS7EeLh4LQG2Nfb-4lBF
X-Proofpoint-ORIG-GUID: 8KbZSLIL7lj5eS7EeLh4LQG2Nfb-4lBF
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a6893d3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=wdqIz0_Y7svv89iKmCwA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwMiBTYWx0ZWRfX6wIs33aq4O1V
 /uK1e/JLhmK9QsbmlGH6MXAWldzCcLqWQ8W5nffxwYynfXoCbGGugJZL7miCFwv0BKodtWj/y/P
 JvBI/Urx6nsR60iBscbcE1gFhTbsD8W6zstvnIKvAxLqy9XAJ4JqDplmhOTkdTtVuA1T7R4Bsk+
 +xCmvMWb0qT8bx5LuZdi0E6zg+A1q6VGZ9VD0qmzkN5Ieso3f944e3O0fgZgDM0HZMckMD8dluO
 nf6oSi4IGbnGioA2qIuUIMPxVsS4ytSvugvkJGXmbBLV421XfxJJIgXGmRoq7kE5hHZ+VPmUqIk
 xTicQqHmT7XdAmpjjq0gsakKgsN+xE145w3h7VeSc9a7CTkYoX08G8BJ3k96GD3Y8aFLaEdC+YK
 GNlRFrnPUZwcaHsY9cli+N04ScCDe/FVi2j2d9fUHCrWWV0MJMhJFTf4iVCmBldzSG629NPXvqZ
 TVGiUgaFSgj9AMYkrMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_043443_693872_727D1EC2 
X-CRM114-Status: GOOD (  32.67  )
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

On Thu, Jul 23, 2026 at 03:17:24PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On 6/3/26 09:13, Vijayanand Jitta wrote:
> > From: Robin Murphy <robin.murphy@arm.com>
> > 
> > So far our parsing of {iommu,msi}-map properties has always blindly
> > assumed that the output specifiers will always have exactly 1 cell.
> > This typically does happen to be the case, but is not actually enforced
> > (and the PCI msi-map binding even explicitly states support for 0 or 1
> > cells) - as a result we've now ended up with dodgy DTs out in the field
> > which depend on this behaviour to map a 1-cell specifier for a 2-cell
> > provider, despite that being bogus per the bindings themselves.
> > 
> > Since there is some potential use in being able to map at least single
> > input IDs to multi-cell output specifiers (and properly support 0-cell
> > outputs as well), add support for properly parsing and using the target
> > nodes' #cells values, albeit with the unfortunate complication of still
> > having to work around expectations of the old behaviour too.
> > 
> > Since there are multi-cell output specifiers, the callers of of_map_id()
> > may need to get the exact cell output value for further processing.
> > Update of_map_id() to set args_count in the output to reflect the actual
> > number of output specifier cells.
> > 
> > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> > Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> > ---
> >   drivers/of/base.c  | 168 +++++++++++++++++++++++++++++++++++++++++------------
> >   include/linux/of.h |   6 +-
> >   2 files changed, 135 insertions(+), 39 deletions(-)
> > 
> > diff --git a/drivers/of/base.c b/drivers/of/base.c
> > index d658c2620135..ac7961cbab94 100644
> > --- a/drivers/of/base.c
> > +++ b/drivers/of/base.c
> > @@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
> >   	return cache_level;
> >   }
> > +/*
> > + * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
> > + * specifying only 1 cell. Fortunately they all consist of value '1'
> > + * as the 2nd cell entry with the same target, so check for that pattern.
> > + *
> > + * Example:
> > + *	IOMMU node:
> > + *		#iommu-cells = <2>;
> > + *
> > + *	Device node:
> > + *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
> > + *			    <0x0100 &smmu 0x0100 0x1>;
> 
> So the sm8650 PCIe controllers has:
> 
> pcie@1c08000:
> 			iommu-map = <0     &apps_smmu 0x1480 0x1>,
> 				    <0x100 &apps_smmu 0x1481 0x1>;

To silence the warning, update the iommu maps to:

			iommu-map = <0     &apps_smmu 0x1480 0x0 0x1>,
				    <0x100 &apps_smmu 0x1481 0x0 0x1>;


-- 
With best wishes
Dmitry

