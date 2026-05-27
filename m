Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCCECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=; b=rq0iHGvwWhoNOST9J1S7jCl1mR
	svzQaFi2HNK0jIJPSAWKmFj7EqSZqj6POJAD1XlWZ6ITwyN1t2wJOKSMFxKX0lR5+2kwV7kPPjwuG
	JNE0kYb1FdN5zK+3UgIQdktZPm2p4+9sXB343Jc5ZzJZ4Kh3bc5EOml+0mavgF/QHo8LAKrVBI01S
	fPs4GZXxT4GdEs/CA+0j/c01JXNHbwdYJHR7PGzJuW/dw288W+hTKjD8oLcAcEYSybElCgMghtiq8
	M0CpOKOvQl5orkvR4O0idJyFl1f9BLdFLy29TRbS7i1twBRK3KVVYX71bzi5p9Ira5xY+1v0YJ70m
	hMqjjkMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zW-00000003G3s-1Vmj;
	Wed, 27 May 2026 03:31:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zU-00000003G1s-3eCK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:31:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=; b=BXs0LtiU87Jjh6tyA4Ium25Jhq
	p2kuJ1EpSvgzH+/PC3Yj3nayIVOGnuA+4DStXIvxz9YPuRBEFxSZl7xWyXiSGNw4dklgoosGlAQad
	ds2tDYyWExoAdhS1l2whBmq0iltVQQe0/puh7N/MBzF9hfUq5NI+vI/v6SsrICZV70nw0xtKDfoKe
	VeoUnGrih9sYxWVuxnpi5P1wkZ9mTiw4Pt+dwPRMiWxYwmIBiIwpKJSLAWRQsompVUNrO54UwXjlz
	vhMMtZHJ7nmomj2Stpc5941+8i3G6gEo2piLBN8OukZ9uTRbBzdwhrMZPL9SxD7QEFu0v7sNrkUXD
	T2KYJHoA==;
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4zO-0000000Cquj-3hda
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:31:31 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so4988281b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852686; x=1780457486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=Qr2Akwyj5/mzYejjhagI1EE7oCqZAFvI8LGHuWvWWSSCo0VD98TjxbexOeG7rBdcmo
         5303X7YQ+YWbIawu344EyulZU4vrpbIS5r+xwAFcneiIE/KEgreqkiU2Af/ORxnxejq8
         /y3WVj3HlRi0kCbMiCkH4gRb0v7QfGyF9lFSwW3Besznva01hEb6A3ChrGW+LbmMfxae
         wyMgRF/CAZHE+j3HTg+1mTYjOvnD1XpDijG55c2nr35hcrcHgC5+mr646HGSV7SCX581
         oMJJ2/IAKNRyvIqhUuu2uZVLZY/FIRSUYB8xW8DmEClu6rgMMPRYj1aMbC887m2VGz7X
         iV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852686; x=1780457486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k8s9mNy4kJhUtRbiL4bvIShEI3qrMLQ/X11k1pNjAUs=;
        b=H5yhXQGQUcx8Px1tkc9TYhosnacYqj9/8Zhk9lxVmxRQ3jeYfipQSU451MTZjz5qVg
         I9MmUUadRg1SnUdEua5wqwL0jOsXqJpAvqo6AAhHpItzM66o0NktpADqbLdNiC8omO6Z
         JZrz+nYousHPAZgjYldwxmD0T+T+X+3cOdwK7jwJEiqaBJX8wiNNN/U3p7DERYYlJWni
         W2s7BruvOjz8o19HbAkJeV+NKDHdFB0sgX5gHpYChO2BvmHIaACpSAM7hUSUN/3zngHL
         lmiJnz7R70D10m/jVrA5MQTpDwjqQgaVfnw4ylEiW940z+3Wq6PILi4lmFsUb2KeWGfa
         mPJA==
X-Gm-Message-State: AOJu0Yy9z845e/hvPmsL3YLt321n5jBkBbj/xkY8XWjU1uChVMcuKr3N
	5s2vcpWX74GKg5u9Nqf1Zzhz00KneYyjeLbH8pnkXFYQrc6ajY7qODnnFgkdt+tWKIUN4w==
X-Gm-Gg: Acq92OGtmYtb/XdMl3JO4ev+xfS/VqsiOMq7/8RmtaLYALjBvai44OOd8/JK1o1/9Wo
	51aN4UO+hOQAdtVwN8wkTRGUOKgJfV4NmnP/uuvtUbENNRq3uR1JCFF/9neBFawoC6MD3LWwWOk
	yDT5ohjtg5xXn/yamL5RtvkfciXCXKHeUlvyfWjD7F5XQr0rgP7ODevBcQMTqBSFLyjSnOU5fau
	s41BUNgrTR3WvWfgaiasWgerHY+QnOYXyFCIuSLwKSMHU9VInLkp2YNKbVEGVJzzARSfG5JGiVn
	t9vakdWlgu58+hBurMzOdjbqTjGx7tDq4knET50jgjfOT1JFBpH3R+RxvnfUcQBKqdVROmPXGt9
	VT/p5Syk0MP3NSNwKvQoRGfDsvDroHJJhplQozI/k/73KM9NQkPrynSbEU9iy6ZrPmqNaHRoSs2
	+H66K82kFs2ZP2HgG9/7YRrSHEFGUcDsOl/hZv
X-Received: by 2002:a05:6a00:8c6:b0:83e:d957:e5b6 with SMTP id d2e1a72fcca58-8415f544641mr20524215b3a.36.1779852685640;
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:31:25 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
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
	quic_obabatun@quicinc.com
Subject: [PATCH v3 10/11] riscv: kdump: exclude non-dumpable reserved memory regions from vmcore
Date: Wed, 27 May 2026 11:29:16 +0800
Message-ID: <20260527032917.3385849-11-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_043128_516486_A9728EF4 
X-CRM114-Status: GOOD (  12.15  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Apply the same non-dumpable reserved memory filtering to RISC-V kdump
as was done for arm64. Use of_reserved_mem_kdump_exclude() to drop
flagged regions from the elfcorehdr PT_LOAD segments, and
of_reserved_mem_kdump_nr_ranges() to pre-size the crash_mem array.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 arch/riscv/kernel/machine_kexec_file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index 54e2d9552e93..c359cf714c79 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -10,6 +10,7 @@
 #include <linux/elf.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/types.h>
 #include <linux/memblock.h>
@@ -63,6 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	nr_ranges = 1; /* For exclusion of crashkernel region */
 	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	nr_ranges += of_reserved_mem_kdump_nr_ranges();
 
 	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
 	if (!cmem)
@@ -76,6 +78,8 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 
 	/* Exclude crashkernel region */
 	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	if (!ret)
+		ret = of_reserved_mem_kdump_exclude(cmem);
 	if (!ret)
 		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
-- 
2.43.0


