Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A6CFD005A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 10:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=; b=g1xfZ6rr9GbzaJv8gcAUQdhreX
	+ae8R5iUzEztmKMyG2YJQzWMKy7RIzYIxfn4O8MriPIBrwVArlkA9lmOu0B2vOYs5TdRBx6y0KvEG
	158FaciVHhDz8kdmZWde7N71N76mQYJs3gPH7Igjkw0I1sT1Yj9ZqygPgZoC0/6qaOh5DEQRmd8Hf
	Vpa/oeScajtojmUTOf1TDpDs0VLAnPytIDqrKN09aEGnSRYYphtGwYwPZUVh37FTxGvfqhSk6F7oI
	wCFrCDgkb9X8jRQxAkfq4LGyTlk0G1IjToFofG5mEjfKGNs1/8JcVmuqE2oDDJNv1IyZ+MPibjBql
	zGIs+97w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwddB-0000000B0gb-2foO;
	Sun, 01 Mar 2026 10:02:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwdd9-0000000B0gE-34vs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 10:02:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6218UoPc2746645
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0xpqoMV9nCv7588O/2lb3+Dy
	gEwHNzZq2QKo2gKrDEI=; b=MFDwcsRMUoLALjslv9VY/VdAydAxc3/eD8jPp+b0
	3dbJ7aTibd/9b6GV9IF2gWn6gSpe/I3btoHNAVjlHAbEwxC6eHSVdnwqOitswsKK
	BFmc5ona0teu2h6YmGm5UzCmJDzSNJQeil3gsT4tu2E/DuMyeeU2M4A9oTkvAzIU
	6Nj7aXpW3vgAMvolk/oLAysN+VfAUn/SXHBScRSfZ3wrgr7md5skbPHMUU+5C7cg
	PDWi6o6khIMR296Rtf2LMqviKvYVMgehPnRNL1VGGCDd7pD1khwDOQnaVh1y70D6
	5NTfRB58X2oh3kZa0pAyMmBzeNyGrUi6kb5A/jodMBBWgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksf8jj2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 10:02:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506bac14430so430561741cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 02:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772359348; x=1772964148; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=h+EwpRo2r3+TaEF3MpPr6XLuLiKb9BQBEXqXvnO+s7DN7YI6zUbWdRpdpwnj7UCC3A
         RoJErH1vZm6DtWvGYDfu5KugIVj5Npmx3T+l7Qs1Y0SqgF2s4wP1vMPzNTssB8Lt8teD
         GZth2OVnhTGLQzrzHyR6a/D3mtu5exbbxM/A1VIUJOJ6jKGq+nc0heSaQnfHYwGTInHl
         qdptDVut5YeYSArTflEnE18pvWbOPe2Lj2djM0zkADZfRD6DSgOYy4Jy6qhy7mfxPuuI
         OmgHzhOSgr0Yox89wKFIxHQMowcSxR6z3tAP4kC0fkCxUZqmFTB+7W4alTGZMty2VeP1
         ccrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772359348; x=1772964148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=Pt/9dHx/RcXMXd8yCJ+JYsXakQEC0MZQ1pHHKOLqtf2f2G7CyMuHlm6M9Zs/6wEjQS
         s1UZWk09HFH7R3CQzR0FsPfuCdb5dVsTVQQZDip2QsE2r8tFk/bo28xIYTbRKrEclk6d
         wZ7HlWifVQsRdCE02KWUeMx1BpPqfr76m+M3DoUA9rQ4F/gDSPXYvU7x/401FqyNs0b/
         oG5h5VVnWd0DrvWMjVSrqlQyg58MoEmtZ2ODd6gZ0gf5orllLFtlqlpmp5fpDkWcTduN
         6hrT+2d3G222GRnhwh9K0aqj9mPsrUc2xJu4dISsbQ0M+O0zQhwRudndwWUmbyt2CW+0
         YN4A==
X-Forwarded-Encrypted: i=1; AJvYcCV/mwBqAZ0Yx9P8Bs0aL8KR17qWOpahZL7mkNIX5EZyRO/z975L8y1x7XSPUDQskV72gynWr1n24MX6IAjhQxAZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwDrBcE/lxQv1ErMzLVIOjQal1+yq5IuQ6iJi8Yz/zc3FJvGtzM
	JJsq1O8eWQ/ih4SbtPo96S6mkeonusCaYCjwq9J335xfSb0u5C0oui5KSsAoPXcybwpwm2IggOA
	txYXrg5CNewJpvnEhc2eNqeF/C8M9UfIzT23MYj2ewTNPihtfhkFSeOrauTnC/vGyK9OUr4o1yh
	5X1Q==
