Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D13DC61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=; b=ViTdpyW//Y+S/GQRwX0n2OLt/H
	v2+3gvls3NdCDc4kSZ5I2JHunl5TBvZbXbYXl5Oer8re5HsGS1cZSVEx7NfGmjSDLpvCVUBTtCTax
	CdIpnjUnNySXyyZYcNmKIcJXoJ0JxRNKWpSZ2HsHlhiPcz5QJjH9/bKGim0PBVHyBgYIz3lBIFYqY
	258eTOD3+lhIum/xrhEzhiTsQdKItxx8lGtZK2IYzm4fgmbVzyVZEZY1CE9bz3wT4SaEATWJTh22i
	LDvSgxa7W2jmz7bNZq7lqgYEtbyEw5iSOX7g5mCf2YlDdeu9N6Ut7Jno5xGZB+CFBqvGRr+sMRjqC
	xpcRwHCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhTD-00000004neN-1gxd;
	Thu, 27 Aug 2026 21:17:13 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzhT2-00000004na1-2uyR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 21:17:05 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-47fd66a094eso119721f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 14:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787865419; x=1788470219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=;
        b=YZaH2u9EPYNCB2NndIi/pkSKFUfIGH2Mm3UPVQmxiKeHYADACgg4XZGJrelPkB12Bc
         zCLjjSmktCBHM9AmMe+tPi0WmF2ucAhFGYmOLnZWsV8ViYGHZXFg2VNigeDFaWMgIZr7
         +4gtImDeQTrZy/zBKP/hhJDH1wXCuTGWDjZL31H8i6A/xrfHcmIFxOT1Zb+I3Kx2xWXD
         ChahzS6LASfmEcnrlT+CXdbZ2wK2afwc0UYl5bB77ge79Lo/mOMrWdx8N90ZtWtCJr8L
         1KoM7MbOra/ohJQ4P9dV9Akjyb9s0/Mxd3aZNBKMUzY5+BYRfGIvHGdWJC594+wC9H0P
         r/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865419; x=1788470219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tz5ILNw9DexVi+q49WPazou/vKYmLq2Kzp04C8PpRoI=;
        b=lZGw1+kBHgpWM8cAiTXZpBSJi2Bv+xJ+P0Csrc0gjCAiTgEJvGcw+p369fOH9lUE3P
         0bhBcWfT9L9E3U/cnhxIRbNZtofxv474Kj+zSbRvNL3Urw9GXMyX2ID1PmQKZlv2G5LX
         j31ZA/77IaqqvstBivSdvOIO9UZs6DuqiHYp4jcI0gHmFdVKEXgwFQ+jodpnZSuFsWLo
         LIBBKeGMlNjUmZsmdrUEnlWLn//KTzA1zdJLPOP12YcDiNX1u0Chb6JqjrbGqohp5PBu
         xNMQUuJGg01j4plkGZz1ETQzz1QMMOsIuYn5h9jIE8n1Gb9jtLffOEbgFVu2acT+4WRZ
         R22A==
X-Forwarded-Encrypted: i=1; AHgh+RrBOMWoeX1HI/FBS8sEaXTnr72MDlKLVJgcoW2Y/M8vbMy/E9HjUHxDB26fn/E87XguTBzMvY9acxC5CncUWtQ+@lists.infradead.org
X-Gm-Message-State: AFuF++mZ7C578fe54otHPyU/pyvjyxtiM/wkugDeq7DTK7Cy05DCU3ov
	tK+32cilXl8FV3qSNCe7oG384eUJBU4SRVUNhc3vQvZyBEZ4pqPExqSwFkJNTmOG9As=
X-Gm-Gg: AR+sD11WWefIA3uT1VKT8hdzi6+4wj/uY4WfsjasJ5LCnjvvExMtSQeeAo1Z4O217G2
	1S1MmDlYleDRiu5ZJY/nLDUxsAk0mnUKyuvGaPFar/EZ2U9KzN8b3PebFRpJIq2v8Jw6Wu84Hib
	lBo1i1aTqfxbJTY/FgDeUs0g51NLywEN2qdjYR+S0IJ4O9JLFtAhGDTMoJS9C/+7TaGbcDtJnIN
	BEVpE6Lt0qawvTlJc9YH2sKLeDYKZ2YeOwIOVryA5m7t8tgfHF2YiVKXRLNWDKCxPVsLXL+TYKC
	0Ikfpi3yTFW6iwSOG64sqvpZ7LZpepFRvOBffyrUBnoVoBKr33BWFIzbvklwJmYrUJ3oQzgW56e
	muOezOikTIGvtcGOML5kZTBpIRXo2MlFrKzPgAjADi+Deu4w8Nxf0z0qQUYz4MJRsF0VxNS4rxF
	e9R8/0XNRchnXcELQ95xGQu2zADp57JcZnU98MTUcO53N99BDtO8Zk5FM=
X-Received: by 2002:a05:6000:40ce:b0:482:e2f2:19c5 with SMTP id ffacd0b85a97d-482f79cc09fmr1611455f8f.4.1787865418791;
        Thu, 27 Aug 2026 14:16:58 -0700 (PDT)
Received: from ownbook ([31.146.92.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27aa050sm11004557f8f.12.2026.08.27.14.16.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Aug 2026 14:16:58 -0700 (PDT)
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
Cc: Aleksei Sviridkin <f@lex.la>,
	Russell King <linux@armlinux.org.uk>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net v3 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Fri, 28 Aug 2026 00:16:51 +0300
Message-ID: <20260827211652.63504-2-f@lex.la>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827211652.63504-1-f@lex.la>
References: <20260827211652.63504-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_141704_397752_3A56B2F1 
X-CRM114-Status: GOOD (  20.82  )
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
  lpi_timer_default says. ethtool now reports 30 for a switch port
  against 1000 for the SoC MAC, which is a driver constant already in
  microseconds, and mtk_eth_soc treats a structurally identical field
  as milliseconds. Does anyone have the datasheet answer?

- mt753x_phylink_mac_enable_tx_lpi() sets the PMCR force-EEE bits
  without checking the resolved speed or interface, relying entirely on
  phylink never calling it above 1 Gbps. A check there would make the
  driver robust independently of lpi_interfaces being right.

v2, with the full argument for leaving the higher speeds out:
https://lore.kernel.org/netdev/20260824024117.46154-2-f@lex.la/
 drivers/net/dsa/mt7530.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2b7be091c056..4ed6218df64b 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3172,23 +3172,37 @@ static void mt753x_phylink_get_caps(struct dsa_switch *ds, int port,
 
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
+		config->lpi_capabilities = MAC_100FD | MAC_1000FD;
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
2.55.0


