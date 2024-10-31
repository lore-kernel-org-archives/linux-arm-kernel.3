Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1D7D74959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVhsPMRQqpy2OnJpha195VCCt6s/CZrRESIlVmFiY5k=; b=REwazGXYIvp6k79bahY1ameUOF
	vTE9Q1/YpgUTkfmspuB+f/eRd/dMLzNvJhxtLYKKzc+/JKjBMvMXZWTHwkV4VolOSENDb45WZJ0w4
	8VvlDlfu0I41pR8YKQYtktdCdXg7wfmSpd7rw7h1fRSfiYFbGT2CKK5bzhSg3s70kwSBtZgBo1vHB
	4Dhet7OT10yn+ab0JTbpeklMVgHYDKCfxChAkaAlEGwqn40emHyFa/u99nss6d2MDdYDpjMMbxWt9
	TEyVbJwQXQW3j1o+wUHODvsk8DJroxZUGiUP/r/bFec1dYd2ixDtQpwDQ/nl5vWjbIcxKznADbOAZ
	lyEgjPzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Utf-00000003dFD-3OF4;
	Thu, 31 Oct 2024 13:07:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6USI-00000003YTw-2m33
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:39:16 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-720c286bcd6so306944b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 05:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730378354; x=1730983154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVhsPMRQqpy2OnJpha195VCCt6s/CZrRESIlVmFiY5k=;
        b=m1DQ0SZD5yyk0OhGIS2Dk2Em8lMlnl2rtAMvHl4gM5hjuSDtKaHM5QagV3lSctxroe
         gxNkov5kNmvivuV5MX7oqbCMuVQCRNWcRrdqRkn1x/pCkGUr9W/Y6p9b5oRn6K56WPcc
         UC+W4BgGNrAXpNupYHz0iunYOy390TiWlMQEGlJAtj7qbOCJyeIn2sr6ckjDtBlvd0PO
         mrUfYhkw5mMX1h/5+gzBZi4UV95YmIrzVopk5PAkrBKtouVnvvAHJiVCxE41PkQpOt6k
         9I3Y4yYi8LI7Th70e5sFRe1+7gvUwmoQ0Cy28updDIZuMRRAQ0nX/2/b3DTWlJAKRKrZ
         wmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730378354; x=1730983154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVhsPMRQqpy2OnJpha195VCCt6s/CZrRESIlVmFiY5k=;
        b=XsleCNGcuYisiUWdMyAgut+yvvmHp/daC1N8YRui1THkXJrLLEgBiRWpXWbQiBE7wz
         /NvPxNetnmHMDSAhhS/SRv7fsyBBI56dSeu2GEpEHEyzVqAjtQLqWbjDxqkERppY81yb
         /uTN7v8vMj3WghUG7MaDoY34io8HmXs/+IGh+t4/akZBeTb+d5gdX8qk+H8RN7iMtH2c
         LuwJkxi//IlHyedDjSaPE3YnA670SiZfj4OOSQliftiEpjwFn5ny17qTrv09rL3C+k8M
         mmBfAzGOiFGSov45+eWbcwtL+Wa5lkK6Jn2uvTgdmRS4GvDgv1eFY1/GteSn+OmsDN2l
         vorA==
X-Forwarded-Encrypted: i=1; AJvYcCUV1k1Ce/V0YK08G2gEqHUoFp3gBL+US3m5KGfpTRvt2JkpHZ7NmBPRD+9IU6U0eowvO36KRgaOnOMZeUpxB6kZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+MyZCr3ku3tnw1ix3QagesccZEtLk86hRDazQvOA9UHP5uqCz
	bF88WiLf8ey/qcpidNjSaBG4w00Sqrz73hdWrrvriv95O5ZJ6ZOc
X-Google-Smtp-Source: AGHT+IH3Zm14ICyR7iSwgMxwf/UKQHEUEgmjsMUWQ2oRzm5QVHyY5n9VwcbYyUIviTW6vDUpdnWv/w==
X-Received: by 2002:a05:6a21:6801:b0:1d9:3a26:4396 with SMTP id adf61e73a8af0-1d9a83d6622mr24295744637.12.1730378353991;
        Thu, 31 Oct 2024 05:39:13 -0700 (PDT)
