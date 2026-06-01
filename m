Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A0BCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 08:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=; b=VLXAZTY13l1fk5wghrzFT0GNUv
	USLG5GGNgRCKq0UB4Fx0fefAhdBjFNrNNAAjQUH4PdTJnxmJzbd4iGy5KW7nfNe9mNwoIWiU6ASe+
	fciKGaOix2A6jsYmND+rYJRtrUKhLTQcUnyuz5l2R80J8soeIoOdhXhJBLj30Q5HEYOO1IxsebMBZ
	hKyJYLFIeCzPRywm4BsjEdDVYmwHKIBGCWwvmDvdjgNSxLghkZaj+DtReMomPi9aNrIWzMVIRh5ig
	87/aWIEq2GLL9x50Is8Wxyxw7witadtW+DRX3Pg65ia8M19OV3g4eeFnRlmKhhyG2I9YUV34obflV
	St8I5aZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKS-0000000APki-3ELs;
	Mon, 01 Jun 2026 08:49:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyKQ-0000000APkG-03pN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 08:48:59 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-842319576d5so539510b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 01:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1780303735; x=1780908535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=fQBA0uH7eFLIGtIPsBMnwGJtIhP08HeQDWZi8uDunaubHp+7Ch2DGHCVwmD/x+PS/4
         tGgdpJfFqpZyJmpvXX/nLDj/q3gJbRj51HrK4lbEuOu0KD1eREeDakO//UPRQKe3DEIl
         5SBjUs9Ib8LtSMH0J8WQ3AUrYc+lHmte/D2ig71y0fUCuat5dOqnE4jzIEwXirXtO0Rk
         DDdGbY2bAoyz9AKQMo8Py7UsVQksmtG1gjuiAAq+na38nzrT7MWr5mQVFKyilBCApoNN
         S2mLJRY0Dp/PXuS4+9NBiawsuAJd6XjibZCkxqNz7bsWdOHdvyynCXx9+kBTJscnEi39
         +w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303735; x=1780908535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1haIEjJUB66z54EoqIjtLZBJBg9TY7RS+jT0B9dn0/g=;
        b=RQ9IfzrgLFyc9xxyjE4uzmZmpfhynyo7FWn/Nf55VhOrIRd/UTh3xtSceTQb9QhaXb
         EXh1xY9UO0eISvVc8rAIcX9wAZQ2jC85UAEUz9sht0P4ldyVAGULt1Dnigs6V4JvbgqC
         m0V5FMr9JcGcaHnwFtcNDwX8xfP9sJmHXH/eWZD2xX/fpdZ0pWxkOR9Xh4h5Qoq4i78Z
         ABueUQhWUwYVdS0Q+411tic9UevN+f03zRrErgWxQyuKhg/ldmiyox/7wMqziAGgAumW
         EcAhKGDZIvMDYc0xgH9gvCUUSYGTuMqcgKSm/Un28LIYy9Gn37jtSoLXTmuYjrGpysgm
         w4kw==
X-Forwarded-Encrypted: i=1; AFNElJ+0D1mRO1J2q1pERTiDhuWWkd57vdKeVy1PFfmxiZv8AzsjlQOeRwDSF3kKwgsZ/FwXE51HBJoGr3WOVKYv/wg5@lists.infradead.org
X-Gm-Message-State: AOJu0YxjVxctn+RZJoVQWorN9ng7tNQh9thdhrlFBveNg6CrlZ1laNsj
	ZV8GjoSCje9FXc2hTj8ZGNMsGOBbbaWMEHsBgTwHoJlqvPA6+BBG6aZFBzKKxwYihSY=
X-Gm-Gg: Acq92OHQNQ5gfRq/U2fOGlomXyWfxt2m1b+c2+vTOkgBLccL40FMPHuOmL92WJoj2Dn
	3xvhHV4yTTq8dVJAeH+ZJObhj4EIuU21O1bUE8wnn6LjQoKBLjcWAyE17WYS1orYj8x0sxuV3AC
	3sIVH0LjsYXNdhnfbiUvsEM6rV/1N22Pfh8gbk9uLCcPsfWUXiWoXYg/nDU5ICQzRnmkoWrvxub
	vLGADLMQzvB6GadFFedFu2ZjqwvhsqndImj69eLWvAQUY8umLgyrf2zjjfdKqCwecb/H4ILy9pD
	lAupGYTl30edFKotaK4e95I5xcISioy59MIKBKq6Fn8j9aruK/70GRV0C15o0YuIxjpIadrjd8T
	PROz2p3baEyAKMd8R9+dtVOq9mfZuuCXTyGmAIB4lhJWGN77BnxbhC4LA1gZu/EVP32F6t1qpcz
	u3cWJE4tnNnxetM5KBDhliWmYb4vs8GVID4GAH4JLxYlKxKDE9042xAQ==
X-Received: by 2002:a05:6a00:1822:b0:81e:f1c3:89df with SMTP id d2e1a72fcca58-8422575fc22mr8798151b3a.50.1780303734571;
        Mon, 01 Jun 2026 01:48:54 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84232ef8172sm6316230b3a.12.2026.06.01.01.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:48:53 -0700 (PDT)
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
Subject: [PATCH v3 0/5] mm/sparse-vmemmap: Provide generic vmemmap_set_pmd() and vmemmap_check_pmd()
Date: Mon,  1 Jun 2026 16:48:39 +0800
Message-ID: <20260601084845.3792171-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014858_080166_7BF75A14 
X-CRM114-Status: UNSURE (   8.85  )
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

The weak vmemmap_set_pmd() and vmemmap_check_pmd() hooks are
currently no-ops in the generic code, which leaves architectures that
need PMD-level handling to open-code the same logic locally.

This series provides generic implementations for both helpers in
mm/sparse-vmemmap.c. vmemmap_set_pmd() installs a huge PMD with
PAGE_KERNEL protection, and vmemmap_check_pmd() verifies a present
leaf PMD before reusing the existing vmemmap_verify() helper.

With those generic helpers in place, patches 2-5 remove the now
redundant arch-specific implementations from arm64, riscv, loongarch,
and sparc.

v2 -> v3:
- Replace BUG_ON() with WARN_ON_ONCE() in patch 1
- Add Will Deacon's Acked-by to patch 2

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


base-commit: 7da7f07112610a520567421dd2ffcb51beaefbcc
-- 
2.54.0


