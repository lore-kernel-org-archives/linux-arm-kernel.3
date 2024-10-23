Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF395D0BB40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeFq2Ucz7Jv3jb9tkc3FkG7WLt654x6qTP95uAk1g/4=; b=jaHyj+M5muEjYbiXnIccyELuAe
	IK5wv3ayZ5XHkq9dVgX0voNtaL4fBUWkucsrkR/L4r6GjG3wS9JyroXhhIKoSUylZYmCNev207eMV
	8lK5SrP5Ox6hEQ3pjFh3xwFcul1pu2+b3bCKd1/JAmtCMz0w2DBKJe6N3R3igmWUVsfMNsK6Q/I44
	+gU+AorYG/wEpKuhXV0jbJZjhwEx1FYcxfmidmzX2IvWjEhA9MIFMlXAHbtyT8zom0wvXVvNQVKGI
	1l1FNAULmMxAdKM3KVrc2tc1EUwv2cJLnWopaSusA38RedtAA8xfyNwq/RUzOz2ENBpzkzyDj6S5C
	uElJRAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jUv-0000000G3Jm-1rBp;
	Wed, 23 Oct 2024 22:06:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jQb-0000000G27A-1aUh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729720925; x=1761256925;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=D+pngnpKeWqkazA+ixceYniwTUm1eq9HUVMG96pBj/o=;
  b=Sf77NbXKKBQMCWbgcEO7Wjw9ln+jmJRY5igvDLU9tNPKKZj71+2gmEoN
   NUutp7kAmTip07N1Ei0i8JL97ma6S0GfbzNhXCAyvWroaajf+N9MI3LfE
   OOc1JkPQD9guvDjCfuaXucuO96PcpznN1eUfN0rCODrR0++E/8AxXGeVy
   5mkEqzowi1P5VSeQnwN1VlujYHl4xAEVbfLByclF9BCEhtwvHZV/cInuC
   0L8ck7DZadsV7UOEflHsT3KrPIiEp61d8B2JtpYueA1DFsvlgqR5x8KvA
   fE4LmhSLKU9SBKwwVcsD3dxUwH7SuOTf4XPgb/v4IcTuSCBk/Z2tuleP9
   A==;
X-CSE-ConnectionGUID: 1Xapdzk8QAqz3uJYdYtrIg==
X-CSE-MsgGUID: XHMw/OD/RVyqCjWt6K85VA==
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33409629"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Oct 2024 15:02:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 23 Oct 2024 15:01:47 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 23 Oct 2024 15:01:43 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 24 Oct 2024 00:01:21 +0200
Subject: [PATCH net-next v2 02/15] net: sparx5: change spx5_wr to spx5_rmw
 in cal update()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-sparx5-lan969x-switch-driver-2-v2-2-a0b5fae88a0f@microchip.com>
References: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
In-Reply-To: <20241024-sparx5-lan969x-switch-driver-2-v2-0-a0b5fae88a0f@microchip.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<horatiu.vultur@microchip.com>, <jensemil.schulzostergaard@microchip.com>,
	<Parthiban.Veerasooran@microchip.com>, <Raju.Lakkaraju@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, <jacob.e.keller@intel.com>,
	<ast@fiberby.net>, <maxime.chevallier@bootlin.com>, <horms@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <devicetree@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_150205_453603_4FEBFC9D 
X-CRM114-Status: GOOD (  10.84  )
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

In preparation for lan969x, use spx5_rmw() for enabling the update of
the calendar. This is required to not overwrite the DSM_TAXI_CAL_CFG
register, as an additional write will be added before this one, in a
subsequent patch.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
index 1ae56194637f..edc03b6ebf34 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_calendar.c
@@ -546,9 +546,10 @@ static int sparx5_dsm_calendar_update(struct sparx5 *sparx5, u32 taxi,
 	u32 idx;
 	u32 cal_len = sparx5_dsm_cal_len(data->schedule), len;
 
-	spx5_wr(DSM_TAXI_CAL_CFG_CAL_PGM_ENA_SET(1),
-		sparx5,
-		DSM_TAXI_CAL_CFG(taxi));
+	spx5_rmw(DSM_TAXI_CAL_CFG_CAL_PGM_ENA_SET(1),
+		 DSM_TAXI_CAL_CFG_CAL_PGM_ENA,
+		 sparx5,
+		 DSM_TAXI_CAL_CFG(taxi));
 	for (idx = 0; idx < cal_len; idx++) {
 		spx5_rmw(DSM_TAXI_CAL_CFG_CAL_IDX_SET(idx),
 			 DSM_TAXI_CAL_CFG_CAL_IDX,
@@ -559,9 +560,10 @@ static int sparx5_dsm_calendar_update(struct sparx5 *sparx5, u32 taxi,
 			 sparx5,
 			 DSM_TAXI_CAL_CFG(taxi));
 	}
-	spx5_wr(DSM_TAXI_CAL_CFG_CAL_PGM_ENA_SET(0),
-		sparx5,
-		DSM_TAXI_CAL_CFG(taxi));
+	spx5_rmw(DSM_TAXI_CAL_CFG_CAL_PGM_ENA_SET(0),
+		 DSM_TAXI_CAL_CFG_CAL_PGM_ENA,
+		 sparx5,
+		 DSM_TAXI_CAL_CFG(taxi));
 	len = DSM_TAXI_CAL_CFG_CAL_CUR_LEN_GET(spx5_rd(sparx5,
 						       DSM_TAXI_CAL_CFG(taxi)));
 	if (len != cal_len - 1)

-- 
2.34.1


