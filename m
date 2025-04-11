Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018C3C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAvN/ymhOC9RH1764Pqdo1P8xtkdW4aJF6g43VRuQIg=; b=OL4X9jJveMJ5p2Faya7/1pOMhj
	y/JyCpq77x6tGLzj7DXlFjpFcyT3K4DIlLnoonhh9FKi3JWCdS2d0MveVQEL/WKcwA5vOxnIbAyKs
	uakCLMOHUFI+k94l+JAP7coEvaUfn61rMW6vUiCYMk2e9EroIowycWNLhDqebHzWTaOgaE4dorTu+
	wosREdFdU9lWLgMtnPxLIfT9kktMWan7WUQuYZM9Ae6aOSkcBcCsTRtVLgCDGItO2OW4kl1os8cz/
	sR6Wf4p73t4fQHM496hypWXX8dxkYyRJd3UzDtXJO9tQK2n4EMUPACJJaAt6C/DKLVsB6KJOdh9Qx
	SWfUkJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AfJ-0000000DCmx-2f9G;
	Fri, 11 Apr 2025 09:27:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AVZ-0000000DANU-07tg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 09:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DAvN/ymhOC9RH1764Pqdo1P8xtkdW4aJF6g43VRuQIg=; b=fRYvgOC4NwSVIQJLGd+IRh0BH8
	fDvl2p1DFY0d3u2CP7mAGFlXa9DuKuRpSqXZZN9Ya3wlhoWofNPLEocZHvniYSyx58S+Ib7Z859Sa
	crYvkzL/0VuWHaF6gNEtJ6jUZDv7sJclOF+8wTfPliWn1Im+HIR70fFFLmFW2GAa+FkFxnbs6NDfr
	cKvcH4sOLuVRm7rVTB1/TMbP9fSg+lFjhoXYpNueeWaEsV/x6AvZ29fI4EJkI+KrkonAsqpEvP55q
	AZNKtGgAbKvEkOYhXbmSBI+WZ3y5HS37nAOPYVfL7eFs2kZhEX4zszxDc9Ci8SL+lTmThODccidh8
	yICw2UKw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3AVW-00000008zi1-0ZR7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 09:17:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19C221692;
	Fri, 11 Apr 2025 02:17:05 -0700 (PDT)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com [10.1.194.54])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87FBC3F6A8;
	Fri, 11 Apr 2025 02:17:01 -0700 (PDT)
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Jann Horn <jannh@google.com>,
	Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Kees Cook <kees@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Subject: [RFC PATCH v4 02/18] set_memory: Introduce set_memory_pkey() stub
Date: Fri, 11 Apr 2025 10:16:15 +0100
Message-ID: <20250411091631.954228-3-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250411091631.954228-1-kevin.brodsky@arm.com>
References: <20250411091631.954228-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_101706_398427_C3E46F70 
X-CRM114-Status: GOOD (  10.37  )
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

Introduce a new function, set_memory_pkey(), which sets the
protection key (pkey) of pages in the specified linear mapping
range. Architectures implementing kernel pkeys (kpkeys) must
provide a suitable implementation; an empty stub is added as
fallback.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 include/linux/set_memory.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..7b3a8bfde3c6 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -84,4 +84,11 @@ static inline int set_memory_decrypted(unsigned long addr, int numpages)
 }
 #endif /* CONFIG_ARCH_HAS_MEM_ENCRYPT */
 
+#ifndef CONFIG_ARCH_HAS_KPKEYS
+static inline int set_memory_pkey(unsigned long addr, int numpages, int pkey)
+{
+	return 0;
+}
+#endif
+
 #endif /* _LINUX_SET_MEMORY_H_ */
-- 
2.47.0


