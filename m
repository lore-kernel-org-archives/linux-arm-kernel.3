Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4406D6D231
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 19:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pY6ILiPE0dwoxikE0hJkVX+g5MNF+4AMEDyOLlBpJE0=; b=bfhd/ovX3QYviPPT9KmeI8U2Ks
	VdCeP21EFR+PFGhvBAI+zqjWiz+GgLtLC++cKCJDFFEcnwASjmwfH9pANPzBNyDO+s35FaLISi3na
	Y992+YBDSZ2J8vIOVFTbHC5GY9XNw8BWQO3FZyr8RlPt3a/ZTwxKD9CG5ZUxm2yWRTVY3dquX9ptY
	rM0T+rDM3EidfvwAdgNOGZ3EUxrSmB4j0Sx9Zaia6KyeIJTd5WT/l/r2pW7K6Tyv3hkwwQDAqeHWI
	bva8kcCKaHA+kY6GK0CqplidCJrc10ypkE9k982rlM5qmfcgnPGRhpHcYVTYG/Wo23IE/2LmBiDPj
	wkdWvL7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNks-0000000DwVn-0555;
	Wed, 27 Nov 2024 19:31:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGNjt-0000000DwNt-026a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 19:30:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1AB55C4B35;
	Wed, 27 Nov 2024 19:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1012C4CECC;
	Wed, 27 Nov 2024 19:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732735815;
	bh=Q93fhdsgg0GiaU68+V3FzwR+KBc2+Wcx9p9sfWcABMg=;
	h=From:To:Cc:Subject:Date:From;
	b=d5pon74Jylztp5VkG+voF54PL+5omHF9r+rBOgjyN3yu3BiuZvTIc7qIrQ2URDr5m
	 cBqnyPwmr8biiVB33DLT0R+epsH4nxGaH696880KjlGaCAQ+jMJ76Wzi0VPnbevKP/
	 JBjvxtzoU8TYfoWXykun7L3TMrhTNiczveUPxPdcOk0A/hpqvWyto/XWIZZZrzl0u8
	 5pVCri8ZLCrB6YWQHV2dg6LrLdPlqLURm54gXjTpnwSmF5j3k0B1dEZGHUX7rh9jP1
	 zh41dEKco0LNz11cK97gETakxQK17V1dyupoBhO9SUtKtIJZA6XCURGJv6lIuxZnZ/
	 gDZOgspFr9BFw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tGNjp-00GLq1-Jq;
	Wed, 27 Nov 2024 19:30:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Mike Rapoport <rppt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	stable@vger.kernel.org
Subject: [PATCH] arch_numa: Restore nid checks before registering a memblock with a node
Date: Wed, 27 Nov 2024 19:30:00 +0000
Message-Id: <20241127193000.3702637-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rppt@kernel.org, catalin.marinas@arm.com, will@kernel.org, ziy@nvidia.com, dan.j.williams@intel.com, david@redhat.com, akpm@linux-foundation.org, stable@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_113017_131249_7034471C 
X-CRM114-Status: GOOD (  19.17  )
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

Commit 767507654c22 ("arch_numa: switch over to numa_memblks")
significantly cleaned up the NUMA registration code, but also
dropped a significant check that was refusing to accept to
configure a memblock with an invalid nid.

On "quality hardware" such as my ThunderX machine, this results
in a kernel that dies immediately:

