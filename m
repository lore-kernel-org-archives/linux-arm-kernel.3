Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19365E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 09:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=; b=ka8/xh7NKxScQf2yvjPtSY3ApT
	3W8fg3DaLjHBmbjikXKFX7XEwtrXZDpcfmOdnf+yLoqHcdHkTrcsgrBiSpyToX23uZrUwoblxibmB
	kBD6LI7BQbbASYaBm8FfLow4DCWBtNywmv8wH5l/6NIbJ4q89zgrjDxPpL1XXgWDOM7w74lD12lHi
	tWDOmLEk+a9bUnWAF1z5jGW/t9v7QdZXiNKLHwfcaktvQnEpci+AHbcJeKk2YiXloqD52w8KcOHEx
	XnMh6o9mXT5icS5+SjUgL67L4poEyMzlwSLXyQGRym497g0/CcJ5CK4ePanrIsdK1yPFIIsKb9cUO
	sgkuGc0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPf51-00000009isz-3VFa;
	Mon, 23 Dec 2024 09:50:27 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPeyt-00000009gRx-157E
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 09:44:09 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7265c18d79bso4502500b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 01:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947047; x=1735551847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=IIm/baMhWvQfvQ5iFy2R44CbxdR8F3uP791p9uNvvS/Nb3tLall8WATSIFTw/WZZpT
         zGzqAJTn/xEIDZzmFRH4237i+LtStaPSrdduWCWqzUj/TJldo/sz0Od8UPmrp8LoJmVd
         Dka3r2QWKlVrBX3JqwJSW7ou3OaXPLwPlrHTFB2E0ilgNZn8v0Gmx7en+JeNSjLvVhbl
         JlbN+AhhZXionScNsbU64PJR+RrfV1KOIz+t5vebjVinLj+JxKgVhhaQdj0ZCLbkqQCv
         PXs/kJw8sQLYHKDR5jBpRts2Hr2a7MEq33vttBJPxlyrsHlR4T7qtZnzZuSqKqNHZMkX
         JnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947047; x=1735551847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=vLFiaoP8TE37yGD7F52fEfBoctNXNbzZ0ei6XbvcFzN+I/BfKTNE3Qo645eOLesdOa
         6uJ0uNZkrG2QZv+/wrc7uEdbQpzKkLeNFdtkDN3Ez7wOJjkjJnqx4lHvPwO3A/yf4pBO
         Emti9lFmOE3SA9x6ms3P9QDKpl6uugfbKvOB1T5TkSfDP6Xrxmms/lGDrTPFq9AVEgty
         svM6gmgKDcaNrY+f44Nl1DdtO/yG3p3FwXQb45BgBoqktq1Sr4qR3KwJLSwyvpkykxHa
         s78CoqSKUJmvmSXbPLlAK/qTFC9Lo1akgHfRzWZ/aK9T/pZG1DhcVGx7TD30n+Ex/72S
         i5jg==
X-Forwarded-Encrypted: i=1; AJvYcCUrHwBXTZxRTUXdXmXqNWWOjZSVuBaVYfMzEGsnSUjyL3mLYSewOmKiTqobrMVKKegc2GODahav0Q6wTQr03ap7@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7mCoKagGpnBVX9HolN6oiJE85MvUwuCAs2tpTQZ3TNrjmHr8b
	V7/CIlv5UxuB2VqIJXruyihbxmuQb/edcb6QTw2coAqPtxjXeuqxM3eiKuSg5Ps=
X-Gm-Gg: ASbGncv0k1duZDoJ1m2/7+f34YVHZ8yF0/V+QB8lcPP6SnxKNqvYoNpG/TvglH1gqOk
	rubGtU6gktmOFJwRW5tcNn73bbSDPTbtJfXxgAmsYdTcj5Tb8MDMNcsCgOiXmhdJqQvR+3qN4z9
	R457+/1wB+eoT8CKj+Lv880G3pArFI3frHX2sZd74tNyZ7QwhEwiattB20ckHbDZgwo416uKeaF
	EQix+cksAj3vJIV6QsjIITdK8cAAFrofBz1tPDXJAE5C52cTAn86HEtpurGZ/NFO41+TWEIEwPQ
	d3+xqdUDoyG7fLmMtRXlCA==
X-Google-Smtp-Source: AGHT+IEE3DAo82DBKWUM6FD2Qxwd8GTGkBziQ/dfcNtaRbY+efEiB7FXaTM2aY8g2l19VVq60zkLag==
X-Received: by 2002:a05:6a20:7f82:b0:1e0:d575:8d4f with SMTP id adf61e73a8af0-1e5e081c5acmr19810935637.37.1734947046731;
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:06 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 05/17] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 23 Dec 2024 17:40:51 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_014407_298591_C2CCFF7E 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1


