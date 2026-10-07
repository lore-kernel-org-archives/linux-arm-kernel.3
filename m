Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A4E0CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOt8WXidMcA/3vdws/pbowopZJuQh2QH9PqXo0bIoD8=; b=YxF6ewhyFOQtMfUpJYVfNo5llB
	4NBGZbtERfvMnlbRil66/SnftZYaPbtMYHQaNeLEr5tmwQw2MPnFhJLldujLbVNIdaUThzOyLC7GH
	/PopbCYpByqDaSVGZrRS7QDrJZWe2MdA8GOxLrSrIEWr6J6vS/vt8NTWnskgkvv7eng53StdqLD7K
	uNSlxSBlEaNxypzdmhQrOtGmzEtKjZnk+dnyY9HAMFfomQli/uzZt2CzRr/6tXpWEyXSCHnvmT75z
	13qpexiJKOQLX59xqQjp0C0OA4sdBNkY8erDDsod3qD0anNS4ALz/qnAuAb+qPyz9eiHK08STEdLf
	UqNs060A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJo-00000001sp9-1zQW;
	Wed, 07 Oct 2026 07:44:04 +0000
Received: from out-234.mta0.migadu.com ([2001:41d0:1004:224b::ea] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMJj-00000001slO-08vk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:44:03 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=DEbyYnw/QNFLD6hov3Wk8Emu00bFpjJHBWq6l30twn8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791359037; v=1; x=1791963837;
 b=aGPFpe5P2U1a2h5r0OF0MkW5Gu+NyzjGqTEcYXVPnD1iJnlN3MPpEqMtzbiQcDoYtcgpbD+Q
 Nn1lPFaUInJdTJD1pih9WHXMLkwTLZMvtFdPX8YZ0+lPC3Q/bFRN8SQlNx/tG7yUDuvwL3DSz8Q
 6zmEtAaCc3kvI4de2msa+ZpM=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e4f7af71e98e56d0;
	Wed, 07 Oct 2026 07:43:56 +0000
X-Mizu-Trace-ID: e4f7af71e98e56d0
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 2/3] KVM: arm64: nv: Read a guest hypervisor's CNTV_CVAL_EL0 from memory on x1e
Date: Wed,  7 Oct 2026 08:43:42 +0100
Message-Id: <20261007074343.324269-3-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261007074343.324269-1-fuad.tabba@linux.dev>
References: <20261007074343.324269-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_004359_329281_1A350CE0 
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

On x1e KVM keeps CNTVOFF_EL2 at zero, traps the virtual timer whenever
it has an offset and programs the hardware with the offset applied.
kvm_hyp_handle_timer() returns that hardware value for a VHE guest
hypervisor's read of its own CNTV_CVAL_EL0, instead of the CVAL it
wrote. Its writes trap to the kernel and land in CNTHV_CVAL_EL2, so
return that, as the physical timer's read does without CNTPOFF_EL2.

Fixes: 0bc9a9e85fcf ("KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 14aada311bac4..4c965f9b1e1de 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -322,10 +322,14 @@ static bool kvm_hyp_handle_timer(struct kvm_vcpu *vcpu, u64 *exit_code)
 		val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
 		break;
 	case SYS_CNTV_CVAL_EL0:
-		if (vcpu_el2_e2h_is_set(vcpu))
-			val = read_sysreg_el0(SYS_CNTV_CVAL);
-		else
+		if (vcpu_el2_e2h_is_set(vcpu)) {
+			if (has_broken_cntvoff() && timer_get_offset(vcpu_hvtimer(vcpu)))
+				val = __vcpu_sys_reg(vcpu, CNTHV_CVAL_EL2);
+			else
+				val = read_sysreg_el0(SYS_CNTV_CVAL);
+		} else {
 			val = __vcpu_sys_reg(vcpu, CNTV_CVAL_EL0);
+		}
 		break;
 	case SYS_CNTVCT_EL0:
 	case SYS_CNTVCTSS_EL0:
-- 
2.39.5


