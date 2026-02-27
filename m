Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3BEFEFB5A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UvdCMVXNkI/EVJIJ08lgsNiiM1urOIBw1ejvKhzqK1Y=; b=pWAfDyLNI7vgi9OE2+kiWoHEzy
	ZjCrQ/iXG4QZgwJQ+IbYVIKFNgv3TMJ3VSUohnMcTH91+izlPsGladW7MHvd1V+30kh5eqsTIeuY1
	S06tw9PdUa1Nf6WTdM1/9Phuf6I+jRewbtASGuY5MqfwE8+5OUJ9O/hhFsJ2LTwJe5UMyeZmn5lLp
	XHfWAsGfOpA45Ms1n1ePAkdzUbS9rncTs56EZf2+u4gmv+BvdFvEO8GKkiugHglo3vuvA8KYqkJb/
	qlEqOWENCllBFSHpVSBnlyCsi+o4ZXZAKz8t372eC3IkKdN6kOaIGlt0R8Fb6yAbYFTlyWnkPRtqi
	qETs9QUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHk-00000008XDC-3yUh;
	Fri, 27 Feb 2026 14:57:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHb-00000008X8X-01rv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204253; x=1803740253;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=RQO7SOnyMSiFimAVkR4/LqCQgGBb+zZjAdqVt9ehHc0=;
  b=ZFQBVn2TnMHtrZxMYAeMOs/lWFDtU0+SwQYeB5q1LaNY+ST3yo7AgVjM
   wnQ3mNjvdHwBzkEd3uh+LTaR1loNjKNH05KoAYi79LlyOVKd2UWVXFbfZ
   fMHXmWjFn6/xGXfl3jJsQxuuKoqrXV98+EEvZpyR3f6s2EUoMrc4Nk5iB
   28Xbob/4Sd5UXgVbYz6Km+4cf4pqAm+wADDqQ5/F7yx5f9+7L5Ev9TBgy
   809hT7fun0G90puQ3WxdNaihiEqp6Ux+Fr8uhCVGBFj16YQJ4YS3kZWWJ
   3HreBL7ld05ItjSRlFEs0dczJ5kxn+D5oFHQ5OxW1eHH28q+XjXKQsW4R
   g==;
X-CSE-ConnectionGUID: wgI98+BBT5OZU+rH87zgwA==
X-CSE-MsgGUID: fAnVqOe3R9CLic7WyNqizg==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="53970562"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 07:57:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 07:57:11 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:09 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:43 +0100
Subject: [PATCH net-next v2 5/9] net: sparx5: move calendar initialization
 to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-5-10ba54ccf005@microchip.com>
References: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
In-Reply-To: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <maxime.chevallier@bootlin.com>,
	<rmk+kernel@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065735_062954_0504B251 
X-CRM114-Status: GOOD (  13.62  )
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

Move the calendar initialization from sparx5_start() to probe() by
creating a new sparx5_calendar_init() wrapper function that calls both
sparx5_config_auto_calendar() and sparx5_config_dsm_calendar().
Calendar initialization does not require cleanup.

Also, make the individual calendar config functions static since they
are now only called from within sparx5_calendar.c.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c | 15 +++++++++++++--
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c     | 14 ++++++--------
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h     |  3 +--
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index 5c46d81de530..4ec95590a3c6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -151,7 +151,7 @@ enum sparx5_cal_bw sparx5_get_port_cal_speed(struct sparx5 *sparx5, u32 portno)
 }
 
 /* Auto configure the QSYS calendar based on port configuration */
-int sparx5_config_auto_calendar(struct sparx5 *sparx5)
+static int sparx5_config_auto_calendar(struct sparx5 *sparx5)
 {
 	const struct sparx5_consts *consts = sparx5->data->consts;
 	u32 cal[7], value, idx, portno;
@@ -578,7 +578,7 @@ static int sparx5_dsm_calendar_update(struct sparx5 *sparx5, u32 taxi,
 }
 
 /* Configure the DSM calendar based on port configuration */
-int sparx5_config_dsm_calendar(struct sparx5 *sparx5)
+static int sparx5_config_dsm_calendar(struct sparx5 *sparx5)
 {
 	const struct sparx5_ops *ops = sparx5->data->ops;
 	int taxi;
@@ -610,3 +610,14 @@ int sparx5_config_dsm_calendar(struct sparx5 *sparx5)
 	kfree(data);
 	return err;
 }
+
+int sparx5_calendar_init(struct sparx5 *sparx5)
+{
+	int err;
+
+	err = sparx5_config_auto_calendar(sparx5);
+	if (err)
+		return err;
+
+	return sparx5_config_dsm_calendar(sparx5);
+}
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index bcc7b895fad6..a58c79a6e873 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -735,14 +735,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	/* Enable queue limitation watermarks */
 	sparx5_qlim_set(sparx5);
 
-	err = sparx5_config_auto_calendar(sparx5);
-	if (err)
-		return err;
-
-	err = sparx5_config_dsm_calendar(sparx5);
-	if (err)
-		return err;
-
 	sparx5_board_init(sparx5);
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */
@@ -957,6 +949,12 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_ports;
 	}
 
+	err = sparx5_calendar_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize calendar\n");
+		goto cleanup_ports;
+	}
+
 	err = sparx5_qos_init(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to initialize QoS\n");
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 97d53e229ad6..6a745bb71b5c 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -504,8 +504,7 @@ int sparx5_vlan_vid_del(struct sparx5_port *port, u16 vid);
 void sparx5_vlan_port_apply(struct sparx5 *sparx5, struct sparx5_port *port);
 
 /* sparx5_calendar.c */
-int sparx5_config_auto_calendar(struct sparx5 *sparx5);
-int sparx5_config_dsm_calendar(struct sparx5 *sparx5);
+int sparx5_calendar_init(struct sparx5 *sparx5);
 int sparx5_dsm_calendar_calc(struct sparx5 *sparx5, u32 taxi,
 			     struct sparx5_calendar_data *data);
 u32 sparx5_cal_speed_to_value(enum sparx5_cal_bw speed);

-- 
2.34.1


