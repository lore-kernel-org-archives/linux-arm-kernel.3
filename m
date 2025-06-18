Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70817C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 11:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpHYUn5vqIoafjVYs+Iwklgczox5NAJvmO+KriVUiDo=; b=RAaS21IWkpsGkVvStP3TJghIh5
	jmwiOmPFIWilLMJ4obG+r2lPVYUBecEAlswWj4lwpQLWpFlJVhNsw3s60fwlqk0RTth5+Cbwo5JOU
	yto+gBdnoPeDb5bFJa+ru6FEn/YrLw5z1zCwQN1KD1CfDdumonAAvZrXifP5soqYF0JoaJ95n6pXX
	UMGVFhCtXZpsPhakQ1MMZHr6COx5hKD0KMlwIouKvP9L4w1BKDjHq1psi8HPJGT7LT19MZIp+mDZ0
	othtcJjcbyy5ejcmSvw2DEnrcFQFRFo2P5DpgjQ4SHcTsyEmzyXg4zmIqOXcZi3KdXnyIVjAqbt/Z
	gl5QQN4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqqg-00000009vFo-1hgK;
	Wed, 18 Jun 2025 11:20:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpsQ-00000009kOc-0x57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:18:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8DBCAA524E6;
	Wed, 18 Jun 2025 10:18:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609BCC4CEF1;
	Wed, 18 Jun 2025 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750241921;
	bh=GGu0BlNfPd3BbcRNatWFSy8vlHfdSkuub7faaglQhI4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FHB7OwA+w8SnABB9cxmbp8iqjI0yAtqXbo1FIAmvIKU9lpEM9oUTScVdLB7EzFjMZ
	 79KbO5JZ+sgM1YLaSJMLxHIJWJ+QXhR1BBsZQQGRxa4wbAsfuBHup4QX7U6rCuopp/
	 aUA40BTrzzA7q6t5NGMQru/NbLhe0NSijZQUXe2gTLeMiQuncoaZwm5xe5vueLCFJB
	 d7/vWweKD/unZWpvx6idw+XWJ21Il2Ya3Crnwey+l8z3mGNTa3sBlhL9YTmWYyxpZR
	 TFreasDfb8scOXtwzUBZNMvRkbxF2fvZ9ZcOPR11mCl6VNx0vbec3MN38hW/biD/9D
	 6E12hOmOEU3PA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 18 Jun 2025 12:17:25 +0200
Subject: [PATCH v5 10/27] arm64/sysreg: Add ICC_PCR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-gicv5-host-v5-10-d9e622ac5539@kernel.org>
References: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
In-Reply-To: <20250618-gicv5-host-v5-0-d9e622ac5539@kernel.org>
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
X-CRM114-CacheID: sfid-20250618_031842_340314_7E39860C 
X-CRM114-Status: UNSURE (   8.45  )
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index ebbb22ed2301..5e15d69093d1 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3527,6 +3527,11 @@ Res0	31:1
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


