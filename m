Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C83D5D688
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l7+Mjo89P4AdQIIV//Uu9js0oVBe923zMULMp7p6G5Y=; b=GQstDS9rBYNr0ZvLs0mpycCvC1
	NuexMLIkcjq+1zU2hHwzQ4pcwYwLz+nlor6gcghWLD+NXf7qH9SW4fm1KpSh54uTkDule2VBjx1Gm
	p69yZrdd3kVvpu9IfqkOkLzJMQj8WM407h5ZodD0BE7Qwq8E55g2KIquM58QjMZPSXo9THBbID5XW
	amKkj/r/L67tenR6RAkQ+7PPdytnduAjdPk4KDvtEXlKsy9YozDxZycjlJ+/gay67Qn5s3N/dYw2Q
	7GKstE9r56L1z2ydKY/CjPR/BbFOTx3/QRgIgFDSh9R0T8NqexFx07b3iPA7Ryt0+G32rsFTf/lQ3
	5vu7w4zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t991U-00000008ESi-16li;
	Thu, 07 Nov 2024 20:22:32 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t98zf-00000008E2e-37fF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 20:20:41 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290947f6f8so2269113276.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 12:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731010838; x=1731615638; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=l7+Mjo89P4AdQIIV//Uu9js0oVBe923zMULMp7p6G5Y=;
        b=HvCa/OAcGbsZ8DpSzuiw2Er6ruT4r4ShTISWFuognz4yZuRfX3WQp4dGxqbfNeJYYa
         j9jneOXsmMFWT5TmCxY6ojJw2tMb+8c8J5BZuxwkTNLn+0HzekpsN1uaBUGZxS0MS+I1
         XkR/psqST2NZqIKUbPNPOMHNWMuhLv2kXjGZluEJ4UIokMg8/GpZJsQXhwILDFYNfyaA
         N/aUoJeAeLRfb+kkHOTJA1Xw2o7Fwb0wLTJ8lAyFEuXEOTUTaq7YzQ5eeKBbeF0twGMu
         9/fe6a6UC9lQoqCLEMEu1hmfhyqCx/qdd9iNd/04Pr+x2fKCU833xz1T8bJtq/rur20K
         pnAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731010838; x=1731615638;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7+Mjo89P4AdQIIV//Uu9js0oVBe923zMULMp7p6G5Y=;
        b=fgOfWTOH5TYnEOf6hdXJFaCvBur55SD3Z0nmNUZOC+jTvzFVhA3CnUE2ogAEVbAENR
         8qlI9ph9QTBWPQvlkqisjKtVt/fV4irl5ipTZVP9Khr9jfe1xlLJ8H6j/mS0BvAkeeyl
         jp58Hn/VIFWS40uy+9+4PfsH/lGwom1CHkUfvZCcxny2H7qUZWoIBH6scIwqXa81HtG6
         pDjmMGRIU2sxDhCluMERknIwGqKWKAQmVtSuVHRy3wSAmgv7J1Q00jzPEiSjbo5dGHKo
         csYJuqoD2B4biRwdj5v/ycrZSldnTxvzjbi9VtR9nK/Bfiag0R6hnTLZIOwgSbeXHf7s
         +qrg==
X-Forwarded-Encrypted: i=1; AJvYcCUIJRLrQdJ0vnmIPYup/b8TNMllUYDxl0+wHxq501j/4q5rhpkqaLHcfoaYhMVbomeJgvGgTXPn19ilXl1wJbeb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ZsWDjS2MoTeKqoQrvROlJeHW8fZm+FAM8Bsn6/dPdyDcShLO
	I/VherHsZcQFdEnc9KZswBQCY32hB1rHHe3xd2Bjw4p3gbuy/hdVhgy5OOvfDK4pf1q2SldhlwO
	ENQ==
X-Google-Smtp-Source: AGHT+IGMlauM2Ccm7lpcq+NmFLTze2u+1oA+ThJ4YgG3NG0DPe4hsPEtWI2lkBjtgT/O9I9Gq0F9hjCGH4Y=
X-Received: from yuzhao2.bld.corp.google.com ([2a00:79e0:2e28:6:a4c0:c64f:6cdd:91f8])
 (user=yuzhao job=sendgmr) by 2002:a25:dc4a:0:b0:e25:5cb1:77d8 with SMTP id
 3f1490d57ef6-e337f8ed8bbmr193276.6.1731010837952; Thu, 07 Nov 2024 12:20:37
 -0800 (PST)
