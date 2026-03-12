Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84FB21067038
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=; b=GAz72pMP42Tn2dvIWiyvIShtwM
	+BT7VzZ5e2C4r2zP8W4wnP+IHp2T/J4iawzlU7pt9y4ltJYISsZG9L889V+xwvOZ8waE4HQz0WqAs
	DLL1FAiVwXtnxIiv0aT3r+8VHFziEp0KvBfsJIpq50JkIygWH42a1u1DBgS1y3N8wWjlbeWvUjNt6
	WBiSuwxboAc8JBypAb4Uy5FwZAJD9h+j93MzI9/w6/I6HFNOoNG1H9Uy7XaZzxgx4QG7+0aZLmKRq
	hMdykJ8SyjL41tJxJATMZMKScu9jrSGVZAawiRmVyx7RP+ot8JWE5EAbZtBVzQJsaNegfBkMEGKt7
	QstHgHqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0grv-0000000ECA2-1mgD;
	Thu, 12 Mar 2026 14:18:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0grs-0000000EC9V-13jJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 14:18:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9YdOs4025894
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 14:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=; b=pC9s3oCR3E3pJGcF
	6UBJOzneozRH8yHPflsxqstBz8NmkNtzIcCOMzWl7Mf8bniEEG3tg1o8Gf6eOER8
	iEH5SI48La5x3ShD7d2U00BqfTQnGC86RMZBVy2//Y+3lQg8W+seoMLrQOG0EE+z
	dNM8ykzfkh7kNSve4jqCX2isXmsW6au2z2aD2Vl0RhkvgqBsHAjer2W60uOZM/ou
	G8q60QJZpk6R8OE+8EDLj6gFvBCIXS+427OcZgRvCgssFzBbiFfuWMcbTcw+C5VY
	9kymaHldyvZ6go56cowbutM/NN/MqcTN7b0pv0p53rwa2PzV2geT4iFmeTzVyLMA
	ChezqA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh50tawq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 14:18:25 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5fa75a19f21so17924491137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Mar 2026 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773325104; x=1773929904; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=RCj0mFf0ulY54UkXWYL6rhZT074mxuroZbTNzVUraYzm5uhQQn9VER2SklYvEvZGjX
         a53dJCL1rg9C/9vBdifMFmD92GdcNN2BxobBvGKs5e8U/JV/spgjr3Rmw2oZ5587HT08
         0OPCpVRYHVUIiR/wwQYiXvF4d6H+/MSNJMHMDaFq1FV8EXYmA+RAMOVPfRv3nO5rrEvL
         Ov80kHS7vG418ZmJU80kpU5KmCBAmWz89qwJJKKMN/1ceQwCyANF3wESsJr5YtXWQsik
         M0Vf1zHShsO7LQ+Bk7h0JA3m4Yn9D9u7w97XwJh1wDt+RGMB9HiTobOZ5q3ClOqcYuUw
         cZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325104; x=1773929904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=XYR+3tCm29CHgNWhXsS/AnX2Pk87FfUD/6auNw7ixL8/+R5XEloBB0rLO2ZYFXLqt/
         f/QBBoKW8Ep3Y51V+jQYKJ8p4SWw7EL4/4CKeDeaOHYH2lE56jwRmIZqqEwXMfkaqIjT
         I6FttfHxb0zPAwvw5lX9bz9XCEUXxvoxoKTT5MGaDPfkEF9cdEL0ADl0KELqUIcGYg6+
         mrHyplBkACVBXH7Mh843DQRzAKgWVJshlCaGoaY6RZ8oVBy6JIPvCknZvNn7qh1UEkUe
         Wq/3tsJ8Lunsqqn9rPYAgWoJsjCmvoHCUkFrmV4rhCYwSai2F8N9AbclhGvWPS7/IscL
         kx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6y0OwTbe12UBlSF+1AToh/6eSiO+rKHwp1DZ9L9aW54toCeMG0t6h0aXifQZ1TR+wyvB5PIIqI0gvIK2qwnbK@lists.infradead.org
X-Gm-Message-State: AOJu0YzN6be+V5ondhXunclgBUc5rMcdYx68NFDj2F9rhTV9a+RLheS+
	wL7PBftRuB1HiidJme2IHkCZVn4WUmufAtR4StSqIa65dIDSNPNDTEEd/QcZ1T5wlwY30kfl1Nr
	SFXbSy1XtMwnTVv6oGyoZhIFUiA/zjacX1nZoqNRI/3Kqtm4YUNx9YzcU0qEkvmOjCgZjnsD3ww
	Bnbw==
