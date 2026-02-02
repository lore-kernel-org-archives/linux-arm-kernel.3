Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB5BE7DF11
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWqKLKSCm1FEW5xXSZYaSwbX8FgXGU5GoEC+q4XanZk=; b=kr8atsmBakHywIWbQ79przSeaa
	y/0PyOUHaJWDF9acSFJkvj/IDFypLHzbm/ocZ51jAA3fgIj51JKMkY4uhmZDbpRRcYglLT3+1bfoB
	8BcL0T3zVvyAaVZBchtfYe1IwBmfmCviIjYSalXhFyhylXahv5/tWIv8nqMmAeT3Iq5ZIXx+bIoL4
	Ph0rFx0wk2UAeJP/0DTHzd4NrTw32R3PcOFpekBGBuWGCbu6eLJgdZ/tF4ISuia8qNJEoV97z8CWt
	voUJVTDtGNa7vdVOVnpbJM3XSb+djq8jOEKbWoLE+33PGE301ar2eUXYFP3Fs12r3lQW/W/6LfzQf
	obuzvgcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmytl-00000005R2M-162G;
	Mon, 02 Feb 2026 18:43:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyti-00000005Qxl-1Cy8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:43:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9930E4440E;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73368C2BC86;
	Mon,  2 Feb 2026 18:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770057821;
	bh=7ud6JNfa7NSfJKxGupaHkrIYoNT74Y9AH88J7RRY1Bw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C8TF7ER4jvJtQUctCfVAajBjWQEXcmHxIL0fvrwGtqALnptxaN2sCThB1Ynb/MFHG
	 fKdFl7k7WgdF1os2oGZPWZP9gsMw6+ileD5BJpgL4EvlDoBrH8SoaU+/aEt0+VEXH5
	 heOBhiH1Ezl42WG/3BRy3UpJcSsmVBYl3qVcrSsiRVvsMqSWVjI0rNYyPY4N5VQ19Q
	 ryy069geJ6KfHRtZTQURyNTt0aZlYK4P2TejKKwkqdnnCGKD6z/yh5h2eT+QNN4Zu3
	 LJeVIqGO8SCfaDGerdBMsre1hgMLX+S3rhZvk6/gTk5aYFnnMBDPg1uyR/zDHsqbXj
	 tlFAN54PiYnoQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vmytf-00000007sAy-0d4E;
	Mon, 02 Feb 2026 18:43:39 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v2 02/20] KVM: arm64: Remove duplicate configuration for SCTLR_EL1.{EE,E0E}
Date: Mon,  2 Feb 2026 18:43:11 +0000
Message-ID: <20260202184329.2724080-3-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202184329.2724080-1-maz@kernel.org>
References: <20260202184329.2724080-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104342_346400_E367438B 
X-CRM114-Status: GOOD (  10.24  )
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

We already have specific constraints for SCTLR_EL1.{EE,E0E}, and
making them depend on FEAT_AA64EL1 is just buggy.

Fixes: 6bd4a274b026e ("KVM: arm64: Convert SCTLR_EL1 to config-driven sanitisation")
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index 9c04f895d3769..0bcdb39885734 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -1140,8 +1140,6 @@ static const struct reg_bits_to_feat_map sctlr_el1_feat_map[] = {
 		   SCTLR_EL1_TWEDEn,
 		   FEAT_TWED),
 	NEEDS_FEAT(SCTLR_EL1_UCI	|
-		   SCTLR_EL1_EE		|
-		   SCTLR_EL1_E0E	|
 		   SCTLR_EL1_WXN	|
 		   SCTLR_EL1_nTWE	|
 		   SCTLR_EL1_nTWI	|
-- 
2.47.3


