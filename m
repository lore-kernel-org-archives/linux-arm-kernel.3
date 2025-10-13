Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238DFCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 08:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fP6mHfszcnPRXs5p4KDysbBtXywzEGSRyswHUmAfWQc=; b=J0XSRfY9tPaUoGjdMLrcmzvNpm
	N3/KUAUuPI79wjxdkvjLy1l6AAHnKCJEZ/3Iwxo704auKjmBdfgduyq1G3vZvASNN3H///+hYf6fV
	9qQxwfKpzNM656T4IRt5JWtgUZ9XRrpAJaDuzaLU7DE81+QbSgirC3gP5bFOro+RP6I0Uin7gOfif
	CHG6NqXSVkdVVeygzMfG/ztNXEZkGacUR7E3U79DsQcZ2wbGF8dam9WvdBlFJJtvESuiKOfFA4nIY
	yYkpwhmnjc5bkTDC45zG8oz6o6ywRosxu7zfQhl5QMfJOiIhSOZG8oYX3Mg503JXX21vpXxGjsp8z
	NzHkc6YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dye-0000000CbpW-3wzv;
	Mon, 13 Oct 2025 08:32:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Dyd-0000000CbpF-2uNp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 08:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1290561176;
	Mon, 13 Oct 2025 08:32:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DFEC116B1;
	Mon, 13 Oct 2025 08:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760344338;
	bh=D5mMnchbyvZg4t4adKmnSUlfgUWF0WYaKcUhZLciJSI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PBPA9FmXsfbsP6M+MZ8IeDralkp5eT036+ENvP6mubgarjnY9ZN4EVmASFsGY6P6n
	 DY1P5zwuBaOhL0aDZV8/Smc+5p53PAouyd5yA3BU6siKgAm1sDltClg9TZOCYhunBX
	 zmzXfJQPePW95oshLj/t+7ArZMzI3P8c1O3t9oYMkbIws/Y7Ny+viaPW0xkS2CZFdj
	 D1ocjZE1H11OJ0cngGyUoWtUM4gmsMYOvOavxm79GDyNu1r/nTW05u/6YZWy9OsmOs
	 TTvHackZ96ZeOeFP0pEkXwCbK+RMhCD8ywwPjURBgdlXQrq68aodN0OyOZUYk6VbrQ
	 dqUOjRGJ4Qa2Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1v8Dya-0000000DRrP-3TOs;
	Mon, 13 Oct 2025 08:32:16 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/3] KVM: arm64: Make ID_PFR1_EL1.GIC writable
Date: Mon, 13 Oct 2025 09:32:05 +0100
Message-ID: <20251013083207.518998-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013083207.518998-1-maz@kernel.org>
References: <20251013083207.518998-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, peter.maydell@linaro.org, stable@vger.kernel.org
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

Similarly to ID_AA64PFR0_EL1.GIC, relax ID_PFR1_EL1.GIC to be writable.

Fixes: 5cb57a1aff755 ("KVM: arm64: Zero ID_AA64PFR0_EL1.GIC when no GICv3 is presented to the guest")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
---
 arch/arm64/kvm/sys_regs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index b29f72478a50d..73dcefe51a3e7 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -2528,6 +2528,12 @@ static bool bad_redir_trap(struct kvm_vcpu *vcpu,
 	.val = mask,				\
 }
 
+#define AA32_ID_WRITABLE(name, mask) {		\
+	ID_DESC(name),				\
+	.visibility = aa32_id_visibility,	\
+	.val = mask,				\
+}
+
 /* sys_reg_desc initialiser for cpufeature ID registers that need filtering */
 #define ID_FILTERED(sysreg, name, mask) {	\
 	ID_DESC(sysreg),				\
@@ -3040,7 +3046,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	/* AArch64 mappings of the AArch32 ID registers */
 	/* CRm=1 */
 	AA32_ID_SANITISED(ID_PFR0_EL1),
-	AA32_ID_SANITISED(ID_PFR1_EL1),
+	AA32_ID_WRITABLE(ID_PFR1_EL1, ID_PFR1_EL1_GIC),
 	{ SYS_DESC(SYS_ID_DFR0_EL1),
 	  .access = access_id_reg,
 	  .get_user = get_id_reg,
-- 
2.47.3


