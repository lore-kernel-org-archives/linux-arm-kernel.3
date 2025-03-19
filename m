Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FB4C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wv/JMa59iPeha8ecw51y5UYHYXQ3yaH9RGx+mD3DOpc=; b=jwkDppupDbFXVjn1aP+hdwRKsN
	lNy1C5TSkL4zDVGyH29cGtenacYSQnrtc9aMR8s6CLM+k1x4IgBK9zOoPsrg4eth8hf41/WqnIH1H
	amzQjlEZsLhKv4VJ88voPZ+Cuqx4jqUK02l6I2Gu3RzeRr0SI4d36V/ogOQbxJ96U+b1P10I9jSVL
	M2con1PLs4uBst+vEgNuCnOAfVxt507ZOIeomOyNJm6Czklsp9thjQD+5qhYorqWXFV6V0Lsxh2V6
	vYBmh7y7oPQDrV4opddheMcpFVTKwSacZyJVi/thsilsBhpA6MSN/haTin+xPRMkz1tnZhIr2Ah55
	rBUQt9ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tumuJ-000000087fM-1UHI;
	Wed, 19 Mar 2025 06:28:03 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tumsJ-000000087VR-0TDo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 06:26:00 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52J6PaLY2867113
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Mar 2025 01:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742365536;
	bh=wv/JMa59iPeha8ecw51y5UYHYXQ3yaH9RGx+mD3DOpc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FECVW/wHrZKI1FDW/kX1vkt0dr8LLLpKGdETf309/1kTHOrO4GqcSoKZGBnf6O5gw
	 ozqbDvJ08pOS3xeoh8sJtJhMtqpRSm1fCwC3EDKPIZtXpFxRgk2b51Zb531APUBGBi
	 E7axGjYlhdUY9fsgS3CxQGia9KMipVgWSETY4HHU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52J6PaWK000874
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 19 Mar 2025 01:25:36 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 01:25:35 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 01:25:36 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52J6PZnl106908;
	Wed, 19 Mar 2025 01:25:35 -0500
Date: Wed, 19 Mar 2025 11:55:34 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Peter Chen <peter.chen@cixtech.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <cassel@kernel.org>, <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>,
        <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH 0/4] Loadable Module support for PCIe Cadence and J721E
Message-ID: <20250319062534.ollh3s5t7znf5zqs@uda0492258>
References: <20250307103128.3287497-1-s-vadapalli@ti.com>
 <Z9pffxeXHVOsoi4O@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z9pffxeXHVOsoi4O@nchen-desktop>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_232559_357793_6DD3311D 
X-CRM114-Status: GOOD (  22.65  )
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

On Wed, Mar 19, 2025 at 02:09:03PM +0800, Peter Chen wrote:

Hello Peter,

> On 25-03-07 16:01:24, Siddharth Vadapalli wrote:
> > EXTERNAL EMAIL
> >
> > Hello,
> >
> > This series enables support to build the PCIe Cadence Controller drivers
> > and the PCI J721E Application/Wrapper/Glue driver as Loadable Kernel
> > Modules. The motivation for this series is that PCIe is not a necessity
> > for booting the SoC, due to which it doesn't have to be a built-in
> > module. Additionally, the defconfig doesn't enable the PCIe Cadence
> > Controller drivers and the PCI J721E driver, due to which PCIe is not
> > supported by default. Enabling the configs as of now (i.e. without this
> > series) will result in built-in drivers i.e. a bloated Linux Image for
> > everyone who doesn't have the PCIe Controller.
> 
> If the user doesn't enable PCIe controller device through DTS/ACPI,
> that's doesn't matter.

The Linux Image for arm64 systems built using:
arch/arm64/configs/defconfig
will not have support for the Cadence PCIe Controller and the PCIe J721e
driver, because these configs aren't enabled.

> 
> > @@ -209,6 +209,12 @@ CONFIG_NFC=m
> >  CONFIG_NFC_NCI=m
> >  CONFIG_NFC_S3FWRN5_I2C=m
> >  CONFIG_PCI=y
> > +CONFIG_PCI_J721E=m
> > +CONFIG_PCI_J721E_HOST=m
> > +CONFIG_PCI_J721E_EP=m
> > +CONFIG_PCIE_CADENCE=m
> > +CONFIG_PCIE_CADENCE_HOST=m
> > +CONFIG_PCIE_CADENCE_EP=m
> 
> The common Cadence configuration will be select if the glue layer's
> configuration is select according to Kconfig.
> 
> Please do not set common configuration as module, some user may need
> it as build-in like dw's. Considering the situation, the rootfs is at
> NVMe.

The common configuration at the moment is "DISABLED" i.e. no support for
the Cadence Controller at all. Which "user" are you referring to? This
series was introduced since having the drivers built-in was pushed back at:
https://lore.kernel.org/linux-arm-kernel/20250122145822.4ewsmkk6ztbeejzf@slashing/

Regards,
Siddharth.

