Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F231AC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCu/YU+1fYdbICpm8C465sZb+CGw/CHGy5Mn4qOYcAY=; b=bT26ccwGVa4TGk8khMvXheXGsX
	I1/x4am4FiyddhEzPr++cjI2rPAHMemEPvTfuNNfnfZhLFtB78GMLT5KOY3tUdHpsAM4smRMuNO2G
	i3P1CXL/h6U0XNTV0cFfCJwP50863IuoXHVES340wJxN2sxTccMwE/g7r0WXT01I1/jfTyrmWnhk5
	qUdhog+9AfJCYesa2XadLArOg9h3Vp9cc/vZo5Ex+SO3+gUUK2uqbZ4IAuiNfzSng9fOPSWKzTfOH
	FoNYo6+Fbr6uSk468p9PE8iSLi1/oGUnsLf6vVRexMNFwajsKejMCme+ArvUJ5ZMI0x1w3/vk2X4m
	GSS1wz7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyR-0000000E1Du-10yP;
	Wed, 02 Sep 2026 08:05:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fyH-0000000E12t-3qB6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:27 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so6806675e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336324; x=1788941124; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PCu/YU+1fYdbICpm8C465sZb+CGw/CHGy5Mn4qOYcAY=;
        b=RNA1MvhlzSPUL2O+oL9KqDeuhDMIUYWqlSrqxsJNzLlXGKsQBOrzSOx1VYz8ZS3eCo
         BFFzDvDiUVlEtnFpIfRezDK9hjqADF9G87EFUdlRuNH8gWJR7El2SWyM79qSnm5OWFTv
         Po9PqGux01909VdBt9jgXOn5Tpo2dcJQLCbg4WGp6lwQgcFUNpI1fUW+3EIWziDuYC5i
         gRbKqzQe/nQXpwx9ahTJisGeBp9259RMlNdZfJdGhwuTCejqvkpeqOpaC7DwP+vfAqaG
         PGzPiWfQShDXUDBV12RbEXzMPB7X7oZOXCqYNCK4Lgqzf2jwmmAtLHiA5TgUCOW4KsBu
         MaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336324; x=1788941124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PCu/YU+1fYdbICpm8C465sZb+CGw/CHGy5Mn4qOYcAY=;
        b=mI1Sy6IVSzreU4AmM7l4PTZ5kVdcpotnlYHsZGzvJE3roNcds43zYKDfv925cU7ZfE
         AkFx98WQD7pO/s8HdeIJYVHCAh6MHC09FXQCS4koQTMbMN4QvVRPNPa5e7ELqSx9pejV
         /N/xwSgFr+dbOyBYfsJbjkgqsVwq+LsYIYTT4wP3/7+aB4dLi6ZU+bcVNpp/VwXhqGHk
         Z26p1aWEmLuRfNKjE2T5ECU2tYa41hsMnqr4OFz3YHnN7HIeFWuV4zNsrSS81U06Agq9
         MYTLRgYVXUe+xgdFYNE3B9lGN7o3Lrp74BujR06oCVF/OKjEhh+NVGeypleAGJ6VKWn6
         gvCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1XWwrMU2y8SGq9lySTSwR3nOpSx2iOG0q8C/OT1a22JGFkib156Vjjqng8K0Z9t/EWQ95klaSKqByLmoJYU5J@lists.infradead.org
X-Gm-Message-State: AFuF++nsjsVhUdNrs1vudx7KME0mX2TTGfv3444kdudIxvdFbJvBOBDA
	3DwwJlags6lrfyBHk9iM9KHbVX3zfV+utpZIP+KUBUgFGlZ8SK8JY/ggFfy0to4v+zs=
X-Gm-Gg: AR+sD13n/pkjJxKaK0o7j5cUVzbjr//GnxBqTuWHqzqQy2XYa861ONysi+LS8PK+oEt
	yCvzJDhsqbvMYk4Hjj2KWXOlNcuQo+uDB9CuLXNZSF1KoAe6h/bvXwb6ABD8GKrKNHQTm+vX9BO
	nOz1F+cZbSBvZJn7hGmT6Uvoi4RsdJdTbv7eDJp+KO8uDaeBRePcGiFK2/9wOHQ9gZd6/sM3Dkg
	1MgBZKrFMUZKHVipZY1Qww2756nvSxJgKQTSyw7N5iiDWLeUyolbgFFT5wJQX2clZq0GWmp5D4F
	VYKGWrSFCP3phZtTonjG4jCaXFuN/qHd3RNWKxSbtNsQIazTecDeJQ0RvQpap0N3OrKVLmtcULe
	lSfqIH6XsVOiPqoFV0gtwz8XbnFLEK2F+8wKSj6YFBWITjYfWkI0qnJqwCi4LthDNy6Ll5feCOa
	yFDKQJaXyM6s/ujMS9CQ5ErgqQ+koK7mwORo+y9Q8=
