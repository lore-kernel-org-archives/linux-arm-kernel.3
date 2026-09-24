Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E99C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Teg2xf6fWRrl/zBr5cBFx6F6XwrP4vrM+fvmVBE3SQE=; b=CUjHAvtcpzou9re4xx6DN5pB/+
	NYOkoF/f02fZaHdqH3fzIRdbFWkZaYEZoelO6k/E6UhXLUoOrOpigL6f5+fV5mxJPK2EhwC76K7di
	JQkZFduULTNPXAsMYIUeesAV3xF4EefnoYBBoK1e+8oVbQlzXxUZgr2gWnS1Fw3ikuC7hu9KWuWoO
	huwXUgOP0rkEbMSEYsmtJnQwGUi3F68N6ij5FUDcL8l2i2Ex6XOibXuvUiHJo7X+Xc8EzXqT9/S+h
	JzwqYRu+JjthvCELRqgXdNU1GZ9h7kvPsWR9ELdP12tLKBGZvjymaxIns4gg2ZENg0WOk9QQ7XBlr
	5d7rQBFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g7a-0000000AdgA-2FQb;
	Thu, 24 Sep 2026 09:52:06 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9g7Y-0000000AdfE-02m3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 09:52:05 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-4870142fd5cso824972f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790243522; x=1790848322; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Teg2xf6fWRrl/zBr5cBFx6F6XwrP4vrM+fvmVBE3SQE=;
        b=vaLA1JwFksUImDKboP88Hqf6gfrBxmtaWIAQLSAXGwaQo1MWm0inVv+QwSnLFo+fZK
         qnQ/Ruyz9MbTCqX/IYlwVoNXr4H0+/LwBFeAKcBjZRlSAzzq7+kgC1r05ZefkSh273nM
         JfmKiWkIrgJllUzaOoHTm8FSnt6JwosQnoJ5+aUoweLABN7X4CLLfAqW5KGNr00QK2I6
         5OMqkxPiL0SUBcFuKUnendcUtrql3LAEMHMwfYotUdOjtfFIA5yCW9/OG24nAHl2mWQZ
         X8UKYcWqMSj777Papl9Yn/s7sY5/kqDQjbsjuixBjuNRBwfYqyNl68t14YxTHBHUzAij
         hmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243522; x=1790848322;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Teg2xf6fWRrl/zBr5cBFx6F6XwrP4vrM+fvmVBE3SQE=;
        b=RS3ok/h8IEWqUMtChzrefY7qfGDwnRFiaPkU/EXcYm3xkHqNrVYEV/wYooFx7aN+Ih
         dENUUwbpLJ9X1yBdOv1+vYYRYUJq7tlBYlqAOEvCRa7jMGelF7v/waS2N34jQJzQ6zQY
         D9HgTC7ZKVHR1WxFlLfx0yiNy/1f0pFgrD+8DJ9EEDo1wJYldPNfvyBUIMr5tAZgx0W0
         98Cih3xU9tuTZFPq6QPXyuEUEzal6dFacIHjvnNDm2GefKX4rBQAn0aPv5FcD1nX+cUc
         js0UgSwNq2CifkZ8Wlo5Mu7/pQM0EaYAINBil6lZwMj4gg9iSdZGc5kqOeZrYyfYvExq
         xA+A==
X-Forwarded-Encrypted: i=1; AKwUvBwGmim/jq1iW7HhSU+e//q68TEQW4e6WQ5rAi1vCFVak0knRwdZH5Ob22biUZb7aGb+Ekbp0z1Mh4iUUkmSLXPV@lists.infradead.org
X-Gm-Message-State: AFuF++nCM5E4J3Ewmb8WqDP6L5Ug4V5bi4UYTSkM2dN0HssTeaUcPrqi
	FGQRs8IGaRArv16IKc0kIgHEB92GgSxDieAboSVC2rI28ZHKRwA7zspMYPorrdvlTOYh5smnfsP
	BAjV4EpVk53NbHM3wcrLzhw==
X-Received: from wrzq8.prod.google.com ([2002:a05:6000:1368:b0:488:7479:3b57])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c7:0:b0:487:765:46bf with SMTP id ffacd0b85a97d-4887171d2aemr2945649f8f.19.1790243521432;
 Thu, 24 Sep 2026 02:52:01 -0700 (PDT)
Date: Thu, 24 Sep 2026 10:51:54 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
Message-ID: <20260924095154.807726-1-vdonnefort@google.com>
Subject: [PATCH] KVM: arm64: Remove PAGE_SIZE alignment for hyp event ELF sections
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_025204_059780_2D9AA4D7 
X-CRM114-Status: GOOD (  12.37  )
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

.hyp.event_ids is mapped as part of .hyp.rodata. As a consequence this
section does not need any page-alignment. Remove it to save a page worth
of memory.

Fixes: 0a90fbc8a170 ("KVM: arm64: Add event support to the nVHE/pKVM hyp and trace remote")
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kernel/vmlinux.lds.S   | 2 +-
 arch/arm64/kvm/hyp/nvhe/hyp.lds.S | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
index af1d72020976..c0b090db8be4 100644
--- a/arch/arm64/kernel/vmlinux.lds.S
+++ b/arch/arm64/kernel/vmlinux.lds.S
@@ -15,7 +15,7 @@
 
 #ifdef CONFIG_NVHE_EL2_TRACING
 #define HYPERVISOR_EVENT_IDS 					\
-	. = ALIGN(PAGE_SIZE);					\
+	. = ALIGN(SZ_8);					\
 	__hyp_event_ids_start = .;				\
 	*(HYP_SECTION_NAME(.event_ids))				\
 	__hyp_event_ids_end = .;
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
index 7a02837203d1..89222425359a 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
+++ b/arch/arm64/kvm/hyp/nvhe/hyp.lds.S
@@ -17,7 +17,6 @@ SECTIONS {
 	HYP_SECTION(.data..ro_after_init)
 	HYP_SECTION(.rodata)
 #ifdef CONFIG_NVHE_EL2_TRACING
-	. = ALIGN(PAGE_SIZE);
 	BEGIN_HYP_SECTION(.event_ids)
 		*(SORT(.hyp.event_ids.*))
 	END_HYP_SECTION

base-commit: 93f51579e7df248780214094418f205253383cc5
-- 
2.56.0.rc1.310.g51773c2048-goog


