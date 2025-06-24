Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85AC7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 20:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HKZOMizjC+LML2kgDOmX49x7zP8t7J7YW3XavcrCNs=; b=SdkbpAaaz8LBPi3bjUtlzbBMfi
	7lqJpPfIIKnsfloIcx/Xw6rxPY6QquhSVFb7YfyVNCmdYnFHrwzSy7gAUJolK9MSHL9krDWUhgAbo
	PvVmVZHsa76z+/2ehdYyrTw4oCXUI0kUGWvvmPxHCfk866YxO6gps45cFnpFRyMYi+vx74OrY5U9F
	NWyj+76xLBmKInimCd17CDctE9fEJ2awvgd2NH7TS03RnKRQ4OredCTBrVX26C3jI2eRBYLz96elP
	AQBdhiU9NX3CFqU5jlMWbKcbUNZDlpbfKzV8JXWua3kFrfZkgYsX6WCJSJlN2Hu+c2juBNTUpCOkK
	CecDmujA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUAYE-00000006o1z-1kZ4;
	Tue, 24 Jun 2025 20:47:30 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5a4-000000067Ha-1LLh;
	Tue, 24 Jun 2025 15:29:05 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3a51481a598so2841800f8f.3;
        Tue, 24 Jun 2025 08:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778942; x=1751383742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5HKZOMizjC+LML2kgDOmX49x7zP8t7J7YW3XavcrCNs=;
        b=JUd63dny2z3nX2pqj7V5k9LT6SrJUH/8mZYMRyiE5Papor1f1h0ftBg7NP5bVCMVQ3
         HxdHZvzy0ACxa9CKd4ykTDh8mdZfBHsn9xBPYylGXbi1UmYHDwGlhEOHJXsrxyDy3iuw
         DSeu5otOOcV6r/NnZx4A/ox826uvBDydfO0xneN7LvPUhWP3+69plKc7pw9I5L4jvXr4
         ZQCxVSbdXrmtxzveK6z729SYc7EHjkNMRHQNPilg1NjKusqtpRTajrcuiu+C1ark5rJ4
         wvaIaLO8mFk7m/WM0EEFT7/M06FY4xCvqrVAW2iN3WtQqH+lZKHPKjkD3GzfpHA3LAjv
         BkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778942; x=1751383742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5HKZOMizjC+LML2kgDOmX49x7zP8t7J7YW3XavcrCNs=;
        b=NgNJ1G8VBuaK0FGjE5SonrPRhEjF4XicERpgs3kFrcFGdDLjpqydOwQ/pOEqqjmGZi
         xd7h7DI+PVBhOGEjH6t+bksyJOMlMbsgFBUc3AGxbZTJSqJm2e8yP38qQN0Z67WUG5+M
         PXBZg0ODQXK6Cnue+OYQ3SNq3kf0ZD1EQxWNzlexRiK5yBdeZtWq2wHG67Dqnx/JpvZR
         6SRgiHNosgzP9jMvyE9f1JzTAiqlF4lfHKBS7PdYHb5Ji2r7H1FLbZRYIwAhD0q3Qa8J
         IamHVNAT0iGuJt6Ml44CulqkYI94iAtE3Nm9aZ5xN2IMwYpcP7+bnfng6PrcnFGh99+N
         TIYA==
X-Forwarded-Encrypted: i=1; AJvYcCUScCktkbbbbQjoA9AcTzm6F7a6uXmXRovvjb3Mvrfd0HDnpCA+p5ldxbYG8uyIbz6x09d6iQ4QvjLw80k=@lists.infradead.org, AJvYcCXaWp5x+1J5Cj+u8nYfm2IjkXQEQzrGprSkLilG+jCxX3MnMcw0CoaPSdB7iyQ070qtE4upvKX5Rnx4IcquaTdo@lists.infradead.org
X-Gm-Message-State: AOJu0YwHjbRTt+5WFfeeq1CV3O6v4ISAC56W5LYOJCj4ZADwGHObTDgQ
	HGs4IOvXeMYMheJV5B1weae+7T8DOI99yVWQDRSqChQLmVluW2tdCWSd