X-Received: by 2002:a05:600c:63c6:b0:49c:eb16:9fd with SMTP id 5b1f17b1804b1-49ceb160bb1mr1759475e9.3.1788336323878;
        Wed, 02 Sep 2026 01:05:23 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce309e418sm72781715e9.13.2026.09.02.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:23 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org
Cc: linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v4 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Wed,  2 Sep 2026 08:05:18 +0000
Message-ID: <20260902080519.2211373-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080519.2211373-1-f@lex.la>
References: <20260902080519.2211373-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_010525_972406_692E7292 
X-CRM114-Status: GOOD (  20.93  )
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

phylink_create() decides once and for all that a MAC supports managed
EEE, and it requires the tx_lpi ops plus non-empty lpi_capabilities and
lpi_interfaces. mt753x_phylink_get_caps() leaves lpi_interfaces empty.

So ever since the conversion to phylink managed EEE, ethtool has
answered "Not supported" on every mt753x port, and phy_disable_eee()
has locked userspace out of turning EEE on. That undoes what
commit 06dfcd4098cf ("net: dsa: mt7530: fix enabling EEE on MT7531
switch on all boards") arranged: EEE off by default, but reachable
with ethtool.

Leave the speeds above 1 Gbps out of both bitmaps. PMCR folds
SPEED_2500 and SPEED_10000 onto PMCR_FORCE_SPEED_1000, so
PMCR_FORCE_EEE1G would govern LPI on such a link, and that is
unvalidated rather than known unsupported: MediaTek's SDK driver sets
the EEE force bits for 100 Mbps and 1 Gbps only, and the unit of the
wakeup timers is undocumented with the port clock at 2.5 times the
rate.

LPI stays off until userspace enables it, but the EEE advertisement of
a PHY that advertises it out of reset comes back, since phylink stops
force-clearing it.

Fixes: 9cf21773f535 ("net: dsa: mt7530: convert to phylink managed EEE")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Ports that support neither 100 Mbps nor 1 Gbps are skipped because on
MT7988, EN7581 and AN7583 port 6 is 10 Gbps only and shares
PHY_INTERFACE_MODE_INTERNAL with the user ports, so the interface mask
alone cannot tell them apart. MT7531's internal PHYs keep the
advertisement mt7531_setup() zeroed and EN7528 keeps both bitmaps
empty, so EEE stays fully off there.

Two pre-existing things this patch makes live, neither addressed here:

- The unit of LPI_THRESH is still unspecified, as the comment above
  lpi_timer_default says. Before the phylink conversion
  mt753x_set_mac_eee() wrote tx_lpi_timer into the field directly, so
  the raw unit has always been what ethtool showed on these ports.

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right.

v2, with the full argument for leaving the higher speeds out:
https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/

v4: lpi_capabilities is mac_capabilities masked to the two speeds
instead of both asserted. Every port that reaches the guard today has
both speeds, so nothing changes; it only stops the bitmap from claiming
a speed a port cannot link at.

 drivers/net/dsa/mt7530.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..a188a391b650 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,38 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
 	config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE;
 
+	priv->info->mac_port_get_caps(ds, port, config);
+
 	/* The EN7528 GPHYs report EEE capability, but negotiating EEE with
 	 * common link partners (e.g. Realtek GbE NICs) results in an unstable
 	 * link with dropped frames. Leave the LPI capabilities empty so that
 	 * phylink disables EEE on these PHYs and refuses to enable it from
-	 * userspace.
+	 * userspace. Ports that run at neither 100 Mbps nor 1 Gbps are left
+	 * empty too, since LPI above 1 Gbps is unvalidated.
 	 */
-	if (priv->id != ID_EN7528) {
+	if (priv->id != ID_EN7528 &&
+	    config->mac_capabilities & (MAC_100FD | MAC_1000FD)) {
 		u32 eeecr = mt7530_read(priv, MT753X_PMEEECR_P(port));
 
-		config->lpi_capabilities = MAC_100FD | MAC_1000FD | MAC_2500FD;
+		/* PMCR folds SPEED_2500 and SPEED_10000 onto
+		 * PMCR_FORCE_SPEED_1000, so LPI above 1 Gbps would be
+		 * governed by PMCR_FORCE_EEE1G and is unvalidated rather than
+		 * unsupported. Leave it out of both bitmaps: lpi_capabilities
+		 * gates on the media speed a rate matching PHY reports, not
+		 * on the speed the MAC runs at.
+		 */
+		config->lpi_capabilities = config->mac_capabilities &
+					   (MAC_100FD | MAC_1000FD);
+		phy_interface_copy(config->lpi_interfaces,
+				   config->supported_interfaces);
+		__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+			    config->lpi_interfaces);
+
 		/* tx_lpi_timer should be in microseconds. The time units for
 		 * LPI threshold are unspecified.
 		 */
 		config->lpi_timer_default = FIELD_GET(LPI_THRESH_MASK, eeecr);
 	}
-
-	priv->info->mac_port_get_caps(ds, port, config);
 }
 
 static int mt753x_pcs_validate(struct phylink_pcs *pcs,
-- 
2.53.0


