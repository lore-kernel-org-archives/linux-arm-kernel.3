Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8133BC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6PtD9OYATWtR6kPtgXQiYYs9Ux064kLmQTVFtEjrOQ=; b=idM47bkPXT7O38lvqVJ7bbskiy
	kZKYCs166c0FvQ/PNiRRULfADqD1ffpWkrFOstXTXwC8bP8Cu0sy5uIdj8oDimM0ANutpaIbIaPnr
	4dC07csQchPHEdQ8Y1mbTg8D0gDKOOtHed4t9JrqlWOFxYSXpoyR6DZ+cowrTJwet4sOeUSFYwFCD
	wk1JriCIIUy6JEMDuGzFCRHzKwrbz0jiZ0GtUg+cGnmrk55ITNNoUF6LThTL8xyvESmLlXEWimFhw
	40GKkYN1ZorB6aDLdp7z/cIa0WKsZKilAM1R01U7C/WYSsjjEOoVbrJSVyrAm4C+PMApl3dOIKrcE
	jAWItWzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trcX2-00000002g2m-1m7m;
	Mon, 10 Mar 2025 12:46:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC0-00000002bR9-3ms7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 951EA5C627E;
	Mon, 10 Mar 2025 12:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 066D4C4CEEA;
	Mon, 10 Mar 2025 12:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609512;
	bh=mwzvC1hwjzZ73H1jse2BNgJhdi0FIYrJ/BY6AQtHATU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PYm8l0UQRA6eCOQ/yFWvKZILvuW0HqxFUO/zFKpB5nRU81MMfQVS3GlSQLTQR+/EG
	 HHy+BWoiitNiG7xkqE1gHOb8BvHbRXh+6efw93kdCHvpi2FNlwXWtH70ONuIxPhMd4
	 0rvsXmXc84BHSDat9CHziPwu7i6Hn5NGT+AF+EUZgEAgJIS3nClEaFdqyTO6/Xudaz
	 Ju8TIXRllXhzGdD9sezImduJWBTLb8CInAhZY5Xigx9hk+u7Xr450xSgmORoB+nTzK
	 lhKwx67YMiow45H2qRAKCingJevdOi843+SMj5YLFog87CFaXbwDe5v+6d/IF3PntM
	 vtvJWuEntVN5Q==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcBy-00CAea-0b;
	Mon, 10 Mar 2025 12:25:10 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 01/23] arm64: sysreg: Add ID_AA64ISAR1_EL1.LS64 encoding for FEAT_LS64WB
Date: Mon, 10 Mar 2025 12:24:43 +0000
Message-Id: <20250310122505.2857610-2-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052512_987409_D98BFBCF 
X-CRM114-Status: GOOD (  10.07  )
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

The 2024 extensions are adding yet another variant of LS64
(aptly named FEAT_LS64WB) supporting LS64 accesses to write-back
memory, as well as 32 byte single-copy atomic accesses using pairs
of FP registers.

Add the relevant encoding to ID_AA64ISAR1_EL1.LS64.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 762ee084b37c5..8c4229b34840f 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1466,6 +1466,7 @@ UnsignedEnum	63:60	LS64
 	0b0001	LS64
 	0b0010	LS64_V
 	0b0011	LS64_ACCDATA
+	0b0100	LS64WB
 EndEnum
 UnsignedEnum	59:56	XS
 	0b0000	NI
-- 
2.39.2


