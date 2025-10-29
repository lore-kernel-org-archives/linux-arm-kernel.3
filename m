Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D19FCCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uUUL7svE/qO1mMkeybYnmgbSMQwYmeEBqJj7PT/8HRw=; b=1n0J1SsPQi12ZO
	xRekyEwjAFS8JzE/8yvexzbErYeMuU9rIcJn6xnd2Cqkx1pxqgGXeR9Yx/F+rSEHBEoEkoyivC6iv
	0BGrrpHE4MLm2M4tR/LXatNeAmcQaDirXd8Mn+1phE8tRMgydf8F5/O+0N4+BZyN6bFrP77e8bujg
	7xNh41rNsCsPFlN2CHW4ob7qRmeOWs/IGLfMYP34DRdlBtrZKtemsZc/w0aXHH+HCxmPhDGU7w4vw
	burNPYzAMwbddIP2UzJ9JaSYiTv/GuSy4mvqRJT06YmePJTrHYUQyLiAgVBqTYNwKwC7uyrnb8cDn
	JPQgAS4KrZI3OzpThSfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvz1-0000000Gz0G-3jFr;
	Wed, 29 Oct 2025 02:32:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyw-0000000Gyxh-3v5Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:32:16 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-339e71ccf48so8553237a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705134; x=1762309934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUUL7svE/qO1mMkeybYnmgbSMQwYmeEBqJj7PT/8HRw=;
        b=WnBydL25/Rnr9R81wwxodUNLSavaTKDmJ+yR2BEKW9+CFong5wRuI9DyppWhGlZJu2
         +ZhqrGmRE0lktzmSfFf6cNJQ7kOUno4rymOrQjLA7ypnHzN/z4xC1CUxhK49kpN3Fg2s
         ELa9PKwemp+aBD8O6ebSjXXOZIfcASz7C6aq/WQVerqVSNSr3+xmBsv/Ng8Sb4306GyQ
         uylAduQ+IAbg91yRBA8SYJ4KoLrnsM7GbsD3B1WWxC1YFSIv4m37AvSHgftx7Auo1Vz6
         WTEu7lvD1/ulDztsOTZwEgF25mhltEiX0CH/lAM96Ldvmrt7R45cDyH+XIp44yewZ+oD
         iRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705134; x=1762309934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uUUL7svE/qO1mMkeybYnmgbSMQwYmeEBqJj7PT/8HRw=;
        b=t6r+49/s4yj/5rX/SZuYWoScKjQTfB9lSaMbBFDU1aK6ZtpxI6HTVnjrjIv4BmmOPZ
         EcyITs2dQkU1ukZeRjaaiUrQNU+UwBEVHt0WuGLtS7VeZvlQau07N20Kh2F6uv1p5bcO
         sJ5iwyv1xufhTx3WpdK4yp5mOi+MrXK/TmU+Plxhkl6jOCu3GWkN6R1/olVhrmjZ4WQE
         pCAIbY3b42HGjXU5sRlAWvwzBimZ3bBbreNzZHHrNytAKmks5m4zUCPtzSgzbjgUcNSI
         M6FDAzirphL1+34lKeB3Hmso1M2JzmBE9qqRMrKV0Zvg0J1Tkyle6rZrgp+cYB2kIETd
         xsQw==
X-Forwarded-Encrypted: i=1; AJvYcCW3LEcena6I7GwpDXI+JfOG77D/2fy79gl1Nas3rUf01ZfGpG6qpIXtlLuv2F7E2cu9NvBoZ4NJDY9N0Tsk38zF@lists.infradead.org
X-Gm-Message-State: AOJu0YyCXrLTe8jurhSKa37pmXXCsFTez+/xN0wupDPC9AvewS/PBM/D
	YqCODmr3MzjI4kSTJEjKfK9zZX/BIZ5dqppCRvJyt63ypHFUuZGkzibK
X-Gm-Gg: ASbGnctgII3W35zJX3Y6FlrDm/qo9gxXOwXMI8vuUGQ1T5fj/NOKy5phC9sRg+rSPH3
	+9rSqh7GXxvdQ17q4FXiCTGeNg9ku45mVHeXHv8XFW1bby+FcV7sOzHiyY6R6LvrD0siGS+z3ZA
	7B/APfu+weASG1/0hyrqcRROmQAeqg3DNQ1GiRoMWxyxDaxBdUWIwVe3hN/DWGhlp/yZGETEG/O
	K47VgSZGrtTDwdzoi4aGpX9h9vGclr7Mj56FiKqyp9fH6XeyHxgFyk854lVznCuZm1ozJJdqWoC
	AA/zEaQ2uuGcA3YP+lEl12ThnjDPfSuWtj19kh4YsaMesr8OO8B/SYa7yt8fScWY9mP/Fslp3av
	zAO8AZOeaW9PVo4nluvK70j2NnRlZpZeN6iT4fgsWzMZlvIJ7nUlsf68DA4nTSQBXRCHFIjOcO9
	CHMoSDYxxNl174wvFwyPGmI2Dudb+KXOMu8n30XM3dxbUjXPqqNJ13XOcMwA==
