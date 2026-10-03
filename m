Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4B4CA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 00:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htfKz68Uuz6N9IF9mggRs6yYLkAuL8ZW2J7LXlHwfEI=; b=32IM805b1smqeOjykW577r59k8
	LI5ee0BWoSxkV49DNUsE2Fppuluuf3aFPcQ+/105hEZUmC/FNDlRbjZAY25yY4TR4QA/N4SPRh42c
	v9hMsurh+E352Lp1R9BFaa0dLM5IDyOCnAa8ZI499L+eJI2MNrQL5HmOg+GazBOGfh+EnkhO0Oi6T
	rLhrd0N34NM/IQmVDvpMpoGuKy/EIBjNnk+Y1GIeUi33/1joLu8NRg2LhuZMR5XhbVC3doyIqPmXN
	mZkzzuAE3P17xvBhRQj/Aa93+cSj7TVsDmA9jwy54R8/oXlk10BpMxp3JLn01teO960rbykAHt8hB
	V8NwyPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVa-0000000CnAw-3CiG;
	Sat, 03 Oct 2026 00:21:46 +0000
Received: from mail-pg1-x548.google.com ([2607:f8b0:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCnVX-0000000Cn5x-2tBv
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 00:21:44 +0000
Received: by mail-pg1-x548.google.com with SMTP id 41be03b00d2f7-cc44d708055so171822a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 17:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790986903; x=1791591703; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=htfKz68Uuz6N9IF9mggRs6yYLkAuL8ZW2J7LXlHwfEI=;
        b=ev6Wim2Dbf7wvXcHlI3JvcosElc1/7WyU0MWFhr4VpxDsQvEXYJDJ7bb7Jx+QHVQyd
         Y7oBfWx5ZPuSxSyzei2a3RjTNe11dAK5ZgnxX3+ltfI+fjmTRk5eYM6Y8znluYUujnZZ
         8/ikO0cM0BGru4zcefdYQfwdFHiImug2e/2qyROcHXyDqq0pRUroe0xxn6Gf88H9TqsG
         BrEqkTLK7xWJ3QdqNU9t4MvZcuzZJN7JcYylW9j1x5/9B8AfWk7oO+na9pImJcFT01jd
         p/4Fz4r84vzbNNXPlZEGQWVXZGMini9/0MKiMZAVbfC/FuwgGdK8wiSCjC8VmECWvJPI
         fQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790986903; x=1791591703;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htfKz68Uuz6N9IF9mggRs6yYLkAuL8ZW2J7LXlHwfEI=;
        b=ANKBCf0y8o56mwPn++UkfZxYy0mwcu75M/NACLzpIxEj+euMKYyF9F9EEhMFV42+R9
         NfQEwiI06wEzwXT+/AWx1Vqc0mAhuyW8pjYPIHamVLDShmR5pM0LywLTc6ECDHefpaJo
         mQKvdP8ARaBmD8zT9ub7GZMi/0Cq9HcHUx/G5XjqaREFig8S8IirwXQ58Fkie728YgyY
         HijWaBfbEj1R6GNsyJCupSDL79bgje0DBuU6aTb2+ir/WxyjM1aQ41D8IZBesiWQRNoV
         FiL+iNrqFx507vexXxOia+j3flPMSe7Tbi2KLPxbDsN5rjT3s0iSUcPGWq+IC9mRnGDN
         Qm+A==
X-Forwarded-Encrypted: i=1; AKwUvBwZXT5Fwg5hEDYrsiv1gShovEZu2zdNqc40Q2LQBC+6dPVLqymiUx3SMkB9wPXQ2WdOeha6SkpRj9X/bzu9oTVb@lists.infradead.org
X-Gm-Message-State: AFuF++mjAeft5XtIw1b2dZpOCrCuQimuRQV4NfXedC6uSNAA7IrGoSJz
	zn2y2kusMRxXzzuzPu+uV+s9Qq6T4X21CTNwNIYeDT9l680YPoUSYeDf6knDZKSFxy5yuuXfX1A
	Q/4r/sjvygh7EcY68HJsHFw==
X-Received: from pgip23.prod.google.com ([2002:a63:c157:0:b0:cc7:6138:fe1b])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1bc6:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3e0d68c7030mr953918637.9.1790986902363;
 Fri, 02 Oct 2026 17:21:42 -0700 (PDT)
Date: Sat,  3 Oct 2026 00:21:12 +0000
In-Reply-To: <20261003002123.505555-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20261003002123.505555-1-jthoughton@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003002123.505555-10-jthoughton@google.com>
Subject: [PATCH v2 09/20] hugetlb_vmemmap: Allow architectures to make HVO
 enablement boot-time only
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Nanyong Sun <sunnanyong@huawei.com>, 
	Yu Zhao <yuzhao@google.com>, Frank van der Linden <fvdl@google.com>, 
	David Rientjes <rientjes@google.com>, James Houghton <jthoughton@google.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_172143_778763_B4AC06BA 
X-CRM114-Status: GOOD (  18.14  )
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

arm64 needs all CPUs to support hardware updates of the access flag to
safely update the vmemmap in place, and it will need to refuse to online
CPUs that lack it, but only if HVO may be used. This only works if HVO
cannot be dynamically enabled, otherwise incompatible CPUs may have
already been onlined at enable time.

Add CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT for architectures to
select. When selected, vmemmap_optimize_enabled is __ro_after_init, so
it can only be set with the hugetlb_free_vmemmap= kernel command line
parameter, and the sysctl is made read-only.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst |  3 +++
 fs/Kconfig                              |  3 ++-
 mm/Kconfig                              |  9 +++++++++
 mm/hugetlb_vmemmap.c                    | 17 +++++++++++++++--
 4 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 5b318d17aa4b..d962d563cfd4 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -692,6 +692,9 @@ pages.  So, those surplus pages are still optimized until they are no longer
 in use.  You would need to wait for those surplus pages to be released before
 there are no optimized pages in the system.
 
+On some architectures, this knob is read-only, and HVO can only be enabled or
+disabled with the hugetlb_free_vmemmap= kernel command line parameter.
+
 
 nr_hugepages_mempolicy
 ======================
diff --git a/fs/Kconfig b/fs/Kconfig
index 1454b7fe9641..4222db17ba02 100644
--- a/fs/Kconfig
+++ b/fs/Kconfig
@@ -267,7 +267,8 @@ config HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON
 	help
 	  The HugeTLB Vmemmap Optimization (HVO) defaults to off. Say Y here to
 	  enable HVO by default. It can be disabled via hugetlb_free_vmemmap=off
-	  (boot command line) or hugetlb_optimize_vmemmap (sysctl).
+	  (boot command line) or hugetlb_optimize_vmemmap (sysctl, if the
+	  architecture allows changing it at runtime).
 endif # HUGETLBFS
 
 config HUGETLB_PAGE
diff --git a/mm/Kconfig b/mm/Kconfig
index acefc994d9a8..ad313fddc9da 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -475,6 +475,15 @@ config ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 config ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP
 	bool
 
+#
+# Select this config option from the architecture Kconfig if HugeTLB vmemmap
+# optimization may only be enabled or disabled on the kernel command line, e.g.
+# because the architecture configures the system at boot based on whether it
+# is enabled. This makes the hugetlb_optimize_vmemmap sysctl read-only.
+#
+config ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
+	bool
+
 config HAVE_MEMBLOCK_PHYS_MAP
 	bool
 
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 817ce39d4cf3..de4148a8aabf 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -428,7 +428,20 @@ static int vmemmap_remap_alloc(const struct hstate *h, struct folio *folio,
 	return ret;
 }
 
-static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
+/*
+ * Architectures selecting CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT rely on
+ * HVO only being enabled or disabled on the kernel command line.
+ */
+#ifdef CONFIG_ARCH_WANT_HUGETLB_VMEMMAP_RO_AFTER_INIT
+#define __vmemmap_optimize_enabled_attr	__ro_after_init
+#define HUGETLB_VMEMMAP_SYSCTL_MODE	0444
+#else
+#define __vmemmap_optimize_enabled_attr
+#define HUGETLB_VMEMMAP_SYSCTL_MODE	0644
+#endif
+
+static bool vmemmap_optimize_enabled __vmemmap_optimize_enabled_attr =
+	IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
 static int __init hugetlb_vmemmap_optimize_param(char *buf)
 {
 	return kstrtobool(buf, &vmemmap_optimize_enabled);
@@ -751,7 +764,7 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
 		.procname	= "hugetlb_optimize_vmemmap",
 		.data		= &vmemmap_optimize_enabled,
 		.maxlen		= sizeof(vmemmap_optimize_enabled),
-		.mode		= 0644,
+		.mode		= HUGETLB_VMEMMAP_SYSCTL_MODE,
 		.proc_handler	= proc_dobool,
 	},
 };
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


