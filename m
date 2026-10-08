Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 136F2CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=; b=pLK2xmaHMBsT/KkmW+yE/cuV9/
	4AOIS34TfXW4CKFaeY+K9CR6hhlhUpBr9b4O6M6wgyNIbc4sbbdomf9TyxdYMzyDuHFMOVmpxeugk
	l1RBlXIulAtZM6+XWfkcXv1BeZmTbfipn1lCflHpOEVTdEiMUulPXcIenbYe0BIwVXl/6EHmvDIRw
	vOAuB+5lfWKi+prk/ghLThLyDHa0PR2TL9U3AJ7s3tFB05jAk9sP2qs+Cmx9FFmHvDbiNu54hGaTn
	Row9FlKzrMeog6rZNfpbzwmfeD74j0D5N69GZo21z8zXMvshbTqX6eI2S2YjW5iiQ1jUXDrIER4FG
	k0XQ/ZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaM-00000003kUa-3e4V;
	Thu, 08 Oct 2026 07:30:38 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaK-00000003kTK-1STq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3a4c80d3d5aso2981563a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444633; x=1792049433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=NO+B87ohVhoazrLs+w4QO3NlDr6R656j0TVZDQHCqRomvznijfPoe7xqJBqypOYn28
         6caE0ZwWGy1rOY+J8IbAyl9PoBi/YWdelfQxdwEdL+AWZGDzyx8p7JeUUYg7viXpAZKB
         S7NkVrY2U5OYypSIUKidXIXTKQ+/8rAmRRRoWlxSLV880CEeW5FnEIoqLdC25F5In+vp
         Go+/wox85UOgSYW081vypEhZXTfWm8ZTv6GaJZNsfiMJxcZOV9XO9epvbOq1ascOU/sn
         4SIugsUjvMGo1Qyns2b63sEbwc+YmAQuLd1MIBmKzq/xJ7j1zYjwJKDrw3wivSAq1cQ/
         U1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444633; x=1792049433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8u18xg6N9qLEr1Kj9955ylpG90sgpgszfVpX4EGLse4=;
        b=VwdaeWG6VLSXYSy0L/nOaJBZAU+38mt2AuQYMDlG9C0I1PiKN2Px9ctGFzlKruukbm
         kuqMD4Xtcx8xe8Gkw+fbFaovRwHdBcsle1mQIei5ge68XDfKaaUAQsb8QFhR8qvbsOfm
         R9P0Rfjbf38U2JbBVW+fJiUI9olgY/w24zbDGVXBoXHw8fob8m6FQLau9dn9SY5abS1Y
         0TbwjKtqgTK2lld3uZQOdxSQb6wd0Nh4bpVa/ZukxITFCj05EgQyahsbIiRvvaLLAIAK
         c3+due6OcKbsAeZSS7KXaVsw4o2DqzG3zufroeh1WeRwEL5HZjwIgzc8kQo/m66cNhrT
         wCrQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRfqhn27H0R/HizB1/Jzf2LUyniRxtRpofRRMWaLCLfseMb+VvDCFfCfpu4RPGX9y3HUfp2KRZ5B3Js8VE+wyr@lists.infradead.org
X-Gm-Message-State: AFq9FYJKN0AbDkujlBsWlW0nWJ6+4CDlK/gBlpLXNLI+Y5mRzG605DxF
	7GhUTne7NvQKapZScW8A0ULlDDvQISkn4JMCd8BMBQTX9MTNkaCIbrvnXrnu8/qwsE8=
X-Gm-Gg: AYBFou1dBLbxLXJxMwpAJW0QfrkRk92kcXbUVmFIZwRgQGnMG5ImZ1KgeLQ1LZUVGNQ
	TKO7g7COhvow5PrNp1artMM8p+npt5PzZrIcrb6f4APABuUyp/5AdOJLWWWdDZbcQ9N5O5O+c/v
	bK5nVvqU/2zWqCdFdC0HbjW8WPVCg+1jVQQo14TOxIGSltLq2oe/Ixaj6g3biJtYjRixih/unh2
	cxgNi/nyb6I1nbzFUsgmArFLLv4MZtrWdK2w9qJahNYTazZPbrJuRylZC0+TNu4z/iGyi2wvBVl
	Ayw0+Hk6giZgv/GLOgzVS0fV98/aHwJpKrx9/uqhHT2NK7J5iZwQmBIc5yFOumLGQTFYn0cNsqt
	ojWSVzbrFmGI02gXQ9Dx7cPZ1+SNfjQ84ObMScBJBF2XA4pxtyK0SGpFyl/r2B+yieJSFKnL1x4
	seSYd7fLit9Nk/YSx5YTsmPRvlDMfkQTG0x32UidXqFIjHn0GbYhe8u+DvQXrdp4E7aXMLSIgjr
	qpDNgi4t9aQz/tM+pE=
X-Received: by 2002:a17:90b:3ec9:b0:3a0:9aa4:f9bf with SMTP id 98e67ed59e1d1-3a8a072a971mr4136690a91.12.1791444632841;
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:32 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Thu,  8 Oct 2026 15:30:17 +0800
Message-ID: <20261008073021.2512665-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003036_392830_092F802C 
X-CRM114-Status: UNSURE (   8.75  )
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

Memory hot-remove can free page tables allocated through different
paths. Some of these paths run page-table constructors, while others,
including generic sparse-vmemmap population, do not. The teardown
paths on x86, RISC-V and arm64 do not consistently handle this
distinction, leaving constructors and destructors unbalanced and
corrupting NR_PAGETABLE accounting.

On x86, the destructor is missing for vmemmap PTE tables allocated by
HugeTLB vmemmap optimization. RISC-V also misses the destructor for
constructed PUD tables. Conversely, arm64 and RISC-V can run
destructors on vmemmap tables that were never constructed.

This series uses PageTable() to determine whether a destructor is
needed before freeing a page-table page. The RISC-V fixes share a
common freeing helper across PTE, PMD and PUD teardown.

This series is limited to bug fixes for the existing teardown paths.
A follow-up series will convert runtime vmemmap page-table allocation
to the generic page-table allocation helpers, ensuring that these
tables run the corresponding constructors. Once these tables follow
the normal constructor and destructor lifecycle, the PageTable()
checks in the arm64 and RISC-V teardown paths can be removed.

Muchun Song (4):
  x86/mm: fix missing pgtable destructor for vmemmap tables
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c   |  3 ++-
 arch/riscv/mm/init.c  | 34 +++++++++++++++-------------------
 arch/x86/mm/init_64.c |  2 ++
 3 files changed, 19 insertions(+), 20 deletions(-)


base-commit: a92f009ac1c21986ff1ea0706419e545a4739513
-- 
2.54.0


