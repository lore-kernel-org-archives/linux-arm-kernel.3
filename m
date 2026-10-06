Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769BECA6001
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 12:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iwlFVHZA6ubrLm3XzWv0ZwVjTMu5isvDaU+jx/MqOk=; b=r/MGiXaFQ3MHvcPiyhjWz11CLM
	pqfpwsixJOnHCbDoi27WLZvq4d+2WAEWsVtPpa44QdZ/jyS9XxPl85m6sR0lAJUizFXtWpV+jVDes
	5wtEQ3CPgIlh6THbwcNUYg+gpSRM+EDRaHPCxlYSo3M8dwVtrZd36rhx9lZUWKjBaoGGmca8Xnzi9
	H2346Pz/St/Y1FKMA/uai3vglyPl50qIkzXjtzki+Cp0hExC5c9SYPHsuVddn+BW8QD3BDhJQYvQB
	7KJNnBPjlVA1Tn+g7OBpHoVblffZwcZ/l3e9UCbFl/z8IZMCON1DyD9jT4YJtACVg4DRqk5RStskJ
	YbwkYagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4aF-00000000nG3-133b;
	Tue, 06 Oct 2026 12:47:51 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE4a6-00000000n9U-3vxb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 12:47:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so13196045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 05:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1791290861; x=1791895661; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iwlFVHZA6ubrLm3XzWv0ZwVjTMu5isvDaU+jx/MqOk=;
        b=e+e6JGl9eNVM9ZCy6pVfDirNkNgtWQ8QOA4p/aZ3z7AcAKRu8YdW4M1ZBhXTBZtboK
         hNPJ0SbA+6E3aA4S7290F7rqsGmL+jPbHu6yveUCmFA/gSxsKUMZuZ+kXtJZmf4h7zhY
         9T6wa0VJgN/AIOq5C0Y2l+rwswlRp5eT9wS1ksvB2cGMFosh2r4MJRs8OV+gsAfZe32I
         /ktvXZ7HbXwzqldqjiwaE94x2EJUbcieX0PV7wq59gobd/9+oiRjXKlvQwUIHxw8eMZd
         uWUvaDjs3rJDONuFEjfLHe8N6kO++Uh/lYUPPfE4vdscEf8S33UFKLfHJBCzWdBgCpki
         JMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791290861; x=1791895661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iwlFVHZA6ubrLm3XzWv0ZwVjTMu5isvDaU+jx/MqOk=;
        b=goiX76Ujeuc8PNtHanqtay/6PTAfMQ1WqXaJxmzEuS6Ew5RmRQB+3YwjNkaKptsszX
         nUZ75KCL/MhVI+KjnGVfxGErLfmh/TnOE7VNzuFi4bJv5txCZ2t1nLFCp4vNmucV3asV
         6uIPAK9EDvLDsmv+Xr5436v0v75iMhbZv7kTCFble5GrvWd7RfyiFDrTHEJ9VrL+L8i0
         COOEj6I4WB5RSI/TPCyLSTjUXbklF0hxnqwlyjFKspjTT5pODWfXuEV31wZCluxVaUAv
         wIwUFon2d633UXXKtQC5GXuhjCDNkRCBvS7rCiC9Qkdt2X6QaocrWsFbgPRVxy1FEeBu
         iMkA==
X-Forwarded-Encrypted: i=1; AKwUvBxV0ZRuKajqA3C0TfqUVKXCaeDf4eUQaf7qLJKSFK7d+3QMJHYWLdvG0s4e4A0sheWG3rbtdWHryhj1H7AfFk+D@lists.infradead.org
X-Gm-Message-State: AFuF++nLOiZ3VSI0aqIPSHi3UoRv0wrkZSoaMrBMlFrh+ArZ+cb1VRsz
	DoPpWc7vdLEr60qjys87geOnqD2966EdTYShuuV+giacW90BFyXyboNdFbECAa/o0hA=
