Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E271AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBmtETjCgtkgN/SlhhkioTbX83ctXCjZLTUQUxP3DRw=; b=VNGxXBS67P5zhISIlvcY/IOpX1
	PEhvS+z+2nWHm3vRRZ319TA6/KprZfo3UBkLCKTyMzWDXvB+AVbXSnxqI453R/2Zgb/qfv+8tRD51
	2Wy+q2+a0MVLVJNu7P1bgMy9bioTcCMnRms7kSujmjyQ/wxHPeM5wvu8wlJy879O24fNS7bmbuj0z
	A6Sj49RjiZuOyS4Jun3n6l3OW2iz90J2oigZKW6JIIaXVicp62CmPER5zZBFv2bRuAF043ji1hMb2
	B1xv+BLXSdeo/SYKw9ti8GvlTj4Ze9P89+XMtJZhpcw4rDJS3rWDf6qdRlkmKjlXaRpKm8w9MkHqz
	OKkTS40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2H-0000000CWwi-2X4V;
	Mon, 06 Jul 2026 13:06:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj2E-0000000CWvC-48RH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:06:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-493bb0e2894so4450265e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783343213; x=1783948013; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBmtETjCgtkgN/SlhhkioTbX83ctXCjZLTUQUxP3DRw=;
        b=cK34vP+NRbheJX3QJiYJeM7YEvRM+3iQKqxOKYSN3czhD9Gat36uUgtOLEEeS4lQ2A
         rwAa1nVKLpzuf3T7r4qII8kJP8bjmlobMQ27NHNvntz4FAQ8Ooz+VpZT5NK8nOlZ0APL
         t13iOSLS23RCW28CdjbC3sfE3xZyduZN7Wwkhf+FXKCqmaYgpGesc5fxWrlLaUBDyKgT
         xo37lb5hFecNMyPEOyBdrZtgiMsm9JHfp50q43xCbqTr0659oD3MeXKL03IqjqiyhLys
         7MjHI/l7s53Cgur2WnFXHips8C+tkVwJi/PsVnn8IB6ZakP+JTHozXKPnz6UA3Jgd9VG
         trmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343213; x=1783948013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBmtETjCgtkgN/SlhhkioTbX83ctXCjZLTUQUxP3DRw=;
        b=ZHckxhWQWMvBpPBHibcocWWoYxi91MZ0Ldz6xgMSvdPpEPSsBjpPxoX+argHxxCboZ
         9yLL9yqQ1SXe2AaPS87+HECGko4WPtWX+vDRx24iEWfEgsv3SfeJyYoXWeeGQwePcvY3
         XLj56AeSPFNroenQK40I44E7jYCfKXZb7Vxbzl8b/MOljLhQdQp8MqgDCqu15Hiplb3F
         PYso2EZakJPoo6So/cAzBSDykKuNB0OOhZjdIA14d6J5dTSy7t06LudKtKy0aotYWmgV
         zmY3n+U0vUBW7py0mqLyumC/vgi3aI7BqRe6DJu+DNvIB/gU3khLdaGckHVqNqKMHcMf
         eIUw==
X-Forwarded-Encrypted: i=1; AHgh+RqgJXKKqPooxO8UPJDr5R4cA6v7wU5cY6yhHXZ5Sl5ST1BFCS60+FsWzBC8evhx6RwPQYOtayxjHlsVjc1ky44t@lists.infradead.org
X-Gm-Message-State: AOJu0YyoQEV5joZirEyAlFbi/DWWkN/RBEL6hCjXr4b3MUzkROmf9Qks
	af+QgKFvHNRUxo71bajS/jtBXaK6vU4+oMkBvgRwwq+M6/ZeRXzflnwU
X-Gm-Gg: AfdE7cnxZK6RaOWJ+G+Cl/738jAASDvX5IhonPf8yXpEU7SsGBluF+WqVuqL62WVEfW
	I9FB4sw4K0ATFcqPl4dZQq8FxhlFnGS7E38j5ty+oPGI1UrI/Jeyyfv13IB3woVo+C1d2ZavhCs
	KjByYuJWO8lAFFhz3UeUboW6PwHAfNrxjBWrDP1cjMWDo1VRyj43KRby5jxd1bZi8TPzquvin6A
	h/bHDR5WWdLnhsVvxE8uWwUlVDlk0U5uouldATv5Asv8zqxHzAVAqK/J8JuBwLtcgdosPsSNb30
	AfolHQuspnfTDs6+ZmZWyj6zI6sf6M/G4P7zvW1qDBLM4iXgpKImPichLMLr/pFrykvJFZUBSTD
	1f3nc3HwnncPW0QiwTV8IXbbBAsHnw5JADrHUGsHJNrOTs/KOAon/duT/ZH425NHgAYXLOvX63n
	FWflfE4tb2Y+zXYRpV39PlUWWZLlkIYHh0qRCu1S90z6/6SEjR76uTqGDGDVyuUOQquYOMw0vuC
	p+tXK6hgA6YdJ5B5HKPTvneliPW+LI9Tu8=
X-Received: by 2002:a05:600c:a203:b0:490:b2f9:d9a4 with SMTP id 5b1f17b1804b1-493d0f09261mr45185535e9.1.1783343213043;
        Mon, 06 Jul 2026 06:06:53 -0700 (PDT)
Received: from debian.lan (vmi1894487.contaboserver.net. [154.26.158.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm24515956f8f.3.2026.07.06.06.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:06:52 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lance Yang <lance.yang@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v3 2/3] arm64/mm: add set_direct_map_ro_noflush()
Date: Mon,  6 Jul 2026 21:04:39 +0800
Message-ID: <20260706130440.9295-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
References: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060655_041708_4D4C17E1 
X-CRM114-Status: GOOD (  13.00  )
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

Implement set_direct_map_ro_noflush() for arm64 with update_range_prot() on
the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
existing can_set_direct_map() guard and leave TLB invalidation to the
caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..7083260303c3 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..1a6769073558 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return set_memory_valid(addr, nr, valid);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	if (!can_set_direct_map())
+		return 0;
+
+	return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_pages,
+				 __pgprot(PTE_RDONLY),
+				 __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
-- 
2.49.0


