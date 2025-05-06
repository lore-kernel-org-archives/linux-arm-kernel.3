Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B73EC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPgGiBFAX70unZaYouOMrE/S/CJ8oTuGZe8qicAjMCE=; b=zq1DoyHIaFvDbq/skBfeboxWnX
	HKWN7TZjCi20w5SrKjD9FyzCEp8R9DDnpUvPNx45UL29d6V8qsrDA5npTGBfBaWbMFG9wHo0j5y04
	Vqu0q+8NrsQqjeVxLxkszhM1VhiZdv/TzB0TfjPrg3754CDOv3b/B5guBTbZWwwqXLR7BmSIdEDDn
	gxiOXYem8OMtUQPKR5KeBORih5aguG9Tae9O02E/o7+LkZNpgawTHXa6Q8T4tOcFXorjVYCDxbVH1
	MbXBBz2d0JhQN62/G9MiJa2jENSKjvgPh6gJJ5qDIOwbFhEz17jDRxh3yoI0Fw4mvVVrzj5Kv2Ywj
	WnKNP9Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKLP-0000000CWEa-3zix;
	Tue, 06 May 2025 15:36:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLp-0000000BtRn-0jVq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B80C5C02ED;
	Tue,  6 May 2025 12:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56887C4CEED;
	Tue,  6 May 2025 12:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534284;
	bh=IR60XZsATfdTuIxQzwSdrYf53KWRtcmnuEgRG5+wtmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IPq+lEj0IohqZZ+lCvThNpzSlpPVBeaBJ/A5uHGRPgnr0rI8PahBUCST9vy9sz4ez
	 3cY8FFFsyev5Y0nYLdwlGAaOpUwUM+jsLXeRodgwPD5TCUQ+rseUzXggaLGl5Y1i7Y
	 43mJX2AS0HOsZyj+JKZ/XrHjK4OXardHCqWoymLKJS2zCu8s43czarXjDs0t3wXFXp
	 FIEpwY9KCiuFmOvhgu7vAnYNxMZpTxRgZ63zA30ic/jpEhm9Z5oAe15LkR2FTQHhZK
	 L0l2qqRWdb3J+UaYSXbaSC67TjQbySsQjIzOBluy1oFm3ryEQMw1IAbsclhojPCIoB
	 Lr7PbuSvicrjg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:39 +0200
Subject: [PATCH v3 10/25] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-10-6edd5a92fd09@kernel.org>
References: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
In-Reply-To: <20250506-gicv5-host-v3-0-6edd5a92fd09@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_052445_270278_41153D90 
X-CRM114-Status: UNSURE (   8.85  )
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

Add ICC_PCR_EL1 register description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index c96243505031ea680c04a693fee2c96ad19e30ea..9a2ddab8661c85586b0e91f7eaabd5a6b3409c67 100644
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


