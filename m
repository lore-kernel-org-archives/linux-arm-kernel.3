Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C08B2C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7MrJ4egxCjisuoRkHErVFW1wlw+AkBqP17Bfxm8jyA=; b=16ToBvsdaIF2zNTagzJhWf4C35
	9EGZOUdZiZlvLjVp6GOq6tC04WGh1FDBaxxRe23V9q8ELn09q8ttiVpQS678zQIvAs50+A0l86Mxi
	qrEI/edE17HGbhr+s2Vt9ttKrPIZg5Vg+0+gTizWkchAqgGg5DWXM/xP2j8ww+sRBrYv0yS/OsTmq
	8xpT8KqP1NARYj3kqq0VexsPuVAgBfPT7yavy3lxis4/MH0nSN+HuZonDuOOdozr2bB/EJSxypH7Z
	ZwJ8G1mNycWXwXKJckNZuPH+MGFcgXTNjiOMm9qc2oQEKXfJDi+/t8/QsPvqGvITM9qhFk0dEOy9P
	mSPGBK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp0C-0000000Acbx-0WHX;
	Wed, 19 Aug 2026 22:43:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp02-0000000AcXE-3DZI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4957eefd361so12627615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179389; x=1787784189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7MrJ4egxCjisuoRkHErVFW1wlw+AkBqP17Bfxm8jyA=;
        b=FU9jeROJeVbkA/07zrme/I8DwM6b97ELpBJPgJ7ZutX4ycssnB0ENY6q1/etdsmbQv
         rnFwbAFKaPNHwMqqQiiiS98WOyLGnQjcfO05a6GF+6qvoRm2viJxLAouJop390LbRjgZ
         ClAgmqPZZQl7qIw0pM0lDJLJyXWtIDa8l/6n1SjuvA+7IvERlGbC+GeGgCJ43wYBwHkf
         DJKbvWEXRpH0CLIcjoZjOkA/yTN3yTbHg7EIq8L2u91oY+/nmsRjidXIA34a9OH/+haG
         5dOM2YHrGokrCwLv5K7dWk4LljodLm/POzPlr6oWtvxTXNX7blpb7BmdfQVgQtZr6hCV
         yfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179389; x=1787784189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N7MrJ4egxCjisuoRkHErVFW1wlw+AkBqP17Bfxm8jyA=;
        b=glwEvl+EiJER5d2TB+gkM3qmg49OhXDZ3td/+fQMSipJwNK3Lozw4Xp/HLA+I8+8L2
         U/Fxs1zGRVJQp6WYtz7aO39W7gtUuH7g5AeN/ctlgUUhmFGr/pas+v39cHW4s7++fZ+A
         cmaC/tBFafN6Og1Pde3zDTw4oylXbSLr6BQIgsQ6f0qw+RteWFmoh3zOLv5n6Bm4rZMD
         guHd7e+UVQ+z9dgGHB+xkRupNqYQVjbcTN7spm51LSbg/Q7h19kRbKtuRpcn+j6olkGr
         FOLXWtCAQYFb572OMqpR6SaxN/DjLZnX8CzHbS1fszrXyIQpArJDPZYwEZ+4ohaAPgBl
         ZV5g==
X-Forwarded-Encrypted: i=1; AHgh+Rr/yxXpq7SlaNJJJ95DIgtrepBO6r5/foWWD/mKAT04EvDnCdR4csOKHZnVmCMDKjohVGbvwpsBm00+yP95jFGj@lists.infradead.org
X-Gm-Message-State: AOJu0YyW+fESKX0FasDUJQd9Dozzu3RzB/xj2f281hYbXowuXqZkADnI
	HFBllJm18a5Vjfs0/UzUn3BshLBNe5fUqL62s1haXedSO3C4ZTJuhAqb
X-Gm-Gg: AR+sD134RPBv9P+heYF7xbXepwtfiZywgN1fKx+rdNCtUITvEGPO/F7xoY1jCbz505g
	IsVNkc1IvYmBb+RpPvCWPxjpZrDyUq3k9Uae7jcE4HKantfI4yXYv8R4Luw6VyWcTylQZES2/vi
	Q+sMdWRN+4Xz4cNTWbOyDLzptGOYNYtQrgWEDD2V44Xpkz8+s02CokbPWh3fEES2j0z9h3Q+aGj
	9nUd+uIF8OPuNhjGb24uY5P1CSGFnrYy5VKp4n+Y1dfDxewQr0xwqtwu/Xz2YXIqFGfVo9X0IGr
	XMI40XWgjW2ZcRu3ttbfOotBXwuAz2+2JUsYsS6LFK6yXsepIhCIOIuMGs27OsaPdqEzvFsA/t6
	ArRuxU+WAkJ8lUpaXuGncSqpaDInAtrhZXUbqQxAPifAdIW4KEIW3ZvURXBwzSaA6LLU9m4qtXA
	JaLz5ehinc4hULUjclPA4AjwKYgMk1OB5SwjwW/9xtkr/2wWJ911cDxW7H+4RiIv7R9naa4AxU0
	yB33dmkwzEizki25c+svN+L9zxF1RLvpZ5bAj2eXHk1MJl/ZnzZvyh5Km2JHoc5ItoXlJgxoW4y
	L5UkrFHTTY0GEoFJO6Yg6ffzhW2l5hvmhnDF6iGkGoCysIGqsvTNDXqA6fF3NHVikebbjaLwD6A
	eCA==
