Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A219C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwWa9xikmrWk6BiuNr1ehvo1nd7/hCW6RShSp6OTx38=; b=ICb1gJ8S6C7I67eiT8f0JwqxtC
	XNrRxdjBdz4mmxpkLbm8apV0Z9dqv1WLVwG0QOHfvfEKYsLJJhpKh47cR1c0pjuRvKualOlYAPBRK
	yaKx10YoXvDBeEr/0rirP7WpbLRWPmNvYRdJ4BN+iy94hThOPvBraWfFVQ9wZeWRG/Wssn8r1aqkg
	rqJNiJXfCNaTwAZcLZjZLh18YcGgbRCJqMf/KY9n1MIy5uVll2LyrVLf2Xc6y2Y0ptfiAeSQqyS+w
	pE10Pm5h++ROkNwZLQUlC5YP05W1F7mnRv/xGPjy6gNbllfKdJb/Me0eDXDmYkgZ/gg2MzfBJPXrZ
	FSrobkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWl-0000000DFmf-40ac;
	Mon, 06 Jul 2026 17:54:43 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgnWf-0000000DFbf-1gCX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:54:38 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-493ce4b7777so22643325e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783360471; x=1783965271; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HwWa9xikmrWk6BiuNr1ehvo1nd7/hCW6RShSp6OTx38=;
        b=Bfem0o3/Tb1qsYl7f01ubL7TO6Fq5oZnyAJ74ojsmw16UJ8chFB+EA7ryyB+I1fWmp
         ZIrHNOqlkl8qL0pqvUzjZdukzq4d9x3s2aUgHJ7bd2xAp2GTzBaKowFwBFGO+g7WkVEu
         rejUzFEb7CL/S0vz73fdjfqRJ5BqHjlbLHuT+QnV9tPf9I0w2AR8ud2NId2apoDQHFsl
         WFUlSTS2YoBBMP+TVyuhSmmjccT+OtxFdHj+UCNWzY1IzZxRHkzzDU1kOUUnRWSOTpHF
         /umj5vLy8rhIewEv0dM58EdXXQ7I/UaJ/WfN2mZHEspxTa99G1aN+TegfVaPKNP/Q7BD
         mNBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783360471; x=1783965271;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HwWa9xikmrWk6BiuNr1ehvo1nd7/hCW6RShSp6OTx38=;
        b=akWiNg7f0ST5zVvTTm7cYWHTJ0jBb3bMOHsjV8DXIqbpmYcUmHtJJXc1JCCsWKdS3a
         JisKB5n+p91bibrBP+580hwxpGWtOvgjfWs7N/9Mo1a7aRgCUhE+IsYICCnArA4dbGYm
         gS46JoN/6AwrKg9JvPpFx10Ex4uERkG+oAdRAbpqJKXYnOIBu2ZPymCuYiBoOunwhxQz
         4zqr8OHUAVGL2rye53L5GXCMeU3BtFi7wrlnXDBJ3ENqJ2cs8Sibe0x3Pk0lxKEaoL90
         yFmCxtj5c7ZHNlElym/CFUXq6W+NQfLxpDOYMXc3knfWXP1uUSpwUGZD9sv55h7hpVBq
         AR+w==
X-Gm-Message-State: AOJu0YyaYdRGgVfUegeQlI7zYAsaKiIYx+shLI3qbU1fn719tGddqKWs
	yCW1xvU0AxiQ685rlvDND8pDH2z2xwsYoe3NUoSBYywgt46gQuGCKwZC3cWBR3UrS+JhCDa0ZSH
	8qPgMcWSeGaukNDRhJ0t3+w==
X-Received: from wmsm35.prod.google.com ([2002:a05:600c:3b23:b0:493:b12d:1375])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3153:b0:493:bc4a:fb56 with SMTP id 5b1f17b1804b1-493df09fd08mr19227555e9.39.1783360470456;
 Mon, 06 Jul 2026 10:54:30 -0700 (PDT)
Date: Mon,  6 Jul 2026 18:54:05 +0100
In-Reply-To: <20260706175415.2604046-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260706175415.2604046-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.rc2.803.g1fd1e6609c-goog
Message-ID: <20260706175415.2604046-9-vdonnefort@google.com>
Subject: [PATCH v2 08/18] KVM: arm64: Handle PKVM_HYP_REQ_HYP_ALLOC request
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, qperret@google.com, tabba@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_105437_496822_23F0FEB2 
X-CRM114-Status: GOOD (  10.33  )
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
index 0be1469e7874..99daa985856f 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -205,6 +205,7 @@ struct pkvm_mapping {
 
 enum pkvm_hyp_req_type {
 	PKVM_HYP_NO_REQ = 0,
+	PKVM_HYP_REQ_HYP_ALLOC,
 	__PKVM_HYP_REQ_TYPE_MAX,
 };
 
@@ -226,9 +227,13 @@ struct pkvm_hyp_req {
 
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
index 5ba8b81b8c6c..adc418076cb0 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -626,6 +626,9 @@ static int pkvm_handle_hyp_req(struct pkvm_hyp_req *req)
 	int ret = -EINVAL;
 
 	switch (req->type) {
+	case PKVM_HYP_REQ_HYP_ALLOC:
+		ret = pkvm_hyp_topup(PKVM_TOPUP_HYP_ALLOC, req->mem.nr_pages);
+		break;
 	}
 
 	trace_kvm_handle_pkvm_hyp_req(req, ret);
-- 
2.55.0.rc2.803.g1fd1e6609c-goog


