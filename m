Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA75C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g97KZ8DCuIS+c0VePT80lsI4HYIhSP/AZ9opA2fRq10=; b=OWSSSS3UFhYlCPpzD7yALepHrQ
	kfGygfdYt/KVIz1+rcWRO0I43/MQpfXVV4KKMqABeIYLyG9Zm1av4NPyp13pQiWfqSdJoUZyf/sGS
	30VHoxIy6x4wdib/fFcIfoOJxGEHb5KoDI8/ywlRnc//iWU+jWPetJmVFAi2jVTI1iWjuxK4UkCw8
	NKPEBziIZ5ctYucvACQipPN1vcfLvBuX4U1ndyAcEun/gpPfKurMX0+k9zt4T/ZWNvPm1AklYHCbU
	SqwPBM4wf2jZPSJkWu8wmBI9V8MoGpwonazsS9sIksj6PdQ+/DnfOHxrLFe1Z2ds2/fnfHfTSbfrB
	/KU4v2fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhG-0000000GC7Q-4C5n;
	Wed, 08 Jul 2026 03:11:39 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhE-0000000GC64-3qKd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:38 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2cc88e22f92so7909135ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480295; x=1784085095; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g97KZ8DCuIS+c0VePT80lsI4HYIhSP/AZ9opA2fRq10=;
        b=QRY4BS4tSjGYY8rAR1hCZ2TgMcf2DholJZ5MVfKHtIkAwbyayO9AC7TJ65ho/bX4Wi
         T3bpD4oYY3jt7k2EKhDrBK7Qz8S1GtI/CDa4AOPlx2nSMb9bo8aqJNLBVoNqF0qVtO8C
         2R0wvkSDF8pAIdQuA+tjr0XNUmI3EvLrPHQQ3v0ogn+/jyxaOltRuMArInS32CdtY0+o
         qpmytDBx6olJWitHLEl+2mFM+47k7+X/r0PanFRji5t5+D6uPdurrbRgyG9CwWDOKlRP
         udmEwe9f4bB6+qKnyWzMK9JPLRcpQXYNNQEQomjBrXZ6UQ1ENG3ZgSLxtbH8ydFEIK2Q
         03Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480295; x=1784085095;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g97KZ8DCuIS+c0VePT80lsI4HYIhSP/AZ9opA2fRq10=;
        b=brm/1WZKP6ctA/XtOndKNZXGsqx5xzeyEap2SxBQ7WmYgOjrt3sEwicNnYhVfq5fJI
         +qhhZVOrY4LTykaJOzKnZeSZRvzOK8pJBO6bfiz/xDQbQzflX0WdsX4oDWboAg2ieFPM
         YnfVXKoLbxfgtNJ2zIwEag5dZiIF+3hqfCue32ajV8e/lajHzQBH6CpYm/rgDA+ALOvv
         QScvpHXDezqfM/cVA3ml00MYcHdA4f1KM++551F0vszlhXAgYrqSxw7p66zgJDh5wmNF
         A8cin93E6GperQSjieDYklgfqDQHR8Y6GY2PXS9z+il31hium/rxWqGMa7oknRP/dznM
         aY7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqR+NWPddtqdBO3v55mo8uJBfiLH+PCIFDgvD2SRX4rTZwUqjbhqh+Y+uPoRH4N/Bq7hFP+YTtD1cK4sdathe2w@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu/mCrCFeBlgw4ryqeXsAY13Q9sUxczNZC1MLXNCX64A3SvNJK
	G5wQOLPPeKom1LbmzzwowpIVGt5ViW8+6Q7UQvKdPXGtsRDAj4ndNLckJxvK34PZUyWzrlUPVcX
	gClfSvuCmOe8/r7bl55v8/Q==
X-Received: from plcd11.prod.google.com ([2002:a17:903:208b:b0:2ca:e02e:5b86])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:4b4c:b0:2ca:6c8:abd8 with SMTP id d9443c01a7336-2ccea2f919dmr7181815ad.12.1783480294770;
 Tue, 07 Jul 2026 20:11:34 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:11 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-2-jthoughton@google.com>
Subject: [PATCH 01/18] hugetlb_vmemmap: Always flush TLB if needed upon PTE remapping
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201136_981709_619D6D00 
X-CRM114-Status: GOOD (  12.50  )
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

vmemmap_remap_range() can potentially leave the vmemmap in a partially
optimized state. In this case, a TLB flush should be done if the walk
caller asked for it, even if the optimization was not fully applied.

A follow-up patch will more completely deal with partially-optimized
folios.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 mm/hugetlb_vmemmap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 133b46dfb09f..da29954e9533 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -164,13 +164,11 @@ static int vmemmap_remap_range(unsigned long start, unsigned long end,
 	ret = walk_kernel_page_table_range(start, end, &vmemmap_remap_ops,
 				    NULL, walk);
 	mmap_read_unlock(&init_mm);
-	if (ret)
-		return ret;
 
 	if (walk->remap_pte && !(walk->flags & VMEMMAP_REMAP_NO_TLB_FLUSH))
 		flush_tlb_kernel_range(start, end);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.55.0.795.g602f6c329a-goog


