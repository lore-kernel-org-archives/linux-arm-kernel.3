Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A22CD6E63
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neCAU6JiAIrNavxmxrVWpzLfSfSJCd8XJ2ebL03wvCc=; b=IyZ3bfEJSOyRG90I8z2rYd99Ii
	KcQws6Zbiwt7rk7X/6h1oWIyB9+19El/IU1BFVpTYTLQLEnZ86j6rch/3QmXOo1H1SGcNkqIGQrBi
	LsUAXSipT5pZltfAe3QZbHr4XiPsmM9ipJCW/r1N0koVFibC6xOPOFHqAWYkvvfw+5FKzIr+RMH5N
	0aKjLDcn+3I84HBktXA/dP/BiguYF128jumxVbcOSdd251JsoI9mkH3JNytn61U6QmmvQ83f7wW7t
	qPE3YduvP4fI27NVpcs8C3W5/y5dZwXG11FWwBe+84zMjwhx93gd4aOfU9s262KXf8DPjbRXeEPZ5
	WvaMyK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxqE-0000000ALEx-0YNj;
	Mon, 01 Jun 2026 08:17:46 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTxqB-0000000ALEa-2YLj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:17:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PD6ejMPU7SCFStBSGJR3hQj4Ip6qoFFCnRYt9z/O8nQbUqxisci6HU1Dr4V9wq2UKie45itROPKLtDC/98uM9LCcaFmGEs1xjq1uXPYscF52zSOySh87IavXLN0/Agu7fhNcBQDGZQIc9b1sVDJL85TIAQVJXpEYhxVT+S8vNSyN7gB1oSLnJldG/97XeHEdJdeYTsC8mzL2CjY5bUIgNwNTeSljyWkYshjDYwu5uXtTXCHU5IEGT1Ch22EHXwoVGo5J62j8A2Vfyp+O5nvzkcnyCI4XaNTM0PH5YUpGfH6frcDc2EuyYMWsCZTIObtUKUpUNRvB5c3oTedxoO5+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neCAU6JiAIrNavxmxrVWpzLfSfSJCd8XJ2ebL03wvCc=;
 b=inhis3O4xRI+481UqNY/4iXirOPOTF3skvKOaUlmBJ3drbbRDA/3UZF2IjnObZVcxrM2XnwhkeLR49cKwolhS06U4yFKrgUjAcB0wlF4m6SSLqdSHbeYND3TzhWNeWxHuYi3mMOVJbO6YyHIg3O/D84dRaKvl2s67ut7mMPC2AYWLN8zTHlfJd3aODcsqTGr/CbCgMVYyTQ6Ax/rgFvtcBlSVSY9camCvPGyf2gTavdThxEp1XPFxc5ghS2frNSaLhHQBXOvSlWxRxmbnRUQERjNTdhcJetuxYezkPsX/GXwfBAU0Mky6w8yter0VPBPmGxzTUA0viU16X7K7umoKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neCAU6JiAIrNavxmxrVWpzLfSfSJCd8XJ2ebL03wvCc=;
 b=DdSh1Uw+qDxPC+2XpkMsf9T71P9BDVn37yvVCmv1S8n62gJDOACr9orv7axTPcHujrQfRs+oALRaBD6OeXEFEsgsHh/8DBWGLcB6FuhvtdpSaAhnncidcShBX3G90LMXFim4IgKT0iMPTYgiaXHKL9RgIrf3v7mMzuA5SVf4DTE=