X-Gm-Gg: ATEYQzy5EVNSdlQYev0yrVUHySZTTpPmaqSl/qcDJPcw3G5iU+uyyCJ3wp8igvpjcOh
	9inHq1JTchI0HPORGXoTrssxPinjUY6Ih3SwIM4GOfQdcpOCWvtLtp+7X1PSzw1ZmyN3Nb81VYd
	KR7bqtl8Ww7KHJhTuJvoMyHmdKqIF1eZg/Cm+rTamsud4NFeaLerGAA5ivb3kjBUXYkFfapuxNI
	iLB4W10N1viGXopfyn3WTaoXbAxilIkuSB7aurZWYdXrHx0CdvM5odv4ia7EDHxlJmuMr9YWMS8
	+0h4bAgddmSTn4CmPx4nsw2EkFTEblvHWjEBNsduJ3dy7rUb9EEgcgqL/QkXAHFgBXWs8QTEw1G
	qbBR1NwoIamTK3/Z+OttByGxdwuFs+qRS9xzv6GAfC5o/c4ZBTBXNEW9hOYukyxFMmFIhS1PCnv
	hTCFIhu0B0yXc+I5Qnc56Sc4LvR/U0v79XY+c=
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406605137.17.1773325104555;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406556137.17.1773325104042;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e268sm977710e87.21.2026.03.12.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:18:22 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:18:20 +0200
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
X-Proofpoint-GUID: EGmHzgqQa3r170Qexy1Sd-Odo2G0QTiu
X-Authority-Analysis: v=2.4 cv=LvKfC3dc c=1 sm=1 tr=0 ts=69b2cb31 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KPxCMH61eqygQ3DODZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: EGmHzgqQa3r170Qexy1Sd-Odo2G0QTiu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExNCBTYWx0ZWRfX3o8I3zROI0lk
 NG5CbvmjueNagaVvDdvA/Yww4uWbMSnj8GkzFIx25lWFBFameYF9hnGY4yJyvKSVVlXP31JK1Kf
 l7cR+eCA10vlFVOmnX9BoZyE73xHHnfjgfQbEIB8y5lCZsMlaHigGazG7Aw9RsGsks9zW21QXH6
 I0cIVi2OTaReOUIo+lmIAM5qiQ1ek+x8cWgR/THC9sxWATYToORuPIy29docCx1vL5uSN4tFCfE
 CrLWxsJG98hwtN2/zZeeR/PEPJppsc4gPXB+yOrifnVHlKMX6WCuyXkl3t+qr258w6snt5tfPD/
 jJWtV+McCZxdn/VBAlAHHxs7zbIWq0OO+vmaDcUqdsvDN578RIB9W8iCL1ULKkjhX4Xx/mbaphj
 n+RgODI7nsMuvFY1Z1zbctUO5MEC/XxfO5ollKvHI3BhebnmO4VyY7am57j7xRhyz5VHQ8/2LUD
 VFUwNGKgQKlep1qA04g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_071828_301930_51CC3107 
X-CRM114-Status: GOOD (  29.13  )
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

On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
> >> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>
> >> Change of_map_id() to take a pointer to struct of_phandle_args
> >> instead of passing target device node and translated IDs separately.
> >> Update all callers accordingly.
> >>
> >> Subsequent patch will make use of the args_count field in
> >> struct of_phandle_args.
> >>
> >> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> >> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  5 ++-
> >>  drivers/iommu/of_iommu.c                 |  2 +-
> >>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
> >>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
> >>  drivers/of/irq.c                         |  8 +++-
> >>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
> >>  drivers/pci/controller/pcie-apple.c      |  5 ++-
> >>  drivers/xen/grant-dma-ops.c              |  4 +-
> >>  include/linux/of.h                       | 12 +++---
> >>  9 files changed, 76 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 63b3544ec997..03232b5ffbca 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  			   struct device *dev,
> >>  			   int nvec, msi_alloc_info_t *info)
> >>  {
> >> +	struct of_phandle_args msi_spec = { .np = NULL };
> > 
> > Why do you need to set it? Parse functions ignore passed args, don't
> > they?
> > 
> 
> The parse function does check arg->np on input — if it is non-NULL,
> it is used to match only entries targeting that specific node.
> 
> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
> pre-sets the node and passes it as input to of_msi_xlate(), so the node
> pointer is not ignored by the parse code:

Is it only being used for MSIs? If so, can we make that explicit in the
API by having the 'filter' device_node pointer?

> 
> u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
> {
>         struct device_node *of_node;
>         u32 rid = pci_dev_id(pdev);
> 
>         pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
> 
>         of_node = irq_domain_get_of_node(domain);
>         rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>                         iort_msi_map_id(&pdev->dev, rid);
> 
>         return rid;
> }
> 

-- 
With best wishes
Dmitry

