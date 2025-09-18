Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A636CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 14:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ILmjNxTIbvXBq6RdMryGh6o+wyr898K3QpyDh9bzxx0=; b=sarlmAT1Xb2ncLzvLtzui8qhRg
	pReTkMAUwmJiCynDjds0232R63ruGLeCW0hlekHQCEXM86wZHLe9VIIfoBQ73e825LQRIqiV6++hQ
	HGM+xxEzYhNu/V+jEoog3t//OdNdpQojwosrAIvNq2N4DQVHzke2EoT48G4C8AA82qtJ4GW0VEwDE
	KTnykrWnrT/VMLL4GTXUgSQeVgqoEn2NLWHoKW282Tt7wE/5wGk+7dJG7ckVd+H+DP4oUHKQ63Scn
	bvI8PJ9ZiWjpab3CMWsHOXbE5GNvNJQpiyd1A5qxdAF+DCn6ONltjn54MdvTriPMQT59yDU2cy0xv
	xEvyl1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFKl-000000003N4-0Otu;
	Thu, 18 Sep 2025 14:10:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzFKj-000000003MK-0veX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 14:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67FB560052;
	Thu, 18 Sep 2025 14:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE6CC4CEE7;
	Thu, 18 Sep 2025 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758204600;
	bh=Pi5T819TFc2iqtg/dEe1hcW6EHD16i+UrHXuy/WzDOY=;
	h=From:To:Cc:Subject:Date:From;
	b=N6hq4IZioMzxZVLrqPxIN1sDeyN1/MixcEr36decDtSa4WNTO48EIzoRtCfHURiTP
	 XMufzHtXGUQWyG32ltphrXys4JlT2/nPQzRJUepSs7aIKZ4Dt/Ss1EyEAK8QkC8zc3
	 vIl5lD0WF4qeZn8Z3KGVbFo72DRy50Klk5ZEVPZ2yeHGy8hIMfUDG6YgqbV6WFZxca
	 4kV/RF3TSWU8WIaiPtXWJzI2gXYl0Crd2VqYcMMNL6jc66qQmehT4vZSRFKtxGw7Jr
	 cRVkT6eGVn1SU0m0y41HUKDXp21LxO+guGGu3EyXnpZKW4XO6cr0Q6FOwPLQ0JkSJE
	 62ET1qQlR3oRw==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
	iommu@lists.linux.dev,
	Juergen Gross <jgross@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/6] Preparation to .map_page and .unmap_page removal
Date: Thu, 18 Sep 2025 17:09:23 +0300
Message-ID: <cover.1758203802.git.leon@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changelog:
v4:
 * Added Jason's ROB tags
 * Added "xen: swiotlb ..." patch to the list of patches which had .map_resource
 * Added extra patch "ARM: dma-mapping: Reduce ..." to remove struct
   page as much as possible.
 * Added call to .map_phys/.unmap_phys to dma_common_*_pages() functions.
v3: https://lore.kernel.org/all/cover.1758006942.git.leon@kernel.org
 * Rewrote the series to allow combination of .map_resource and
 * .map_page
   to one flow.
 * Added two new patches to convert and remove .map_resource.
v2: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org/
 * Added default "else" section without map_phys and map_page
   callbacks (impossible).
v1: https://lore.kernel.org/all/cover.1753003879.git.leon@kernel.org
 * Changed "else if" instead of "if".
v0: https://lore.kernel.org/all/cover.1752734252.git.leon@kernel.org
---------------------------------------------------------------------

This is followup to "dma-mapping: migrate to physical address-based API" series
https://lore.kernel.org/all/cover.1757423202.git.leonro@nvidia.com

Thanks

Leon Romanovsky (6):
  dma-mapping: prepare dma_map_ops to conversion to physical address
  dma-mapping: convert dummy ops to physical address mapping
  ARM: dma-mapping: Reduce struct page exposure in arch_sync_dma*()
  ARM: dma-mapping: Switch to physical address mapping callbacks
  xen: swiotlb: Switch to physical address mapping callbacks
  dma-mapping: remove unused mapping resource callbacks

 arch/arm/mm/dma-mapping.c   | 180 +++++++++++-------------------------
 drivers/xen/swiotlb-xen.c   |  63 ++++++-------
 include/linux/dma-map-ops.h |  13 +--
 kernel/dma/dummy.c          |  13 ++-
 kernel/dma/mapping.c        |  20 ++--
 kernel/dma/ops_helpers.c    |  12 ++-
 6 files changed, 113 insertions(+), 188 deletions(-)

-- 
2.51.0


