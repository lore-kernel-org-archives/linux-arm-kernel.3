Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BC4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 22:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls308eL6NV0loSgiW60lY9W5Z4q6fPeju3Nkz+urIAI=; b=2KD57H4/imp4btfBKr+Eg69eAT
	vLJUgDM7xVeNEj6Bf16YBoIf4lzjs+qi7ZITbvqjlM1UfOn3VB+ha3JuY3Q9M9MIZk9nbFrM2h+0w
	oaaMJKGK25vwv+c+cC+IdWPC1enLuTwIq9WoPEKiCNeqc2oC1s5U+nzjTMfFjKCOB9ys26crXaJFk
	hitBioYtAa5g80VI+nxOQNW1LZxfdIFVlpdWQM8wZtQxjwG7Y6RxIU20IcjxITk1jTzOmfnUKTnoT
	wgJ7kQ/A7Wi1cRlJe5lpU0owjo+VdjmDsF+J1b9TfsjKmicqZm0DVKrWvtMTj2VtJuf39P3lwpIWV
	39t9ID1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwp03-0000000AcYG-45mW;
	Wed, 19 Aug 2026 22:43:11 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwozz-0000000AcWJ-3KoN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 22:43:08 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4815bce4652so1007711f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787179386; x=1787784186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ls308eL6NV0loSgiW60lY9W5Z4q6fPeju3Nkz+urIAI=;
        b=qFNU5aQ5vwxfQ/3clf1x2zPWno5hBaIXtd//qP++Bbuvz00B9AZvv9V/h6epL2uzXT
         v1Tw3SJsKUmFrKDb/Al3B+hTEsqy8G4IEbfA2KZO0szWN/XPkCNvQWTtaxuqU9bTrAkr
         Xs8Rqv7h14OyOZI46dAJTRGqp25SmaBXFqyVOdpBMvKQz2cHGRICUeEYZTq5LrHJN6kh
         scHfRdIEa7GLdMeOdobVhaSjxAkqGEl8y5ikujlZ2fM/h+SEt/Kv+xR+TA5M8aZ6xLMc
         DBUigo0xg/p/BAczoomyY6t9kLOHZCJxtTs+ImuWlomKRd5+nxukHubkU4rjuYpg0lDE
         hQrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787179386; x=1787784186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ls308eL6NV0loSgiW60lY9W5Z4q6fPeju3Nkz+urIAI=;
        b=Z1xDrkUEE/kog5A71c/LgMWqP6R88NiUi7rJXXPGNLbxACKg2Yi87ECJxR3Jv5Qp7v
         jQ0NnjPA0Fq3PTugWeqCkzk/WrT2n568UBuJ50Kj2xvfXU0cIw1Vw6ruebuB+OHc4n57
         0XJ8+wAwFU+Anr0EPhiQDC/xfZUqXACqAO9J7B0ALieb3ykbMRNk06Ofk7hF8rmm+kWJ
         cICRalM3pz/CdkvfkqKhmclkyvep7bTP8q3IAUvtIkOc13JlHMCnTpe1tCoc87COzm0c
         vh5u/Ci8t3jvlbXhzbQAr9DYjr9nlkNCrLViQ+5VcGMKfrlfTiL3arnoR6ZBmpSFCdub
         1SZA==
X-Forwarded-Encrypted: i=1; AHgh+RpD7tYH/fvY4elBZ6VnTREGQyLAIhWF/Oj+ZJNm2uLg10VhaA9SdO5hr2UCM4ZYVw+wpIH0AI5HNVZ4m9T7/GvH@lists.infradead.org
X-Gm-Message-State: AFuF++nhDY3IA+LzAhPWIZi1QVfgsT5ToGCRB3EjH5CeBFhAUbnES51S
	qH7DkXg2bj20/LB8Jydumr7S5asgBESwiwe1Q9NcJp9oW1OKvKoF7uua
