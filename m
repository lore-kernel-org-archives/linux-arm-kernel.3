Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6F1C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 06:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqEuJEoPbKvmQ82yf9uvBWxpPYFbSngty6vt/ZB4aZ4=; b=WBYGyNlTP6vU80icygiT2MJad1
	B69FJt/WJFJ3xJUO1ZIw/KhLmykAxaRVmiSraJcBhZ3pV+UhGmZqLe51gQ87cv1lcrsizcWcfTJY5
	quizTmpIP7Nmnah75xBxOctIluFQHTcgxGZUOwfJLoTVNfzkWLyZWMCdviXhRZ7FMLIFDM0Gi7/E+
	JwtYt6bZAw+U/gQxNAplcXjoEbZS9xp1il/VMi0M7/HOqxARAdezMepHcMhjUSM0AQ6JOj6tjhlDY
	RhN8V5XRWk4NgPSQILJcD8vZjvCB9HeYJ8cFZQu1J2LkjvmSw4O5MefKGUsSYtXv5hvMkqFxgq8BC
	FGlM17rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJsF-0000000B9Vc-12X8;
	Mon, 10 Aug 2026 06:52:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtJsC-0000000B9Ur-2nbt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 06:52:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso17307365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 23:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786344755; x=1786949555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OqEuJEoPbKvmQ82yf9uvBWxpPYFbSngty6vt/ZB4aZ4=;
        b=Srx7+rLxOxXXEB9tnYfYruDOAtjL2LVL2W7XtExNy98yDqSHym+mHUUD6mpau43i6n
         tfcfA2xRegUizSPU2LEhDtkuVOGjIgdL2gRjIa36I+G+on1+u3TDV5hELyukPctLSVDD
         iZoMN5Ai1dDZZepznb6t/PyZTWRTleqdcJoQlPrjOZrUVGpXAAlY77qEu2kCYufLwAGj
         DN+e704g6Jyvk+FPTO6nUP3uyXxAJxUvFS8TOp5vmU9mD5gPhKmHna2mnPHXRJIwkfyY
         mhtYafyx6m6yIkWt1avdqHt0lhypxqGii5TCfapiWDwxbDJky63fuZG+QfzRKQ8F7Cft
         P0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786344755; x=1786949555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OqEuJEoPbKvmQ82yf9uvBWxpPYFbSngty6vt/ZB4aZ4=;
        b=V8A6YPYOWguXm1j0nl750dwLT5nfzT6spib0H2O4nTB9xf1jjaafXw8PhdCt9x/Vds
         NnFAqPmfp79RvosyNDUyLVqv+h/U4j0iZdZQmaOe9PkvS2WWqAMPGkGedqjz+4lGEISs
         ku6UjJ91Uepg2KqNyCMB+L1xut1pDO7dRcOAoLXisQhYEhk7ounQV37Y9rDSIC297yG/
         74xJRgg4kN07OBv4MxqwGbKf2NBM1ZHVhpYN+qiiMO/FRHmTRjOUaP9kci8FUyirXlEb
         7DobseIJBSqZfy7tz994H+Gy9wfXj4pvSM3r94aqLhiZlCQqqMmXM7fxmgs3oEDMfmyB
         drWg==
X-Forwarded-Encrypted: i=1; AHgh+RpOM8eyhumt/pgAmM+T30DiANipnD5fualPrY5SN9tm+aiZwuNLU83FlRpIPUlTfFW8j38LnA9J9iig42l+UjnK@lists.infradead.org
X-Gm-Message-State: AOJu0YwJLDYAyn/yy9nUOv1ybW8e0qB4W+xlSJeJEinKfTQAfoXMf7yG
	u0Zs2dHgcDNgXww0+e0OCsy+piSxpcNQwW/19qqmSs6v4KlC46wGKGM8
X-Gm-Gg: AR+sD11lM9X/O4+1+xX9oxUmdfSKGNsLc54qMcf5DqcCf9TYPp7y9jqDlUT6v26H+me
	6osOiDANsXDMKAx8EfuS6SQfHI14yNJveklM6hQ4hJxlU+0mF3j0TCrrQjOEvpb4WUPfM6t6NyN
	WH4J9DyhoWljQCi94KgIOM0HN1zlWbKaK4gSNZxCabz1tN56Poy7bxt/l9h7rJh6Cc8Mxqh+weq
	Mey0Vcljz5npG2nVZ09tawhr2Dn0kgp55Nm33cIep6nTNpGqy0RkFucZT+KwPTjgpS8oF6kt6vy
	N8JvdSOvlwF2SHo5BcOu9XPxO8RImTe8orsPY6Zvj3Cmt8Ho3CZBcWELk3PaLKWasZfy9iGdwTa
	WvBfkF0xhLz+q/kxB27XyfkJkMc2/5Leq9mBo9ZYgRpqdNJvI6gk+O+PUcUJY5VC8G/OOcD8dPZ
	xGoaqNif2dSkcsKKWagmjmC7J1TnM4/wkC20Vsr8/Ep4Cj3Uks42eVYTRZ6QXhpgzr+prFQarQN
	UVYPPCMod19LTo5zU93IfgVL5Xx7VOYzOJBqJvBYy0/i8osUYvuIY2xaQs2q8vMI+908YWicdRN
	setA88RZhYQOhXp52EzugSmSzrud222/6BWYVUf6QzpNDZUga+LJL5zirvUtnyNHrS93dPrlDiw
	WBA==
