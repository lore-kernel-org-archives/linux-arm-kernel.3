Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 05:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EEFHj81q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W+gnF2rM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+ViBSOmAm+ZQYE53j2XuTCF7Okx0biuN0oo2PmJA/BU=; b=EEFHj81qHjp4wHjAqshmWMzjLU
	/yW+bu2b9ONXmbMlBeSZCtPq140GiAy7jI1V6Vn7U/ONdsMEV6lDFXvK3mn/8pNrqSVKIAhVXJUEp
	+QD2ewFGZuKOj+cELOjvmYDcqxuAA98Drel8Vm639zAee93a2dk8k2ovtTeRl4jWmbtYMiRm4OzMd
	v/1MZ7e4a6eFiDBur5uRd1D0Yn7qGzzTEHpNT4QtmEAAk6pAPZC6g62D5xtRZ+2+RWP7kPOoAKIzg
	zEqp0MLYLWd6takGmKzZgX+507MMangLvEEpLzs+0PYwwkaVL9JzvHxWDEgSrEgPE6U+Y85Lf0Jhy
	gUtyHS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIDc-00000008Ljh-0xZZ;
	Thu, 29 Oct 2026 04:58:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMIDa-00000008LjC-27hI;
	Thu, 29 Oct 2026 04:58:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DC32F43E1C;
	Thu, 29 Oct 2026 04:58:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793249905;
	b=CRnZjC1CLExkYchfqi8yzxVteVhsrvlnsnRpMCHVbuxCdRT28OoakfH5zobwtfbg4W3I
	 aYGGeuW2v+RSz7XYoQb5EgG0c3VfyxfwiRtp8eT1kYsWhgFkZ5q9ebnGRvKD6mVK3XnTI
	 uiOeKBf5iIIHg6J/mqCgzj/N0uDzn9Y87cF13YqRd0r5oUlCAeutxeljZ4mfKuk0jS+gY
	 b7p2TlbyTUAi3YnJZQxJTHmMfqdXQdnZft9cMrcm5BzhrG8uFUUVHNHnZ7pxYpnQW8snK
	 HHsLvaZd2MyTMK+LF3RjzSKoXCqFmOkuwDx62ppLobJNZH15yrjI0q9d+1DGWKnDjGw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793249905;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=+ViBSOmAm+ZQYE53j2XuTCF7Okx0biuN0oo2PmJA/BU=;
	b=T0d57KuVSW3rqkZspqm4IsIlM7BO1HiRinp4ij+UnEADC9xlq2CtF/N69mN7YGsNL2Yn
	 ZfuIaECTgt9131U0fzaqQZ4mP4pnAqK4B4WlrOYeKCROSVOf+XbXvo9W8yY9LAonlOocN
	 qG3DLCu1qfLTgQ1Ebk2URm7rtN2VuS2PejhNa/J3OU8Nom7hjkXm7Ayjx/S3mDkEquym7
	 1Ps/BvyDgR+QXMloBMzuQQ1Ngn1OPCeYcvHaTztqsY1cSAjVHf8v8IVG3aH4Mu5Ak1js2
	 8kXhW11jegUQ4JjKvyYbhKGBUTscDa1rL7j/5T0EFe/Lee27w4SeDsjmNdBXX+AAiDA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 232081F01828;
	Thu, 29 Oct 2026 04:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793249905;
	bh=+ViBSOmAm+ZQYE53j2XuTCF7Okx0biuN0oo2PmJA/BU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=W+gnF2rMFXBhuOfT4rsoQbhjFXrF85+nDAgTajoKAOEBstTy1gQNDnhdooZY847Jh
	 ucBSde1JOzVKNdvQn/H73y9E7zZLHUuRLWkM+eGgMQwMBGr7WPpdyfNsNxSNpNeVFV
	 rWqsCj1/ZRC6XF7vNQZxQBCRLICuNGhE/Hd4mT3DvhBiatoYu6smZhhzFipHx/XZ20
	 4K4gIlR5Zm0fjDCJRGQr088zf+X1oyx3ewstYJ7ZK3cNe9D8DnfpNsgxnerB/Bsq1e
	 TBfY9eOa3FfsAa6qU+z6dgoZ+Gvy0StafSB5hpqdHciX1mPNTN4zKfUb+JImynWO4W
	 +lHtP9uDw00aQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id ABF4445708;
	Thu, 29 Oct 2026 04:58:24 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 29 Oct 2026 04:58:21 +0000