X-Google-Smtp-Source: AGHT+IFvR7rogTcm5B+3ygGQw/lQVLBAuEII5+Xvx9q6E8V7+VzLsCmMzzmlIs3QIptMEm30AGJ2Ag==
X-Received: by 2002:a17:90b:384e:b0:339:9f7d:92d4 with SMTP id 98e67ed59e1d1-3403a265508mr1486973a91.9.1761705133912;
        Tue, 28 Oct 2025 19:32:13 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.32.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:32:13 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 3/5] arm64: Provide dcache_inval_poc_nosync helper
Date: Wed, 29 Oct 2025 10:31:13 +0800
Message-Id: <20251029023115.22809-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193215_010220_62E62CC4 
X-CRM114-Status: GOOD (  15.21  )
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
Cc: Ryan Roberts <ryan.roberts@arm.com>, iommu@lists.linux.dev, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Tangquan Zheng <zhengtangquan@oppo.com>, linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <v-songbaohua@oppo.com>

dcache_inval_poc_nosync does not wait for the data cache invalidation to
complete. Later, we defer the synchronization so we can wait for all SG
entries together.

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
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: iommu@lists.linux.dev
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
---
 arch/arm64/include/asm/cacheflush.h |  1 +
 arch/arm64/mm/cache.S               | 43 +++++++++++++++++++++--------
 2 files changed, 33 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/cacheflush.h b/arch/arm64/include/asm/cacheflush.h
index 9b6d0a62cf3d..382b4ac3734d 100644
--- a/arch/arm64/include/asm/cacheflush.h
+++ b/arch/arm64/include/asm/cacheflush.h
@@ -74,6 +74,7 @@ extern void icache_inval_pou(unsigned long start, unsigned long end);
 extern void dcache_clean_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_inval_poc(unsigned long start, unsigned long end);
 extern void dcache_clean_poc(unsigned long start, unsigned long end);
+extern void dcache_inval_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_poc_nosync(unsigned long start, unsigned long end);
 extern void dcache_clean_pop(unsigned long start, unsigned long end);
 extern void dcache_clean_pou(unsigned long start, unsigned long end);
diff --git a/arch/arm64/mm/cache.S b/arch/arm64/mm/cache.S
index 4a7c7e03785d..8c1043c9b9e5 100644
--- a/arch/arm64/mm/cache.S
+++ b/arch/arm64/mm/cache.S
@@ -132,17 +132,7 @@ alternative_else_nop_endif
 	ret
 SYM_FUNC_END(dcache_clean_pou)
 
-/*
- *	dcache_inval_poc(start, end)
- *
- * 	Ensure that any D-cache lines for the interval [start, end)
- * 	are invalidated. Any partial lines at the ends of the interval are
- *	also cleaned to PoC to prevent data loss.
- *
- *	- start   - kernel start address of region
- *	- end     - kernel end address of region
- */
-SYM_FUNC_START(__pi_dcache_inval_poc)
+.macro _dcache_inval_poc_impl, do_sync
 	dcache_line_size x2, x3
 	sub	x3, x2, #1
 	tst	x1, x3				// end cache line aligned?
@@ -158,11 +148,42 @@ SYM_FUNC_START(__pi_dcache_inval_poc)
 3:	add	x0, x0, x2
 	cmp	x0, x1
 	b.lo	2b
+.if \do_sync
 	dsb	sy
+.endif
 	ret
+.endm
+
+/*
+ *	dcache_inval_poc(start, end)
+ *
+ * 	Ensure that any D-cache lines for the interval [start, end)
+ * 	are invalidated. Any partial lines at the ends of the interval are
+ *	also cleaned to PoC to prevent data loss.
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc)
+	_dcache_inval_poc_impl 1
 SYM_FUNC_END(__pi_dcache_inval_poc)
 SYM_FUNC_ALIAS(dcache_inval_poc, __pi_dcache_inval_poc)
 
+/*
+ *	dcache_inval_poc_nosync(start, end)
+ *
+ * 	Issue the instructions of D-cache lines for the interval [start, end)
+ * 	for invalidation. Not necessarily cleaned to PoC till an explicit dsb
+ *	sy later
+ *
+ *	- start   - kernel start address of region
+ *	- end     - kernel end address of region
+ */
+SYM_FUNC_START(__pi_dcache_inval_poc_nosync)
+	_dcache_inval_poc_impl 0
+SYM_FUNC_END(__pi_dcache_inval_poc_nosync)
+SYM_FUNC_ALIAS(dcache_inval_poc_nosync, __pi_dcache_inval_poc_nosync)
+
 /*
  *	dcache_clean_poc(start, end)
  *
-- 
2.39.3 (Apple Git-146)


