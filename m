Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36B3E6FE28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+/9YLEDg3kvIVJ8uIdd0LLUvUHitQ7YUX6eQO1NlK0=; b=yPyDGlArn81lXpOhp3DQZiE7T3
	utZ1EQetd738X+p1y1YJSg4cyDiJH+DBF5E1fdHbo/bHD2Bng85xFZbCR8kbFNo6yJK+ibvNuHnLI
	rPDEpGXufYSK1hyGTipTMSy77ZvYCeD2d6DSbfmKPwu32L+PvV0HscIxEa1J+EgdzXRADdwo2UkWW
	bbVNe+kUbAzuvvKTrxpVXZ1wXgaBNGwoNd1vc4KhzP6RQ/RvOLsllfPHiamwzGIG/xv9/QlVpV/p7
	e8JYUZ6YGcxT8K9tPuuMV4ITGUyEFVNYog/HCIhw9luxweDZsnE6iBzXp2CD+CLvoqJL+EgPNA8x1
	QuYDYWMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8Ce-0000000FzZ9-3Uap;
	Tue, 23 Dec 2025 19:37:52 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8CZ-0000000FzXv-47cf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 19:37:49 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so9866549b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 11:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766518666; x=1767123466; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=f+/9YLEDg3kvIVJ8uIdd0LLUvUHitQ7YUX6eQO1NlK0=;
        b=CNr1Biy9eGzTD1KI4HVyBv0ARHS7SFkPqtPynCFyWKop5pqbwZ0/ua+SZi2INZgnGm
         vBELf8fBLMIgB5b2qYaY1XH0ZdLAJoJ/4iZtrpfJYNLihLfnVkf525VeWKM6kYw4RM4+
         BanAb92hY5rGeNjW3QYHzS85sCn9uGM2gZo/Vmx0halANJ/R6CBn8HC+cJAxAj55PSBn
         ak9GIkH0kBtikHoTNoyqn3mBagf0Bltgai+biN7a8StPLHsPGgKiVh683pD8hdPvTjBd
         FHX7cZXnILGJhux5hmC8CXmaPpKnAO6uRtaUdLQxwP1uZB+5V9PN/N9mSq2tpWKuYA2a
         tQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766518666; x=1767123466;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+/9YLEDg3kvIVJ8uIdd0LLUvUHitQ7YUX6eQO1NlK0=;
        b=FwyuVIfSSsyfajKE+WoVEpx5hex4c8N1rL3D9gBt7yiNBbneUdApizH5WzLA3Prhpd
         UirkOceEAAcBVhl25+AHGruH+cA3idlFcopVoLEwclv0yEcmuyIWBICUT9RAdvPBftKB
         ihmxEZ4mfuCVk46g8otSu88sTwyTw+qHzayRj8JkZZel+CQxkXybM4TGPDYCHW5ZMNib
         mELbyyeuF0DkbA2ddY7NzYUgoVrsvEbytJeWpuFqasfOprjgCL51IfqTNcsB1cIZicuZ
         cnR3wqMYQcR7vik2FgocqZjDmDWp/6MQWv6hV4mR/HSmsxqB2wvZ7kSlCr+grMLCQ7Uu
         eeKg==
X-Forwarded-Encrypted: i=1; AJvYcCXzlzBRv+bd9xFrHYB6GK69LQ5OjmaQzXMYs3jpJvq6i5MfNYGLFy3J57a0oBzdlT3qxEd41cnuLxp4bHhV3RBD@lists.infradead.org
X-Gm-Message-State: AOJu0YwRfUMZdQtkfGLdinfd8DBZnbw6tzyNvMkWG+lzJkiSl9ewgUUB
	ZWRn+PeTCFY4ih0Kb0wWplPWwhUNgF+5B7XH0QP4dwOtiDlZzN0nRBlUDt102F4xTiaYdc14VJJ
	JfEI+LILSkCHaSA==
