Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0A5606A325
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 01:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UrBqS2P7;
	dkim=pass (2048-bit key, unprotected) header.d=cjdns.fr header.i=@cjdns.fr header.a=rsa-sha256 header.s=dkim header.b=tWTRG/IS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=lLmtu+5/W2Rqcj5M+1JbfEqak1TRlWcazl6OlaI9MjQ=; b=UrBqS2P7DsJVALbppVfXR8DjAy
	7uYCG6fcPirSX7YSL+nVcYBkZ4WMzGmFJ+d9ogM17MpUxEoBt2FRzWY+cg9fovrb6AM4qeYEWIdcP
	WGdoHQv0JcR+zIsqhx/9rSUxZcC49cnYHhkhpr/qlsQSMW2b7XHb1ktSRo+1Z4QfDmi4fnZ3RAKO2
	AYrfs04r+3PC3Ef+4T6dVG8+xRqJbaipZFGINBCjEo9Rogu84mbeumJdvq00dOg+AfSidBv8IPkDA
	3yKCbAUv7jQzt4CoElmvoA/nGCIDP04HSy4+vRRz/52tQ11q10oQN0hU7B9wdqDejRYj8RWS0nflD
	/wSbZSsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEe-000000060uA-1U9A;
	Wed, 28 Oct 2026 01:13:48 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLsEa-000000060t3-3epP;
	Wed, 28 Oct 2026 01:13:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A557E14893A;
	Wed, 28 Oct 2026 02:13:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1793150017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=lLmtu+5/W2Rqcj5M+1JbfEqak1TRlWcazl6OlaI9MjQ=;
	b=tWTRG/ISeKkRPUGx/qKAyPTeBrg3mKS+zt2GZ9uEQfCz5EFCWyVxCIeNf71kYU9vyE3aYc
	dCw5cx/4gkTJJbWfPM368b6//FQQd678sv9qmBhgJdM/2NQfVo8SNatfV8Tx49OLJSzODR
	e4LesBYQkZaEQNdAqKKdbpIt0jvLlykUb5+CfozNW4uORlcRAAVFYcyq4cDL6Hjcbz172a
	FGZ01IkaZCASCikneRtbEExMzAeNvO9rYONOqcOIaHd0VXl8wc5zjmBvYWmtIJ/2HSvuRy
	ofbB1l2jN7XdXSGO7Q1qx68DMsNZUdPPXiATpjmEPvwlKDberfmURoHWsUruvA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	linux@armlinux.org.uk,
	arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com,
	dqfext@gmail.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com,
	b.larsson@gmx.com,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v3 0/7] net: dsa: mt7530: support EcoNet EN751221
Date: Wed, 28 Oct 2026 01:13:10 +0000
Message-Id: <20261028011317.1557238-1-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_181345_315283_4B7D69CB 
X-CRM114-Status: GOOD (  15.54  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,T_SPF_TEMPERROR autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The EcoNet EN751221 has a unique switch configuration. Every chip made
with an EN751221 die has at least one on-die MT7530 that is MMIO based.
This switch has 3x 10/100 ports and 1x gigabit port.

Some popular chip packages such as the EN7513G and EN7526G have another
MT7530 implemented as a multi-chip-module that connects to port 5 of
the on-die switch and is controlled via the MDIO controller integrated
in the on-die MT7530.

In this configurations, the upstream switch is put into a "passthrough"
mode in which all traffic is forwarded between port 5 and port 6
without altering its DSA tags.

Furthermore, since the DSA core does not call mt753x_setup until all
switches are present, and the downstream switch only becomes available
when the upstream switch has configured its MDIO controller, the MDIO
controller setup on MMIO implementations must be done before
mt753x_setup, or else it will never complete.

Finally, the on-die switch and the MCM switch connect via a TRGMII link
which requires calibration. In order to calibrate this, PLL adjustment
must be possible on the on-die switch, necessitating changes to the
core_(set|clear|write|rmw) functions to support MMIO implementations.

Solve all of these issues, add the TRGMII calibration, and add support
for both switches.

Since this patchset will probably be subject to some discussion, please
consider accepting any patches that are non-controversial since it will
make future re-submissions easier.

Thanks!

Changes since v2:
* The MCM switch previously identified as econet,en751221, similarly to
mediatek,mt7621, however since econet,en751221 is already used for the
SoC compatible, is it changed to econet,en751221-gswitch. The name
"gswitch" is chosen as there's apparently no standard and for EN751221
this is intuitive because it is the gigabit switch used in
implementations with a "G" in the chip name.

* Do not use a special mt7530_switch_ops for passthrough mode, instead
detect passthrough mode in each function and exit early so as to avoid
errors when trying to make a configuration switch-tree wide.

Changes since v1:
* Move mt7530_setup_mdio_irq out of mt7530_setup_mdio because
mt7530_setup_mdio may be called before mt753x_setup

* Do not return error in mt7988_probe if mt7530_setup_mdio fails because
doing so leaks the DSA switch registration, and in any case
mt7530_setup_mdio will be called again.

* default_taps_ondie not being used en751221_trgmii_cal_ok unused args

* Use clk_drvp / clk_drvp instead of drvp / drvn (typo)

* en751221_set_tx_drive ext values too large for fields - values taken
from reference implementation, reduced from 16 to 15.

v1: https://lore.kernel.org/netdev/20260909140346.2861572-1-cjd@cjdns.fr/

Caleb James DeLisle (7):
  net: dsa: mt7530: get ctrl phy addr using a function
  dt-bindings: net: dsa: mediatek,mt7530: add passthrough mode
  net: dsa: mediatek: add support for passthrough mode
  net: dsa: mediatek: support PLL setup on MMIO MT7530
  net: dsa: mediatek: support MDIO switch downstream of MMIO switch
  dt-bindings: net: dsa: mediatek,mt7530: add econet,en751221
  net: dsa: mediatek: support EN751221 switch

 .../bindings/net/dsa/mediatek,mt7530.yaml     |  50 +-
 drivers/net/dsa/mt7530-mdio.c                 |   1 +
 drivers/net/dsa/mt7530-mmio.c                 |  10 +-
 drivers/net/dsa/mt7530.c                      | 609 ++++++++++++++++--
 drivers/net/dsa/mt7530.h                      |  46 +-
 5 files changed, 663 insertions(+), 53 deletions(-)


base-commit: 734bef548a96e8774d6eef5dfa2026c6edc4e80b
-- 
2.39.5