Date: Thu,  7 Nov 2024 13:20:27 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Message-ID: <20241107202033.2721681-1-yuzhao@google.com>
Subject: [PATCH v2 0/6] mm/arm64: re-enable HVO
From: Yu Zhao <yuzhao@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_122039_845874_23178F8B 
X-CRM114-Status: GOOD (  12.42  )
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

HVO was disabled by commit 060a2c92d1b6 ("arm64: mm: hugetlb: Disable
HUGETLB_PAGE_OPTIMIZE_VMEMMAP") due to the following reason:

  This is deemed UNPREDICTABLE by the Arm architecture without a
  break-before-make sequence (make the PTE invalid, TLBI, write the
  new valid PTE). However, such sequence is not possible since the
  vmemmap may be concurrently accessed by the kernel.

This series presents one of the previously discussed approaches to
re-enable HugeTLB Vmemmap Optimization (HVO) on arm64. Other
approaches that have been discussed include:
  A. Handle kernel PF while doing BBM [1],
  B. Use stop_machine() while doing BBM [2], and,
  C. Enable FEAT_BBM level 2 and keep the memory contents at the old
     and new output addresses unchanged to avoid BBM (D8.16.1-2) [3].

A quick comparison between this approach (D) and the above approaches:
  --+------------------------------+-----------------------------+
    |              Pros            |             Cons            |
  --+------------------------------+-----------------------------+
  A | Low latency, h/w independent | Predictability concerns [4] |
  B | Predictable, h/w independent | High latency                |
  C | Predictable, low latency     | H/w dependent, complex      |
  D | Predictable, h/w independent | Medium latency              |
  --+------------------------------+-----------------------------+

This approach is being tested for Google's production systems, which
generally find the "cons" above acceptable, making it the preferred
trade-off for our use cases:
  +------------------------------+------------+----------+--------+
  | HugeTLB operations           | Before [0] + After    | Change |
  +------------------------------+------------+----------+--------+
  | Alloc 600 1GB                | 0m3.526s   | 0m3.649s | +4%    |
  | Free 600 1GB                 | 0m0.880s   | 0m0.917s | +4%    |
  | Demote 600 1GB to 307200 2MB | 0m1.575s   | 0m3.640s | +231%  |
  | Free 307200 2MB              | 0m0.946s   | 0m2.921s | +309%  |
  +------------------------------+------------+----------+--------+

[0] For comparison purposes, this only includes the last patch in the
    series, i.e., CONFIG_ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP=y.
[1] https://lore.kernel.org/20240113094436.2506396-1-sunnanyong@huawei.com/
[2] https://lore.kernel.org/ZbKjHHeEdFYY1xR5@arm.com/
[3] https://lore.kernel.org/Zo68DP6siXfb6ZBR@arm.com/
[4] https://lore.kernel.org/20240326125409.GA9552@willie-the-truck/

Major changes from v1, based on Marc Zyngier's help:
  1. Switched from CPU masks to a counter when pausing remote CPUs.
  2. Removed unnecessary memory barriers.

Yu Zhao (6):
  mm/hugetlb_vmemmap: batch-update PTEs
  mm/hugetlb_vmemmap: add arch-independent helpers
  irqchip/gic-v3: support SGI broadcast
  arm64: broadcast IPIs to pause remote CPUs
  arm64: pause remote CPUs to update vmemmap
  arm64: select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP

 arch/arm64/Kconfig               |   1 +
 arch/arm64/include/asm/pgalloc.h |  69 ++++++++
 arch/arm64/include/asm/smp.h     |   3 +
 arch/arm64/kernel/smp.c          |  85 +++++++++-
 drivers/irqchip/irq-gic-v3.c     |  31 +++-
 include/linux/mm_types.h         |   7 +
 mm/hugetlb_vmemmap.c             | 262 +++++++++++++++++++++----------
 7 files changed, 362 insertions(+), 96 deletions(-)


base-commit: 80fb25341631b75f57b84f99cc35b95ca2aad329
-- 
2.47.0.277.g8800431eea-goog


