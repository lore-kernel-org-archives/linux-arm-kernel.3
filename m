Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26DD3D74956
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BUB05Xw0z/21o0FdpEbUVLloFvEcORujjQKbT7R+Vg=; b=pPGfqXsZTcW9O5
	9gr/OeUp57NvatPtiF5pAqHLqBoKtZ6gXB6JiMd4+wlSF/gfR7t46Z0Tp5XPQjiZYuq7bPs8JxN/f
	cMlkazfZQbLoTahc8cAUKVa7O0Iryw6yIcGer35KV5HESO++MXJ4KIR+R8q90eQD+ZkRpSLiXeVvU
	c5SPB+TbpbsFVXkTcKec3VTaFmeAWE2rNooet+p3Xy9BNCTjfdXZf8j9Zq4CPKkVadXBhXGZ9adCQ
	YvNx3wJ1vgGWIPxoxV6yWT1ZGOSJzCLyPb9hCA0sg6l7cjVvr32a0UcVxlVT5sq4tQ4tyIH9Yh30v
	rnYKD/o67sfLcUsG793A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBE-00000009edN-2Xie;
	Fri, 19 Dec 2025 05:37:32 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTBB-00000009ecU-2VbZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 05:37:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a137692691so16207415ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 21:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766122649; x=1766727449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+BUB05Xw0z/21o0FdpEbUVLloFvEcORujjQKbT7R+Vg=;
        b=clnQwqRE9Dh7Ir68TwYiIqJqIx1s0iSRyMuJMXbI/++tPoKAwibKzdpjX+VP5q/cWQ
         O8Fk8otgDe4d/VJ72ayR1RAfOGr2rGonmq+p2miWyGeZzR90S8IC7OhT32uy+MmJ9dAW
         RZPjmKGjeBboZpd0VSdhqldW4yjs7O5sl7m4GADqAu5Jj8cSSEZ7FVJhOrXEp0+CHc0Z
         VUGUw8dJ7QoMTMuVQzRD2x4MqkOEIaxZNB7xxoyvZ78nwTF8AHI9gRoTwpsi6L3blSe+
         tE31FHNUC/XHwHP/6luAYyYFlW7lkZk7/LPIC6sK6z312M/G9vRLPre2utJwJ8O89n88
         hDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122649; x=1766727449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+BUB05Xw0z/21o0FdpEbUVLloFvEcORujjQKbT7R+Vg=;
        b=slxApsthIovugf+B9Uj7CxRrI2l4fsWRVFic96waOSQr1+ejrb6bULUSbI8DGvYUBz
         W6KpgPQ6ujE63Y5Nu734NeOm0r5uw9vRgBk8LpNGKBXz5P/6NyONMlivUn7+EGEX3Esd
         cuBc5uM2Pp7A7NXs758EbZkB8tEtDWB8eQ2A/Ea2TiJAufQOUL/mLVV9u4x6j2OditcM
         wxQ0WfT9E9/+OySYSKjdU7GK+4d10l5zjx1KRibbTPqap6VvhbUtJ/uZm5MBZsK/DvK0
         ld5Eld7qVj+0xAzOdgH+OyZ1JBGFwWXuMMvnHWDYWk7k9YMwfmYYUEyZSEYZr4slAFeq
         c7SQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6y3CAMpLlj3eMOk+XZ5mP1f0ZrXXm+59YoNBVlaKYclG48m6D0yKg9EozCLM5xcTsJo4Qu0CNaNqFE7d4RmNc@lists.infradead.org
X-Gm-Message-State: AOJu0YwS9j/zkjJH/SWnGY1cyVLrTgC/L+j+SV9yUe4tbvCLJ3Og5v6u
	IRHfmfNg8Ni+Xa7W4+nuwSLwrK38SUJF/wrjDi26di9cW9BUSVuArXgB
X-Gm-Gg: AY/fxX5KytPfT0E3sSSUd+1jbNxc5DvLbI8x+LsQ71IIHO+k34ARCF0HymAf7Vd0WkC
	/WAEhhZZPAeUmZHXip0AgtO2Zt4if53SFW3LpN+y2UlhzRJ1EmEcImAbrkidikHmO53NUrliMRA
	s6ofXQMba2Lv9X52qjRaICxoXs7NItfAzO/mddjNH4qO69UnSV9xGu/4PYEKjOQR186F5JGlHdF
	gG9F3ohjMRk4gglBdbaUAPzpMkQqw63iya1kARiPYCxc5/NNT6yB9KcPw9zAUuAJjennQ0Mv8bq
	aDrI6ABC7ABEoAzuN8sPxRBTBxbFbCTnkPNVEPrvXVdVI2FClcP3Uza0tlUh3w5fofTHBmbQ/J+
	hBks1on3xJ1s2FCyAB7wC8KyzjSHpYXAeF1cB7kGY0Dw+QkMza5FGy5sujJqtazFD7mgWfxxVW6
	iENKP7K5lZRM6rkXVHEVM=
X-Google-Smtp-Source: AGHT+IGkQWfCACbqbbuCCFNQ2qKU8A9EFKMEKsAn+SUo7Bb1nABCAXucZJ/1Sbvypne34EZsM9fjtA==
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id d9443c01a7336-2a2f2736bc0mr15326595ad.36.1766122648538;
        Thu, 18 Dec 2025 21:37:28 -0800 (PST)
Received: from Barrys-MBP.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4d895sm9930215ad.54.2025.12.18.21.37.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Dec 2025 21:37:28 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org
Subject: [PATCH 3/6] arm64: Provide dcache_inval_poc_nosync helper
Date: Fri, 19 Dec 2025 13:36:55 +0800
Message-Id: <20251219053658.84978-4-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251219053658.84978-1-21cnbao@gmail.com>
References: <20251219053658.84978-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_213729_648418_C90DDB57 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: v-songbaohua@oppo.com, zhengtangquan@oppo.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, maz@kernel.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, surenb@google.com, ardb@kernel.org, linux-arm-kernel@lists.infradead.org
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


