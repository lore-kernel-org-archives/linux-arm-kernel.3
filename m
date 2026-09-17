Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDFEC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 05:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=; b=IG4hE9dK1mEKtT5QGLOxnNyWLL
	cINfofXYqZktNevzMTVcNMu9z/wMQghpw4QY+5ZdguLPch8ehEh8vcZOnSFeqPZYbqQ/GzqVwFiST
	QWfclNUsiN/lnUROdI2/JR0exIQd6ZLGmnogw62vTkto2JlH+PjFCj8Yr5IGOu2ZM8ehQG0Og7O4E
	VmBTaXwugT7EOHtbtTKnH5ZkL7k+I8sKzwCQ1ZOuPceROIY+TAxbWCZmRsGAI6KUqtUHSalHHatHK
	M1EWiPy75L6H2fE/7rQl2AZY5UYhhgUzJakwzDm9tVhsLfq9U0JWZ4EbOI/PU1N5ZpwLKbNZmIx5Z
	iTzW93/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hU-0000000AbEy-1ywU;
	Thu, 17 Sep 2026 05:30:24 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x74hP-0000000AbCb-3vDM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 05:30:22 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so362894a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789623019; x=1790227819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=kM6BD2whrxJe9Rxxn/2ggiafm233tSSwd3izOdvTmFGSmt2X8vGqYCzKNQWW4DI2/6
         +4VCljitHCA23m81zIAgECpBO+EjbrMGcYKadQJPXogpQANfCb/HZce4EWyZbcfPt5dx
         T7kcxkAzPef/VEOQhMKI47kalSbADNrf+qWZeIsZmZ3sR/Zl6ueia4wbk92A4h/LyIXw
         Pr6IU0c71bwkIAHlXXgLRcyHs2TxAQPpd0zqA1EK+pZ+ATF7/vH9SnEC84F4K/jHqz3X
         AZ47902aGPF6QiDyhYdhtFC/mJ+dsMPqKj56Eb6ohyWnTGCpdUbsDO+ahm9UCifFFlXI
         CuGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789623019; x=1790227819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRHIBzX1Ph+VWLlGic49OjVgc6epG84F5iB9tVuXpJQ=;
        b=Svy/Xfw1GaJMNqXGxJCLkWyvXa7Bqok4fo2hLp0zZAhQW9mOffuSpv/Z5Q8x5xyIhw
         EZmaer2PFOGEM3pIKiE+kz3FH7cLkgMTx+KMwqUva5g1hBJMMxydbqPtA4RDujKl9pMI
         RfZJSw0NvjDYIAT9AyJ0z889bg9/3Yl2ZWNn6Pj5TBquHpiw7E/bG+eMuj20jtPHBYBP
         82jl49H86DglM+QjyDphRaiNRVQim0o6ZC3KyIB73ZpBpq36bjizHU0LfUrNgEyxU493
         DlXNR/7aTH83BPixve0577/uK8f/pb/IVuHeCCQB5w4Fl7IjzbYQQr2ITO4aX1CFSsrn
         mFOg==
X-Forwarded-Encrypted: i=1; AKwUvBxsKLUamN8QJjd+oU2/LjXSS3tESjqIUbzhIigyAGr1eNAb/IpX5ASqudyoYCQvH3BAqvs977BHLZT/iJBmvGLu@lists.infradead.org
X-Gm-Message-State: AFuF++kr6rY71KIOmFTnvcVAVKNzh7d9djr1a/3942INyKE5IYw/GGQI
	UQIHAOFsV3WNDddwhGGyae7zYp4MKL0gOce+enjnZP9vO8OZhQM1iMxs
X-Gm-Gg: AYBFou2ARloOsBPvzs6vy6CRbvj9ZKPH1/R17FT3AIqRYHBEyDTKUZ5xdBgPc5103Tw
	T49c8msjD04pJiG+jMGSi26HRCjsi9EB8cC/Pw494WeGHuK9un/sOR2YZnp0FHgmHlx0nHZhjq0
	99H4lZmEQ9+LwG2XhrOb2xOOYesT39VkjQfoH4mkAZqBuUFhbJjPMA5amEPGPgEQCsLJ5kbdSJo
	i6CI/AgYELbcZ9D89xVgMbd4DQ+y5pviLvhW/Acy8uwXRPUoniKwjr57TYTpgRJejg1HsA6n0mM
	0/gRGyjjfp2cuUHW5jFf0qICyx9P3/d/98YgD9/x0vZxTCRXYXk87lmLnJeZbcHyD1QM4WOj+pu
	RTTdj6LezYWO9j83OPDXqNb6Mn0atlu27bM9kvUHHQnbwmwSuDuDU+2yHNyRArs6OaMZW8M8nbG
	FTwk+9jJqkuJ3nZoGxa5LvIL/VU7oi+eckTQc9PinKx3jAmLmtnxICdwIEr1TVirhPk8aQAlLIf
	Y1U4jVsMQgY6msDXYSGjT3NQnvjopK/96aIOg==
X-Received: by 2002:a17:90a:d644:b0:39e:288:80c9 with SMTP id 98e67ed59e1d1-39e1e4d3fd1mr12367022a91.19.1789623018896;
        Wed, 16 Sep 2026 22:30:18 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3abada87sm1955836a91.14.2026.09.16.22.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:30:18 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v8 05/10] arm64/vmalloc: allow arch_vmap_pte_range_map_size() to batch multiple CONT_PTE
Date: Thu, 17 Sep 2026 13:29:28 +0800
Message-Id: <20260917052933.188679-6-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_223020_013428_9C09662F 
X-CRM114-Status: GOOD (  12.61  )
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

For CONT_PTE_SIZE-aligned ranges, return a mapping size that may cover
multiple CONT_PTE blocks, capped below PMD_SIZE. These sizes are vmalloc
mapping spans, not HugeTLB hstate sizes.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
---
 arch/arm64/include/asm/vmalloc.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 4ec1acd3c1b34..4053b1ec1902e 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -23,10 +23,14 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 						unsigned long end, u64 pfn,
 						unsigned int max_page_shift)
 {
+	unsigned long size;
+
 	/*
 	 * If the block is at least CONT_PTE_SIZE in size, and is naturally
 	 * aligned in both virtual and physical space, then we can pte-map the
 	 * block using the PTE_CONT bit for more efficient use of the TLB.
+	 * The returned mapping size may cover multiple CONT_PTE_SIZE blocks,
+	 * capped below PMD_SIZE.
 	 */
 	if (max_page_shift < CONT_PTE_SHIFT)
 		return PAGE_SIZE;
@@ -40,7 +44,9 @@ static inline unsigned long arch_vmap_pte_range_map_size(unsigned long addr,
 	if (!IS_ALIGNED(PFN_PHYS(pfn), CONT_PTE_SIZE))
 		return PAGE_SIZE;
 
-	return CONT_PTE_SIZE;
+	size = min3(end - addr, 1UL << max_page_shift, PMD_SIZE >> 1);
+	size = round_down(size, CONT_PTE_SIZE);
+	return size;
 }
 
 #define arch_vmap_pte_range_unmap_size arch_vmap_pte_range_unmap_size
-- 
2.34.1


