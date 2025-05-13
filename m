Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3B7C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 18:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHuBxSVI3miYGq7VQcz5Dk/EGYJMTC0E0UPB/7Z89ow=; b=CcYfGXFu2ZIu2+sdoYPLhNHlQD
	YyoCjrJqyg0pbPXIeamoygYr0ah5+SLIhsRTPjln/rx/VhJ8/5BaiPSFgpWqWxMSRAMipoz+EqNmO
	Jo8TpTJ5y3vpaljSVSS/qUhepN/SE+VeUVVuJ6hz2f7879ZtJbsnbqYI++HplbJF+ueUNa97p4NZ/
	GtGIey0uaGC3kxHiDNLht3BUY9VjRZTH9y+yaZfQgDO9NoN74Ng/PMqd8A6F4yUO9yL1Ll1zsTrma
	jv6pFisuyH1F3PREeaJ98OhZ5Eoo5wSC74Ybt0lrZ9mVXDjPvhwqJQCEC7PcjPoWO05PWKTWCwR9J
	zN6VWVXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEuiu-0000000DIMG-2Jo8;
	Tue, 13 May 2025 18:51:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEtlu-0000000D9dq-0RXu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D097043F08;
	Tue, 13 May 2025 17:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E23C4CEEB;
	Tue, 13 May 2025 17:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747158629;
	bh=Dhr0rsx9WpeMa8aspdbgl7YO+d4d6KcEE2+waQCoYbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Mx9WIApjEVmPhH5F185IKRqIGyWwA3dV6NvRXTmivOsfbP1MoHXf1rzIECrRuJCeh
	 sKZisWOzwMSzmu/i5k8BoJB4GW3WgBzwTi36Ue7AS9uPS51rT1430OO2PGwB0ge+Jc
	 atpJQS3stUmP871lQ4zz8tt1ALjd9BLuUPa1ZtUPinjF2+Gjt8UwxeucewV5eFuBxS
	 qS316/4AN1W4WLHleRVkXd7bkAEHJeaMqa9XFSR3J4Di2i/8WMCqHGnlSCH1LfaEPv
	 zTlF5flnLb2J9awHq9uoFqY9uYONpOXB5mLjo5vSoOy4Fl4IHs4GISk5mBNvNvh6DO
	 vo01EgHBlvHGg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Tue, 13 May 2025 19:48:19 +0200
Subject: [PATCH v4 26/26] arm64: Kconfig: Enable GICv5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-gicv5-host-v4-26-b36e9b15a6c3@kernel.org>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_105030_168416_584DD0F8 
X-CRM114-Status: UNSURE (   8.90  )
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

Enable GICv5 driver code for the ARM64 architecture.

Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a182295e6f08bfa0f3e6f630dc4adfe797a4d273..f1b3c695b376717979ae864865238ae12ad65ca2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -128,6 +128,7 @@ config ARM64
 	select ARM_GIC_V2M if PCI
 	select ARM_GIC_V3
 	select ARM_GIC_V3_ITS if PCI
+	select ARM_GIC_V5
 	select ARM_PSCI_FW
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS

-- 
2.48.0


