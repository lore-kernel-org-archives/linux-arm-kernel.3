Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE7ECD98D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUGCjfh6EUmYtCCfKGjZNWokb6MJPrpnpmuE3FfsWTU=; b=KeaUkQ+QcN10HQ+c0Vhd5BaL6s
	tu/CmS1ZJqvjho8S4GPAt0CBE3vx//9td17LMuF7D9kLkfMJi/O6xhfcyXfW5sVj04LGFJAIZodtL
	NrIK7QUvVI7R+rGPBluzLmcnRI4m4SvzvWziAApiJ4LXuyaTF0fPs6215iZyYoTF8oGuQeNj2HKUi
	Rue6xMWN+DCvrY7dotCIbReE+g8bpTvYUjF0BXIdK4pr0lSkz2Lau3Rwe60zC2KbDSDv0wsaDnDqK
	wC8SK/LgumjO4y/qqeEiV7vP5LkTRgCthQod3scNTuf+cA144jx3QbeKYl05YmMreIWZO4zz9f4rd
	gRe2+b3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2q-00000009ScR-3Hx6;
	Thu, 11 Jun 2026 13:02:04 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXf2j-00000009SUO-0Qxa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:01:58 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b2f22ea2so80883795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 06:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781182915; x=1781787715; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UUGCjfh6EUmYtCCfKGjZNWokb6MJPrpnpmuE3FfsWTU=;
        b=d5LZbGThgIwF5OdvGJ6jrGNHBnuH/r91v5TfPVMcnaHHI67VSyVe26CdN+nxYt4YP7
         NFfP5KTXhOw/6Zx02UzrlrYxkytosnXZC3Uc8uf4qjDIE9vs+nh4w1mRcVn7ofmwXhZP
         bjmZ7Pbn/FAX+OoPdf/yTvlIasc6n/PmZgI2Id0t0wOsnUuT6plXG5qvQ0VZSkqr6ESi
         v4VEFIiX9E8rCNzEx9AGjpq0NHVZdYv2OUgkObFt0VzjNGKOp0LTwEb+5STL6uJtHf+1
         1svsiqA6YolQQTZw6eVnWCJLVDYEoqmHDUYuqvW24FKZ5f+6Fo0s/03PMmmwO7z+Z/CD
         8XzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781182915; x=1781787715;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UUGCjfh6EUmYtCCfKGjZNWokb6MJPrpnpmuE3FfsWTU=;
        b=J+L4hv2ZUzZ06vlBZvzDwYJSz4M4FKwg9jYmGgnDXP72dlRKhv4ebScj7L9kgQfx5L
         qxKvCnzP/+VFRWkMsxM2bHuSSZk38UhvF7v1pphioEQWDXvAQd8X3bvRxTDUhHEM33fx
         ToJ0V3+9noI/flw+bpx2bsQvLNioTvd/m0NQ9QuE3WIg6WwzBAOFo10sVakb7EXXa3HO
         wpJkGQidSURKrow8aHCT8mq5c9etHr+C0LBC8jm4oC2Mtyqsfxs/Ipv3RW31goM32C1d
         ZUZucogGbaX0VTX16sxCSPIr+S4nBETzf+9ut26V3htFMKLOnbFBS2YyCe4ZMfD1qxXL
         /1ww==
X-Gm-Message-State: AOJu0Yy1GyT5/SfhIph6X8Oio9dxjczG3lZ9THlUmlcf79k8pRsW+ZOT
	O2ZYPziw9CVBF3Y1GKJebI0SulSr3zwLbvI6dD8wbL/tramOqmSTqn2kHx1bp8ESRU/KvM1/Shl
	Y1wLW/tL6SQoSMmtmtmMaLdN21snxcz0ObQYcoTwLUWqPhnXl1a9+0GMWSdVtiiFsXGBX0ImHh1
	sTeNlqJrgC59EW5c+kx8BZ5EIXARePiV+SqzqWYfiwX13OH+gVMZd+BQ/BojqI
