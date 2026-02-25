Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CEAEFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uye1UA30SkdVHNZvGvKZSXA4ibmzBFvP4vpmNEycDIk=; b=f0OQ64Km0kz6IgcC/K7HxWskxJ
	MX44qHbpy8z3TWbxNYjlowBoFUUDshIuz+PKNEyqWPAnyb07x8Uu6JvXJGb/08DPp7SyeCl8z5p51
	hlcPlySgzrpIq3T1Vq6RaYk4YLtR7cpUESBAh/owGmeIZlS/IfI1WIuF6s1Hx9fgsp+ggseva4eva
	02DO+0l1WnaeeYYm/D9IooOm/Jqp/ySHXCFa+qqrr3s211I6kVmZfR1DP2CG384tGks+gqAgsQ6kc
	QGSC7qgh8Zc0Ho67WDMrKb4tWw6/b6mwKrviN+bCp7StMxNi1wnwrpMUoo8Re3mLpgowTTRMWUWki
	C7tQxkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqm-00000003cxo-1824;
	Wed, 25 Feb 2026 09:06:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqh-00000003cvb-0Tyu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010386; x=1803546386;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=jAVzK5Hc/AzuV81zaf70lHzotLsm9hxK1qHPaNtwaEs=;
  b=aqbm98fAacvvuKiFpcyxLIRrwijMGM7loOF30uuLPtMVGAcQysOJQXJl
   ijklZ+xYJKyYlnFWr95NRaKWqu8zajCqJpG2MTGubCcGp5dhVrvv48KXX
   nWm1yRfTb19tcL0GiJ/w71/1vcOfdJQgpYifvCqt4o/LiFpDpMhupYRuO
   B5hoT8t+1wKSJm89zmEWt4Kdvz2Ezs0u7gakC4wT5W6kenEfc55Uhn4pa
   toxmzRCviqtNhcwl7OtdqYzRbIwc5D8CSfN58kZ48EP57lYrp+T++pUQI
   Yg/LVJuKWyX/S+qYSgfnItSU1TvfQleYh62558ezb6c8aAwElIbQAfjIE
   g==;
X-CSE-ConnectionGUID: GvK6L9OjSSuGPw39llTOAQ==
X-CSE-MsgGUID: M+9u7YjXSSqJIOES4TKBzw==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61259303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:06:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 02:06:21 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:19 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:29 +0100
Subject: [PATCH net-next 6/7] net: sparx5: move calendar initialization to
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-6-97036580b9f0@microchip.com>
References: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
In-Reply-To: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_010627_165888_81A3C76C 
X-CRM114-Status: GOOD (  14.52  )
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
index 17748854ca48..581f87eb9781 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -740,14 +740,6 @@ static int sparx5_start(struct sparx5 *sparx5)
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
 	mutex_init(&sparx5->mdb_lock);
 	INIT_LIST_HEAD(&sparx5->mdb_entries);
 
@@ -947,6 +939,12 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		}
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