X-Gm-Gg: ATEYQzx77NERHs/kBw3emvCgaka1hYp0v5J8i+ZXDKHIByT0CYIjYa5Mjuy+HFHnRbB
	+1PujX61VF7Fur/Vl0FZ7IuQRJluReTe1V53nJAqhCgoKXZRbhxgl+sa1NIewwVNhz0L5CHW7c1
	Zog6l2/lCnE1r2YWgETZpcFiSFiixxqrEKjkgQd5I6b9zbb4zQzqEe4C1Xc37TmXhcKJdgtBQgx
	l31WMPlU6Lke5LzDYt6gVYyt1UqHk8tWbOUeKl66NXT9nWjV6qsuOPZTrCs9UkmIy9tJIvHl6yY
	rMoiOeJzn21NWpHeS946mFB1UjRENlkigcy/SY5DjLAhwkDlIMZOI0HALBTS7c+tDYr8jigs1hJ
	XQgOz0EtU377s8/1LD7GBcTEBoAV+Go2ouzuathy+w5w6hFG50uNVZFAWFW03xYN0iRWCIdYjsn
	Bz18zHK6435yxR+y3XaGzk0h/FWZYEn6TCRkg=
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244109985a.43.1772359348310;
        Sun, 01 Mar 2026 02:02:28 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244105085a.43.1772359347812;
        Sun, 01 Mar 2026 02:02:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302285fsm22929771fa.44.2026.03.01.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:02:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4OSBTYWx0ZWRfXyuSnnCuKuO1u
 YH8XhIDUoToyvPXXElUKnkZUwG7C7TW9l9WEeMRF8dy0l4FmRjeaIorNZH6VWTpea/jniF8cdVm
 R4t3het8u+l4PlULrXwiL/FGKaRzsrYgTG2ILpsNU0BltWAdZhVeGsJFPKiJkEcaD3HTUwEv3ae
 VJlkCgbSLl16sqZy0raG7ao5bCjInOmGQQZlOlfzzBu9OHkCWdEFZ5B5c+lBcnS0yYHq4wHyiB7
 sSMcJ6sAmJnPJIWa1ZxqiKWoFiJhsHebuIlrldavlPoinPlwu550dD8Zeg09KoNwtN19HRue4ui
 LX5QSO+9nZdpnDBjO84eIwg0vN9SisAI9tyw5d21GYwRpesG03PbwF7bEtb1XBc8Q8lli06Wqdv
 yc5IbvVkGMRaHI8YDR3rLa+iJZpUHsffRYA8aOzNghbsZAUNatDr8BgUrbL3IX/d/2GoY5eC5/E
 75xKjJdvwc9XrduJg8A==
X-Proofpoint-ORIG-GUID: nyeiKH7T8WRnFI2eAo_665m04qsPnvoF
X-Proofpoint-GUID: nyeiKH7T8WRnFI2eAo_665m04qsPnvoF
X-Authority-Analysis: v=2.4 cv=I5dohdgg c=1 sm=1 tr=0 ts=69a40eb5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZF1vm7_Oee5k7ESqZ6kA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_020231_820176_ED0FE615 
X-CRM114-Status: GOOD (  30.07  )
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

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 

> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	}
>  
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> -		id, target && *target ? *target : NULL);
> +		id, arg->np ? arg->np : NULL);

Is it just 'args->np' then? If it's NULL, it's NULL anyway.

>  
>  	/* Bypasses translation */
> -	if (id_out)
> -		*id_out = id;
> +	arg->args[0] = id;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bff8289f804a..74fc603b3f84 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	u32 sid_i, sid_m;
>  	int err_i, err_m;
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;

of_node_put(iommu_spec.np);

>  
> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1b7696b2d762..5f1d6540049a 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 824649867810..9d72d76f909d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out);
> +	       struct of_phandle_args *arg);
>  
>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>  
> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
>  			     const char *map_name, const char *map_mask_name,
> -			     struct device_node **target, u32 *id_out)
> +			     struct of_phandle_args *arg)
>  {
>  	return -EINVAL;
>  }
> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>  }
>  
>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> -				  struct device_node **target, u32 *id_out)
> +				  struct of_phandle_args *arg)

Document that it's the caller's responsibility to of_node_put() returned
node. As it can be seen from the previous comment, it's not obvious.

>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> -			 target, id_out);
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>  }
>  
>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>  				struct device_node **target, u32 *id_out)

Is there a reason for chaning the of_map_iommu_id() args but not
of_map_msi_id() args?

>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
> -			 target, id_out);
> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };

Which driver passes something being worth of storing in .np?

> +	int ret;
> +
> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
> +	if (!ret) {
> +		*target = msi_spec.np;
> +		*id_out = msi_spec.args[0];
> +	}
> +
> +	return ret;
>  }
>  
>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

