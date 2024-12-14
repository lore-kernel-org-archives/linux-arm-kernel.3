Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2224E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pyTYWh3zj2l92o0qEOJPcU0U+om/laakNd04Rx8p+XM=; b=sA4gR10kNr+VojtK619uhQcYXK
	6fGGqCBz80YWU3M1rzLr2ekYkiHoEedNkAwmFSUOXoghuPyT5rX6BNp2qQ9DwIOeg2oJXFGnx5kbR
	AKB9Hn9AgWJx4jYByxWBfx29nqyUW0UaC8gdTc+OGjTYIdQEcb3QD5KHtXwi0extPfBVPq8xySAW+
	UbThWwy5fnybPs795G/yC3lpt41Nh0LH3FIHs/jJIS/8Ccv5zuF3qu5DHrj1/DTecXlNrbDGoUXoR
	SqY9f8b99APTMmnHPeohJN9mMAIMpEjcl99SDGs8rkn9TH/IYoLnDUP4d3ZibyJEDK7cHutjAdKTI
	guUb4vJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO5J-000000064ih-0NzC;
	Sat, 14 Dec 2024 09:05:13 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO4D-000000064Mb-0SLa
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:04:06 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-21654fdd5daso21796735ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734167044; x=1734771844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pyTYWh3zj2l92o0qEOJPcU0U+om/laakNd04Rx8p+XM=;
        b=T8Yzvs8nkercC6UD27d7zYe74Om/4agLfxbVwsZ/qhmXJbW1IqM6MR5LMH4kuMBscu
         1pUqK89ZUL7E3ZH0Z4qyD1nYF0ZtLk5cF7dCrfMkgkCGf/ZX/MHzHZy0dpqqs/MGkl2r
         in15k5URFD+d4tTJUFM45gTcD2XmDb+cqRmSSABbGCixgFFDZM8G/ej11ohhtKUsV8SR
         pJFTxYQ43nWwFRDC8MaNaN2e9d+niQM90wvdr5xCaWxlqW2T6mbJAvErd8etm461DPT2
         B8aTzCtbVR9C4LP8aWrietiB/8dIsWhi4oymj4dYzo1IytAAMGv5nt1kMXbqjhRApQUX
         uLog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734167044; x=1734771844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pyTYWh3zj2l92o0qEOJPcU0U+om/laakNd04Rx8p+XM=;
        b=h/QK4FkoWMwtKHOZXYOGSiqvMJkuur4VRWNVr/yyjmtEa+suNBXz2CONdWZOtg6XB9
         u/IUti4WpwinniPvtsdWQX3rF+RVy9RYwJwAJVbCmP2DQHJNU+lquu8bYmWI+Qfg/D9H
         EtDbMxNfHxv/P3HdrLO6X5TuCpBwLFuM9Q6144n9AtYLiJr3g2FIDc+Eb5kVFDPSzOHF
         kTGszoALXfm27s+6YX/q9NYel13ocrtSP1QpZO2KJR23ifZPNwslbuIXkZ6nxOvsfXcF
         BwAFUJG+jlasBxt1rQGjzNhnc6Wr++vcYFHX6l7W3BaVdPM2glW4wNGe1vLp3oR9bIZu
         FSAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLJAxSePy69WNydXlE17aLj/7ZFdYnZXzNoVaCW/Whlb/xxfixLqGoZh1BaFYuNGwjb0jV5gijIG6fKfut7Rpw@lists.infradead.org
X-Gm-Message-State: AOJu0YwBO7qXynegQr0Lf8C46niBd6ZZo62EkbZsdhNUO4EHVQ5zIKft
	8Y1kvMBo3fRDRV2Zx3PBzgUoK7RRVkOREoM+1ATAhkcyxxRXp8trFKfo3mC+L6Q=
X-Gm-Gg: ASbGncvsAshJcpFVg05DyNcD84aza2UoG/T78vpJlBZViuti5e8FuRxwGFZRqsOYfWr
	5CNQGrLf2o5bJailaG+gifCUJmDf/jtl0QWyLmTiLURmDB1ksqpR1lcAhqoMkcNS3ltiI/zgXsj
	7++RtgG0o8TbvdOUC57h/xVXxvPkrjFMzc3YyW/SPeV4xw0vItVgOVz0L4XZOYxUT+LuKuwOI5w
	9e/a/rlijKRi9yajp/6kQr3zDe35AQQDGxSui5SFhc1Bc2Smpn4YoDWXe+xNgZg+KvRWaLSW7pE
	UdBVqRnMGV/V91Ik4IAxe335u+O6iQ==
X-Google-Smtp-Source: AGHT+IFlpyRvtlHG2M4nIIBLJzVMLLLjWf8IFr835Xb0HMOnd3F4yHyM51MIPZOReaS2iWrLwbmGTw==
X-Received: by 2002:a17:902:d481:b0:216:4b66:1f1f with SMTP id d9443c01a7336-21892a7c538mr78037165ad.54.1734167044262;
        Sat, 14 Dec 2024 01:04:04 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([2409:8a28:f4f:a9a4:5d46:4ef0:daa9:1db8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90ba0sm905731a12.16.2024.12.14.01.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:04:03 -0800 (PST)
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
	rientjes@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 03/12] arm64: pgtable: use mmu gather to free p4d level page table
Date: Sat, 14 Dec 2024 17:02:49 +0800
Message-Id: <fd2faee37876dc6ea93d0b8dcd001e13d77c3272.1734164094.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734164094.git.zhengqi.arch@bytedance.com>
References: <cover.1734164094.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_010405_143466_033D311F 
X-CRM114-Status: UNSURE (   9.66  )
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


