Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B8C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=; b=F9TES7RVRdWuv0CGhzJFWNBwGG
	LqTdNoISiLMvcdgaX8jpCDHCR6jeGxPOzOoz7B3iPkSfyFeSc2klvX63I+Isfr3KTR6AGMCD4MJSL
	NX6fsPpLaMKRxCwhNoB+/UG6KqfjqLdOuvGBZFbKsdp/G4G/asILFDG4eDeMOwsP9qd1hIrDtJXOU
	C9H+XgPdpDOqH39Q+fE9gYJcbOHX5doeXU8wbS5/UQ5E56wct4NxyjOP6vHBC3iZbnv5rxdA85tBn
	pZn7iWb14ie4mJojgOSIjNC+4vnK0eQuHPzOWgjZSfSDbJbh+otExpWBGUAsGseL6R8G7ZlcX4bD4
	7Pz99EAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1nP-00000003yfp-1Ui3;
	Sat, 18 Jul 2026 09:57:23 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl1nJ-00000003ydL-3Kve
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 09:57:18 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso1116099b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 02:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784368637; x=1784973437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=C5WZwdzADI8apLRhLoS0l156Zj72bAqqibuIsFaLrkrDOujK2huacJcwMndBHwW+W/
         +QKAWdoOxFoaEJ9vWhGGU4L8HP/Y0p4gGuh+fIvD2wBdB/5vKO+PfCxB/kuSW2grk8rm
         R8fvm1IDzkL+jGmFJuqvDhNe0Xkbm6WnhnqClqrvFzA5+9ly4YICMczfGVtDjPLnu+pW
         mmbVtV/o4Ekr1FGoicMWtk9JX7CnJMwDP/5HTpg15fARVU9clTSklkyNgMOfTu6NHdkO
         coKI46HiwC1WCXBCHLWefw/+hgnvXgajYwnVotHkhp+B6mClG3Bmf0+xZIRk6hZbd+CP
         GfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784368637; x=1784973437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hdCu1wf2k5fVGlVM7jRlnxeinlriHXvmsiXxLfmcKs=;
        b=YvN4kd6iQmHB83dIiak60AWdlfmOP0+9pHcfctFx3kJJmwLIwx0L74UYGgCIRfA39F
         31og2nlDgXstnBGNCjr9RQkAtygh3TuhAMtntRe7/2UsAv4bn2M17yO1dfSNyJtmeJgs
         wEmfuBxCgvuU/BUvHH99DrxbXH8twlaYT8s+LS09pRsQTtzTNkku28bLrLzD0pdibd0F
         31Nu+bjp0nqQyHYMqR9dbAYgZF17el63yYkQGoWokJWxgXnUwu0E5MfzVxJQzXRGVYEb
         EkrFE77cxs2bghEk4kkmLWFAIIlShlIYCgqLtu2909LOT37aqgHitRCrDULAE8KajInn
         q7vw==
X-Forwarded-Encrypted: i=1; AHgh+RqfzUqztvMm2fm7Q2+C2Nx5QcmOqwfjoOVSiOURbwj/PK/yuSK5kZbhTXUUWqJNd3Dgeu25h+BSFaPZIZ8QZFEa@lists.infradead.org
X-Gm-Message-State: AOJu0YwgoYilZ0oNh4owQdE4DgmxrUowZhhKdJC00G2BF+Ynz0eJH/mi
	KuMrIpTC2jDI82ZHELNZ43knSip8mGvS+3vYD6mS1OU56vSA99gdARQK
X-Gm-Gg: AfdE7cm8Q0PirwFcSZ+N66o0IbSGssyLx45gIij31QZYhbTbtqB1eg5aTHmYdJVqB4s
	TgGasGQiftuepTMYV8bIyBdcMHGUqDL8Ic4yRrDveSMRw56NKB6bILjRqRC+8KMPFXKpHhV9jG7
	9uaK4Y/0SAWM7tacMBxbcG1GX5AQbtrD3lQ1NlBuvekjYWwsh0cSghp/Balbc7DNDU1haMS3yyu
	k4qVW1EzJB582U852nhht6o2fHkCuiCOuCOeeTTsmFr3jP5AMxggR05X4kwJeXoEf3SI7YeK12S
	iUwVe9vRSv+p2+VmOxmH3U7zy8xc2aFlZdiV21Xr6FutpvsntqWbinrgZ+TZoqG/Pkt/gVAVyQu
	wD6yROvKCX04e5SfYFL/rVvGsMeTcJ001Q7Mq663Ld1LU+GI/54CdGiDNNIIIRekM3E2+Nz1rUR
	EHys/9/7G37NA5zgcD1eDKb10cjUADYWXn/d+4dY44RhfE
X-Received: by 2002:a05:6a00:9499:b0:842:5a18:9af0 with SMTP id d2e1a72fcca58-84c2917f212mr4248164b3a.0.1784368636739;
        Sat, 18 Jul 2026 02:57:16 -0700 (PDT)
Received: from debian.lan ([240e:391:eb4:a240::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af317c8sm2417248b3a.30.2026.07.18.02.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:57:16 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v4 3/3] x86/mm: add set_direct_map_ro_noflush()
Date: Sat, 18 Jul 2026 17:56:47 +0800
Message-ID: <20260718095647.182592-4-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
References: <20260718095647.182592-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_025717_838065_038811DA 
X-CRM114-Status: GOOD (  12.33  )
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

Implement set_direct_map_ro_noflush() for x86 using CPA directly on the
passed direct-map address. Clear _PAGE_RW and _PAGE_DIRTY, keep alias
checks disabled like the existing direct-map _noflush helpers, and leave
TLB invalidation to the caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/x86/include/asm/set_memory.h |  2 ++
 arch/x86/mm/pat/set_memory.c      | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/x86/include/asm/set_memory.h b/arch/x86/include/asm/set_memory.h
index 4362c26aa992..bd3817e06052 100644
--- a/arch/x86/include/asm/set_memory.h
+++ b/arch/x86/include/asm/set_memory.h
@@ -89,6 +89,8 @@ int set_pages_rw(struct page *page, int numpages);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 extern int kernel_set_to_readonly;
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index d023a40a1e03..5987f4c84f6f 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2662,6 +2662,21 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return __set_pages_np(page, nr);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	unsigned long tempaddr = (unsigned long)addr;
+	struct cpa_data cpa = {
+		.vaddr = &tempaddr,
+		.pgd = NULL,
+		.numpages = nr_pages,
+		.mask_set = __pgprot(0),
+		.mask_clr = __pgprot(_PAGE_RW | _PAGE_DIRTY),
+		.flags = CPA_NO_CHECK_ALIAS,
+	};
+
+	return __change_page_attr_set_clr(&cpa, 1);
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3