X-Google-Smtp-Source: AGHT+IFdQ0xv1ECz+S2fE4SGRa/G62rXTSK/YhtqO7PYzVPbTpr6YHYABHt3naOEamVpBBjQGWHJo2312jteHA==
X-Received: from dlbps8.prod.google.com ([2002:a05:7023:888:b0:120:5def:9544])
 (user=pekangas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:6199:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-121721acb6dmr15174419c88.7.1766518666308;
 Tue, 23 Dec 2025 11:37:46 -0800 (PST)
Date: Tue, 23 Dec 2025 19:34:40 +0000
In-Reply-To: <20251223193440.1441657-1-pekangas@google.com>
Mime-Version: 1.0
References: <20251223193440.1441657-1-pekangas@google.com>
X-Mailer: git-send-email 2.52.0.351.gbe84eed79e-goog
Message-ID: <20251223193440.1441657-2-pekangas@google.com>
Subject: [PATCH 1/1] KVM: arm64: Fix hyp VA size between layout and MMU
From: Petteri Kangaslampi <pekangas@google.com>
To: kvmarm@lists.linux.dev
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Petteri Kangaslampi <pekangas@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_113748_024359_667CBA8E 
X-CRM114-Status: GOOD (  13.86  )
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

Use a consistent hypervisor VA size between memory layout and MMU
initialization logic when the kernel is configured for less than
IDMAP_VA_BITS of VA space.

Signed-off-by: Petteri Kangaslampi <pekangas@google.com>
---
 arch/arm64/kvm/va_layout.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/va_layout.c b/arch/arm64/kvm/va_layout.c
index f6ca0193a96f..76cdd62550e1 100644
--- a/arch/arm64/kvm/va_layout.c
+++ b/arch/arm64/kvm/va_layout.c
@@ -49,7 +49,7 @@ static void init_hyp_physvirt_offset(void)
 
 /*
  * We want to generate a hyp VA with the following format (with V ==
- * vabits_actual):
+ * hypervisor VA bits):
  *
  *  63 ... V |     V-1    | V-2 .. tag_lsb | tag_lsb - 1 .. 0
  *  ---------------------------------------------------------
@@ -62,10 +62,17 @@ __init void kvm_compute_layout(void)
 {
 	phys_addr_t idmap_addr = __pa_symbol(__hyp_idmap_text_start);
 	u64 hyp_va_msb;
+	u32 hyp_va_bits;
+
+	/*
+	 * We use the bigger of IDMAP_VA_BITS and kernel VA size as the
+	 * hypervisor VA address space size. See mmu.c.
+	 */
+	hyp_va_bits = max(IDMAP_VA_BITS, vabits_actual);
 
 	/* Where is my RAM region? */
-	hyp_va_msb  = idmap_addr & BIT(vabits_actual - 1);
-	hyp_va_msb ^= BIT(vabits_actual - 1);
+	hyp_va_msb  = idmap_addr & BIT(hyp_va_bits - 1);
+	hyp_va_msb ^= BIT(hyp_va_bits - 1);
 
 	tag_lsb = fls64((u64)phys_to_virt(memblock_start_of_DRAM()) ^
 			(u64)(high_memory - 1));
@@ -73,9 +80,9 @@ __init void kvm_compute_layout(void)
 	va_mask = GENMASK_ULL(tag_lsb - 1, 0);
 	tag_val = hyp_va_msb;
 
-	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (vabits_actual - 1)) {
+	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && tag_lsb != (hyp_va_bits - 1)) {
 		/* We have some free bits to insert a random tag. */
-		tag_val |= get_random_long() & GENMASK_ULL(vabits_actual - 2, tag_lsb);
+		tag_val |= get_random_long() & GENMASK_ULL(hyp_va_bits - 2, tag_lsb);
 	}
 	tag_val >>= tag_lsb;
 
-- 
2.52.0.351.gbe84eed79e-goog


