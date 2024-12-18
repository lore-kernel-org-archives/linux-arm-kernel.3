Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD7AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hRj0wkIcDyLmKPONLgLEnODGJVOQ/lxkeDhrLguGMRU=; b=4qPPbcP49AeizdwVHhbF3VgVWV
	EMFQjhdhMGc8L7OgctgMHndYzEkQU/jFtS7i88FAjUSf6Zk1yOUSH9GBmKPGP9xrf4EE/fF7d6teV
	B5OewhXjyzxFN4Fj4GLBhWYYSpyYYGX9My/9vsMZk7MqVXs07HfdunyLYSAMxEmhH3FjbuvPFCWpJ
	Wm1WA15MeXREp9znDFeHmwesd8iLYVhpCOzQ7pZLPWNMCI0ufLxhlGh3nWwUkVbyOijrgOHV265N0
	/z71RiaLi3f1DiOC0JG8e32DLfKJFigMCKQ2EZKmNmrMiehUUrWVX6xlggUGadrMK7Ak8poaLR7sH
	fJhw4Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtl9-0000000Gfpx-3N52;
	Wed, 18 Dec 2024 13:06:39 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNtk3-0000000GfPv-2HxV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 13:05:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2165cb60719so52142595ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 05:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734527130; x=1735131930; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRj0wkIcDyLmKPONLgLEnODGJVOQ/lxkeDhrLguGMRU=;
        b=LmGok5mH8h4uu9Sbv1qxhkDZb5TWayVEUzC4hqFKkyOnkHYVXIZus1KclqcyclYibJ
         JFrcvpgWyNflh4eq9GEyaOR5kCvakJP/5tzz/wHUQJAsv6//ArQtqcfvaZjiE1cZbMkw
         ZR0Ma0byzzQxWdcccFBgPKBTyhfclfmD+II/hDXG665EBlrn5xEhiKrV6Gtk8vyE+vsU
         pVUo2v5jXQFUCHuZ8KSOmC7cxQaQeU4Kt3E5tEmNlHWoFelhWu0PI1BhflN77HsVarC8
         /R3Mzt2aFKN+TNK0C1lY+oHtI96QTCLRb30xAbnApaFIAledNC/IXxLHwLN3Whr33zSX
         neFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734527130; x=1735131930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hRj0wkIcDyLmKPONLgLEnODGJVOQ/lxkeDhrLguGMRU=;
        b=oYajCy7u+W7l9jlfMxX6uepAdJff5bCt7SDHFXKQYklUq2QGoUk1zNbFNt0pFb2L+0
         C4LEDBW/RPs17ZccSb0js3uENz3IJd+CCgpuISlqRMDsSHLqoGE2CiJ3YmevoGRDErz/
         yBBGELFdCVdADMK1+ErGxEbjzs4Zbs9ERrVb4RzGsl6V9LiDL0vvFmnj1tmqWdpREGr/
         UIWDFUscdCpNxCUkGDO1u9bGnj4LXCcqhBiPH2oPhukiXRDSyUTyKzURAkNqGlXOFU1C
         SULyZ5qP3Y2SlNvO7cdpUaxDst/Raebx9ch/8QPOcJ5/pO5g8zeHgFEMEM6OBAJtkDdz
         yekQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2s8kBmTzR17GITl9NMimwDJgMithmLD3bK/i2+AJIOMWvFqWwDV7qiegOz3kxbvHiiVrZyCTeRVePFyyFLzZq@lists.infradead.org
X-Gm-Message-State: AOJu0YxeU29Gu1g77ieR49Afm5K929SqgR38pPKbDtUOdetN2bRfS4Dg
	o8/4/fksyYcAdJkMegjz2UVi+LUPotfuyZnRqL7PYKlN4nIvC8ElVV4lFod590g=
X-Gm-Gg: ASbGncvt5Gatw8P5pZjvRCaKqFh3ftkwc9BoJsL7o+nTr91qAC4H/+JelS6OLZdrmGV
	mgCjxpSnb6+vHkVIZ7EYo5Mnk4KLWP70GYtcDC6Aew2GY9u1A2VSWR2rpqWco+fdJ5QuWoMsHyN
	MINz2HiFmmEu0FlznsF1DGdSRtg/G/nDRUoduiXynqh8CFmqBWdP5Wnd+duIahSQ2dkKa+Y9DbE
	Y8vISzUEEMeAimTNU2IAqZ1mtkfnhpIfnDen32Nj/Eu4pML4nFxxYeSsmqakbIQBGpbgZ468P0R
	kns6grWAlROu94v2Y5pO5Q==
X-Google-Smtp-Source: AGHT+IEbMQUiOWkQtVsukFUm2ZLuTFY97EKfs/PZuqMM+WxRQxlasXxPYQ7Z03KXqwqNdfJrdRWLVA==
X-Received: by 2002:a17:902:e5ca:b0:215:4394:40b5 with SMTP id d9443c01a7336-218d724abe7mr34796235ad.43.1734527130325;
        Wed, 18 Dec 2024 05:05:30 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db755dsm75751825ad.42.2024.12.18.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 05:05:29 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
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
	vishal.moola@gmail.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 03/15] arm64: pgtable: use mmu gather to free p4d level page table
Date: Wed, 18 Dec 2024 21:04:39 +0800
Message-Id: <cd3bd742cbd45e9deb0f102b6c282f1e86b6efd7.1734526570.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734526570.git.zhengqi.arch@bytedance.com>
References: <cover.1734526570.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_050531_581344_84B3EF4C 
X-CRM114-Status: GOOD (  10.19  )
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
 arch/arm64/include/asm/pgalloc.h |  2 --
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 679c530549327..58cc260b6bee8 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -100,8 +100,6 @@ static inline void p4d_free(struct mm_struct *mm, p4d_t *p4d)
 	if (pgtable_l5_enabled())
 		__p4d_free(mm, p4d);
 }
-
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


