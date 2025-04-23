Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B63BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kne9B5HdCuOKeWEfCSxnIK/Om9pYT1tA2Pc21Izdsiw=; b=ErXQxGZO/3gaVHgnrQUIf5a8Xp
	lowHDwoEzKM1aEa0a1Z/l7VO2dV58Lir5ZdN+NTncPAw0zT+sx308h7dLoK3p13hYUXEoHkEdWXpJ
	r7zcWHhSAGjYNx/0KuxbGCLlm56HppIHYfARpi6vM6UW8n1zgptBoAr3zzjr2y7xUHAYigKtlXT2W
	xxTZys9LQufJsIDY3PKSrY6RMtevneypniD2lDgjAgXvTMK4Rj7i2v3RNeGTOwVAkahsedunRpzNp
	13oPKv06uQhZUqGm2N4pCSPSkXoyhKYXKjDby0OtPEyLFGdwUJPmHCTvHvrYC4aM4wQmFsoEUnnd7
	3vXK1q6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SJQ-00000009Duy-3iTx;
	Wed, 23 Apr 2025 05:06:20 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7SHS-00000009DnA-3ASR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 05:04:20 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53N53tB42199968
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Apr 2025 00:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745384635;
	bh=Kne9B5HdCuOKeWEfCSxnIK/Om9pYT1tA2Pc21Izdsiw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=mvL4O6fgv/vy8vu+JMpi+BywPYZeqxNja0WbcKaRNcZOKYWeY5c+epfkzyLSQ8XYb
	 Pz0Y6g58h8N5RByhEzaXX+EgwQ8bkPTjA8dDYSMn5GuxWlWNu11LQrLincMdJD9paC
	 cIgorh3DsLgzMUdEstxHd//toEhVLAbC4bz91QuA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53N53tAE016440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Apr 2025 00:03:55 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Apr 2025 00:03:54 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Apr 2025 00:03:54 -0500
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.113])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53N53rgV084408;
	Wed, 23 Apr 2025 00:03:54 -0500
Date: Wed, 23 Apr 2025 10:33:53 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>, <lpieralisi@kernel.org>,
        <kw@linux.com>, <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <bhelgaas@google.com>, <vigneshr@ti.com>, <kishon@kernel.org>,
        <18255117159@163.com>, <cassel@kernel.org>,
        <wojciech.jasko-EXT@continental-corporation.com>,
        <thomas.richard@bootlin.com>, <bwawrzyn@cisco.com>,
        <linux-pci@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>
Subject: Re: [PATCH v4 2/4] PCI: cadence-host: Introduce
 cdns_pcie_host_disable helper for cleanup
Message-ID: <35d14093-85b1-4273-810c-2dbeaa3acc4e@ti.com>
References: <20250417124408.2752248-3-s-vadapalli@ti.com>
 <20250422164934.GA333709@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422164934.GA333709@bhelgaas>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_220418_885667_74CF944A 
X-CRM114-Status: GOOD (  18.01  )
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

On Tue, Apr 22, 2025 at 11:49:34AM -0500, Bjorn Helgaas wrote:

Hello Bjorn,

> On Thu, Apr 17, 2025 at 06:14:06PM +0530, Siddharth Vadapalli wrote:
> > Introduce the helper function cdns_pcie_host_disable() which will undo
> > the configuration performed by cdns_pcie_host_setup(). Also, export it
> > for use by existing callers of cdns_pcie_host_setup(), thereby allowing
> > them to cleanup on their exit path.
> 
> For the merge commit log and eventual pull request, can you give me a
> hint about the motivation for this?  Based on the other patches in
> this series, my guess is that this is required for making the j721e
> driver buildable as a module and removable?

I have described the motivation in the cover-letter of this series in
detail. I am sharing the same below for your reference:

"The motivation for this series is that PCIe is not a necessity
for booting the SoC, due to which it doesn't have to be a built-in
module. Additionally, the defconfig doesn't enable the PCIe Cadence
Controller drivers and the PCI J721E driver, due to which PCIe is not
supported by default. Enabling the configs as of now (i.e. without this
series) will result in built-in drivers i.e. a bloated Linux Image for
everyone who doesn't have the PCIe Controller. Therefore, with this
series, after enabling support for building the drivers as loadable
modules, the driver configs can be enabled in the defconfig to build
the drivers as loadable modules, thereby enabling PCIe."

In brief, in order to enable the driver configs, the driver needs to be
a loadable module. Else, the patch for the configs will be rejected:
https://lore.kernel.org/linux-arm-kernel/20250122145822.4ewsmkk6ztbeejzf@slashing/

Regards,
Siddharth.

