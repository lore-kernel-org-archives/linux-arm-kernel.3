Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD35C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJR++uOi5dTiSKJhpV6uor7RZpeZqCuTfsiFF6sw6hM=; b=BSXxXytKp5UI/kre2ELJjkQL3s
	7pC/6+/o0El23Pf4OLAgLT6IllsW8YSmxYQelHDGsbmbdJ7GiZqv1Xr+ykjNA4ZYDkV1ixNcnd3aq
	N83iw1CQPvZewAjqKuY1s7XWRgQtyFCf5HzUjrPQBZUrq9B02RlHLpRFxiMiCOzNrUMwzkzxWe6Lq
	9aiBh4wDv+VNSV6dSMjDRPVblWZNJ+fSLLcJKB5jlTO/1nRrG+TbSCYD4Mfd32EaSeByBWI81cx+a
	8mVmsSRi/Wfr/Be0E6IS+4JuK6r0e6Oj4tdV6Zdju4KHECo2+h2+fVkBfMLjYTWMMPs16ImUl/6YW
	faVevvNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQa-0000000ERUG-32Gw;
	Sat, 22 Aug 2026 09:54:16 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxiQP-0000000ERO2-0Y3l
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 09:54:06 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so2460261a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 02:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787392443; x=1787997243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJR++uOi5dTiSKJhpV6uor7RZpeZqCuTfsiFF6sw6hM=;
        b=X1itngQVDFg6nnXQa/mrnaSo/+5EsocBL5/U/f5BqZ6mZbhYgRIYA/rUNyh+bvUGG/
         FzU9S3giLwVF9s2yDCmGDNZMT8wRFqrLGRzMxmhjwh9BiAi5LPiNXP7of63qOnxHl1Sw
         wLKMBKi2Um6IFp2nA5wzLDTI7rFKHg/xkT3YFoGMPUbs6crgWQY9hZ9RxuknJaAVapvk
         r+oNEeaFrSx1cglnuPDwbaz8DS2y51gSRrbi/FXk0lwKt6F4p9dQZMs+xFI9VMljzXAV
         fFMoZAwETsB0UYspERGflt4lB5kJ1CNx86N2H2L2rJMVtrEXBUl2gGN6EN1i17UCf/h0
         UUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787392443; x=1787997243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJR++uOi5dTiSKJhpV6uor7RZpeZqCuTfsiFF6sw6hM=;
        b=JY1QPJIuf9hc+/i635Jo07fdiZUEW4j6uU/Mtlre+JwZL74nAXNR3ET8K3R/rr9AtU
         0Lh5/jxIOIt+h9kCgjT4a6KRjPBNeT1jQoXU8+W5q+qF4KY2yJRUDcjJ2PhyYQQ5jZg1
         2BSxpR8eeBuXj5SOJRQX9Sw2FS/37JLezQPeFcUABEAWQzalApNQDT/VPuH1l7DUpVxy
         j3hanPVfcSLW+PPTyi5R5nh3P0KBMFJN5KZcg63IszdVYYPefT8dd2Y4csKAGY7tdHlq
         zcUrR5pU018jbAgsrPcAJhsuwOKvjNwq5KVZl0GVEVKcZNu1mh/zTAN3HRQEsrI3DMzS
         ioVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPd2Z2yBKeFANvtpJDuu+X/Jj6wazog+SiMqpp1crNeSSPP9PLlcNGSnnitSY1Tw5nT7Exjww3UdfmoGN2Bi5z@lists.infradead.org
X-Gm-Message-State: AFuF++kIoNFzt854ZsAtl/VWkUnXmVrxK2Zx7PGf7guW3Axi2Ka6JHHx
	HqMkJUf2lBu0mGjk/cbRn/dfqu0zF6zAWCh7a9K4l38IZBTDYXAFzSd4
X-Gm-Gg: AR+sD12+9/jTmg78LqIBAincGwRNj+iCUbnYjJmxa7wGb0Q5IXU0o82YXN0FMWZbOAZ
	dS2MO4fWXeaVrjRW0X4zdq1yRDl/lXLkbC9CeRsDvv2xZ/X2CWoLy7NKCd5QB24r5a0TSG5ROHc
	Am18fidbYwhRM6mrzdzpEXVnlG86lQR/1iqxXvjUOIbJC0+1OooopfTRZp4Gr53e6w5H2QZVnEl
	jhg1PYWprogjTzAXxJUDjbdJVD5+61tsxQcHYt+v6kojKfFqa+QeSXpvUIavy56QqobYGEJDxSL
	r7C2IaXpEASLUvaQUXJbkyI4aRaqFA5oigIim2r8iMuIUGzADTggff3wHAC+udvXSsZoifEkx8z
	rGM0NZizqVDj/PN8pXAC5wZy+EQn4cfUy3hQ8gTyaVrQXOYjmS5voJPFWaXuBbaIb/o+9/PamT5
	WEbfsufa3+2uYJP1tMhmS0XZ3G3OojnkYcD7ToNmqR6x5NdgtABh1EFscG5rNEfr90ErhuJqiL4
	C4fMe3mOBOtvSeOBh7LSMP6IGgdonmLd0U82KFMQJsKUIawev4im013gCtdo55Ykp3ouaNAXckh
	8CikDmFeLnSwE6oS0WwOwR9rTWI7SzAfELxBbQDPlj1uBU8dHToeHpisdlO2EV+LNxrf
X-Received: by 2002:a05:6402:21dc:b0:6a3:fee5:adcf with SMTP id 4fb4d7f45d1cf-6a42f14d952mr13251775a12.1.1787392443344;
        Sat, 22 Aug 2026 02:54:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c327asm11151586a12.8.2026.08.22.02.54.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 02:54:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Fuad Tabba <fuad.tabba@linux.dev>,
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
Subject: [PATCH v3 4/5] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
Date: Sat, 22 Aug 2026 11:53:45 +0200
Message-Id: <20260822095346.53882-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822095346.53882-1-kmehltretter@gmail.com>
References: <20260822095346.53882-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_025405_200994_DC2EF53E 
X-CRM114-Status: GOOD (  11.49  )
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

Pass the guest-code address to vm_gic_create_with_vcpus(), and use
guest_code at the existing call sites. This lets tests with different guest
code reuse the common VM and VGIC setup while retaining the void *
interface of vm_create_with_vcpus().

Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 tools/testing/selftests/kvm/arm64/vgic_init.c | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_init.c b/tools/testing/selftests/kvm/arm64/vgic_init.c
index 47e34b43afb2..84aa97204b7f 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_init.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_init.c
@@ -73,6 +73,7 @@ static int run_vcpu(struct kvm_vcpu *vcpu)
 
 static struct vm_gic vm_gic_create_with_vcpus(u32 gic_dev_type,
 					      u32 nr_vcpus,
+					      void *guest_code,
 					      struct kvm_vcpu *vcpus[])
 {
 	struct vm_gic v;
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