Received: from SJ0PR13CA0197.namprd13.prod.outlook.com (2603:10b6:a03:2c3::22)
 by SA1PR12MB6800.namprd12.prod.outlook.com (2603:10b6:806:25c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 08:17:35 +0000
Received: from CO1PEPF00012E5F.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::61) by SJ0PR13CA0197.outlook.office365.com
 (2603:10b6:a03:2c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.6 via Frontend Transport; Mon, 1
 Jun 2026 08:17:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E5F.mail.protection.outlook.com (10.167.249.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:17:34 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 1 Jun
 2026 03:17:33 -0500
Received: from amd.com (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41 via Frontend
 Transport; Mon, 1 Jun 2026 03:17:28 -0500
Date: Mon, 1 Jun 2026 08:17:23 +0000
From: Ankit Soni <Ankit.Soni@amd.com>
To: Pranjal Shrivastava <praan@google.com>, Vasant Hegde
	<vasant.hegde@amd.com>
CC: <iommu@lists.linux.dev>, <linux-pci@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	"Joerg Roedel" <joro@8bytes.org>, Will Deacon <will@kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, David Woodhouse <dwmw2@infradead.org>, Lu
 Baolu <baolu.lu@linux.intel.com>, Robin Murphy <robin.murphy@arm.com>,
	"Suravee Suthikulpanit" <suravee.suthikulpanit@amd.com>, Jason Gunthorpe
	<jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, David Matlack
	<dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>, Daniel Mentz
	<danielmentz@google.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	"Mostafa Saleh" <smostafa@google.com>
Subject: Re: [PATCH v6 6/6] iommu/amd: Fail probe on ATS configuration failure
Message-ID: <drmnqcya6v6wtcazil4wojno2crp4obywudycl45uvqszp66ms@5t5uj2624dor>
References: <20260529111208.387412-1-praan@google.com>
 <20260529111208.387412-7-praan@google.com>
 <unqzyef2n26wdf6tmc6vvwvpsgv244uvz7cxji4scymqmoofyb@trkzr7ix5bog>
 <ah0kyi5asHpnrpgC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ah0kyi5asHpnrpgC@google.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E5F:EE_|SA1PR12MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 583cab91-840d-440a-3814-08debfb63bea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|7416014|18002099003|22082099003|6133799003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: qFIYBb2djGtxH5UO3q9hIWDjnFVsk8zN3UOmw5s2C1hu+KYz/SwfpL1GKSrz2r94AdSIYq0HNbOR1zN+EeKVocpTXJ8X5rcHQC9VXEs0qko2xaec2JvgaoimXTyL1hBatvLqWoKBL7TIxJ8SmrgiFkkq7toJxt7S7PutVKwDsXiMqL/TUaYWeu/5oJiLxM/CYQUtG7oSES+4OLR3BRpo52R8wRsnCfaIxJYj5u3FvI1ynQ7V64/4/ZB1RMSSzktL2ZVEIS70RzwFcRxCgSysc6fVWwXafmVxNWVIgey7pcWifl+mNZkGQOwbnd2+eLprrrnxVfucKtHihKaNPz+mrzz9ja/LocEmpcPXQ0GrQg9TwJicIjskGQf8pa/BoqRuWI1KvRMPB1+sLA7fdK06ZVhJ7n2OJP9z6zL5Ze6M+Rr/A87zFiQk9WSBk8sgvkIYvIhQiqrAM7I/49UGpBnzQbIAlkekDKVilQefedmdW06MfJ6UkOWg7ISFx0ZAKk1xXqh1oEkV5AdvSoDxP/t3in1l5CxEEEbRKdYakT3iqEng7LWtaFoBciKpSfbNWI0bB2QCDun4qg0VbaehSLoh0JjU0/c8uyvJG9pK+Gg0dHiXMLC+SwGIBIWCc4BqEP08RN4Cq72pZr3YwgmxnzpPyreBB6yEX34wuXPvTJmSlLqTVWKFm3WAPZHw7Oiht5h0XFh8WwWLGxMP6CBpCtcCkphslr0Ri8hiYhxFo+NBqB8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(7416014)(18002099003)(22082099003)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZNa079jLdv8IgigzYWc9aOTiaaxJuYQqjRyx/HhnzHNes2WkInh/mHCmBhRQkrkoK0IBcP+9AbE8nPOP7Z3VrKdDK18AYm8smLyePs10ptI6MgtsZtlcOu48qMJhkPkPdpUT0d2VRbm7v4TqsPHJlED1rq57YCQ5XW1+eOWekIXMoOD9Cu6DEt1vWuejc31JysSt4itAsC5TrA4W1TvobGj+ge8S19CsmkWYdOvoBXQnZg8YzCmCuaw68JFgIWmoltPrcRI5holhYEpk8h3BLECun2nBrga8J5pcyOoiwTfFpNZUxPtpwIje4sSfU/byeeZjLOOJLtbJH9Nav5ghTSzKJQM9Fd9GmBKGbFsHAMVACz06yTZbalvA38Nf9lPpXvIbBr11Q0pgta9ev0WuW3q4dMXlQ/7MNZtGtXMIYKR8RCTWYq7bSmb/ZcAmzq11
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:17:34.1988
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 583cab91-840d-440a-3814-08debfb63bea
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E5F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_011743_719031_1775F563 
X-CRM114-Status: GOOD (  34.57  )
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

On Mon, Jun 01, 2026 at 06:20:58AM +0000, Pranjal Shrivastava wrote:
> On Mon, Jun 01, 2026 at 06:00:15AM +0000, Ankit Soni wrote:
> > > @@ -2502,10 +2508,22 @@ static struct iommu_device *amd_iommu_probe_device(struct device *dev)
> > >  	else
> > >  		dev_data->max_irqs = MAX_IRQS_PER_TABLE_512;
> > >  
> > > -	if (dev_is_pci(dev))
> > > -		pci_prepare_ats(to_pci_dev(dev), PAGE_SHIFT);
> > > +	if (dev_is_pci(dev)) {
> > > +		struct pci_dev *pdev = to_pci_dev(dev);
> > > +
> > > +		if (pci_ats_supported(pdev)) {
> > > +			ret = pci_prepare_ats(pdev, PAGE_SHIFT);
> > > +			if (ret) {
> > > +				iommu_dev = ERR_PTR(ret);
> > > +				goto out_err;
> > > +			}
> > > +		}
> > > +	}
> > >  
> > >  out_err:
> > > +	if (IS_ERR(iommu_dev))
> > > +		iommu_ignore_device(iommu, dev);
> > > +
> > >  	return iommu_dev;
> > >  }
> > >  
> > 
> > Hi,
> > This regresses IRQ remapping in the PD_MODE_NONE branch. By design
> > rlookup_table[devid] must stay valid for IR - init.c:2257 documents
> > this: "Do not return an error to enable IRQ remapping ...". Pre-patch
> > the PD_MODE_NONE branch returned ERR_PTR(-ENODEV) without nulling
> > rlookup, precisely so irq_remapping_alloc() / __rlookup_amd_iommu()
> > keep working; this unconditional cleanup violates that.
> > The new pci_prepare_ats() failure path has the same shape:
> > amd_iommu_set_pci_msi_domain() ran earlier and parented dev->msi_domain
> > on iommu->ir_domain, but on this new out_err that's not unwound. So
> > nulling rlookup_table[devid] makes irq_remapping_alloc() return -EINVAL
> > on the first MSI alloc for the device. Sashiko also flagged this in [1];
> > 
> > Also if iommu_init_device() branch fails, iommu_ignore_device() will be
> > called twice.
> > 
> 
> Hi Ankit,
> 
> Ack. Sashiko made me realize that this regresses IRQ mapping for AMD,
> and I agree that the call to iommu_ignore_device() is a bit too 
> aggressive as it  wipes the rlookup_table entry required for IRQ 
> remapping, particularly in PD_MODE_NONE.
> 
> I was thinkig to address this in the next version as follows:
> 
> 1. Split the probe error paths:
>    - Proper init failures (like iommu_init_device) will continue to call
>      iommu_ignore_device(). I will fix the double invocation here.
> 
>    - Config failures (like ATS mismatch or PD_MODE_NONE) will return an
>      an error but skip caling  iommu_ignore_device(), preserving the
>      rlookup_table entry for IRQ remapping.
> 
> 2. Resolve the Use-After-Free (UAF):
>    To prevent the UAF on the "DMA-only" failure path, I will ensure that
>    the hardware Device Table Entry (DTE) is set to a safe state (like
>    blocked or bypass) and the dev_data->dev pointer is cleared, as the
>    IOMMU core does not invoke release_device() after a probe failure.
> 
> 3. Fix iommu_ignore_device() infrastructure:
>    I will address the pre-existing bugs identified by Sashiko:
>    - Fix clearing order (calling setup_aliases before clearing the
>      rlookup_table).
>    - Replace the non-atomic memset() on the hardware dev_table with an
>      atomic DTE update.
> 
> That said, I'm investigating the safest way to revert the MSI domain
> assignment on probe failure to avoid the dangling domain issue pointed
> out by Sashiko. Maybe we can add an amd_iommu_restore_msi_domain() helper
> to revert the assignment made in amd_iommu_set_pci_msi_domain() on probe
> failure?
> 
> Please, let me know if that sounds okay?
> 
> Also, I'm wondering if I should send this as a separate series specific 
> to AMD which is unrelated to this one? Or maybe handle AMD IOMMU in a
> separate series altogether. Let me know if you (and Vasanth / Suravee) 
> would prefer that?
> 
> Thanks,
> Pranjal

Hi Pranjal,

Plan looks good. One pushback: I don't think you need the
amd_iommu_restore_msi_domain() helper.

If point 1 preserves rlookup_table on the PD_MODE_NONE and
pci_prepare_ats() failure paths, dev->msi_domain pointing at
iommu->ir_domain stays functional - irq_remapping_alloc() /
__rlookup_amd_iommu() find the iommu and the chain works.
So fixing rlookup makes the MSI assignment correct, 
not dangling - no restore needed.

On splitting: While patches 1-5 are essentially settled. I'd lean 
toward pulling AMD into a separate follow-up so the rest doesn't wait,
but defer to Vasant/Suravee on that.

+Vasant

Thanks,
Ankit

