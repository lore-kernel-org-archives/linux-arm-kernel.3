Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26869CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 05:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQMTpgiyndvYCOhmYu3e/1AOf7TgYGQa7r62/XlPc6Q=; b=SufEAZdkGl0XA+bD4kdXp8sRPI
	LE/jGyvh+52+e7TWO0dxz7QRVWIwNJMEbTjAoMfxvF2f/uTncNWVBWz6qLDkPsHQU/8NX4Hz/T+XH
	0268O64Jyf4d6vmZ6PI6+0++PUOZNDsQoKpO49Nzs+lHYRxUeD6kYBtkDCOsi6exBgg1/mPH2hKZc
	OtjVGDBwTvDpO3BljVff/I8ajWUlGJxH0Sfkgqybc2WzzhK/Zz4JTthSDPwLBShPkl0brzQcK9TJB
	NJj40A7bvWDfCsHeJJO99TrZBDTQxmELsk0eIRI+diY+p31l7wKpdXCXIRqPM3sWp0mE7N7QBblkY
	An1jo6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUm-00000009rpM-2YYn;
	Fri, 22 May 2026 05:32:28 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQIUg-00000009rj1-0iVl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 05:32:23 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bd2051167eso32367895ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 22:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779427941; x=1780032741; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZQMTpgiyndvYCOhmYu3e/1AOf7TgYGQa7r62/XlPc6Q=;
        b=qEtzzOHqmmVeBGxCfYQ6siXfMw8ha9DKuG8yHC0i5EnVGZpL+BGh4/+tlzQ7FZUxaF
         NsQMNuZgmdbokTlqiIKMET21NqiKZsAw8l6ZbUBD4NSRGGELUmZ877tKKFxeDw8snTAx
         XjTXLefAW6142nbvwxBARTroHXNv4tF7Kk+EXVDm/sYZS55mmK9meV0yGPJl055ggvCX
         2D6/40+jWx1IvkBTYBxWejNMfHwIIsW7OFZkcY6RTaXmJwRGJ71dTTQgtKv5z+6Rx48Y
         k/jnhW8vmwITOU4M7EjQIO5kOBP7WA4THXAm86mYMWeh9+8gTxdLMKqmevbjBGAyBKnM
         g63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779427941; x=1780032741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZQMTpgiyndvYCOhmYu3e/1AOf7TgYGQa7r62/XlPc6Q=;
        b=lr4p5HYqnL0aeyv5+PxE10W5Ohw5WrlkLMZNeCW9LTWqB1DuwNnfdF+DU1VMDwo0TE
         kbfwjyqhjkYg2tqRZy81p6Fy9zH0zLGBYGxFYkJx4yhWgio6Tc1WJohHX9I3tmjYSPL3
         c3jWmqZ4NvhjYGlOQkNdiUZzHVtDCK09xvfQ48oRpsscchmQN2OcUI0RAuXPdB44w3TQ
         63MActXGOQwb4s3kvmSi9fsRPr2DTduZFzxP1mu1Qg4gxEpEBEVL5JH5Vt+q5fJLM0Rx
         3Eng61u00Y9v4pXeYOe2eMZJ2XntzMuRSFACGEn+LuHBF2tGxuf4eWo2bXFCc3+SQWO9
         Z9dQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GM8FFyHcFLhj+a1XchSzOgWZckJFsDL0E07Tfm+pGEgiztA6zgrerIZ60aYDQM3zDYwYeaK98U7UZSXurGwW1@lists.infradead.org
X-Gm-Message-State: AOJu0YzE0d9v9lWQL7R0DPTNiDBVmrVNx6XKXHCjhL+8TO6olNHxtm+/
	KAw08ns2LpkZqwc8J5wov/3NJyq7gG9Zf5/YKXgoTkDjTxXQoDwcJXs8
X-Gm-Gg: Acq92OEQpDsqVKQnR8HwGHgOifkT8ooYfHwvjIdr9UqZctcURyd77lO2N9NyoWe3ChB
	1U5bldI39KFv2qdP5bUeN7MijCwEOjlJLVdTVWLSnlM8BJj3sBrK7o0dHEHD3GNSI66I+/Wm0a8
	S4V/3VO3Jx6AtlVPl+FaEA0+Ea9IfZVoFQ0Dyezx45N3pf85Z970zgnlv5HNvxE0p85IcHJSIcE
	WejIoA/w2fr9ZVehvWoIsAM0/SJWe4FX3sHA6ZQK5wdUfXDYSV8ZXYjf1yRY3sFFqGRW7VWJIyw
	eCgAHojzbWl83C2iEehmURdU2SIKZpFavEK6Uc7IrJCDD/y6TIt3MU2aVNcP3QJvmIJtbQxaC8E
	IrtXPA6fiQJIEibPbf7/3NXCWOFEiLSOAf6in+GnWhTlObcGQTQyd27b2eAyI1XgkYPJk4Je/QS
	+5/jKkwzdC/85gIt88iAtxVzSQkER58yMvNk3m+VAX6mDNEw0gWCiiJZAZ3HPJ3w==
X-Received: by 2002:a17:902:cec7:b0:2b2:ccfb:8387 with SMTP id d9443c01a7336-2beb0613c3bmr23217405ad.28.1779427941298;
        Thu, 21 May 2026 22:32:21 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm4782665ad.32.2026.05.21.22.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 22:32:20 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com
Subject: [PATCH v3 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Fri, 22 May 2026 13:31:46 +0800
Message-Id: <20260522053146.83209-7-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_223222_216629_B118A03F 
X-CRM114-Status: GOOD (  13.56  )
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

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

Try to align the vmap virtual address to PMD_SHIFT or a
larger PTE mapping size hinted by the architecture, so
contiguous pages can be batch-mapped when setting PMD or
PTE entries.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 mm/vmalloc.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 50642246f4d40..040d400928aab 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3620,6 +3620,37 @@ static int vmap_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *get_aligned_vm_area(unsigned long size,
+		unsigned long flags, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	/* Try PMD alignment for large sizes */
+	if (size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node(size, PMD_SIZE, PAGE_SHIFT, flags,
+				VMALLOC_START, VMALLOC_END,
+				NUMA_NO_NODE, GFP_KERNEL, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	/* Try CONT_PTE alignment */
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node(size, 1UL << shift, PAGE_SHIFT, flags,
+				VMALLOC_START, VMALLOC_END,
+				NUMA_NO_NODE, GFP_KERNEL, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	/* Fall back to page alignment */
+	return __get_vm_area_node(size, PAGE_SIZE, PAGE_SHIFT, flags,
+			VMALLOC_START, VMALLOC_END,
+			NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3658,7 +3689,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = get_aligned_vm_area(size, flags, __builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


