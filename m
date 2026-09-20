Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88856C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 01:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3VMqpd4wyFLTTPKzckaIuxNzEcB+BV3yCJaVANwqLc=; b=32FXOZo0M4RyX4kDraKGL0bKvh
	JF++AS+xLiURshoJ0DjWvUGYog/221VjC5shavrIBW4TGYZXjnHZAuWUjBxZuPgld45kx6pd5MWTf
	4RaoCnywvbcKI0Kc3mXufNsI1lCm+M2/rIn5RB1S4xPHWwG6bj7IeVpErMi9oMC7nmWUA0xu22ENf
	YqdfEGncu0zANpYWAbFKn7wSdPsgDivdhjV/E3kjxowa8bIYLFjBT+m5QJtr3ZjHHRSYaOY+mvvLv
	x0a1hPbaDvUxfm37SvhYNqF6yL9ZmHOIDYrqy223ay//ubhHDyjgS7y/p0y3inA8utb2QcIreDbJL
	IROa7qjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86gN-0000000GjzS-0ioD;
	Sun, 20 Sep 2026 01:49:31 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x86gK-0000000Gjz4-4Bn5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 01:49:30 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso1391444a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 18:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789868967; x=1790473767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p3VMqpd4wyFLTTPKzckaIuxNzEcB+BV3yCJaVANwqLc=;
        b=IwM7084KL+NEhx8P3DezMwQYhvK1mSD4Iq0MOrpVBY+Fo6WtwIfJRoPhT8RKIaflye
         cGFWuEQKrUUQeIgNrtF22u8ZFpvh+JQqa96rKXwFAV+klzDPFwcSSsBY+UPQmKvoBqL1
         xWYera1jOydW4ZypnuhFE76mp7H/LW8snBV1QgHT1IbCTG3MaZ5EviBQHlYReNd0ZzIp
         q/c7GH2aZSfhuXM3k4GdUO8BOag87erzYnFa9qupfEd3bgCYbWzXLaETA/nFC1No+Q/4
         6uYgyl+2QvznoifhiGDyyuQIMuC3ewahLWdhZSjVqxieRPdtvQbqcvncN6o3CRICEUnH
         p3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789868967; x=1790473767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=p3VMqpd4wyFLTTPKzckaIuxNzEcB+BV3yCJaVANwqLc=;
        b=reCfckl1FXXP0qL2u9ZpvPYBl0nYHCl4BIZayjP9JpVSNXrZX1/Lblgw/jZyHPTbFM
         Ak5JfmqFGSJtjNnm/PkP0W4fLRocbUqzl2Wd7LUBUHM+NVWuOVyVZv03o/oKx5Pcavx/
         vwM6IesckC9XocUscN1KWLWInLiTHVA4JrdcoH9mkMOZuYsx5hj39eccaK+iGv10usX5
         1hHmr8Yhb0cbwiLwIdbskTHYlD5BTUmRBMjuVnCCa9qmKSsJWjZySR4EQZRfR147xEc8
         ks3aW0xL+e4hfRF5LcawhYT9NJHhfPDiyVhUJooh9KAus7WnFmGC6tlLpR1lkLP3ffT6
         Yndw==
X-Forwarded-Encrypted: i=1; AKwUvBy2mfHc/dtp/Gh6xuv08nfEDlZ8pm4r8IyeEuAzWYwzd5vulxscw1b6fmdTmsVx60hSGO9XaTII9/Oa4gLsl1Q4@lists.infradead.org
X-Gm-Message-State: AFuF++mtxnhXzLMYVk7MqIuBeNqKJFJbBYKhMe21f1PCIjK7Wd/msgCh
	HRNtZjZH3lAxJOclRJVsGp+TAwHFixzesTkKmNkIg9qEkAzfgiSuXDxm
X-Gm-Gg: AYBFou1/fP5pU9vKf/yzufEecm1KRCafvISseFgifv++6ow7wdmS1B+AJz3i7XVCfBS
	FdGoU+zgImAY5CCsc1YO8AdaxRB8A42QsZnTMZNeLRqAqchz0gE01HwyNUwR6hHr6SsJb+DzKip
	dTjmRpoFdXQpxYMThS0DoNbp29doMQsRZZLsQGZWboAizh6d5Yxwso4Q8q7hd3yGgOWJ6b4kG8Z
	WVLsASg/C08ueXu3lo2mA1rZTUUFhfsFWryW6DkWbmkEXnjt+Qqx4880qyTNsOEQhS6o43fZ15X
	7sXFEAxvSqIUjq8RDTQHUvPdLREQhsznlPQlgGMJm2Sj7q80EHd9EpghqrrHwWu8yCENHdRVupR
	DVvvYks6UEBfznIQ7AVG651g5HHt1RHybaOWPUi6lazqWWMb1csn8S07NW8KDyzs180K/bYbrvu
	PH2XvA3o99/gKyTO9IXdWSRxGpCKKvDuDoURLalaxaJmY505cizttkNFqwlsslJw3k2ZJ+cOCZU
	4RAvsNmfMyZOA4yMC/JA40xOQ==
X-Received: by 2002:a17:90a:d884:b0:39e:6a7e:ee16 with SMTP id 98e67ed59e1d1-39e6a7eef52mr6036581a91.34.1789868967269;
        Sat, 19 Sep 2026 18:49:27 -0700 (PDT)
