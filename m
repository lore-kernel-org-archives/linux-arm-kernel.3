Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F141C5DF8C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uy0OKeVpCAmhbj0eyrSB4RHofJlj5Ul/6v78/RLpNA=; b=dLsqBsn8qnGFPFPDhkqfciuc46
	P3yENyDBzCYHThVBfcK58dOGsIqD2ZckBRNwy2br8/qHr1h/9kLyeNvviPdQd+dqKYGjPNCTRy0hj
	OFMfTizUMBM8AHBSbncRRKVmcmUkHHqUHYRlrQdO25SHqb/5MT8ogMUf5Q3g4YTrX/ji+wLS0R1gF
	swTO3355y5sWRDAFfJmC+mxMLTbxVjJPotCMTaGbr60LeHcAtouuRkYAnN3IZq6XAL+FWq3JSso+c
	/UVaMwJ39uKxzAyH5YyrgheD4hU21KLh2q5FQolLNdLqdv1Ea7fWL4XCGBzTR7f9w5DFZr1VDy17e
	Ka+7gpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm4-0000000Ekvy-0v2U;
	Sat, 22 Aug 2026 19:53:04 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxrm0-0000000EktS-2Zea
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 19:53:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c20e70a0962so325019466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 12:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787428379; x=1788033179; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uy0OKeVpCAmhbj0eyrSB4RHofJlj5Ul/6v78/RLpNA=;
        b=VqQDxBhNmlxy/n4XvXX0y9PT1/CdkOMKNZHm5Ba6WlxWqHF9h0zP2/l2bIGO+01Eka
         UMk2+WTKqYFKEoBRNVrahEgzuxWN64ePegqGKhZvWv/W4XIBXhxlI+X0EDVvfZeFE2MV
         m3DcCyefmiCJyhR+YWYfVixMIsWupM14Dy09IboBFB1kHfhRfs7/4U0CUTP/6IiVG6Di
         /BaTUmACKKOJyt+umKlF+Qhd+LNuh/mRL9sxCnfjvJ3BWUHt1fkwvOWLxz0olJWTr/L8
         xVjbKZvm/LH5DFJmm6V5gc+TnQG0cQr8rSopJd/uXsaRBAza/44338u/Qej76hJeRRGF
         AnGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787428379; x=1788033179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0uy0OKeVpCAmhbj0eyrSB4RHofJlj5Ul/6v78/RLpNA=;
        b=EGXTY9L2VxLtppUbeCMUb8U87bNn1xgYQUxXyLCbbCu6aMECSgmIE/PxVPyO0iiEww
         StGMSTgJl7PLrqPKzDfKiALiySnqxE3WcJ3D783CAc2EKBb6snQSELC1EY0siT/G4tr0
         tSlCnbvJAspbG4qF7MxoAQtlBpwVhE1kfHWbxBy3zft1FLVUrEwxCfVZsET0LwY2CfEi
         nRQuIqa+DXt94AK7UuLyF/5RbCJTqFyunGCTmVoJKiYfId1BdfpmuF6KU7l/mMP6aJRR
         wB0Fskzbqxsq7SeBltQealslIR+xKtmNiJny1AsziKukb2gpt6TXwnKuBmftNQqPPFuo
         7eSw==
X-Forwarded-Encrypted: i=1; AHgh+RqaZcR+6gnmFI01e+LILyLi7gwals7h62Dg4g61uy9PKurDQxwkj9WGMvkPXK0kg+kIkSvEMi6bYOdhDozEOc9m@lists.infradead.org
X-Gm-Message-State: AFuF++mGSKJC82r3xAPcPNHzmQmjDG1snskDTTHmK7iAFH9U4o8dqF0B
	EsEwtn9wMu3Rt98j0IF5xtCVkgvP6CjUn3SidXBchpm3TxMwQwjboe2NkbEteFe7Fpg=
