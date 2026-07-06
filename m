Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8ACFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSbgaZameMZT6Pjy74Ve6SG9Gdi8KRbFPWTiDrhlMw0=; b=AkLV0/J3mZUfcJaBktcytQKvv5
	xYkIYjr69r8+XvZSNBO7y58TvEn2R5X8SbeGNiU1pVOQaiy0hcveU4CZo79tOifeK6QoUntkHd6g2
	kuHDNdp3OzKkNorRJtrhYyncK50EBDBVIf45G4//cBZEukwznjgBJfjLQ3mu0Dabu1yXpqLwR2tKF
	QhI4RcaqFshQje4+ef6en19xVOU+gpYrYpuLNyz8cO4eItKMSwOflC0N+UU+wHAQ9TlUKaTKWHobT
	O6xrHXCGHtmtmaUgR0Sr14VRGvifx7edEHLF/CAWpnExrqS0l6u9K4itvvnWlUulo1nItlzuPTUFB
	UZoNtBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevr-0000000Bs2K-2RBf;
	Mon, 06 Jul 2026 08:44:03 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgevp-0000000Bs10-0Fon
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 08:44:02 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so961875a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783327440; x=1783932240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSbgaZameMZT6Pjy74Ve6SG9Gdi8KRbFPWTiDrhlMw0=;
        b=VQQNq1nYUlt7DsE4aQwqLyehuQbpyvXo2zIKbifbnwSGWQQ2aJq5jPuHHyga9/ZXv5
         kKm0Bo7VfB5qV9JjhJV9y7VISQ3Zptvgi8tHAtWURmBTSRAUq0apCVzd/yqt1G0or8bl
         hhgTdVAYeMVz045KQxKLV9/+32fXsGW+vGWWSyjsmnV/FJ34JIRJV/NcJP8HfOIwPO1R
         FfGmBTBkXlVFBGl7QLtWQviwzbEYZCxnBowc5kVdt8L0tjRVz3kmXp9839Bvw09WDNtd
         yRL+OB7nIFXDoQvt7UCZO2qYBzdytigqp9JSnAqMF3RydrdjCYvouAXA3D/duM/L4SeP
         Xq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783327440; x=1783932240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KSbgaZameMZT6Pjy74Ve6SG9Gdi8KRbFPWTiDrhlMw0=;
        b=XkSqc7HiJFMeyCqUprVispHoWOF9zcoCmP1k2V7JcIUA4DQyydVPgEtPGgWtYbJBxb
         oYSuCSRxCOHDTBmNUxQv/uUTkWYg9nkDHmQIU2EAb/ZqwPaQk4ajb01J2T6kS1IquMEQ
         XLQRIJpWpYt51gJLrerihmAQsnYQBLU0PikA4g+ju+N74r1ZL3jQt8OPQ7tpoaRessZZ
         hz+6ihelSggpep/3o0fIhzjcwY5JMHeAB2zhXzwZCkrm5GGzcyfVnpr+mQQp7C0KICeF
         0fnH1xxWSdYucwBh/Lw0K56Gjja1nSxezFixqDOphYxoaYZ+RRUpvCO4/LZa5D62brns
         epwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rooe/0aa2TJf6Pwfbv223p+lqpy6L2/9zpuoLm9BjEpktp8laIwfPqLVlV1JvPcs16PQdAfsd1FTzdWg8vDeAoc@lists.infradead.org
X-Gm-Message-State: AOJu0YwcReBN3ekG70+0o28TK7Ibks4zAHI4PdBLl8hpfk5+YYQV03Rj
	fqXPySNV9glo0D9MLsQGoaApxKTHkU5nHiKVh+gRDJHjDwNoKFa4Lr5h
X-Gm-Gg: AfdE7cn7yIJZ6TEurl8wzoNQA1Ixvm2Gj5BOebawK4jlgZp8Qjd9YAS5L9jGiIoPxbR
	UsiFzYMTvCSzLrnGV//UT/HNDm/4jodQ5ueGScb9v0wCCIcc24vJeaCj7Z42eilmP6B4wuMaXqp
	YgBscKI3SGRhVHKSNx6N1FcJTwIGWUEag7WTflPfx/N/0xHekJx/cii4T5CgsJiWNSLWebKEiDI
	csOjOwXdvrsvW9WCdLMzBdbk4J22CVB/wjRtrnPixFczmIMbGx90THBb4noJUS9EicHzQ1q7ioU
	B/FQ2HzGq4niJY5uwqTDocL0ZzZitrRVgEsKkeD1iR2TiePzOw7YOAGmJEXzdR+NjnvLRmq05UP
	OI3AcvdC/VisUvx1YkvxZ0sMaSe0TutokX86lR2yi0htlH0hW0fwAF5sRiqQ8KiNeuNACZpno2/
	B4dPmJd0ixRr7k9OVAY1PUx+mm846Bz5yg4sRY1EdUdp0pHg==
X-Received: by 2002:a17:90b:1644:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-3833f2a317dmr6848505a91.6.1783327440316;
        Mon, 06 Jul 2026 01:44:00 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3812815c10fsm4524635a91.13.2026.07.06.01.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 01:43:59 -0700 (PDT)
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
	baohua@kernel.org,
	shanghaoqiang@xiaomi.com,
	Wen Jiang <jiangwen6@xiaomi.com>,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v5 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Mon,  6 Jul 2026 16:42:28 +0800
Message-Id: <20260706084232.177786-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706084232.177786-1-jiangwen6@xiaomi.com>
References: <20260706084232.177786-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_014401_111987_9F09DF0B 
X-CRM114-Status: GOOD (  11.51  )
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

Allow arch_vmap_pte_range_map_size to batch across multiple CONT_PTE
blocks, reducing both PTE setup and TLB flush iterations.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..7d9c7dc795c42 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,6 +23,8 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
@@ -40,7 +42,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = rounddown_pow_of_two(size);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


