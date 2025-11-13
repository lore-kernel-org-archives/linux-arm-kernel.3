Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB68CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9SgCCzfx7hqB2TFCbu/gbrkrcw0YcG+BnpWWFTO5/g=; b=TZUK+SSr/0q7EvgQyJGB/YHCa5
	rfiQMWIh1pPDAXkQvPRm8E6XOP1ljHN8UlygkTn1bX33mTHqqZylliYuOCkoi1eofFE3mblXmFzRK
	9ua5h8i4PRg6FVY0wHoW53F6Gq6Q8XoBU5ZBmwdGONpEwK5cNxU7FeTl7mFEVBsXv8rCEculNj+aG
	c0ndrG93kcrxB13jkJWFJFfs6Elfe5mC4aPzlG6fWCpj5MJlXhC0HYwNsw1WssVyTzUwrSGyKtW2q
	1TFNl4dlWBSvuQCfMxD6vxK8U1nqxvOugU615ni3rXY1GdSz0clueHGr7pz6g6W4A2G8C71nwdCju
	9yEcIQfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpb-00000009usO-19K9;
	Thu, 13 Nov 2025 05:25:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJPpZ-00000009urv-4A7a
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Nov 2025 05:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=s9SgCCzfx7hqB2TFCbu/gbrkrcw0YcG+BnpWWFTO5/g=; b=rJNOtpSjcYAOxagGMy/V+SagfV
	007lnhyl9grx7cS1L7jRhS/mZhwkmXtWx7lKlCD4SbsggQxmwNXxOVG3ip7iUkcDjw0Mrdt6va73s
	fv63w656FPLCFXWulOZo7JYc1xyzQQKldBmnqI6OddST2Wb8C6Hp/W1xQga64izyQKHrBCuS6ug0g
	qNjZ478xJ27Aqtj/L0dlQaHcFqMsOnVdgiGlJu+T1oOGoMvSHetwzvcvu9X7GsYauSTiLGj2ik/yE
	03ZhK81Vm8r7p/vVSV68pBC1i2jeWPbAVNmz30HTVYKMKz/wjH5GczCIAeRTsIxJSVikdqvTNKb4B
	q49ObLWA==;
Received: from mail-il1-x149.google.com ([2607:f8b0:4864:20::149])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJOxr-0000000H4rn-3THu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 04:29:45 +0000
Received: by mail-il1-x149.google.com with SMTP id e9e14a558f8ab-4331d49b5b3so23123575ab.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 21:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763011509; x=1763616309; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s9SgCCzfx7hqB2TFCbu/gbrkrcw0YcG+BnpWWFTO5/g=;
        b=Fux9gZujb9/xOOM4mDv2sUpAtZ96qULcvQryMTkG7AuG7Ra2mbg2sXUkJdP4md5wu1
         Y+nRwPYlt12lIAZDgwU6+cgc9XIUKcA/FZKnSdm49U7tWrERUy3m/d+A2eIvxVnFChK6
         R5kOw7OdVDoWtKhbnj680NHWCowXdNtOvNk4E1NQfPzZc00HNlB2Z1yONaHIqbiWsveZ
         9ug/zPZjU1zYDULhzo/rj0TnbGJbaYGB1a2zQqtHtu+h/8NO1Vc8kfbej5lo83jyuCqK
         +00rU1btHwZ/B5pLCN2M7YHe11BLZmj+BktfOY0KX9Qx/3OPCTbAk6ASWo1IrvfaDskG
         PzcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763011509; x=1763616309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s9SgCCzfx7hqB2TFCbu/gbrkrcw0YcG+BnpWWFTO5/g=;
        b=l37rqZ7go4C9x2LWIlG++bCo8kaD4tjIfGVdkRJGJBGLTV0uXQYYDkJh2vgO6xEh0t
         iNBNT6a8fKbL0qo6UNIU14I5A8+7KIzoYLc51FbZYmztjlJJuUJ4puXEFfamzQ96VO2j
         kEl43CZA5QU8YBnd6rAoNR6U33CsMviDajyFW6mesWtJfjnFtz0g6nFIEt91dHojfE8l
         TrcCGaaGVymrYC4hAgGMnTFE3oZdVBasDtKIl8MKiXjrkbQ4vHHmEHRxPwKpk2h8v9dk
         s8udw+p0YHdpgeDOpnyrwdtbPBAIyjQribp+h97bavlDxkkXJn6vSNH36eQNcWSMfftb
         qPpw==