Subject: [PATCH net v3 1/2] net: phy: move irq_suspended and irq_rerun out
 of the bitfield
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261029-b4-phylib-mac-pm-irq-v3-v3-1-5907045f3210@iav.lv>
References: <20261029-b4-phylib-mac-pm-irq-v3-v3-0-5907045f3210@iav.lv>
In-Reply-To: <20261029-b4-phylib-mac-pm-irq-v3-v3-0-5907045f3210@iav.lv>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Lukas Wunner <lukas@wunner.de>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Wei Fang <wei.fang@nxp.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Paul Barker <paul@pbarker.dev>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Doug Berger <opendmb@gmail.com>, 
 Thangaraj Samynathan <Thangaraj.S@microchip.com>, netdev@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3310; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=4RdaBDD3BEcpBc8M0fUl865e+ANU8RSCvbiipXv3lcE=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFmPLuVfX/Tn2c68zB13BJftSLZjf2dktsZDNiRY+FpIE
 svarXeOdpSyMIhxMciKKbJMOKRxK2PJ1b/+HuYPYOawMoEMYeDiFICJSHozMmzdbZwkI9FlZMG0
 o066dofQm0rfF/eXVhr+tXdS8jrPW8Pwh8Pue+f/d0ZTdzrPlkuNuPz2zxs1vZaZwUt9XU01vct
 LmQE=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Igor Velkov <iav@iav.lv>

irq_suspended and irq_rerun share a word with link, autoneg_complete
and interrupts. phy_interrupt() sets irq_rerun from the IRQ thread
without phydev->lock, while the state machine writes link and
autoneg_complete under it and phy_request_interrupt()/
phy_free_interrupt() write interrupts, so one read-modify-write can
undo another. A lost irq_rerun leaves the PHY interrupt disabled after
resume, as phy_interrupt() has already disabled the line.

The next patch sets irq_suspended for PHYs whose MAC driver manages
PHY PM; with stmmac that happens before the MAC stops the PHY, which
widens the window.

Taking phydev->lock in phy_interrupt() alone does not close it:
phy_suspend() stores suspended in the same word and cannot hold the
lock across phy_may_wakeup(), which may take it, and phy_init_hw() and
mdio_bus_phy_suspend() write the word unlocked too. Locking every
writer means auditing about 200 stores to that word in 63 files, 19 of
them MAC drivers, and one missed now or added later reopens the race.

Make both flags bools.

Fixes: 1758bde2e4aa ("net: phy: Don't trigger state machine while in suspend")
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/net/phy/phy.c        | 2 +-
 drivers/net/phy/phy_device.c | 6 +++---
 include/linux/phy.h          | 5 +++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phy.c b/drivers/net/phy/phy.c
index fce9bc7be330..9af303d60bd6 100644
--- a/drivers/net/phy/phy.c
+++ b/drivers/net/phy/phy.c
@@ -1430,7 +1430,7 @@ static irqreturn_t phy_interrupt(int irq, void *phy_dat)
 				pm_wakeup_dev_event(parent, 0, true);
 		}
 
-		phydev->irq_rerun = 1;
+		phydev->irq_rerun = true;
 		disable_irq_nosync(irq);
 		return IRQ_HANDLED;
 	}
diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 5d4508bcfbe9..79dba43d703a 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -344,7 +344,7 @@ static __maybe_unused int mdio_bus_phy_suspend(struct device *dev)
 	 * has resumed. Wait for concurrent interrupt handler to complete.
 	 */
 	if (phy_interrupt_is_valid(phydev)) {
-		phydev->irq_suspended = 1;
+		phydev->irq_suspended = true;
 		synchronize_irq(phydev->irq);
 	}
 
@@ -394,14 +394,14 @@ static __maybe_unused int mdio_bus_phy_resume(struct device *dev)
 		return ret;
 no_resume:
 	if (phy_interrupt_is_valid(phydev)) {
-		phydev->irq_suspended = 0;
+		phydev->irq_suspended = false;
 		synchronize_irq(phydev->irq);
 
 		/* Rerun interrupts which were postponed by phy_interrupt()
 		 * because they occurred during the system sleep transition.
 		 */
 		if (phydev->irq_rerun) {
-			phydev->irq_rerun = 0;
+			phydev->irq_rerun = false;
 			enable_irq(phydev->irq);
 			irq_wake_thread(phydev->irq, phydev);
 		}
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 21afc2082b17..0e0066186ba2 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -726,8 +726,9 @@ struct phy_device {
 
 	/* Interrupts are enabled */
 	unsigned interrupts:1;
-	unsigned irq_suspended:1;
-	unsigned irq_rerun:1;
+	/* Written from the IRQ thread and PM callbacks: not bitfields */
+	bool irq_suspended;
+	bool irq_rerun;
 
 	unsigned default_timestamp:1;
 

-- 
2.43.0



