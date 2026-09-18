Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D8BC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 04:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RwTY/5NxTgAeB7jQNGmeRkMgpBA9gU5D7GhrWXLQQXk=; b=3e2VnZ/27ircWaV5Cl38fd8kpA
	kcb/exgcopXLL73T+NjphzLOy8vGKv7T/RKlwa4XBxENGjzVDVlwCiFj47T0jBe92hZDEuGkW32eT
	GlngbEH7CrO9HWhAhrfPomheaUTf7VjJfMp7Kq478cw3TrKfn/uAlgdGhba0l5KHaWwNwur6tiSIw
	/IHdWUhYbaEqBltcAp6bY5TyuLH04WvJpEQEJopXxbbG8djUYQNt3QRSBohDEfolEbuXBFobTPko5
	HFbDEQculo+tOtpuFewvBlFy0nBKammO3C4FXaBsQ7ERxBXZqHFKuf/z1jXvC+10rPo6Ued6Am3qb
	ljrKW5IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Pnu-0000000DQXY-0mMV;
	Fri, 18 Sep 2026 04:02:26 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Pns-0000000DQX9-1Yvs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 04:02:25 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f05ffcso2138465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789704143; x=1790308943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RwTY/5NxTgAeB7jQNGmeRkMgpBA9gU5D7GhrWXLQQXk=;
        b=Dw/ZnO1g43q4XltngcljBgxTwKhTpYqc6nmOPndnlw3QWQiWK0caZWRT7YLsYNXCqb
         SQZYXMjKWJQKcqgkC3iU7pRGGS7iwEsBsuZjXe9r9bGvuCXBdM1MqNOmzYAa1O2mnTfz
         CgUIwfF7O526O7zO/R0RR4tJmqB5X+rFtaqOBg5mgJjFbmgDLrCVAqaGsX62JzLLriar
         UERyUBobvSouJkUdT/QaQARlkQCkVNfjjLlM+A3b5bVGyEuM6cxyyhMtV1Ylou5ymmQq
         g+ZgEZN3HXq6Z5n+a26HFUlvj6y/E2XJRk7cOCciSn+cpOc6hieslU2ejruHjv50ANa5
         drgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789704143; x=1790308943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RwTY/5NxTgAeB7jQNGmeRkMgpBA9gU5D7GhrWXLQQXk=;
        b=ORyueGfNFckJB34ihaBTDSdASZ5ijNEX/+SUEkL8jWADyrnxYTqUcKw5uCOGe7E6sm
         nzgwxLLIB4oBMzZNmVied5wMDJYp0Wxmofvjs9HfYXIdWj8O0XKAG8qS3EUEKpstuADS
         t30lDLRM0eboZEioHcrWsqKajWBpikx2UyH67QW+z79SenxU41Kmxqqvr9GUyWs9IkEy
         +GL28meuLF68n6pl9FHh2YawT6tk3HgxJM6gQ13Ytsmz3JwBOtoedERCSAqUTdqiJe7u
         bnYpRJuigKAqvCGi/rtTzFGLgzd37qiOX+48kbc/dXR/Tw5OVuohGA5N9ujs0Ra0FF6E
         bdOQ==
X-Forwarded-Encrypted: i=1; AKwUvByyQWxH62O76+m+HHCPsbMvtIhPIqU+MgvXdGMMKJgY/raXO/TiGhDLbQ/lpZ9R3dYNeHfp3fkRxIE42jdR8tS4@lists.infradead.org
X-Gm-Message-State: AFuF++lfxu/UTHMdZWHK9rvtTE+zATGdCYgkYTRSV0OFXVENZ1X8tJoC
	GgDn9qUMdsleJDH7dKg+kVmvTvkRa7oMTkduDamof9MlOrugMd5pZxOc
