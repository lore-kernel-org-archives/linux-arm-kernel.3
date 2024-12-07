Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E765E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 19:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS8tWLo5GitARN+fUNjDu5LYhf0oxjZUevAjNJvhb1M=; b=BWrKw46qYq9EtYTm3HB8HEOqQY
	umP+Wnor4SQJPzdnuVlhvELEA7rOFosf/Vf5XEo4bMP9taD830sHxpoW93BHNeTVaxZXv7A77O2XR
	cYABPAqvAIfEq88YMoEqj2JJ3e794gEChER7t0o1KDNidnv6IouJjTAb03Fn3mbcdmk3a0SuVkjiE
	lPPXP2EXe0XNYq2yVaQ7XJDg0LihfBKOFrr/Cf3FILnfZJB9LTFYbxWVQpLuzbxRTjQ+DBnuEuKzv
	IPWtYE6bwcP+ENWibOUn8VVq+MQRtOidrzK8L7Il2/v6VJ+0qx/uX2bflQkGDhXCGt+RXRB62IN3O
	ILeexeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK0B0-00000004INz-2yYv;
	Sat, 07 Dec 2024 19:09:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK09y-00000004IKV-0ftO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 19:08:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E5260A4084E;
	Sat,  7 Dec 2024 19:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44791C4CEDC;
	Sat,  7 Dec 2024 19:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733598488;
	bh=cgaTsKTJrsLBacLMgbwEl37CvHQ9qS/dDCpL+E4tjsY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C5q0ZcgqvR+NGRZBYXM31n2aBNVJQriUjidaK5LP278aZZIbJ3aTupU8nYelYWFa7
	 BmwbCw4+R2bHJmNQgjkbGca0y3z2oAjoW32fNDSPo2qTASpZy+va1oiCsv6u4yXVnt
	 vDJy2UGomvGDTTLLyrVXpXOUCQT+OnZvle01Hd3Lm2QUt24qBmdVxyAjuanB5IZjqe
	 V0dgQub3A23BX2G9pEv8FnzFpZhaEoFj1uiIAvcUWhkkuDTSndA6PfVGDQNNHvUtb6
	 it29EB9PdzQPVwI9U0IZPvbIJjx1OvsCxDWPUWeIS70OZ2mzZqkk1iEWFa4rKjdRfg
	 DRnU72gfcr5Gg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1tK09u-001TOc-Fv;
	Sat, 07 Dec 2024 19:08:06 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 3/4] arm64/sysreg: Convert *_EL12 accessors to Mapping
Date: Sat,  7 Dec 2024 19:07:39 +0000
Message-Id: <20241207190740.2607673-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241207190740.2607673-1-maz@kernel.org>
References: <20241207190740.2607673-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_110810_355926_EF39C21D 
X-CRM114-Status: UNSURE (   8.48  )
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

Perform a bulk convert of the remaining EL12 accessors to use the
Mapping qualifier, which meakes things a bit clearer.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 19d137d9c50ed..ad2f6265f7948 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2954,23 +2954,23 @@ Field	63:0	PhysicalOffset
 EndSysreg
 
 Sysreg	CPACR_EL12	3	5	1	0	2
-Fields	CPACR_ELx
+Mapping	CPACR_EL1
 EndSysreg
 
 Sysreg	ZCR_EL12	3	5	1	2	0
-Fields	ZCR_ELx
+Mapping	ZCR_EL1
 EndSysreg
 
 Sysreg	SMCR_EL12	3	5	1	2	6
-Fields	SMCR_ELx
+Mapping	SMCR_EL1
 EndSysreg
 
 Sysreg	GCSCR_EL12	3	5	2	5	0
-Fields	GCSCR_ELx
+Mapping	GCSCR_EL1
 EndSysreg
 
 Sysreg	GCSPR_EL12	3	5	2	5	1
-Fields	GCSPR_ELx
+Mapping	GCSPR_EL1
 EndSysreg
 
 Sysreg	FAR_EL12	3	5	6	0	0
@@ -2982,7 +2982,7 @@ Fields	MPAM1_ELx
 EndSysreg
 
 Sysreg	CONTEXTIDR_EL12	3	5	13	0	1
-Fields	CONTEXTIDR_ELx
+Mapping	CONTEXTIDR_EL1
 EndSysreg
 
 SysregFields TTBRx_EL1
@@ -3087,7 +3087,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	PIRE0_EL12	3	5	10	2	2
-Fields	PIRx_ELx
+Mapping	PIRE0_EL1
 EndSysreg
 
 Sysreg	PIRE0_EL2	3	4	10	2	2
@@ -3099,7 +3099,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	PIR_EL12	3	5	10	2	3
-Fields	PIRx_ELx
+Mapping	PIR_EL1
 EndSysreg
 
 Sysreg	PIR_EL2		3	4	10	2	3
@@ -3119,7 +3119,7 @@ Fields	PIRx_ELx
 EndSysreg
 
 Sysreg	POR_EL12	3	5	10	2	4
-Fields	PIRx_ELx
+Mapping	POR_EL1
 EndSysreg
 
 Sysreg	S2POR_EL1	3	0	10	2	5
-- 
2.39.2


