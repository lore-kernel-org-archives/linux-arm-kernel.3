Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D007E6F066
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JXGC5sgLSBQJo3VzEJ0OWTxEJu40rA+0BkW00qi2Rlw=; b=NFwx2Pr8BSpZsdPJisUJWvwM95
	iQ4oeU4hUrMYoL1SLZz55lI4zUNyK35XU95T9be3p0pk0i+ni47cnRlkIYULK48bnyUBHuPdUYczX
	sYlrFH+nFx9Ja/NtH/PJgBxlQbpM54d8GqLaKWmMB06ux6t14VNNKfAAUkMBQB4BIwy5VOR3+QRcF
	1QwPffI3jDt5FB7Qm71QE4XX5zC1dVtDrYNYGHimDeVZBTkLSAn27N04nyAJGnAx50anQ3jYXLOB/
	YNUPGCucvvPwB3I2qGrtELxEBVXBwEidrePD8O15E6narEMVxyHeWuZJ4YOy9IO3nU5SL4nqCAVpp
	j25NBkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6t9J-00000007Qwx-14Ax;
	Fri, 01 Nov 2024 15:01:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4t-00000007ErO-089J
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=JXGC5sgLSBQJo3VzEJ0OWTxEJu40rA+0BkW00qi2Rlw=; b=MpRWtvZ43Bl7/DgrAkFrx2VA7T
	VyfqWeKQ/dZiIe+CTMbFeCTHR5euv1e8zWPd4OujW3D7xYk2PldzB5lcteMZx72vpBfNHfCRPPE3K
	dHPToEsYGd7V2Bsq/iuscS4fpWT7sW6ze6J71TcXVbvO4O2L0hnVpvLYw0wrUxJGAQBnTQF1PS0/R
	svTASN3kJdEW+IoHw4nHSDIfM0S1+8NWMmajYWRqLr6WZRt2FnOO5BSedACHa7xAzCJ0+PhGKsRVS
	qX9sjPFjA+3NCz224H1SFyjwKEWnfMYKUtnDKpKgvy+R97MK1wqZOfaVIfJdSb3iNBOaNo8fZbu+l
	Oe1KSKsw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4q-0000000AhC4-0dN5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:52:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC5285C8E24;
	Thu, 31 Oct 2024 08:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 932BDC4CEC3;
	Thu, 31 Oct 2024 08:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730363750;
	bh=+FzpCGPLbvdqhl1sCnZuiJbbI6lkLMa9iXpMXwi139o=;
	h=From:To:Cc:Subject:Date:From;
	b=o/Xigo8pno5nttMto3H3k4SyBYHzd2izIgk8zqUjKffgjfTHEXMZ1JdfSF7E1VnQe
	 Ia8hnvbAY6pGXyWG60M2cx2tW3dshWIZjnmomMCeCtLka34YLpy4BM/5T5tPbDP/rT
	 tHPbs6AAVEv8POF6WjDVJL6yf3XlGP+AgDf97S0yKZnEFcOkYNO3EaRKxpC2OEyUO1
	 0+uf2wvhRsQcHFfaL9rgHDsf6yCkyHzHS8kXwU+91Zrdi1GyXqk1mMg9GgGsCuZMv+
	 LVQVGfCNY8bl6qViSYGR4LSlTuxuXQ9R8x8Q8UoQpqkvq8vzj+sCkNNTSRgi2YU6Zp
	 Jv/8sj06ri7lg==
Received: from 82-132-232-68.dab.02.net ([82.132.232.68] helo=localhost.localdomain)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t6Qeh-008VPB-CQ;
	Thu, 31 Oct 2024 08:35:48 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] arm64: Expose ID_AA64ISAR1_EL1.XS to sanitised feature consumers
Date: Thu, 31 Oct 2024 08:35:19 +0000
Message-ID: <20241031083519.364313-1-maz@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 82.132.232.68
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, will@kernel.org, catalin.marinas@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135236_451921_186AFC26 
X-CRM114-Status: UNSURE (   9.57  )
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

Despite KVM now being able to deal with XS-tagged TLBIs, we still don't
expose these feature bits to KVM.

Plumb in the feature in ID_AA64ISAR1_EL1.

Fixes: 0feec7769a63 ("KVM: arm64: nv: Add handling of NXS-flavoured TLBI operations")
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 718728a85430..db994d1fd97e 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -228,6 +228,7 @@ static const struct arm64_ftr_bits ftr_id_aa64isar0[] = {
 };
 
 static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_XS_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_I8MM_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_DGH_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_EL1_BF16_SHIFT, 4, 0),
-- 
2.43.0


