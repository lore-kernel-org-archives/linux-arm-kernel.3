Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B87DCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 03:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76e5d+OwDFACeBsZxMFHmjJHOEXouBWtuBdAHT+B+xY=; b=wK+WAXHTwjmvGHsPVSB5tRgJ7q
	/+vCgrDigEk0egIXzxn0cJX+/R8nmO3RzUwFUMsezQnGsn8PW/O2bqFUCnI0qnEFMY8ipuicvE6PE
	93L7f3R8IzcrheM+eXkInQCJMH9y8IV6iraAL07KSB+hz0T/QcZwvldGp8KF11gERUOBG5dk5jcQy
	csI3kmv/AuDOY1F4+q8cO28FHbaMBwuySjqx4xZeipP7cLlPKJDUU0ZKEZmjcOjVBRGBBV0cE7w/s
	IxG40SU0p3gLswIIAGh/2dcoOBK2tQ5TY9qB5bolMmPHpEMEP3WOoqPxevBz43i0QDUsLzfAPhBY6
	ya26CTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nv-00000003I1H-3vrO;
	Wed, 27 May 2026 03:56:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nu-00000003I0g-3goX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 27 May 2026 03:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=76e5d+OwDFACeBsZxMFHmjJHOEXouBWtuBdAHT+B+xY=; b=qPbq2sBSu/1QLItZTIPXnVyV8H
	UPe2rXDRWNdgxI7oEJSCBi7iCmEZhfmhVjXMOV7B0xUkkvsOiUkCSxJdIaED3m0JifSk0K0664mL4
	O7XdHzQkqFEHHwahySAKYEIbUPFMh7fmgzU6zxEgNfYKKCeozygQy6J8EInXezWnScRmiZ6oJxyt+
	u6TGnz1hBQ1YUn/c6crfI1lzJ183xo19xW1ML8rUspLoSGEnm2t/TIyslqpQ2nx7UGhobdueFBqLN
	23HbFWjmRVcY5j1c2w6qDU7/aVng1n0crY/yI99wf1i2JD2wbXnSXkv5JYk1HqBwvKfiTSfoQ7H2O
	Ed8/Q9pw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS5Nq-0000000CtXK-00HW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 03:56:44 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bcee5f0d01so18785435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 20:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779854200; x=1780459000; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76e5d+OwDFACeBsZxMFHmjJHOEXouBWtuBdAHT+B+xY=;
        b=M7ZPYm0YtBzK7DuzK/h5pACeCmrlD7ENjLKWaDoSlesajPpWMfn7Ubq1B26KHVQnrp
         qm9he4nIQYd2Y6zxiTAWM57qyXNN7as1kE9QoWSr+WR3o051+uxCWrJJLTniyy6IV/ms
         gdp6/EK/FYsHfkNdAPCHiFCkl3krkPezi3TSQlm2AueFSlrYK4SSFHyDV4wKqiT0x7Ht
         GQysUYSKGf9lpvbKtVR7UFS2F2l/qkqaG+ykZg4BW4RX5jnW2MXmnouV1Q+ojQhacPmk
         m2ntSg3sFxa0NO+5F2dbP92x23O6FgWvkBR7Jlo2aghx8MmjTpf3dIUJ/caPoatLURDX
         RZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779854200; x=1780459000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76e5d+OwDFACeBsZxMFHmjJHOEXouBWtuBdAHT+B+xY=;
        b=BH/0K+/z1m0hu7n2I1IRH7p4mIslGLao1GqS+9jhgMcWB8d8MjcTL4r8iKDZkUojAm
         EOwkLELhI1fqBuGS4UvF6rJK9VXuoiHkv1ECUgSPIuRkWUrcQox0ZO7uUCfDS+vnZifQ
         Qzka7+Jv8ZLcJ3mRw8NpJLKekds0ibdRRE3hpOSALJiWdWeXTYgJN60MB4X/Di6VCnYt
         mlxQvq6nlp/Myn0nwPv2MzqX/WBa1WeVj/nIqk6RAdDN5SnQIq98E0ZRyAnzWLImTVfn
         KFdFpNciSStW25LxZQ2i0mLxzu2VCrsaDLLqNKah5v/bhfrHx+eSUPHAKDibsDRVIYyq
         hRmA==
