Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94770C531CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAy4QpwKGb1sd3nwGuAtWih291atqR21YyMCiho27Uo=; b=qEPHN3DOBwkc9xLf8z0PEcHeBx
	QUk0wvMXYPNXvRzNhzy04AhDGJ2sCgCU1nu2LwroVV1DAr15MeMRJZbYcvOKdkg7Q1YJ4YEWN6BEr
	v5XsDkdgaNg6u2PyzN+ZdOYZDvWngU2SpPy1RX2uSDFVCFK4C958ssQuFE3Fggkt8zyuqYkPkmcif
	sDI1S39O/Lq/NM7TbWyYLKXM9f24OVW2RiN+S+cAjGjvyNlI0n2Xzmi/hdcVR4pAeMXItKcvUeQEB
	ZMEdaN6F0P6qdME9+CbkzpjFuUaaFV8hzqPZYZtiAy+sxZ6Ju8lihKPrF9lqWhOEmcGyfP2LZFy3p
	X5BP9XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7x-0000000BtIV-2bQ4;
	Thu, 19 Feb 2026 19:55:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtA7p-0000000BtCF-0UoY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:55:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A24D944548;
	Thu, 19 Feb 2026 19:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C795C19424;
	Thu, 19 Feb 2026 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771530948;
	bh=lSnpk/U1VTCVk454WA0P8P36bHcCW2yZ27QlrwJHGtc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qDRRbdsX0VeyC7I7Gpnu/K4mPuV1FgLoV95n4lScmVuefGlvnJQ7dgKiYm1IQ51r3
	 9rhD5Ej76Kw7crOpCQ7WFy+30msL+dpIp3ieYU+Y01G0uznMlRsmOMM51rvWrE693x
	 YAPb4WoCzAmlN4sZHKb/Ht5AGE8adQh8ISael5fqCcCI2nJ4Za2MKW+3aG+KsTUH8Y
	 1ljrhc8/HctRHoexLYM84Q54495rNYnE0JoLwHzy/EAEadfqfILPEz/Y7wuC8AcLuA
	 hpfDY9XOmtSwEzARzPjSmrICNsTJPHryMg8x2kEQn1KfCrgPf7XGdeEKvsi/pAISlQ
	 AxpWSh/mupuHA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vtA7m-0000000CGHL-2mZy;
	Thu, 19 Feb 2026 19:55:46 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 6/9] arm64: Convert CONFIG_ARM64_MTE to FTR_CONFIG()
Date: Thu, 19 Feb 2026 19:55:29 +0000
Message-ID: <20260219195533.2455736-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219195533.2455736-1-maz@kernel.org>
References: <20260219195533.2455736-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_115549_175712_E48B769B 
X-CRM114-Status: GOOD (  13.04  )
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

While CONFIG_ARM64_MTE=n prevents userspace from using MTE,
the sanitised ID registers still advertise the feature.

Make it clear that nothing in the kernel should rely on this by
marking the feature as hidden for all when CONFIG_ARM64_MTE=n.

This is functionnaly equivalent to using arm64.nomte on the kernel
command-line.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index ca4aae48ace66..2b9d03c9564e6 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -314,7 +314,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr1[] = {
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SME_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MPAM_frac_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_RAS_frac_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_MTE),
+	ARM64_FTR_BITS(FTR_CONFIG(CONFIG_ARM64_MTE, VISIBLE, ALL_HIDDEN),
 		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_MTE_SHIFT, 4, ID_AA64PFR1_EL1_MTE_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR1_EL1_SSBS_SHIFT, 4, ID_AA64PFR1_EL1_SSBS_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_BTI),
-- 
2.47.3


