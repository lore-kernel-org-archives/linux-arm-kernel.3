Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC62E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkF5CuLzlj4YexrimX6yvnKDwdwZkFim8VlA68T6vLg=; b=HPQxS01DvLMm7MTlO6RShhQzU2
	CdI+TZjDFL6nq2fwTt3E0W0YpP9UPwKwlqX3Az1TOSPJy4j8H+6KCCNRgh21sOKISM7XyLn/A0i/U
	VOio6bVpqtxM3J7Vjx/yDocpQ94ZG6LfeZ0aEKyyB6M64jVQdkoVx/lVAcU78OYRxhUh5/+kfDx9k
	0PEgQvf/YfILzadUTfu5jI0m5qBvaCuQDhcXB8MVQAFyDm9F/GislNjHCqP4t+HAZVjUM6dFsXGAs
	bNyKuGezSkhRW+pJByPKk0LxLCGMIuHgUdV2ykHyVHXR1gYKFa3IgiyI2uGTx3zhCsoi7snFO0ihP
	j3tgu2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdRn-000000053na-0gBC;
	Fri, 20 Dec 2024 13:53:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdNl-000000052yZ-1oW3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702573; x=1766238573;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=f9N4cjCL7AQUWpWoUzjp0YoOJ9dulWtKQrBgiqaTXUI=;
  b=pCDktikKjE7K9CESaDfrlYLnELS9UXxtmgsSufyzH+rs6f9UnWSRTPei
   EdO7MPAWrfJpjLko4zTWuqZTCt+l6R38uqQO2vIaoBnZuocUmyMwbzYR6
   tEvcPc4qb4U5gT58ccNak3AC1511ivJk7/Tl5yjRn4lsD03XGDD0SLPye
   5U5dFzRvNc3ZJwfXov0W1INr9Cy/qb0cTN34MF3XZjBKFvdnalzutpFXM
   PITZzac7pne4A/F78cOBwmPxXUWTbe29Jt4fbfNl+U2NnUu44FAM1GwRd
   aHKb/tRaCvKoE+cqMws/pzliJYUQPBjHse5sISxiYnlkuivU5yjxCm2Pg
   A==;
X-CSE-ConnectionGUID: mIAoSPyhQLi+IAfuQfXUsw==
X-CSE-MsgGUID: qfaCsMdYSKyS3MljnPjnUA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="267028400"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:33 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:48:58 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:48:54 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Dec 2024 14:48:41 +0100
Subject: [PATCH net-next v5 2/9] net: sparx5: add function for RGMII port
 check
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-2-fa8ba5dff732@microchip.com>
References: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
In-Reply-To: <20241220-sparx5-lan969x-switch-driver-4-v5-0-fa8ba5dff732@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_054933_483274_C5E6BE9D 
X-CRM114-Status: GOOD (  11.36  )
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

The lan969x device contains two RGMII port interfaces, sitting at port
28 and 29. Add function: is_port_rgmii() to the match data ops, that
checks if a given port is an RGMII port or not. For Sparx5, this
function always returns false.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 1 +
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.h | 5 +++++
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c     | 1 +
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h     | 1 +
 drivers/net/ethernet/microchip/sparx5/sparx5_port.h     | 5 +++++
 5 files changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index c2afa2176b08..76f0c8635eb9 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -329,6 +329,7 @@ static const struct sparx5_ops lan969x_ops = {
 	.is_port_5g              = &lan969x_port_is_5g,
 	.is_port_10g             = &lan969x_port_is_10g,
 	.is_port_25g             = &lan969x_port_is_25g,
+	.is_port_rgmii           = &lan969x_port_is_rgmii,
 	.get_port_dev_index      = &lan969x_port_dev_mapping,
 	.get_port_dev_bit        = &lan969x_get_dev_mode_bit,
 	.get_hsch_max_group_rate = &lan969x_get_hsch_max_group_rate,
diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.h b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.h
index 2489d0d32dfd..4b91c47d6d21 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.h
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.h
@@ -59,6 +59,11 @@ static inline bool lan969x_port_is_25g(int portno)
 	return false;
 }
 
+static inline bool lan969x_port_is_rgmii(int portno)
+{
+	return portno == 28 || portno == 29;
+}
+
 /* lan969x_calendar.c */
 int lan969x_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 			      struct sparx5_calendar_data *data);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index f61aa15beab7..4be717ba7d37 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -1072,6 +1072,7 @@ static const struct sparx5_ops sparx5_ops = {
 	.is_port_5g              = &sparx5_port_is_5g,
 	.is_port_10g             = &sparx5_port_is_10g,
 	.is_port_25g             = &sparx5_port_is_25g,
+	.is_port_rgmii           = &sparx5_port_is_rgmii,
 	.get_port_dev_index      = &sparx5_port_dev_mapping,
 	.get_port_dev_bit        = &sparx5_port_dev_mapping,
 	.get_hsch_max_group_rate = &sparx5_get_hsch_max_group_rate,
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index d5dd953b0a71..c58d7841638e 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -313,6 +313,7 @@ struct sparx5_ops {
 	bool (*is_port_5g)(int portno);
 	bool (*is_port_10g)(int portno);
 	bool (*is_port_25g)(int portno);
+	bool (*is_port_rgmii)(int portno);
 	u32  (*get_port_dev_index)(struct sparx5 *sparx5, int port);
 	u32  (*get_port_dev_bit)(struct sparx5 *sparx5, int port);
 	u32  (*get_hsch_max_group_rate)(int grp);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
index 9b9bcc6834bc..c8a37468a3d1 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.h
@@ -40,6 +40,11 @@ static inline bool sparx5_port_is_25g(int portno)
 	return portno >= 56 && portno <= 63;
 }
 
+static inline bool sparx5_port_is_rgmii(int portno)
+{
+	return false;
+}
+
 static inline u32 sparx5_to_high_dev(struct sparx5 *sparx5, int port)
 {
 	const struct sparx5_ops *ops = sparx5->data->ops;

-- 
2.34.1


