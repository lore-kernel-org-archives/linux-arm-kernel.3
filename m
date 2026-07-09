Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F17CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClBPAUdo6N5oJZIf4ypP10hp87KU/iyoMuoMwuvEL3A=; b=sspUMWcrAWUugqemR8yIBLyCXE
	aSLB8cou7ArP78mtlb+Y840UJwoQ1F1x8bv6q2TL5qwk2TsH2ff5FOak6c7p0eSrPsbCvsFHTzV61
	SvdsG4QMaAztUQ79jxisulHRx49MfL2LPzhRAJrfagyaYZ+PJa8qgIg2v2yus2rXX1ZSke24IDG4Q
	r63sgwe5O6KI/G/zKZViizFwonJlcGgiP+CEenreQ8xT1wSF88G9tDbdJjlgOSQ2dnF+YbiiMxxvw
	xGKIVuwIBqTCh1TlYgSHjYsg0EwGDV68KlrWF7ZZeg+koeRp8lLcy5AntDjHhKXi23zi3YiJoV53M
	jSzQXtsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLj-00000001KHm-2GCC;
	Thu, 09 Jul 2026 07:39:11 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLh-00000001KFw-0mNK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:39:10 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8484a0b998fso1508547b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582748; x=1784187548; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ClBPAUdo6N5oJZIf4ypP10hp87KU/iyoMuoMwuvEL3A=;
        b=VvzRjF8KBcx5PiYg21CG2XHVWKOiycsRIXcHMFOy19JwC5L3AIPzWawbIXekxfsLXx
         B7uyuBi3AP0XovRO9qA+0VYr7H6liXGylKxAyv6l/epwKnT2uXzFG4430d7QfMkGxeyO
         tmrIrv+OQyjNvBgcI6DOO0pdmDLDLq9fNwmHah2QjL3UVtOdX8spt9p3gjpp4HC9i1i0
         YlIW/biCBrlTlkpBaOpU8cSWDx5WMhe6qL8ad9I1eD9lMVkhDnJFbFvZFg2JKcwqXodA
         aw/pzmCFTNBwpnIUJj2YXr/Khu9uHobmy4gu8wdIypNKdDHLLn9nOeoFrbiP7gNVCGFN
         p4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582748; x=1784187548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ClBPAUdo6N5oJZIf4ypP10hp87KU/iyoMuoMwuvEL3A=;
        b=DSf7O0+0d7rCzt0oSiNtHbQikAoI+jKOgkFRC+EZn3cisB9hG5otE79+/SzyADZCXG
         RBHSQc6mR98qjOUNHuG4hsq+3sxceGKYMQDxed4OsR2rez/97uRwAqKDAIf7Bpfj3kGn
         m0DeZyC/N1WOmsIHKBYFlTRFj37DcAvMXvpqYS2zOlAujIsfU4qb8cCW9L+pkFghemQf
         2mkCFTJZAkFM/nDdXWbqrcAOv2DiDtrDBFR6wS5md94fJ3VlUx1+C0+CmfGQCy+Xsq5X
         iAC1RfBYHafPPhSUe2MMPMG4LwcR0H5TX0UL29fyTmwsv3FgUbnyDzKpCAnEzlFbuCi+
         g62w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/v7GwG6EYg3NelZ2fcS0kQuKgH2GbP1w4588gJNrbt/TFhMpwFCybTodz9GLImbj2WF3qBRNUBPwy9s7qXGk5@lists.infradead.org
X-Gm-Message-State: AOJu0YzgYymu08qNl7hK6CeH2YSxaAEavvod1q44W431N0v3/Ltyjgnn
	vljXG9FpB63XJ/vf40PGp9R0AYZ6hj3T2t9BPQPn7IxVbmeJc+OXukX2
X-Gm-Gg: AfdE7clQVpV6ylxzHY/RFdBMt11OXJGQcdD8/k0J1+U8YkhfUMjnAcBqPFnoGYB/+j4
	qGJCoSWxS+Mq/8P2LCC1r1nMyQnHUriKCxr+BLsT4KGCNnePx935XB2zx/zVSn+FaMO47srw5ks
	POAv9gUIqI8uPNdeu2JXXJfX46b8lD21AwyPzkjcWXIed79ydVVW/poYagtmKuzmkrs5ZVTGpZ7
	r1KrlxRqlP2sr78wki/I0rjmM2TAIYSgqQRpGDaZodWjjRXxzbOp6W5koEuU9FcKvkjwihbl4dy
	AaPgnCakzbR+VUlSXA+tKIuK5Nu7MSL8mFw9qxz5JkQ2uJlFAz3Dw+Rr+S56WcXbvtCziY31Ns4
	u5USbbh+HFpCktdJWpNxc5EXTrr7fvKYzTvn0sM93P/gUF1b2StBeMnXXSszM7fWHHKOh2MukdB
	URvcJutT1evxOWC0Gicmwp+vb2SlUVPCGvMGM=
X-Received: by 2002:a05:6a00:2e07:b0:847:7f38:27ad with SMTP id d2e1a72fcca58-848438a7e6amr5640848b3a.53.1783582748319;
        Thu, 09 Jul 2026 00:39:08 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:39:07 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	david@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>,
	Leo Yan <leo.yan@arm.com>
Subject: [PATCH v6 6/6] mm/vmalloc: align vm_area so vmap() can batch mappings
Date: Thu,  9 Jul 2026 15:38:23 +0800
Message-Id: <20260709073823.6643-7-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709073823.6643-1-jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003909_231728_27A70EC1 
X-CRM114-Status: GOOD (  13.13  )
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
PTE entries. We do not expect any significant overhead for
this.

Add __get_vm_area_node_aligned_caller() as a wrapper over
__get_vm_area_node() to simplify repeated calls with fixed
arguments.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index db0492151ad08..2ac805cdf18ad 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3314,6 +3314,14 @@ struct vm_struct *get_vm_area_caller(unsigned long size, unsigned long flags,
 				  NUMA_NO_NODE, GFP_KERNEL, caller);
 }
 
+static struct vm_struct *__get_vm_area_node_aligned_caller(unsigned long size,
+		unsigned long align, unsigned long flags, const void *caller)
+{
+	return __get_vm_area_node(size, align, PAGE_SHIFT, flags,
+				  VMALLOC_START, VMALLOC_END,
+				  NUMA_NO_NODE, GFP_KERNEL, caller);
+}
+
 /**
  * find_vm_area - find a continuous kernel virtual area
  * @addr:	  base address
@@ -3626,6 +3634,30 @@ static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
 	return err;
 }
 
+static struct vm_struct *vmap_get_aligned_vm_area(unsigned long size,
+		unsigned long flags, pgprot_t prot, const void *caller)
+{
+	struct vm_struct *vm_area;
+	unsigned int shift;
+
+	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE) {
+		vm_area = __get_vm_area_node_aligned_caller(size, PMD_SIZE,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	shift = arch_vmap_pte_supported_shift(size);
+	if (shift > PAGE_SHIFT) {
+		vm_area = __get_vm_area_node_aligned_caller(size, 1UL << shift,
+				flags, caller);
+		if (vm_area)
+			return vm_area;
+	}
+
+	return __get_vm_area_node_aligned_caller(size, PAGE_SIZE, flags, caller);
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3664,7 +3696,8 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	size = (unsigned long)count << PAGE_SHIFT;
-	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
+	area = vmap_get_aligned_vm_area(size, flags, prot,
+				__builtin_return_address(0));
 	if (!area)
 		return NULL;
 
-- 
2.34.1


