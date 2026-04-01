Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEFED35174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 10:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F4mDh0j/d1ggPUbgMWwMmi3/NLfkn4A8iM2ZfTlX4uk=; b=h8H1p7l3SEvPeqWSbKyNiEmubN
	RY+G5KCza9fvcZ8NJuhpBkEZlDwTHGtj1awyAPKRot4PlzJclgPNmN+6F0BJgbS2+EfwhYh336Bdx
	0aNiJXvKxQNQXLEJ2LennYjy1Q0ePWmMJjKnBZqxNJjQHjXzU85zIjOjCnGoevobJI+0qtl2WbIOl
	EvxVToftLStRn8tbFpEbKfzvyOKLF4o8YEDjDLWGGSMBMdwiyr6Tp1W43caw2rcp1cVxBYCmmzd4J
	kQl+sT6SDoLqzSINNCT4IdRjbwXbe8/45gqeZQ53BIrO0461AlQeCYSvt/Wrb2a/6fRcboTzUzKva
	FhCNmRTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw5-0000000EWCw-3qFc;
	Wed, 01 Apr 2026 10:36:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7sw4-0000000EWBS-3POd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 10:36:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD43C6012A;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99ACC2BCB4;
	Wed,  1 Apr 2026 10:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039791;
	bh=w1fPDoEy+oy5xwwPakENiPrrfB6YomaGgYQhWWBLZ28=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UOM3cFCV64rMtE5hNq8o3dDdcXx1cOQDxnDTb1pGvqzkCpTLppnGis9Rwftwgi6Kb
	 KHPk9WFE2wYA068y2Gy0y9qXOHulmnnTKZ+yeHPe4SBYnqiC7Qwv8eIFGyhUYjN0At
	 /u2IVQ4vrhWavSOHluTjDhefJNgn08fBd4P+/qDQkZlN3Dyf46lCsaz+kOHm/fi0eP
	 xHU1Q6pstfIjj7l0MCUuJRPrNXQIK4qn2p5z9xhcKA7QeUbNWrswHjtdG4/ZiS5U0x
	 05XeRcbvzMZilzN760IJtUevishKUPXVhAT9jD8ktShNHBbvRY9xMOJnsTCYsTcuH7
	 v8RkPAhPeVjgg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7sw1-00000007oRQ-3fzO;
	Wed, 01 Apr 2026 10:36:29 +0000
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
Subject: [PATCH v2 03/16] arm64: Fix field references for ICH_PPI_DVIR[01]_EL2
Date: Wed,  1 Apr 2026 11:35:58 +0100
Message-ID: <20260401103611.357092-4-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401103611.357092-1-maz@kernel.org>
References: <20260401103611.357092-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, broonie@kernel.org
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

The ICH_PPI_DVIR[01]_EL2 registers should refer to the ICH_PPI_DVIRx_EL2
fields, instead of ICH_PPI_DVIx_EL2.

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
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


