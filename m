Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1606CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:CC:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2E3bKUWqxt43xxDaSyCeVMDOuZW8i9NfudoceglB0M=; b=mWaMcvIthSSK2pX1oSTFPiAMQp
	fHvqagqBwZctH5EAOWvSD+QM44lcld2q5UE7JP83DwIA7FOHrW7LyXx4yAlO5SSKEJsIgWEoiOXak
	IxqhKRansDGo1NsARtuu17ljppiUKwS7iy4Q7qG2zef7cxXAm6EkHDkNF1SNHq2VBXZW3Dfy8wLuc
	bRxtSsDmDBzuJ5g5ByFpXUYRwDshv4JXSSZEdATsDg25SQxacGVXOAVBYX3mHyM4rbw4wQ7xB/WBr
	zp6cJ4Il2WTVv3ZrjA4xuWJQIfCru855lX266OBORdxTHSvhyuCPLyXrMtlCYTevJ6q6WjV99sBul
	g2UEI1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVhO-00000002OCO-3Gky;
	Wed, 22 Oct 2025 10:04:09 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVhD-00000002O86-35xi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:04:02 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59MA3loZ1388280;
	Wed, 22 Oct 2025 05:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761127427;
	bh=V2E3bKUWqxt43xxDaSyCeVMDOuZW8i9NfudoceglB0M=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=DBogCluXGB8JAxOJTLHi7+2AjNjNIo/R+ZPgLaOPa6hklMc9hKD2mHRZfwRB74yrF
	 uEyWxX5y5q5dtGL7RSyH9wu4Iv7NWV3idhxfejZkwz87aw/Zf3YRUmedSmxw1ntZHH
	 vToasDgKSGLxccUKNuJAyXEkc+tHSizw8c92vXCQ=
Received: from DFLE203.ent.ti.com (dfle203.ent.ti.com [10.64.6.61])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59MA3lqW2270139
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Oct 2025 05:03:47 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Oct
 2025 05:03:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Oct 2025 05:03:46 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59MA3f4s1039878;
	Wed, 22 Oct 2025 05:03:42 -0500
Message-ID: <1d9ba815214ba97e2a9a6d091661cf59ae22c7ca.camel@ti.com>
Subject: Re: [PATCH 2/2] PCI: keystone: Remove the __init macro for the
 ks_pcie_host_init() callback
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <lpieralisi@kernel.org>, <kwilczynski@kernel.org>, <mani@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <cassel@kernel.org>,
        <kishon@kernel.org>, <sergio.paracuellos@gmail.com>,
        <18255117159@163.com>, <jirislaby@kernel.org>, <m-karicheri2@ti.com>,
        <santosh.shilimkar@ti.com>, <stable@vger.kernel.org>,
        <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>,
        <s-vadapalli@ti.com>
Date: Wed, 22 Oct 2025 15:33:50 +0530
In-Reply-To: <20251002143627.GA267439@bhelgaas>
References: <20251002143627.GA267439@bhelgaas>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_030357_958753_C738E4D6 
X-CRM114-Status: GOOD (  24.71  )
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

On Thu, 2025-10-02 at 09:36 -0500, Bjorn Helgaas wrote:

Hello Bjorn,

> On Fri, Sep 12, 2025 at 03:37:59PM +0530, Siddharth Vadapalli wrote:
> > The ks_pcie_host_init() callback registered by the driver is invoked by
> > dw_pcie_host_init(). Since the driver probe is not guaranteed to finish
> > before the kernel initialization phase, the memory associated with
> > ks_pcie_host_init() may already be freed by free_initmem().
> >=20
> > It is observed in practice that the print associated with free_initmem(=
)
> > which is:
> > 	"Freeing unused kernel memory: ..."
> > is displayed before the driver is probed, following which an exception =
is
> > triggered when ks_pcie_host_init() is invoked which looks like:
> >=20
> > 	Unable to handle kernel paging request at virtual address ...
> > 	Mem abort info:
> > 	...
> > 	pc : ks_pcie_host_init+0x0/0x540
> > 	lr : dw_pcie_host_init+0x170/0x498
> > 	...
> > 	ks_pcie_host_init+0x0/0x540 (P)
> > 	ks_pcie_probe+0x728/0x84c
> > 	platform_probe+0x5c/0x98
> > 	really_probe+0xbc/0x29c
> > 	__driver_probe_device+0x78/0x12c
> > 	driver_probe_device+0xd8/0x15c
> > 	...
> >=20
> > Fix this by removing the "__init" macro associated with the
> > ks_pcie_host_init() callback and the ks_pcie_init_id() function that it
> > internally invokes.
> >=20
> > Fixes: 0c4ffcfe1fbc ("PCI: keystone: Add TI Keystone PCIe driver")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>=20
> I dropped this from pci/controller/keystone because of the resulting
> section mismatch:
>=20
>   https://lore.kernel.org/r/202510010726.GPljD7FR-lkp@intel.com
>=20
> ks_pcie_host_init() calls hook_fault_code(), which is __init, so we
> can't make ks_pcie_host_init() non-__init.
>=20
> Both are bad problems, but there's no point in just swapping one
> problem for a different one.

Since this patch is required only for the case where the driver supports
being built as a loadable module, I have reworked on the patch and have
squashed it into patch 4 of the following series:
https://lore.kernel.org/r/20251022095724.997218-5-s-vadapalli@ti.com/
The implementation above ensures that 'hook_fault_code()' is placed within
an '__init' function while the '__init' keywords can safely be removed from
the remaining functions. Please review and let me know.

Regards,
Siddharth.

