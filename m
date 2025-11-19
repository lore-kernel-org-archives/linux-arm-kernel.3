Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6854DCF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=; b=EWDkx3C3x42Nx7icBgH6ElcOEg
	C8j7g5+WFOxBMKS5ab4/Xzw4LDtmhnyvLBz/4NrSA8TszePIstIRiB28Ikvv1aH0CD38oatIXrzR4
	hcWz03oIfrUWFor4M085IisBNOPBlIqAHE2eDvPKEHXyk6w5TSKaBByRKnCa86IYwu1ZIWDOv3OBn
	+5Z1B67AnhsQ56y28XTmyo1MJLc1RQtH655+ajgt5BmEsbJ3cKpu2BALKnkbdayqPt8eEV5q2p+em
	XP37flN1La7r9uAhV7qG//+8d8qBtzxL/i+ulHjykeRruu8gWRCOl4FWbR6Bf/Lz51fxRwvqnM7f2
	K3G4an9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkOD-00000003XMl-1CfS;
	Wed, 19 Nov 2025 15:46:37 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNV-00000003WTa-1xN2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:54 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42b566859ecso5397284f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567152; x=1764171952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=VCa6+oFhNVUdhJbWLswJLumavZjX4BzbSybBjTnPld6lDqpFmINu6KGXfvDtmbZ0k7
         81EG29a2gglQQMN28RYs5NOY6ccCRqH6AbelOkKMFlTG8sJd5P+VjdWAXiWDaSy2H9q1
         HvHDz66I1xMgjt4EkjHtKktfVacWANaDAnuJhN5PBHQectK24O9fgxOHOd/rKAwYGYVf
         nKJHDNJ11iLT0PZGsqwZnWTOcmQE3dlqpCZ23xY1+rgZ0jFBxhMG5uHdzigpkA8uNpxC
         Ns9dWArs6KBZKenHO62utYKMRW4xjqgodAM7I2iIKmXAQxCQuSRnCtj74T89fFiRx8SL
         N6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567152; x=1764171952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uk1lFWru0IGdhKwRKbnhtV9p6FImm0O6RRZYNI9uc9w=;
        b=RrYpu4CZ6vPUkx3APLwjiS6CD60nw2ze0rtoqHq6e/gsZIjnnG5CGFQ5sjS43ji9Ty
         hIKx/BQaFnxxDv+477s1JmhOjSb/tDTnr3VsWGY73QcP0mopRbbYRX41pMpBlNIPKt+l
         xFIfxbuj7W0cAmfKApQ1qe9AxMyeN+DXutYUZY2oYRS+cPskJWeO5DtrGSeVC9vIZg93
         awnew6US1jp7xwtLgA+Ig5r0ZUg8Klc0LVL3LGd7P9LsLQ9En9eUVcM5ZCseeYk4y9D7
         9dFXDkTVf3PpW8IrO4+5oJiCIzUO01JeE6SM2gwPdDMh6eqqFXoS5PG71agcd0OVh6zE
         7xzw==
X-Forwarded-Encrypted: i=1; AJvYcCWKe0e9yyOLWhXYGMsOeuTZAsLZw0K3EZ7sHiH57g9x04+bnuFwDjkA+jgC5cWoWoC7jkN3ZIxKA5hY3zrXQqDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwAmY+wmRi2jTSvVULn5zWI/vUgG5V2yO1xoZFFh75YIsMisGm0
	7TIkvswjseTQxZT8CPiigxpaJ5NJZ2phTppy0vzXBCO1TmoufSb3KKmCwCdwDtRkPyQ=
X-Gm-Gg: ASbGncuB3HWf7CKHuqMGgk+9WqrUST9lsY8Jfi9qlP9niFGduAFtiT9vziUszBDtS0v
	+5FR+48mtnS4EakDoQ1lBruTzZ2LO5XGbBnCw0YQ2bbLleC8F+T2qLJHNXDWkvfzzd4HUgq99Jd
	7bh1repNL4HwoIF20C2ZqJKfeI4GI9sA/NZrumgPDVNH3pIQ5zOZ1CmrL5FA3snJJ3oV7ZWEDDa
	WUclBrUOULBbbeZFmrIjtTNGAGYnGjgg7SV63qk74sRxzZPsgqjlfiIteUddhoWWxoMRGEyxIv8
	7bzPNwmoFjR/GAES0NlRKGfKEWfGnAuhg/vpdkn1pCRZDsqZmxq4+ud5wqSJygDg4CbbLVsdBip
	h4Ulibl53Jxm8lkd92FBWzX5Kukr49hvav/PEzIf6kuqP2SuPGnQCCHDqjxkfkj8CitAlLfLxUr
	fFjw0Z4EhSlM25lFMnERoWHcCT/eebFQ==
X-Google-Smtp-Source: AGHT+IGiIxmeqrKKXMpyNCEgyddWcck0X4KYjA7E97PFt6A4ulW3WkSU04Vt6omGLvNuAQXzgiycDA==
X-Received: by 2002:a05:6000:2888:b0:42b:3ab7:b8b9 with SMTP id ffacd0b85a97d-42b5934db2cmr19180692f8f.20.1763567151698;
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:51 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 20/26] mm/sparse: Register information into meminspect
Date: Wed, 19 Nov 2025 17:44:21 +0200
Message-ID: <20251119154427.1033475-21-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074553_527572_1515EAC2 
X-CRM114-Status: GOOD (  11.10  )
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

Annotate vital static information into meminspect:
 - mem_section

Information on these variables is stored into inspection table.

Register dynamic information into meminspect:
 - section
 - mem_section_usage

This information is being allocated for each node, so call
memblock_mark_inspect to mark the block accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/sparse.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/sparse.c b/mm/sparse.c
index 17c50a6415c2..80530e39c8b2 100644
--- a/mm/sparse.c
+++ b/mm/sparse.c
@@ -15,6 +15,7 @@
 #include <linux/swapops.h>
 #include <linux/bootmem_info.h>
 #include <linux/vmstat.h>
+#include <linux/meminspect.h>
 #include "internal.h"
 #include <asm/dma.h>
 
@@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
 	____cacheline_internodealigned_in_smp;
 #endif
 EXPORT_SYMBOL(mem_section);
+MEMINSPECT_SIMPLE_ENTRY(mem_section);
 
 #ifdef NODE_NOT_IN_PAGE_FLAGS
 /*
@@ -253,6 +255,7 @@ static void __init memblocks_present(void)
 		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
 		align = 1 << (INTERNODE_CACHE_SHIFT);
 		mem_section = memblock_alloc_or_panic(size, align);
+		memblock_mark_inspect(virt_to_phys(mem_section), size);
 	}
 #endif
 
@@ -343,6 +346,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
 		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
 		goto again;
 	}
+	memblock_mark_inspect(virt_to_phys(usage), size);
 	return usage;
 }
 
-- 
2.43.0


