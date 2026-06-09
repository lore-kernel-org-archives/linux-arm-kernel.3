Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBC8CD8CAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 14:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ptWu2hzkQ1kCjnXDRGNBo5UqedD/Jo7SZZDSrDj9pAA=; b=UJPizKD2uZh/2IiazMkyZLnDi0
	98gAIihjhmnXBkoxTCBdSXbLpG+vlvmNYwusW2RS/VRHt4pq+Tjluj7iv+upkK8Q9cC/EEoPqbZX4
	FfDLvl1VN5Rab+4jo0ks+61gJYRaElUCUBchaUBBH68bA6w375rKo7+tCO7arGBnUcKcBVfbqVyIa
	lYxLEYwxR7hSpUpM8cirqC73/CrXJceZWPnlMW6RFVi3eNGKkof8G8r/jHK3u6BUkBTqRdUhuqRDh
	IUMq8VXIksY7UUStL+S9Qyu9iFMM6BC3qB6c6eWtva5g5lXMYpyWiqFost5eANAVZjYaPW/7S2s0v
	blRtBTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxbD-00000005nVg-1GOn;
	Tue, 09 Jun 2026 14:38:39 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWxb8-00000005nUl-3Xek
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 14:38:36 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-36b78532b0dso551182a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781015913; x=1781620713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ptWu2hzkQ1kCjnXDRGNBo5UqedD/Jo7SZZDSrDj9pAA=;
        b=VCCVbn0M7sWXgnp+bPEtbw8AsT9q+9Ec7VfNbyIERRfrQLtgSH07hGhQK9ON0mAu0p
         SByLShELGl7b3PCHBK6NcV6O0j/wFfI5x+gGHaDLQoYzA7O4ZDizTRymgGu8KDQQia5c
         TgblRAzYG1tTOorXfMG+Fl+NhC8INmiZGnSCgR1D2eeor8AMDjrMEUfV1cPp5MYImmhQ
         9p4BFfciYHcvrrWK/TGaIKmvioRUynQnZ1XadODu1gi7U/TzM6qqbO4wiqr/XNMOzI5O
         cJ8zyX96t+jlP6eMXAxosK5z9DIoazd4LJlMJCVCAeolwg53N1jRezzxoU/sXlXdkeXP
         PhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015913; x=1781620713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptWu2hzkQ1kCjnXDRGNBo5UqedD/Jo7SZZDSrDj9pAA=;
        b=Vz1zQrCNgKX7U8viF51KDkQkaDX/8i7gag4AI4pSY8nV51y1kpFwZkHUMhMbuPZN3R
         t4KCCL8VFpvC7TrBgeMIehLY8u+hJoRBzciaJmvB5QtonA3RZzFdeIZgAPTMxejfdgtH
         obcGlwOgZ/lMDJ0rvbYwhMu/yTUEF5to3HvPYi3xmieo7lTmQD963VW0mptkmBgejEk1
         Z2tHAPmssZlHkgzkFjJ6CPhkM+LK/ONfxc+Brwi85LM72ETAb703HJpuzcusifRbpJ+W
         G0s7IKIVzKpj3Tg5zBdnl1OYDgfNb6vKi8mUSRcGKlvLkvYnsiMtmgmp2bcoTDH2K+eL
         dnVQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yEcFFP6SvSoO3+TlUCMFvsBh2xSzFxySwtDtVaLznhO/WSVnUnB8gkH+8WY+ca/hTeFPGcoLuQX56jQLzTlXq@lists.infradead.org
X-Gm-Message-State: AOJu0YwgtQvoiRHh+4QmyL2qWlotq7oQvypACgdSToMPzwQjX3KOxcGQ
	hC9UNRgS1F5jSlVlwnKcM0xCOOOigTk+iGcSUeSjxVsjIg5qCv3Qi4Pl
