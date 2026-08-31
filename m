Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5182C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YNgt9E5dT62iQ6N++2lAZPYPECzj+0RO9Z2kPmNzCYY=; b=Rc7Adx/qbgKjxeJDhbBuo6VI/U
	sQJfaIJOQMcHbrOgsZ/HzmxIvMCaGYpPEvZi99lTzU96VTdPODDh5pXNf92evX0mmxhrQs3qxgTlv
	DWvb6kpm8nhMdy9w6u4YJsHiJsz+5R/c19GxVVpPl+3scDW5cTm/TyG5V6NqXOtVcEuZYO2yqp0G6
	DtB7wkdrPZUPHw5Kb6lcutI05vT8/s85jjws+IjRhAr82zVP2Tz7fcHAEmHQujcV9oUb1Mu303cbW
	wnRtIrrOaXhdGbmYsZbjY8dKMZs7SJ4sp5ZDekW/55jh/NB9xNnVxluE5QJqV6dw/yk8Fj+SkZgjR
	ZHDBwNhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x145H-00000009tMV-0vpE;
	Mon, 31 Aug 2026 15:38:07 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x145E-00000009tJn-1sz9;
	Mon, 31 Aug 2026 15:38:05 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1x144x-0000000078f-0rPf;
	Mon, 31 Aug 2026 15:37:47 +0000
Date: Mon, 31 Aug 2026 16:37:43 +0100
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
Subject: [PATCH net-next v5 0/9] net: dsa: mt7530: modernise register access
 and add two DSA ops
Message-ID: <cover.1788190568.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_083804_543190_2A74072E 
X-CRM114-Status: GOOD (  14.55  )
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
The two remaining reset polls are converted to
regmap_read_poll_timeout() and the then-unused dummy poll machinery is
dropped. Open-coded register fields are converted to
FIELD_GET/FIELD_PREP. None of this is intended to change behaviour.

The last two patches implement .port_fast_age, which flushes dynamically
learned MAC entries on topology changes, and .port_change_conduit, which
moves a user port's CPU-port affinity at runtime.

The swallowed MDIO errors Sashiko flagged on v4 5/8 have meanwhile been
fixed in tree by "fix swallowed MDIO read errors" and "fix remaining
swallowed MDIO access errors", both merged into net-next. This respin is
rebased on top of them: regmap_* return values are no longer ignored,
which is what most of the semantic patches had to be reworked for.
---
v5:
 * rebase onto current net-next, on top of the two MDIO error handling
   fix series merged since v4
 * new patch 6/9 dropping the mt7530_dummy_poll machinery
 * 1/9: also revert commit dd52b3df25ed ("net: dsa: mt7530: serialize
   the regmap IRQ chip like every other user"), whose workaround the
   regmap's own locking makes redundant
 * 7/9: list STAG_VPID among the repaired macros, document the
   VTCR_VID() masking
 * 8/9: check the ATC command write and poll via
   regmap_read_poll_timeout()
 * 9/9: list EN7528 among the single-CPU-port switches
v4:
 * rebase onto current net-next
 * 5/8: zero the read-back buffer in mt7530_regmap_read() instead of
   initialising the result variables at every call site, as suggested
   by Jakub
 * 6/8: keep MT753X_CTRL_PHY_ADDR() as plain address arithmetic rather
   than converting it to FIELD_PREP() as suggested in review: the macro
   computes the MDIO bus address of the switch PHYs, used as the addr
   argument of bus->read/write and as an iterator base in
   mt7530_setup_mdio(), not a hardware register field
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

Daniel Golle (9):
  net: dsa: mt7530: move MDIO bus locking into regmap
  net: dsa: mt7530: fold mt7530_mii_write/read into mt7530_write/read
  net: dsa: mt7530: replace mt7530_write with regmap_write
  net: dsa: mt7530: replace mt7530_rmw/set/clear with regmap API
  net: dsa: mt7530: replace mt7530_read with regmap_read
  net: dsa: mt7530: drop the dummy poll machinery
  net: dsa: mt7530: convert to use field accessor macros
  net: dsa: mt7530: implement port_fast_age
  net: dsa: mt7530: implement port_change_conduit op

 drivers/net/dsa/mt7530-mdio.c |  12 +-
 drivers/net/dsa/mt7530.c      | 834 ++++++++++++++++------------------
 drivers/net/dsa/mt7530.h      | 221 ++++-----
 3 files changed, 530 insertions(+), 537 deletions(-)


base-commit: 1bb784eb6e38fd73143f021608e4ef3095d0c0d7
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.55.0

