Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48755C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 13:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NoPNTj3V5YtvLo2U0JoAwgjQlQPlLdtIAiFjHR9ruWQ=; b=RCm+E0iM7qa+YrNeTAz5osGaX6
	S6b2BRix+kUX7URgo44Weyg4YksykgRCQhQOnHY6lCZwl/e+p3YwUqqRTB3AgJdw3LS4PnHgyUNmS
	tE44uuz2QiiInVNnuzW0j4krMAurNM5r3QFlxwDsdPMfoBXEpkmOOWZ3+QQNvhO3wZFQJrYc3v50G
	h3a94ji2b87eEeM61boatDuHCkqkR3HUXCZ7dtzgcL8i+uyzRZTJTyrSsU2a09fa9dLESTgrXLrPS
	DYCuMhSBmsJRRsKpTmTc8eVF7vQkIw4CHC1udtk7D+3jisOPlXRwzDfYIzNwdnn8+yT11JzOtkVgy
	5S+BAdkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc6z-0000000ErZf-1oQI;
	Fri, 21 Mar 2025 13:08:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvc5A-0000000Er2H-2XuV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 13:06:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913fdd003bso1042744f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 06:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742562399; x=1743167199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NoPNTj3V5YtvLo2U0JoAwgjQlQPlLdtIAiFjHR9ruWQ=;
        b=y8AyN2DzXzU6Tu+JzUZdV14RHxDbKRBRPSSTqBjlSSosbMgXCpQc8QKkbyir96Nd4J
         VTScxZrfsBCTJ0l+AQ4jitoEAmxngLY08ufFRFX2TexRW11q1/wR3JEfNavRRoaHWOkW
         ACdjUkEUUuLx38TNXNHI77ct4nMIyy+HCj89S7zNxPr5qWubuu7hzZS+TRi7QZABEYKq
         Bo9gfnzwEV04s9hwJNI7Rpah3GPnehwtVNVhxnZwI3EUjwqX7893xck5PPUIn9y5j6g9
         NXnhqr1XQ+4Ah4yAqKv+5ryMhH0A+Gg1FwlkHOnhOr5X2CgOhDVMta14oI4cZ4hzy5AO
         qFtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742562399; x=1743167199;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NoPNTj3V5YtvLo2U0JoAwgjQlQPlLdtIAiFjHR9ruWQ=;
        b=u9FDV2lxd5+4epLsvU4LHYM5cNjTL5rXByBWvZ3zD6rhDWMXTrdKPt6DBpCf7vd1lk
         0Bfnt5ODDOjq3XFdswW0B452wITrvZMTM2eBgvUlQWN5ZfEboco3VLTqw4I2o5AyFY0m
         tCJ91lrhSruOavXe/oufUPLuF0iOCivubZ0RjnQXm9BtUPoS0axLBwuQqxPqR1l5d94n
         TaZUmtWHdsJ0wJVSu1LBys4KLmM10zpbKJOFhkP5dtXC0Tkh4h+dBbqoSKc5t8qbMDL5
         4KGmeOE74XYr9daHjs3c+wCFjCKFsl1C8+G6XKgID6VN2t+i7XmVbWV2x3sI1cWkRMy+
         a4WA==
X-Forwarded-Encrypted: i=1; AJvYcCXKWBQRoIehLFxFQrGDexO8Mcco0BN4sbfgIPb31C/c19uq1IimU3LbVvml5IRu8VisHmZddV/Z8XHezjwkoHNE@lists.infradead.org
X-Gm-Message-State: AOJu0YzMJEekB3dC9HmHr31EGOe3zH0zerzliihO3lQfDr/ZqkVs0bY5
	mvzC1BZ2P56OFeZipsi5Cq53x4eDuOK9Qw7e9ftOO1shOY7XplooRS8nOiBMqCIunQCmzjM+hNQ
	y
X-Gm-Gg: ASbGncsSZMSuOX1MEU7QKrmB82dNMIlyrdmzjP11UgdQ2E4XxVzU8J9NEXGnjGX2LuP
	+ztjId8Jov6EjbpvZgz3qisq2EuekD+3TuxnIus9p5R5SBREF4CGRl8tXg4YSq2+l8rrZ4wHyZu
	IEN5XsJXNdzm4aGse4z16BtzAFlkBoobNVbzhFIfzWndhDBDVW7LezQCHNqlb1qVlk7N96Db+XO
	1nanmWJMVyC/D4wTtn8D+hmkBtSrKU0x6KMmuzqgyI8AJbx7ecCB14vaZbBvBq+Vzd7P9yUXF2H
	UgKEAaFWgedp2sQMy4eLHRmCu4ULzzQi4pud5iIuKaB412yn0Mm6gmiHVMpzrm2fzVPiXA==
