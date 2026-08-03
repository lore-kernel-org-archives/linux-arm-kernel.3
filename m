Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708C3C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vD9j2DbP1qcHhwrVAGFwQvUfw9yIjLdBpQmLc/B3JA8=; b=hEgvIdVIleyJy41Cw2gPgl8tGE
	IY9+TX4eymzhMQmGm4+SINRLzEpkS0t1Q4eppEZr9lgchzIWAX+9AqPp3qERXyX05Suh/ZIFl/MGU
	WAJph5e3QS+3WzQfxfePD1byQDx9QFMzmUj3fAhPybjaIadIdV+xQCi0vZ021+zfTHfHSioA9pyYU
	t7XXZYYXQEVsdNuzRY+PC7mHh4zqmJuij3wmyYvbyR6RRBchUgPr3pQ4w6XoEApQfbaEx3zpXUjJC
	OMxiIdQ3RSYnL2NQ1KioCJTpVGzkfZyIua9s6lhWtg+yOT8E0CmTlOERRzF59ZPgIXT7uwAK/IyBM
	TuXsH9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdc-0000000GnDU-2q0R;
	Mon, 03 Aug 2026 10:11:16 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpdZ-0000000Gn4K-2YiJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:11:14 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso18398895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785751871; x=1786356671; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vD9j2DbP1qcHhwrVAGFwQvUfw9yIjLdBpQmLc/B3JA8=;
        b=qofSJwnKV4YjqQrM31uDXyAIUaYOnwaBQiklilBXJOnS/UUr2Xdrne5Ty+NFqwEkS+
         7B8IYucYqaB4MeiuWLoyNUopTivbj7jFIS/hgbaj8hhtrm8VkHvoMENPfIPItTtS4nYA
         QJGPshW2UCBYMqCK1vFovvywm4s8evANYnbTofqbj1MS6fC+r5uAC6cSSyc+DGXICHah
         e8hJ/JdfzhVFLcXA70Eo2eFZ1pTreCM6WDoNHrIImF4WjboGze7efIVqAR90A2l+uOdB
         JobKly5YV0EfoaN9XrVXpgAKWcPrG3dOmgtODml66ZWJ7xIPHBCT5u/k17LtGELObNi+
         paEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785751871; x=1786356671;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vD9j2DbP1qcHhwrVAGFwQvUfw9yIjLdBpQmLc/B3JA8=;
        b=VjrUstwZ6WKpgb/xJ93bbpBEc4+93O1yLAdv0mssoIwk2Eae6K8WNQDxAALk/CTC7w
         wNFuLBpq0W7Cnwbt4rTXuYMSe7FXux7DKTTcRLeqEoUR/wJuOLmReuu2OwrgNuFKChDJ
         Ha09GG7aSgI66E/g9D8y718JZ1BS8tbnF9fdvHYKsJai1o5If7BR1gwCTm+t2vVVkW2T
         +xcqF0LqbVr+l2SA1MSJzflOZW/GHLvYihMDXwKor8+hhn0uYAcloSyuKsjUgpvZ2X9Z
         qgSBmgGD+ED2KrilptfKYm0juBWXs4y3q4XDcHxWZcVvgI8/rKqMtjxNtkUq5/pkOSWD
         46nw==
X-Forwarded-Encrypted: i=1; AHgh+RpJ6gTI/GX4T/jlmK/rOkyKMZ/wibi2U941BTcxvtvIA6ZGc+o+2L/7ZKwWn4hkz19qOa63pjd/GHzkYalgy8Qz@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9pVJ9MqcVe8HOMjjxY+yVuyKrkFPjt4+36fzDOlDnJ3ILUkKR
	Yl1XD/Y/IYIfmKf9AxDGFCaH9jnhsg+cFzV0dNYbgSzNRTyw9cn6mvnzzIx9exHN868BHotuT9q
	kmzgEf8RuGOvorhEoeGoT4g==
X-Received: from wmdd23.prod.google.com ([2002:a05:600c:a217:b0:493:f79d:63cc])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19cf:b0:495:7a04:b006 with SMTP id 5b1f17b1804b1-4980c66b572mr188442825e9.8.1785751871069;
 Mon, 03 Aug 2026 03:11:11 -0700 (PDT)
Date: Mon,  3 Aug 2026 11:08:58 +0100
In-Reply-To: <20260803100904.3563942-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260803100904.3563942-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
Message-ID: <20260803100904.3563942-15-vdonnefort@google.com>
Subject: [PATCH 14/20] KVM: arm64: pkvm: Warn on guest stage-2 block collapse
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	keirf@google.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_031113_656297_DF9D7AC0 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

When pKVM is enabled, the host relies on a pkvm_mapping tree that
mirrors the actual hypervisor-owned stage-2. The hypervisor is not
allowed to silently split blocks or collapse page-tables. This should be
treated as a bug.

Therefore, WARN on guest stage-2 page-table collapse which would
otherwise be fatal anyway.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 2340706e41d3..e16dde4c5f4b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -226,6 +226,12 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void guest_s2_free_unlinked_table(void *addr, s8 level)
+{
+	/* We should never collapse guest stage-2 tables into blocks */
+	WARN_ON(1);
+}
+
 static void __apply_guest_page(void *va, size_t size,
 			       void (*func)(void *addr, size_t size))
 {
@@ -287,6 +293,7 @@ int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
 		.put_page		= guest_s2_put_page,
 		.dcache_clean_inval_poc	= clean_dcache_guest_page,
 		.icache_inval_pou	= invalidate_icache_guest_page,
+		.free_unlinked_table	= guest_s2_free_unlinked_table,
 	};
 
 	guest_lock_component(vm);
-- 
2.55.0.508.g3f0d502094-goog


