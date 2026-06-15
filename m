Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63507CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 05:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hfhSFmrqeIJ881PPP8kTT97v1lvgEEp6M1yNJS0MBSA=; b=gBvHQfJArVugOgjRT6tbhFd2vU
	Sk8suWqBqJBctxTEe+r69d5gS5v9Yz3yCyrUHNQJGaGLOo2GGb/UfTldomYtPJRJmWE//yDi/OjqF
	4/94XYjdKESPpHlCMMmiQuqy9OwMu1KSPsAO5xPrA/pbK1ftNGWAB1Y4ilOE4BGh7n/RZCBRDPkfR
	O3j9NtBFCaohsm3zkaAAwqnKxjR6XSATyLnkHuQM73fjSxNLGzR/Kxph68oGNRCqRE09vgKBLklB4
	gdjXdaQudA2muwftcO9J+bqzaqjM0jMxIHeOIRvaXjLR3+ghHFd0e3SO0OyeyNNlscUY8bfQH6TaB
	SFuKAtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzl7-0000000Dbh6-09Vx;
	Mon, 15 Jun 2026 05:21:17 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYzl5-0000000DbgZ-1SIK;
	Mon, 15 Jun 2026 05:21:16 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYzko-000000000vI-1viC;
	Mon, 15 Jun 2026 05:20:58 +0000
Date: Mon, 15 Jun 2026 06:20:55 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 0/8] net: dsa: mt7530: modernise register access
 and add two DSA ops
Message-ID: <cover.1781500517.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_222115_409100_D4D5C1B2 
X-CRM114-Status: GOOD (  10.60  )
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

The mt7530 driver carries its own register accessors that predate the
regmap conversion and now largely duplicate what regmap already
provides, including locking. Most of this series removes that layer.

It first moves the MDIO bus locking into the switch regmap via
.lock/.unlock callbacks, matching the PCS regmaps, so any path reaching
the regmap is serialised automatically. With the wrappers no longer
adding locking, the thin mt7530_mii_* indirection is folded away and the
remaining accessors are replaced mechanically with the plain regmap API,
using the coccinelle semantic patches included in the commit messages.
Open-coded register fields are then converted to FIELD_GET/FIELD_PREP.
None of this is intended to change behaviour.

The last two patches implement .port_fast_age, which flushes dynamically
learned MAC entries on topology changes, and .port_change_conduit, which
moves a user port's CPU-port affinity at runtime.
---
v3:
 * 5/8: initialise register read-back variables to 0 so a failed
   regmap_read keeps the previous read-as-zero behaviour, and use u32
   for the value in mt7530_setup_port5
 * 6/8: name the age timer field AGE_TIMER_MASK and document the
   corrected ATC_HASH/VTCR_VID field macros
 * 7/8: serialise the port_fast_age ATC flush under reg_mutex and log
   on timeout, align a define, and correct the commit message which
   wrongly claimed per-port parity with b53/realtek
 * 8/8: populate the netlink extack on rejection and refuse a conduit
   that lives on a different switch
v2:
 * fix stray 'static void' left-over in 4/8 which had a fix accidentally
   folded into 5/8 (byte-identical state at 8/8, but bisectability is
   restored)
 * extend port_change_conduit op commit message

Daniel Golle (8):
  net: dsa: mt7530: move MDIO bus locking into regmap
  net: dsa: mt7530: fold mt7530_mii_write/read into mt7530_write/read
  net: dsa: mt7530: replace mt7530_write with regmap_write
  net: dsa: mt7530: replace mt7530_rmw/set/clear with regmap API
  net: dsa: mt7530: replace mt7530_read with regmap_read
  net: dsa: mt7530: convert to use field accessor macros
  net: dsa: mt7530: implement port_fast_age
  net: dsa: mt7530: implement port_change_conduit op

 drivers/net/dsa/mt7530-mdio.c |   9 +-
 drivers/net/dsa/mt7530.c      | 823 +++++++++++++++++-----------------
 drivers/net/dsa/mt7530.h      | 209 +++++----
 3 files changed, 541 insertions(+), 500 deletions(-)


base-commit: 2319688890d97c63da423a3c57c23b4ab5952dfc
-- 
2.54.0