X-Gm-Gg: AR+sD13p+pvB3Xkgssz6pkBeGOBbNl4Fq9s/L9H1I6r9UBmr7sDvvSNBXjbGJa+3sKl
	P89BVuqyozSxdO+yq582ZcZWXpOEzzkxYlwV0e0TqzJpoKXGDXbTyOqSSND/fU8SPgqmTUsbWc/
	zseKmW/4qBc+TjlSRyy5osyDn/B6hE3mFg7BuJsaSpp2W3+5doM88Em3KJZ3Qa/JTFkzxGkCm6M
	bVFSNKvKgSirEevt2bPsidPzwrEMe04u6+54Z5kaXHj1U5uJMbl50IMRdZUeDwfGWDAzInbgIS4
	VClNeDkgBi/0upuc2+2ChGs/VCxyvwMEfvgvLPpMmYMNN6XY9UNoh3WW4O/k+m10rgoBG/eUwb9
	2eGgMRmJbhLGMi37GP+hWVEgJO9Dk44v3u33tI6mLzS+iOKBVhcCbx8w0mWgBKYm9vwDBNMclY7
	9I8luRXpuh12R2kAumL7PQc75mVA8V4PlVEFGn9QqWpT/67TzhIQDi6LJMSrZq50vUX2slW+1PU
	JlRCXwh20F/klHMp38s6vd55RyNWk15ZqAQ2JManRRnm0F0dbzKnhVlePMguL4MaqHIYPqGyctr
	rK518faB42OB+gmI6oJJnKDL2QIduDvs31Y351OMc6Q9jz3whYyjISlRTKe739zdD7I=
X-Received: by 2002:a05:6000:4619:b0:47f:5b52:5579 with SMTP id ffacd0b85a97d-482b1fe8a4bmr14986627f8f.18.1787179386081;
        Wed, 19 Aug 2026 15:43:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae9e-1d01-58d3-443d-4fa6-01cd.310.pool.telefonica.de. [2a02:3100:ae9e:1d01:58d3:443d:4fa6:1cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b1450e61sm8553317f8f.13.2026.08.19.15.43.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 19 Aug 2026 15:43:05 -0700 (PDT)
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
Subject: [PATCH v2 3/5] KVM: arm64: vgic-v3: Unregister redistributors before freeing regions
Date: Thu, 20 Aug 2026 00:42:27 +0200
Message-Id: <20260819224229.82948-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260819224229.82948-1-kmehltretter@gmail.com>
References: <20260819224229.82948-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_154307_858386_0AEECC9F 
X-CRM114-Status: GOOD (  13.18  )
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

vgic_unregister_redist_iodev() uses rdreg to return its region slot. During
VM teardown, kvm_vgic_destroy() frees the regions before unregistering
their iodevs, so vgic_v3_free_redist_region() must first clear every rdreg
pointer.

Unregister the iodevs before kvm_vgic_dist_destroy(), while the regions are
still alive. Temporarily drop config_lock because
vgic_unregister_redist_iodev() takes it; slots_lock remains held for the
MMIO bus updates. The region destructor no longer needs the vCPU scan.

Suggested-by: Marc Zyngier <maz@kernel.org>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-init.c    | 11 +++++++----
 arch/arm64/kvm/vgic/vgic-mmio-v3.c |  9 ---------
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
index 0a3df6d3a691..df6d0bdda4a9 100644
--- a/arch/arm64/kvm/vgic/vgic-init.c
+++ b/arch/arm64/kvm/vgic/vgic-init.c
@@ -570,14 +570,17 @@ void kvm_vgic_destroy(struct kvm *kvm)
 	kvm_for_each_vcpu(i, vcpu, kvm)
 		__kvm_vgic_vcpu_destroy(vcpu);
 
+	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3) {
+		mutex_unlock(&kvm->arch.config_lock);
+		kvm_for_each_vcpu(i, vcpu, kvm)
+			vgic_unregister_redist_iodev(vcpu);
+		mutex_lock(&kvm->arch.config_lock);
+	}
+
 	kvm_vgic_dist_destroy(kvm);
 
 	mutex_unlock(&kvm->arch.config_lock);
 
-	if (kvm->arch.vgic.vgic_model == KVM_DEV_TYPE_ARM_VGIC_V3)
-		kvm_for_each_vcpu(i, vcpu, kvm)
-			vgic_unregister_redist_iodev(vcpu);
-
 	mutex_unlock(&kvm->slots_lock);
 }
 
diff --git a/arch/arm64/kvm/vgic/vgic-mmio-v3.c b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
index 331d203acb43..77a611564f8e 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio-v3.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio-v3.c
@@ -967,17 +967,8 @@ static int vgic_v3_alloc_redist_region(struct kvm *kvm, uint32_t index,
 
 void vgic_v3_free_redist_region(struct kvm *kvm, struct vgic_redist_region *rdreg)
 {
-	struct kvm_vcpu *vcpu;
-	unsigned long c;
-
 	lockdep_assert_held(&kvm->arch.config_lock);
 
-	/* Garbage collect the region */
-	kvm_for_each_vcpu(c, vcpu, kvm) {
-		if (vcpu->arch.vgic_cpu.rdreg == rdreg)
-			vcpu->arch.vgic_cpu.rdreg = NULL;
-	}
-
 	list_del(&rdreg->list);
 	kfree(rdreg);
 }
-- 
2.39.5 (Apple Git-154)

