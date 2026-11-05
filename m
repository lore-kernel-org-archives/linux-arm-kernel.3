Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC91606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PCjF3LE8;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=AXmhRlh4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=W9x3jjuMW0enhWTlyFdgZKVCgl/js8bTZrtROBm22NA=; b=PCjF3LE8UDjDRog5bMyYuvsj+E
	srrILQzP9AFdwcRFKjyI2vewE4L2bwPhXOJ3SpWmtrU7552lTqLrsKtnUUC5Dxx1MK7hLYWORByNt
	Yz1BPnJXqjMohH+EBHmZsNlqzjuHKzXe8mms5/tYuykYEtsg3WXInb89OIme70WvZeMy3kwt6Zrn9
	S3qNOMkbGiX3qsOzY9FxTTyt6khLPi3vYcuYBtx03BaEBhfsooftICqTCerMB9g7jhg/N3Cic2pZ3
	9Hqn8gA80BETTaKKu+7xGjSI2Z0cFDEbQQqy/JHhLMvNvuQmOFzXHbsB4I7N9Iki0A4QQOBi/+ebf
	LgCFCsPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwzn-000000091XL-1HlF;
	Thu, 05 Nov 2026 12:55:11 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwzj-000000091VC-1Kc4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:55:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=W9x3jjuMW0enhWTlyFdgZKVCgl/js8bTZrtROBm22NA=;
	b=AXmhRlh4UfxROFuRVsIID2iazoIEl1RdMyRlDEEubF0QmuEwp1YLR95WsZOkHeNt8ipkI1OTu
	gnFcBoh4grsEIsWX915VNIflUhYlbGQwmPV/2tgdstSGutpdwqJTpvYq1dDksuNUI0SVIWM0NC7
	6+Rg3dMuXE5dCP/ev3OTGYs=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4jL2Mg4VfNzRhRx;
	Thu,  5 Nov 2026 20:54:55 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8844E4056D;
	Thu,  5 Nov 2026 20:55:02 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 20:55:01 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<pratyush@kernel.org>, <leitao@debian.org>, <mpilaniy@redhat.com>,
	<yeoreum.yun@arm.com>, <graf@amazon.com>, <pasha.tatashin@soleen.com>,
	<akpm@linux-foundation.org>, <baoquan.he@linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8] arm64: kexec_file: Stop using the Image text_offset
Date: Thu, 5 Nov 2026 20:54:42 +0800
Message-ID: <20261105125442.2282987-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_045508_044893_2A6E2A6B 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

image_load() adds text_offset to kernel_segment->mem and subtracts it
from kernel_segment->memsz.  For CMA backed segments this breaks the
load path: the payload is copied to page_address(cma), which is the CMA
base, while image->start is set to the adjusted address, so kexec jumps
into the middle of the kernel.  kimage_map_segment() has the same
mismatch when a segment has been moved.

The adjusted memsz also breaks the release path: the CMA pages are
freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
allocated, leaking the tail of the allocation.

Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")
TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
LTS kernel carries a non-zero text_offset.  Drop the adjustment and
reject images with a non-zero value instead of booting them from a
wrong address.  With the adjustment gone, segments stay at their CMA
base and the release size matches the allocation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Split out from the patch set.
- Link to v7: https://lore.kernel.org/all/20261026075201.699550-1-ruanjinjie@huawei.com/
---
 arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 78b1f956d8d7..7d6baea3d28f 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
 	kbuf.bufsz = kernel_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = le64_to_cpu(h->image_size);
+	/*
+	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
+	 * honored; reject them instead of loading them at a wrong address.
+	 */
 	text_offset = le64_to_cpu(h->text_offset);
+	if (text_offset) {
+		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
+		return ERR_PTR(-ENOEXEC);
+	}
 	kbuf.buf_align = MIN_KIMG_ALIGN;
 
-	/* Adjust kernel segment with TEXT_OFFSET */
-	kbuf.memsz += text_offset;
-
 	kernel_segment_number = image->nr_segments;
 
 	/*
@@ -117,8 +122,6 @@ static void *image_load(struct kimage *image,
 	}
 
 	kernel_segment = &image->segment[kernel_segment_number];
-	kernel_segment->mem += text_offset;
-	kernel_segment->memsz -= text_offset;
 	image->start = kernel_segment->mem;
 
 	kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-- 
2.34.1


