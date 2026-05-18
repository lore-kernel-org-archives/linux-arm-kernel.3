Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FB4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 05:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phfgrGTmhjQjM3TY6ZoI4XSopq/ltnl5TBViggGEnP4=; b=07fZOg/UhMwunvU1w0coaNr19N
	mMq+LUqE/g5Gq1UdibFFIrf4znZD/cRMk8N+q80ni6YUhRUKtpL+sLS192ha9rWvCWAx63gIXb1Zd
	qSNdkDG1KlRaWC9mfnvaNPnnbH9YNyo597eMghWf3NSG7c0GpeATcEj9zSeUtaSpOfDwZdlzo1w9u
	esdZm6avZfa/605abeepa4OFbe4klkH3nPvP7W31TZx/8gykwiq7F94NWiz122Dh8d2m6Pv1f3SH1
	dHBQgjdZBkMFnADa4PODGvrGa2gtTJ/dfbM11/zkVixqPtd+Yvo0rBXuBgqhDRchjBd7rlQPoTAmm
	ejjK4nTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqOp-0000000EGoh-3osM;
	Mon, 18 May 2026 05:20:19 +0000
Received: from [2001:4bb8:2d1:6fdb:d67d:128c:34ba:85b8] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOqOn-0000000EGcX-1AkH;
	Mon, 18 May 2026 05:20:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>,
	Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 08/18] raid6: warn when using less than four devices
Date: Mon, 18 May 2026 07:17:51 +0200
Message-ID: <20260518051804.462141-9-hch@lst.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260518051804.462141-1-hch@lst.de>
References: <20260518051804.462141-1-hch@lst.de>
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

Quoting H. Peter Anvin who came up with the RAID6 P/Q algorithm, and
who wrote the initial implementation, then still part of the md driver:

  The RAID-6 code has *never* supported only 3 units, and if it ever
  worked for *any* of the implementations it was purely by accident.
  Speaking as the original author I should know; this was deliberate as
  in some cases the degenerate case (3) would have required extra trays
  in the code to no user benefit.

While md never allowed less than 4 devices, btrfs does.  This new
warning will trigger for such file systems, but given how it already
causes havoc that is a good thing.  If btrfs wants to fix third, it
should switch to transparently use three-way mirroring underneath,
which will work as P and Q are copies of the single data device by
the definition of the Linux RAID 6 P/Q algorithm.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Ard Biesheuvel <ardb@kernel.org>
Tested-by: Ard Biesheuvel <ardb@kernel.org> # kunit only on arm64
---
 include/linux/raid/pq.h | 2 ++
 lib/raid/raid6/algos.c  | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/raid/pq.h b/include/linux/raid/pq.h
index 425a227591c0..87e3cb55bf07 100644
--- a/include/linux/raid/pq.h
+++ b/include/linux/raid/pq.h
@@ -11,6 +11,8 @@
 #include <linux/blkdev.h>
 #include <linux/mm.h>
 
+#define RAID6_MIN_DISKS		4
+
 void raid6_gen_syndrome(int disks, size_t bytes, void **ptrs);
 void raid6_xor_syndrome(int disks, int start, int stop, size_t bytes,
 		void **ptrs);
diff --git a/lib/raid/raid6/algos.c b/lib/raid/raid6/algos.c
index b0ba31f6d48e..63d1945ba63c 100644
--- a/lib/raid/raid6/algos.c
+++ b/lib/raid/raid6/algos.c
@@ -42,6 +42,7 @@ void raid6_gen_syndrome(int disks, size_t bytes, void **ptrs)
 {
 	WARN_ON_ONCE(!in_task() || irqs_disabled() || softirq_count());
 	WARN_ON_ONCE(bytes & 511);
+	WARN_ON_ONCE(disks < RAID6_MIN_DISKS);
 
 	raid6_call.gen_syndrome(disks, bytes, ptrs);
 }
@@ -77,6 +78,7 @@ void raid6_xor_syndrome(int disks, int start, int stop, size_t bytes,
 {
 	WARN_ON_ONCE(!in_task() || irqs_disabled() || softirq_count());
 	WARN_ON_ONCE(bytes & 511);
+	WARN_ON_ONCE(disks < RAID6_MIN_DISKS);
 	WARN_ON_ONCE(stop < start);
 
 	raid6_call.xor_syndrome(disks, start, stop, bytes, ptrs);
-- 
2.53.0