X-Gm-Gg: AR+sD13PjWA6g0t7r3o/fR9uo/w0K6l1Kw+ta0O1J911mFR4iGiJ9HEangysOjHWpcq
	Y2zKfRm2tCzeKt5ZeJjoh+pZby4laGENw5c5NXsPiV3a+Y/7e205MNd5sKp9cA3VS6Yip+0zhMn
	NvT+ElsBpLiG6L5zyLJ2aDBjOgSTe/MnftVgoGQTwwnViiMCzvgFuIRZbHRV8cfGA2M/gPJaYkC
	jnFi68Ogv9xgo6RCYk9+qNjbw1t4WR5wi98IHyNYxsyFUDk3E7JgEzFQlGzbw2Xn7srpje0huvA
	ZMQyQIPotb1xsibDBeX2iFIk0pL5ag9v72KeWmLiTzcM3CDv/sjGF72Vd0d2A9A7kYoVmxROUJh
	T7fvmJXthscngO6PuX3g/XfIqov6HBACY0v2Vkql388kTmTClfPKGmKiZpQH6eGJY/hAPesltdb
	HTE9AIq/5+aZbP7IO4cMONibuJps9O6pZpByLTAjN/+LPZhQ72kaqNwZ86t/tB2WNEaCqTYcm8+
	YCYj3a3
X-Received: by 2002:a17:907:ea8b:b0:c21:2c32:e2da with SMTP id a640c23a62f3a-c246a5f4515mr1912226866b.8.1787428378632;
        Sat, 22 Aug 2026 12:52:58 -0700 (PDT)
Received: from ownbook.home.lex.la ([84.17.55.225])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2495ee5295sm475032666b.0.2026.08.22.12.52.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 12:52:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Chester A . Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [PATCH net 2/2] net: ethernet: mtk_eth_soc: populate lpi_interfaces to fix EEE support
Date: Sat, 22 Aug 2026 22:52:52 +0300
Message-ID: <20260822195252.2934-3-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822195252.2934-1-f@lex.la>
References: <20260822195252.2934-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_125300_764756_372BF183 
X-CRM114-Status: GOOD (  27.06  )
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

mtk_add_mac() fills in phylink_config.lpi_capabilities and
phylink_config.lpi_timer_default, but never populates
phylink_config.lpi_interfaces. phylink only treats a MAC as supporting
phylink managed EEE when the tx_lpi methods are implemented and both
the LPI capabilities and the LPI interfaces are non-empty, so EEE is
unavailable on every MAC that uses mtk_phylink_ops:

  # ethtool --show-eee wan
  Cannot get EEE settings: Not supported

even though those ops implement mac_enable_tx_lpi() and
mac_disable_tx_lpi(). Since the methods are implemented, phylink takes
the other branch and calls phy_disable_eee(), which fills
eee_disabled_modes, so userspace cannot enable EEE either. MT7628 is
unaffected, as rt5350_phylink_ops has no tx_lpi methods at all.

Copy the supported interfaces into lpi_interfaces once they are
complete, that is after the SoC specific fixups have added and removed
modes. In particular the netsys v3 switch path clears the bitmap
before setting PHY_INTERFACE_MODE_INTERNAL, so copying it any earlier
would leave stale modes behind.

The MAC does not start using LPI on its own: the driver does not set
eee_enabled_default, so phylink leaves tx_lpi_enabled false, and
phy_check_link_status() computes enable_tx_lpi as tx_lpi_enabled &&
eee_active. One thing does change, and it is worth being explicit
about: phylink no longer takes the phy_disable_eee() branch, so a PHY
that advertises EEE out of reset advertises it again instead of being
forced quiet, and the link may negotiate EEE where it previously could
not. Nothing on this side asserts LPI until userspace enables it with
ethtool --set-eee.

This also makes lpi_capabilities take effect for the first time, so
correct its value in the same change. MAC_MCR only has EEE force bits
for 100 Mbps (MAC_MCR_EEE100M) and 1 Gbps (MAC_MCR_EEE1G), and
MAC_EEECR only carries wakeup times for those two speeds
(MAC_EEE_WAKEUP_TIME_100, MAC_EEE_WAKEUP_TIME_1000), so the MAC cannot
signal LPI at 2.5 Gbps: drop MAC_2500FD. Correcting the value here
rather than in a separate patch changes nothing observable: while
lpi_interfaces was empty, lpi_capabilities never reached
phy->advertising_eee, so no state ever claimed 2.5 Gbps LPI.

