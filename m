Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488A2CDB476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 19:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FUoNtrIxitio2ZcQ79fK9DlQrFdcFNyScyGhi0wHX0=; b=1DG8MbD6WHCamWVoi3oaHDCQP4
	ucGwXclih393+9+pcpydtzcWG6fn7vADi4A0hBrvvMmBq/XhOJzAKS2pQketFKn+vtoKuEOq3xF15
	lrRavyBHWKF2kSkqCSoB5Yhr2TTN90fThfuqgmfFYlZSal/iP5KRroJveAnLNQvF6cibSaRDFKtga
	NEGqdU5fGvOp9EB9VnVNPD9rvtpT/BIzcTm8D34Xbe0IbFMcUGk7ZYyIccmAzREp5ybYnL4l9IMup
	nZc1UJjMylX8m3KZmqFnnVva95hoWm/4q2kzJqcntZX01tTCkLBC/4lrDeiFpMCtrEzK4VM84QdPQ
	yzQ/tyfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjzH-00000005KkW-3bMU;
	Mon, 22 Jun 2026 19:07:15 +0000
Received: from out-177.mta0.migadu.com ([91.218.175.177])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbjzB-00000005Kj0-2nj7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 19:07:10 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782155227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6FUoNtrIxitio2ZcQ79fK9DlQrFdcFNyScyGhi0wHX0=;
	b=XDXKXiiifWQNZIr/g1YmsSsbeyBAfeo6+8/OO+eifiMSpBlOJRfGQRJu9UFoVJQi1Ix0XX
	tdjh/tgmDDXv1UEXGI1ycypC4Wf8M0PJSrFynOimdNkHlJ3vfM99+bN0aw0d/o4kHuYwZL
	uxDgMv+GHevA/N26axb2YqEWvgF0AaY=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	Victor Kamensky <victor.kamensky@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] KVM: arm64: Fix sign-extension of MMIO loads
Date: Mon, 22 Jun 2026 20:07:00 +0100
Message-Id: <20260622190701.2039766-2-fuad.tabba@linux.dev>
In-Reply-To: <20260622190701.2039766-1-fuad.tabba@linux.dev>
References: <20260622190701.2039766-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_120709_852967_7C075785 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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

A sign-extending load from MMIO (LDRSB, LDRSH, LDRSW) delivers a
zero-extended value: in kvm_handle_mmio_return(), vcpu_data_host_to_guest()
masks the data to the access width after sign-extension, stripping the
sign bits.

Move vcpu_data_host_to_guest() ahead of sign-extension so the width mask
runs first. trace_kvm_mmio() moves with it and keeps reporting the raw
access-width data.

Fixes: b30070862edbd ("ARM64: KVM: MMIO support BE host running LE code")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/mmio.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index e2285ed8c91de..d1c3a352d5a22 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -126,6 +126,10 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
 		len = kvm_vcpu_dabt_get_as(vcpu);
 		data = kvm_mmio_read_buf(run->mmio.data, len);
 
+		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
+			       &data);
+		data = vcpu_data_host_to_guest(vcpu, data, len);
+
 		if (kvm_vcpu_dabt_issext(vcpu) &&
 		    len < sizeof(unsigned long)) {
 			mask = 1U << ((len * 8) - 1);
@@ -135,9 +139,6 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
 		if (!kvm_vcpu_dabt_issf(vcpu))
 			data = data & 0xffffffff;
 
-		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
-			       &data);
-		data = vcpu_data_host_to_guest(vcpu, data, len);
 		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
 	}
 
-- 
2.39.5


