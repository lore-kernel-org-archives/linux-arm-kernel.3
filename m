Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DDFE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwAl12lINzUU1wjJNYXv+mjPrnLgBSqMlCHa0SUHO+Q=; b=h0WO3MlqBTU7AhPFPGdXKydKsk
	0BQ+cJ2/bjtunMsy/VhI12uUHjFvY4lINLl/MujeoGqp7bZvSB4HCtg01InUViVJRATtR+bfAujLl
	OoCu518ACTNirAXHD+ZewuN+c79g/3nUbbX/EViaHWT1Ovvr3E+BKqDB2vcVrx3le2nglGl23teyW
	wRtKy9I8JVQAqzu2+xEg/IBmF6LMjqtpTFSMYS4hHYkIHOByi1yJ0sNn99hcXRAWiThFV3XVobADB
	7vTrKW4A7rSw25m/snC0Oq9BN6h6a7ADnWGo6qlU/5tWSDAC/C0lrtmiGMOLi9L6C2MINT6SenHbx
	Ee6F4JEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8wf-00000009mWX-1jra;
	Mon, 16 Dec 2024 11:07:25 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8hF-00000009k23-1V1V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:51:30 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so21742735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 02:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734346288; x=1734951088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FwAl12lINzUU1wjJNYXv+mjPrnLgBSqMlCHa0SUHO+Q=;
        b=nE4nlJGAnES+CBTtbd3F7o9UF81SqwAFsFYGP2f4veY6VuGXTeiu0EX/naZ5BzNU5i
         JEN72Ni4HNlD+PPPeDO64ZXRv/e8Or113m0VMpdX6g8Q7qtBHdul4/T5waBCVV504vtL
         stVw4U/3CSwpMp58KLKIlE6gRPzIdSgpxRpDJPgGaRnyPal4PfZOOjTTp1j32LgSOc/u
         TKUyBQOA504Z0KPuHOVQLd1YL1FyEHrKzngctSlW9MbtOaflVCJeruIXNxiiPjTzjFxN
         p3/HtTT9M5HRPqXQLXXXUFtCZS0eCcNATtpg90qxiVERtX96gA8TVi4jnYfWEUIs7AI7
         PjAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734346288; x=1734951088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FwAl12lINzUU1wjJNYXv+mjPrnLgBSqMlCHa0SUHO+Q=;
        b=ExQ9wsyhofQ8hwAeerF5ghpkq5zoLlxxm/kidoPdC4IV3w7DRyiagzHk0+8hKcnYPe
         duYAnNPSUHsyzTQjppnufTw01WsWjlnm60NZ0qFf1w+YXZpFd+47ecwehxyFJ6dOe/vh
         QIuPWfHQ9BOHGNjBaW5mMCO4uYAEQ0XwilLjOXRCXO21AwhtrCSNbGDhVo9SpJPQsujO
         GDwiiZ9fUKyFiyWWNVvxJPzpuU8IeO/e1Z5kHRf6YRH7RXEvFxR0JKP1yzHoCwFo+gOH
         5LPBTF2vrhla62AlQvicmgvhvp4g8YYnQTMrF+CY5mjSoFm3TJtiZNvwp/MfOZ5PfjvU
         GU0A==
X-Forwarded-Encrypted: i=1; AJvYcCXFJSPrtFHuhnAZmGnVtANQNgS3XE5a/gRv7yJ9XE0KNSZNxmTBbVASC+lkorw+eYea2FIl4WtO4QVOCaslTjfj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8t+Rkb2Fc2FKTitlqWLoDeZ7qEn3nbwrAsqKiM59qbCYz8Lhz
	s7WoU3P/UbMO7RsxYbSL9HIfBhGoq1OTeh4tktvyft+KohFHaly6Urqts4dd5QMlgCfOQdzLQw=
	=
X-Google-Smtp-Source: AGHT+IHvIhoF+Aau4bm5gA9Mz1g4N0pfL3X1qn7U2qQUMs8ckEf3EvzkKqxsm+/X3rwMvyZosSwYUFQeDg==
X-Received: from wmos10.prod.google.com ([2002:a05:600c:45ca:b0:434:fa72:f1bf])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b99:b0:434:9e1d:7626
 with SMTP id 5b1f17b1804b1-4362aaa50d7mr99950255e9.25.1734346287862; Mon, 16
 Dec 2024 02:51:27 -0800 (PST)
Date: Mon, 16 Dec 2024 10:50:54 +0000
In-Reply-To: <20241216105057.579031-1-tabba@google.com>
Mime-Version: 1.0
References: <20241216105057.579031-1-tabba@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216105057.579031-15-tabba@google.com>
Subject: [PATCH v5 14/17] KVM: arm64: Fix the value of the CPTR_EL2 RES1
 bitmask for nVHE
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, kristina.martsenko@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_025129_394454_2835D13B 
X-CRM114-Status: GOOD (  12.99  )
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

Since the introduction of SME, bit 12 in CPTR_EL2 (nVHE) is TSM
for trapping SME, instead of RES1, as per ARM ARM DDI 0487K.a,
section D23.2.34.

Fix the value of CPTR_NVHE_EL2_RES1 to reflect that, and adjust
the code that relies on it accordingly.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_arm.h     | 2 +-
 arch/arm64/include/asm/kvm_emulate.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 3e0f0de1d2da..24e4ac7c50f2 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -300,7 +300,7 @@
 #define CPTR_EL2_TSM	(1 << 12)
 #define CPTR_EL2_TFP	(1 << CPTR_EL2_TFP_SHIFT)
 #define CPTR_EL2_TZ	(1 << 8)
-#define CPTR_NVHE_EL2_RES1	0x000032ff /* known RES1 bits in CPTR_EL2 (nVHE) */
+#define CPTR_NVHE_EL2_RES1	(BIT(13) | BIT(9) | GENMASK(7, 0))
 #define CPTR_NVHE_EL2_RES0	(GENMASK(63, 32) |	\
 				 GENMASK(29, 21) |	\
 				 GENMASK(19, 14) |	\
diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 7b3dc52248ce..6602a4c091ac 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -640,8 +640,8 @@ static __always_inline void kvm_reset_cptr_el2(struct kvm_vcpu *vcpu)
 
 		if (vcpu_has_sve(vcpu) && guest_owns_fp_regs())
 			val |= CPTR_EL2_TZ;
-		if (cpus_have_final_cap(ARM64_SME))
-			val &= ~CPTR_EL2_TSM;
+		if (!cpus_have_final_cap(ARM64_SME))
+			val |= CPTR_EL2_TSM;
 	}
 
 	kvm_write_cptr_el2(val);
-- 
2.47.1.613.gc27f4b7a9f-goog