X-Gm-Gg: ASbGncsDnFSRWSJPtJdepDZaqSuyuN3ZaXm5P8rOPFMYSU70bFyfBsUI2kKX76pQCUZ
	BNF2lv4NK04niHuAIPe6ht+2yKPVEXmVbzdNufnKLVE/yBFverdqqh1+qQMPrK7zwEnQ36QfH1w
	OYHGJLryJcygZk4QWqwhWYdlMQbr0d7QanbgqsiycyZSRUoIrZkgO0+J4gry1mcG+alT7krmm0o
	eJUWVIySr9+doMSuSyz+XnFaAi/YAaQJ9eyL3UN2WMRihB4u79B7KXgqIo2ZB9WMycCTBIE/q4p
	45uG76FEkaShA4PqTc75Gdg6UDls+7yChYYIokViF0FYV6a4PIo5U+q7cwJn
X-Google-Smtp-Source: AGHT+IGcrYUCG4zfszj6fg/blm8ReRuQCCQCBeOsqMPtqwdTWUylx1xgbwj//MHlp30gYyOjSUtesw==
X-Received: by 2002:a05:6000:178f:b0:3a5:2257:17b4 with SMTP id ffacd0b85a97d-3a6d1319d72mr16109499f8f.55.1750778942035;
        Tue, 24 Jun 2025 08:29:02 -0700 (PDT)
Received: from localhost.localdomain ([2a09:0:1:2::305a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e80f2977sm2272345f8f.63.2025.06.24.08.28.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Jun 2025 08:29:01 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Tue, 24 Jun 2025 23:26:54 +0800
Message-ID: <20250624152654.38145-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
References: <a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_082904_372380_3422109B 
X-CRM114-Status: GOOD (  15.01  )
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

On 2025/6/24 20:55, David Hildenbrand wrote:
> On 14.02.25 10:30, Barry Song wrote:
>> From: Barry Song <v-songbaohua@oppo.com>
[...]
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 89e51a7a9509..8786704bd466 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1781,6 +1781,25 @@ void folio_remove_rmap_pud(struct folio *folio, 
>> struct page *page,
>>   #endif
>>   }
>> +/* We support batch unmapping of PTEs for lazyfree large folios */
>> +static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
>> +            struct folio *folio, pte_t *ptep)
>> +{
>> +    const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +    int max_nr = folio_nr_pages(folio);
> 
> Let's assume we have the first page of a folio mapped at the last page 
> table entry in our page table.

Good point. I'm curious if it is something we've seen in practice ;)

> 
> What prevents folio_pte_batch() from reading outside the page table?

Assuming such a scenario is possible, to prevent any chance of an
out-of-bounds read, how about this change:

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..9aeae811a38b 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1852,6 +1852,25 @@ static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
 	int max_nr = folio_nr_pages(folio);
 	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr;
+
+	/*
+	 * To batch unmap, the entire folio's PTEs must be contiguous
+	 * and mapped within the same PTE page table, which corresponds to
+	 * a single PMD entry. Before calling folio_pte_batch(), which does
+	 * not perform boundary checks itself, we must verify that the
+	 * address range covered by the folio does not cross a PMD boundary.
+	 */
+	end_addr = addr + (max_nr * PAGE_SIZE) - 1;
+
+	/*
+	 * A fast way to check for a PMD boundary cross is to align both
+	 * the start and end addresses to the PMD boundary and see if they
+	 * are different. If they are, the range spans across at least two
+	 * different PMD-managed regions.
+	 */
+	if ((addr & PMD_MASK) != (end_addr & PMD_MASK))
+		return false;
 
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
 		return false;
--
Thanks,
Lance

