Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55FDCE77180
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 09:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=12IiSMzMVIlfwdGc3SnaXSwRS1fKZAvHGusKFMV1b3k=; b=13UvgM6jf9p+EEeXuPM9bcYOZP
	7/yNr0a8yKdhvnZWOwuvi/QztCaPYgIQqrr4Q2sVWpQH4PNn2zIKHDh5qbYNUD+pmoS8UorobPe4o
	cnHDuxHnAU24syD/Uy90joFmE4ioZDPfkoH5er4McDIL/s2FFzV8asyjxGbqbUuVz6mxnNklzGHzK
	fohrjA5kuJvOYcox3UmQtEThlndIw+Xit71RBn8Kb4HE+CeaAkqcR1y99FUaNEeoe+5ACV/03t2DH
	x7Yhc3iNs/oPbTVc3umH7GPoW/RlLXL+WNzzicklJTjUStIURwbZvlXIidh9C667uxd2oh7rio/dp
	9tV6NXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO6M-000000064zY-31eN;
	Sat, 14 Dec 2024 09:06:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMO4e-000000064Ur-2X4L
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 09:04:33 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-728e1799d95so3058968b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 01:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734167072; x=1734771872; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12IiSMzMVIlfwdGc3SnaXSwRS1fKZAvHGusKFMV1b3k=;
        b=Dj8bGKCIpFBWo9Jxyn1D8T88GW27j73b5Vpg6goWdPtyiJHEHUzeGtbxuAIXZzFzRI
         IpsXowGw9CHt6P9KpQhSr6QhKwF9Fv5eL1R0PDMSkpvzTNVhNYrtBkZWzxH+LbvPIJYF
         dAm2yXzA+l6pJo7bcoP9e1kEF8lNXOXH0v4Iooo8OJkcR7IWe3TOrZzUg0IXfGslCT7h
         rXvMV62KnvwqbmLax4YFfA8y70D+4QqZT0BDobFM5pnFkGYFGhVwv8hBAI0dRu+jsDr2
         zIPHKnaWWcEZBG9UJ3gHvGrrR4Tj2zjJeye+C31zkOEXJyzVZli0zXMD5Nxww3jx6kg8
         MPtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734167072; x=1734771872;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12IiSMzMVIlfwdGc3SnaXSwRS1fKZAvHGusKFMV1b3k=;
        b=SJnt7izaPewD6BP+PTk6EWpUNxinYyvVWvf6ZWVz2PKPTmBw0Z+lVB+jizzJFsrAtJ
         2CVLw+MT83SxoKwPtmYdd9vINSiYjmtL8hHQdnKZPr8y0OU8rvJ+3U4gksYiPS7Y22ZQ
         nVaXLJBKBuhqEryADX/0Zepy/iWNCz7rLe5Ss6NMba+/u14f6/CHwrbKq6BpTjyEBnNv
         JufMOYyRh0KH5toraswRQ9X2EBfSOVX4QR6T9Smi/RmcxIJglB7Pq25UsZHYnxKqjFlf
         QC3lRMKResX3Bv/uA+5rpg6nDGing2deRX7IvLTnVkG/SKV+eH0QjT827Bd5kZIgdJn+
         f15Q==
X-Forwarded-Encrypted: i=1; AJvYcCXotfUU1pZVPedIrtkTXD1hfEhEFGsUgqI9SuM45HZayMp1u2VNlqFvXpcrBEmubwoFNrljafCbwg+bpirUuGBV@lists.infradead.org
X-Gm-Message-State: AOJu0YzKoJM88gZKMbTvMHcwpwfVoYOxY8+w1xLpdRhxDayLFjvFU4m3
	7/L9MMY5u+87k/5Wj8v5ES4WChLCSpxUo9lMNVjcR9Jg6JNvmIV4C23rIl3R+10=
X-Gm-Gg: ASbGncvrIm+puPhwbyoX5967NCGdfYuPdn7naWfowJchMcnwWXdaOaqeW7wmTAeQsRE
	9f9UMLzCeUQPXP9m+plcbvx+MugEknxqabDixxB/uZkYY0OGyQEgKYQa4JB3QqzSecvcUroPodq
	5pFzYvWvUmnDKzAhAlTdoAbg3EpY9yeLmoZnFX5eLN41IOaUbCI5S30mzB4OLVVVykx3MqgFLqe
	grSAZzcal4wu11yJbuvroHpF2c89PBOEdy+pSdtGd9yYCEUKi2IIJz4+gxOjBDpOViRPGBkUVJd
	1HgshkkaPiekOuqAbGYihw8wLplAqg==
X-Google-Smtp-Source: AGHT+IFvnXDbPrP66UsHi9s8CFtvVszYyEfjge+aAOFm/P/L2638kVYMzofXCSp9Xlrusy3CzYMSYA==
X-Received: by 2002:a05:6a21:33a0:b0:1e0:d796:b079 with SMTP id adf61e73a8af0-1e1dfd55614mr8533024637.17.1734167071820;
        Sat, 14 Dec 2024 01:04:31 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([2409:8a28:f4f:a9a4:5d46:4ef0:daa9:1db8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5a90ba0sm905731a12.16.2024.12.14.01.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 01:04:31 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/12] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Sat, 14 Dec 2024 17:02:52 +0800
Message-Id: <59fd7e0364e8dd293132d81b91b28694e70263e2.1734164094.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734164094.git.zhengqi.arch@bytedance.com>
References: <cover.1734164094.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_010432_641506_9DB5DAC7 
X-CRM114-Status: GOOD (  11.53  )
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


