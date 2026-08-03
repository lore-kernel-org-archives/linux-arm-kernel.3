Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D876C5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=; b=b9mMy8dm7Okowesb8G3l/nG+9R
	1gIrabxmsTKgD1OXwZVF5tNZh8y6OXR/IdTxhxe+LQyO6IRrX1WpauRcxAZNsFbXX56M5MzG2ylmD
	FURwivfav19Hi9DM+jp2tgDMN4Wuh1f6Rm4ACtIHU7fUnreex0hEI5VNq0FVpej2abnu1XUR81Nqe
	b2QGkpiee8hpreeuilMbB2o/IVv/hsp9+SnGfmBskHEIam920+fPBx9LAjr03dWcIM1KkY0hu6yE0
	v4akYrWUrYiqG8U0DGvl26B6v8b+/CHEK+H4iEVwvFcY+dXlhrSFPEHkby9Aj+PgDM37yu/OWrhE+
	e2UR6L1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1qw-00000000erq-0jc3;
	Mon, 03 Aug 2026 23:13:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr1qu-00000000erS-46AQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 23:13:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D03260A5F;
	Mon,  3 Aug 2026 23:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61E861F00A3D;
	Mon,  3 Aug 2026 23:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785798828;
	bh=MWKdz3JjvBdWuvOM6XAtmb0QINEsI1qn45G5e91+shs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=bMmg+SyIYkQotwqndKPnGAM5LzydfefBsa7HQ6mWc4Nqa+55HgPBPObG7Zr8bnuPt
	 eo18e+JEDq8jyhmEvk0zhrblYNjRFiHC5n/sG3iIxs5tH9voJeHEBC050mMowAI3sI
	 fkZt0wDRz1aRY/K/WNPE+iqp4tyPRXc56Nc47yfk7cljj3+CLr07QtVzPHPerc2HZL
	 bxVmDK16nogajsTkcIN+Tkb4J9wlo4Oo3aT8aXIEL9pHNlYMWnFpHheAWXE+jk2ETZ
	 elY8vlXTx7ILOVaex6QcBtjIhGrSwH1mbYJ+/LC86XnB5nZRodoq1PhjkUX/cg+6tV
	 Yrpp+sI6NCuQQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 03 Aug 2026 23:56:46 +0100
Subject: [PATCH v18 01/14] arm64/gcs: Ensure FGTs for EL1 GCS instructions
 are disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-arm64-gcs-v18-1-fd8c40f5ad88@kernel.org>
References: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
In-Reply-To: <20260803-arm64-gcs-v18-0-fd8c40f5ad88@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=broonie@kernel.org;
 h=from:subject:message-id; bh=DZmwxJP+W8fGWvn/wOKVMifNip3avlrIAIcelKvVs+o=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqcSCaY5vmoCebOz+50MafMkleZZx0nmawOTK6f
 WZjtGmb/meJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCanEgmgAKCRAk1otyXVSH
 0ObQB/4rLPRCuyyEUJqVXMlIJCDtlyScXBoSu42kR26SMPfPpzjW67SeYMd7/jJucvagyxeDESt
 ydaNDDgzEr9sgMINY1YbAXjzTQu7zn6FmuQ7vS9v0hVpzgU4mdOpxpqFuZ1yq+97G30XufY6xap
 gwtYiomMJc63RZ7fECW7utdhNGeCwHrq+atUjZYpLKpj+j4MrZMm2QHfyBCuoM7LXMCV8XEqKxt
 wBtlH5C9XKnbFuUa1X7G3IvX0x150pwcA4nFUb7zMlrU082hjKbonn+QsPj6tXBlARnX+an3orG
 k0CvfWEUIzhmvwVQ19ux4o4kJvLCTdhf1+YsDmS7aTNma6b2
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

The initial EL2 setup for GCS did not include disabling of EL1 usage of
GCS instructions, also disable these traps.

Fixes: ff5181d8a2a8 ("arm64/gcs: Provide basic EL2 setup to allow GCS usage at EL0 and EL1")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/el2_setup.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index aa8ec9df8024..d308c6e6757d 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -393,6 +393,11 @@
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL1_MASK
 	orr	x0, x0, #HFGRTR_EL2_nGCS_EL0_MASK
 
+	/* Disable traps of GCS instructions at EL1 */
+	orr	x2, x2, #HFGITR_EL2_nGCSEPP_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSSTR_EL1_MASK
+	orr	x2, x2, #HFGITR_EL2_nGCSPUSHM_EL1_MASK
+
 .Lskip_gce_fgt_\@:
 
 .Lset_fgt_\@:

-- 
2.47.3


