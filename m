Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A67C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XASNgmZLqsPyycYQ/bYdMy9OFUeM2/DQAIAxLs3XEpc=; b=Pz0VTG3Z13mhUGf5vxAWDbm5qx
	4XrMm3EtTU1P7zaSpC21DS15cTME+Y8kLjZFuYsj3QpeW9Umy0/wuap1y0KKUhtOc0oFB/JNODtf8
	VXT1lV0gd9T4ZO4/ovWIxT+PaZmZFrNqApGNwm7qnPOg1gHIA78cbV9Oswd1tr0DggmLl05os+atM
	lfQJcvXilT0i3Ood7k9mZ/ALuw+0b5o6aHPDrecJygnY70T4eCh7cxFRydEMJ17TclB9e+6anHR6B
	S/bbKjsvPE1e82E33ZHjROifkkMm9aGOQAFo0lWwnQHM2EQtTmA0gCdXFMKBnpnz8MEkQiz6qzvIz
	AL9jedQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TKs-000000065ci-34Js;
	Mon, 07 Sep 2026 07:00:10 +0000
Received: from out-160.mta1.migadu.com ([2001:41d0:203:375::a0] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TKo-000000065bR-0Qxl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:00:10 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PJujOV+1Z+2Pic9F+Xx2wknBh2QM3e+/EoajCgxNjqc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788764404; v=1; x=1789369204;
 b=P2TwRGyZwiXu5ajKrw9H73ln7KXvD4eJTHrwvYXY0AcqwdbDSUs64fx3HS2B72RgB/Y5GqtV
 MbQAI9Fl/3E2mf0WYU4OIvL5Bl+gbeaaL8rKK0h1DUrgOTNAKFoAUsAtp4TxX45e7zM0ygC4m5m
 v59ObM2zaA3a5wBMnGUialDU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c859b1d3d590cc6f;
	Mon, 07 Sep 2026 07:00:03 +0000
X-Mizu-Trace-ID: c859b1d3d590cc6f
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 01/17] KVM: arm64: Sync HCR_EL2.VSE back to the host vCPU under pKVM
Date: Mon,  7 Sep 2026 07:59:46 +0100
Message-Id: <20260907070002.3333525-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907070002.3333525-1-fuad.tabba@linux.dev>
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_000007_031691_4B1CAACE 
X-CRM114-Status: GOOD (  10.74  )
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

flush_hyp_vcpu() copies HCR_EL2.VSE from the host vCPU into the hyp
vCPU on every entry, and nothing copies it back. Once the guest takes
the vSError the hyp vCPU's copy clears with the hardware bit while the
host's stays set, so the next entry pends the same SError again,
KVM_GET_VCPU_EVENTS keeps reporting it, and kvm_arch_vcpu_runnable()
never lets the vCPU block in WFI.

Reflect VSE back on every exit, which the flush-side comment already
states.

Fixes: 734dc8c01c838 ("KVM: arm64: Implement lazy vCPU state sync for non-protected guests")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..b6bfe502bcd04 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -276,6 +276,10 @@ static void sync_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	host_vcpu->arch.iflags		= hyp_vcpu->vcpu.arch.iflags;
 
+	/* Cleared by hardware once the guest takes the vSError. */
+	host_vcpu->arch.hcr_el2 &= ~HCR_VSE;
+	host_vcpu->arch.hcr_el2 |= hyp_vcpu->vcpu.arch.hcr_el2 & HCR_VSE;
+
 	sync_hyp_vgic_state(hyp_vcpu);
 }
 
-- 
2.39.5