X-Received: by 2002:a05:600c:a00f:b0:499:9069:c2c9 with SMTP id 5b1f17b1804b1-499aa1b6c8dmr158647395e9.11.1787179388687;
        Wed, 19 Aug 2026 15:43:08 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Eric Auger <eric.auger@redhat.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 4/5] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
Date: Thu, 20 Aug 2026 00:42:28 +0200
Message-Id: <20260819224229.82948-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154310_837644_8D4C8B36 
X-CRM114-Status: GOOD (  12.08  )
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

Pass the guest entry point to vm_gic_create_with_vcpus(), and use
guest_code at the existing call sites. This lets tests with different guest
code reuse the common VM and VGIC setup.

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 26 ++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 47e34b43afb2..91484fd4f786 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -73,12 +73,13 @@ static int run_vcpu(struct kvm_vcpu *vcpu)
 
 static struct vm_gic vm_gic_create_with_vcpus(u32 gic_dev_type,
 					      u32 nr_vcpus,
+					      void (*guest_fn)(void),
 					      struct kvm_vcpu *vcpus[])
 {
 	struct vm_gic v;
 
 	v.gic_dev_type = gic_dev_type;
-	v.vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
+	v.vm = vm_create_with_vcpus(nr_vcpus, guest_fn, vcpus);
 	v.gic_fd = kvm_create_device(v.vm, gic_dev_type);
 
 	return v;
@@ -338,7 +339,7 @@ static void test_vgic_then_vcpus(u32 gic_dev_type)
 	struct vm_gic v;
 	int ret, i;
 
-	v = vm_gic_create_with_vcpus(gic_dev_type, 1, vcpus);
+	v = vm_gic_create_with_vcpus(gic_dev_type, 1, guest_code, vcpus);
 
 	subtest_dist_rdist(&v);
 
@@ -359,7 +360,8 @@ static void test_vcpus_then_vgic(u32 gic_dev_type)
 	struct vm_gic v;
 	int ret;
 
-	v = vm_gic_create_with_vcpus(gic_dev_type, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(gic_dev_type, NR_VCPUS, guest_code,
+				     vcpus);
 
 	subtest_dist_rdist(&v);
 
@@ -411,7 +413,8 @@ static void test_v3_new_redist_regions(void)
 	u64 addr;
 	int ret;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 	kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_CTRL,
 			    KVM_DEV_ARM_VGIC_CTRL_INIT, NULL);
@@ -422,7 +425,8 @@ static void test_v3_new_redist_regions(void)
 
 	/* step2 */
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 
 	addr = REDIST_REGION_ATTR_ADDR(1, 0x280000, 0, 2);
@@ -436,7 +440,8 @@ static void test_v3_new_redist_regions(void)
 
 	/* step 3 */
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	subtest_v3_redist_regions(&v);
 
 	ret = __kvm_device_attr_set(v.gic_fd, KVM_DEV_ARM_VGIC_GRP_ADDR,
@@ -608,7 +613,8 @@ static void test_v3_redist_ipa_range_check_at_vcpu_run(void)
 	int ret, i;
 	u64 addr;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, 1, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, 1, guest_code,
+				     vcpus);
 
 	/* Set space for 3 redists, we have 1 vcpu, so this succeeds. */
 	addr = max_phys_size - (3 * 2 * 0x10000);
@@ -641,7 +647,8 @@ static void test_v3_its_region(void)
 	u64 addr;
 	int its_fd, ret;
 
-	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	v = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				     guest_code, vcpus);
 	its_fd = kvm_create_device(v.vm, KVM_DEV_TYPE_ARM_VGIC_ITS);
 
 	addr = 0x401000;
@@ -684,7 +691,8 @@ static void test_v3_nassgicap(void)
 	u32 typer2;
 	int ret;
 
-	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS, vcpus);
+	vm = vm_gic_create_with_vcpus(KVM_DEV_TYPE_ARM_VGIC_V3, NR_VCPUS,
+				      guest_code, vcpus);
 	kvm_device_attr_get(vm.gic_fd, KVM_DEV_ARM_VGIC_GRP_DIST_REGS,
 			    GICD_TYPER2, &typer2);
 	has_nassgicap = typer2 & GICD_TYPER2_nASSGIcap;
-- 
2.39.5 (Apple Git-154)

