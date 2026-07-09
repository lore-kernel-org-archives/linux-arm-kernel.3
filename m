Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 07:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3jpuDRDbi/4o3nLvS/PJuVqgep/rW9uImCbTAY/NJ00=; b=CNvFe7+EbMdueAPZWHzY1Bwelu
	iVmArr21XpbvaljE8UVxP4L/hNygWk4ePBeS1tSFCrVpFi4ZPFvZfE3MY4nHxlTrNLDJPIZevfyD4
	b19LcL60jxjMIqnNGx1ltNxeDr1AxJ10pBN9aghd60sVoDH5aNhc6u6h28ir5rl5qEh65xWGWSMRS
	/RIBqwRAr1qzXRYpdgUQAyhnZ8+Z/lcZC8CDcFjuUHi2UMC6pK0NmJFJNKs9rPmH/yJRtvdNtw6AF
	HVhZB7hD7dBTsn1MC9OHq4cpHVDRTT8NvEEjWj6dHpusTQxP6OcPbZrqaTiDpXMD6+nb7G4sVmlHi
	+Fno8Tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLN-00000001K42-2muu;
	Thu, 09 Jul 2026 07:38:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whjLL-00000001K3G-0C6C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 07:38:48 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8485ef63b68so239346b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 00:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783582726; x=1784187526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3jpuDRDbi/4o3nLvS/PJuVqgep/rW9uImCbTAY/NJ00=;
        b=gFvgtmQNiV5E5JcjSBHXE0O1BNrTItfYGu2RXVSuREZUIyUs9neR/pj1fTmZnXrQ8A
         xugG2qaSc8ZNtFsFdSfLlQ8zeJRMrXCUJBqRkp5DHv7WnrRtCVP6EKABcLSZO4V9VQ9v
         +vSisigXsvEmIt6uCFnpEKIL0i/3CTNBty0m7uxzC2RvMiKMsFeNQV00fNZ4nPPCyV4k
         Wt2yZ76smVBBEyict7C3XmneahLCtPa0F2o7ATX9/9wzUylpF5KzdmCsouCprkmkcKDT
         jSaCWW5aZ65s3RupHXPJ6Rz47D+ThajP+/bW/El25LLqlA6wn2KjF950VOgvky2VtXpj
         kkQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582726; x=1784187526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3jpuDRDbi/4o3nLvS/PJuVqgep/rW9uImCbTAY/NJ00=;
        b=mfw6gwdQAe47nn+lbssxa32gYvV3lxICU//JZYLE+1zvrjLlAB3+E0grdsCyXGq1fk
         RlFS6K+geHwXvypScmWSUyyeH2b90PD49w7n05+LBq4Y37hEuln0LTlPBFU450Otvst7
         p65ZHTwQN5SICzXxAr7UuU102Y6bRpTxITCdFmZVT8BlvefuBeLdzG+xdEJ8H99fq5dv
         IobpfoaEXzpuRl20oqw9EZ/Rnlzd3WPCmcHHziKlXdqoKPp1bsb8nmRUEYwc6iIuVGkS
         EmKvU/l3ojeoNmhc9yYeSs/MoH99kNGgTlHftM6dJYDvNrCV/T7bkRxpbDOajgfm3+75
         CPiw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/5JXrOvKL5z0rImNYR156NZKGsAbC1boSvFxtxd3tdBPb870DtQPfCWHIO6P3u4b+yhrIE4ldsFOhHyrw+ZIq@lists.infradead.org
X-Gm-Message-State: AOJu0YzBLDrpFnrttjtnjDsK2Hiz6I82KErHFI1E8B1I4MTAtoKXWXAS
	ZSINEMBGg1R7Y66N4W0bSMYWO6HEUFb3ui34jq46sZA+uMLi6UvVq+nputEvNA==
X-Gm-Gg: AfdE7cnVMBOh/JGS3UIe7xSR8UkzXtTadCoUwd95Jvi1euKxDIPP9Of7D5FhHAPhOzR
	8Q89P5HPWLJ226w3HYtuqjMTKL+d0CvM8/f0+6vzypqXUOKfMC+9J9ZppLsRkxw0kk1qHCB9gUM
	5LU78Nexa0o0X9j4uUucwEMgZ16QyIO8ghUWHDEPNBx7G4SSYdEFJqCy6i18pUxSvWr3umYPy8W
	2VDCaQwq3WjKYrkBpJ/70VD5IVXXgR8o13H4BlZAvuk1AhWGqL9owFGfyVa36jd0fEVMcceNdPl
	xT5D7CTP7UnMdTBTKpYLdfKxFNVOhMmfcub7rcvumFLzLiOvgC0rvnA6io8qV5tbUkkK3nmaqiK
	0YtmstubEF/AjALTrHwiJyWzlmsXhmIrlvWkLdq8s10vujjFMtuiwwXKG7T1F4S5QLLb3OkKasn
	RH6Z8cFhfHl0P2pdbWNk/Y8RaoapLVl5SNly8=
X-Received: by 2002:a05:6a00:bd81:b0:848:2f6e:e532 with SMTP id d2e1a72fcca58-8484303809cmr5421671b3a.70.1783582726083;
        Thu, 09 Jul 2026 00:38:46 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3162a49sm3334902a12.15.2026.07.09.00.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:38:45 -0700 (PDT)
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
Subject: [PATCH v6 2/6] arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple CONT_PTE
Date: Thu,  9 Jul 2026 15:38:19 +0800
Message-Id: <20260709073823.6643-3-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260709073823.6643-1-jiangwen6@xiaomi.com>
References: <20260709073823.6643-1-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_003847_090293_E0441B3A 
X-CRM114-Status: GOOD (  11.35  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
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


