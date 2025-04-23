Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E6BC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooBsdae09ObYrCg5GB90Cflalk8xetQnJrw+3C5BA60=; b=NXMw3JiBtGJHMk+m8SDOjPEwF8
	m3ceiRwW5yu8Bn8l/k71gix1s2Da2ufadGO8oIqswTF8KOLyJmB+V2C4q7iCjvOMeFWzykJ3xG5dH
	xdMDb/kbMyv6MimMbJuj4sATLDJj2BxRROaXw51fxYMRs0P1kRjE+HZ/mOLK+mBJpiiw/Z7YFPZyW
	8DsNcjoBr3mPfg4/GVSjleWDxDt7Sn/mfaHd0XHLVxjkmDIN/AtZlLdXBb299lI8ICiiuwzjTfNo4
	RtLnszuD3HmrJ6OK2Joe6rLNE+ufnnDz00O6JUDmmEMOG7r8MQYVYhwCmOflgEs6D41hHVh7zeWwO
	O00IHFHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6f-0000000BKGI-2Vgk;
	Wed, 23 Apr 2025 17:41:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7boi-0000000AvoK-3HmB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F10D0614B6;
	Wed, 23 Apr 2025 15:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D1ACC4CEE8;
	Wed, 23 Apr 2025 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421315;
	bh=6/qw7x7rUvZiYc598C5910i4e3fhEOu+d3OEt7ysQWM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=arOcgn0N/jQSStiK/4gmqbXRF1pIXbPVjd/1Btogls+jyYh9Kz8pWz8fGHzto2cI2
	 G/rBEUeprnb2lI8WFy1jACD3jz16d1W/QQZ7M/qQrqTdmAl0XsPGdw/hlH10VuW5Dl
	 4B3z1YzypsANOy25Y8S1LyfF7JfKCDNXJe6nL6Lo9nkcOs6L6gQVbNuFEyuBPygJ8u
	 6qC1oxM6/2GCuKXF+vwRu3c0s9ELwknQNOdjNBjfBq5lAHShg025xN5v5qmNbk/lPV
	 hsCRR/eZPAfpP0qO4mOfjGLMKtaoIYnkbuqX9lFHtAXHNPjDCPL1FSWhkbCG3/JMip
	 4uNeh/hKJEHEA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7bof-0082xr-Fe;
	Wed, 23 Apr 2025 16:15:13 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v3 02/17] KVM: arm64: nv: Allocate VNCR page when required
Date: Wed, 23 Apr 2025 16:14:53 +0100
Message-Id: <20250423151508.2961768-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250423151508.2961768-1-maz@kernel.org>
References: <20250423151508.2961768-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

If running a NV guest on an ARMv8.4-NV capable system, let's
allocate an additional page that will be used by the hypervisor
to fulfill system register accesses.

Reviewed-by: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++++++
 arch/arm64/kvm/reset.c  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 4a3fc11f7ecf3..884b3e25795c4 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -55,6 +55,12 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 	    !cpus_have_final_cap(ARM64_HAS_HCR_NV1))
 		return -EINVAL;
 
+	if (!vcpu->arch.ctxt.vncr_array)
+		vcpu->arch.ctxt.vncr_array = (u64 *)__get_free_page(GFP_KERNEL | __GFP_ZERO);
+
+	if (!vcpu->arch.ctxt.vncr_array)
+		return -ENOMEM;
+
 	/*
 	 * Let's treat memory allocation failures as benign: If we fail to
 	 * allocate anything, return an error and keep the allocated array
@@ -85,6 +91,9 @@ int kvm_vcpu_init_nested(struct kvm_vcpu *vcpu)
 		for (int i = kvm->arch.nested_mmus_size; i < num_mmus; i++)
 			kvm_free_stage2_pgd(&kvm->arch.nested_mmus[i]);
 
+		free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
+		vcpu->arch.ctxt.vncr_array = NULL;
+
 		return ret;
 	}
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index f82fcc614e136..965e1429b9f6e 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -158,6 +158,7 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	if (sve_state)
 		kvm_unshare_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
 	kfree(sve_state);
+	free_page((unsigned long)vcpu->arch.ctxt.vncr_array);
 	kfree(vcpu->arch.ccsidr);
 }
 
-- 
2.39.2