X-Gm-Gg: AYBFou24HtFp5mHWgkh8gB3Mk5G5blUhnx9rvLLdQWdG1YRwoZmZmtwi6LWNNqRYDOl
	DOyrupRXV3VixPvEzm/bEdQhnjVdqpf1zPr1Do4jqd6R1AeePPh+mTE/hydUC3//wO4rCADhIC6
	KPtPacwDW3OH7FSRJbVfC5zuzcaSYRq1+dSYvEQ/uaaNvEDJb0Y2y2R/FyvUpU4nCjD57QLt1KS
	KSMN4RB3VKxpb1+2jVYdjKMM7/8ikm4Jxhb5yTqXXImg4FhILt8fprhXsb0VC/TyOrTnpqVddJr
	tpiDOEboFjJmFLbUbbSk/p0IBTb5O/y46nQH3cP4fOzOhDk1JAyxCr+uwXxRAkNFsLC9G5nvNMM
	PnWdKXU2hM+1TSBy1dlpwQzVbOTnGX9tZrL8dN/8dWr7oEfdrRPQHXvix3gAqhgOD6vQmfglY1j
	LM/yEW+7ehG45ulq3nCOTxBu1x8YwWWci8ouobtGjnxeKffcR8b0ePUPaPoV51
X-Received: by 2002:a05:600c:46d3:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-4a17b563aabmr22286165e9.33.1791290860958;
        Tue, 06 Oct 2026 05:47:40 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622b4685sm9722003f8f.41.2026.10.06.05.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 05:47:40 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v6 2/3] net: phylink: wait for PHYs that are known to probe late
Date: Tue,  6 Oct 2026 15:47:30 +0300
Message-ID: <20261006124731.1528963-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006124731.1528963-1-f@lex.la>
References: <20261006124731.1528963-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_054743_132910_B0F1A821 
X-CRM114-Status: GOOD (  41.85  )
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

A PHY that needs firmware from the host and whose driver has not bound
when the MAC sets up its port is either taken by the generic driver,
which cannot drive it, or not found at all; a MAC that connects once at
setup, as DSA does, gets no working PHY on that port for the rest of the
uptime. The case this reaches is a driver built as a module on a
filesystem that is mounted after the MAC probes. Let the PHY declare it
with needs-host-firmware and, for a MAC that opts in with
phy_may_probe_late, poll until the driver binds instead of failing. A
driver that has bound is not covered, whatever it does about firmware
afterwards. Neither is one whose probe has already failed: the driver
core does not retry it, and the poller cannot tell that apart from a
driver that has yet to load, so it keeps polling.

Deferring the MAC's own probe is not an option: it keeps every port of
that MAC down until the module loads, and forever if it never does, and
those ports can include the one needed to mount the filesystem that
holds the module. Return 0 rather than -ENODEV, because DSA reads
-ENODEV as permission to look for the PHY on the switch's internal MDIO
bus, which is the wrong device.

The deferral is opt-in because it returns 0 with no PHY attached, and
some callers read 0 as a PHY being there: ucc_geth dereferences
dev->phydev later in the same open, and enetc, stmmac, mvneta, sparx5
and lan743x do one-time PHY setup at that point that a late attach
would skip.

The deferral also needs an interface mode known up front, as without one
the MAC would be configured for PHY_INTERFACE_MODE_NA when started
before the PHY supplies its own. It is limited to PHY mode without an
SFP cage: in-band, the PCS can bring the link up with no PHY to gate it,
and an SFP PHY can take the port while the wait is armed and drop the
wait on removal. The poll runs only while phylink is started, so nothing
touches the PHY of a stopped port, as at switch shutdown; a port that is
down attaches at its next start.

Wait for a driver that has bound, not for a device that exists, because
the generic driver would otherwise bind and cannot drive such a PHY. If
the real driver goes away between that test and the attach, the generic
one binds instead or the attach fails; when the driver is gone after the
attach, the poll keeps waiting without counting a failed connect. The
attach-versus-unbind window itself is phylib's to close and is not
closed here.

A connect that fails with the real driver bound is retried a few times
and then given up on with one line, because silence from a poller reads
like success. Each retry re-runs the PHY's init and, on boards whose DT
gives it a reset line, pulses that reset, at a cost that depends on the
board and the PHY, so the retries are bounded. Stopping after the first
failure would leave a DSA port, which connects once, dead until the
switch driver is rebound.

