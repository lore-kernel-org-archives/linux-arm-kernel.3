Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6B4E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRdmYoUKXOUG+sswfkSeT6n5jAc9VmmCt4ArLqZWt3Y=; b=gLdpVeumLrBSVDEqOAedHHeGvO
	kmRGF7eL7TTfwRGMqDqHMBjwXuFsH2uNA+XD4Id3veTMW5uNJokKVMab6nc5zT0fL9sLGhNM0xdvY
	FSHYAnagAglcCrbhXI+iOQJ1e9bQv7uqDWdMnE+eeCDcKuwm5bf1wc8hAApW/TcNLZez/N5cpHL4t
	xfVqw7tyE1kDGJwZPMBqiI5utcihmjVvlMPbD77yV59ZJl9Eak+2Ti2sgW4mlw4Qo7WsWgU/Bnr98
	F4OXsnbr6O8dLxjn5gKAiSQnj9OR5jPTeqmXXAAnLBDCPTrLtoJvjjjepUwG6FvU/boayVsbK5MsB
	wO7DAAkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzx1-0000000HYo0-2ksV;
	Wed, 18 Dec 2024 19:43:19 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzus-0000000HYIE-1r4n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:07 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d3ff30b566so6976466a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550864; x=1735155664; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nRdmYoUKXOUG+sswfkSeT6n5jAc9VmmCt4ArLqZWt3Y=;
        b=uMkMGYq60WmBfVaEuWYSY1/Pl0rDlNKwoZ/Gx5ST6933dDYTZ7MDI0o/oaj99ss0Lw
         HLnBSucJbf2pUsfvwfevBy3LDOOId+kr05e6iy6HEorqQiioq39gFJkZDebGGye3W+mD
         zLGEyk9BK1WSPjCl8vpB4hvArxTedEB2aFNmpWFhaUltn8OegJgD8ouXSDlFLt2elOP2
         TcLnjq4tFTSDsTYxiyQPduYR56H3rtFrD3YiKeDXhoJ09muLalrPoPz5zmmyGV9VnE2A
         8/H2gP4kj69yuVIOzkF7O3qy+CJebmcQRQTe312gWAZT4LqvaKvfsI7QvFQBImVbgvWI
         oHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550864; x=1735155664;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nRdmYoUKXOUG+sswfkSeT6n5jAc9VmmCt4ArLqZWt3Y=;
        b=N2m63BdAsvffDDjzJcVEYCqzXnKPiBrUWSCip9op+z0OXy+0KScr3GBiPoJp94Bly4
         2Fj6A/6m7BwQcRzbVI0I8QiRcg4ftiW3yAzCmtptmXWowKcyu1y/Sp+OsQu/zgt1vI+Y
         bbKhaPpkNvTvj4SPSefZ0UQZctEoiluXcj0k3uj1hFuVPWoLEFZtzMgWoWfIrFlCZ2sW
         lo+QyxOXDTCkl9t2NlJrJCudq+HffK6/aqDk8Via+P4Csjf1YMYS40JWzqNc8uvWniEU
         1Lrh1xw0gBjV8BGU7rU++5LU3Cz1glMrTWmDNjs07nh7l01FVWzN9lEQZLr7ze8czYZ4
         EqTQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6ePQ6ZPnzxttYOwT8461qsiPWZDAvCdF3LHryFpTbNPQclV3t8+VD2FgyA+WxCe5DVan+gZl77wtdC3bvZpQz@lists.infradead.org
X-Gm-Message-State: AOJu0YytfypNToev5TbUTexbeBlI1dJa/bXGroaP2R6raLSmqbxDGSq8
	2Io0PhqGV8IUsaezFQ2uaRDQ3rgM5ztUOtSvRyEEYE2ohDnIP15yVqQXvsN0jntPuLNq19ZkEPe
	w/61CVw==
X-Google-Smtp-Source: AGHT+IHvQzDESjuWp5L1AoEov+naUf7YhDv2p3IzRK4XOlwykk+DiFMJtRC57ZjwupiXLJO6FV3a8dSL7apE
X-Received: from edbfj18.prod.google.com ([2002:a05:6402:2b92:b0:5d4:34da:32db])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:528a:b0:5cf:e218:984f
 with SMTP id 4fb4d7f45d1cf-5d7ee3ff473mr4159198a12.27.1734550864372; Wed, 18
 Dec 2024 11:41:04 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:42 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-2-qperret@google.com>
Subject: [PATCH v4 01/18] KVM: arm64: Change the layout of enum pkvm_page_state
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_114106_478048_9D40B83E 
X-CRM114-Status: GOOD (  11.36  )
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

The 'concrete' (a.k.a non-meta) page states are currently encoded using
software bits in PTEs. For performance reasons, the abstract
pkvm_page_state enum uses the same bits to encode these states as that
makes conversions from and to PTEs easy.

In order to prepare the ground for moving the 'concrete' state storage
to the hyp vmemmap, re-arrange the enum to use bits 0 and 1 for this
purpose.

No functional changes intended.

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 0972faccc2af..5462faf6bfee 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -24,25 +24,27 @@
  */
 enum pkvm_page_state {
 	PKVM_PAGE_OWNED			= 0ULL,
-	PKVM_PAGE_SHARED_OWNED		= KVM_PGTABLE_PROT_SW0,
-	PKVM_PAGE_SHARED_BORROWED	= KVM_PGTABLE_PROT_SW1,
-	__PKVM_PAGE_RESERVED		= KVM_PGTABLE_PROT_SW0 |
-					  KVM_PGTABLE_PROT_SW1,
+	PKVM_PAGE_SHARED_OWNED		= BIT(0),
+	PKVM_PAGE_SHARED_BORROWED	= BIT(1),
+	__PKVM_PAGE_RESERVED		= BIT(0) | BIT(1),
 
 	/* Meta-states which aren't encoded directly in the PTE's SW bits */
-	PKVM_NOPAGE,
+	PKVM_NOPAGE			= BIT(2),
 };
+#define PKVM_PAGE_META_STATES_MASK	(~__PKVM_PAGE_RESERVED)
 
 #define PKVM_PAGE_STATE_PROT_MASK	(KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
 static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
 						 enum pkvm_page_state state)
 {
-	return (prot & ~PKVM_PAGE_STATE_PROT_MASK) | state;
+	prot &= ~PKVM_PAGE_STATE_PROT_MASK;
+	prot |= FIELD_PREP(PKVM_PAGE_STATE_PROT_MASK, state);
+	return prot;
 }
 
 static inline enum pkvm_page_state pkvm_getstate(enum kvm_pgtable_prot prot)
 {
-	return prot & PKVM_PAGE_STATE_PROT_MASK;
+	return FIELD_GET(PKVM_PAGE_STATE_PROT_MASK, prot);
 }
 
 struct host_mmu {
-- 
2.47.1.613.gc27f4b7a9f-goog


