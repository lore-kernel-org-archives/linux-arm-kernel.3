Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914A10A88E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/z32XHwp1HDk1qB0pvi4PQJYOhq9PRpT8iNl0rax98=; b=T/88vGOTihq/GEHxqXs9pDL+DV
	3x8IwKlvqJ1u8c5DB2u+opSnso69OqZTt1C11jMr1EhjMVPsJMzI8XQ46B+zBSTTXFLAO2Ys+F4Xx
	+0/JcJ4LpoW5cAq8PfkSPVGqCpFbTGQzxOr8VSkxVvCVBM6jZCnvlY51IupTN9K4PSS2VED0j98qd
	xp3Hsx4PDaoJhtG2TiRwOfDgW3nFhOtrGtO3AENXzrLn67oGFYGBapTt4mnqfXwtOo0RV6TBuPcm6
	Secf0jlvnTE6+c0wvmfro3z/IGBJzyRgeaHtASOW8D62/j0wUCfUi6GHPc728xB34ebreOfEhFs/P
	xB86FriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkN-00000005lAi-1vG8;
	Thu, 26 Mar 2026 15:35:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkD-00000005l2Q-2liS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC39544594;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E3BC2BCB6;
	Thu, 26 Mar 2026 15:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539336;
	bh=rF/5q0POVppW5TATGBHNU8W1ENdew7ttw3E4pLJqUAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FkFCNpV0egblNaeA9awlqN9BcAU5z6C0g3Uk4syyedUoVjT3RtZ0FYSoHR+Rg2x56
	 ln8148X/lXkU7+WAI0SqZgL62PJ/trMAh1l52EAcRxWoWOw5P7VzkeXCKxwC++gAjo
	 9js6oHrC1afgl42fvgfJNXAyCjDbT+3Z71n+qEasXjjC0fKA26p3HNxnOuke3gyttd
	 2AvC7JWbx2CGb704fHIkYTBPExaBMib5Q1tnVPclwWUwBd5DgeYuWWgJIw2usdIFZo
	 8C0fvBERZQKdPh3JB1XfyesNxodL4ge+Jk/CcNXFmOAOZcVLoXiRli6c5mkPYB+Uqm
	 Bhem7PXc3LdmA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkA-000000060II-3aeR;
	Thu, 26 Mar 2026 15:35:34 +0000
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
Subject: [PATCH 03/15] arm64: Fix field references for ICH_PPI_DVIR[01]_EL2
Date: Thu, 26 Mar 2026 15:35:18 +0000
Message-ID: <20260326153530.3981879-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260326153530.3981879-1-maz@kernel.org>
References: <20260326153530.3981879-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_083537_717340_4E761824 
X-CRM114-Status: GOOD (  10.34  )
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

The ICH_PPI_DVIR[01]_EL2 registers should refer to the ICH_PPI_DVIRx_EL2
fields, instead of ICH_PPI_DVIx_EL2.

Fixes: 2808a8337078f ("arm64/sysreg: Add remaining GICv5 ICC_ & ICH_ sysregs for KVM support")
Link: https://sashiko.dev/#/patchset/20260319154937.3619520-1-sascha.bischoff%40arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 51dcca5b2fa6e..3b57cb692c5be 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -4888,11 +4888,11 @@ Field	0	DVI0
 EndSysregFields
 
 Sysreg	ICH_PPI_DVIR0_EL2	3	4	12	10	0
-Fields ICH_PPI_DVIx_EL2
+Fields ICH_PPI_DVIRx_EL2
 EndSysreg
 
 Sysreg	ICH_PPI_DVIR1_EL2	3	4	12	10	1
-Fields ICH_PPI_DVIx_EL2
+Fields ICH_PPI_DVIRx_EL2
 EndSysreg
 
 SysregFields	ICH_PPI_ENABLERx_EL2
-- 
2.47.3


