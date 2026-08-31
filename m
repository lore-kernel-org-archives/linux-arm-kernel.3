Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C2C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7d5RXYEUOuzc4V23hC9MU0bXZ0pxNQetgcVjvcKaM1c=; b=ZYmTN/H/Ofdxp5Bp1r6rFpyaZu
	nHS1CBfER0q/oa7XOJuI+rQDAPCYtu+uo0aEZ2T5jF+gYZryGPDobTujXmCI0nMFBsk+n+9Od1ier
	/MosMEKgLRTRaTfTOR9rKdi/F4FT+05Xd3bX1lUqB028gLxBQgMCP1GHFdgSNu05QAtlrrNureqk4
	XGK4i2m8xZCHT7UYsDmrtncchIQDQCxlkG7YD1gaeDk/TNJlTAgeORrUEGKb83PiY8+3StRI6g6jG
	eg996R0Id7+wvLh9gQlpgz5A4BDOr6YEZBDU3R9AUk+3jBAbKf4WIcTnz5dlPNcx2sMF8Y7KC/iN1
	lFTkDqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x66-00000008nhO-0TTL;
	Mon, 31 Aug 2026 08:10:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0x62-00000008nfZ-1XRK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:10:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so30492445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 01:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788163824; x=1788768624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7d5RXYEUOuzc4V23hC9MU0bXZ0pxNQetgcVjvcKaM1c=;
        b=RcuNfIncO15qeg04ri789tJi8Ph+sznv00soFEGtHxxGDtA/GhHySQWEvHEltZK1xd
         ZjerHAA6HwpPUFVUKdkdadYAxGFd/nff1GTur47tXNOF+Eo4SXwbXB/dcjTdg28g5NUL
         U8VuIVeTtYrF9jaHq1r3EJPESZwO0RP8sHFQ7oy87npmmRWUAMJMdTWviO56xTbrEpXi
         gFItQGyYiJOLNHEa3GpRuf3w7AMvQlXmRiId+2GLL/dt857UbTN28SuQDlMVq2RHtpqi
         lkcWmwsfNyhKtBFfCqePEf0I36O13Knda9RhrFOvGq0iuFUvYTKaaEipB6luN+WrHFqf
         lD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788163824; x=1788768624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7d5RXYEUOuzc4V23hC9MU0bXZ0pxNQetgcVjvcKaM1c=;
        b=fAo4k7fbXUhX6AqTuI7men2iqlVKLj0VzXgjOFDomFiQ/8MwGjwXCSGePpJoNzfMU1
         QG2YKb7aUTRt4ym+QQILkaf3Uh4oVoOwu+bhaJheU+9cb2ntRaRHa1Rp4NSFIXladjJA
         cMMxXznM2iss/wUnyeid3wNccC5lOENfcmjyRjsua5IAfXAC2JCdJ1i0ROSjyp7GGPa6
         yNrk4u13/5xIwhC2mjxCG9LyEtGObAHe2vtHh47hoGgY131RMKS1BpZf/pKl4UK2mePk
         J5L/EtAdQ9pJZstp65wHDx6w+pqD5f0ZDB/vBVYkkZsSYrDYy2s5hHUmmpr0dhiijS/Q
         Hi1A==
X-Forwarded-Encrypted: i=1; AHgh+RpjrWJ4sTWvNX9nelHWqyl4h98+HzITYLZczna1QXSh8NZ2zw/8EMTJPVum1kN0U3vatfFZeUskkzqaIwaBzrd0@lists.infradead.org
X-Gm-Message-State: AFuF++lrhjRiJWzGXjPG1mW6Vjlk5BdpKMqkF3eITCxPFJ6VlJXSonpH
	eoEJF8aaEzCo3ICvzKtUDmcNmbbTtKoVV1gO4+NUWZ4Gql+YVCObY4bP
X-Gm-Gg: AR+sD111eRcKIZDs20sBAr4Y681IngcUIk45xEnq6a4oZlbhu3Er5luOTt9k+mObqyF
	n768dE65n6lmbLJtDmAXp8oYSwf+FZpfqyewRFYD4mHRM6l2a7XYfHqORtg3Zd33bdhBtrTQ52P
	PI/xDknllhP2Kp+gI0+ngIZfomF1scOKhwk+VpNxjgQA2FY+TJzNf4bR2joZFpV6g7+bOC5yVOH
	Q/Of6j61m/JvJ4r1Xj+i00Y2kjZvavck3VxGyWmW9+ZFs3aUvdOyQJJRuvmCwDfMOksefJW7GJD
	SgeFHBbRZNopV6LxJ8oInVDV2PpayYiiZMnvrEbOipdqT2sVC1w0cZTmxN2VQ0tjTt6Gdm1o20w
	RAppKyhLd+tPAZ7eI839oN9ASHREbG5feI62LQxYu091KgSwMYqaRhGzurZmIY1xwViWhk0Y4jK
	8CfOtYyaS8kv1tfuBUMrar23P0tdzBgq0iguy9uqEsAd5REwnqV920el5KL4EddcyB4fzad1crN
	i/yc1c03RqBAOHEEpoGoRb4XaAToKfe7IictFxV3gMYA5TBreXB9m5mCl7DrqqCJY3Se4ypV9r6
	ie20hA9WwaitAajYT08khJT8JI3vtbwSueIzu2r5u2/j5C12VayifNmP4rpRAsjrpym4NHN3S7f
	sdPy1+A==
X-Received: by 2002:a05:600c:354b:b0:495:4d88:e630 with SMTP id 5b1f17b1804b1-49b91c4fb4amr349472475e9.10.1788163823703;
        Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b95013d06sm370393515e9.12.2026.08.31.01.10.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 01:10:23 -0700 (PDT)
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
Subject: [PATCH v4 3/4] KVM: arm64: selftests: Pass guest code to vm_gic_create_with_vcpus()
Date: Mon, 31 Aug 2026 10:10:03 +0200
Message-Id: <20260831081005.41346-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260831081005.41346-1-kmehltretter@gmail.com>
References: <20260831081005.41346-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011026_441306_1FB309D6 
X-CRM114-Status: GOOD (  11.90  )
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
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
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

