Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119BCCD37B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPHPI+9Wznmiax2v76IDGtv5i4j3rVbj+78TUt3yhOk=; b=rzNmi6hibSn2wXPqaIyKA+dE3P
	2Kyl6CGbihksRK5l4p5fgPMJ9Ck4gd4DoSdPDD9Fkv01C+V/4JC7dg06O3+1Hs99/7QB4c9rv2Px+
	bgn0OzjCDmdzoI2D3TU9nU8jAQsuqUeOnZavUMMvRDW82FSN+iscKu1fWNg1+As/sKR5VgW3qr5Ke
	j4Zyz+kn1zuujRrw7gtvnI8NTiqji20tNmzDbq1rO/qOJ5lwweDD5I2mJNXCMkdclLHUfEnGfaEDG
	DJoNu7SImQvaXNlL+t/IQToPF2KoHNnQr4AnsunbLwh2QO6MCni8R7DxvAkXLdIGKt/3Ldzcg92Yb
	uzGuVb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMODH-0000000DAOT-3TSg;
	Mon, 11 May 2026 10:50:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMODC-0000000DAFU-1ilL;
	Mon, 11 May 2026 10:50:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D62DF60120;
	Mon, 11 May 2026 10:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3626FC2BCB0;
	Mon, 11 May 2026 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778496609;
	bh=ZGDU8bLS0RFcij++u0hWkUdegThJdVgUR6iLpLo5Q9s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GUYiFhVDQZ0Wqn7HU26kzvTlEq6jGZ7Mo+vDBK4bHKihG9oIX9Kh9JiYx38+pGjjp
	 8ZONRJ3phY4MWrekmagMZ3ODNF4QzjPPnO8Jw/EmhT1pNAqczQ2+u6jsJm2zvz/fc7
	 zFMdvXEZEHHQpUGvnEy7xbBUo5iFl6FcxCL5vUeFwsgZO/hTek2IA6wXQcYNv9TuNF
	 fGw+WmphZvnpU4SlsOx+MatjiDsFeqjln+h+kBDTYtSbQc0tLXLSfWOtrkM5OA6PV4
	 yteiDjerCp55odmV/iFsXx14youjVlgRcB5faL7d7P/UufGGkjw7O1LEC9AaU6YTw8
	 8xMhAZJyEWRwg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 11 May 2026 12:49:33 +0200
Subject: [PATCH net-next v6 07/12] net: airoha: Move {cpu,fwd}_tx_packets
 in airoha_gdm_dev struct
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-airoha-eth-multi-serdes-v6-7-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-0-c899462c4f75@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
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

Since now multiple net_devices connected to different QDMA blocks can
share the same GDM port, cpu_tx_packets and fwd_tx_packets fields can
be overwritten with the value from a different QDMA block. In order to
fix the issue move cpu_tx_packets and fwd_tx_packets fields from
airoha_gdm_port struct to airoha_gdm_dev one.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 16 +++++++---------
 drivers/net/ethernet/airoha/airoha_eth.h |  7 +++----
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 033541df2f83..f0d5f28dd731 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2312,19 +2312,17 @@ static int airoha_qdma_get_tx_ets_stats(struct net_device *netdev, int channel,
 					struct tc_ets_qopt_offload *opt)
 {
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
-	struct airoha_gdm_port *port = dev->port;
+	struct airoha_qdma *qdma = dev->qdma;
 
-	u64 cpu_tx_packets = airoha_qdma_rr(dev->qdma,
-					    REG_CNTR_VAL(channel << 1));
-	u64 fwd_tx_packets = airoha_qdma_rr(dev->qdma,
+	u64 cpu_tx_packets = airoha_qdma_rr(qdma, REG_CNTR_VAL(channel << 1));
+	u64 fwd_tx_packets = airoha_qdma_rr(qdma,
 					    REG_CNTR_VAL((channel << 1) + 1));
-	u64 tx_packets = (cpu_tx_packets - port->cpu_tx_packets) +
-			 (fwd_tx_packets - port->fwd_tx_packets);
+	u64 tx_packets = (cpu_tx_packets - dev->cpu_tx_packets) +
+			 (fwd_tx_packets - dev->fwd_tx_packets);
 
 	_bstats_update(opt->stats.bstats, 0, tx_packets);
-
-	port->cpu_tx_packets = cpu_tx_packets;
-	port->fwd_tx_packets = fwd_tx_packets;
+	dev->cpu_tx_packets = cpu_tx_packets;
+	dev->fwd_tx_packets = fwd_tx_packets;
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index a308a770116b..fbb50dc73af8 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -544,6 +544,9 @@ struct airoha_gdm_dev {
 	struct airoha_eth *eth;
 
 	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
+	/* qos stats counters */
+	u64 cpu_tx_packets;
+	u64 fwd_tx_packets;
 };
 
 struct airoha_gdm_port {
@@ -553,10 +556,6 @@ struct airoha_gdm_port {
 
 	struct airoha_hw_stats stats;
 
-	/* qos stats counters */
-	u64 cpu_tx_packets;
-	u64 fwd_tx_packets;
-
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
 

-- 
2.54.0


