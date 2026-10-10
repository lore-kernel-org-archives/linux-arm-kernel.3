Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8B0CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=; b=SSuN8PpVo6lyuUtXZ4tVOFIJpR
	lSVk8e5aq9d+W6AF6ieK3QRqFRmbTeYtzWaEbBss9bgvmZQnhA2oSS/P/AII2QvKbD8Bzma8Y03Cq
	uyY9mp+u372ofmrYpfet5kDiTJFp8+vSeBvyHoMhS0NCR3DjXdW97+XgFtPz5PxHQn2rYk5cELWBL
	4fq5VTVPacuhBHtovd7nIhCVV7BRri59GTREl+VQnAD7z839WPq2ia7GrdMG92bsM8WvZ+dRvdkDw
	evaSWd7MDLTjVQwPGZelRqeBzf4a+/JBxIaM1CeOZOfXnJsjoJ+ZpqnNqof1CbQLyi3cYugGQBOu/
	wPM/VRvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVD7-00000007uar-3Yi3;
	Sat, 10 Oct 2026 11:25:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVD5-00000007uZu-35LE
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:25:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso327591a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631548; x=1792236348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=Spb+kjCFHhGg1SsjHIQfK6c1hpHPDKTWMW2wAsFaOSY2xOiQLwcm+lTvkOO0pZs+GJ
         AtOGpF0DaknXgQvLwwV9J3HcQcldrXskuh1ZrdJ31V50v9oMUuHG71AF60kt2WCtFkXl
         3iwUhkIHM+M02EVlb8kBWbxGNSN/hoSNjeK24zBWvewblBFC7gUuih1fOw1rWYmbOJgi
         H1usf59iCeu8w471ckg3J0DL8YfAoKuU4uZ1NTXtZK4RMd+K7lGcd3ohgY4n4AAvLaZB
         IzWGMFEDT1UU1M336gn/r6rT3//sl/ihPgZN+Ybm2HjbHyzNDv7dmTel6K7rpXL1Mlck
         rbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631548; x=1792236348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0oeUsShMWj3bJ1nudJ9ra0uDTnpz7SXDogBWHR7tfw=;
        b=gfyQTIvEaS1/eNfAoz8AcHmI0K6T1q2E5zEcSLXZ2vF+GvPq4JOD8wfkf9H0W22tMb
         n8bE6MZSecCDUrxAss7AL9Mrm6e4Cu6Dvrl/m6DAVXDUmgH4xDMEKpFw3Nd+JL7uXBJP
         Dxfav/oReBtItbBnKO5InmmEkTwE/qArOV7lD0WLZnufLsnqCh+7Gw3H533Gq6kUtXEo
         tAOx20FzNfLNnNyHGE9qgK7HBgL+FR6OwwlzbrmINSz1L2DleMK+JKt0aFwWfPp1jBID
         wGVVQJIr1DZsngqs6rr09wLP6UpbwAisqDk7pE+7eZq3Ec4tC9xTbAvTxG+Kev8fWpC0
         lZBg==
X-Forwarded-Encrypted: i=1; AKwUvBw1s4RV/2H9Gglna3SnqWsOaPOR1A+fpkumhub62TcH1YGBuuLPCuBC+A9IudvfHHNQYf00fm2CDJr+rIW2LJU8@lists.infradead.org
X-Gm-Message-State: AFq9FYLLaB1oG3/Xp/EDxkF2G9y84pJqDGO1ndYOEjvUqQwHr0+Z5UIr
	+qE+il5i1yBtWX9U5HHbqrImWa6KCiesXOSjNu0wTJwA2PtSsLozT77KBc6QKdfbTCk=
X-Gm-Gg: AYBFou1hQRG5PAMu+0Pw5PKnPjgfMn03mWzpkeeapxn+lAezBc8+qCY7sVLIQqjGP2x
	5rnXGZ9A+LN5PXf6+pBSuSsHZmETD4yoK7WDPEenPPjFhVQb/pxvdUM1HGUQ4XyJBFhc47dXGLu
	G206Iq67U9Y4kkbGC9P35e5ELraPWPjoQUvdLVp9/vKuErDTqEO3QyUBig6DZRvIG4wn72QKGz9
	k0jf0XGC8NjDU3zaxUPD+h4HD3HE4PV7lJ95Eqg5pkj0VNCGHJuQoqX4B/vV+WFyy4N6baVVB47
	rAvWO4G55BU8Ou4aoIzMXbV1diEadD+cqcBiK4XVXZGT3LV5m34gPyvvonI38Jd/ZbSKmJmSzKQ
	GiVsP75sSnsPmc/kBH7qIkiPjktS+hta+aTcCzlIVLKhdC/47KUCoCmXp3urOVmgdoSEpuPceZw
	B6l87Ueex1xKhT+sE/HkYLOUmhOqWhgeDD8VHXuNwpLyJkwNw/r9DVEZXBfBrlPpzzs5aEydR+t
	fMfT/gWvIEWljhTn9BQoiM8OBavGDUNBFphkQ==
X-Received: by 2002:a17:90b:3a48:b0:39d:f6a6:60d8 with SMTP id 98e67ed59e1d1-3ab3a33db57mr4120069a91.3.1791631547298;
        Sat, 10 Oct 2026 04:25:47 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.25.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:25:45 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/4] mm: Fix page-table teardown during memory hot-remove
Date: Sat, 10 Oct 2026 19:24:53 +0800
Message-ID: <20261010112457.49485-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042551_783669_752C165E 
X-CRM114-Status: GOOD (  12.30  )
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

Memory hot-remove can free page-table pages allocated through paths with
different constructor state. Some paths run the page-table constructor,
while generic sparse-vmemmap population may not. The x86, RISC-V, and
arm64 teardown paths did not handle that distinction consistently,
leaving constructor/destructor accounting unbalanced.

Make pagetable_free() test PageTable() and run the destructor only when
the constructor initialized the page. The RISC-V and arm64 fixes then
use this common helper for their memory-hot-remove paths.

The architecture fixes depend on the common MM change in patch 1, so
this remains a single series. I expect it to go through the MM tree,
with review or acks from the relevant architecture maintainers.

Changes since v1:
- Move the destructor decision from x86 into pagetable_free(), as
  suggested by David Hildenbrand.
- Use pagetable_free() for non-reserved RISC-V page-table pages and
  simplify reserved-page handling.
- Collect David Hildenbrand's Acked-by on the RISC-V PUD fix.
- Use pagetable_free() for arm64 intermediate page-table pages, as
  suggested by David Hildenbrand.
- Trim and update the commit messages, as requested by Dave Hansen.

Muchun Song (4):
  mm: fix missing page-table destructor in pagetable_free()
  riscv/mm: fix hotplug page-table destructor handling
  riscv/mm: fix missing destructor for hotplug PUD tables
  arm64/mm: fix destructor for unconstructed hotplug page tables

 arch/arm64/mm/mmu.c  |  3 +--
 arch/riscv/mm/init.c | 32 +++++++++++++-------------------
 include/linux/mm.h   | 37 ++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 38 deletions(-)


base-commit: 8b38ed9ab5b09c8ba168cbcc49524e9b380ee5c4
-- 
2.54.0


