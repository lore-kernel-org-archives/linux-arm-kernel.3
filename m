Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A19C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqt0DA3rHMBC2JGEPtQ8G6D8wkEO9isBswK4tBDKvpo=; b=HdQlmFl65261PbsG1UNE5d4m9/
	T3Oa/KVEPN6Z6yGk2NEdtnUyaAyRB93Bnt8YgmBjMnaPTviGSO8TJ0KDrZIdJtcdF7nr4/akmNBVq
	NcRd2eVG+aC86B4HItmL7GosuPO842BSfbAH5YUcpgVptHF7y+XJRpUN/wvOK4Ym0iVS2WfnzYzpj
	4tCw6yZM8Bq1+P8Gljog8GFZ9YRlesAo6kmeUNNJof0XKE5gHsJk6U0eB4KK8TXVgeEIGr0iATpZE
	zM0bDytmxot02hkQbnJ8BfHiHnLKdEihESp0RHfzd8t2rKt8fdwoTL10JsHLIXm1zfuSrxidANNAz
	lg34idhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QGA-0000000CT6k-0rxF;
	Tue, 01 Sep 2026 15:18:50 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1QG7-0000000CT5H-3beo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:18:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-8485ab7c382so543560b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788275927; x=1788880727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqt0DA3rHMBC2JGEPtQ8G6D8wkEO9isBswK4tBDKvpo=;
        b=atWer7op4w7OgHO6c4xkkVsE4hgswDUUZofEEY66wV+CP+sFTTGo74eS5fYOZ+rOBk
         avZP8Q9NLWO3OqgvanBG6A1/jXkXa4r0D+U+bt5o8cLHhUzzrcL6oXiKJICBpf8YuV/h
         bg/l0oFe97nrTcL3h7/A2DgseCESUk0HrkXYGuqBu/hQ6pdY1O+DVzJx2yqMuoVbbqY2
         NdPyRMfsy+qu3ox52A7z8UHJ4BLDPFaBw4hEf25Wb41fnTtcajLtCKpI3AasfSV8quPa
         gsu7VP0sHJt/xtzKyiVsm5JCsy5uma1UwBeSV1e6OT6ohmfMJaIvYj8ypmULDESf6jE4
         95IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788275927; x=1788880727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqt0DA3rHMBC2JGEPtQ8G6D8wkEO9isBswK4tBDKvpo=;
        b=LIKy5LGb8kE+HX82who+4bWBOjdPE5+4O0uDZiQ3Ug/4Hku/wCzONFjcrhq/qGYyHL
         U9yGMHbmHpr1qXvPPpoSfD8bR2/moBO4b5A1T9hVrb0VlnVVqHkX9gjpVu+m9JXPPGay
         wzM1ppJiXekzziGCIplmwwXlTgAKI59ihejQnMM6h88ggMD2c77bdjQhfnIbtd7GugHb
         W0eUzmB2uNshcY//OXVauG+u6NyUahKC8gzp0ZyMulrNRNqMeXfockGSejSnqF0rFBSV
         Q5zFG0erQC+V24qY+Jt8lbYRzErl3+efEgJc0YduPoCOREbSdySDckO2NUP488Kkx+Xw
         nbNQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLtpkAi3zP2mEQMs9+ldCHghazsVP10fC0pb/oh+3nfLd3mW0fL4Jr3AVz/kRRik388FQtY6HCqeChT6awcWT5@lists.infradead.org
X-Gm-Message-State: AFuF++l29xOvDkzzT8rfDQtEbxX9+ytsM04ZAOpWXBpt/kG5wtl8ANN0
	OawgwiGeCSMoIpxY+VJkfiExUeoESJjlU195tacjhZ1i4rP7/t9OBH68
X-Gm-Gg: AR+sD13KC+Y1Fsmux1VkAVw3nRnYKsgkLv67w76INrt8aGcJf1rGpQrcfARSrewfNhm
	DOA5eAUQ7RuNnKPY/Jbg+FXfAaf3SRLzAEeb29afq6aYJAX6ESQQ/1QaMeGd+ohEnCJOOWp8UL0
	z7JNWxx+eOsjSCWGqIzuwK3xWkvf3TP3kcuOBQU90BiXewnp7gi9sQwOkLxgX9oJ1dcuIANmnGM
	X5jD0GvONXhKcnBASL5DrdyhmuHoz2MWD9SYO/rL/6XKzS7TN2NpuX/sp+e0LbNoNJWYiYrzXyI
	M+G1IzLe/X55DdfUXcjVgmUoRm/HFpGIIHBF0gD+kv2LIYEh3dWYmhm4VdPu+1ybX2BVfJIMyPe
	RXraUj/UtWj2MnaeANNlNleZzvH8lGzOGt+hLLPMTcUFvQmmtPUzoqZcJnnd75GP3Jw/HqJfgVC
	Qo7BOyKPG3PBU9wPJe7nKSGodBh9AyhXTbYC1DdsMjgazACanusZ8Q2x0hS/S2j3uFQBYpaaibo
	7PubU9qo6g/OMLltMfP2eo7Nw==
X-Received: by 2002:a05:6a00:4903:b0:84e:b5a9:ca3b with SMTP id d2e1a72fcca58-85625f2c0c9mr21548292b3a.0.1788275926871;
        Tue, 01 Sep 2026 08:18:46 -0700 (PDT)
Received: from o6.lan ([240e:391:ed0:47d0::1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85db24f33a0sm89911b3a.9.2026.09.01.08.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:18:46 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	usama.arif@linux.dev,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	kas@kernel.org,
	rppt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/3] arm64/mm: add set_direct_map_ro()
Date: Tue,  1 Sep 2026 23:18:17 +0800
Message-ID: <20260901151818.3191443-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_081847_903133_47CC6EA3 
X-CRM114-Status: GOOD (  11.18  )
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

Implement set_direct_map_ro() for arm64 and flush the TLB internally.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 0091ba12200e..1be86dc11543 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -13,6 +13,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 
 int set_direct_map_invalid_noflush(struct page *page, unsigned int numpages);
 int set_direct_map_default_noflush(struct page *page, unsigned int numpages);
+int set_direct_map_ro(struct page *page, unsigned int nr);
+#define set_direct_map_ro set_direct_map_ro
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 132938b32eb1..0e95cd904ccb 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -355,6 +355,18 @@ int realm_register_memory_enc_ops(void)
 	return arm64_mem_crypt_ops_register(&realm_crypt_ops);
 }
 
+int set_direct_map_ro(struct page *page, unsigned int nr)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (!can_set_direct_map())
+		return 0;
+
+	return __change_memory_common(addr, PAGE_SIZE * nr,
+				      __pgprot(PTE_RDONLY),
+				      __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
-- 
2.47.3