Until a PHY attaches, report no link modes and refuse the ethtool
settings that would configure the MAC alone for a link that cannot come
up.

Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch): the EN8811H
behind lan4 has its driver on the root filesystem, the switch sets its
ports up before that is mounted, and lan4 was lost for the uptime. With
this change and the DSA opt-in that follows, lan4 attaches once the
module has loaded and the port is up. The retry path was driven there by
a local debug parameter that fails the connect after a successful
attach: two injected failures were retried a second apart and the third
attempt attached, and with failures that never stop, four attempts ended
in one "giving up" line and no further polls.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v6:
 - defer only in MLO_AN_PHY and without an SFP bus
 - poll only while started: phylink_start() queues the poll,
   phylink_stop() cancels it, the poller's STOPPED test is gone
 - a failed attach with no usable driver is a lost race, not a retry
 - commit message: ndo_open argument dropped, board sentence updated

 drivers/net/phy/phylink.c | 232 ++++++++++++++++++++++++++++++++++++--
 include/linux/phylink.h   |   5 +
 2 files changed, 229 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7d086cdc9b2..ec76138f1065 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -98,6 +98,16 @@ struct phylink {
 
 	u32 wolopts_mac;
 	u8 wol_sopass[SOPASS_MAX];
+
+	/* The poller writes these while it runs; arming cancels it first. */
+	struct fwnode_handle *late_phy_fwnode;
+	u32 late_phy_flags;
+	struct delayed_work late_phy_poll;
+	unsigned int late_phy_poll_ms;
+	unsigned int late_phy_waited_ms;
+	u8 late_phy_retries;
+	bool late_phy_warned;
+	bool late_phy_gave_up;
 };
 
 #define phylink_printk(level, pl, fmt, ...) \
@@ -1831,6 +1841,18 @@ int phylink_set_fixed_link(struct phylink *pl,
 }
 EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
 
+static void phylink_late_phy_poll(struct work_struct *work);
+
+/* Synchronous: the poller reads the node put here. It only trylocks
+ * rtnl, so a caller holding rtnl cannot deadlock on it.
+ */
+static void phylink_late_phy_cancel(struct phylink *pl)
+{
+	cancel_delayed_work_sync(&pl->late_phy_poll);
+	fwnode_handle_put(pl->late_phy_fwnode);
+	pl->late_phy_fwnode = NULL;
+}
+
 /**
  * phylink_update_pause_state() - Update the phylink pause frame configuration
  * @pl: a pointer to a &struct phylink instance
@@ -1989,6 +2011,7 @@ struct phylink *phylink_create(struct phylink_config *config,
 	mutex_init(&pl->phydev_mutex);
 	mutex_init(&pl->state_mutex);
 	INIT_WORK(&pl->resolve, phylink_resolve);
+	INIT_DELAYED_WORK(&pl->late_phy_poll, phylink_late_phy_poll);
 
 	pl->config = config;
 	if (config->type == PHYLINK_NETDEV) {
@@ -2068,6 +2091,8 @@ EXPORT_SYMBOL_GPL(phylink_create);
  */
 void phylink_destroy(struct phylink *pl)
 {
+	phylink_late_phy_cancel(pl);
+
 	sfp_bus_del_upstream(pl->sfp_bus);
 	if (pl->link_gpio)
 		gpiod_put(pl->link_gpio);
@@ -2337,10 +2362,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
 }
 
 static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
-			      phy_interface_t interface)
+			      phy_interface_t interface, u32 flags)
 {
-	u32 flags = 0;
-
 	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
 		return -EINVAL;
 
@@ -2378,7 +2401,7 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
 		pl->link_config.interface = pl->link_interface;
 	}
 
-	ret = phylink_attach_phy(pl, phy, pl->link_interface);
+	ret = phylink_attach_phy(pl, phy, pl->link_interface, 0);
 	if (ret < 0)
 		return ret;
 
@@ -2390,6 +2413,134 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
 }
 EXPORT_SYMBOL_GPL(phylink_connect_phy);
 