X-Received: by 2002:a05:600c:c4a3:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-4994e71eaf3mr490380035e9.7.1786344754823;
        Sun, 09 Aug 2026 23:52:34 -0700 (PDT)
Received: from MBP-von-Karl.localdomain (dynamic-2a02-3100-a1e8-7401-78b1-a175-5d13-e92e.310.pool.telefonica.de. [2a02:3100:a1e8:7401:78b1:a175:5d13:e92e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995420c68fsm358800705e9.1.2026.08.09.23.52.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 09 Aug 2026 23:52:34 -0700 (PDT)
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
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [RFC PATCH 1/2] KVM: arm64: vgic-v3: Roll back failed redistributor region setup
Date: Mon, 10 Aug 2026 08:52:16 +0200
Message-Id: <4e00fc25aa61ec52e6ef033a53588ce3f5550982.1786344511.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1786344511.git.kmehltretter@gmail.com>
References: <cover.1786344511.git.kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_235236_734342_DB0543E8 
X-CRM114-Status: GOOD (  16.00  )
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

A later REDIST_REGION attribute can be inserted successfully and then
fail while registering redistributor iodevs. For example, a region that
overlaps the distributor is caught by vgic_v3_check_base() when the first
unassigned vCPU is processed.

The existing rollback unregisters all previously registered
redistributor iodevs. It leaves their rd_iodev.base_addr values set, so a
corrected retry skips re-registering those stale vCPUs and succeeds with
holes in the MMIO bus.

A failure from kvm_io_bus_register_dev() can leave another hole. The
failing vCPU already has its base address and region assigned, but the
old i < c rollback does not include it.

Preserve devices assigned by earlier successful setters. On failure,
unregister only vCPUs associated with the newly inserted region, clear
their cached base addresses, and free that region. This also includes the
current vCPU when iodev registration itself fails.

Fixes: c011f4ea106b ("KVM: arm/arm64: Check vcpu redist base before registering an iodev")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-mmio-v3.c | 42 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 5913a20d83019..832a7fe65984c 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -841,6 +841,31 @@ void vgic_unregister_redist_iodev(struct kvm_vcpu *vcpu)
 	kvm_io_bus_unregister_dev(vcpu->kvm, KVM_MMIO_BUS, &rd_dev->dev);
 }
 
+static void vgic_v3_rollback_redist_region(struct kvm *kvm, u32 index)
+{
+	struct vgic_redist_region *rdreg;
+	struct kvm_vcpu *vcpu;
+	unsigned long c;
+
+	lockdep_assert_held(&kvm->slots_lock);
+
+	rdreg = vgic_v3_rdist_region_from_index(kvm, index);
+
+	kvm_for_each_vcpu(c, vcpu, kvm) {
+		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
+			vgic_unregister_redist_iodev(vcpu);
+	}
+
+	guard(mutex)(&kvm->arch.config_lock);
+
+	kvm_for_each_vcpu(c, vcpu, kvm) {
+		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
+			vcpu->arch.vgic_cpu.rd_iodev.base_addr = VGIC_ADDR_UNDEF;
+	}
+
+	vgic_v3_free_redist_region(kvm, rdreg);
+}
+
 static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 {
 	struct kvm_vcpu *vcpu;
@@ -855,16 +880,6 @@ static int vgic_register_all_redist_iodevs(struct kvm *kvm)
 			break;
 	}
 
-	if (ret) {
-		/* The current c failed, so iterate over the previous ones. */
-		int i;
-
-		for (i = 0; i < c; i++) {
-			vcpu = kvm_get_vcpu(kvm, i);
-			vgic_unregister_redist_iodev(vcpu);
-		}
-	}
-
 	return ret;
 }
 
@@ -984,12 +999,7 @@ int vgic_v3_set_redist_base(struct kvm *kvm, u32 index, u64 addr, u32 count)
 	 */
 	ret = vgic_register_all_redist_iodevs(kvm);
 	if (ret) {
-		struct vgic_redist_region *rdreg;
-
-		mutex_lock(&kvm->arch.config_lock);
-		rdreg = vgic_v3_rdist_region_from_index(kvm, index);
-		vgic_v3_free_redist_region(kvm, rdreg);
-		mutex_unlock(&kvm->arch.config_lock);
+		vgic_v3_rollback_redist_region(kvm, index);
 		return ret;
 	}
 
-- 
2.53.0


