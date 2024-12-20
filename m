Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E7E7718D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SfIdG/zngZJo4mhrzhTdm2UfHAFj9fCdMXTQ5I5WBqg=; b=H38bq+64yQFwDC1eqIFf4R75Zy
	fNuGYT4XXE/ENO1bEDmN1ibkzOWAESXqRKWwa2VKNue9WAMWV/BNhi7wtsrKlJSmyZjeGOH/H5Ta8
	FfpSa2IJTfuUb9BEjxlq6MFhyoE4pHo3YTMbio0eN1WlN2E/sADOppJKAGgjWBLknXuNMzXECwyeO
	NCCIURjjLaYvQiy2M6xNtFeJsMO0bZoIP8ayaKVyEF/mkzUhT7YD4C9U8A4Qx0b+efsUHqnM/TRhp
	mYVKtHcwPoOA/bQa0iyyJyEvI/5hBa/msV5JdexyvqzYBkXzYddydAX5+nnpoLvH9jCK2BcCPwFY/
	+bjGhSaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdVA-000000054Qd-0MuM;
	Fri, 20 Dec 2024 13:57:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdNn-00000005300-3ECq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734702575; x=1766238575;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ZtCuUUw/6z67FIWk5TCdAKY5GIL2TBg4zuoZcoCP/PI=;
  b=khd2qB/r/+kmFnc7H9jAmLIjb3nJF2ysHbip5Ji+SczbQGH0gnqmF+ln
   o/LasnhA8qOSYp62M0oh0RkT5TgGFiRfgwb5sdxAeZy8a4z7kBjSBOOoi
   lf5t6CTNlaEnV7CS8PqAPWa9emTz5ekT1MP9PoV+OsHYSOkU6Et7dXGoq
   z9xj7bbG70VU0McpJA19y3T/kLwMLqJUCMQqlvWhdduTSECJttoODMaIW
   xtlxphnQHXIIQf4DtiurDSJ/sg7AYVq5EYWGToIzlxHYyueFqxkvNyoQE
   5Lml8cWMAXrCvaDNhwMDfqbgkykZvt8VIKn+7uuRQi956Ha9/MzkbAx+v
   g==;
X-CSE-ConnectionGUID: VjWhna/kQWqvw5X1MetOhw==
X-CSE-MsgGUID: JBnhnQwnRtayb1IgA2zJXA==
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="36250026"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Dec 2024 06:49:35 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 20 Dec 2024 06:49:04 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 20 Dec 2024 06:49:01 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 20 Dec 2024 14:48:43 +0100
Subject: [PATCH net-next v5 4/9] net: sparx5: skip low-speed configuration
 when port is RGMII
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-sparx5-lan969x-switch-driver-4-v5-4-fa8ba5dff732@microchip.com>
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
X-CRM114-CacheID: sfid-20241220_054935_880625_4E7769E1 
X-CRM114-Status: GOOD (  12.36  )
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

When doing a port config, we configure low-speed port devices, among
other things. We have a check to ensure, that the device is indeed a
low-speed device, an not a high-speed device. Add an additional check,
to ensure that the device is not an RGMII device.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Tested-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_port.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
index 996dc4343019..0a1374422ccb 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_port.c
@@ -994,6 +994,7 @@ int sparx5_port_config(struct sparx5 *sparx5,
 		       struct sparx5_port *port,
 		       struct sparx5_port_config *conf)
 {
+	bool rgmii = phy_interface_mode_is_rgmii(conf->phy_mode);
 	bool high_speed_dev = sparx5_is_baser(conf->portmode);
 	const struct sparx5_ops *ops = sparx5->data->ops;
 	int err, urgency, stop_wm;
@@ -1003,7 +1004,7 @@ int sparx5_port_config(struct sparx5 *sparx5,
 		return err;
 
 	/* high speed device is already configured */
-	if (!high_speed_dev)
+	if (!rgmii && !high_speed_dev)
 		sparx5_port_config_low_set(sparx5, port, conf);
 
 	/* Configure flow control */

-- 
2.34.1