X-Google-Smtp-Source: AGHT+IEOpmQu3vdRTdoPK4Nh9YP5qAW7X5GoPVuQLhck+hEVtrUjAV5TX9kBkzKS3ZyCGSIbxUt4SQ==
X-Received: by 2002:a5d:6c6a:0:b0:390:f5c8:1079 with SMTP id ffacd0b85a97d-3997959cde3mr6694234f8f.24.1742562398418;
        Fri, 21 Mar 2025 06:06:38 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com ([2001:861:3382:ef90:3d12:52fe:c1cc:c94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9b5b8dsm2363992f8f.59.2025.03.21.06.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:06:37 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v5 0/9] Merge arm64/riscv hugetlbfs contpte support
Date: Fri, 21 Mar 2025 14:06:26 +0100
Message-Id: <20250321130635.227011-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_060640_645871_A41A2B1E 
X-CRM114-Status: GOOD (  18.46  )
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

This patchset intends to merge the contiguous ptes hugetlbfs implementation
of arm64 and riscv.

Both arm64 and riscv support the use of contiguous ptes to map pages that
are larger than the default page table size, respectively called contpte
and svnapot.

The riscv implementation differs from the arm64's in that the LSBs of the
pfn of a svnapot pte are used to store the size of the mapping, allowing
for future sizes to be added (for now only 64KB is supported). That's an
issue for the core mm code which expects to find the *real* pfn a pte points
to. Patch 1 fixes that by always returning svnapot ptes with the real pfn
and restores the size of the mapping when it is written to a page table.

The following patches are just merges of the 2 different implementations
that currently exist in arm64 and riscv which are very similar. It paves
the way to the reuse of the recent contpte THP work by Ryan [1] to avoid
reimplementing the same in riscv.

This patchset was tested by running the libhugetlbfs testsuite with 64KB
and 2MB pages on both architectures (on a 4KB base page size arm64 kernel).

[1] https://lore.kernel.org/linux-arm-kernel/20240215103205.2607016-1-ryan.roberts@arm.com/

v4: https://lore.kernel.org/linux-riscv/20250127093530.19548-1-alexghiti@rivosinc.com/
v3: https://lore.kernel.org/all/20240802151430.99114-1-alexghiti@rivosinc.com/
v2: https://lore.kernel.org/linux-riscv/20240508113419.18620-1-alexghiti@rivosinc.com/
v1: https://lore.kernel.org/linux-riscv/20240301091455.246686-1-alexghiti@rivosinc.com/

Changes in v5:
  - Fix "int i" unused variable in patch 2 (as reported by PW)
  - Fix !svnapot build
  - Fix arch_make_huge_pte() which returned a real napot pte
  - Make __ptep_get(), ptep_get_and_clear() and __set_ptes() napot aware to
    avoid leaking real napot pfns to core mm
  - Fix arch_contpte_get_num_contig() that used to always try to get the
    mapping size from the ptep, which does not work if the ptep comes the core mm
  - Rebase on top of 6.14-rc7 + fix for
    huge_ptep_get_and_clear()/huge_pte_clear()
    https://lore.kernel.org/linux-riscv/20250317072551.572169-1-alexghiti@rivosinc.com/

Changes in v4:
  - Rebase on top of 6.13

Changes in v3:
  - Split set_ptes and ptep_get into internal and external API (Ryan)
  - Rename ARCH_HAS_CONTPTE into ARCH_WANT_GENERAL_HUGETLB_CONTPTE so that
    we split hugetlb functions from contpte functions (actually riscv contpte
    functions to support THP will come into another series) (Ryan)
  - Rebase on top of 6.11-rc1

Changes in v2:
  - Rebase on top of 6.9-rc3

Alexandre Ghiti (9):
  riscv: Safely remove huge_pte_offset() when manipulating NAPOT ptes
  riscv: Restore the pfn in a NAPOT pte when manipulated by core mm code
  mm: Use common huge_ptep_get() function for riscv/arm64
  mm: Use common set_huge_pte_at() function for riscv/arm64
  mm: Use common huge_pte_clear() function for riscv/arm64
  mm: Use common huge_ptep_get_and_clear() function for riscv/arm64
  mm: Use common huge_ptep_set_access_flags() function for riscv/arm64
  mm: Use common huge_ptep_set_wrprotect() function for riscv/arm64
  mm: Use common huge_ptep_clear_flush() function for riscv/arm64

 arch/arm64/Kconfig                  |   1 +
 arch/arm64/include/asm/hugetlb.h    |  22 +--
 arch/arm64/include/asm/pgtable.h    |  68 ++++++-
 arch/arm64/mm/hugetlbpage.c         | 294 +---------------------------
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/hugetlb.h    |  36 +---
 arch/riscv/include/asm/pgtable-64.h |  11 ++
 arch/riscv/include/asm/pgtable.h    | 222 ++++++++++++++++++---
 arch/riscv/mm/hugetlbpage.c         | 243 +----------------------
 arch/riscv/mm/pgtable.c             |   6 +-
 include/linux/hugetlb_contpte.h     |  39 ++++
 mm/Kconfig                          |   3 +
 mm/Makefile                         |   1 +
 mm/hugetlb_contpte.c                | 258 ++++++++++++++++++++++++
 14 files changed, 583 insertions(+), 622 deletions(-)
 create mode 100644 include/linux/hugetlb_contpte.h
 create mode 100644 mm/hugetlb_contpte.c

-- 
2.39.2