X-Gm-Gg: Acq92OEQjA2rYGXW2L+lsAv3ituKb17NbCYgIKnzZa0uqYef/CC9+KhxBq3E1XZbIYU
	ovr5MUCRMHaQy1u/Mh7/wi3p3eARxCLd7xqKHCApCi73EKJRT7lNoW07v5uGDohb5Dvj/zu4cvG
	/cPURUuOlkDVVzIsS64DfzyBDHjGuUCZLk37cupohMelwBDmr8xguvACUhaff0G35pTPSIOc91t
	Z+i4hMub7Cv+jqtqlOiBodJ+hGTSKUgqjm9qTVLtnnvR1nYnEneLWDv6CBBuCrUrQ3f1oS8S5jf
	0tltGyJw6YpalmXv4do080cHYvqj0T4JKmmtxjGdZh1DqyKYGyxmAKgAkILf97p82FoZqLnPnw/
	BjHtZN67BRXu37El/EXPqCAvULU+5BKJIOGTcnAfw3OS0/snGUKUaCbf3yJxC+S2P5T/E4jPr1A
	yApBUmMxHbGtkyPZDz46tyuB/2BXmV2c/qmRAALZjZRduekhpvqXlo+Uqc0ZbwPIrGQv1uizzm0
	OGnAMT9XOjNLbBVJACAn4jco0YE/Q4H1iM=
X-Received: by 2002:a17:90b:4d06:b0:36b:9323:c726 with SMTP id 98e67ed59e1d1-370f0963a47mr10191618a91.4.1781015912704;
        Tue, 09 Jun 2026 07:38:32 -0700 (PDT)
Received: from o6.lan ([188.253.112.242])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b315esm17939677a12.26.2026.06.09.07.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:38:31 -0700 (PDT)
From: Xueyuan Chen <xueyuan.chen21@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	hpa@zytor.com,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	yang@os.amperecomputing.com,
	jannh@google.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [RFC PATCH v2 0/3] make persistent huge zero folio read-only
Date: Tue,  9 Jun 2026 22:37:58 +0800
Message-ID: <20260609143801.7917-1-xueyuan.chen21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_073834_891383_45EED84A 
X-CRM114-Status: GOOD (  11.86  )
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

Hi all,

This series makes the persistent huge zero folio read-only in the direct
map where the architecture can support it.

The motivation comes from Jann Horn's read-only zero page work[1] and the
follow-up discussion[2] with Yang Shi. As Jann pointed out, the kernel has
had bugs, including security bugs, where pages taken with read-only
semantics were later written to. For the huge zero folio, making the direct
map read-only turns such writes into faults instead of silently corrupting
shared zero contents.

Patch 1 adds a generic arch_make_pages_readonly() hook and uses it after
the persistent huge zero folio is allocated. Patches 2 and 3 implement the
hook for arm64 and x86.

If the hook is not implemented, or the architecture cannot safely update
the mapping, the existing writable mapping is left in place.

[1] https://lore.kernel.org/linux-mm/20260508-ro-zeropage-v1-1-9808abc20b49@google.com/
[2] https://lore.kernel.org/linux-mm/CAHbLzkrXXe7r3n3jXgDKtwZhRqj=jDx9E6dLOULohnhBguvi9A@mail.gmail.com/

RFC v1 -> RFC v2:
- Patch #01: Drop the READONLY_HUGE_ZERO_FOLIO Kconfig option
  (per Dave, thanks!).
- Patch #01: Replace the huge-zero-folio-specific hook with a generic
  page-range hook (per David, thanks!)
- Patch #02 and #03: Update the arm64 and x86 implementations for the new
  hook.
- https://lore.kernel.org/linux-mm/20260527035607.14919-1-xueyuan.chen21@gmail.com/

Xueyuan Chen (3):
  mm/huge_memory: make persistent huge zero folio read-only
  arm64/mm: make pages read-only in the linear map
  x86/mm: make pages read-only in the direct map

 arch/arm64/mm/pageattr.c | 13 +++++++++++++
 arch/x86/mm/init.c       |  9 +++++++++
 include/linux/mm.h       |  2 ++
 mm/huge_memory.c         | 13 ++++++++++++-
 4 files changed, 36 insertions(+), 1 deletion(-)

-- 
2.47.3


