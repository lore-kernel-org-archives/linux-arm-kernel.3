Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC19CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 20:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B+a1ME/x3gSn6nj8YvTxNLI7sk0XLcRqnA4q/AWaw+o=; b=VNWtm7WfHz1QxuP1u/T/Vy1aeF
	ZbATstV//hgdawVaMLme/ZXyo3gTG8z1ks3Y/A7m7VrtvwgF3oXE4QBImKrb833cHebvoKBDd+rLj
	W76FLGzdnqTWdwZOadvQojJO2qGeFLJ4Q/+Fw/T1N2x0Qx9BT1EAmbnROfIamd/7USZKz+XUTdDvA
	UJFvD4VH8Jf46pdViv+HEceJ7/rpR1M83zdJHz0t9djRKs1wBRFfSFVSlmEoQbR9za+PiiIjpvVUO
	C3xMJ7KyWsIJtOZpD+BUMv18DEuc3NnTe/REkDztFNyUr2xLS1mq18oS+skj1SYU5BTgyVTSuJIsc
	lovIr7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo6So-00000008crc-1E7Z;
	Mon, 18 Aug 2025 20:28:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo5GA-00000008TdJ-2LQJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 19:11:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A60E56111C;
	Mon, 18 Aug 2025 19:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5769AC4CEEB;
	Mon, 18 Aug 2025 19:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755544269;
	bh=OZK5CyXw1PInn/yqI4pDY8A9Y5pwSG9xCax8VqYzUdI=;
	h=Date:From:To:Cc:Subject:Reply-To:From;
	b=BSQq1w5JizmpSZUf4s5+tSO15Q/XuPUlIXNgf1lPgC6Pnth2YBndwPcZNe43Yz22l
	 aiAO/8djv6cgRjptjNlsO74pfWV92BT333yfBGhdxxO98IDtl22SSCsx3zVYv4NqzB
	 +BYzAH6+UQvq8qtZXQQ3H0ovg0z8at8SU1kKuzNcG+QMQnJGJclFDJwzkORw/cyvpw
	 XzRJ6qLivhVK38NONmfhs3MqKXQMUPujPlT2Tk37jMqef1ss8NnQOXHk83xn7Ll5mD
	 nyG/zTRJhjyz+DA7kC0kkMqTnXtCU4WEEjdG0E10KmP7TTsNiGgMRdmHrMmelN8F1f
	 tOfVwQIQBekwg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 07D41CE0CC4; Mon, 18 Aug 2025 12:11:09 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:11:09 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH RFC] net: stmmac: Make DWMAC_ROCKCHIP and DWMAC_STM32 depend
 on PM_SLEEP
Message-ID: <7ee6a142-1ed9-4874-83b7-128031e41874@paulmck-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Reply-To: paulmck@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello!

This might be more of a bug report than a patch, but here goes...

Running rcuscale or refscale performance tests on datacenter ARM systems
gives the following build errors with CONFIG_HIBERNATION=n:

ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-rk.ko] undefined!
ERROR: modpost: "stmmac_simple_pm_ops" [drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.ko] undefined!

The problem is that these two drivers unconditionally reference
stmmac_simple_pm_ops, which is not exported to modules in kernels built
without CONFIG_PM_SLEEP, which depends on CONFIG_HIBERNATION.

Therefore, update drivers/net/ethernet/stmicro/stmmac/Kconfig so that
CONFIG_DWMAC_ROCKCHIP and CONFIG_DWMAC_STM32 depend on CONFIG_PM_SLEEP,
thus preventing the dependence on a symbol when it is not exported.
With this change, rcuscale and refscale build and run happily on the
ARM system that I have access to.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Choong Yong Liang <yong.liang.choong@linux.intel.com>
Cc: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: <netdev@vger.kernel.org>
Cc: <linux-stm32@st-md-mailman.stormreply.com>
Cc: <linux-arm-kernel@lists.infradead.org>

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 67fa879b1e521e..150f662953a24b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -146,7 +146,7 @@ config DWMAC_RENESAS_GBETH
 config DWMAC_ROCKCHIP
 	tristate "Rockchip dwmac support"
 	default ARCH_ROCKCHIP
-	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
+	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST) && PM_SLEEP
 	select MFD_SYSCON
 	help
 	  Support for Ethernet controller on Rockchip RK3288 SoC.
@@ -231,7 +231,7 @@ config DWMAC_STI
 config DWMAC_STM32
 	tristate "STM32 DWMAC support"
 	default ARCH_STM32
-	depends on OF && HAS_IOMEM && (ARCH_STM32 || COMPILE_TEST)
+	depends on OF && HAS_IOMEM && (ARCH_STM32 || COMPILE_TEST) && PM_SLEEP
 	select MFD_SYSCON
 	help
 	  Support for ethernet controller on STM32 SOCs.

