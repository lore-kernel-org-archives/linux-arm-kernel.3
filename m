Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D957CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 09:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WlnjW2BpfjiM63UcojgauSdWRDJorCLGfJ2ZQigHONw=; b=D9hbLMdnZDMavA19YUCsnKR2q6
	gtQBKRQRnJ3awY36sToxqMc3UXIbO4jToAV79wt0jtlb/TvtVPnS/cq3/vmCUwz9VkNba127uhR+Y
	OqVnxeix2oi1CNMeMMjvDT86sBdZPbKF3Z0HDfX9YnTWP84m8aN08mcVoVoLdQ20/h7mjR4Y82j4F
	yPYDfvkgH8MGbNTwX9aOEuT8Y1KdWxbOwrKq158EGhUfuaKI8oohsIaKADcjtSTkcZswk5gOhx/H4
	twWBfM4g6u/FjLxaFOf6dhJbpj1wG4w2Ejmi5QeQn4o6zTwKGOaDC8ciJf6V59O8qMVjPgkX7WNC2
	XPMRp8yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIl0-000000082HV-47GZ;
	Wed, 12 Mar 2025 09:52:10 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsIUr-00000007zYB-1OX6;
	Wed, 12 Mar 2025 09:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WlnjW2BpfjiM63UcojgauSdWRDJorCLGfJ2ZQigHONw=; b=X7IJpKnrsZz4mMD/Y0Imd0BscY
	ScXYdYmGGHGxceZABGH59dKp6Op9aD6N+QknONUFwhjdzmLrB1JoE+PsYvugL8vWxnuFbfKUx7XAi
	VEDp3Oc4nYVDL+5TQHgU0c7U6wQHIPi/qVz5A/1YrKHwhemAqcu9zAFG3SGbdPFS5aa15Vy366BfO
	UTmmU1lHl/mLEjniFwD3m95kk4T8lhPNCKvVHZrwttWqEeGkI6wl87mQHSzC85vsZ6i3VTH1dK8gH
	B6/yYn4HNBY771Peqn7tumWy1Hpmw1YBOpmcgSdAkcaWU4TmmMiXHEDJDOgr2DM5haKaqBE4GBjzs
	mpTA2naw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:38170 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tsIUS-0005Hh-0g;
	Wed, 12 Mar 2025 09:35:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tsIU5-005vGR-4c; Wed, 12 Mar 2025 09:34:41 +0000
In-Reply-To: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
References: <Z9FVHEf3uUqtKzyt@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jose Abreu <joabreu@synopsys.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	netdev@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Samin Guo <samin.guo@starfivetech.com>
Subject: [PATCH net-next v2 4/7] riscv: dts: starfive: remove
 "snps,en-tx-lpi-clockgating" property
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tsIU5-005vGR-4c@rmk-PC.armlinux.org.uk>
Date: Wed, 12 Mar 2025 09:34:41 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_023529_377915_0E38AFA7 
X-CRM114-Status: UNSURE (   9.50  )
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

Whether the MII transmit clock can be stopped is primarily a property
of the PHY (there is a capability bit that should be checked first.)
Whether the MAC is capable of stopping the transmit clock is a separate
issue, but this is already handled by the core DesignWare MAC code.

As commit "net: stmmac: starfive: use PHY capability for TX clock stop"
adds the flag to use the PHY capability, remove the DT property that is
now unecessary.

Cc: Samin Guo <samin.guo@starfivetech.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..a7aed4a21b65 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -1022,7 +1022,6 @@ gmac0: ethernet@16030000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&aon_syscon 0xc 0x12>;
@@ -1053,7 +1052,6 @@ gmac1: ethernet@16040000 {
 			snps,force_thresh_dma_mode;
 			snps,axi-config = <&stmmac_axi_setup>;
 			snps,tso;
-			snps,en-tx-lpi-clockgating;
 			snps,txpbl = <16>;
 			snps,rxpbl = <16>;
 			starfive,syscon = <&sys_syscon 0x90 0x2>;
-- 
2.30.2


