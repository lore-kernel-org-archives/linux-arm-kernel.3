Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72207CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=; b=vUa7yjOGAuRrHr+Z/shHofulxA
	xH18FhxfWdX2bLcPR2syJnvVvsly3we2nuaMyqH1/X9xMxq4Us1U4Mg2vQqfwi52c4uPI2Yy+Yv3J
	F8zhAMpW/6XiT9F87SlWHeendLSYIHgQWgQqQeuCzzjGp6DvVQtizv6xgW1L0oLm3YIG6mTn7gvmu
	II/AjxtiO0MFf3uieG+JRFj24pd8MjLgV8Edop8z8S8P/RIu/QfxiN+ZesZslb8Xuhm31WwN/0VqZ
	BOpOxBNQawoQQHjJ3jDr5pmFDgO7ZDFf6pLEbO6LuhxOo3aPROjYfjdEahHTmHm7jwLwpbByVz42h
	9GCCKnOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKn-0000000APx6-1NCf;
	Mon, 01 Jun 2026 08:49:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKl-0000000APvO-1B7g
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 08:49:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=; b=qxpkWs52FyeHPpDx2YM1QT3wn1
	eAqXx0uThX6rsw4VuGZSMQa5HhpR+B4OalssDWNGoYfQCskm2bfN48blrYdHcI4YxaISLq5InQnpR
	wMbFmL2bT56lM8yo9KcdmudN4H7tOyp2rJpsoEHVLAZx8OD6BuoA4OSp2NBl7VxBSKa8nmTub00bL
	ayb0GINckIp0D49YHuDoX9qk0hrYOPyi9awCbmSEUnrHKqSaNv1ooWhQUhOTarDpkPmHeGT85AkU6
	Zm3Hh+/MhbgaYHsDH82wz1cSeoqTLw7C2B0SdYMFdLgeY5HIlpAwsZO/c5vqAMu20SReAyam0ezpZ
	BY8OdnmA==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKi-000000067ho-020x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:49:18 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c8571db044eso1896417a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303754; x=1780908554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=C3j7T1vSqO3N7lUr0N3C3lqzAly22BrIrB5o5v1VKSKU9i0oTthiRyeqHdMYPy0Qu/
         sI7hjkTWOhQQHUyZcETRYHYsXO7nb+H4BVFV8S/T7hXCNT+cDPZax0LtJ/F+WCcAjbDM
         YsVmpKPZbgZHmQcHTnnvrKhoek30miKp4AhuHHku9k/uzfzePSbEDroZbQ2v5rkFa2yn
         nCjTpBzGaHHi1T2yaYgV3C8tAZ7Nu5k5uPJE5Hh8/nSaK4yvsUgKhWUbTNi/PS+hQUqg
         B5bs+a547XO+XL5j/FvSsXPelzPKWKqEodPrd+oDwNoY0OKz36yejz4iUsfzYweidBJV
         +ohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303754; x=1780908554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q8b/yYnv8ZH41kctmwMZLOttDvAzW7LNe3UEG0HH1sI=;
        b=q1NmUo2VkqBUb4GU8qpX4+nuhd4WoC1mOZd3LEnPJUNq6BY58d6iwTB6matzE6chpk
         FhRyU2Q80pjr8x26mFly2QgeHPCQWgZW+bjjMC+SKEKTndiQStcZ+CmwMGjRTfF/bWyF
         PixCpu7cQRiq6TCLpFU/J2S5CtdWRXOVs7ciPbUGKA22SAvJANk+rWfNVVVdSLwTV3GL
         jSxzEAlnHvpc0ni5ESxR3jbI3h+I7VfCEh3bjXeMMMWFpnnzCejgDwn+k8K06dViffhd
         7UGyLtK55qXH1DIpwN/uH4MKABrngReJvKxX+WQVPsGbSftqLWJz+/hzMksSPUqvtAoS
         1ytw==
X-Forwarded-Encrypted: i=1; AFNElJ9xG2w5bKY5A4s6ZZSV71T2uAVZpBSnFCB9bFx3jXI0LuUKM0IMuHdZ9DV4ZSNk4/enrQpCIwq4sTjPzeUVsx7X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8rqOCaCPHVOL3qG4YbK5SLvUpt7V2nJcK0e3q/NVOuUSZ5nx/
	za+nns/Ym6Xn/5/PpYzVoNFYntMQiqFn2XqXankrll+fHaWG3hRVIsVDUw4tvRFygEM=
X-Gm-Gg: Acq92OF+JEw696/mM4wO7dCSyTLXkmBtjapaXbBxrpSYJo8HruDnuGA4Pgr+6hvBxKH
	HT5js8+3t6RK4/Skr1C+mfyBONP4V9itHRj7Ca9yPQcVExnLIIjzIGeqgmQcCRKOeh7QI5z9lNn
	0AfRgYnZI9us/XrFnGTbGYcEPipGbQhNsbCnlPh7K0YvhGptjj4RlR7BHfirujpVBzEXa85bfy/
	JgY6SHcuFZrVgimGH1o9+ocgYbv/+blrXfKUksKHYCFyBJgf5suaxIDtK8tPMosKZDizkoLTwm4
	j9p/eOE7oyzLLh5HRNdQnH4M+bFyPJFAFx0l6WsjAhAfR/L1eRnak9YO3K2PdHqtjA3G5Y8AkjU
	9l2B4tQ9B784kKD06PTwhqxYpBbjicSUh1el03BxyB7+UNxr12Ib0dSxk71VQKQ7PS6PEATYBGu
	6FsIkB5Qjpu5bSANi6/eGAoA3odeb6GozhcPIgmJCxQxj117rXQgPubw==
X-Received: by 2002:a05:6a21:8ccb:b0:38b:eadd:449a with SMTP id adf61e73a8af0-3b428242975mr12005378637.38.1780303754272;
        Mon, 01 Jun 2026 01:49:14 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:49:13 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Andreas Larsson <andreas@gaisler.com>,
	"David S. Miller" <davem@davemloft.net>
Cc: Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	WANG Xuerui <kernel@xen0n.name>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v3 3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
Date: Mon,  1 Jun 2026 16:48:42 +0800
Message-ID: <20260601084845.3792171-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084845.3792171-1-songmuchun@bytedance.com>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_094916_411200_0AC7AD7C 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

The generic implementations now suffice; remove the riscv copies.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 885f1db4e9bf..5f680eb83e86 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1359,19 +1359,6 @@ void __init misc_mem_init(void)
 }
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
-void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
-			       unsigned long addr, unsigned long next)
-{
-	pmd_set_huge(pmd, virt_to_phys(p), PAGE_KERNEL);
-}
-
-int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
-				unsigned long addr, unsigned long next)
-{
-	vmemmap_verify((pte_t *)pmdp, node, addr, next);
-	return 1;
-}
-
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
-- 
2.54.0


