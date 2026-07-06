Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 995A8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OH8Zt8IpG4afTGjwrwNv/V/3GqQR4XmcV5U6B0IG+d8=; b=CxcwJnot5zfT3hiMb0HffVRUUN
	s8IPLwXyx69tmJFV9rdQ1eVlQi0tN9dpaj50vHwWxcNr5N2C6MARibnxPg7xLxLiOoJ0cCJERqRVW
	XI+iw+tSsCBK3lheShKtCfhQJ/J4AceNRmedub/zBnG71BkeM2vvbgQ47fO/fDkxzq0GB8dKZhjZj
	lO1XKjJweTksXCcDDcIpbFbjM83s9aSspsiKt5JXXDKEEAiE9atwXmjQ1S5ZnoZz5sZnUIzTWCu4j
	49qRS6RvWvS9MyEtaxUwA5vJFaCAHmOkEzPe2+ZIY0d26D8DGXwDP5x/KxpjmrMTKaE/LNAkvQNfu
	kG7+0RjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj0c-0000000CWdV-0Bg1;
	Mon, 06 Jul 2026 13:05:14 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgj0Z-0000000CWcE-28oV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:05:12 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4629324e267so364051f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 06:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783343109; x=1783947909; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OH8Zt8IpG4afTGjwrwNv/V/3GqQR4XmcV5U6B0IG+d8=;
        b=K5xll0KohSSl8+sQJOX5Bq8R0FAQ1zcjhDJc3r2H4wzatxO/RwIRNq6PfG4kcndT9Q
         pT+qIlSTzrc3a0MAFm3eucsM5TqdL6yFjQpUkzx0gZ6oymEuLbuuYqgtRhUKnsUkFKHR
         2lBRU2jbvYfNigdiXw3h9pGRj1jptiozEpTIJkAf7jExLYFlWZrunhGuMOUptxaJNLij
         pHsYiSZwoaX0DImTtAoQYKZ6o9jqgn269EjtXaFqudZ7FgMzchPqI48LS9iOdbhjDPt6
         ydS6VshNY0nGx0YQ71A6221DQHQzdRW0PmG2iX4UcvCar4EJKw7ZTXzfzfml76jJePbe
         xEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783343109; x=1783947909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OH8Zt8IpG4afTGjwrwNv/V/3GqQR4XmcV5U6B0IG+d8=;
        b=ADvG82NsFIYGJEmeI45aFCz4bTbCm1Ly8qkO5mDHRUCcGLgzY4+cgXj70IChs4eK8i
         8ONe1jJOFZja/IYQaYknV3boK7PlMV0MexDOjDIVp+LpALyQEuHHY6bVOGiiDP7Q5Auw
         CLFu8upREvSwPIJT14kGOAPE2wOZ++lnfnuO/YttybOOyAVlbTajpGlhJ+Hz7iy1ulg9
         HRgcsVl5uWy0AQsFedFQQh8xRQsauVOjVbm7MfQ+gBD6W7h3naa4MkcTeGsu0psDYzxQ
         ESEcgItrzVKr45e4VwF19uuh/UTdYVowmoQDCw82d9qsq90qSPQQawHtJqxWvyVEfLOb
         YqAA==
X-Forwarded-Encrypted: i=1; AHgh+RqwLPo/KwmFTGFKj5hqTlwqF2Xqywfv5IbzcQLmTgerrm7e1dcUeyD2vxmhfRVB4biPOJlMzzDE5rCTcX1iF5gp@lists.infradead.org
X-Gm-Message-State: AOJu0Yxzq68OUQR/XyJpluugk6pUdVUR8OJcUfRJUWksXXiMbNw9x4ji
	rtgYmV6QLLTlCoXfgEyRU63kpJf50bPHUYnuanyK9GW2kweaLt9M9hhZ
