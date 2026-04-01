Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C7CD35171
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bm8wdzEe13l+KwpJttaOMEeVx3BYk1JY07jRjb27lL4=; b=MQ9UwZCw+LsjCe0Tw3QNu7wmnM
	7xE0XRqHVriqKo4UbBg4xFd7cBjn684xL1gymocjzvNRGajqaOClyJ6EFk8NCyQ6IYcdzwrK1Q1Hs
	eoIgGZKZv5KimZgkKSFRlcIxh9A/xES5hDntIMrAjeQg+zhHBxE0545La7qZauIICt6GzJeE0tp7y
	CE1ha7FXV2joAoCFmQgpG8MsBYblhoRM+UEO+nuVVOcVONZbTX0+OgCpmX/LhW1cwFf5ly65ifuM0
	5KKWF97W34D4Xx4H+Ihr3NPznk43UFDHCL+65JsRnOulo7YwanOi8C/uJxyy54enWXcSOSwGZM2e1
	3wQAv14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7swA-0000000EWIW-0lI8;
	Wed, 01 Apr 2026 10:36:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw4-0000000EWBU-3tK1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FFBC40812;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE5FC2BCB4;
	Wed,  1 Apr 2026 10:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039792;
	bh=CFePSoo9MRelTjN7d6tKirqt9VLTbTDHcdGyM9MrxaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=reD3drKDITbjHXo+09xcvh/m9AxfUnvjslVLZ5TCQ/LOBiI9sIF/AaM0ONdFXAGEN
	 F7WisRBp/Mm2570vN90c6kYVvlVOlCgJ2mZEcZIP2LM1GW87Vb3mtIkYV+/sH9f/2D
	 AXhyGolStCkrpHd9KdjWxGLhX84d1rVkjVtR4WqKT9/JY1XbubdbSdg1wDE+9Slmh6
	 qlMqb9FtH4c4K1vOhETxWicQE2e0z3RDOUfru4uvEOCPoN4TyBmprLUX7uylywp5+o
	 bcJ37MIyLrMZjvhUzwWQM7lTFRWNXhSWbR5z6Qv0VJPX7FtOxAvhoA+uYr/nnStB6M
	 Y3ZU6lBeSAJIg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw2-00000007oRQ-0O3X;
	Wed, 01 Apr 2026 10:36:30 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2 04/16] KVM: arm64: Fix writeable mask for ID_AA64PFR2_EL1
Date: Wed,  1 Apr 2026 11:35:59 +0100
Message-ID: <20260401103611.357092-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_033633_006736_019439AA 
X-CRM114-Status: GOOD (  11.60  )
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

The writeable mask for fields in ID_AA64PFR2_EL1 has been accidentally
inverted, which isn't a very good idea.

Restore the expected polarity.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Fixes: a258a383b9177 ("KVM: arm64: gic-v5: Sanitize ID_AA64PFR2_EL1.GCIE")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/sys_regs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 18e2d2fccedb8..6a96cb7ba9a3c 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -3304,10 +3304,10 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 				       ID_AA64PFR1_EL1_MPAM_frac |
 				       ID_AA64PFR1_EL1_MTE)),
 	ID_FILTERED(ID_AA64PFR2_EL1, id_aa64pfr2_el1,
-		    ~(ID_AA64PFR2_EL1_FPMR |
-		      ID_AA64PFR2_EL1_MTEFAR |
-		      ID_AA64PFR2_EL1_MTESTOREONLY |
-		      ID_AA64PFR2_EL1_GCIE)),
+		    (ID_AA64PFR2_EL1_FPMR		|
+		     ID_AA64PFR2_EL1_MTEFAR		|
+		     ID_AA64PFR2_EL1_MTESTOREONLY	|
+		     ID_AA64PFR2_EL1_GCIE)),
 	ID_UNALLOCATED(4,3),
 	ID_WRITABLE(ID_AA64ZFR0_EL1, ~ID_AA64ZFR0_EL1_RES0),
 	ID_HIDDEN(ID_AA64SMFR0_EL1),
-- 
2.47.3


