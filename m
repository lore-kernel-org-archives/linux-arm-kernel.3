Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0653CC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgFGM4UrAHc8l5P7MSQ6zM9EO/qM9t/Uhdc7+dyiwLQ=; b=XxiUE7SfH/vJ5N5sspU7ubQ8it
	h+c9WaPdcX1WC55DWsk8MNCpqd7WDhyVrOaonZmQ49VOGRwIsJmr4sIkdUuvzNhDY+INwHH9JwDUQ
	qxzw2qlhd0C9p3+kO75VceiFmqbMLwQrKQgUYnPYkM3TwPlQ9rxjYdR8waAiMjx6BXmR6FVIwKIMo
	QrKnfSVAfH9oCUUDoEGdEQ3Uj9jdpjou/2GGJ5UZ0Wkq2X5MpgXwCZkHKX0UTASfIGUejww70fugd
	R9L1fPCrxAK9m75fWDOEtZI0ceidSZIx99u92cQliUuo8T0Pz73pJ1ENnGrMi/5a7cnHJkmQkn7BM
	N3qDEQVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27FH-00000003riw-3GUd;
	Tue, 08 Apr 2025 11:35:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u26YE-00000003kFu-1oEA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 10:51:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A60549D41;
	Tue,  8 Apr 2025 10:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3250C4CEE7;
	Tue,  8 Apr 2025 10:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744109489;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Z8JOL97PD3zlgguwVdPmHQrUGhcV92w6q/9eDzQEu1K6ldhM2x8pICfBH2Jiva+fH
	 z8Yd1Fbeu0KlmxO29wzPQTkB1YEIqLs+2TbzYONJpKLRQXnI+E67a8b5CI7ZqLrweQ
	 BUg5ZDMdn03ICM34rzt2jPZFU+BB1FyFrtdszLulcqWPMz/Y3Xn8VrHbYgv5NDpYc/
	 9b10i4Mfw//PVkk+07tpQJLRstpt+EhHlkB49F5ilr4w3ZTNec+pkYtePkJFza86pY
	 tiCqefJxhsYWq1DfHb8dP1dRze2qbjfHjasr3On99wOo867aCnKOuEuVKY9jFEO5Cy
	 YQi/aA9p2uxTQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 08 Apr 2025 12:50:10 +0200
Subject: [PATCH 11/24] arm64/sysreg: Add ICC_IDR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gicv5-host-v1-11-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
In-Reply-To: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_035130_492005_2FE102B2 
X-CRM114-Status: UNSURE (   8.02  )
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

Add ICC_IDR0_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9a2ddab8661c85586b0e91f7eaabd5a6b3409c67..1ec8113df713dfea6d38e39c42eba1e3dca5eea5 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
 Fields ICC_PPI_HMRx_EL1
 EndSysreg
 
+Sysreg	ICC_IDR0_EL1	3	0	12	10	2
+Res0	63:12
+UnsignedEnum	11:8	GCIE_LEGACY
+	0b0000	NI
+	0b0001	IMP
+EndEnum
+UnsignedEnum	7:4	PRI_BITS
+	0b0011	4BITS
+	0b0100	5BITS
+EndEnum
+UnsignedEnum	3:0	ID_BITS
+	0b0000	16BITS
+	0b0001	24BITS
+EndEnum
+EndSysreg
+
 SysregFields	ICC_PPI_ENABLERx_EL1
 Field	63	EN63
 Field	62	EN62

-- 
2.48.0


