Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451F7E88D8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=; b=kfFVNNFbTc7mGSeMOMm177Uo6U
	BkTrh9u+1zoDRMYgN0+VGvEa1a97Eg1TnthnvG9X1cSBnyJCcjaWdb5HZ77GU2PV61NRhsccxvSbx
	UBcBQ4fZK7LDv6jDVy8+/uGxzkHfqzMx1Tz+c7Lhy7/hqKDzPvCP4Ls+kbmPi7Sz+YAKHIQ1tx3F4
	ECdZzI3YbVZutI47rAmhTMHUN0nMAlY5m7YCY6xfl0VomYlxI+4k/Yg5kksPNzIPltaIKGHyc/+97
	Fxh56mkczJrBorwVTxkHLU7jR6CTtdFkzSuZuAgjNlu5nwjErN4THA1TQWSrsPeahlzJa/MEoxPod
	6Z9rTItw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w900A-00000003S2D-1WGP;
	Sat, 04 Apr 2026 12:21:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9007-00000003S1c-3BTy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 12:21:21 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so1181802b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 05:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1775305278; x=1775910078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=DdvCmZ/yH8UBxGfBqhB24Sv5jvISVnHVdhgjmXihz/wzho306l+wA2z1yjITNvygR+
         cpUbec7Sji/DyfzNIfWKgWFdpjmAavoQ4F94xoOoyMnhTCKMXMiMJnNk9cAc/RcyQoml
         a3vvzwRD7Jz4E3VMPsqjpANY5un1rq64s5bELwZDfl8Hafglf5XpA1bHNPJPCzM5VPGP
         ZdAoqoIEwS8RRDzhQ15Oa4hY1HGVrO1qwymWatwMJSz+rAC9A6l+WPbwXIHJD3c5Xi1q
         0JRIFhowNguAYm068Z3sShAI5FdcU6IMmR7G0HgnSLVzURzBp4R5qk13yoxKLwnSsN2w
         6XgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775305278; x=1775910078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmD+wUZmRVhtkrDT5Nt1vWAFME2ljMO3CvkEWHIVAgE=;
        b=XU/FRiOND/7+myId0eFjL6jXaxzcTQ5oIMTOAs6ifYLpoSy/Q7IXw52BxJ1ous2Air
         aCoCG2oOk6+2PLJ3Mf37XgV4n9jf55NOaqSCdp3fQPVF1VOTwqcpfoiLqPHUAMpv4ULD
         3+DbsFAvsIYxcagpYi+8dISroU659eI16XBirN6UwLHL4yBrWtMyNKuZ+oxP6ZwGU4Xw
         4dS4ocMd/71A+wS5ApTJSBmpdI8HZO6scg1nSDdoCF/axVZxechYPGJERI9kqRQNuVyJ
         q/qHl/5H7+sviMYXtCBxlMhQOcuaeUzQTQzTqFNdE4+6Hb+H/Lu/nvQLXVgEvd2/431g
         E2LA==
X-Forwarded-Encrypted: i=1; AJvYcCU1KvgkWBd4K0txcEr02D3z90YOeIa0TPuRIcMgPTKffQMD63QE0mXUgYF6QDaWzneXS55d0aalfgXrNF6U16xS@lists.infradead.org
X-Gm-Message-State: AOJu0YxenYj8lB1Yi4tVWmn8OdoGFZKxWYUjZSFyrz2KtAyoBRQWGGB0
	LSKdG6ore650gC4V/vsex8k7gdooqnVRV/H0pWCCHTYATpxpkoZKquNpwj5Dzq+nMus=
X-Gm-Gg: AeBDiesZ8hbqCBnaxNMA+NV0qsUa9/MkwLjZuP4Q8DXKhZqA8jV9csF+OxpiuYh4kRV
	lH9cVmzi/d/ek6eZKNaFhzaSeBxIyAZSVTMb2eWg0y5QoD65VDlC35uqOrdUo1feukF4UvKk9NY
	sOSc1l0r1RJ67Qzma5id4LutAw6Ki+0ck6pD+8VoEjnhP8OXQNxCiQro8TuMdIZ9cRMJlB916G6
	bjBCO21H8dMdQWeYMlwam+r8CGnpUpFu8MA87Zk4HwskwcmW3qu18K+3udBV4YCW0RLoa7gzzwY
	wMJW/VF1WGElf752M+o4umLXL9sEMVf9lI13rQm0WvZ9mtGmaMFjc/+k9zO9x8jyAN4sbjyNG5o
	UuKnVdYhyRG9T2fVvrFi24NTerpJnBiZrfP1LyDYeBip507UjAKy+7r+M3cFpFIZoVc2sXyAnv6
	KMb5r+ICl8SBE4n6EyQfi1+dFtV4KouoVb4p8NcIy3dDlDv+ZCZm7ywg==
X-Received: by 2002:a05:6a00:ab87:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82d0db3f376mr5931662b3a.30.1775305277918;
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cfebe5b23sm8327063b3a.59.2026.04.04.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 05:21:17 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: linux-mm@kvack.org,
	Muchun Song <songmuchun@bytedance.com>,
	Muchun Song <muchun.song@linux.dev>,
	WANG Xuerui <kernel@xen0n.name>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>,
	Petr Tesarik <ptesarik@suse.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Austin Kim <austin.kim@lge.com>,
	Chengkaitao <chengkaitao@kylinos.cn>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	sparclinux@vger.kernel.org
Subject: [PATCH v2 0/5] mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Sat,  4 Apr 2026 20:20:53 +0800
Message-Id: <20260404122105.3989557-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_052120_173768_7DCE3419 
X-CRM114-Status: UNSURE (   8.84  )
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

The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
currently no-ops on every architecture, forcing each platform that needs
them to duplicate the same handful of lines. Provide a generic implementation:

- vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.

- vmemmap_check_pmd() verifies that the PMD is present and leaf,
  then calls the existing vmemmap_verify() helper.

Architectures that need special handling can continue to override the
weak symbols; everyone else gets the standard version for free.

This series drops the custom implementations in arm64, riscv, loongarch,
and sparc, replacing them with the generic implementation introduced
in the first patch.

v1 -> v2:
- Fixed a tooling issue in v1 where duplicate/conflicting patches
  were incorrectly sent to the mailing list. No code changes compared
  to the intended v1.


Muchun Song (5):
  mm/sparse-vmemmap: provide generic vmemmap_set_pmd() and
    vmemmap_check_pmd()
  arm64/mm: drop vmemmap_pmd helpers and use generic code
  riscv/mm: drop vmemmap_pmd helpers and use generic code
  loongarch/mm: drop vmemmap_check_pmd helper and use generic code
  sparc/mm: drop vmemmap_check_pmd helper and use generic code

 arch/arm64/mm/mmu.c      | 14 --------------
 arch/loongarch/mm/init.c | 11 -----------
 arch/riscv/mm/init.c     | 13 -------------
 arch/sparc/mm/init_64.c  | 11 -----------
 mm/sparse-vmemmap.c      |  7 ++++++-
 5 files changed, 6 insertions(+), 50 deletions(-)

-- 
2.20.1


