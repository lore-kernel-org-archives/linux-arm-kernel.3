Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69201CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 23:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=A3TVSBPvTAzpV2lCqomUSYCy+B+r1WiclbQNPvmeu/I=; b=g73RLbZ0kNKa4Z
	NFttmgaMn5HKPUvM/hiZNPylW0aoyDQ9w+RIBNLlP97c0d81ltk9rpeieDckUYbJK36IKFKQMfHeq
	uK+sWxI+Z4ekPbg3UfAx5/hNQFM8S0d7VEVabnshrh4TukHZSvL7jhNTAXNDfgxyGAba53MPJGW6D
	KanLck/I1AKyy9PNhKOKkHTOBnU7yNXO56v0bRMySiKdaNvlxXv3Z3q9YhYtHfCu646jNwGbEyqu8
	jANbQ0g/Mv7cjpGaP4/JrT2PINT8nEvvYjQZAp71xncJh/JKtbt6qBGRXNCbwbiv8EPQIvD9D7vqP
	zNfhAueb/B93N29cBbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUAR-000000035dx-39C1;
	Tue, 19 May 2026 23:48:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPUAO-000000035dG-0AeL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 23:48:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id C772B43903;
	Tue, 19 May 2026 23:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 802651F00894;
	Tue, 19 May 2026 23:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779234482;
	bh=A3TVSBPvTAzpV2lCqomUSYCy+B+r1WiclbQNPvmeu/I=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Jo+ASq8MQQkL0btOV+rJ+HkyOcuSKCJ3DLbkOFiSfw2YluJRoDhtsj5UlnYvYPwyl
	 X8uyn4Kd1akU10ybHGTD6IW51YDdieEMFZBWHLgh0WNXNCyEawuolqXlPKiISRSYCw
	 tIKunDq/m+idi6xvgPd3gM1/KiF2oOMXwdwpHyMPNz6LiomcgqhTraZHSbtMjZ3wZb
	 IoVsDI36WfhRVgHTEidmxMu2KiQZHs2TXgpGN7U3onWJ77zlqJWDNh/PHCzU9+xnz6
	 JPS4oSKunk1vihItQbf18owPTLVGyeyRv818f2sFhWze0lq2DYemPQyC9RxGM4E9nl
	 HG6wtL3YANpnQ==
Date: Tue, 19 May 2026 18:48:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, bhelgaas@google.com, joro@8bytes.org,
	praan@google.com, baolu.lu@linux.intel.com, kevin.tian@intel.com,
	miko.lenczewski@arm.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, dan.j.williams@intel.com,
	jonathan.cameron@huawei.com, vsethi@nvidia.com,
	linux-cxl@vger.kernel.org, nirmoyd@nvidia.com
Subject: Re: [PATCH v4 1/3] PCI: Allow ATS to be always on for CXL.cache
 capable devices
Message-ID: <20260519234801.GA21369@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519222335.GK3602937@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_164804_099253_75643ED4 
X-CRM114-Status: GOOD (  20.62  )
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

On Tue, May 19, 2026 at 07:23:35PM -0300, Jason Gunthorpe wrote:
> On Tue, May 19, 2026 at 02:36:49PM -0500, Bjorn Helgaas wrote:
> > One motivation for putting this in the PCI core was to use the quirk
> > infrastructure, but this series doesn't use any of that.  It doesn't
> > declare any fixups, e.g., DECLARE_PCI_FIXUP_FINAL, and it doesn't
> > update any state cached by the PCI core.
> 
> It works like the acs quirks that are in the quirks file, which are
> also arguably only used by iommu too :)

True, although ACS has a lot more PCI-specific grunge in it, including
all the "pci=config_acs" and "pci=disable_acs_redir" stuff.

> I'm not keen on spreading lists of device ids for PCI quirks to iommu
> files, but it would be OK to move pci_ats_always_on() to
> iommu_ats_always_on() that calls the PCI quirk function.

Yeah, I guess it's fair to collect the device IDs in PCI since this is
about characteristics of the device.

If we leave stuff in drivers/pci/, I would prefer that part of it be
named to be purely informational, i.e., "CXL.cache_enabled" or
something similar that would also cover the NVIDIA devices.

"pci_ats_always_on()" doesn't sound right quite to me because it
presupposes the policy choice that IOMMU is going to make; that PCI
function doesn't actually turn ATS on, and it looks like the question
of enabling ATS depends on how the device is actually *used*.  E.g.,
if Cache_Enable is not set, is ATS required?

That raises the question of whether this is the right test:

  +   if (pci_read_config_word(pdev, offset + PCI_DVSEC_CXL_CAP, &cap))
  +           return false;
  +
  +   return cap & PCI_DVSEC_CXL_CACHE_CAPABLE;

That just says the device is *capable* of CXL.cache; should it check
whether CXL.cache is *enabled* instead?

Bjorn