Received: from localhost.localdomain ([129.146.253.192])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-720bc20f50esm1075931b3a.94.2024.10.31.05.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 05:39:13 -0700 (PDT)
From: Furong Xu <0x1207@gmail.com>
To: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Vladimir Oltean <olteanv@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	xfr@outlook.com,
	Furong Xu <0x1207@gmail.com>
Subject: [PATCH net-next v7 7/8] net: stmmac: xgmac: Complete FPE support
Date: Thu, 31 Oct 2024 20:38:01 +0800
Message-Id: <bab693ebdddffa410c3bdb34fb5d8d62d3edd156.1730376866.git.0x1207@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730376866.git.0x1207@gmail.com>
References: <cover.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_053914_726109_802B2BF1 
X-CRM114-Status: GOOD (  16.05  )
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

Implement the necessary fpe_map_preemption_class callback for xgmac.

Signed-off-by: Furong Xu <0x1207@gmail.com>
---
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |  2 +
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.c  | 43 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_fpe.h  |  3 ++
 3 files changed, 48 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
index de6ffda31a80..9a60a6e8f633 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
@@ -1545,6 +1545,7 @@ const struct stmmac_ops dwxgmac210_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 static void dwxlgmac2_rx_queue_enable(struct mac_device_info *hw, u8 mode,
@@ -1601,6 +1602,7 @@ const struct stmmac_ops dwxlgmac2_ops = {
 	.config_l3_filter = dwxgmac2_config_l3_filter,
 	.config_l4_filter = dwxgmac2_config_l4_filter,
 	.set_arp_offload = dwxgmac2_set_arp_offload,
+	.fpe_map_preemption_class = dwxgmac3_fpe_map_preemption_class,
 };
 
 int dwxgmac2_setup(struct stmmac_priv *priv)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
index b833ccf3e455..884b37ad0347 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c
@@ -351,6 +351,49 @@ int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 	return 0;
 }
 
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack, u32 pclass)
+{
+	u32 val, offset, count, preemptible_txqs = 0;
+	struct stmmac_priv *priv = netdev_priv(ndev);
+	int num_tc = netdev_get_num_tc(ndev);
+
+	if (!num_tc) {
+		/* Restore default TC:Queue mapping */
+		for (u32 i = 0; i < priv->plat->tx_queues_to_use; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+			writel(u32_replace_bits(val, i, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(i));
+		}
+	}
+
+	/* Synopsys Databook:
+	 * "All Queues within a traffic class are selected in a round robin
+	 * fashion (when packets are available) when the traffic class is
+	 * selected by the scheduler for packet transmission. This is true for
+	 * any of the scheduling algorithms."
+	 */
+	for (u32 tc = 0; tc < num_tc; tc++) {
+		count = ndev->tc_to_txq[tc].count;
+		offset = ndev->tc_to_txq[tc].offset;
+
+		if (pclass & BIT(tc))
+			preemptible_txqs |= GENMASK(offset + count - 1, offset);
+
+		for (u32 i = 0; i < count; i++) {
+			val = readl(priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+			writel(u32_replace_bits(val, tc, XGMAC_Q2TCMAP),
+			       priv->ioaddr + XGMAC_MTL_TXQ_OPMODE(offset + i));
+		}
+	}
+
+	val = readl(priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+	writel(u32_replace_bits(val, preemptible_txqs, FPE_MTL_PREEMPTION_CLASS),
+	       priv->ioaddr + XGMAC_MTL_FPE_CTRL_STS);
+
+	return 0;
+}
+
 const struct stmmac_fpe_reg dwmac5_fpe_reg = {
 	.mac_fpe_reg = GMAC5_MAC_FPE_CTRL_STS,
 	.mtl_fpe_reg = GMAC5_MTL_FPE_CTRL_STS,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
index 2f8bceaf7a0a..4d17302bc868 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.h
@@ -27,6 +27,9 @@ void stmmac_fpe_set_add_frag_size(struct stmmac_priv *priv, u32 add_frag_size);
 
 int dwmac5_fpe_map_preemption_class(struct net_device *ndev,
 				    struct netlink_ext_ack *extack, u32 pclass);
+int dwxgmac3_fpe_map_preemption_class(struct net_device *ndev,
+				      struct netlink_ext_ack *extack,
+				      u32 pclass);
 
 extern const struct stmmac_fpe_reg dwmac5_fpe_reg;
 extern const struct stmmac_fpe_reg dwxgmac3_fpe_reg;
-- 
2.34.1


