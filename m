Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD58CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 02:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6qoeYX7P7dZob4Bvz9VKgpFSbzrkhmCImjfBPhgn1s=; b=dMYw8Ap5/+MO8Q
	cwvfSi1CT4Po417VvQzyFPt++9+vnEEDYFuQhrm4po7Dlgf8r9fOgGPG/ySyC/9fTI0rG56D+89jp
	zGt+0c0FrrjNbO4yosVUFNyTpSLdtYPBPW25fxPrECDyGgi251+xCCquCunJqzsJg3mQtNkV+3ZLB
	fCTI1wLjNL7Ev8XCVc/ux0hl2VEWhWft2rMMgj/DXwtYirOF4A5MBu5cYVeWziMvTp5YX4lltq6th
	VL32XLkUJVdgI2vIfXUO1zraLnlOIa116xIn6wdvYiUDGEt+al4EwVnlFnQlWBJ1p6Hv0bv+ak+GT
	/EAwP+RVrNCrjgb3ozNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyw-0000000Gyxj-2SqI;
	Wed, 29 Oct 2025 02:32:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDvyp-0000000GyvN-2aTm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 02:32:08 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-340299fe579so1922105a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 19:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761705127; x=1762309927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6qoeYX7P7dZob4Bvz9VKgpFSbzrkhmCImjfBPhgn1s=;
        b=GTuo8Ql7vQSvH4xR1ENJQFd6TwMp7gD4Ue/vCUO6hjwnpGorze+nZVCDN/d8SYNC9B
         fTA88SwYXqk0SF62snQiLdWeXA83g0zaMoPCoJnEhH+aEO3BUQZ34Q/sTdQiuqCfWAAG
         pWZ4pZIsrFjOSsz4pU4Eks1eIOAG6EOOfmBO5DfSlGfgPm3Oke8QTKfbdk/jtvCeddX0
         6m4XRIUYyvr2m4wrN78fbhNeP+KYvPHhhHMcwJk2b4toHe6BVWxWjB/r7t130gPSspFs
         VPqyYJWA30JIRar3OHJKE6O5oPtoPlvaY81mVAhtamNZQa9ODp2kLQNGfNp+N53M/K4r
         QXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761705127; x=1762309927;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6qoeYX7P7dZob4Bvz9VKgpFSbzrkhmCImjfBPhgn1s=;
        b=VYZO48XOd8fYblqP8ceXXSixDg88qg3+9Tli6qgYkgqZxdU6sDF3IP5y3eMj8NxYF4
         JU2ndXNdLpuTgJv73Mw6CPUbInQ4INIrb8JJI2JDpj+SpfJ8HQhkb8/EkgEFIKKRThQ2
         FPkWNdkSvvA9Np8ig2j0yU0Cq2tDO+IolfFTjacafS8JhZ39W5le+rjUSVLM3WVwtmo3
         lFeGA2P+lT9I7OVRFMrL6KkHaiLMkJvUEt8LNSVFYqbuP2ntsxAV5GZi7+Ffdh0APXSL
         xEP6IndM08AVFBuFlpgHW+hEhIARAirB+FwhxuFuSCjG6UlI5AMFhcSfwUDQrbGG/oy6
         7DUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8vpFoCqEHQm3lNbzqk6kXTMUtNl+WHA/btbGDt6yiA0+OdedJCH3DXdMt2lxYujj+kP9mXyLv8y1ImsInSnhQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzpnUhm/JoNfmmrm6Qkg1tnj2GuYqSzOUpOJYsSGgxmoq3AiJKJ
	2ioWZO0w7fFPIfiLs7LgrC4R4rNfI5HkUXbQq2pXGUByuqBZzWDAjJM1
X-Gm-Gg: ASbGnctpBjHppus3mU+39GprvBvjS+cqTEwpP+4qLAP2P11Adc2cfjWERl8pgAcfuOF
	RelgrDsmSUotfo8E0RgWpY8QJDOK3sAhmCGQWoiKG5XzjCKdQfvYAaSfKBiWuLb44TCnSXx0gKL
	4Wpnmx6xII/9O/veJMtEB5mwtd8+f52kcdpUeYSYqL2bqT+SrftT3ERRDBmEw7U0auQ9P9DenTL
	exs94VfUoKe+jNddHdULW1Mlu/JRQnquJXVBPXrTNLzMHIHCCnBZcrgJvYBEfHa6eEMdMOxSkyA
	3jEQfMLbd8JiSGaoSy7g9DwtlPO6oldUpKYkJO447wgb8mhb/32GTuV99anDUT5A7CEWnNPuYUr
	e37wrgQ735fLz/vm658yUgyMe1q5T7AF99jeI4Ux9Utg5a6Eb0x2G0u57hpKQ9AQ1W+IfCnk1WS
	giGCl+EGK1wp8x8E76UIpyyd9Xyc31zLC6asyxVBtBgBKPzZIcIlY66rpaEA==
X-Google-Smtp-Source: AGHT+IELIohm+a85sePD0UFgSVnJbmnjewzzZy+ustTJJxjo6UFTuJaxy6bk5m8Cbv3z6kHyDqZwZg==
X-Received: by 2002:a17:90b:5285:b0:32d:e75a:5009 with SMTP id 98e67ed59e1d1-3403a15d171mr1418626a91.1.1761705126491;
        Tue, 28 Oct 2025 19:32:06 -0700 (PDT)
Received: from localhost.localdomain ([47.72.128.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81a4afsm13649518a91.19.2025.10.28.19.32.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 28 Oct 2025 19:32:05 -0700 (PDT)
From: Barry Song <21cnbao@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 2/5] arm64: Provide dcache_clean_poc_nosync helper
Date: Wed, 29 Oct 2025 10:31:12 +0800
Message-Id: <20251029023115.22809-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251029023115.22809-1-21cnbao@gmail.com>
References: <20251029023115.22809-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_193207_664276_D944E422 
X-CRM114-Status: GOOD (  12.72  )
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

dcache_clean_poc_nosync does not wait for the data cache clean to
complete. Later, we wait for completion of all scatter-gather entries
together.

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


