Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8661EC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lKNNxNcWh71Rf3ERGQxsrrqCjdk/7otP7KXg9EOfiRo=; b=qHC869fpzKnONRJ0n1vLxvo/H8
	OrDrmsjtYSjZfflfdvY8gxssvEVcxEFq6HLIuReA+XrCad2H370SrlPtFiqYEOq9UwXHf8LeJBeoI
	JMqqogT3ZdyzhcBrSNM+KOXyXocUXdIEAelrga+LO+nA8jby9SSDbqjgQsCPEWi4x8ApGaDeHf2X9
	E6AmGZVxlGLdmn48yr2LDNCy8xb+kl/LDf2EOgWv1IcFqRxrebCDNgnMuipqaCo9nrSFMRptZgZ9Y
	+8jWYt0mBoDZsLvBZexHm1xiM5EGnpawO4D7ZKx7QWYedDQLWe4v79HqhUwSmJJHToAvduE99VKFU
	98Rg9SGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEu3Q-0000000DCdG-2Eo0;
	Tue, 13 May 2025 18:08:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtkL-0000000D964-1QhB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:48:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C24DA629EA;
	Tue, 13 May 2025 17:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76590C4CEE4;
	Tue, 13 May 2025 17:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158532;
	bh=L2AyC0q/j1rg0Q8xOp2gZtcfrltSKtgGKZOBzDeAFq4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Si3CbBIi33CEmSG4N5JcX7DG+/zFMZgBY39aevyfWF/GzESs6Z0W5wURjq8giRZnx
	 C8fgH/z/xNuNVROorc/hm08x8gZCadSFfansf4ZSWkKILQqxMMf+aDuBUJTycPFspc
	 XJ4lDQSC6SvCP+1ZUidPBOoE6MwuSYmxqAdzwY6KziHbNz2ZcXJSr5xDZHXdrtGh4t
	 Lyp9UJZHaiw4vqwZXCmokMjECZIJtnNCCvH9yD5LgjOpJ44p4Bv1wDPtx0++0swZwu
	 jI6dMnKqsKvoVAsb4Vxs075jDQ4SwMRN8B8QrjgXpaWIfHhC95d+9S7JzPwaLH+UHZ
	 r/3XnpE7lbjZQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:47:59 +0200
Subject: [PATCH v4 06/26] arm64/sysreg: Add ICC_PPI_ENABLER<n>_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-6-b36e9b15a6c3@kernel.org>
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

Add ICC_PPI_ENABLER<n>_EL1 registers sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 75 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 9d8e62f1c2f4f123f8f8b71966806a07ff006da1..02eb3fd876dcb1612dc5436d509a80f9e7f70903 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -2399,6 +2399,81 @@ Field	1	Enabled
 Field	0	F
 EndSysreg
 
+SysregFields	ICC_PPI_ENABLERx_EL1
+Field	63	EN63
+Field	62	EN62
+Field	61	EN61
+Field	60	EN60
+Field	59	EN59
+Field	58	EN58
+Field	57	EN57
+Field	56	EN56
+Field	55	EN55
+Field	54	EN54
+Field	53	EN53
+Field	52	EN52
+Field	51	EN51
+Field	50	EN50
+Field	49	EN49
+Field	48	EN48
+Field	47	EN47
+Field	46	EN46
+Field	45	EN45
+Field	44	EN44
+Field	43	EN43
+Field	42	EN42
+Field	41	EN41
+Field	40	EN40
+Field	39	EN39
+Field	38	EN38
+Field	37	EN37
+Field	36	EN36
+Field	35	EN35
+Field	34	EN34
+Field	33	EN33
+Field	32	EN32
+Field	31	EN31
+Field	30	EN30
+Field	29	EN29
+Field	28	EN28
+Field	27	EN27
+Field	26	EN26
+Field	25	EN25
+Field	24	EN24
+Field	23	EN23
+Field	22	EN22
+Field	21	EN21
+Field	20	EN20
+Field	19	EN19
+Field	18	EN18
+Field	17	EN17
+Field	16	EN16
+Field	15	EN15
+Field	14	EN14
+Field	13	EN13
+Field	12	EN12
+Field	11	EN11
+Field	10	EN10
+Field	9	EN9
+Field	8	EN8
+Field	7	EN7
+Field	6	EN6
+Field	5	EN5
+Field	4	EN4
+Field	3	EN3
+Field	2	EN2
+Field	1	EN1
+Field	0	EN0
+EndSysregFields
+
+Sysreg	ICC_PPI_ENABLER0_EL1	3	0	12	10	6
+Fields ICC_PPI_ENABLERx_EL1
+EndSysreg
+
+Sysreg	ICC_PPI_ENABLER1_EL1	3	0	12	10	7
+Fields ICC_PPI_ENABLERx_EL1
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


