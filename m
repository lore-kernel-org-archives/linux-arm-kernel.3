Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641E4C55172
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PurQYqXf08AEX6gtFWKWTzYSPvMtTxS5SqC4IO0OrWI=; b=m0MwBVB6R173cq+YpG+qSJJybs
	Rr+D8Y2Q+q9TpfLOMGfzIvlGoJQJ5DE9lxiqo5kVxWUUtuA77qBOG9jwUc/MESRFQTJzfnRrvXV0P
	jfJyKPGvlUG3GsPHtFbvTbTp+q0n3/YOfUQ7NMss6vEeuF2BHniGdGAa3TaF5wGqwbSdYRtp+GSc8
	QQPaszjz1kXSDhS+2sOl6LItCfUK++m7dgxkXPldyBAAGEjCY0kiMt9z/xgbFjukcVTtnQvHBWKIt
	QDFVuPTPt7vUOqg5omqzbgI4z7JwwUktvu+lzA0YyzFKK43gnJak83Y0zFjYf1DVWSfthChwCKNm6
	bw73uxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVM-0000000CUvq-0taO;
	Fri, 31 Jul 2026 12:38:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUi-0000000CUb6-1cgV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE4CF600C8;
	Fri, 31 Jul 2026 12:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C167C1F000E9;
	Fri, 31 Jul 2026 12:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501463;
	bh=PurQYqXf08AEX6gtFWKWTzYSPvMtTxS5SqC4IO0OrWI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=IvZuRBseiMZeZid3Ez4Wg8ouliH2Y/c/7A6HfLiMYOAecPVvp4XKerZbET645nS8/
	 b15FXl+MkqVuI5FAprVQyL8Kih5Pg7z5/kiv8VFlm9hNF4E6yo65ufRdgftdyoMsdR
	 kZm0hdkW4V5Wm4vy1h0U2cQQDNl5A2IdUKOSFR2uYGtE+Lgyp2AmVRKThLw0Dug8XU
	 h8REnHXy7gwZREmAMfjeLboT8coC1j7IsyZKU0IYdu8uPxr4lSQg8gzVUWyE0k/15r
	 QNkSeasQrp3Z1reMb07TKfjuKycqUOOBbaFpp0bPUMKNuTZorOGHrhdYbfVA6/qWYi
	 F1wnto981QXLg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:42 +0100
Subject: [PATCH v17 04/14] KVM: arm64: Ensure GCS memory effects are
 visible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-4-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2294; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bEpjQNbOqRXEgxmuuFHddb+wqn5p6+xc/jGJ7dQCByg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJb+R01OOsal+xbQZ4zitFjmYGaROWyMm1zFz
 nTLuGw1HoeJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyW/gAKCRAk1otyXVSH
 0EVJB/45IHwz21v1tmIL8Qxbj/4drDYdtDlyAC/PUcC1mGWxzUZgOjqeIbfn5TmFt7itKiZFqZ0
 AP64owXE404SDC82O+AZNn8pd3cKMREZeIy4KmY9D3abJMJXvKouvpDh9DigD+JJ5m9QDOOt8eE
 jqhossDi99eBF5dZgx0iwHsw/fPulOaIc/VTYrgtIdKettyCIIbd+GxsyGTlGpGEIozM8h2esDn
 jMlOwDcp6bteGJZizKF/W34PhZtC+VK9k6WSLrwKdGKGMQIPuboONr2ikEKTB64fDkyv78rf+Ea
 Sgy1yHC1TV6YGpqIS+Pgd4IZKfjn4SxQtx/hC4rGIvNo2S1Y
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
---
 arch/arm64/kvm/hyp/nvhe/switch.c   | 13 +++++++++++++
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 14 ++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index 7318e3e6a5f3..fe8727bf2833 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -301,6 +301,12 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects are visible to this CPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	__kvm_adjust_pc(vcpu);
 
 	/*
@@ -345,6 +351,13 @@ int __kvm_vcpu_run(struct kvm_vcpu *vcpu)
 	 */
 	dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	__deactivate_traps(vcpu);
 	__load_host_stage2();
 
diff --git a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
index 2431c18f5792..4594992b008c 100644
--- a/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/sysreg-sr.c
@@ -239,6 +239,13 @@ void __vcpu_load_switch_sysregs(struct kvm_vcpu *vcpu)
 	if (vcpu_has_nv(vcpu))
 		dsb(nsh);
 
+	/*
+	 * Ensure any GCS memory effects are visible to the incoming
+	 * vCPU.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	/*
 	 * Load guest EL1 and user state
 	 *
@@ -299,5 +306,12 @@ void __vcpu_put_switch_sysregs(struct kvm_vcpu *vcpu)
 	/* Restore host user state */
 	__sysreg_restore_user_state(host_ctxt);
 
+	/*
+	 * Ensure any GCS memory effects from the outgoing vCPU are
+	 * visible elsewhere.
+	 */
+	if (ctxt_has_gcs(guest_ctxt))
+		gcsb_dsync();
+
 	vcpu_clear_flag(vcpu, SYSREGS_ON_CPU);
 }

-- 
2.47.3