X-Forwarded-Encrypted: i=1; AJvYcCWgshA4IFpLsyGKaI4t3rwRnUeMuIQlG0hovGKResLM5wFwltRcx7nQ+F1J1LsA8SrquNw+4renjenVdKJuqljB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn6HoEGR51xqSreyeXIe2w5lIbeE6scNMBzqD9ufRD7BVpmapQ
	C34kX3+8xtIGFTCgfHtFHWZNXBZpfIxNG51kBG2Z6kZj4r0xoGZ078YWYEL8iFq4sF0HrstHfx9
	Y6bZFTaxxpA==
X-Google-Smtp-Source: AGHT+IEyJSyJIvlGRNrSoUOGgfcAkjKY1WyU5H5l7T8c0BR5P21QqG7oUV9JZZVGF8o1Ck1Nj4/ZN1JRw7Lq
X-Received: from ilbbk5.prod.google.com ([2002:a05:6e02:3285:b0:433:76d7:5d39])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6e02:190e:b0:433:7310:f5bf
 with SMTP id e9e14a558f8ab-43473daeab5mr67314545ab.22.1763011509204; Wed, 12
 Nov 2025 21:25:09 -0800 (PST)
Date: Thu, 13 Nov 2025 05:24:50 +0000
In-Reply-To: <20251113052452.975081-1-rananta@google.com>
Mime-Version: 1.0
References: <20251113052452.975081-1-rananta@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251113052452.975081-2-rananta@google.com>
Subject: [PATCH 1/3] KVM: arm64: Only drop references on empty tables in stage2_free_walker
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Oliver Upton <oliver.upton@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042944_045364_D1D9E8D7 
X-CRM114-Status: GOOD (  13.47  )
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

From: Oliver Upton <oliver.upton@linux.dev>

A subsequent change to the way KVM frees stage-2s will invoke the free
walker on sub-ranges of the VM's IPA space, meaning there's potential
for only partially visiting a table's PTEs.

Split the leaf and table visitors and only drop references on a table
when the page count reaches 1, implying there are no valid PTEs that
need to be visited. Invalidate the table PTE to avoid traversing the
stale reference.

Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 arch/arm64/kvm/hyp/pgtable.c | 38 ++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index c351b4abd5dbf..6d6a23f7dedb6 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1535,20 +1535,46 @@ size_t kvm_pgtable_stage2_pgd_size(u64 vtcr)
 	return kvm_pgd_pages(ia_bits, start_level) * PAGE_SIZE;
 }
 
-static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
-			      enum kvm_pgtable_walk_flags visit)
+static int stage2_free_leaf(const struct kvm_pgtable_visit_ctx *ctx)
 {
 	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
 
-	if (!stage2_pte_is_counted(ctx->old))
+	mm_ops->put_page(ctx->ptep);
+	return 0;
+}
+
+static int stage2_free_table_post(const struct kvm_pgtable_visit_ctx *ctx)
+{
+	struct kvm_pgtable_mm_ops *mm_ops = ctx->mm_ops;
+	kvm_pte_t *childp = kvm_pte_follow(ctx->old, mm_ops);
+
+	if (mm_ops->page_count(childp) != 1)
 		return 0;
 
+	/*
+	 * Drop references and clear the now stale PTE to avoid rewalking the
+	 * freed page table.
+	 */
 	mm_ops->put_page(ctx->ptep);
+	mm_ops->put_page(childp);
+	kvm_clear_pte(ctx->ptep);
+	return 0;
+}
 
-	if (kvm_pte_table(ctx->old, ctx->level))
-		mm_ops->put_page(kvm_pte_follow(ctx->old, mm_ops));
+static int stage2_free_walker(const struct kvm_pgtable_visit_ctx *ctx,
+			      enum kvm_pgtable_walk_flags visit)
+{
+	if (!stage2_pte_is_counted(ctx->old))
+		return 0;
 
-	return 0;
+	switch (visit) {
+	case KVM_PGTABLE_WALK_LEAF:
+		return stage2_free_leaf(ctx);
+	case KVM_PGTABLE_WALK_TABLE_POST:
+		return stage2_free_table_post(ctx);
+	default:
+		return -EINVAL;
+	}
 }
 
 void kvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt)
-- 
2.51.2.1041.gc1ab5b90ca-goog


