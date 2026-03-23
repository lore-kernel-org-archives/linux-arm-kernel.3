Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20FAEC01A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 07:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IytCGZb8QoqUKOg+ctT1e1Ezzg+jN0P1FskdLA5DESs=; b=STN3u4UsQUr2K9gbA6oMuAHLvu
	NYpp1SXW2SSQ51mQry8gJ84u8xaWXgaDVQq/e+9LUKefsNn65IrQuh2RD77D6QxDZhk/24zFyRa1X
	9VAR/uh1cxQhggnWco151WYhVikTQjUK9KKX7fJ3fs+sWLhMF4pvIb70y2aYH1XHhu0GWJzTbGD7V
	g2BFGUQ+wDLdqqwRZ18QWzWzDbUV9Ti+EYMInbWtDY2lOatcGIhVqh01pQAhbpb80iflq8nlNxQrz
	wdY+79NVhdAxQZudmvJdBykcQOTGYbi21Nz322e+qxjex5jeElQJNaz4zI4l+x++jQOeLaUCV8wY5
	lzw+BZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a1s-0000000GDi8-2mRn;
	Mon, 23 Mar 2026 07:48:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4a1r-0000000GDi1-2vsK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 07:48:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B58BB600C4;
	Mon, 23 Mar 2026 07:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC71BC4CEF7;
	Mon, 23 Mar 2026 07:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774252130;
	bh=pCbilTTHI/VwIdYALA976lc/t17gtYFZ5ukjoWq9Zt0=;
	h=From:To:Cc:Subject:Date:From;
	b=Rlv1S8+0zQURdG9YTxr4y3pNRy8/ylu6kZZ6eCiQf+sFd02KfS8+YNnbcyhsi4jov
	 S5w11oK7YTX3gkuWTcyu3hCCiTiR3veT8ei69ieEMGgMa2ZYMUeINhQjyhnr9FSaE8
	 Uj98YvIFa19EU/fOo55YccuDjUkb9MArMrSqYZ/sLc3WXjjEkYT/en9m3MbKASypiu
	 mxy2taD/9hMXzY7nvOCde6k5j3T9Mi98SQf3en8jrYNH2nRMr3fIiwj2mujYUhGjba
	 bnwQO6qLYjo9aQPPjQMfazIbKXhjL7hgiC8xGbSCEvOmYFBujPtB+XyBem0ZCuxVV4
	 bFbyai2HlbXwg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Potapenko <glider@google.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Andreas Larsson <andreas@gaisler.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <jackmanb@google.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Rob Herring <robh@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/9] memblock: improve late freeing of reserved memory
Date: Mon, 23 Mar 2026 09:48:27 +0200
Message-ID: <20260323074836.3653702-1-rppt@kernel.org>
X-Mailer: git-send-email 2.53.0
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

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Following a recent discussion about leaks in x86 EFI [1], I audited usage of
memblock_free_late() and free_reserved_area() and made some imporovements how
we handle late freeing of the memory allocated with memblock.

[1] https://lore.kernel.org/all/ec2aaef14783869b3be6e3c253b2dcbf67dbc12a.camel@kernel.crashing.org/

v2 changes:
* fix UAF issue in memblock_discard() reported by 0day and sashiko
* address relevant sashiko comments
* squash memblock test stubs changes into the commit with core updates

v1: https://lore.kernel.org/all/20260318105827.1358927-1-rppt@kernel.org

Mike Rapoport (Microsoft) (9):
  memblock: reserve_mem: fix end caclulation in reserve_mem_release_by_name()
  powerpc: fadump: pair alloc_pages_exact() with free_pages_exact()
  powerpc: opal-core: pair alloc_pages_exact() with free_pages_exact()
  mm: move free_reserved_area() to mm/memblock.c
  memblock: make free_reserved_area() more robust
  memblock: extract page freeing from free_reserved_area() into a helper
  memblock: make free_reserved_area() update memblock if ARCH_KEEP_MEMBLOCK=y
  memblock, treewide: make memblock_free() handle late freeing
  memblock: warn when freeing reserved memory before memory map is initialized

 arch/arm64/mm/init.c                       |   3 -
 arch/powerpc/kernel/fadump.c               |  16 +--
 arch/powerpc/platforms/powernv/opal-core.c |  11 +-
 arch/sparc/kernel/mdesc.c                  |   4 +-
 arch/x86/kernel/setup.c                    |   2 +-
 arch/x86/platform/efi/memmap.c             |   5 +-
 arch/x86/platform/efi/quirks.c             |   2 +-
 drivers/firmware/efi/apple-properties.c    |   2 +-
 drivers/of/kexec.c                         |   2 +-
 include/linux/memblock.h                   |   2 -
 init/initramfs.c                           |   7 --
 kernel/dma/swiotlb.c                       |   6 +-
 lib/bootconfig.c                           |   2 +-
 mm/internal.h                              |  10 ++
 mm/kfence/core.c                           |   4 +-
 mm/memblock.c                              | 124 +++++++++++++++------
 mm/page_alloc.c                            |  46 --------
 tools/include/linux/mm.h                   |   1 +
 tools/testing/memblock/internal.h          |  34 +++++-
 19 files changed, 144 insertions(+), 139 deletions(-)


base-commit: 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
-- 
2.53.0