Received: from 192.168.1.3 ([2409:8a1e:2e81:7320:b04b:54a9:ba93:7a0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm9517021c88.2.2026.09.19.18.49.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 19 Sep 2026 18:49:26 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Fuad Tabba <tabba@google.com>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v3 0/1] KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay
Date: Sun, 20 Sep 2026 09:49:10 +0800
Message-ID: <20260920014911.58616-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260918040214.85580-1-ndaugoing@gmail.com>
References: <20260918040214.85580-1-ndaugoing@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_184929_078073_D61BE88B 
X-CRM114-Status: GOOD (  17.11  )
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

Hi Marc, Oliver, Fuad, and KVM/arm64 maintainers,

Following up on the discussion around the remote LPI disable vs LR fold
race [1], this series addresses the issue at its root: the last_lr_irq
cursor introduced in commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail").

Problem:
vgic_v3_fold_lr_state() / vgic_v2_fold_lr_state() walk the overflow tail
of the ap_list starting from *host_data_ptr(last_lr_irq) without holding
ap_list_lock. Caching this raw pointer across the entire guest execution
leaves it vulnerable to concurrent modification: when a remote vCPU
disables LPIs via GICR_CTLR, vgic_flush_pending_lpis() unlinks the node
with list_del() and drops its reference, leaving last_lr_irq pointing to
a poisoned or freed object. When the vCPU exits, the walk dereferences
corrupted memory, causing a kernel panic or UAF.

Oliver and Marc suggested taking ap_list_lock in
vgic_v3_fold_lr_state() [2][3]. I tried that approach first, but it
runs into the following lock-order problems:
1. kvm_notify_acked_irq() grabs regular spinlocks and can re-enter
   vgic_queue_irq_unlock() (which takes ap_list_lock), causing deadlock.
2. vgic_put_irq() is a no-op for SPI/PPI, but for LPIs it calls
   refcount_dec_and_lock_irqsave() which acquires dist->lpi_xa.xa_lock
   when dropping the last reference. That lock sits above ap_list_lock
   in the lock ordering, so calling vgic_put_irq() under ap_list_lock
   causes lock inversion.
Addressing these under a global fold lock requires deferring all EOI'ed
SPI notifications to a stack bitmap and deferring LPI releases with
vgic_put_irq_norelease(), penalizing the fast path for all exits even
though folding hardware LRs does not touch ap_list at all. It also still
requires pinning and clearing the per-CPU last_lr_irq pointer.

Changes since v2:
- Replaced the skip-unlink approach of v2 with dropping the last_lr_irq
  cursor entirely and serializing only the overflow EOI replay under
  ap_list_lock (per Oliver and Marc's suggestion [2][3]).

The cleaner approach in this patch:
1. Drop the fragile last_lr_irq per-CPU cursor entirely.
2. The common fast path (folding hardware LRs) runs natively without
   ap_list_lock. We record the INTIDs of the used LRs in a small stack
   array (VGIC_V3_MAX_LRS / VGIC_V2_MAX_LRS entries).
3. If eoicount == 0 (the vast majority of guest exits), clear
   cpuif->used_lrs = 0 and return immediately without taking ap_list_lock.
4. If unlikely(eoicount > 0), acquire ap_list_lock only to scan the ap_list
   and pin (via vgic_get_irq_ref) up to eoicount active interrupts that
   were not in hardware LRs. The scan is a linear walk over at most 16/64
   LR INTIDs per candidate, on the rare eoicount > 0 path - bounded and
   acceptable. lr_intids[] only records INTIDs from the used_lrs range;
   the extraction mask mirrors vgic_fold_lr() exactly
   (ICH_LR_VIRTUAL_ID_MASK for GICv3, GICH_LR_VIRTUALID for GICv2),
   so no stale or invalid slot can produce a false match.
5. Drop ap_list_lock immediately, and then replay their deactivations
   outside the lock, naturally eliminating both eventfd re-entrancy and
   lpi_xa lock inversions without changing any function signatures.
   vgic_fold_lr() has no error path, so cpuif->used_lrs = 0 is always
   reached after a complete fold, with no risk of partial cleanup.

Note on EOIcount hardware limits:
ICH_HCR_EL2.EOIcount (GICv3) and GICH_HCR.EOICount (GICv2) are both
5-bit fields, giving a maximum value of 31. The targets[32] stack array
and min_t(u32, eoicount, ARRAY_SIZE(targets)) bound together ensure no
overflow even if hardware writes an unexpected value.

Note on EOIcount source:
For GICv3, eoicount is read from cpuif->vgic_hcr, which is populated by
__vgic_v3_save_state right before ICH_HCR_EL2 is cleared in hardware.
For GICv2, vgic_v2_save_state reads GICH_HCR via MMIO into the same
cpuif->vgic_hcr field (when LRENPIE is set) before writing 0 to GICH_HCR.
In both cases the software copy is the only valid source; reading the
hardware register after save would return 0.

Note on scope:
This series fixes the use-after-free in the ap_list traversal caused by
last_lr_irq. It does not address the separate concern raised by Oliver
in [2] about a pending LPI still sitting in an LR when RWP=0 becomes
visible to another vCPU; that may require a stronger approach (e.g.
halting the VM) and I am happy to follow up separately.

[1] https://lore.kernel.org/r/aiHrGM1f8czcUby4@v4bel
[2] https://lore.kernel.org/r/aiJi5a3JJ-TbWL-s@kernel.org
[3] https://lore.kernel.org/r/87a4t99z9n.wl-maz@kernel.org

Yuchao Zhang (1):
  KVM: arm64: vgic: Drop last_lr_irq and serialize overflow EOI replay

 arch/arm64/include/asm/kvm_host.h |  3 --
 arch/arm64/kvm/vgic/vgic-v2.c     | 64 +++++++++++++++++++++++--------
 arch/arm64/kvm/vgic/vgic-v3.c     | 74 ++++++++++++++++++++++++++-----
 arch/arm64/kvm/vgic/vgic.c        |  9 +---
 arch/arm64/kvm/vgic/vgic.h        | 14 ++++++++
 5 files changed, 114 insertions(+), 50 deletions(-)

-- 
2.53.0

