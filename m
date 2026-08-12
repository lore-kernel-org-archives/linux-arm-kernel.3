Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B10C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 19:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BN6CuiaRGB1AYlG3am9cSnuE3fqaKjei2q5bctXcBqY=; b=GMuGEfR2k2Z68SP1OEWUn6lKvG
	eaPpZRbsUl5ya67Gv3CViJrq7d3iQVCuPq2AI2DkM3nwVnG0IFMwNzGrTmvjwx9NVRpB+QVdMXwBl
	cIWUgxcJUMkoaOlAST4A5MayYYhCyqvZBUtHfB8XkTkyVGdUnNv84QWgoVvauas0H9wcmmGpn/bwJ
	rqDj1P2yQRel+x4a5c9Zl3W8iOD08ZOrobzpL/6ipCo5AyfWZr8d4nLSDXXn+LnyfEND4ueUGawOH
	6zCxHyTu88q/QK7y7R3bAwZxaCDC4YztsIrhWt+EpIo4nE4SwtzMsOcVXtgfmkUovyy0sJahdDTDu
	6pdFUT7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOL-0000000Grg6-2LL7;
	Wed, 12 Aug 2026 19:13:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuEOG-0000000Grds-3zYe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 19:13:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6865E61838;
	Wed, 12 Aug 2026 19:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCFC1F00A3D;
	Wed, 12 Aug 2026 19:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786562008;
	bh=BN6CuiaRGB1AYlG3am9cSnuE3fqaKjei2q5bctXcBqY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UXyjHJEBh2EgR2hEhJ36fZCgaBYeSmt6D05dnsQbYXlTYlS/JXYm3URif7tn+fEc4
	 OEgLs0YYXRe+rAjFGKf/QrGpCmepkSJTheSVJ1OMt3qPXmRA2QgoLh9bD1Lma84bgL
	 scRORMP1JIuzIb+JqkQ44V5QM1Ko5/3YqhLY3187YVrWQ/ZO+Kt51ly1kaaDDImU+b
	 nB25NosuI39m4LnRFnCRGV3FFU1efwxotEEFJ92BlCVM29CNJMwMZpk7E4bLrIc6FH
	 33A3w0FJ5DOBw+KRqmgwDtziRX16TtW4HbVgjOJmlfOjInrI6Ryk0sPpwDHHKngp7C
	 U99PbfqnA5PFw==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Aug 2026 20:12:03 +0100
Subject: [PATCH v19 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-arm64-gcs-v19-4-9105afd828ac@kernel.org>
References: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
In-Reply-To: <20260812-arm64-gcs-v19-0-9105afd828ac@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2730; i=broonie@kernel.org;
 h=from:subject:message-id; bh=d+jizBZVNSS4Q/SrkgC2FFx1bYWJxe4wMcWpfuu8Wp0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqfMW9rmhwdiW5BX34kKBe5Zw81RmwFnI+/KW9j
 IEpQ4UI8Q2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanzFvQAKCRAk1otyXVSH
 0MajB/4ye4XG4ifNPwWdf1QAhPBjgjlH8C+FdVcrdY4SGzkXP4mNDrhad5bwwWOghzmrEAZ8+SG
 pFh+rmEwSIpUYs+bRWtjIp/dHechSA24mwUrHdvHifpO3sjGE6jQml8aQUL+oTnKD7Vkar45MLH
 5r41w8+v+GIePM6TVdCLweZZmlCnLUVsp1IIFl6BulCAyyvaQ9D1Y/pQoA68uZEdR1mL8z6sIaw
 H68kkJuI3NNOjcCF3uOiZ27nW7f0n2yVUyaE84tOOV89uhtlihey6KYrQyCgk1yhfy1dGHa8bGZ
 aEsdFoy8txI0Dp27wiVUCnjQd8DVWXnuEtMM21191Rmi4ans
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

In order to allow efficient implementation of GCS implementations are
permitted to do GCS specific caching, with barriers implicit in stack
switch operations and GCSB DSYNC as an explicit barrier.  Since we do
not use GCS in the hypervisor or host kernel the hypervisor cannot rely
on any barriers being present in vCPU context switches other than those
it explicitly inserts.  Add explicit barriers when loading and saving
vCPU state.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Yuan Yao <yaoyuan@linux.alibaba.com>
---
 arch/arm64/kvm/hyp/nvhe/switch.c   | 13 +++++++++++++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f3..fb4c9988c84d 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -290,6 +290,12 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	__debug_save_host_buffers_nvhe(vcpu);
 
+	/*
+	 * Ensure any GCS memory effects are visible to this CPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/*
 	 * We're about to restore some new MMU state. Make sure
 	 * ongoing page-table walks that have started before we
@@ -338,6 +344,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	__timer_disable_traps(vcpu);
 	__hyp_vgic_save_state(vcpu);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/*
 	 * Same thing as before the guest run: we're about to switch
 	 * the MMU context, so let's make sure we don't have any
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 4f775545c71b..6665d97eac95 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -228,6 +228,13 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	host_ctxt = host_data_ptr(host_ctxt);
 	__sysreg_save_user_state(host_ctxt);
 
+	/*
+	 * Ensure any GCS memory effects are visible to the incoming
+	 * vCPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/*
 	 * When running a normal EL1 guest, we only load a new vcpu
 	 * after a context switch, which involves a DSB, so all
@@ -296,6 +303,13 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
 	__sysreg_save_user_state(guest_ctxt);
 	__sysreg32_save_state(vcpu);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/* Restore host user state */
 	__sysreg_restore_user_state(host_ctxt);
 

-- 
2.47.3