+#define PHYLINK_LATE_PHY_POLL_MS	1000
+#define PHYLINK_LATE_PHY_WARN_MS	60000
+#define PHYLINK_LATE_PHY_POLL_MAX_MS	30000
+#define PHYLINK_LATE_PHY_RETRIES	3
+
+static bool phylink_late_phy_pending(struct phylink *pl)
+{
+	return pl->late_phy_fwnode && !pl->phydev;
+}
+
+/* Stale the moment it returns: the device lock this wants cannot be held
+ * across the attach, whose own failure path takes it again.
+ */
+static bool phylink_phy_is_usable(struct phy_device *phy_dev)
+{
+	return phy_dev && device_is_bound(&phy_dev->mdio.dev) && phy_dev->drv;
+}
+
+static void phylink_late_phy_backoff(struct phylink *pl)
+{
+	pl->late_phy_poll_ms = min_t(unsigned int, pl->late_phy_poll_ms * 2,
+				     PHYLINK_LATE_PHY_POLL_MAX_MS);
+}
+
+static void phylink_late_phy_poll(struct work_struct *work)
+{
+	struct phylink *pl = container_of(to_delayed_work(work), struct phylink,
+					  late_phy_poll);
+	struct phy_device *phy_dev;
+	bool again = false, lost_race = false;
+	int ret;
+
+	if (!rtnl_trylock()) {
+		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
+		goto requeue;
+	}
+
+	/* A PHY arrived by another path while queued. */
+	if (!phylink_late_phy_pending(pl)) {
+		rtnl_unlock();
+		return;
+	}
+
+	/* Stable here: whoever clears it waits for this work first. */
+	phy_dev = fwnode_phy_find_device(pl->late_phy_fwnode);
+	if (!phylink_phy_is_usable(phy_dev)) {
+		if (phy_dev)
+			phy_device_free(phy_dev);
+
+		if (!pl->late_phy_warned &&
+		    pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS) {
+			pl->late_phy_warned = true;
+			phylink_warn(pl,
+				     "still waiting for %pfw (needs-host-firmware)\n",
+				     pl->late_phy_fwnode);
+		}
+		/* Past the warn it may never come: stop paying 1 Hz for it. */
+		if (pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS)
+			phylink_late_phy_backoff(pl);
+		/* The first run is immediate, so count the sleep ahead. */
+		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
+		rtnl_unlock();
+		goto requeue;
+	}
+
+	ret = phylink_attach_phy(pl, phy_dev, pl->link_interface,
+				 pl->late_phy_flags);
+	if (!ret && phy_driver_is_genphy(phy_dev)) {
+		/* Lost the race: the attach bound the generic driver, which
+		 * is the outcome this poller exists to avoid.
+		 */
+		phy_detach(phy_dev);
+		lost_race = true;
+		ret = -EAGAIN;
+	} else if (ret && !phylink_phy_is_usable(phy_dev)) {
+		/* The driver went away under the attach: wait for it again. */
+		lost_race = true;
+	}
+	if (!ret) {
+		ret = phylink_bringup_phy(pl, phy_dev,
+					  pl->link_config.interface);
+		if (ret) {
+			phy_detach(phy_dev);
+		} else {
+			/* Only a major config programs the masks bringup
+			 * narrowed.
+			 */
+			mutex_lock(&pl->state_mutex);
+			pl->force_major_config = true;
+			mutex_unlock(&pl->state_mutex);
+			/* MAC before the PHY, the order a start uses. */
+			phylink_run_resolve(pl);
+			flush_work(&pl->resolve);
+			phy_start(phy_dev);
+		}
+	}
+	if (lost_race) {
+		/* Not a failed connect: the next poll waits for the real
+		 * driver.
+		 */
+		again = true;
+	} else if (ret) {
+		phylink_err(pl, "failed to connect late PHY: %pe\n",
+			    ERR_PTR(ret));
+		/* Bounded: each retry re-runs the PHY's init, maybe its reset. */
+		if (pl->late_phy_retries) {
+			pl->late_phy_retries--;
+			again = true;
+		} else {
+			/* Silence from here reads as success otherwise. */
+			phylink_err(pl, "giving up on %pfw after %u attempts\n",
+				    pl->late_phy_fwnode,
+				    PHYLINK_LATE_PHY_RETRIES + 1);
+			pl->late_phy_gave_up = true;
+		}
+	}
+	phy_device_free(phy_dev);
+	rtnl_unlock();
+
+	if (!again)
+		return;
+
+requeue:
+	queue_delayed_work(system_freezable_power_efficient_wq,
+			   &pl->late_phy_poll,
+			   msecs_to_jiffies(pl->late_phy_poll_ms));
+}
+
 /**
  * phylink_of_phy_connect() - connect the PHY specified in the DT mode.
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2398,9 +2549,11 @@ EXPORT_SYMBOL_GPL(phylink_connect_phy);
  *
  * Connect the phy specified in the device node @dn to the phylink instance
  * specified by @pl. Actions specified in phylink_connect_phy() will be
- * performed.
+ * performed, except for a deferred connect, where they happen once the
+ * PHY attaches.
  *
- * Returns 0 on success or a negative errno.
+ * Returns what phylink_fwnode_phy_connect() returns, including 0 for a
+ * deferred connect with no PHY attached yet.
  */
 int phylink_of_phy_connect(struct phylink *pl, struct device_node *dn,
 			   u32 flags)
