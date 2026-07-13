Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAEE1C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D6+zJCN4uHBUySGZxMxtpjUmXPdT/OOFNXEwXFVOhXs=; b=Vd0ItWDg5NatTM4UFE0DTDxkg+
	kxZOxW9qhoN0lIRsdiJT0MfOrzaoxIAkkjkxTySEFpZLhDIPnRA0p+IBoTweGMCb1H16EWnRp313T
	dOExGFBG7ubqVt68EtPOTPhzZHbTsSWTN6f3OYQqw5Rltaj80GkfW0VJyMuNHQY/kTLGSxNa6+23E
	o73Mtt2N8K7MAW0ZLRwMffL+fXvHI9m/WkOm0NuQnv4qXAnmgaidRH48hwvB8Ukj1mZd1BRHRKAzw
	xR/Dl1h7xKqVZpko3TFKEHPO5lzioDh3fPKecLfFC3K3cdo0P+l5UGk50eylT7HjGCYcRRGSTwXjr
	UWaJeZMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKH9-0000000A65B-22yz;
	Mon, 13 Jul 2026 17:17:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKGv-0000000A62P-1A1c
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 17:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=D6+zJCN4uHBUySGZxMxtpjUmXPdT/OOFNXEwXFVOhXs=; b=gR+DYXfFwTA3ZqdjmGKzAusvyl
	+/hjpDRA6hcM6g8g2oxOTQKrnQWosm3gPGsx7TScR13XLr4CY/1o5bNZ6GpiiSYcHZTyr10NHoGBk
	rFrMR3Umdk4inia7amVe87ptoefozBmff8dJiP52/WX5OJtKGRrbE0mYXXbjz8Oax0Xn4qGxsMDqU
	P3X8Ty/Pl09W1A1oZkPhQYUEWiZmGGr8J+afTYfugHdWIoYPSKUGldzK9YGzmD7ewKlSJfui1rVUg
	7JLNQcakMViiN4DPJwSgrAE4bPQiXmggN2TTqC62NNwNKWAQz6AdpjY42DyPe2FRBNpGwwqSyz6Rn
	10w+IThA==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjKGr-0000000Bsny-4309
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:16:48 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4629051c9d1so55554f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 10:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=breiti.cc; s=google; t=1783963004; x=1784567804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D6+zJCN4uHBUySGZxMxtpjUmXPdT/OOFNXEwXFVOhXs=;
        b=UQwZj3H78XjnDSp26pz6T9xmCi6zU0Z6PaRbr1/qHPmTPPHiJEBNelPbi6DouUkOKr
         3cBHl14xOaSjCZryZjVXL3lCGkjQg3sFDtMGAdBzHoLUByKSU41WuWc1k6fhLAvCxDeJ
         lz2oHCEx++yiViUh4j50KT6d6SK0EmFEE2hUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783963004; x=1784567804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D6+zJCN4uHBUySGZxMxtpjUmXPdT/OOFNXEwXFVOhXs=;
        b=Q0C83nmlOar+oq/e5XCHneccJpvEFipDFFwjzukXXEU/o2XYvxc0yRRzHWMLlADalP
         qcy408I4GoDiUuaDqaySrR6h6pHxerqjED4+IdWcBGWKKct1YRgDyW1dWY3RrMye7sZa
         PNF/q635i0/sT3wT/We8ytksAd9tVjtk3r/29UP9BABIzv6l89JJ7ik51VPIOi2D+9Uj
         23vj9DpRSp1ga1If53Qbr40+vA/5PM0Ug+c5R4fhC/yEhf5mgYvQbXtwAT5z/6ZV/4Q4
         ZShBDEHGn6/8ESx9HCq1v8VNM/hAbqzQAsLWrWOE1LKyQknhRBo01zn+LRJljpekN1iU
         hQjw==
X-Forwarded-Encrypted: i=1; AHgh+RptC0rJvJ8lWufsNJ9ifbUeNPaVgaa97Brz6gW2bhYwuNdlhl9RMY/yFJ8VNpCq5bPsNsSfOm0J/c/PzpR1tM9p@lists.infradead.org
X-Gm-Message-State: AOJu0YwObvS1HzT2UuipswEgiuXRDwzKeyBCJbwxhM+OFbDad8aWWWoK
	rPlFvn+0FGRKD7WHqtOcJEbWKPYDZ7vyWnS053h6vrAxpj+Zgj0TF6JIjBKYu7X8JC9EwS3piMP
	6KlSlWtIT
X-Gm-Gg: AfdE7cmsTX5uAtwCIDN7mImhVki1Cl4UEEcThvXbwyMoDE81o148r5lGaWWLaqAP76d
	K07bpwB83qEaZc2YYx0eRDT0tdsaIz2cjTUgbfKS0Wjnxc80mbAtnLw+q2cR/6d0tlz+PUKkGL1
	gspb2wCajm0pw+HjjsjzmuKZ+/nTmgRBohPRaQYP0bkPADDizIV4pyAsT4XnMqiLQso647ykclI
	iVDR+JvYmjYCinHWsT/0atJb2RI+8Q6STWY2/W+vpfzraZkcVq4OIuR1bRTM+DnSS8mxXGOIlmF
	9NHaShLU4tLTVVnC9O9UsOLnhGYCHYYhTTN7wB0KC2q1QJADQJ6GKKNIlcaJl4k9OhezXOtO/w6
	vHczVaQQLlHDLZH6j7v3Jz+UM/SLVo+HM1gqY4f+44EK9yN5qUKfduTQr28IpmZpprf7VwjiZIt
	1UQ+RtJgGveSFKeFo/H5t7KUkpqD90zaSeiZvn7kmgMXYweXJ2Sw==
