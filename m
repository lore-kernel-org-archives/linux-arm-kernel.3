Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E18BCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 21:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wy0+k1InAjyE26lqhC7MpFZWdvI+C7jRsbn8a+z/FAQ=; b=AH3pPcBEwqmuanysZqPnKrPLJr
	tWL0qBddksbbPbHr9fo4QhHQd5FBppWchWh8PC/0FIxnRKktLCv5N7m2J/jEZbEhT6utlXuZC15mS
	MvnXS8LUsJ2HgWw0hjyk4aoOlSCNLx2KB/tn6ZW33Hr9M/HLgaib+dw8MOYmrVeaWfrbkfr4lR+ux
	sTydenNJBpBKjLfdrvampAU50OimArwGhDa4TdrojvXd47Wsxb0Fw3Yd59O8QfR467FViuKYg4XmQ
	kfWGOqAHi0MygVhVlNwDgdoZJgfBtKe1I91ZNsWU+HwCEeRe1D775+oiYiKxhMJf23RiDW/HeVOCJ
	x18BRovA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2Bt-00000007J1i-0TpG;
	Wed, 30 Sep 2026 21:50:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC2BH-00000007If1-19ij
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 21:49:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C1C542A44;
	Wed, 30 Sep 2026 21:49:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E491F000FF;
	Wed, 30 Sep 2026 21:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790804978;
	bh=Wy0+k1InAjyE26lqhC7MpFZWdvI+C7jRsbn8a+z/FAQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hdJfM4QhYbEs4brp34H1ssEHtyAj+BaeyqPWhk1zU+UMRak1YVElJXBGViX1yVEij
	 6vl+a/SuEC47wcnrxV/sE3AeT92FiFZunGWVBUJYZxolTzbsqhKyVPeLqgLWGhaolr
	 rijx3XZ67wI4Fm0hWlT5nJ6XJKAG84QX4pEv/hGxKmz6FVdHIp//yCr2LGQpRbWw0b
	 zrzQmJ3A64rhHIrNbbEabYttriptehg2NxQCRj0ZK4Hd1wZBOCmcK2mHwJ8sED8kLF
	 PvRYIh+44QPRnBCCg2dPaf4c76RTU0bBpEAHdRrlFkzKqZwDGeiaAsllmpEZgBaGo/
	 /dFzcuUTuDShA==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 30 Sep 2026 22:48:22 +0100
Subject: [PATCH v21 12/15] KVM: selftests: arm64: Add GCS to set_id_regs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-arm64-gcs-v21-12-3556644cd927@kernel.org>
References: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
In-Reply-To: <20260930-arm64-gcs-v21-0-3556644cd927@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Oliver Upton <oupton@kernel.org>, 
 Fuad Tabba <fuad.tabba@linux.dev>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Leonardo Bras <leo.bras@arm.com>, Wei-Lin Chang <weilin.chang@arm.com>, 
 Yao Yuan <yaoyuan@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1732; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Tfjwe96+Pus/NcQqd0MtFJGHAujN/0M7VQnvCDfTPfo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqvYO89S6s1s3YTYvEi7Pe2YG5B+wlge3CrvcBq
 G8G8N0HucyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCar2DvAAKCRAk1otyXVSH
 0AoAB/9GISjeiauUt6+C48J60uI4rxisvx5a6uEGeIbh3HehLpPkwEqujVDEk7TtxMtRTR0+REF
 LuAD3f9u9Kxujl0hWnkk3ezyvSfE8WHAh+1htRmFRkIEOXcc305kIA0NGko3ICGJj2Ih/UlSJU5
 XutnQeCpTwy43JlqFbVJ3KQ0vqoxcTeIaY2WfdolxBJUL2IZkXJmw4srDog2tW/RLE1T5BDNo69
 rYnIdR8DgaQKHl5FLdsVmRQsUTFsd14z5LYEWPI5p7n9t/OifwTNxCmWgzf9PGbgUZWE5KakCqh
 M7gKuWU98E5VW4zMbuQBCVQ7eDYx/3/1BWJdKp0aXRiVT98Q
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

Now that GCS is configurable via the ID registers update set_id_regs to
cover ID_AA64PFR1_EL1.GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 tools/testing/selftests/kvm/arm64/set_id_regs.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/set_id_regs.c b/tools/testing/selftests/kvm/arm64/set_id_regs.c
index cb5e6358c59c..9db8516748cc 100644
--- a/tools/testing/selftests/kvm/arm64/set_id_regs.c
+++ b/tools/testing/selftests/kvm/arm64/set_id_regs.c
@@ -154,6 +154,7 @@ static const struct reg_ftr_bits ftr_id_aa64pfr0_el1[] = {
 
 static const struct reg_ftr_bits ftr_id_aa64pfr1_el1[] = {
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, DF2, 0),
+	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, GCS, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, CSV2_frac, 0),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, SSBS, ID_AA64PFR1_EL1_SSBS_NI),
 	REG_FTR_BITS(FTR_LOWER_SAFE, ID_AA64PFR1_EL1, BT, 0),
@@ -818,6 +819,12 @@ struct reg_ftr_val {
 	  .mask = r ## _ ## f ## _MASK,				\
 	  .val = (r ## _ ## f ## _ ## v  << r ## _ ## f ## _SHIFT) }
 
+static const struct reg_ftr_val gcs_no_s1pie[] = {
+	REG_FTR_VAL(ID_AA64PFR1_EL1, GCS, IMP),
+	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1PIE, NI),
+	{ }
+};
+
 static const struct reg_ftr_val s1pie_no_tcr2[] = {
 	REG_FTR_VAL(ID_AA64MMFR3_EL1, TCRX, NI),
 	REG_FTR_VAL(ID_AA64MMFR3_EL1, S1PIE, IMP),
@@ -836,6 +843,7 @@ struct ftr_config {
 };
 
 static const struct ftr_config invalid_configs[] = {
+	{ .name = "GCS without S1PIE", .regs = gcs_no_s1pie },
 	{ .name = "S1PIE without TCRX", .regs = s1pie_no_tcr2 },
 	{ .name = "S1POE without TCRX", .regs = s1poe_no_tcr2 },
 };

-- 
2.47.3


