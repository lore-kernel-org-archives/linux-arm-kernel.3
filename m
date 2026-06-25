Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5639CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E3q//MDRtQ6+cqWfpozqgGjUkOrI0kTKXH9jfdRrlvc=; b=nyD2Hpd+E9FysfFachZmqCcG20
	NMtN6RKr9NEzYXKbxigamWR2vKa0Cxp0hxiSe7yMGdEwIEJ3Sczj7blHtumvF1TG1IbHBynd0d80/
	0RLXHhxDIEF4AKGOx4Xq7NRD9kuV6gPn7Rhcu4yZXmRnjtpa3I2aNG/VY1GjelpX+Cf8ZWFMRDPvy
	vnDUFhlQZM+LGr2Td+06rh/m9d+GaQlCdm4C0byGTbkYS3VUkLWtGoGAsbmRuav+4h0iuyNot8Aj5
	HRjfSlYw/N6DcPmE5EW9xN6osDWSou3WG1teLARe7Y/+dDHvBvC7pmOnucm41e7/S05CNphE0H4qK
	8vXsaDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclNQ-00000009M2u-395b;
	Thu, 25 Jun 2026 14:48:24 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wclNL-00000009M1E-0ZJP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 14:48:20 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782398895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E3q//MDRtQ6+cqWfpozqgGjUkOrI0kTKXH9jfdRrlvc=;
	b=LkY5N5pFj76noQMfzqZBpfzwvmnYz+lybQTEMEU9lWPtZGb24NPJktVjYi0kqxWkxUaov9
	ewt45mcITEUg7xFRdI2+PkIHETMVoUEg1/ASNPA8WEUmbUF1W7Shz/Mae1g+90I1XMiDvz
	ynuabbMVwltkWiVfObEytfEwdPhfjWs=
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
Subject: [PATCH v2 1/2] KVM: arm64: Fix sign-extension of MMIO loads
Date: Thu, 25 Jun 2026 15:48:06 +0100
Message-Id: <20260625144807.2603272-2-fuad.tabba@linux.dev>
In-Reply-To: <20260625144807.2603272-1-fuad.tabba@linux.dev>
References: <20260625144807.2603272-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_074819_313379_FA2AA3F4 
X-CRM114-Status: GOOD (  11.77  )
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

A sign-extending load (LDRSB, LDRSH, LDRSW) from MMIO returns a
zero-extended value to the guest. The architecture performs such a load
as a memory read of the access size, then a sign-extension to the
register width. For LDRSH (DDI 0487 M.b C6.2.225, with the Mem accessor
at J1.2.3.111):

    data = Mem{16}(address, accdesc);
    X{regsize}(t) = SignExtend{regsize}(data);

The byte order is handled inside the Mem accessor, keyed on the access
size; the register width is separate, applied afterwards by SignExtend().

kvm_handle_mmio_return() runs these in the wrong order: it sign-extends
the access-width data, then calls vcpu_data_host_to_guest(), which masks
the value back to the access width (the size-keyed byte-order step). The
mask drops the sign bits that sign-extension produced.

Reorder so vcpu_data_host_to_guest() runs first, with the sign-extension
to register width after it. trace_kvm_mmio() moves with it and now logs
the access-width data before sign-extension.

Fixes: b30070862edbd ("ARM64: KVM: MMIO support BE host running LE code")
Reviewed-by: Oliver Upton <oupton@kernel.org>
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


