Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA9DC3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KgFGM4UrAHc8l5P7MSQ6zM9EO/qM9t/Uhdc7+dyiwLQ=; b=xOnbXJaq4AYP7bZnTO87Czet/0
	GqOfuQvMpIbk5KYlXaTLXk5jX+ScWSD7FNJjv4ZDCp8gY0vQHLyoHQsEfQDg/Kv5x/OQ5QmB1KXNL
	psCWM0FknAa8SSRw8wMQDM4ZX/f26sJDu+1udTZ5d/vmKMxQDPy0qt+yh2BhcvqGce+RZhGvOQt78
	zYsOEKKntreMc243+cbLabWJsg71HR1CAL8cntqRkWgNmqqKoPfQqezTwxHY8migb7wMa2Pmjfnip
	DUbx/kJfjn6aut8EIfWM7g5Ube/UE8xxXhI89HrKPkrJ6DM5QaNUy7emsqvfe1xPliU0xW3+qWGys
	aPsC27/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCKNK-0000000CWUK-2dZE;
	Tue, 06 May 2025 15:38:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCHLt-0000000BtTK-2bKQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 12:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E27CFA4C7A4;
	Tue,  6 May 2025 12:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3355C4CEE4;
	Tue,  6 May 2025 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746534288;
	bh=Dk78WkgkowYSPPndroB+3TTj6jQAcxwQp1XS8EQ5gtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=F4LhskuftmnNJUUbeCs4it+1aQlhCbN2dPm5El8d3mxhYb9PXrGjib6Aq9ApVmiKg
	 R6m/nx3PzMTC1/ITjIg6UURoT7zbm8IkGmfBFjhM/CxdBGpCjhQb7378aK3NfLNQhW
	 OHXDrVLxWCJvQNq5rT/NeAhBaIljXm3KiNLzYOrj29nchHj98OMhJORig42Q6U5TD1
	 pNVNGefEwJQFF0Hed4XZYa4RytuG4nukAQxLb0hgYLVQcoTAfuVyXlpW0PdPnKnZL3
	 AVXwbZ9MY8kuQU03STnAIMfMEBlYPXWkeDFZZ7kOh5D0Il8Dkl9qppAynB6/1yTmYj
	 BoWUcBLcEPmmA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 06 May 2025 14:23:40 +0200
Subject: [PATCH v3 11/25] arm64/sysreg: Add ICC_IDR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-gicv5-host-v3-11-6edd5a92fd09@kernel.org>
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
X-CRM114-CacheID: sfid-20250506_052449_793986_BAAF4C64 
X-CRM114-Status: UNSURE (   8.65  )
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


