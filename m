Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84327FD0040
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 22:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xvx8E7qiB01vJhqM9saSuJdmjeUVy74XGiStAmL658I=; b=mO7//Pj7KnHfVk
	YEBjf2cLahMdfSZJmc/LNETTjjUGqmT/pZrCW4m07lbhsNX7aGHGvDQ/fxNxvO0+U6G8aUCxAILcd
	ye/D4dtxa6pxE4Jw07M/U0ZBoVREzA47k7dGXpFO/USeCVe8heXAhUGlgkv1hZ1lHNl20/joFtQ6E
	RLB+qbEbAEFKia3bUIEFu8cPn/QApcDej812Cb66mobMLU+VVf7tUrg2tg2uiDWUF9cFEDefbc4nK
	p5kRbv7Ml+529AZety4jnmjkt8/AMMtwWKyrrm/UGbfB6CJE8wgeCilEHPe7cDyKtohA5DZuF9EBd
	zKS4GtKtieLFmxQimtjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSYQ-0000000AJox-3N67;
	Sat, 28 Feb 2026 22:12:54 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwSYO-0000000AJny-2VSj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 22:12:53 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso1334256a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772316772; x=1772921572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xvx8E7qiB01vJhqM9saSuJdmjeUVy74XGiStAmL658I=;
        b=RZQ6Fj5yoJ7EjSar0PJil6qU5dszut4iqBjheABvKngnAJ+YsVS0R/MIZ6nrubH+f4
         eXiZh/vhGGS5yOc6DIdB6assDp5MbSRJJT2Yodh/FIEscIQ5WKjIGUCFDkU7lMppXttS
         kWiqxaD4qNcyWtrPW/jg9qUSsinrVKo49OloPbJTSr0mdraLG6WIikyD/AH6mOVyXUDX
         ANl25RRUubM9YI5awf0Y6cqdo74+LRNtSnr/knaUCnMZALrXwG1FiPv2dZEB7l1q2aMC
         tmRmRHeBGLYick+5einjiXHFeIUnDXBGVk3mVgjjljVxGHvQh8c/7jZoQryJoftzJI4p
         cX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772316772; x=1772921572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xvx8E7qiB01vJhqM9saSuJdmjeUVy74XGiStAmL658I=;
        b=arZQg3hUjpiABajfs1TSVTVCNGGek9Ja6Qi9lDkqVzH2R2GgLkA92Njq1UPjjvnTjj
         PeyFK3LMJ9MztnGAa5xImzWzPd23ss0kVQ/jgSvNQGYyqP6xi4JbgBVttR18oh/R1tG4
         Arus0Pp1Qexkn7GXwXLuwEUTiSoeSmhzp4qsTg4GhqK+YbdFUxvM+vy8R+4N4UTHqJh3
         q2QBaqaomPBoDgF5eQBxA+2n5nK1ugDAoeuSU4k8PY3aFfBxSoW0nKs5aF96UOtvOxS6
         EZiyLDmKVw0Fdlxys4KL+IuSj2HT9opjBEGWuYGpV4wHrMLjjCNFr23mf8BFgjFU+hGJ
         ekIA==
X-Forwarded-Encrypted: i=1; AJvYcCWL/mVOV+m6lkE/XKUMXbl/rNEsaT7X9K2hYqTKxczmwMnRikFoJUGWaeKSPcAAMcUmtv31WpbPGrZ/hZog3rEf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzx65/v8ZNUb7c2RuE1bnaz17YcXfIwHKPGrabx2XKFPcL2Awc5
	r1xDGTnwoONzr7iBl9A466PoQD4HEgok1fUhfp1wWBbkNNZBf/nFkPBx
X-Gm-Gg: ATEYQzzbv2diJinGDz/pE1Q1UQkltAsur0g8vpSwNCSgG1Jg/iMH39JSCtsby9/+SM2
	jE7L2oKcrNZzjg2amsjneeUqJ5T2eYDGNklqxsONJyVga/GaeNoFTNLI1ndfeZ91Z79qxE+wIJE
	3cIgWxGEbjayqlZLFjUIf2Noz2FaoGjX+FEq4sGduyqcF7xFZB/EtKUBzMqN4y3jg8+ZneDB0ga
	9QUGdV05DmFzFF0FwJafmdZGAUkmKVUsZzyaNspXjjfljM0AB0exURsjWxBs1Gu4JKehIBouGW+
	ljTbXICF/bVxA9WqfrYo2w7pucrvlhc4zR6HiIEmICg+qxCthWnfL+R4XkVKuckenf4u0aq+tGQ
	L5aEMLK4WevOTVv2G66XjGatKcBQx0GT2AeU9WI6bVjfB17YhxoyrEiNebzLEUoeeRZaMWyHFZL
	MR/eIBQyxZhVNghVNLM3xS9z4rwAb/youh5ZBG
X-Received: by 2002:a17:90b:4a89:b0:354:bf10:e6a4 with SMTP id 98e67ed59e1d1-35965c4d062mr6628977a91.9.1772316771396;
        Sat, 28 Feb 2026 14:12:51 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa5ea0dcsm7349601a12.3.2026.02.28.14.12.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 28 Feb 2026 14:12:50 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/5] arm64: Provide dcache_clean_poc_nosync helper
Date: Sun,  1 Mar 2026 06:12:39 +0800
Message-Id: <20260228221239.59903-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_141252_642319_E8D60042 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_clean_poc_nosync does not wait for the data cache clean to
complete. Later, we wait for completion of all scatter-gather entries
together.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 28ab96e808ef..9b6d0a62cf3d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
 extern long caches_clean_inval_user_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 503567c864fd..4a7c7e03785d 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -178,6 +178,21 @@ SYM_FUNC_START(__pi_dcache_clean_poc)
 SYM_FUNC_END(__pi_dcache_clean_poc)
 SYM_FUNC_ALIAS(dcache_clean_poc, __pi_dcache_clean_poc)
 
+/*
+ *	dcache_clean_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end).
+ * 	not necessarily cleaned to the PoC till an explicit dsb sy afterward.
+ *
+ *	- start   - virtual start address of region
+ *	- end     - virtual end address of region
+ */
+SYM_FUNC_START(__pi_dcache_clean_poc_nosync)
+	dcache_by_line_op_nosync cvac, x0, x1, x2, x3
+	ret
+SYM_FUNC_END(__pi_dcache_clean_poc_nosync)
+SYM_FUNC_ALIAS(dcache_clean_poc_nosync, __pi_dcache_clean_poc_nosync)
+
 /*
  *	dcache_clean_pop(start, end)
  *
-- 
2.39.3 (Apple Git-146)


