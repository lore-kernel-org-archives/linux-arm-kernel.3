Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1576BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=; b=SidiEdWL5M34gxz4Q5XB09V6OP
	8jltRsKiXYky+dzEg8t0fx4q1lAlGXQiYDNR38frKymdIOY2gYE6pFWomEO8b+m9r7nh4Yqaakhmx
	dGSJWqUohKDMgPuQHBYFwkEpw0pre3ihSZfyTqwxeFe0nLITlJPqW35koo7dG2BR5/6/rH9hzRWg4
	c6pXzaWE7j4/F/+P9p0w1TMcQXixjrTqGOvbbXY576Iv+Z8nkd0JsaFTjyNBH+aEreIDxWggDFgPb
	ekQYrZxJcLWNQRoWJWTRSEgOkhF7Ktra1mR+79WU1/r7oaZDrpSEcTaQrb2kv4ev62qqY1CBwZWKM
	vTvjcWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBrX-00000004uAN-335U;
	Mon, 30 Dec 2024 09:14:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBmR-00000004sA9-1lVu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:09:44 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2167141dfa1so112898365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549783; x=1736154583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=E/j4mizqeceM+LQdxueN3pk1MV5PnXqyMPSvqkVB0wnHUFcIRfmdx7M6/HNILNytFc
         Is9tIyGBhDaq2gG8YwhDGUKercDx6uIAZxT5dje2FvRzXCDjVjmziHs+4x7DKjudYN7f
         yaQ07TN8+vv5UYkFSgzo4RSyNPFtFWhS+UfsvwgsTho2L/kN9etu+vLZ0Gr31Tcp30br
         yIRmxYW1r4vvv0ZJ9xNeln3UeymEZJFCfqq3BXjgtbvjo9ZnfWRCtE1N9OazsM3R32Dr
         o7u+H+eNT2pQPUAvzcKPFO6DpOATOrIzgSdWM/Oa309hicgT0CmXSKV+RjRY6fVAfKv3
         ZCUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549783; x=1736154583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eYmLHVK0AtU6ilI7ucnXt5jLNeYE7S1uMrvnVL/VK/o=;
        b=r3FSX9me9+O7BHpWn7yZMYuO6ZLqEkqtzHWvqdAtuKony7xZ4v+wvDmVHu8vVkqmTV
         j4ylHGjtUAAAmMCQSVE/9D92cpL9Nr3U72ObmnODafeOnHgLbudEBfQlTflPXMFiHcjI
         0pjEu8C4KML8eiE8Y5cxRupsfRWfhopRyq/np9L3gejU+gFv7PVRXXlIzqoqRMMAVpw2
         0i7cRGKFe4rS3FV95TNXRDQ8XVEeIEe5KyX6qqkGsPzLpw+Ov7EbnEahGSOT0afV3WHg
         dON/0MeNRI1p2bay0y+OEa8+G+Lh5hTV147ykVI4/HX9wd1ws9sw9l9UR30DT3dq25j2
         oSBw==
X-Forwarded-Encrypted: i=1; AJvYcCVO1kqL5OH4zY9xKBwhVBn0OwXHlCiMafNQbGTsvcZ9UfY5C3J/xrLK2GKnI6Z+4ucyIhTJpuw3Y8QlVOFpWEE7@lists.infradead.org
X-Gm-Message-State: AOJu0YyEBofnbcA4hmuHMm+g/QYp0qYqbz9uhuLr3sGctKYIBLm3RvTG
	YbJ0IkLNEq2Exim0iU3W0tCBSA+3gRX0PlZWstFrRc10Gs/Nk0MYzB0SW0wF1b4=
X-Gm-Gg: ASbGncvqz7O77q1rD4jWO+nDWx1ZJ0ZKqXciiK6E0monajBVzlL6lt5nMKA7eD915XS
	xdmpurHvTddgLBztrxChgcWFekmKnw8UbAlSUqJhpmd8zZox7JqXL6SreU4WkDr8eV6o6MJGa1y
	UQgg3L11T1n4dj39wVD1ZOKue9mqehWs2pSvPi80zyoDyaH3fEc164JVSZTBFhv08UdtGxzHL7o
	qJgaCj3vf1Nb5ChkElsRj8vvJsSoYgTUYQd4cF3h+de5lXWkPSV8zI0taOohIbbflz0omHjNgfF
	L89OQj2Fa6OXrLxmjGHMSA==
X-Google-Smtp-Source: AGHT+IFA+DEWtAOVikEXL1Ne96u+hKYy4bbBxlgPSiON1NV20vNo54NDlhKj2iEhoHPJgNNx6Etn8w==
X-Received: by 2002:a17:903:2a87:b0:216:3f6e:fabd with SMTP id d9443c01a7336-219da5cc2d0mr588821545ad.7.1735549782882;
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:09:42 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
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
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 05/15] arm64: pgtable: use mmu gather to free p4d level page table
Date: Mon, 30 Dec 2024 17:07:40 +0800
Message-Id: <7c12112047ac230809aacd0379259414b9b0d3a3.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_010943_460001_F4526343 
X-CRM114-Status: GOOD (  10.18  )
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

Like other levels of page tables, also use mmu gather mechanism to free
p4d level page table.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/pgalloc.h |  1 -
 arch/arm64/include/asm/tlb.h     | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
index 2965f5a7e39e3..1b4509d3382c6 100644
--- a/arch/arm64/include/asm/pgalloc.h
+++ b/arch/arm64/include/asm/pgalloc.h
@@ -85,7 +85,6 @@ static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
 	__pgd_populate(pgdp, __pa(p4dp), pgdval);
 }
 
-#define __p4d_free_tlb(tlb, p4d, addr)  p4d_free((tlb)->mm, p4d)
 #else
 static inline void __pgd_populate(pgd_t *pgdp, phys_addr_t p4dp, pgdval_t prot)
 {
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index a947c6e784ed2..445282cde9afb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -111,4 +111,18 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 }
 #endif
 
+#if CONFIG_PGTABLE_LEVELS > 4
+static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
+				  unsigned long addr)
+{
+	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
+
+	if (!pgtable_l5_enabled())
+		return;
+
+	pagetable_p4d_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
+}
+#endif
+
 #endif
-- 
2.20.1


