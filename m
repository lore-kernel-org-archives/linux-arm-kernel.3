Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B724CAC597
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 08:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tK7KqxjdZLBASzeM34EVBqx8HWtcYbb8JxjopxX43w0=; b=Vqsy4MIOdZPBs9ZXyb4A35NFS7
	kfZeIAMd3Vx4Cn2GYeap2BWz+dfQde/zyPJ0bWaclZNEreAeqIT4e6ca12Wm2gTFE6FW+vrsQbSCM
	GP8PSThPtGBgjGCYqNFXthlFATpOp8tlBtm6geBO/LV/sXMilyHM8AHYTmiP4z+OyQY1M0JFed1Mo
	523ySWclplHFst5EJ8UkcCZDY930o7raYfO0H6ES18/IJUL6sQ7A+v1jBMePSmZdsqOn4JkpR1j2S
	E1w6rlwsLYqjiDMX77s0e+J2LfVfSOsmajadSh5gBs+N6qFdQX02preG3UYoHOgOoDELWQYEJHPFq
	e6Rw5Cig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsf5-000000051LN-1rTn;
	Sat, 20 Sep 2025 08:09:39 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzsf3-000000051Kw-0HAw
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 08:09:38 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58K89O51389660;
	Sat, 20 Sep 2025 03:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758355764;
	bh=tK7KqxjdZLBASzeM34EVBqx8HWtcYbb8JxjopxX43w0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Oq/cyC6x3/uAqlrNORZUalQdytMXrSoiZ+MJZeKSuwy+EFCoNxiu+1WR8bPvmjVLd
	 5Il7K5dPlB0p8okENOu+NzN5FRO5M4wqK69k+cxGzu422Hxgf6hTU1LlEZAYGrvHp+
	 U9vNUKZIF0Je4nUKTm4VOflejILv6fVy/5rmr9no=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58K89O0N3499538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 20 Sep 2025 03:09:24 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 20
 Sep 2025 03:09:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 20 Sep 2025 03:09:23 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58K89MDc3568350;
	Sat, 20 Sep 2025 03:09:23 -0500
Date: Sat, 20 Sep 2025 13:39:22 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <jingoohan1@gmail.com>, <christian.bruel@foss.st.com>,
        <qiang.yu@oss.qualcomm.com>, <mayank.rana@oss.qualcomm.com>,
        <thippeswamy.havalige@amd.com>, <shradha.t@samsung.com>,
        <quic_schintav@quicinc.com>, <inochiama@gmail.com>,
        <cassel@kernel.org>, <kishon@kernel.org>,
        <sergio.paracuellos@gmail.com>, <18255117159@163.com>,
        <rongqianfeng@vivo.com>, <jirislaby@kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>
Subject: Re: [PATCH v2 09/10] PCI: keystone: Exit ks_pcie_probe() for the
 default switch-case of "mode"
Message-ID: <3f3b2f06-64a3-4e6d-9fa9-c3412b1ca710@ti.com>
References: <20250912122356.3326888-1-s-vadapalli@ti.com>
 <20250912122356.3326888-10-s-vadapalli@ti.com>
 <lo2zv3nxek57s3h4hwv2ujzophdx2ubfuam4gqmo5h77t2g4jo@447qpc7a4ub3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <lo2zv3nxek57s3h4hwv2ujzophdx2ubfuam4gqmo5h77t2g4jo@447qpc7a4ub3>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_010937_198410_2ABE4B05 
X-CRM114-Status: GOOD (  31.13  )
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

On Sat, Sep 20, 2025 at 12:06:46AM +0530, Manivannan Sadhasivam wrote:
> On Fri, Sep 12, 2025 at 05:46:20PM +0530, Siddharth Vadapalli wrote:
> > In ks_pcie_probe(), the switch-case for the "mode" is used to configure
> > the PCIe Controller for either Root-Complex or Endpoint mode of operation.
> > Prior to the switch-case statement for "mode" an invalid mode will result
> > in probe failure only if "dw_pcie_ver_is_ge(pci, 480A)" is true, which
> > is the case for the AM654 platform. On the other hand, when that is not
> > the case, "ks_pcie_set_mode()" will be invoked, which does not validate
> > the mode. As a result, it is possible for the switch-case statement for
> > "mode" to receive an invalid mode. Currently, an error message is displayed
> > in the "default" case where "mode" is neither "DW_PCIE_RC_TYPE" nor
> > "DW_PCIE_EP_TYPE", but the probe succeeds. However, since the configuration
> > required for Root-Complex and Endpoint mode have not been performed, the
> > Controller is not operational.
> > 
> > Fix this by exiting "ks_pcie_probe()" with the return value of "-EINVAL"
> > in addition to displaying the existing error message.
> > 
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> 
> Fixes tag? And probably CC stable since the controller seems to be not
> operations without this fix.

While I had mentioned the rationale for not including the 'Fixes tag' in
the v1 patch below the tearline, I forgot to add it in this patch. I will
quote the same below:

    NOTE: A "Fixes" tag is ommitted on purpose since the fix is not crucial:
    1. It doesn't fix a crash or any fatal error
    2. It doesn't enable controller functionality by fixing the issue

    Therefore, the patch may not be worth backporting.

Prior to this patch, the probe succeeded and the controller was
unusable. Post this patch, the probe will fail and the controller is
still unusable. Behavior is identical from a usability perspective but
the user is aware of the issue since the probe fails.

> 
> - Mani
> 
> > ---
> > 
> > v1: https://lore.kernel.org/r/20250903124505.365913-11-s-vadapalli@ti.com/
> > No changes since v1.
> > 
> >  drivers/pci/controller/dwc/pci-keystone.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> > index 2da9feaaf9ee..e85942b4f6be 100644
> > --- a/drivers/pci/controller/dwc/pci-keystone.c
> > +++ b/drivers/pci/controller/dwc/pci-keystone.c
> > @@ -1414,6 +1414,8 @@ static int ks_pcie_probe(struct platform_device *pdev)
> >  		break;
> >  	default:
> >  		dev_err(dev, "INVALID device type %d\n", mode);
> > +		ret = -EINVAL;
> > +		goto err_get_sync;
> >  	}
> >  
> >  	ks_pcie_enable_error_irq(ks_pcie);

Regards,
Siddharth.

