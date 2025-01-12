Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63C92E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 17:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5KvmCEAGlm+bTGs5uSdcjjBclifUoSwXdBme61AX1J0=; b=3BcPbNlDiekos8V1N3EBPn9C99
	CagJaGjcD0YVsZVPpJxe6Wg1f9zTzCTVaPj/WASpm2+s++ufMwZUPMpHfjiV1tw9/yG8Esf5EAGt6
	59DGigWRsIrxLSzI4fPEAIhbfXE8GC7ehPwCg2gH7OtW95oaTwgHywCBigojl9hZImaaaCiF9glwi
	eFIXTbKO/xAhfbUN3dNdxdeaMs+aFBxef8Ug1hXgobLiXH1BYN/aTZraJvbTzOchi2u8V7HIQS+VP
	b7RmKNJX5A2EbIwDbKQob1s/EmGAFeDOWOE7hcxYOGCgYeWx543cWsvo2GlRyHr0NLEii0QkJhifJ
	uO665plg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1fk-000000039ZY-109f;
	Sun, 12 Jan 2025 17:22:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX1SH-000000037g8-0knc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 17:08:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB3D15C482F;
	Sun, 12 Jan 2025 17:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6057CC4CEE6;
	Sun, 12 Jan 2025 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736701732;
	bh=AAx1thK/qARvmlKm/GHshhs0gk8iIkS9tRKm3XsQwuI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xe15X6xcCjeakafeevsW/ZBDTh4R/38gRiKU6jqOGwESh+mv5KBmh6Ho1TuNy3D99
	 jn2BzauGSfEKXGqXTDNz8V/KE16JSfNdQZMFentmZAy+H+rLFeTqwvqyZi1sd/CrQS
	 TtxzCMpOersUMmOiZB0/Jtx7ox1UkE5yMSrXF6GF9wh45mQZJFIqW0P9qXwDVQm4Sd
	 S8i4sDFdnqfnzcJm+urlFQtSvru+BTk7kldCQHXncYnmxw30S29QdFeayDADzNFGiy
	 1poELrz9DueczH95mBE9iQacIp5UpMSSCjoLlZBoZnnlGXS11AzJRODRwJBuO38QeD
	 a9KUf9fF02zLg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tX1SE-00BNxR-Ex;
	Sun, 12 Jan 2025 17:08:50 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 08/17] KVM: arm64: nv: Sanitise ICH_HCR_EL2 accesses
Date: Sun, 12 Jan 2025 17:08:36 +0000
Message-Id: <20250112170845.1181891-9-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250112170845.1181891-1-maz@kernel.org>
References: <20250112170845.1181891-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, andre.przywara@arm.com, eric.auger@redhat.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_090853_280161_DAAD01E2 
X-CRM114-Status: GOOD (  11.27  )
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

As ICH_HCR_EL2 is a VNCR accessor when runnintg NV, add some
sanitising to what gets written. Crucially, mark TDIR as RES0
if the HW doesn't support it (unlikely, but hey...), as well
as anything GICv4 related, since we only expose a GICv3 to the
uest.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/nested.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 9b36218b48def..37f7ef2f44bd8 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1271,6 +1271,15 @@ int kvm_init_nv_sysregs(struct kvm *kvm)
 		res0 |= MDCR_EL2_EnSTEPOP;
 	set_sysreg_masks(kvm, MDCR_EL2, res0, res1);
 
+	/* ICH_HCR_EL2 */
+	res0 = ICH_HCR_EL2_RES0;
+	res1 = ICH_HCR_EL2_RES1;
+	if (!(kvm_vgic_global_state.ich_vtr_el2 & ICH_VTR_EL2_TDS))
+		res0 |= ICH_HCR_EL2_TDIR;
+	/* No GICv4 is presented to the guest */
+	res0 |= ICH_HCR_EL2_DVIM | ICH_HCR_EL2_vSGIEOICount;
+	set_sysreg_masks(kvm, ICH_HCR_EL2, res0, res1);
+
 	return 0;
 }
 
-- 
2.39.2