[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x431f0a10]
[    0.000000] Linux version 6.12.0-00013-g8920d74cf8db (maz@valley-girl) (gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40) #3872 SMP PREEMPT Wed Nov 27 15:25:49 GMT 2024
[    0.000000] KASLR disabled due to lack of seed
[    0.000000] Machine model: Cavium ThunderX CN88XX board
[    0.000000] efi: EFI v2.4 by American Megatrends
[    0.000000] efi: ESRT=0xffce0ff18 SMBIOS 3.0=0xfffb0000 ACPI 2.0=0xffec60000 MEMRESERVE=0xffc905d98
[    0.000000] esrt: Reserving ESRT space from 0x0000000ffce0ff18 to 0x0000000ffce0ff50.
[    0.000000] earlycon: pl11 at MMIO 0x000087e024000000 (options '115200n8')
[    0.000000] printk: legacy bootconsole [pl11] enabled
[    0.000000] NODE_DATA(0) allocated [mem 0xff6754580-0xff67566bf]
[    0.000000] Unable to handle kernel paging request at virtual address 0000000000001d40
[    0.000000] Mem abort info:
[    0.000000]   ESR = 0x0000000096000004
[    0.000000]   EC = 0x25: DABT (current EL), IL = 32 bits
[    0.000000]   SET = 0, FnV = 0
[    0.000000]   EA = 0, S1PTW = 0
[    0.000000]   FSC = 0x04: level 0 translation fault
[    0.000000] Data abort info:
[    0.000000]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    0.000000]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    0.000000]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
[    0.000000] [0000000000001d40] user address but active_mm is swapper
[    0.000000] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 UID: 0 PID: 0 Comm: swapper Not tainted 6.12.0-00013-g8920d74cf8db #3872
[    0.000000] Hardware name: Cavium ThunderX CN88XX board (DT)
[    0.000000] pstate: a00000c5 (NzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    0.000000] pc : sparse_init_nid+0x54/0x428
[    0.000000] lr : sparse_init+0x118/0x240
[    0.000000] sp : ffff800081da3cb0
[    0.000000] x29: ffff800081da3cb0 x28: 0000000fedbab10c x27: 0000000000000001
[    0.000000] x26: 0000000ffee250f8 x25: 0000000000000001 x24: ffff800082102cd0
[    0.000000] x23: 0000000000000001 x22: 0000000000000000 x21: 00000000001fffff
[    0.000000] x20: 0000000000000001 x19: 0000000000000000 x18: ffffffffffffffff
[    0.000000] x17: 0000000001b00000 x16: 0000000ffd130000 x15: 0000000000000000
[    0.000000] x14: 00000000003e0000 x13: 00000000000001c8 x12: 0000000000000014
[    0.000000] x11: ffff800081e82860 x10: ffff8000820fb2c8 x9 : ffff8000820fb490
[    0.000000] x8 : 0000000000ffed20 x7 : 0000000000000014 x6 : 00000000001fffff
[    0.000000] x5 : 00000000ffffffff x4 : 0000000000000000 x3 : 0000000000000000
[    0.000000] x2 : 0000000000000000 x1 : 0000000000000040 x0 : 0000000000000007
[    0.000000] Call trace:
[    0.000000]  sparse_init_nid+0x54/0x428
[    0.000000]  sparse_init+0x118/0x240
[    0.000000]  bootmem_init+0x70/0x1c8
[    0.000000]  setup_arch+0x184/0x270
[    0.000000]  start_kernel+0x74/0x670
[    0.000000]  __primary_switched+0x80/0x90
[    0.000000] Code: f865d804 d37df060 cb030000 d2800003 (b95d4084)
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

while previous kernel versions were able to recognise how brain-damaged
the machine is, and only build a fake node.

Restoring the check brings back some sanity and a "working" system.

Fixes: 767507654c22 ("arch_numa: switch over to numa_memblks")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: stable@vger.kernel.org
---
 drivers/base/arch_numa.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
index e187016764265..5457248eb0811 100644
--- a/drivers/base/arch_numa.c
+++ b/drivers/base/arch_numa.c
@@ -207,7 +207,21 @@ static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
 static int __init numa_register_nodes(void)
 {
 	int nid;
-
+	struct memblock_region *mblk;
+
+	/* Check that valid nid is set to memblks */
+	for_each_mem_region(mblk) {
+		int mblk_nid = memblock_get_region_node(mblk);
+		phys_addr_t start = mblk->base;
+		phys_addr_t end = mblk->base + mblk->size - 1;
+
+		if (mblk_nid == NUMA_NO_NODE || mblk_nid >= MAX_NUMNODES) {
+			pr_warn("Warning: invalid memblk node %d [mem %pap-%pap]\n",
+				mblk_nid, &start, &end);
+			return -EINVAL;
+		}
+	}
+ 
 	/* Finally register nodes. */
 	for_each_node_mask(nid, numa_nodes_parsed) {
 		unsigned long start_pfn, end_pfn;
-- 
2.39.2