X-Gm-Gg: AYBFou2ywTzKibJnfashdsUsmvBAciDYrY0XYdCZEvxbczqMCJSkHiCbDu2/EXkWfMO
	hvT0d04ZjMdnEV3rmXtIR/4/CrtdSw7rYXi1/qtmXM1teqp2WWAcxGa9QXXPrenod2+d49gPLEY
	qNpc8gKFJhaVUEcaFLiVLM2Abh2T/157SdZ4OgEtlmLQ8OId1MkcmUuB9BHorfIC9NUDl06Hmbg
	c+s/2Ze0HpO9sk5nOMiH6z9F5oPN7Bf3A4t1PTAmaGh7nx7GVw0JVxEVDEYz54pplx6N52AWGVd
	dHADsssHb7E75uQ9pKCzMZ1SiPzNmR/1hLQj9X7c21GeubIwe0I34S9KNdGem/U6+/Lm24K4ppW
	RncEjRhUpEN5mTAKXd/aU4JRijNXQx+Q1e53vtjrxaF2xYZ3J1kDidLhOCOsgCVArMjB5+xARNq
	1oM0GK02RUhehXMMBIp24rEc+lT7EghFJk0oy/TmEX5oDmDRP7hPgyYM5MWozLB6Cm4/uN4OqOk
	wQbdbkcOnmWZ0fTtbSC7tBTwlOPzt2MBXhEIOE=
X-Received: by 2002:a17:90b:2fcd:b0:39d:ecb6:8d40 with SMTP id 98e67ed59e1d1-39e54af2148mr3003726a91.4.1789704143301;
        Thu, 17 Sep 2026 21:02:23 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:608a:778a:c473:ac82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c287be968sm719908eec.26.2026.09.17.21.02.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Sep 2026 21:02:22 -0700 (PDT)
From: zjamg <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: [PATCH v2 0/1] KVM: arm64: vgic: fix UAF/crash on remote LPI disable
Date: Fri, 18 Sep 2026 12:02:13 +0800
Message-ID: <20260918040214.85580-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_210224_415941_036B6C0A 
X-CRM114-Status: GOOD (  13.48  )
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

From: Yuchao Zhang <ndaugoing@gmail.com>

Hi Marc, Oliver, and KVM/arm64 maintainers,

By code inspection of commit 6da5e537f5af ("KVM: arm64: vgic: Pick EOIcount
deactivations from AP-list tail"), a race condition exists when a remote
vCPU disables LPIs while the target vCPU has an in-flight LPI in a List
Register (LR).

Specifically:
- vgic_flush_pending_lpis() unconditionally unlinks all LPIs from ap_list
  without checking whether the interrupt is in an LR (irq->on_lr).
- If the LPI in the LR happened to be the last one populated, the per-CPU
  pointer *host_data_ptr(last_lr_irq) on the target vCPU is left dangling.
- When the target vCPU exits guest mode, vgic_v3_fold_lr_state() starts
  traversing ap_list via list_for_each_entry_continue() from this unlinked,
  poisoned (or freed) last_lr_irq, leading to UAF or an immediate panic
  when locking irq->irq_lock.

Solution & Scope:
This patch prevents unlinking LPIs that are currently on an LR in
vgic_flush_pending_lpis(), ensures *host_data_ptr(last_lr_irq) is cleared
after folding, skips the ap_list walk when eoicount is zero, and prevents
the fold from resurrecting the pending state of an edge LPI once the
redistributor has LPIs disabled.

Note: this closes the primary race (the last_lr_irq node itself is no
longer unlinkable while in-flight), but the fold traversal can still
race with a remote flush unlinking a subsequent non-LR node in the
ap_list tail. Fully closing that window needs the fold side to take
references before dropping locks (in the spirit of the prune-side fix
in commit 7258770e5814 ("KVM: arm64: vgic: Handle race between
interrupt affinity change and LPI disabling")) and is left as a
follow-up.

Changes in v2:
- Added the fold-side guard: vgic_v3_fold_lr() no longer preserves the
  pending bit of an edge LPI folded while the redistributor has LPIs
  disabled. Without this, a flushed in-flight LPI is resurrected from
  the LR pending bit and re-injected while GICR_CTLR.EnableLPIs is 0
  (spurious LPI delivery to the guest), since the injection path has no
  lpis_enabled gate. Thanks to the Sashiko AI review for pointing this
  out.

Yuchao Zhang (1):
  KVM: arm64: vgic: Do not remove in-flight LPIs from AP list on disable

 arch/arm64/kvm/vgic/vgic-v2.c |  3 +++
 arch/arm64/kvm/vgic/vgic-v3.c | 14 ++++++++++++--
 arch/arm64/kvm/vgic/vgic.c    | 10 +++++++---
 3 files changed, 22 insertions(+), 5 deletions(-)

--
2.53.0

