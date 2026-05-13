Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E854CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 17:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nopguKsMEYrA9EWHZGiXTC9SGVUEshJRNjsVrcyWWAw=; b=v6fs4yT3itSt57nJ3NM4zP+x3q
	d2+QF/Uu5HPnMnam1XiiKP7wAM1VXDKjhh2khom3pVX2jVMI6D65j3Oe8oRT55a5CYtq8dG/YXygV
	XAUHNdNHeVJkSP/bH/qAIh8ZSZUlXB1KIJS4XWHfMTCaghZsWd36iNGrwkSvmlJRU5sAgNKRGHXGs
	pObBx3NtIcplak1XT9lt91nPL7lUR+txpK1K9yK247Dz9ZNrSBCgTz00bUZXTN/gAtMENzC1Ioxtw
	wVkFYXndLflj05540fNsMCx3M5QPlBOPPQFPx+NrXJtrzPW0OlBr4xcWZy2SjLniiWm9Xq28+Tpqv
	kdS/38cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCxM-00000003HyZ-153z;
	Wed, 13 May 2026 17:01:12 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCxJ-00000003Hxw-2cdV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 17:01:10 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so3891221a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 10:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778691668; x=1779296468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nopguKsMEYrA9EWHZGiXTC9SGVUEshJRNjsVrcyWWAw=;
        b=bmKR2FYa/9YllnMRckxV+hUKdBv6qWbkf7EcPRWqakX+xh04baeiEKFgKC5NF9xYDQ
         LXSw8JXmCvBnr4DBbycGpPqPtM4a7ZJkit1DUIgQa1Sy5Smq2dhGmJAFE2D64Nfs273Z
         EN5r8DQGMnm9RPcLm5vRVcCUNqe/6MdFLyXJrGD42cCOH802QwR4NKo9OK3fQIDRz+BG
         uV+SmEg7WIJDbdNOupiKVXFG4GHLPZEBxLYE+Vw6Yc3vGO2U0JMoQ5MwC2BiQ6EONV+5
         /Xej6Gk5rsngRzLuNN3obUC9BUNVc8dMjR58eOY1U7+jRoX8koxYFryAoYfe31rsH5C8
         g49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691668; x=1779296468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nopguKsMEYrA9EWHZGiXTC9SGVUEshJRNjsVrcyWWAw=;
        b=nJk3foYZ+2BWeBQHmXUIpK9OQQu7vLHN9/VRLBX9IpqPGq8ACeOSKH+dcBTmX9YY+Q
         QK7whd6aY7BYFRVicoG2zjl7Mg/sVo/ZMtqM0K78dJgIYBRoWimyRX4H5NYtGPv/6vS9
         DWqIeEASRhBb1Qd5VmTIL2A6AqV5SzqKtwmnPCz+OuSdcTqn8RTsef8dDztuF2iuWtHr
         h8vyYVQndiLcOZduHM87kUUR8yzkRahhucDNJpmvd9YVx2hlxHAtHGsoJzTJzC+vEUEL
         ivjq/HbBZJeQYee6nUlKJFKJyZwwUH9BWVHZKIyB+rC/B1WAEP6mZw9nkNm6WZPVTk+N
         SvsA==
X-Gm-Message-State: AOJu0YxyA2IYOyI2Wc7v9M66CxVfarvM1jqAR9T3Fgx7S3htntC1uorf
	HVxUZJyqJsOfl2+e8J/dj6DTj5iajDR4tRriJ4Hi+XqjtaovVETTwYwB
X-Gm-Gg: Acq92OH4kLUp1k9oyu2B5pXFflWkHdcblBBLV37+ldOqN0X63voEQZloyuqqDFqK1RE
	RLbd4jp+A3bkxCl0lJOlxLLtD6LVbnGMmL+pZQINl33qAvo1FpSIytrY6H8MGwweUnc++BA6NOv
	kJ2X9IrobfY2IxR+ABWYqki7TNpQbZ4I03jkN3QlFC3em6zdLDoWECJA2iJ+LZLMo2bSQaFL+of
	TutSZPKTBKGykVhVOnUWtkFW/tJyUbv8UEDimHznOkhJ5YEABLwlcfNg2SG6+KhR8FeAFPpPXiy
	cSHmIDrTdXQ+gX/iKSXpB2/fxKVaW2fPr+RQ1K2kt90c+UtNbKuYL2Q2082DT4/I8UekNxROrbY
	UO7+nH5Qb1ZiAKflomX5FCN1eXDbMlJMMvLSh/Tg8TvKLl4RAkTV0RZxkn510YNWf1rhXJorpgq
	luXWIwYfsVew2CZN3J0w==
X-Received: by 2002:a17:90a:da8b:b0:368:ddd7:abca with SMTP id 98e67ed59e1d1-368f79e8cfbmr4015567a91.26.1778691667916;
        Wed, 13 May 2026 10:01:07 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede49dfcsm3452756a91.7.2026.05.13.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:01:07 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH] arm64: mm: drop redundant remap of FDT first page
Date: Thu, 14 May 2026 02:01:01 +0900
Message-ID: <20260513170101.1858213-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_100109_666155_8752FF32 
X-CRM114-Status: GOOD (  14.59  )
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

fixmap_remap_fdt() calls create_mapping_noalloc() to map the first
page of the FDT to read its magic and totalsize from the header. If
the FDT does not fit in a single page, it calls create_mapping_noalloc()
again to map the rest.

The second mapping redundantly covers the first page that was just
mapped by the first mapping.

Start the second mapping at dt_phys_base + PAGE_SIZE so it only covers
the pages that have not been mapped yet. No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU-based test results

$ qemu-system-aarch64 -M virt -singlestep -d nochain,exec ...

Count log lines from fixmap_remap_fdt() entry to return
- entry PC : address of the <fixmap_remap_fdt> symbol
- return PC : next address of each bl ... <fixmap_remap_fdt>

1) AS-IS
  - 1st call (KERNEL) : 4935
  - 2nd call (KERNEL_RO) : 14151
2) TO-BE
  - 1st call : 4888
  - 2nd call : 14104

---
Hello,

While looking into boot information, I found a minor cleanup point.
If I misunderstood anything, please feel free to let me know.

Thank you for taking valuable time to review this work.

Best Regards,
Sang-Heon Jeon
---
 arch/arm64/mm/fixmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index c5c5425791da..f8aea5572f7c 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -167,8 +167,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 		return NULL;
 
 	if (offset + *size > PAGE_SIZE) {
-		create_mapping_noalloc(dt_phys_base, dt_virt_base,
-				       offset + *size, prot);
+		create_mapping_noalloc(dt_phys_base + PAGE_SIZE,
+			dt_virt_base + PAGE_SIZE,
+			offset + *size - PAGE_SIZE, prot);
 	}
 
 	return dt_virt;
-- 
2.43.0


