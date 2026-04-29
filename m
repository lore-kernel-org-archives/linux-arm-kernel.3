Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74082FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 06:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YAMiQdl0y9iAuHJeag5d0legeH39piZcT0MdhE3hIc=; b=AJSXc1noJFSAqS4Qjkfvof/RT0
	JO2EF8lyMnTvRJC4iJh6ulG+8hCYfh6mFmZ0quw6fbV9mFrQ4RxT1tnXH8h2+SBkg/J0IofYomv4j
	jPQL/puneFv5mjnFM/PgqzEfbSLS8PVJR2L3CG23im3l7AuZs6TvZnZP2OEs0ak4LY9lFkZ1+i1Km
	JsVNPygFtKQY9mBS8SP+Dy0Ea1I1MH9XgX7DJWwGmDCPglkgHWuAnu0h/ZZG/5bReprD6rVDyWpl1
	q8kMlTedtIUxP1yuq6FKdF/N5A6TBBsrkzBBTFLsAdEmPYs3BBcpYCIP/A9TS6XPAEyZwoQ8+Xf7B
	ZQqE42Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHysi-000000034fj-2350;
	Wed, 29 Apr 2026 06:58:48 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHysg-000000034eh-0QxP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 06:58:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso5569999b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 23:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777445924; x=1778050724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2YAMiQdl0y9iAuHJeag5d0legeH39piZcT0MdhE3hIc=;
        b=QLg36gI+wGys2j35WqN7gtqnDrd9OzgnLr3YZ4t9MOpj9Lm0IJLXQWlC6HSV4ZggW9
         ghjX+Wwx6IQ6Q967zvaHUegagcHEYeVHFo9kleEtekn1i7DlVyJMLQvV5pTFR8YxWan0
         u51vJN+xyTPQIhSQCWy+XY09fbscdsK/n1auLPk4rbx0JUpWF+He+z8mc5MKkKDpba+6
         hEYxw9NTqg515FboRRr1ZgjfHgcmccRvVOnl7UPSNk6nCvMjeeUhYUoN7uGHJaTW7XcC
         1EsMyeRzTRDap+vCEUrXZ+NYm9CX5L06q7LoinOAs4Ngv551CR9SkYNxNUHmcyavsPNH
         NWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777445924; x=1778050724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YAMiQdl0y9iAuHJeag5d0legeH39piZcT0MdhE3hIc=;
        b=pCkcGiajL7JAMXTuQJx6s5nDnIVvtagplTqRn8fkWt1eHcYe8rAOFWwjytu76Pw7Rw
         GeRdIxRyOQ/FIiBdiDYu3gPZTL4wkbctqMl4ZJXlmii9wi65nXyhSYok22vfhgfGKPKs
         eKuWRB0+yrXwS/C8uIK3C9cdPUIj2wTQCPLE+At1BkzHgZrpKAP4vT7ydtI3fkRIqKf0
         CK6+HzXM2sPdMCfo0y1e8qO8XCj8jxgJAc3LD34uUS+joE4H+SWPQbhRXCrlmToWGhBp
         AhUeb3+4ODDXRSY72hY3QEux59sHZxy/81eSzy58ZdUpVvMTf7C7FoAHaUROzMSFIEG5
         SN9w==
X-Forwarded-Encrypted: i=1; AFNElJ8eEy+HpU9iltsMcl93pl74+4ogdE+Whq9tGN0fmnSyWrZty8Zt4FxVzcoYqslzAIXwkCQl2/x6VjZS1H/AOEKA@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlJFUI+kvU9mVg2phoqLPeucb5FlLe8Sju0O5ebMTmeu904Rg
	dbsdkryf4WpS9D6MwUBPmaN3ICr2WXU/Oa/mpOMRvf3x/w0kvwOcJ3IT
X-Gm-Gg: AeBDiesOdOA5RtfY2TyKxw5OHa7vzk0S9kEpj03H3paEx1dLfQnMgFyzLSxSza+VUAa
	PDZ1tfIaDaF/zfYi1by3Z9tZvwFiMVrZ6aEunTfopoPU+gWTcE6aJs/mCqzi5+CEgOiT654DyQJ
	HMwCruuIhouKqGL9r+J6S5xfYXAVCdrmtkPQxx9tXQTQsPgYn+j8Wx7IPSb3AUDs31WLO1pbw6V
	8DaofoONoW8YjBcIbVCynfzudwDvY/sXhGKsz+wUr7sU8YQCOJHUCtjAPpxWDlYBcfxXXu27V3V
	DwFNDTtfecAFNJEwMt+yLOFuCz5F8ATZYPgVPolOmH22bpLpctPc60ikFkGtx839g/eR3MHUtsE
	W8wTysYdHce4/q6176Low2fPr70FtQk/lf5tbEhVD+bJHmydAuHnLpOL6fIwkYofaHosaAlAEyd
	geEcUeg08EIZdWjY6KFl09pYUAwOvG73BHG8AH6ptXoGbzKg53
X-Received: by 2002:a05:6a00:883:b0:829:7d31:dd99 with SMTP id d2e1a72fcca58-834ddbd42f5mr6432638b3a.38.1777445924448;
        Tue, 28 Apr 2026 23:58:44 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eaf93sm1043146b3a.40.2026.04.28.23.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 23:58:43 -0700 (PDT)