X-Received: by 2002:a05:6000:1848:b0:476:a715:1a with SMTP id ffacd0b85a97d-47f2dce2b61mr11893647f8f.41.1783963003297;
        Mon, 13 Jul 2026 10:16:43 -0700 (PDT)
Received: from framework.casa.breiti.cc ([2.57.48.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9728sm1007047f8f.21.2026.07.13.10.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:16:42 -0700 (PDT)
From: Markus Breitenberger <bre@breiti.cc>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	rmk+kernel@armlinux.org.uk,
	yong.liang.choong@linux.intel.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org,
	Markus Breitenberger <bre@keba.com>
Subject: [PATCH net v3] net: stmmac: intel: skip SerDes reconfig when rate is unchanged
Date: Mon, 13 Jul 2026 19:16:19 +0200
Message-ID: <20260713171619.192452-1-bre@breiti.cc>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_181646_107631_5A54E23F 
X-CRM114-Status: GOOD (  16.80  )
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

From: Markus Breitenberger <bre@keba.com>

intel_mac_finish() is registered as the phylink mac_finish()
callback for the Elkhart Lake SGMII ports. phylink calls it at
the end of every major link reconfiguration, including the
initial one during probe.

The callback selects the PMC ModPHY LCPLL programming for the
requested MAC-side interface and then power-cycles the SerDes.
On Elkhart Lake that ModPHY is also used by the on-die AHCI
SATA PHY. Reapplying the programming during the initial
boot-time link-up disturbs the shared analog block while it is
still driving SATA, so the SATA link fails to train:

  ata1: SATA link down (SStatus 1 SControl 300)

The disk carrying the root filesystem is never detected and the
system hangs at rootwait. Ethernet itself comes up normally,
which makes the failure look unrelated to the network driver.

Before mac_finish() runs, the legacy SerDes power-up path has
already programmed SERDES_GCR0 for the current interface. The
1G and 2.5G ModPHY tables selected by mac_finish() correspond
to the SerDes lane rate, so read that rate back from SERDES_GCR0
and skip the PMC reprogramming and SerDes power-cycle when it
already matches the selected interface.

This keeps the disruptive reprogramming out of the boot path
when the SerDes is configured correctly, while preserving the
previous behavior when a real SGMII/1000BASE-X to 2500BASE-X
rate change is needed. If the register read fails, reconfigure
as before.

Fixes: a42f6b3f1cc1 ("net: stmmac: configure SerDes according to the interface mode")
Cc: stable@vger.kernel.org
Assisted-by: GitHub-Copilot:claude-opus-4.8
Signed-off-by: Markus Breitenberger <bre@keba.com>
---
v3:
  - Update priv->plat->phy_interface before skipping SerDes reconfiguration,
    so SGMII <-> 1000BASE-X changes still update the cached interface.
  - Rename subject to "net: stmmac: intel: skip SerDes reconfig when rate is unchanged".

v2: https://lore.kernel.org/netdev/20260709190329.124432-1-bre@breiti.cc/
  - Read current SerDes lane rate from SERDES_GCR0 instead of comparing
    against cached phy_interface state.
  - Rework commit message.
  - Keep previous behavior if SERDES_GCR0 read fails.

v1: https://lore.kernel.org/netdev/20260706061954.94842-1-bre@breiti.cc/

 .../net/ethernet/stmicro/stmmac/dwmac-intel.c | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
index b8d467ba6d72..4d207f41a43b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c
@@ -525,6 +525,32 @@ static int intel_set_reg_access(const struct pmc_serdes_regs *regs, int max_regs
 	return ret;
 }
 
+/*
+ * Return true if the SerDes lane rate must change to serve @interface.
+ * If the current rate cannot be determined, reconfigure as before.
+ */
+static bool intel_serdes_needs_reconfig(struct stmmac_priv *priv,
+					struct intel_priv_data *intel_priv,
+					phy_interface_t interface)
+{
+	u32 cur_rate, want_rate;
+	int data;
+
+	if (!intel_priv->mdio_adhoc_addr)
+		return true;
+
+	data = mdiobus_read(priv->mii, intel_priv->mdio_adhoc_addr,
+			    SERDES_GCR0);
+	if (data < 0)
+		return true;
+
+	cur_rate = (data & SERDES_RATE_MASK) >> SERDES_RATE_PCIE_SHIFT;
+	want_rate = interface == PHY_INTERFACE_MODE_2500BASEX ?
+			SERDES_RATE_PCIE_GEN2 : SERDES_RATE_PCIE_GEN1;
+
+	return cur_rate != want_rate;
+}
+
 static int intel_mac_finish(struct net_device *ndev,
 			    void *intel_data,
 			    unsigned int mode,
@@ -536,6 +562,11 @@ static int intel_mac_finish(struct net_device *ndev,
 	int max_regs = 0;
 	int ret = 0;
 
+	if (!intel_serdes_needs_reconfig(priv, intel_priv, interface)) {
+		priv->plat->phy_interface = interface;
+		return 0;
+	}
+
 	ret = intel_tsn_lane_is_available(ndev, intel_priv);
 	if (ret < 0) {
 		netdev_info(priv->dev, "No TSN lane available to set the registers.\n");
-- 
2.55.0


