Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E69CD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Mniq795v9HO00xIoc8A38A3iAvF/LweIfmdHSlDEU=; b=CZnOyR4uRh1CsW9P3tNh6sLFyx
	6KPMrCV1/+gjLVjwTCzPw3NLEDlD7ZKGKUfuKARYaTGValJ4mvxmAU1d1zTacPYLhUYfKNLltN4rb
	a6kGy01mUxqlhS4dWnrP1DFsYm77h8lbINaYj37bxBW5LgWWPL5VLTL9MRv2ohrcI32j0CwkQ/b/U
	ZvhFQyEMbEE2uiXf+0QeITuHV0bLQXKuCF9cJBZ3OybQ9jLjRZ+VHidffTnM2UWjXyTVJT7b5R/Zu
	WN6uG5MjfviauwwCSAiSkAN9WvVSV440y2+jMOnQhbOFucd2cZNZvxA65dRwjFxyUCVVOYCekBfy+
	KMoDMJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrsm-00000006tlm-4AAF;
	Fri, 29 May 2026 07:43:52 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrsf-00000006tk2-2s8X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:43:46 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fd33b4921so88988355e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780040623; x=1780645423; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Mniq795v9HO00xIoc8A38A3iAvF/LweIfmdHSlDEU=;
        b=j9cwup5/V/tIxPWTxl3pH8s632C4Jv8Sdjyu1gghuMaeOM8YButs75YgFtItsFHjag
         GXw5erES8/zdk1SsVl+bPz6YyPfo2TwwVsLjOkWgl/eQS5gUXPBeZIkRkmCwnjN6HZrU
         3KbNwhJHdBtnTrFZWVuw5N21oAtH0MlC2iA/+2Y30hYw8jrIl2JI7Q8NbM7bWBlWcuEn
         WANwlLDecx5esx+Qm/IsqweWP80S6btBNohPNOkZ6e7el1nHh2GYZgWWGgr+vyuSmb4O
         uz4gPN4u2NNSS3UZitp//upL3f12z9CppsU244G2mPs+MH063qOQrkjsPQzlDScWIgk8
         FAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780040623; x=1780645423;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/7Mniq795v9HO00xIoc8A38A3iAvF/LweIfmdHSlDEU=;
        b=sY0+t3cP1MAdG/RgY/bd9kw6g78eYC1AEjYEjQvI1B5hTXvd7ALNELSuKK4FmEsD1F
         uTYIBN8KNJoI9x22/H2vRwUxHyr1t9YBG9QJreMYHi29M5zppSRcVQF3r5rfz43jJYCA
         HlEcJvyFXOiJoc0BSGE7V7ZhIdL4r7IfLq9X0b4Xf9uq5lE5dHd+6JPDwS0s09+V1HMs
         7Qe2khRu/MaXEw/hu0uMq29mT9WCgpvPXQzmO5P2TTIhT8ibanUSNEFaAI2dExvYlrW2
         j9PcMvJLJS7DoEmi8XctGXqIFBY6Xz0h06XcS3D1oZUXDz9nRqDDBbDXTNVoDagBrwMB
         40Wg==
X-Gm-Message-State: AOJu0Yw5PQwnANP0MMjRt1zAiKuRQUrhH14FNfkJF+hqeg2Kxdr1wpjl
	aAHre6L50+MNAF+ek//zncePbsWgzkA/oufLC4Vf+se4EBuzqIvAlT+OyIGfVtwGsGPl/VyU7PT
	y2g==
X-Received: from wmlz26.prod.google.com ([2002:a05:600c:221a:b0:490:4896:4968])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8582:b0:48e:5fb8:f80f
 with SMTP id 5b1f17b1804b1-4909c0e4624mr19865835e9.24.1780040623192; Fri, 29
 May 2026 00:43:43 -0700 (PDT)
Date: Fri, 29 May 2026 08:43:40 +0100
In-Reply-To: <20260529074341.2271950-1-tabba@google.com>
Mime-Version: 1.0
References: <20260529074341.2271950-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.929.g9b7fa37559-goog
Message-ID: <20260529074341.2271950-2-tabba@google.com>
Subject: [PATCH 1/2] KVM: arm64: Free hyp-share tracking node when share
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
X-CRM114-CacheID: sfid-20260529_004345_729034_A14054CF 
X-CRM114-Status: GOOD (  10.56  )
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


