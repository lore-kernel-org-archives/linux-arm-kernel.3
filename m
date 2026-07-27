Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E8A1C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=; b=pF5m3c/vKiS78p+M2UxX25yrYM
	3ARyPaxcb3nfGBcjKOdgff8z+A862tzyPmqMSPTmn4831MnOQDTVRfA0mqjjf7sJYSJE7kbk21D8T
	x/6SAa+Vs1UOsYEaPFek2fqfi1wNodnTvbxI7BJL/lhbGVgV/PDPHg8jdrn7Z+o5jPwg+phOuUWIu
	E9KR6uSXrboDDd3ouBbvsp7FYTPBDIHN13iDaoDZpUeTzsPWUAJxUIpNn0yTPqlMboj4185F3f+4f
	7Df46Eppg7Vlbwa7mhLOBcUOXq2l7joXTNy5Ehg4PS7Y+fyqXM1MBoxku9Z8nc7W7h88YpvnqEvTg
	OjXP0yCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQX-000000030ZA-3F6u;
	Mon, 27 Jul 2026 14:35:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMQO-000000030XG-2prE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 14:35:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cecdc24b1cso2177865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162924; x=1785767724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=SP2UIzNdm3Un9dLEv4v1X6cWoSNQz1bo8AAE8GMcZgy3/FjGDzvNHM4H/YS82DbRPL
         qVGzb7Tuo6nskYB8khY5Fy6W/yjeldU8qBvIqDnail+/pjJPNCUcX0N/jwBxRtJ8NFSz
         BicNMphKt4zwOZab3RiK453KZ21FZ4ONuKlcW/N9hpU16OSE9ciDkl14KPH7KGarNwfj
         kzWFVKa+YjGIEMpARLv5PuyXMmGB8tvRe1KC0+8TA15vyS7JW51xuKZk2hYHG8vm2MfA
         vfH37js7igULPjfIRoz2UEmMI/nFAjYJa+MJ/7neogwhADJZ8OBiP9WuQQDXMLBGYcxy
         TSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162924; x=1785767724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObdtBSjlBwpgFGsbg/wrosB7LM91UtGEZki+/E5+WZ0=;
        b=Zb2uACBERaAFaNY6zRcDSWKNKvdrByL+yvaW3iydbN4jniJcKX9j+IiSeiit+LEh5s
         7FLiuuIlSsoOzpDb6esIaIWCyMEa+j+gQ0dBeUsO+XcJcMbWWZF3MXbcrTYMZ59QIbOK
         qlySR5UlL1Qr2Adb3rjsvg8O9cAcb/wMytcioj21BqLZfz72+vgqkde9jQE3Cd6aOlo5
         gKhhXGwgjddeqWtM1RkAdsJlY56zq5gPAl8GKav5Eq2whxX6UeFybdDHWULtyxEiYSS8
         6NdQzq8jgt9Il1l5dHrtWHFreg8+CSQOrnOwcDGnK6InmD7rOxDKEEKTTtqE4dR78F39
         Twfg==
X-Forwarded-Encrypted: i=1; AHgh+RrygzBt5uS9IwiYqcDz7eB7YXhGo+5TnCzG3wH8gnBGozNSYpzu6SLoiwgUeDMjiw0kZTwoMZ4dHdnxUNPK+MPg@lists.infradead.org
X-Gm-Message-State: AOJu0YxrZXf4ka+yq1zuVi8iqTOJ6duyLcpISc/0Onr0H3UiNw4FeROX
	O9/HFt7zLRcSjnx+uEE0/JQLEO0xefOp0cJ2ZkXeVDu9drh+ZTXkq8pH
X-Gm-Gg: AR+sD13+UkfIKNf0DMHd9WqmEpFu9UDlmm3A4kjg3DFpZ3MkJMv0RJq3hJysSNm1KHW
	ec5avHmGskaoo475kV+VYGMti8i0hnkiBj9vLAhWPARDrnPWcc/wMzTZmpVSXb/FBtkhYmdvvEj
	dLWhWAzgbrAasJZLGvkJIlPjc5l0eO5CHkkNetRtXi2P4aUQ0NAlVU9QGR3NipNekM2mZDo74hw
	g+inlzsJnoGF2vLBr2oRsZdWOVYIYru77S1H7SPZ9nQ8B+S6NOQur/M9IqbLv9J3+4JRGxSJw9B
	g6bfzrOrkSLJ596DLX7M7YYhHJB5pShtyfufEH3SMuMIDVoSuzXZQeVmOfLCIQ6NMscgGiK8iQo
	NyO7OdvLvu/HLidzh7iHfqm8ntCI4Q7zgh4nWXny+dKT/oqMLiaK7cNUEge2MSlt1jkABsUoJlo
	heqfgJX+sRdR1YhDmDZqDhh54LOfTnQAR7Ngt8dyMRNCKjAC5bJOgyiD6jdOfD6DoS
X-Received: by 2002:a17:902:d48a:b0:2ca:bca8:109b with SMTP id d9443c01a7336-2d00b84c43cmr3891855ad.5.1785162923760;
        Mon, 27 Jul 2026 07:35:23 -0700 (PDT)
Received: from debian.lan ([141.11.42.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7d5297sm36877485ad.56.2026.07.27.07.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:35:23 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: linux-mm@kvack.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	jannh@google.com,
	yang@os.amperecomputing.com,
	rppt@kernel.org,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org
Subject: [PATCH v5 2/3] arm64/mm: add set_direct_map_ro_noflush()
Date: Mon, 27 Jul 2026 22:34:25 +0800
Message-ID: <20260727143426.1077133-3-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
References: <20260727143426.1077133-1-xueyuan.chen21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_073524_729681_9495C8A0 
X-CRM114-Status: GOOD (  11.60  )
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

Implement set_direct_map_ro_noflush() for arm64 with update_range_prot() on
the linear map, setting PTE_RDONLY and clearing PTE_WRITE. Keep the
existing can_set_direct_map() guard and leave TLB invalidation to the
caller.

Co-developed-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
Signed-off-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
---
 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
index 90f61b17275e..7083260303c3 100644
--- a/arch/arm64/include/asm/set_memory.h
+++ b/arch/arm64/include/asm/set_memory.h
@@ -14,6 +14,8 @@ int set_memory_valid(unsigned long addr, int numpages, int enable);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages);
+#define set_direct_map_ro_noflush set_direct_map_ro_noflush
 bool kernel_page_present(struct page *page);
 
 int set_memory_encrypted(unsigned long addr, int numpages);
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index ce035e1b4eaf..c51236b61651 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -365,6 +365,16 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 	return set_memory_valid(addr, nr, valid);
 }
 
+int set_direct_map_ro_noflush(const void *addr, unsigned long nr_pages)
+{
+	if (!can_set_direct_map())
+		return 0;
+
+	return update_range_prot((unsigned long)addr, PAGE_SIZE * nr_pages,
+				 __pgprot(PTE_RDONLY),
+				 __pgprot(PTE_WRITE));
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
  * This is - apart from the return value - doing the same
-- 
2.47.3


