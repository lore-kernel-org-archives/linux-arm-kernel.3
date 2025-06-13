Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73CCC7114A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1K2XaU3tNN3z0G/Brd+aKIcwvKoH6QYgKOpK8mTmcUQ=; b=M7ix8XKtbAyqjwDUrKwvaa3aik
	KP5BFBlOt8qMaa1uEqC6V5BB3t7mX9BiqSwSQhUVllWf6pNkx6uRfn0miPhxusd05TA1WDHkZ48Ls
	iN0emsmuhIt14h4nN+egzd647KOBS7LT5UZRSkANJidbuLPMQW8jIVHaHevQTbo8ceEygsDYeN5YX
	n0d0SWyRFQJMqFyq9e18I4RNqbWPdYLiG90G5RLmdupmGi3BtYz8j0Tf1EDxtUzo893jqjYs+jU/8
	nUEYV2fUHE5QbzyqdJ02iVB8+wlaST2NpuCcufuaHDdu+1aYJQuvg5Db8+gyqBJ90bU+Z+vM3VFHC
	TANCxCug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ8xC-0000000HFZK-0Ie1;
	Fri, 13 Jun 2025 18:16:38 +0000
Received: from mail-ot1-x349.google.com ([2607:f8b0:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6i0-0000000Gxm5-0hg0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 15:52:49 +0000
Received: by mail-ot1-x349.google.com with SMTP id 46e09a7af769-73838f64415so1637656a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 08:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749829966; x=1750434766; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1K2XaU3tNN3z0G/Brd+aKIcwvKoH6QYgKOpK8mTmcUQ=;
        b=1C8V+Th5hRE8hkaUsrEUONKtkIyZPD/cbrBpLRaSTTSJpOcIwjwfYJiC+/Gyrl38oV
         0XxdehRkMEgfpCWA+IlyV8Sr2p8kKA2DxMf8TawAtkH8zN2a6DnqYkp3f981+uJriqGr
         aMwTttU9yorboOj893m2yf4+P9XjqOGBU1PyDJKiHAplE7sp7aPUbwlBWlQcJX/8UM9M
         684TJ/AJjsw0YXVAWeYvqmt94+9pCAEOjDQ2iVhLP/1bmOtdiGvZ1CEkqYnsOh8wQkcV
         c9kEvUDuxxg13v0/rqOu+cznmoyvKwqitg6cogPjqDcgtVQlfFc+nQ+D933xPwBCkVv7
         0Zpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829966; x=1750434766;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1K2XaU3tNN3z0G/Brd+aKIcwvKoH6QYgKOpK8mTmcUQ=;
        b=h8VSJjfrckpX7zpZqNPCY/pONpJdK0RsjVa5GoVqrbzBLdopJt1R5x6+j68P0rSias
         CvNPbjz1fPr/H83iNwMy1HQyeAlYju6BzwF46WH1lcEIX26rtXmj5bi0Tj2sQcbJFsj9
         a1nFRpZN9O83hJyQgfCzVZW1YoLLPGP1O+oAikoh9ieePCnFuTppGg80346WwHCwAUq1
         pqSusCxCC0x4aAR8hLWUMyOeAUmTHPBpG0B8ONDKZ3LztSecLNrtbOv29pihMyBLwNM+
         MM1/k/tkl0IyT+2GCiUu/Vpuccd+vZQZwQRbcG7snq3RbRYOwZhsMghn9iJjX5XOT8cB
         XVKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBiabi8NGyQQATxCkwo6Eqo6q1mjyc8j/AEgE73TwwGGgC+S2Xd6h/HvLsxYzgd1ju6+bOL9jxiwTUp6uhixPE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuqk7WpaOIfCdIenS8O3uKBwYWguBKX2klgL6EQt2u2t2yQe1p
	1vgRlqxgo1SQ0VmFSFzgiKMbkicPfS6tVca6+TXmvtw7eZNKOESSziwbxLe0vpLY91goMjdcXRS
	F42HZNPvxCQ==
X-Google-Smtp-Source: AGHT+IHFbGJBseK+0NlITWxhqlLkXWlDYICLQM+zu92+pohfxizATwmXWeCDlmWgZ4GDVI5eahezZ/DYLRTe
X-Received: from otbbu4.prod.google.com ([2002:a05:6830:d04:b0:72b:8185:e90e])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6830:210d:b0:72b:9d5e:9456
 with SMTP id 46e09a7af769-73a36367352mr186163a34.13.1749829966723; Fri, 13
 Jun 2025 08:52:46 -0700 (PDT)
Date: Fri, 13 Jun 2025 15:52:38 +0000
In-Reply-To: <20250613155239.2029059-1-rananta@google.com>
Mime-Version: 1.0
References: <20250613155239.2029059-1-rananta@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613155239.2029059-5-rananta@google.com>
Subject: [PATCH v3 4/4] KVM: arm64: selftests: Add test for nASSGIcap attribute
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_085248_204715_E3A09410 
X-CRM114-Status: GOOD (  13.08  )
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

Extend vgic_init to test the nASSGIcap attribute, asserting that it is
configurable (within reason) prior to initializing the VGIC.
Additionally, check that userspace cannot set the attribute after the
VGIC has been initialized.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Signed-off-by: Oliver Upton <oliver.upton@linux.dev>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index b3b5fb0ff0a9..aaecba432dbc 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -675,6 +675,46 @@ static void test_v3_its_region(void)
 	vm_gic_destroy(&v);
 }
 
+static void test_v3_nassgicap(void)
+{
+	struct kvm_vcpu *vcpus[NR_VCPUS];
+	struct vm_gic vm;
+	__u8 nassgicap;
+	int ret;
+
+	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	TEST_REQUIRE(!__kvm_has_device_attr(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+					    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap));
+
+	kvm_device_attr_get(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+			    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap, &nassgicap);
+	if (!nassgicap) {
+		nassgicap = true;
+		ret = __kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+					    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap, &nassgicap);
+		TEST_ASSERT(ret && errno == EINVAL,
+			    "Enabled nASSGIcap even though it's unavailable");
+	} else {
+		nassgicap = false;
+		kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+				    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap, &nassgicap);
+
+		nassgicap = true;
+		kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+				    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap, &nassgicap);
+	}
+
+	kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
+			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
+
+	ret = __kvm_device_attr_set(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_FEATURES,
+				    KVM_DEV_ARM_VGIC_FEATURE_nASSGIcap, &nassgicap);
+	TEST_ASSERT(ret && errno == EBUSY,
+		    "Configured nASSGIcap after initializing the VGIC");
+
+	vm_gic_destroy(&vm);
+}
+
 /*
  * Returns 0 if it's possible to create GIC device of a given type (V2 or V3).
  */
@@ -730,6 +770,7 @@ void run_tests(uint32_t gic_dev_type)
 		test_v3_last_bit_single_rdist();
 		test_v3_redist_ipa_range_check_at_vcpu_run();
 		test_v3_its_region();
+		test_v3_nassgicap();
 	}
 }
 
-- 
2.50.0.rc2.692.g299adb8693-goog


