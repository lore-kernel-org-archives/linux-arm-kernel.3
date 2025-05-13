Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846E1C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/sH2NnRdn8cESKCQIbgrIZvibDnV9KqSsnfy64QOs4=; b=JJXskPaGNdD5xhl1OMXGEJLZEx
	h2yz9UjEMLspCHNpiQXqiKcBr9/Q2eCdCYRyaNy9inissTKuganNkD2LZrE/dcEsbo4bdb7vOjKqB
	344Ke8zlZIZzRwri2FL8opcrM8T2WX42YjpIb9jWIh8ShHzJan8amXM7nXkumYNwqyzbsbe7QVBpF
	zfjkZo36b3BGTKlPlrlLRwAo9e0VWGeSGSBshb4YlWisoREKQ0pjSgCXXlP36wotXGKz2eQ1gZR90
	dE5VLCCR1uG25Xw7EwUG4al2OsMRy/TqApYEL7NOwcdDpMpj1wR83pT40V7mcQ1bV+TDf2rd2XHBZ
	LoeDOlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuBi-0000000DDSY-2NRx;
	Tue, 13 May 2025 18:17:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkh-0000000D9E0-00uO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:49:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71633614B6;
	Tue, 13 May 2025 17:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F70AC4CEEF;
	Tue, 13 May 2025 17:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158554;
	bh=SXFEECeYxUYqUwYY8B25Y1oGt+ahu7Dn22kSvbswA/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q1f8UZcDfVsZQ9NcnSlj0ZsU6vm2liUUqGTBACBkHS7Y+an+4A+tOOoi9/Crs7Dim
	 4O2R3J0P92fnHj8LObxckh8kJVb+sGVkzBc/ysyeJwmdnpNZ7W7D84XafOWP7ZRJtF
	 Rp51JIrKyioR8xAD3Sek3xvzkcxxg2CuNJo9cs7WqnAybvEfu9SKuo5vHHpKovap86
	 2yl5hCnoACBESRlG/PQ5SPU023e1pkHsRF8vudT9sOtQrL3Mk+DbHZlzneNNDVUp3f
	 M/iNlJwaa1WqCVavrG9s/CJNq/X6xGHc+8GlQKrV4xHkyP5NWH/p+mpPCIRC6XGdiX
	 m63O+Dqsgb0tg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:03 +0200
Subject: [PATCH v4 10/26] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-10-b36e9b15a6c3@kernel.org>
References: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
In-Reply-To: <20250513-gicv5-host-v4-0-b36e9b15a6c3@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.14.2
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 60fd9bd44fa92af2634e49d9a650bb1c9049983c..b26e11b6e109850947be30dd2fb9c044d21c0aaa 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2806,6 +2806,11 @@ Res0	31:1
 Field	0	EN
 EndSysreg
 
+Sysreg	ICC_PCR_EL1	3	1	12	0	2
+Res0	63:5
+Field	4:0	PRIORITY
+EndSysreg
+
 Sysreg	CSSELR_EL1	3	2	0	0	0
 Res0	63:5
 Field	4	TnD

-- 
2.48.0


