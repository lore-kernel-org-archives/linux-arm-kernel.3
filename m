Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5B48CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mwcOLTiS3FgAs5voG7hlDBUSpfaU9WePAAtQwdnr1Ok=; b=LGyfKMqXOFtCA+UEogegUmMS3p
	KaT6q/SP4uo1jKjOKM19qBSOu+hL309MdcTo1lwJcSUHqMcPbzRhjH9myXo439NKNhyJFDJ29/z0J
	H5SQbBdwhlQZNkyb51l/C5XnyzxkpqC3lh/Au2V/oiAZ4WLFXMBSHoqtEKfMZOtTr5+92ZuZ98NsJ
	SYQz21VRdE2bg0bvqE/Q/y5mo1vh/2dOJzD7msuTEcj+zx+X73Rllcpin8WV7sBQ7VJ2WQCm/1q33
	av3UaUywdMWEsMXh+9Mc3bRfcmOfRF4/6bWPThZ38xubCgKUfvBYzZTJWE7sXMqSiuFYTY4pZZF2G
	sKHdf81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxqJ-0000000AKNA-15wZ;
	Mon, 03 Nov 2025 16:55:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFxq6-0000000AJyI-4856
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 16:55:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED4E143C90;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D026BC16AAE;
	Mon,  3 Nov 2025 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762188929;
	bh=v01Vg22EJGqDANe+d5iFLhgxo6rRA09Yj1ZORRZolzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MHK5f4cWAfzeHfwjlMfH2dS/2qJhujfljbX041jtbRl4cMS/gcbJ7FHCtPSHfe5HW
	 VLWe2wgmR4XoOkVBLVdd4JhUzn+0faii5NDAjtspvXdPWzg++EvB1hUgDq1Z7BhxBt
	 AHktNgD4pYgVx36XvXXHuF59rfbKw3RYFBb0ktjOi0iwywcNOLTa2wpam1VOlg/I3M
	 2P+NplRAGR/dpvy4ZqRfF/ikPDjbX2tpxkMwOYhfWSKWED0GyKLjfoLWFe1K/whusq
	 CCZxnspxIIemQlFYfGbPU8b5S2C3TRu8i68WIp/cEQWSqFYAlEMcCw932aSTSM6C07
	 0ZDdheYfSPfAA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vFxq4-000000021VN-08T3;
	Mon, 03 Nov 2025 16:55:28 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 14/33] KVM: arm64: GICv2: Preserve EOIcount on exit
Date: Mon,  3 Nov 2025 16:54:58 +0000
Message-ID: <20251103165517.2960148-15-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251103165517.2960148-1-maz@kernel.org>
References: <20251103165517.2960148-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, christoffer.dall@arm.com, Volodymyr_Babchuk@epam.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_085531_077755_E0974AD5 
X-CRM114-Status: GOOD (  10.10  )
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

EOIcount is how the virtual CPU interface signals that the guest
is deactivating interrupts outside of the LRs when EOImode==0.

We therefore need to preserve that information so that we can find
out what actually needs deactivating, just like we already do on
GICv3.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/vgic/vgic-v2.c b/arch/arm64/kvm/vgic/vgic-v2.c
index 74efacba38d42..5cfbe58983428 100644
--- a/arch/arm64/kvm/vgic/vgic-v2.c
+++ b/arch/arm64/kvm/vgic/vgic-v2.c
@@ -437,6 +437,12 @@ void vgic_v2_save_state(struct kvm_vcpu *vcpu)
 		return;
 
 	if (used_lrs) {
+		if (vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr & GICH_HCR_LRENPIE) {
+			u32 val = readl_relaxed(base + GICH_HCR);
+
+			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr &= ~GICH_HCR_EOICOUNT;
+			vcpu->arch.vgic_cpu.vgic_v2.vgic_hcr |= val & GICH_HCR_EOICOUNT;
+		}
 		save_lrs(vcpu, base);
 		writel_relaxed(0, base + GICH_HCR);
 	}
-- 
2.47.3


