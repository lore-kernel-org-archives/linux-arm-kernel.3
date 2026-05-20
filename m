Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBC5CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKKpQxANCCHogl9aY/9W21lvxk3CTd+3ZnVgKVwZ+ss=; b=s2ASbYMaz2c8OCMdWID92uDFwp
	CNY762L7NJfMDgulUJFj140j1v8gfyO3nv84YaEP0rpUNwKXoUnE6LMB6EaM9QoM7ojpV/OkvLt/Z
	xUT8vyhUxqwfx358m85ZVPq9irxxhqOVkq+9fuQqUpSetgEnIVByW4Uz3rHuguod22ZuQEWoOQww7
	xkjviQGnt35xnGVK9jCjKXhRfqrmtsXI964/8IBdgkfp018qpOk0pxRLFgVKaWthqztNF16ljymGF
	INRAaL1Y+1UG3Mwmlm/04aMmWt2YmgfFOAdXxtKiXPiAUEugXmV/KLCmr0Xwi5D1Yv4pRpxnE9dhE
	m9Ve4viA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipi-00000004zIA-3Pso;
	Wed, 20 May 2026 15:27:42 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPipQ-00000004z26-3ApV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 15:27:25 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-48fed2519daso26722175e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779290843; x=1779895643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MKKpQxANCCHogl9aY/9W21lvxk3CTd+3ZnVgKVwZ+ss=;
        b=mTc7OtgEt9lYwUuZcDdvvUnepYjBuPN4gdSyaZFKABMm7En3I0zKGJ9SiQVG5n49JZ
         PbkeP7QcKZk/Q5Jij+oZIdnGCFBkVsG+1JR3HWp1wb3PRAesiUtIvuG8CXpoZQkPhUNd
         cP0Rip3Zp5UTxINKFgKAJwYlFMwSl74NysRlPFiKHCy+UgAvipTW/osZ1es6o6hRGMft
         Vq6iCCzPnIRc10U2TnraE4JqgeqzCypcXfZ1oG+4isziP/PXV7Rs57DFcOEn5+arU3cW
         sIOi4Ou2Xfg/IzwGjVeJ71I9Y3AmdXWnO3CFJK0GYJjJ6fmfeIoAVg7kh3EmLsG48sab
         Akdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290843; x=1779895643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MKKpQxANCCHogl9aY/9W21lvxk3CTd+3ZnVgKVwZ+ss=;
        b=eO/QbqxpjDPnYAGKEYiOFdgf6e4kREyQq5XgEgoWKiwuLqRZIEeM/jZPhuzbOu0/kB
         hS6KnMHkJMtzBNxnCkzAPYBtk7dbSPo9/Jddpl4H3xIWOfgqBaqJS7sCAzUbTOnOxH6w
         wAp1KEd8O77+hf9yNzMIuUwWbz/qhh2Jm5+17+1lZuHafRzK4QLQiY1NgTXlKHMFaJen
         wOTpQyUUuSD7ZiugVXmTNd694gysHQsca/3bgbFb40kN4WhspWNHDmBcxMVxgwFysozZ
         Jk02LqsM6rnAw90phCOaqBMj5/NFLF4/jddLxgU1tzNq5eUhQCIwBNlxS+CoM1A1DPYX
         V2MA==
X-Gm-Message-State: AOJu0YwQ8YgOqJp/BDwO5sSFcdUYkpmPibaqTv5DhTp/NT0I8tIQtYZF
	sE+E7B4rKy4eFdfYA2qJXnjh835xi42QHhG/u+3UtZ0hS2NhdnLMqM1Q1q3A5Yyc6OScdZnHi7C
	/PxFWkBNTZCSYPIoIZY4QBg==
X-Received: from wmdd19.prod.google.com ([2002:a05:600c:a213:b0:488:c696:8bf2])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a11c:b0:48f:e230:8cac with SMTP id 5b1f17b1804b1-48fe662a1cbmr281507845e9.32.1779290842698;
 Wed, 20 May 2026 08:27:22 -0700 (PDT)
Date: Wed, 20 May 2026 16:26:41 +0100
In-Reply-To: <20260520152650.4107895-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260520152650.4107895-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.54.0.631.ge1b05301d1-goog
Message-ID: <20260520152650.4107895-9-vdonnefort@google.com>
Subject: [PATCH 08/17] KVM: arm64: Handle PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_082724_839905_005C1182 
X-CRM114-Status: GOOD (  10.34  )
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

Introduce a new pkvm_hyp_request type asking the host to top up the pKVM
heap allocator.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index fb4d140c99cc..bf43235e62d3 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -206,6 +206,7 @@ struct pkvm_mapping {
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -227,9 +228,13 @@ struct pkvm_hyp_req {
 
 static inline size_t pkvm_hyp_req_arg_size(u8 type)
 {
+	struct pkvm_hyp_req *req;
+
 	switch (type) {
 	case PKVM_HYP_NO_REQ:
 		return 0;
+	case PKVM_HYP_REQ_HYP_ALLOC:
+		return sizeof(req->mem);
 	default:
 		WARN_ON(1);
 	}
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index ce96a6f90bd0..f5288a350069 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -116,6 +116,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 	int ret = -EINVAL;
 
 	switch (req->type) {
+	case PKVM_HYP_REQ_HYP_ALLOC:
+		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
-- 
2.54.0.631.ge1b05301d1-goog


