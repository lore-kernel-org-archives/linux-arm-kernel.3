Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CCFCD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OefBi9Ucl75C903M9JEhzfF/8vc9lZTl6eXKcY7A1xo=; b=zjsOn3R4NO6+OJcPlZlMSiFtMK
	VywzE1weBqEQlJCedgvVMM9Rm8vG0xUI6CVo9oPsnRQqHmgxGZimptw+/KUNdYTOIz+Kf6zy1F5ES
	FJ5XHbNdfg23XreeU9CpbZQzABFLXGyx6smP61Rx/gx/gvmwuc6WEdNZCPHRQOqkaIlKuZBOAVzIK
	YBBKLEuZG2yrupLETOsXpF2jAE/CNRmD0/UR8eRwZdLiPMQANJ9v8JzXMkbVrPcdRmvETmzUh+X6x
	4Oiag25tkHPhSGVq4K4eabok5TZmNWTNCJ5S9lQPH2OYetpMEOhCQYEWsbocY+1aPz1p9lSmPWyeH
	JYaE3wNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA6-00000007MIJ-1cyu;
	Fri, 29 May 2026 12:18:02 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwA4-00000007MHD-1yI6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:18:01 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-45eec27f5a5so943100f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780057078; x=1780661878; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OefBi9Ucl75C903M9JEhzfF/8vc9lZTl6eXKcY7A1xo=;
        b=JN0c1acAqfdHHGzMIgWviEnQdxDgcYjZw8MBdHChW2BFVYCHd6G1a3p70JgTSENJWp
         DOvPfrVQbveZzloW+Ez59e09veCvA5fIwdYgqIXBoX62BGirlxtZ15CaShBnpF9oBn+e
         RDfrTfypGDAJ+ET0l2SOhv/Y2DeJsks+oNqfXUpsfmjN43boY5Opc3fTA423O3jOOopj
         wA1j3mWJrowjIRLJstisLjAyUmmlx90fScRcIlX7d9VFKICxCnpNW37ZUbcEWBB+MUmm
         hU+MxSlEytzgLTMa0TTCxFvIdaDfuky2LVEg5cS9BjB5A87hAj7kRTST8y9lkVidLblo
         dR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780057078; x=1780661878;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OefBi9Ucl75C903M9JEhzfF/8vc9lZTl6eXKcY7A1xo=;
        b=chv/qSd9EaiGYwdDZrR9FUoeZVv9K4qUiHn057rC+HNG0jZ0HwZdRXD+jXHU17DC/I
         Uv4NA91zgDEU5E26sf/Y7ExW+yW0eoM1VwOSo+YXnvcAbvS2QLmF2jMVEM81ScMEPlzS
         51C1frQJ7ENU1yd0hBp0lPQK7uCkak9l0Ok33poJWJy4Zu0N7mAqhIWhaO0Hvyaa7X2d
         /jURo5XzGfR5fek1WWr0yvk6aeyoctPstXpYWjJaDJeuPPwD3NHLQNVVJ4VbdOMj9CiL
         to4z6HadSswFq0l3DXDsqTIx8wOjfwGp+lgcfBL6X4yJBVi/JcJVUveH0Ef+4ZgJkBMP
         Wt9A==
X-Gm-Message-State: AOJu0YyqTmBqE5oFrIYzLspsZNvSIxirI4U4Yioy2pU0W0EusrnoUWrc
	tGClSbL1t3wQntAmIck+5VhVI/BSBSFzhobfT1ehh2aTzoGK5ge60NWvjaJSojOlKLpYlhhiVP3
	rsw==
X-Received: from wmbgx17.prod.google.com ([2002:a05:600c:8591:b0:490:11e5:b5aa])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:6008:b0:490:44eb:c1e0
 with SMTP id 5b1f17b1804b1-4909c0ac911mr37129365e9.21.1780057078508; Fri, 29
 May 2026 05:17:58 -0700 (PDT)
Date: Fri, 29 May 2026 13:17:53 +0100
In-Reply-To: <20260529121755.2923500-1-tabba@google.com>
Mime-Version: 1.0
References: <20260529121755.2923500-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529121755.2923500-2-tabba@google.com>
Subject: [PATCH v2 1/3] KVM: arm64: Free hyp-share tracking node when share
 hypercall fails
From: tabba@google.com
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Vincent Donnefort <vdonnefort@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_051800_513799_281351B0 
X-CRM114-Status: GOOD (  10.86  )
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

share_pfn_hyp() inserts a tracking node into hyp_shared_pfns and
then invokes __pkvm_host_share_hyp. If the hypercall rejects the
share (page-state mismatch at EL2), the node stays in the tree
with refcount 1: a phantom share that leaks the allocation and
that a later unshare will trust.

Erase the node and free it on hypercall failure.

Fixes: a83e2191b7f1 ("KVM: arm64: pkvm: Refcount the pages shared with EL2")
Reported-by: Sashiko (local):gemini-3.1-pro
Suggested-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4da9281312eb..4a928fb003ff 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -501,6 +501,10 @@ static int share_pfn_hyp(u64 pfn)
 	rb_link_node(&this->node, parent, node);
 	rb_insert_color(&this->node, &hyp_shared_pfns);
 	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn);
+	if (ret) {
+		rb_erase(&this->node, &hyp_shared_pfns);
+		kfree(this);
+	}
 unlock:
 	mutex_unlock(&hyp_shared_pfns_lock);
 
-- 
2.54.0.929.g9b7fa37559-goog