X-Received: from wmlu18.prod.google.com ([2002:a05:600c:2112:b0:490:b58a:2c9b])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d2a:b0:490:bbc1:d508
 with SMTP id 5b1f17b1804b1-490e55d0f77mr36764525e9.1.1781182914565; Thu, 11
 Jun 2026 06:01:54 -0700 (PDT)
Date: Thu, 11 Jun 2026 13:01:43 +0000
In-Reply-To: <20260611130144.1385343-1-abarnas@google.com>
Mime-Version: 1.0
References: <20260611130144.1385343-1-abarnas@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260611130144.1385343-6-abarnas@google.com>
Subject: [RFC PATCH 5/6] arm64: execmem: enable EXECMEM_ROX_CACHE on supported CPUs
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>, 
	Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_060157_187746_B25ED647 
X-CRM114-Status: GOOD (  13.18  )
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

Enable EXECMEM_ROX_CACHE support for ARM64 systems that implement
the bbml2_no_abort CPU feature.

Using the ROX cache brings a performance boost by reducing linear region
fragmentation caused by strict memory permissions (e.g., W^X enforcement).
Grouping executable code (which is read-only in the linear region alias)
into PMD-sized block mappings reduces TLB pressure and page table size.

This is only enabled on systems with bbml2_no_abort, as splitting
these large blocks to make pages writable during module loading would
otherwise risk triggering TLB Conflict Aborts.

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 arch/arm64/Kconfig   |  1 +
 arch/arm64/mm/init.c | 22 +++++++++++++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..79c347ab841e 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -285,6 +285,7 @@ config ARM64
 	select USER_STACKTRACE_SUPPORT
 	select VDSO_GETRANDOM
 	select VMAP_STACK
+	select ARCH_HAS_EXECMEM_ROX
 	help
 	  ARM 64-bit (AArch64) Linux support.
=20
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 71aa745e0bef..8269d7747b84 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -420,6 +420,12 @@ void execmem_fill_trapping_insns(void *ptr, size_t siz=
e)
=20
 	flush_icache_range((unsigned long)ptr, (unsigned long)ptr + size);
 }
+
+#define MODULE_TEXT_FLAG	EXECMEM_ROX_CACHE
+#define MODULE_TEXT_PGPROT	PAGE_KERNEL_ROX
+#else
+#define MODULE_TEXT_FLAG	(0)
+#define MODULE_TEXT_PGPROT	PAGE_KERNEL
 #endif
=20
 static u64 module_direct_base __ro_after_init =3D 0;
@@ -511,6 +517,8 @@ struct execmem_info __init *execmem_arch_setup(void)
 {
 	unsigned long fallback_start =3D 0, fallback_end =3D 0;
 	unsigned long start =3D 0, end =3D 0;
+	enum execmem_range_flags module_text_flags =3D 0;
+	pgprot_t module_text_pgprot =3D PAGE_KERNEL;
=20
 	module_init_limits();
=20
@@ -531,12 +539,24 @@ struct execmem_info __init *execmem_arch_setup(void)
 		end =3D module_plt_base + SZ_2G;
 	}
=20
+	/*
+	 * The ROX Cache requires bbml2_no_abort because it uses large block
+	 * mappings. On systems without this guarantee, splitting these blocks
+	 * to make pages writable for module loading can trigger TLB Conflict
+	 * Aborts.
+	 */
+	if (system_supports_bbml2_noabort()) {
+		module_text_flags =3D MODULE_TEXT_FLAG;
+		module_text_pgprot =3D MODULE_TEXT_PGPROT;
+	}
+
 	execmem_info =3D (struct execmem_info){
 		.ranges =3D {
 			[EXECMEM_MODULE_TEXT] =3D {
 				.start	=3D start,
 				.end	=3D end,
-				.pgprot	=3D PAGE_KERNEL,
+				.flags =3D module_text_flags,
+				.pgprot	=3D module_text_pgprot,
 				.alignment =3D 1,
 				.fallback_start	=3D fallback_start,
 				.fallback_end	=3D fallback_end,
--=20
2.54.0.1136.gdb2ca164c4-goog


