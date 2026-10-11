Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4A6CA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 14:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MECpuWX1kNxbg0jd60AhFJ0DVpbNbcQFIVhhet0Zh7g=; b=oYRGOx210jK1bOGj909fPul60m
	nDsEcY9A9aLlvaB7pabU9rayvcV+k392HTxNKfW2QnDl2j9I1/0Uq9KAJC4kH7dRQikGHVol62xaH
	nWvwFYutejsI7BSBj+YMPQmM6cnpoTrSaMQ1E9iJYA7TDuJRa4H6LiCcP8YeQnxaJ9BM0LWbMayxi
	/N6PR4lzUT4yCLbwD9eU364O/G1/JlIc7XkQxVm0XWkRWElJdKM2nClI+/A27Q2gy9lr3NrvPvV7g
	Ae8soW1MXpao1ciW/FUoKhT30YDIJ52cR+gvC35h2u2fwRxTtvA57aB9sOVInoE65luHd08V8+3R8
	lUbBvW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFufZ-000000098Oo-0Tf4;
	Sun, 11 Oct 2026 14:36:57 +0000
Received: from out-154.mta0.migadu.com ([2001:41d0:1004:224b::9a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFufU-000000098NE-3isy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 14:36:55 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=OYn21/OL8lrH8NaEq6iDghNkvvHb7mfdPr+Xymc5Uv4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791729410; v=1; x=1792334210;
 b=pagB3q/FkgcGgbi/SX8/Y4X6grPtD6gyyVgB3lIw4yE2QjFrRLWAgs8Fpw0XZ3iyJjHH+ChN
 RawBGI6CSXQFaCT8w0MD6NzJr+7rPFZeKbFdHt8H92kD4P9hgPu/d3ypsU6RiKwOgcsONCRnVCH
 F45f1cl0XPiD9ISsHct75XaY=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c296a38619e6afa6;
	Sun, 11 Oct 2026 14:36:50 +0000
X-Mizu-Trace-ID: c296a38619e6afa6
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	qperret@google.com,
	Sascha.Bischoff@arm.com,
	steven.price@arm.com,
	tabba@google.com
Subject: [PATCH v2 1/5] KVM: arm64: Reject the GICv5 CPU interface hypercalls under pKVM
Date: Sun, 11 Oct 2026 15:36:44 +0100
Message-Id: <20261011143648.211337-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261011143648.211337-1-fuad.tabba@linux.dev>
References: <20261011143648.211337-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_073653_724026_3E797F09 
X-CRM114-Status: UNSURE (   9.20  )
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

__vgic_v5_save_apr() and __vgic_v5_restore_vmcr_apr() remain callable
once pKVM has finalised. pKVM never registers a GICv5 vgic, so neither
has a valid caller in protected mode, and on a GICv3 machine both reach
a register that is UNDEFINED at EL2 and panic the hypervisor.

Move both into the band the dispatcher rejects once pKVM has finalised.

Fixes: af325e87af5da ("KVM: arm64: gic-v5: Add vgic-v5 save/restore hyp interface")
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/include/asm/kvm_asm.h   | 4 ++--
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index e5b92ac09e69e..ea319c496bb26 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -62,6 +62,8 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_enable_ssbs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_init_lrs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_get_gic_config,
+	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
+	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_MIN_PKVM),
 
@@ -87,8 +89,6 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_save_aprs,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_restore_vmcr_aprs,
-	__KVM_HOST_SMCCC_FUNC___vgic_v5_save_apr,
-	__KVM_HOST_SMCCC_FUNC___vgic_v5_restore_vmcr_apr,
 
 	MARKER(__KVM_HOST_SMCCC_FUNC_PKVM_ONLY),
 
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 9a3b92e626adb..7c939baf9c1ba 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -911,6 +911,8 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_enable_ssbs),
 	HANDLE_FUNC(__vgic_v3_init_lrs),
 	HANDLE_FUNC(__vgic_v3_get_gic_config),
+	HANDLE_FUNC(__vgic_v5_save_apr),
+	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
 	HANDLE_FUNC(__pkvm_prot_finalize),
 
 	HANDLE_FUNC(__kvm_adjust_pc),
@@ -932,8 +934,6 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__tracing_write_event),
 	HANDLE_FUNC(__vgic_v3_save_aprs),
 	HANDLE_FUNC(__vgic_v3_restore_vmcr_aprs),
-	HANDLE_FUNC(__vgic_v5_save_apr),
-	HANDLE_FUNC(__vgic_v5_restore_vmcr_apr),
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
-- 
2.39.5