@@ -2418,7 +2571,18 @@ EXPORT_SYMBOL_GPL(phylink_of_phy_connect);
  * Connect the phy specified @fwnode to the phylink instance specified
  * by @pl.
  *
- * Returns 0 on success or a negative errno.
+ * If the MAC set &phylink_config.phy_may_probe_late, uses %MLO_AN_PHY
+ * with a known interface mode and no SFP cage, and the PHY node carries
+ * the needs-host-firmware property and the PHY is not usable yet, 0 is
+ * returned with no PHY connected: while phylink is started, a poller
+ * connects it once its driver has probed. Until then the MAC runs
+ * without a PHY and ethtool reports no link modes.
+ * If the connect keeps failing with the driver bound, the poller gives
+ * up after a few attempts and the port stays that way until the PHY is
+ * disconnected and connected again.
+ *
+ * Returns 0 on success - the PHY connected, or the deferred connect
+ * armed - or a negative errno.
  */
 int phylink_fwnode_phy_connect(struct phylink *pl,
 			       const struct fwnode_handle *fwnode,
@@ -2428,6 +2592,8 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 	struct phy_device *phy_dev;
 	int ret;
 
+	phylink_late_phy_cancel(pl);
+
 	if (!phylink_expects_phy(pl))
 		return 0;
 
@@ -2440,6 +2606,29 @@ int phylink_fwnode_phy_connect(struct phylink *pl,
 	}
 
 	phy_dev = fwnode_phy_find_device(phy_fwnode);
+	if (pl->config->phy_may_probe_late &&
+	    pl->cfg_link_an_mode == MLO_AN_PHY && !pl->sfp_bus &&
+	    pl->link_interface != PHY_INTERFACE_MODE_NA &&
+	    fwnode_property_present(phy_fwnode, "needs-host-firmware") &&
+	    !phylink_phy_is_usable(phy_dev)) {
+		/* -ENODEV here would also send DSA to the switch's own bus. */
+		if (phy_dev)
+			phy_device_free(phy_dev);
+
+		pl->late_phy_fwnode = phy_fwnode;
+		pl->late_phy_flags = flags;
+		pl->late_phy_poll_ms = PHYLINK_LATE_PHY_POLL_MS;
+		pl->late_phy_waited_ms = 0;
+		pl->late_phy_retries = PHYLINK_LATE_PHY_RETRIES;
+		pl->late_phy_warned = false;
+		pl->late_phy_gave_up = false;
+		if (!test_bit(PHYLINK_DISABLE_STOPPED,
+			      &pl->phylink_disable_state))
+			queue_delayed_work(system_freezable_power_efficient_wq,
+					   &pl->late_phy_poll, 0);
+		return 0;
+	}
+
 	/* We're done with the phy_node handle */
 	fwnode_handle_put(phy_fwnode);
 	if (!phy_dev)
@@ -2481,6 +2670,8 @@ void phylink_disconnect_phy(struct phylink *pl)
 
 	ASSERT_RTNL();
 
+	phylink_late_phy_cancel(pl);
+
 	mutex_lock(&pl->phydev_mutex);
 	phy = pl->phydev;
 	if (phy) {
@@ -2615,6 +2806,9 @@ void phylink_start(struct phylink *pl)
 		phy_start(pl->phydev);
 	if (pl->sfp_bus)
 		sfp_upstream_start(pl->sfp_bus);
+	if (phylink_late_phy_pending(pl) && !pl->late_phy_gave_up)
+		queue_delayed_work(system_freezable_power_efficient_wq,
+				   &pl->late_phy_poll, 0);
 }
 EXPORT_SYMBOL_GPL(phylink_start);
 
@@ -2634,6 +2828,9 @@ void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* The node stays: the next start resumes the wait. */
+	cancel_delayed_work_sync(&pl->late_phy_poll);
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -3047,6 +3244,14 @@ int phylink_ethtool_ksettings_get(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* No PHY yet: the port supports nothing, not what the MAC alone can. */
+	if (phylink_late_phy_pending(pl)) {
+		kset->base.port = pl->link_port;
+		kset->base.speed = SPEED_UNKNOWN;
+		kset->base.duplex = DUPLEX_UNKNOWN;
+		return 0;
+	}
+
 	if (pl->phydev)
 		phy_ethtool_ksettings_get(pl->phydev, kset);
 	else
@@ -3119,6 +3324,10 @@ int phylink_ethtool_ksettings_set(struct phylink *pl,
 
 	ASSERT_RTNL();
 
+	/* Would configure the MAC alone, for a link that cannot come up. */
+	if (phylink_late_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (pl->phydev) {
 		struct ethtool_link_ksettings phy_kset = *kset;
 
@@ -3292,6 +3501,9 @@ int phylink_ethtool_nway_reset(struct phylink *pl)
 
 	ASSERT_RTNL();
 
+	if (phylink_late_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (pl->phydev)
 		ret = phy_restart_aneg(pl->phydev);
 	phylink_pcs_an_restart(pl);
@@ -3331,6 +3543,10 @@ int phylink_ethtool_set_pauseparam(struct phylink *pl,
 	if (pl->req_link_an_mode == MLO_AN_FIXED)
 		return -EOPNOTSUPP;
 
+	/* pl->supported still describes the MAC, so the test below passes. */
+	if (phylink_late_phy_pending(pl))
+		return -EOPNOTSUPP;
+
 	if (!phylink_test(pl->supported, Pause) &&
 	    !phylink_test(pl->supported, Asym_Pause))
 		return -EOPNOTSUPP;
@@ -3817,7 +4033,7 @@ static int phylink_sfp_config_phy(struct phylink *pl, struct phy_device *phy)
 	/* Attach the PHY so that the PHY is present when we do the major
 	 * configuration step.
 	 */
-	ret = phylink_attach_phy(pl, phy, config.interface);
+	ret = phylink_attach_phy(pl, phy, config.interface, 0);
 	if (ret < 0)
 		return ret;
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 3a88a69882a6..84815556f7d1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -147,6 +147,10 @@ enum phylink_op_type {
  * @default_an_inband: if true, defaults to MLO_AN_INBAND rather than
  *		       MLO_AN_PHY. A fixed-link specification will override.
  * @eee_rx_clk_stop_enable: if true, PHY can stop the receive clock during LPI
+ * @phy_may_probe_late: if true, a connect in PHY mode to a PHY marked
+ *			needs-host-firmware whose driver has not bound yet is
+ *			deferred until that driver binds; see
+ *			phylink_fwnode_phy_connect().
  * @get_fixed_state: callback to execute to determine the fixed link state,
  *		     if MAC link is at %MLO_AN_FIXED mode.
  * @supported_interfaces: bitmap describing which PHY_INTERFACE_MODE_xxx
@@ -169,6 +173,7 @@ struct phylink_config {
 	bool mac_requires_rxc;
 	bool default_an_inband;
 	bool eee_rx_clk_stop_enable;
+	bool phy_may_probe_late;
 	void (*get_fixed_state)(struct phylink_config *config,
 				struct phylink_link_state *state);
 	DECLARE_PHY_INTERFACE_MASK(supported_interfaces);
-- 
2.53.0


