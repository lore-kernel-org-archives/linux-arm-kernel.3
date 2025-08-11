Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9547CA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a/zRgNd+k/l8rezaEo/b4GJ3tZC8LPU16UMqdrMXbbY=; b=mmzgZaVMGwbN3gd2ZpuURTzLC7
	wsPAv05LVw/BANS5oTE9vIZ83S2peydzgY7hS/RFwadReaMYS33RE8iiZx8xvgYD7VJ9Ty8rUpUaJ
	fS2Y/PXYSlGUxa19P8KG5Zqk5LGXOGHBtLxb9O19C+IhBR7UzuD6HRTds88GXkaLFm4yO6ndL8LIC
	trN05OBovzmo8O83xvTwjLVesakQlFFYI15h9ok6R/tNXY7OPOqEEJzBTE65IUIGOsYhV8OZkzGSw
	mJHtTVoaolZshg8SoNudQcityTw1NUvrg0ezTjs95jGj+udwkvBnfs0D33KONngFvahSBjA7YpdfK
	CB9b4OlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacn-00000009CpD-2uCd;
	Mon, 11 Aug 2025 22:04:13 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXc3-00000008qA9-3j8G;
	Mon, 11 Aug 2025 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=a/zRgNd+k/l8rezaEo/b4GJ3tZC8LPU16UMqdrMXbbY=; b=CqEi4Bfg8Ylv8LU/VebBnS+0Wq
	El4pVziTBNoVZ1PqTcs/LEXfvkzNNgUkKCDV6RziIpI2Ma3xYjHntpIPBaVFyZACRtsGzqZ8pB82r
	rXYijs014y9SxWbK2h0QkcLy4noAdMxpphjXTTmtS/zBUoLkRL9p6BVPtXoDQ5/wnS/HrddCyFpY1
	AKi4qJZNWrNCd1c+v73WfHtC4wb2BPzJvJAyk9Z+gsYZI0/uEcMxMVuou+KGbnPFfpP1fctqfoiZ7
	d/EktjuSq8wT4c9C1sxd7NGaZl+lbJ6MjhooUrXkc1TgQAl5A28F48xVkOmgO/hN6AbuB6iDsscXs
	HZcqrkEQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47900)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1ulXbs-0003aE-1L;
	Mon, 11 Aug 2025 19:51:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1ulXbn-0003vT-0R;
	Mon, 11 Aug 2025 19:50:59 +0100
Date: Mon, 11 Aug 2025 19:50:58 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next 0/9] net: stmmac: improbe suspend/resume architecture
Message-ID: <aJo7kvoub5voHOUQ@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115115_927261_81A087C2 
X-CRM114-Status: UNSURE (   9.69  )
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

Hi,

This series improves the stmmac suspend/resume architecture by
providing a couple of method hooks in struct plat_stmmacenet_data which
are called by core code, and thus are available for any of the
platform glue drivers, whether using a platform or PCI device.

As these methods are called by core code, we can also provide a simple
PM ops structure also in the core code for converted glue drivers to
use.

The remainder of the patches convert the various drivers.

 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  | 74 ++++++++++------------
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   | 73 ++++++++++-----------
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   | 10 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     | 58 ++++++++---------
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c  | 68 +++++++-------------
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 12 ++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   | 73 ++++++++++-----------
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  | 64 +++++++------------
 include/linux/stmmac.h                             |  2 +
 10 files changed, 195 insertions(+), 241 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

