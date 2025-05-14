Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BB0C3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 19:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s3CSQ6PBMOqGVYj+xqhMBfKnGOIDEpoWfmf6grdNY9M=; b=e9d7zM8dnN98KMiJivW7B6Uc52
	AROdeolNWIIEctORh+wx7WDrUpBMnT0Kt6OV8setFxtKchYjdMiczxN+//LZ2EozHee4cjH3Iyr2S
	LR8jat3IOOryqH6pLBnEqsYwKeG0Vv9LlUHOc4hX2Nnj/YaD9Rn1qN2Tg+EDJGNctXvohwpTqblaR
	a2MgoCmJdJZwOrdkbpB4gMdFsAOytfS0/1DEDWGfy6z8yaCv4w5t0X0FHti2/fTq0b8QFrcXmPyAN
	WC1oQfVtrwRtilpXE7+yzEL4ynL9/UbpNO+OWWhKoMveULRiiY7n2Gpps1jTocVV6sGo9IOe7ZlqH
	UIJf5/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFI2u-0000000GCb2-2F06;
	Wed, 14 May 2025 19:45:40 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFHgB-0000000GA2u-0TG8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 19:22:12 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85c552b10b9so13799339f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 12:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747250530; x=1747855330; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3CSQ6PBMOqGVYj+xqhMBfKnGOIDEpoWfmf6grdNY9M=;
        b=lImh0+AB385SEutdejT6gJ7uTp/tq9XYgTXADahszSE9nuRr1bx2ZTaizgCg1G6q2D
         lUlP0FmDCJgM1EBFl0wzcBPrp/C1Bmwl6ZudPoJJwFKWpGfzg++y0pV2K+cN203ImBGs
         M/O6b6+4qqLkX0Ck/POxfhCDdGddfntINuVc2U7+FPW4lKDp6mMRS5jB3x+I9nfqaQlf
         Nn418kgT9HcHW2XN8sVslm7TKbmhC6d8QcAiglT562EjJZGu3HCI05fPv2E521xzLxxk
         oqcRezyLSiiME8K1dRyGr2iZwLrbaSQmsUaM42NM+S8aOrLe5u512nhne5Rzx/7g5KBT
         5aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747250530; x=1747855330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3CSQ6PBMOqGVYj+xqhMBfKnGOIDEpoWfmf6grdNY9M=;
        b=QavDkvcgSs+KZxHREr/tHXBMjMBvtYo4ZiEFg0uJimAvTizyZF1K6eGSL0aQSY0ta8
         gnvRojoaL2fLBKbiyaukuiWzgQS5SQ2CcHfzNnrVZl9rsjNItM2Lzd4d1qaFvxD3zAa/
         JScJkdX+B8BPxj1xVMS1eK+rMnomtBCviSidpXTDymN6+S8TWJv8+WwkQLo9r3Yyhnc0
         01y1OKoEjYFJGITILTOR7b79ir/J0u8M9FDoDInwVlmQz8BaGsRMjCwimR1TcXmrmIbW
         l+9P4bDecBPOhDzfsWBn6mcyjNNeJvzVPRK3LXbnPmdSOxYlQocoyOQ60E+6ZOoZ0Li/
         ULqg==
X-Forwarded-Encrypted: i=1; AJvYcCWa+XlIKGvhaJD5b055hk/2obyWlcr/pRwG7aYAocPnr10bCsahE1Zt1EXGADipIEvGztGLLyQltKOfxpvphvP+@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8cNvxWsaXDKDcpf3Va+VrBKROe1260fBZ+fWo4SfHUGaoXc6r
	ycP1A2CE80wI3V6+G0bH57iZ0/0+KBqeKHubo7kFYpW6DCtHjMF04XGMJzS2fCr7rGNvI6+uYAK
	ts79b7A==
X-Google-Smtp-Source: AGHT+IGg18AnCuBF63uwtJjiLbr7/IX5pN6tnMFQzW8sojexBjp+3ynRNR8yhYl88WVyZs8zmM6M9UEXqLY6
X-Received: from ilbby14.prod.google.com ([2002:a05:6e02:260e:b0:3d8:1a1e:8c05])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:36c8:b0:85b:3791:b2ed
 with SMTP id ca18e2360f4ac-86a08ded21cmr611062639f.8.1747250528149; Wed, 14
 May 2025 12:22:08 -0700 (PDT)
Date: Wed, 14 May 2025 19:21:59 +0000
In-Reply-To: <20250514192159.1751538-1-rananta@google.com>
Mime-Version: 1.0
References: <20250514192159.1751538-1-rananta@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250514192159.1751538-4-rananta@google.com>
Subject: [PATCH 3/3] KVM: selftests: Extend vgic_init to test GICv4 config attr
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_122211_150450_40A05D17 
X-CRM114-Status: GOOD (  13.24  )
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

Extend the arm64 vgic_init test to check KVM_DEV_ARM_VGIC_CONFIG_GICV4
attribute. This includes testing the interface with various
configurations when KVM has vGICv4 enabled (kvm-arm.vgic_v4_enable=1
cmdline) and disabled.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index b3b5fb0ff0a9..adcfaf461b2b 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -675,6 +675,63 @@ static void test_v3_its_region(void)
 	vm_gic_destroy(&v);
 }
 
+static void test_v3_vgicv4_config(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	uint8_t gicv4_config;
+	struct vm_gic v;
+	int ret;
+
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	if (__kvm_has_device_attr(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+					KVM_DEV_ARM_VGIC_CONFIG_GICV4))
+		return;
+
+	kvm_device_attr_get(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+	if (gicv4_config == KVM_DEV_ARM_VGIC_CONFIG_GICV4_UNAVAILABLE) {
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == ENXIO,
+			"vGICv4 allowed to be disabled even though it's unavailable");
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == ENXIO,
+			"vGICv4 allowed to be enabled even though it's unavailable");
+	} else { /* kvm-arm.vgic_v4_enable=1 */
+		TEST_ASSERT(gicv4_config == KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE,
+				"Expected vGICv4 to be enabled by default");
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE;
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+				KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_ENABLE + 1;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == EINVAL,
+			"vGICv4 allowed to be configured with unknown value");
+
+		kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+					KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+		gicv4_config = KVM_DEV_ARM_VGIC_CONFIG_GICV4_DISABLE;
+		ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			KVM_DEV_ARM_VGIC_CONFIG_GICV4, &gicv4_config);
+		TEST_ASSERT(ret && errno == EBUSY,
+			"Changing vGICv4 config allowed after vGIC initialization");
+	}
+
+	vm_gic_destroy(&v);
+}
+
 /*
  * Returns 0 if it's possible to create GIC device of a given type (V2 or V3).
  */
@@ -730,6 +787,7 @@ void run_tests(uint32_t gic_dev_type)
 		test_v3_last_bit_single_rdist();
 		test_v3_redist_ipa_range_check_at_vcpu_run();
 		test_v3_its_region();
+		test_v3_vgicv4_config();
 	}
 }
 
-- 
2.49.0.1101.gccaa498523-goog