Two sets of interfaces have to come out of lpi_interfaces as well.
lpi_capabilities cannot express either: it masks the PHY's EEE
advertisement, a media side property, and never gates LPI activation on
the MAC side speed, while phylink raises the MAC speed to the interface
maximum when the PHY rate matches (RATE_MATCH_PAUSE in
phylink_link_up()), so 2500BASE-X would arm LPI on a 2.5 Gbps MAC even
for a 1 Gbps media link. Separately, mtk_mac_enable_tx_lpi() refuses
the xGMII modes outright, which on netsys v3 includes
PHY_INTERFACE_MODE_INTERNAL, the mode MT7988's built-in 2.5G PHY runs
in; offering those to phylink would log an error on link up once EEE is
enabled. What that costs is limited to setups that keep the MAC on
2500BASE-X or on an xGMII mode, neither of which the MAC has LPI bits
for; a PHY that switches the interface down to SGMII or 1000BASE-X
keeps LPI, as those stay in the mask.

On the netsys v3 switch MAC, that empties lpi_interfaces outright,
since PHY_INTERFACE_MODE_INTERNAL is the only interface it supports.
Nothing changes there: it is a fixed link port with no PHY, so phylink
had no EEE to manage on it before this patch either.

Fixes: 952d7325362f ("net: ethernet: mediatek: add EEE support")
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---

Pre-existing, made live by this patch and not addressed here:
mtk_mac_enable_tx_lpi() programs MT7531's reset wakeup times (17 for
1 Gbps, 36 for 100 Mbps) whenever it runs, as its own comment says, so
they now apply to every SoC driven by mtk_phylink_ops once a user
enables EEE on an eligible interface. Those values do not appear to
have been confirmed for MT7981, MT7986 or MT7988.
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index be3bd025c41a..5412c89685f2 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4828,7 +4828,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	phy_interface_t phy_mode;
 	struct phylink *phylink;
 	struct mtk_mac *mac;
-	int id, err;
+	int id, err, i;
 	int txqs = 1;
 	u32 val;
 
@@ -4907,8 +4907,11 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	mac->phylink_config.type = PHYLINK_NETDEV;
 	mac->phylink_config.mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
 		MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD;
-	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD |
-		MAC_2500FD;
+	/* MAC_MCR only has EEE force bits for 100 Mbps and 1 Gbps, and
+	 * MAC_EEECR only has wakeup times for those two speeds, so the MAC
+	 * cannot signal LPI at 2.5 Gbps.
+	 */
+	mac->phylink_config.lpi_capabilities = MAC_100FD | MAC_1000FD;
 	mac->phylink_config.lpi_timer_default = 1000;
 
 	/* MT7623 gmac0 is now missing its speed-specific PLL configuration
@@ -4966,6 +4969,19 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
 			  mac->phylink_config.supported_interfaces);
 
+	phy_interface_copy(mac->phylink_config.lpi_interfaces,
+			   mac->phylink_config.supported_interfaces);
+
+	/* The MAC side of 2500BASE-X is never below 2.5 Gbps, not even when
+	 * a rate matching PHY drops the media to 1 Gbps, and
+	 * mtk_mac_enable_tx_lpi() refuses the xGMII modes outright.
+	 */
+	__clear_bit(PHY_INTERFACE_MODE_2500BASEX,
+		    mac->phylink_config.lpi_interfaces);
+	for (i = 0; i < PHY_INTERFACE_MODE_MAX; i++)
+		if (mtk_interface_mode_is_xgmii(eth, i))
+			__clear_bit(i, mac->phylink_config.lpi_interfaces);
+
 	phylink = phylink_create(&mac->phylink_config,
 				 of_fwnode_handle(mac->of_node),
 				 phy_mode, mac_ops);
-- 
2.55.0


