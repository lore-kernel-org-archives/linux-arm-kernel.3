Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57AF10A88E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7lWKzfQbNxQPY2Casn+dBv0UPPovGWizxfUQouIiyBA=; b=nyzFB8cIoVCn91B6RXKw5nwozy
	muAfjUjW8uFZYuTtJdeL3MGkRq0yloWmBQzkEpJnajT5UQsG+NFJkt6oAAXt7jWh5FNrZvmVZBbXv
	98mY8qdsmUNFe1QW4Lzbj22D5P3DDyryiOXJiyZhONh3Sqkicft8+9OWWo5jP5/OHf18m6upiL8AX
	xbANtcdDuuSV3601pMzD5dtMPTWKH+yTSjDbcSeiSqRtc2B5LW8awYBswYvbMqtx6P5cibvq70I+j
	EPyVUeFunGNi9eSC+czpR/yfp4DM861OBYt8CSGXYX8AAkv0a6G/6Wko62mztTc+yp7Hm67AwrOVX
	3VvYrC/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkN-00000005lBK-3JJI;
	Thu, 26 Mar 2026 15:35:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5mkD-00000005l2w-3Bo9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 15:35:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 765814454D;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D27FC19424;
	Thu, 26 Mar 2026 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774539337;
	bh=CIJ73nQF0T1lAkqi3KJjDOMxDw1M8UCTUrlvRdpOz1s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q6+I9rqZphnlbVX/77B6x8RKvZBVgAxsJXKGP+uMYxRRWecLXO4zXOq9N8y+TtMt7
	 zbanrkahe/euqPveNPagmg3JKlZ7SuZoZeckCPS7o35l45Y77JaUskTtnZ1rZz/XfC
	 275FEQcIORlct6WlgLPsUc2b/PKC11oEMlp+kbt5ZJtJGb0LxE297Gvcw7A3qE1MTZ
	 ZExMY6cgo8E+rla1wjgssaeOWJt0n+NaA4SdPvBYuDxYiSruFJvTy5E+QAOJ/FMNwA
	 3uDPUTrvXLKe0TczC2kijrtM/r/LAD/9bsI9jR3lDyJibn5IWcBp7qGC5dvXy+5Rk6
	 OFw4Pwy9CVseA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w5mkB-000000060II-0GHC;
	Thu, 26 Mar 2026 15:35:35 +0000
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
Subject: [PATCH 04/15] KVM: arm64: Fix writeable mask for ID_AA64PFR2_EL1
Date: Thu, 26 Mar 2026 15:35:19 +0000
Message-ID: <20260326153530.3981879-5-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20260326_083537_819566_A7DA51E6 
X-CRM114-Status: GOOD (  10.37  )
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