X-Gm-Gg: AfdE7ck0yI8+UQ7kcqcTnX67aulUTrt/lrtGxFeiRyLL4RBPpukUQP5I3rI62kfYZlP
	jC080CNLVnwpxn1kreydPQnbPZ7a2Z2Ffr6jVp93fDTMp14UoYc2dh0ISu26ujyBeR8CvDabQE4
	2UbUcqr99lCVAoNCbUdYOIFjLvXcfVW75lVqvusRyX6SX68A8aBD7TkykelLOxaoyc689SIei8Y
	CBPy97Kx4Gqhv1iJM1jH3zM8T9Wo+swpZDZ5aS0BUL1B/psk8jNlGx4dACOEkcvMw4weEjCFVe3
	U2XHr9aTBeaHf2vvyq/TJmJfKs8c/FcKFufUOtC/xtlH1LVjw9vPQCQ4kut5QI8ZmsgJct1jWq+
	jDM1V0l67nQGk+7Uhv5xPmtaEEywljVq2XWUeSZXY0/J6TC5hbOO2KGqvesDel5TmnLHMezztkL
	j4E5g668slZKoG6IthR7OOWkZKiJu6gbVZnrtIm1JCNeSjLM8DFUWAE+gE8Kcs86JFJ3pipbVTw
	qR1OV0NTxjBD71mdt/WWdPudJbTuSNiG7c=
X-Received: by 2002:a05:6000:24c9:b0:474:3708:ca with SMTP id ffacd0b85a97d-47aabd3af09mr6808952f8f.3.1783343108571;
        Mon, 06 Jul 2026 06:05:08 -0700 (PDT)
Received: from debian.lan (vmi1894487.contaboserver.net. [154.26.158.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8f1sm24515956f8f.3.2026.07.06.06.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:05:07 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Lance Yang <lance.yang@linux.dev>,
	Jann Horn <jannh@google.com>,
	Yang Shi <yang@os.amperecomputing.com>,
	Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [RFC PATCH v3 0/3] make persistent huge zero folio read-only
Date: Mon,  6 Jul 2026 21:04:37 +0800
Message-ID: <20260706130440.9295-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_060511_567302_8E8EBFFC 
X-CRM114-Status: UNSURE (   9.82  )
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

The persistent huge zero folio is shared globally and should stay zero
after initialization. As Jann Horn pointed out[1], kernel bugs have ended
up writing to pages that were meant to be read-only, including in
security-sensitive cases. Making the persistent huge zero folio read-only
in the direct map turns such writes into faults instead of silent zero-page
corruption.

This series adds set_direct_map_ro_noflush() so mm code can make a
direct-map range read-only, then uses it for persistent huge zero folio.
The helper is direct-map specific, takes an address-based range as
discussed for set_direct_map* helpers[2], and does not flush TLBs.

Persistent huge zero folio setup happens during early boot, so no explicit
TLB flush is needed here.

Inspired by Jann Horn's read-only zero page work[1] and follow-up
discussion[3] with Yang Shi.

Patches 2 and 3 add arm64 and x86 implementations.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/0e5b23a6-4895-454a-9dfa-6dc21adc2991@kernel.org/
[3] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

RFC v2 -> RFC v3:
- Patch #01: Replace arch_make_pages_readonly() with
  set_direct_map_ro_noflush() in the existing set_direct_map* family
  (per Mike and David, thanks!).
- Patch #01: Use a direct-map address and number of pages, and document the
  direct-map-only and no-TLB-flush semantics (per David, thanks!).
- Patch #02 and #03: Update the arm64 and x86 implementations for
  set_direct_map_ro_noflush().
- https://lore.kernel.org/linux-mm/20260609143801.7917-1-xueyuan.chen21@gmail.com/

RFC v1 -> RFC v2:
- Patch #01: Drop the READONLY_HUGE_ZERO_FOLIO Kconfig option
  (per Dave, thanks!).
- Patch #01: Replace the huge-zero-folio-specific hook with a generic
  page-range hook (per David, thanks!)
- Patch #02 and #03: Update the arm64 and x86 implementations for the new
  hook.
- https://lore.kernel.org/linux-mm/20260527035607.14919-1-xueyuan.chen21@gmail.com/

Xueyuan Chen (3):
  mm: make persistent huge zero folio read-only
  arm64/mm: add set_direct_map_ro_noflush()
  x86/mm: add set_direct_map_ro_noflush()

 arch/arm64/include/asm/set_memory.h |  2 ++
 arch/arm64/mm/pageattr.c            | 10 ++++++++++
 arch/x86/include/asm/set_memory.h   |  2 ++
 arch/x86/mm/pat/set_memory.c        | 15 +++++++++++++++
 include/linux/set_memory.h          | 26 ++++++++++++++++++++++++++
 mm/huge_memory.c                    |  9 ++++++++-
 6 files changed, 63 insertions(+), 1 deletion(-)

-- 
2.49.0


