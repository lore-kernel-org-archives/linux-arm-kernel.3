Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA7CC7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 11:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mrSFo0Drzdl49KjTIgIw5R1dWNGodrXd2qO+mvD02z0=; b=14Eo5PSKDNt75BFahca2INSCUd
	XKlh3wALNSkoO9zsr3BrFLdNCrdt4+/u3X/IUvCRFssb0dHlb5RRk/L+YKPD86r/OZRAv0lgEp1vS
	sSEGysbsliPO7VVfbvYJMbt2HEGaXypIGjaNlfAR8uHRishy+K8EK19CAKHBhaUqS/UqBAq3Df2at
	+N8nHPKLa/OSvao9/t8vA4TaNt5Luo69c96gjhDOG0aBkr+MuBrHXV5NIpwN0h9YRMOwMF5dpyHSw
	ZDOUvYw+ZPESEBRR+T+IVcbauIwe3ut/UlNG/AK1Y8XF5HT1t+VP+aAE4eox3mJG0mEI2n1BCbCRO
	3P3mCraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUkhM-0000000BOaM-3YWH;
	Thu, 26 Jun 2025 11:23:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjoe-0000000BGzR-35Uz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 10:26:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 707AE43B08;
	Thu, 26 Jun 2025 10:26:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E7EC4CEEE;
	Thu, 26 Jun 2025 10:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750933608;
	bh=tRKFfC9HrDSF598h4BQsZtNeEtZI1IT9Ixq8S352lh0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=s9YUouQdw56PGfF6b9amz96v3ykt4m1wl5fCvmw5OvTpLkPnUOjpCG2oN+liTD0qx
	 MylsWrUVZfrcRpAkoPviDZUEvuv88VccACF8R14bx20illqAx1Sqz3R+l7asxkWBQn
	 Jj7W2Kttiq1liJBfAvDnIEC2xbNBwmxW5iY6yZMTaWf6G9k+EVaRrvzTHVxpotYA17
	 W4EMMZtfpJKAmb38r4fS9U2i3+Tzi9XHO38IEalTxvDb5IgTPV97CH+o08Ur+Vmd0e
	 Mq3YCrlaXARy0GHP6++jwpDGMAAueC24E9SCMKNqSSJ8GqVpLvMuCekhV8847YmFNQ
	 lX+3teZ8sVLxw==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 26 Jun 2025 12:25:55 +0200
Subject: [PATCH v6 04/31] arm64/sysreg: Add ICC_ICSR_EL1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-gicv5-host-v6-4-48e046af4642@kernel.org>
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
X-CRM114-CacheID: sfid-20250626_032648_795451_D77A4B98 
X-CRM114-Status: UNSURE (   7.64  )
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

Add ICC_ICSR_EL1 register sysreg description.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/tools/sysreg | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index fc17e19a738d..81b32f567ce3 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -3024,6 +3024,20 @@ Sysreg	PMIAR_EL1	3	0	9	14	7
 Field	63:0	ADDRESS
 EndSysreg
 
+Sysreg	ICC_ICSR_EL1	3	0	12	10	4
+Res0	63:48
+Field	47:32	IAFFID
+Res0	31:16
+Field	15:11	Priority
+Res0	10:6
+Field	5	HM
+Field	4	Active
+Field	3	IRM
+Field	2	Pending
+Field	1	Enabled
+Field	0	F
+EndSysreg
+
 SysregFields	ICC_PPI_PRIORITYRx_EL1
 Res0	63:61
 Field	60:56	Priority7

-- 
2.48.0


