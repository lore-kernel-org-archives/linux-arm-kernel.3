Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97855C55164
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 00:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6VEIGoM0CTqq1w7BV8EITL2hcdo71wvSqgOUEq1fKk=; b=DqHsdQXRlxesTK31HTO989Mtfw
	26Y4DVu/WEBXFEDELSHPWWJdn2VIR/ixvYdEq6fOjMpcPR9dpalewYY221eErErhTTCh1ApiWA/gV
	OpruLVXq1HVw45AH2734UXx5osdtmaX5D6MH2gU/Gluu0zY6t+DZHRrXIBTiPTrL/F5px7kRJbySO
	KhTiZUq6kCiL2JZ0HtPrPouOdB5ve81X2alnUkckD2yZBW99BMPzAiJglv/CWrOAQCiHf5OJjte+s
	wBzEfTb3dP5/BOG8HcTYQjhsqBu8oJyxzX9BxjEMA1AXI6FmBhR1vQXP4UKH+4Hj1X8RSHJjWRyE/
	4cFkcBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEQP-000000099UL-2BVg;
	Thu, 30 Jul 2026 00:15:01 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpEQM-000000099St-3jgI;
	Thu, 30 Jul 2026 00:15:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wpEPx-000000002eX-3Jjt;
	Thu, 30 Jul 2026 00:14:33 +0000
Date: Thu, 30 Jul 2026 01:14:30 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexander Couzens <lynxis@fe80.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v2 0/5] net: dsa: mt7530: fix swallowed MDIO read errors
Message-ID: <cover.1785368701.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_171458_934033_6887F970 
X-CRM114-Status: GOOD (  12.89  )
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

While working on a register access cleanup for the mt7530 driver, the
Sashiko AI reviewers flagged long-standing error handling gaps in the
driver's read paths [1].

The MDIO regmap backend truncates negative bus->read() errnos into u16
register halves and returns success, handing garbage data to callers
and to read-modify-write cycles which then write it back to the switch.

The ATC/VTCR command polls and the MT7531 indirect PHY polls consume
reads through a helper which returns 0 when the underlying read fails.
A failed bus transaction thus clears the polled busy bit and is
mistaken for command completion, defeats the subsequent
ATC_INVALID/VTCR_INVALID checks the same way, and lets the indirect
PHY access functions return garbage PHY register data.

Fix the backend to propagate bus->read() errors, and convert the
command and PHY access polls to regmap_read_poll_timeout(), which
terminates polling on read errors and propagates them. The driver's
legacy read helpers return plain u32 values and cannot convey errors,
hence the affected reads switch to the plain regmap API the helpers
are built on, while all other accesses are deliberately left
untouched; the cleanup series converts the rest of the driver.

The Sashiko reviewers went over v1 as well [2] and found that the same
unchecked-read pattern recurs in a couple of other places, and that the
read-error propagation above widens a pre-existing gap in a PCS driver
consumer; patches 1-3 grew companion fixes for those. They also found a
separate locking gap between the switch regmap and its IRQ chip, fixed
in the new patch 4 with its own Fixes: tag.

The cleanup series depending on these fixes will be submitted to
net-next separately.

Changes since v1:
 * 1/4: also check the identical unchecked bus->read() in core_rmw(),
   and fix mtk_pcs_lynxi_get_state() (drivers/net/pcs/pcs-mtk-lynxi.c)
   to check regmap_read() now that a failed read can leave its output
   unwritten instead of holding truncated-but-defined garbage
 * 2/4: drop the redundant regmap_read() after
   regmap_read_poll_timeout(), and print ret in the error messages
 * 3/4: also check mt7530_mii_write()'s return for the PHY_IAC command
   word in all four PHY access helpers, and print ret in the poll
   error messages
 * add 4/4, calling mt7530_mutex_lock()/unlock() around the regmap IRQ
   chip's own accesses via handle_pre_irq/handle_post_irq/
   handle_mask_sync, the same driver-provided locking every other user
   of the unlocked switch regmap already goes through, instead of
   adding a second regmap instance

[1] https://lore.kernel.org/netdev/cover.1784481922.git.daniel@makrotopia.org/
[2] https://lore.kernel.org/netdev/cover.1785213071.git.daniel@makrotopia.org/

Daniel Golle (5):
  net: pcs: mtk-lynxi: check regmap reads in mtk_pcs_lynxi_get_state()
  net: dsa: mt7530: check bus->read() errors in the MDIO regmap backend
  net: dsa: mt7530: error out on failed reads in ATC/VTCR command
    polling
  net: dsa: mt7530: error out on failed reads in MT7531 PHY polling
  net: dsa: mt7530: serialize the regmap IRQ chip like every other user

 drivers/net/dsa/mt7530-mdio.c   |  11 ++-
 drivers/net/dsa/mt7530.c        | 170 ++++++++++++++++++--------------
 drivers/net/pcs/pcs-mtk-lynxi.c |   5 +-
 3 files changed, 108 insertions(+), 78 deletions(-)


base-commit: 51b093a7ba27476e1f639455f005e8d2e75390e4
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.55.0