X-Forwarded-Encrypted: i=1; AFNElJ9NeYTtyqxoMiBO2jzziejVAU3W/z4QMRaojakkNiLyJE6jAoDB43ZshkIkTC6SaLy1Cph7P+okOJ/7dM9BpK1A@lists.infradead.org
X-Gm-Message-State: AOJu0YyGefDgMPf0KV7fC7EwaeDtJ+C5myuJZ+M+D2AezM+5O0T5ZEyg
	qllAizT4jLeLpwDzusDxl17867i4RlvgohT67/UDHpQrvvBF35DlKah+
X-Gm-Gg: Acq92OFRRmdGtygZTgKLDiaefjFbX5k6/GmzQbkWKiLto4LS8GD3dxUz5eDi02paEfy
	RKZHxp67fiCUK3Pv7eLY1W43eVOoixDLkUM7GD+6oyFonUyQVp0IgOvAB+Lx/223nGB1T1PkIvV
	APq4nwR+KH+UEeWebVfGTsrZ0OZv41oWiqZOSA2oCWtUFRBu56DMCyxymYscMwl1cZzUqSpwntC
	6c3klDRohhnE2eGDBzap28YHf6KkfZ7Q6xGSNxHnQr+iXbwrFcpJzC6p9PQP5yCO8vBESzXaTJM
	dgkTsJYcnekLPVz6yxz6USZ2HHA/YJfagDJvdOBLfHU/G4xNQVTYCTwUHlOglkdxsCrGaPdrdxK
	tkse38DDOjZIP34ot2aIbA7B0NyrVpc0FoXhtsh2ftvUx1zR3Ik5KAokyXnSka4XfRG8N2AysoO
	NWBprnL6z9mo4Eoh0Umr/vecXtDN09t7Uss6fLPimpbxxqBhV6gPTbltovRXahIA3HvUF1rbUEI
	nbO8RN0vzE4HgyNbLS2hs94+14=
X-Received: by 2002:a05:6a00:3a14:b0:82c:ae58:46a5 with SMTP id d2e1a72fcca58-8415f3495d1mr10604971b3a.5.1779854199491;
        Tue, 26 May 2026 20:56:39 -0700 (PDT)
Received: from firefly-aio-3588q.. ([36.28.158.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f1ed8sm828385b3a.43.2026.05.26.20.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:56:39 -0700 (PDT)
From: Xueyuan chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH 3/3] x86/mm: make huge zero folio read-only in direct map
Date: Wed, 27 May 2026 11:56:07 +0800
Message-ID: <20260527035607.14919-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
References: <20260527035607.14919-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_045643_408085_AC784CEC 
X-CRM114-Status: GOOD (  11.98  )
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

From: Xueyuan Chen <xueyuan.chen21@gmail.com>

Implement arch_make_huge_zero_folio_readonly() for x86-64. Once allocated,
try to make the folio read-only in the direct map so unexpected writes
fault instead of corrupting shared zero contents.

The set_memory_ro() update is best effort: if it fails, generic THP keeps
using the writable persistent huge zero folio.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/Kconfig   |  1 +
 arch/x86/mm/init.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f3f7cb01d69d..81f9478d2803 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -24,6 +24,7 @@ config X86_64
 	def_bool y
 	depends on 64BIT
 	# Options that are inherently 64-bit kernel only:
+	select ARCH_HAS_READONLY_HUGE_ZERO_FOLIO
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
index fb67217fddcd..ef721aa2ff0c 100644
--- a/arch/x86/mm/init.c
+++ b/arch/x86/mm/init.c
@@ -3,6 +3,8 @@
 #include <linux/ioport.h>
 #include <linux/swap.h>
 #include <linux/memblock.h>
+#include <linux/mm.h>
+#include <linux/huge_mm.h>
 #include <linux/swapfile.h>
 #include <linux/swapops.h>
 #include <linux/kmemleak.h>
@@ -38,6 +40,15 @@
 
 #include "mm_internal.h"
 
+#ifdef CONFIG_READONLY_HUGE_ZERO_FOLIO
+bool __init arch_make_huge_zero_folio_readonly(struct folio *folio)
+{
+	unsigned long addr = (unsigned long)folio_address(folio);
+
+	return !set_memory_ro(addr, HPAGE_PMD_NR);
+}
+#endif
+
 /*
  * Tables translating between page_cache_type_t and pte encoding.
  *
-- 
2.47.3


