Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AB3C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 04:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w4ktkmX/oV/YcsFQrJqdZcGSjC+1OXGa7MfVYNr4Ih0=; b=K9Um9hUOYCiYOTkX+LRzHjLxxp
	XwiiVgBI6bpxGjanQlOhqUH9CODWw+Bkhdl4T7hTWKXDKEsCOwJW9BYGVFFfwaJzheX8HC4bz8Ji6
	W0wkhOljZK0xzw1PgxUtNlHJW88jDorgQ0Lq3EDiwdkQitKnPHL0Rigk3P4w41TCkM2x4fMUIGzaA
	vH2+hbf62WGTaeJGTbFt0cWhsCfcbcZVAvTzQ185/s9bGMBTWPY66R/kH8NGOEUT9nDvsDBm3xDfu
	n1JbgS1BpcUBvAnalRPNPWaQWutfQ6JEo1ncmZmVD2vGk/yAKFZ3gEUiHrSjxeGv1c06riJEF1xH+
	sGg7MV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZno-00000004PSl-2LAR;
	Tue, 28 Jul 2026 04:52:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woZnm-00000004PRc-0zvr;
	Tue, 28 Jul 2026 04:52:28 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1woZnU-000000004wL-1Kv5;
	Tue, 28 Jul 2026 04:52:08 +0000
Date: Tue, 28 Jul 2026 05:52:05 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 0/3] net: dsa: mt7530: fix swallowed MDIO read errors
Message-ID: <cover.1785213071.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_215226_278136_F05BCF16 
X-CRM114-Status: UNSURE (   9.01  )
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
terminates polling on read errors and propagates them.

The cleanup series depending on these fixes will be submitted to
net-next separately after the next net/net-next merger.

[1] https://lore.kernel.org/netdev/cover.1784481922.git.daniel@makrotopia.org/

Daniel Golle (3):
  net: dsa: mt7530: check bus->read() errors in the MDIO regmap backend
  net: dsa: mt7530: error out on failed reads in ATC/VTCR command
    polling
  net: dsa: mt7530: error out on failed reads in MT7531 PHY polling

 drivers/net/dsa/mt7530-mdio.c | 11 ++++-
 drivers/net/dsa/mt7530.c      | 86 ++++++++++++++++-------------------
 2 files changed, 47 insertions(+), 50 deletions(-)


base-commit: a50eba1e778ad4da5b6f9ddbbf57dabbea59bc05
-- 
2.55.0