From: Chen Wandun <chenwandun1@gmail.com>
X-Google-Original-From: Chen Wandun <chenwandun@lixiang.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh@kernel.org,
	saravanak@kernel.org,
	chenwandun@lixiang.com,
	zhaomeijing@lixiang.com,
	everyzhao@126.com
Subject: [PATCH 00/11] kdump: reduce vmcore size and capture time via linux,no-dump
Date: Wed, 29 Apr 2026 14:58:20 +0800
Message-ID: <20260429065831.1510858-1-chenwandun@lixiang.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_235846_145637_8D8D8A00 
X-CRM114-Status: GOOD (  13.82  )
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

This series has two parts:

 - Patches 1-4 are OF reserved_mem bug fixes and small hardening
   changes. They stand on their own and at the same time prepare the
   ground for the feature work that follows (accurate region counts,
   consistent two-pass save/reserve state, and an early-out when the
   array is empty).

 - Patches 5-11 introduce a new 'linux,no-dump' reserved-memory
   device tree property and the kdump plumbing to honour it, split
   further as:

     * Patches 5-7: core OF changes - parse 'linux,no-dump' on
       /reserved-memory/ children, save /memreserve/ firmware regions
       into reserved_mem[] with no_dump defaulted on, and add generic
       no-dump crash_mem exclusion helpers.

     * Patches 8-10: arch kdump consumers - arm64, riscv and
       loongarch each call the helpers from patch 7 in their
       prepare_elf_headers() so that 'linux,no-dump' /reserved-memory/
       children and /memreserve/ regions are filtered out of the
       vmcore ELF PT_LOAD segments.

     * Patch 11: user-facing documentation in
       Documentation/admin-guide/kdump/kdump.rst.

Motivation
==========

On SoCs that carve out large firmware-owned reserved memory (GPU
firmware, DSP, modem, camera ISP, NPU, ...), kdump currently dumps
those carveouts as part of system RAM even though their contents are
firmware state that is not useful for kernel crash analysis. On a
machine with several hundred MiB of such carveouts, the overhead per
vmcore is substantial.

This series adds a declarative way for DT authors to mark such
regions:

    reserved-memory {
        npu_fw@a0000000 {
            reg = <0x0 0xa0000000 0x0 0x10000000>;
            linux,no-dump;
        };
    };

and also defaults /memreserve/ firmware regions (Trusted Firmware /
BL31 images, secondary-CPU spin-table pens, bootloader scratch per
Documentation/arch/arm64/booting.rst and upstream DTS files) to
no_dump=true.

Interaction with existing reserved-memory flags is kept simple:
'linux,no-dump' is an OS hint, it is redundant (but harmless) when
combined with 'no-map' and silently ignored on 'reusable' (CMA)
regions whose contents are relevant for crash analysis. The 'linux,'
prefix follows existing precedents like 'linux,cma-default' since
kdump is a Linux-specific concept.

Benefits
========

 - Smaller vmcore. The excluded firmware carveouts are omitted from
   the ELF PT_LOAD segments entirely, so the resulting dump file is
   smaller by roughly the sum of the tagged regions - on SoCs with
   hundreds of MiB of GPU/DSP/modem/NPU carveouts this is a
   substantial saving, both on disk and in transit to a dump server.

 - Faster kdump. The dump-capture kernel writes less data to storage
   or over the network, which directly shortens the crash-to-dump
   turnaround. Tools that walk the dump (makedumpfile, crash) also
   spend less time on regions that were never going to be useful
   anyway.

 - No existing behaviour change for DTs that do not opt in: regions
   without 'linux,no-dump' and systems without /memreserve/ entries
   are dumped exactly as before.

DT binding
==========

The 'linux,no-dump' property is maintained in dt-schema
(reserved-memory.yaml moved there from the kernel tree).
Corresponding PR:

  https://github.com/devicetree-org/dt-schema/pull/193

Follow-ups
==========

 - powerpc also uses kexec_file and /reserved-memory/, but its
   arch/powerpc/kexec/ranges.c uses the _guarded variant of
   crash_exclude_mem_range with dynamic realloc and collects
   additional RTAS/OPAL firmware ranges. Adapting it needs a small
   extra helper; left as a follow-up.

---

Chen Wandun (11):
  of: reserved_mem: fix region count for nodes with multiple reg entries
  of: reserved_mem: reject reserved memory outside physical address
    range
  of: reserved_mem: avoid unconditional save of reg entries in
    fdt_scan_reserved_mem_late()
  of: reserved_mem: skip reserved_mem array allocation when there is
    nothing to save
  of: reserved_mem: add linux,no-dump property support for reserved
    memory regions
  of: reserved_mem: save /memreserve/ entries into reserved_mem array
  of: reserved_mem: add no-dump crash_mem exclusion helpers
  arm64: kdump: exclude no-dump reserved memory regions from vmcore
  riscv: kdump: exclude no-dump reserved memory regions from vmcore
  loongarch: kdump: exclude no-dump reserved memory regions from vmcore
  Documentation: admin-guide: kdump: document linux,no-dump DT property

 Documentation/admin-guide/kdump/kdump.rst  |  59 ++++++
 arch/arm64/kernel/machine_kexec_file.c     |   6 +
 arch/loongarch/kernel/machine_kexec_file.c |   6 +
 arch/riscv/kernel/machine_kexec_file.c     |   4 +
 drivers/of/of_reserved_mem.c               | 233 ++++++++++++++++++---
 include/linux/of_reserved_mem.h            |  16 ++
 6 files changed, 295 insertions(+), 29 deletions(-)

-- 
2.43.0


