Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D753A1076386
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 17:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iAS9VPfWIKW7dgiA+w1Zo7uJAGagC18Krp9FSciaYxI=; b=NLwtDb2th9EMklfbA1KBAHQu3V
	rK40FVPLPct+c+pG0v9J32eLctUU8hiqJmApv8NpBRclohGIXhsjzfhHv/9VjBdGHnjyKkDlqfE2u
	igQIE1RI0RnA3vfW7o/qxZCMSoRpB1G9yOVN+AZ1FYk4FKdwtr7bK5ROmGiuQvKqSRbnTsiThMytW
	3p2ZwbWQ+ZXRoBjs/hbRh4G33Rmvp229Ub8KoVLNW/4BaFihxrlSe6wKP9JtZ21A23dg8ty+9bIo9
	tbW84bmFy1qZe6xNQqm1x6LMQompGUIJ/w1LdwdUAmshKiKVyyVenQemc+AKMj+ti/5hz1EXaqFdH
	rXO+UaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yva-0000000Fnx0-0ZtD;
	Wed, 01 Apr 2026 17:00:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yvY-0000000FnwS-0qaU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 17:00:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 684006013A;
	Wed,  1 Apr 2026 17:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19595C4CEF7;
	Wed,  1 Apr 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775062823;
	bh=YiVdKnvqD5vCATf23tC4OrdiTH65zsHAKoYXAEDSv9g=;
	h=From:To:Cc:Subject:Date:From;
	b=mcIps+ydayXq3ikkHk6pOXKdzfdMX6ggx/tE9jWoMxYqiBrTHMlVKytOBQQTw7JmE
	 biVbkmQBpVZFvLg5fBr5J9VZbylIneI96ebwUgvhay3eyMOd585dt58hu0Du8wbX+I
	 fKtLTceSMPOQQKJXBOQNGXCtN1TUCYKrQZi+uFlB80H1YiqjI1DlJb4u3mzSn2tOgG
	 R3LwUAqqi1zRJMCDdpGyoTJWzQjDS2mPULD24gotWUivxlZgUcHYm8SanAiK/uy+Ud
	 JfoAjW/jlYRrb56ArSes4cV6ubBJ2uZ/L1H+Mre7QzKJl4lE7AXk648xYmOMcUe8ne
	 TUr/8pKFpqoOA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w7yvU-00000007xNF-39m5;
	Wed, 01 Apr 2026 17:00:20 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH] KVM: arm64: Advertise ID_AA64PFR2_EL1.GCIE
Date: Wed,  1 Apr 2026 18:00:17 +0100
Message-ID: <20260401170017.369529-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com, will@kernel.org, catalin.marinas@arm.com
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

As we are missing ID_AA64PFR2_EL1.GCIE from the kernel feature set,
userspace cannot write ID_AA64PFR2_EL1 with GCIE set, even if we are
on a GICv5 host.

Add the required field description.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kernel/cpufeature.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 32c2dbcc0c641..5bca6e064ca72 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -327,6 +327,7 @@ static const struct arm64_ftr_bits ftr_id_aa64pfr2[] = {
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_FPMR_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTEFAR_SHIFT, 4, ID_AA64PFR2_EL1_MTEFAR_NI),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_MTESTOREONLY_SHIFT, 4, ID_AA64PFR2_EL1_MTESTOREONLY_NI),
+	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64PFR2_EL1_GCIE_SHIFT, 4, ID_AA64PFR2_EL1_GCIE_NI),
 	ARM64_FTR_END,
 };
 
-- 
2.47.3


