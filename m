Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0874AC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qseJA4on3/6NPiGbkizP4ZAtsN+MvJS00a18ESWc/TM=; b=QNrfxi8VVx2+WJbrEDqbbBSYWn
	Gh/u7II0QjjKQ3/FLfXWpWJ2M3b30iOWJphM4Gy48GOi0u/HNXz1xrzHbPn7RHLQP++qIrn3Z1KTf
	egeOnE0FPc2MvjgMPH7VoD6iNVKUMbK7WM1Swd95pQ4HmfFwDhUfhV8096rbgncKZjbk1orBL+/C2
	eb/cq+jeXrx1YYt9zPNpmcEPJMCMijGclbCG/7huza7wH8n0DRPFEYJRuNH3Q+mHlUwmQ5rXsjwyP
	ikdDpjxH56jOQcT8OzwnS+95jV4kYYbZ2br/L5MdCvA0QeH68w4gdjaAxiD2Gdc33wlBNYo3gyJaF
	JBBYnbjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkhZ-0000000BOyU-3t3u;
	Thu, 26 Jun 2025 11:23:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjpF-0000000BH8F-3piN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:27:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3774CA50DA8;
	Thu, 26 Jun 2025 10:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 529A8C4CEEF;
	Thu, 26 Jun 2025 10:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933645;
	bh=m6O/5j1WF6mk3EuO6bOH/5Xan9g3qo+JPPYQ48OrVbY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TCXbIvNuk83qfc/D8JE//UvHhsB059hhqueiEOEYJGZwheDLZkH2n6ZmoaWzgXKoF
	 iOoEnAaCqxiMT/19pLBTtNIFaHB4rgnBQ/znYkglDrvEDppf9O7ozXuiEbEmurZ3jr
	 j5WUMbMT2X0Is/ytjAC+BffSuEOnjHyWWVHc51hxI0B15EMecDKQNPRQp4SwEZyaol
	 I0XPVAqncTyyQR68umm7sQxuRbbszyy6KrLouTROwOxBkRMvgCYd9KHtIxYjwuf/lT
	 qujmI+tjKSbDKaasXxZu1ik0Z8+04JF0it/U6W5wgsmHms+UUj+Xq7u4ex4Eh4tGJ/
	 F2fpKjnbZ14Og==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:26:02 +0200
Subject: [PATCH v6 11/31] arm64/sysreg: Add ICC_IDR0_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-11-48e046af4642@kernel.org>
References: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
In-Reply-To: <20250626-gicv5-host-v6-0-48e046af4642@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Sascha Bischoff <sascha.bischoff@arm.com>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 Timothy Hayes <timothy.hayes@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Mark Rutland <mark.rutland@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>
X-Mailer: b4 0.15-dev-6f78e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_032726_023800_B651E9B8 
X-CRM114-Status: UNSURE (   7.84  )
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index 5e15d69093d1..8be5e4af4ad6 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3099,6 +3099,22 @@ Sysreg	ICC_PPI_HMR1_EL1	3	0	12	10	1
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
 Sysreg	ICC_ICSR_EL1	3	0	12	10	4
 Res0	63:48
 Field	47:32	IAFFID

-- 
2.48.0


