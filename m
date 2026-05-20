Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B579FCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=; b=QZFDmM/gQsRcdqDxKjlyz4fu5p
	LE/L/RmD5U7DBTUUMSCjY5G1jfxNfBRmgmHeBwIZVNQUFud+tGdFgLgCjlAtIFFZDcSASqGAO0wJg
	v0R78jtOVwhXdlZBYcGAtZyLEgDcjSBXqsHGhsSaXaaPLf1xN6hzCRqqRUIFn0Mz2VojBf0yhZwA2
	t1ZC5RiZgBaHTQWt/YFqAu5vLiiubfVs83bjyWyg9mqvJBEtyJx7qCi3B5hwNFXJ/0uMV84BtigaO
	ugJ2RVz6JUCiRfVHrQh58iUyMGY+q6bMx/40EDLDMt+pzLCG8UVea5KBmjJx5XuEoczTFUjthESje
	XmC34zLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6U-000000047cE-0c6v;
	Wed, 20 May 2026 09:20:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6K-000000047N3-3I5E
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=; b=g7Onznvcs0XhzERHUBYQ5fneOI
	Kci/WuD4GoqOEDksbr6f9weov2DXXKGpp7pfJCpqzuXddRJ2ReK0n501uPiXDcY8QMfNfz73sHmr4
	XGdMBMY72xbK1Bku5RLInnB0Fv5W9UrjxNNJtweTNM1fllz3f5zxf/WbstH94DrwJV70EesJgXGCx
	CA0ORTLikzX5zJWdLk6uTN9YdSUi4keiS6koGPcqhvuIvc2vZMCnFzEAB5bqowTc7tHnSlz2Ng7//
	1yH9fwOCZ7JrveVPPgyccxaoieUwaT6ZWU4CefWx7+cAwTvZJcrVwR1DHcs8jRgPckxlObUu6WqZu
	ml8JpfKw==;
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6H-00000006xPc-3l9w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:27 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c80167f56cdso2051724a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 02:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268823; x=1779873623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=aatzxvewVTZFD6z/0FjgUJlHl0hc782ArKybEwJhH75negObd/2TaWh+JUvNhNX/cv
         4Jv0JbE2bbrs73srqlxtZgud9lSSyVuiksd7MTpafngRc05UR4hzQCutjU++nP8zKJrP
         sD7aOZTzqpilHsAKY2NNvrRhgd3PXTdeJvmc6HpnXSrci+z1Vdphhuw9ufrSXkaqd0UL
         sQp0LBdkrNwcEfvvl/WNHIo7mz/qw+T1NCrC+kH7yU9sSctRFIpiV+uM7gtdeAN0GCRM
         gFRfZG6uxuEAsSCvdxHCiIL8qmaP41feDK0y8ur2S1YMYVzDRuTN6PGuEVrmViqeMtr1
         4eig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268823; x=1779873623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yF4iEePz0efKjWWczqPvkzIUeB6xqHtDsvairyfmeUg=;
        b=Fp3L4p+qnq9N12/rN00erXKfiblh9e0s+aXXibwVEESeY6aOPd+LxUUjbK0dcx/8yP
         aFUBhjL7tYA2IazKRLswgzU7C5ACFL+bXe1la3pV5UHmrxQv2BND8TKnPxS/GQ7sEB+W
         XSzwFrWPVmbHgA0vxDvNx4YhAMtWnqQsS+PXXsjvtXG9fYUeJWz4eXdeM9e09t1cHx8w
         twmWqYA6gQecw7mOfphY1MB6LAlXoSd97V9fZKgsTaXkVgyR6v6/5m8HDHKLWScuxBwq
         FcBhSoP0By/dgvjuz/vZrh+Tl0hStB/D4xVa5ZD7F5XUD0AZ5QpOd5O5ZBLfgwloxuPn
         2doQ==
X-Gm-Message-State: AOJu0YyO+4oAvbBW3i7DPpiEZ1y2w+NElr6Y2AbUsCxlaLOXpggaeUAZ
	wtnZVCB7KN0wHQekvV0dy8tgBNjc+brc6QAoQR/cGgErARej1XlovI5K1iffG0OrSHYp+Ixh
X-Gm-Gg: Acq92OHQ8/nlQJd5ioiBhrpj7aqhjHSlurXcqmKJaQulabYjn/WTdj1fPLOg066wBjK
	1a5DEMOEolu6MWGnnxWJequwd7YBa++ElEfEG9ZXc/UVFx44yKE6zRYxQms2mrQVyYeDbDJbHid
	vKm837i8y+xFPY4LdDrluwvSSDFrwpqzQYYxyGTIusVC/a4bh1YpElArP/iaVt5casFGN2AfOjY
	EgV7uXa6JtDM1e8vB4BXTBY9G2OUQv5mKSd/5GB8aK2urmRM5Rb245J1kDvzjzYFmZHYizRoh61
	KEdGqIpgYyW5voS5uNSIO2+Y0R5FcteBUkxS9X6xuUysLMt2JkFJz7M6UAdkVFPSOZwL1vfmKhc
	pPrmxD5ANNunE903rAG2MbqA7xt6FygzU2Sfg2l21lXV8L+WzFYVpdxm7ZMrfYruxZ1Ux4wd2O9
	eaDizFqieIVtKK0n1f6xM//kLQiBSyt1nDrGiaXg==
X-Received: by 2002:a05:6a00:2e9f:b0:82f:6e7:152d with SMTP id d2e1a72fcca58-83f33c391cfmr24600140b3a.21.1779268822961;
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f63bb986dsm10208967b3a.48.2026.05.20.02.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:20:22 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
X-Google-Original-From: Wandun Chen <chenwandun@lixiang.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	leitao@debian.org,
	kees@kernel.org,
	coxu@redhat.com,
	tangyouling@kylinos.cn,
	songshuaishuai@tinylab.org
Subject: [PATCH v2 8/8] loongarch: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 20 May 2026 17:18:44 +0800
Message-ID: <20260520091844.592753-9-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520091844.592753-1-chenwandun@lixiang.com>
References: <20260520091844.592753-1-chenwandun@lixiang.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102026_095516_550A39AE 
X-CRM114-Status: GOOD (  11.50  )
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

From: Wandun Chen <chenwandun1@gmail.com>

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to LoongArch
kdump as was done for arm64. Use of_reserved_mem_kdump_exclude() to
drop flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/loongarch/kernel/machine_kexec_file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index 5584b798ba46..c5cead362d2d 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -14,6 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/kexec.h>
 #include <linux/memblock.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/types.h>
@@ -67,6 +68,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -91,6 +93,10 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 			goto out;
 	}
 
+	ret = of_reserved_mem_kdump_exclude(cmem);
+	if (ret < 0)
+		goto out;
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 out:
-- 
2.43.0


