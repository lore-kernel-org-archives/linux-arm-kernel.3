Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B78CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 01:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rrnscf3O8b/Hf3PVKTiI754X5pRT4pfCH7gr/VCW0Tg=; b=HRn46jHBaarMN4bjyclK2DTt2s
	o0FJHw+oDYI6/qtiHejHHgHlqVEBAemRfkdvVTdIwEJRLZeAvbHS+d4M/JhPDJ/3xs9cTdu0k8pyw
	6mpxztCKKRlC+FkooLFf2/xmXBF3KGXQz0OmvRKH5xOSFiOQH9hE67m+HnDOvemIRqBCUvWWNlT/T
	+CBopXDRUbLvg83WlL/HRQjGLcGXko+LyVeoyJpEx+ZH6YswWkhkaUv9t96iEvwdeTS6i0l+ei868
	EeXwFIBrusbbA2stb6y9KcbriRWWL9bgk67slEKIjCUKIpZS8gqv1yVrnKxkDlWED0RJPsMNNATYK
	ZxozfyOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCty-0000000Brwy-2Edo;
	Sat, 13 Jun 2026 01:11:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCtv-0000000BrwA-3gxi;
	Sat, 13 Jun 2026 01:11:09 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wYCtg-000000007J7-2WZo;
	Sat, 13 Jun 2026 01:10:52 +0000
Date: Sat, 13 Jun 2026 02:10:49 +0100
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
Subject: [PATCH net-next v2 0/8] net: dsa: mt7530: modernise register access
 and add two DSA ops
Message-ID: <cover.1781312667.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_181107_943671_8C9348D2 
X-CRM114-Status: UNSURE (   8.85  )
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
 drivers/net/dsa/mt7530.c      | 791 +++++++++++++++++-----------------
 drivers/net/dsa/mt7530.h      | 209 +++++----
 3 files changed, 517 insertions(+), 492 deletions(-)

-- 
2.54.0

