Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD5CE674AD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 07:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZmWh4uVnKEvkeazH+aDi2fj3R1vAhbIGgZMiEzEtuA=; b=ebxgehvIghPLOQXcQSGL29ltY1
	Dxv2yqS0TzlFQztyBIIcV+mzrco7ACUQIYYMCm1ciBoMvBDB6CCYftyOmuAoNd7yy6QvZKCzwS2zM
	6cdaf8rugqc+Dgh8GJvbXdV85tTP90xnjzeineRaBTm+iMp26tzX5V4GFs6+OF6Ppags9Rx+aQdw+
	0uoDHRehArxQCAHDx+1LsLldMy+4ePShdFc44TlF9N2dLi1otAqoJerlDBK5RdKlp7yUjKwUJ9shx
	f9ZiqiqzzTEJc/2DEgqWagR+zuUq84wlG5l3VUXlONFDZJLTexFi381XzdKp7PBv9zR8sfOQDsB8v
	npYvWGeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6m5B-000000066mq-0MT4;
	Fri, 01 Nov 2024 07:28:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6lnQ-000000063gY-0hAC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 07:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730445012; x=1761981012;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=qo3EIWZzPe6jD1iFKFUqHh6rrb9GVbIt3i3my3FIISw=;
  b=X/LEM9qjJ8p7awe89lT0CGrNpusMkE2MzKiJ5pEfVUpS9KcpOyfbXGWI
   IJibjoGEX9ms/8cyikdF9UQna0OuNhjJS9yvgTLISVRyX9etUC2XD1KFM
   TnVGV+kLjZ15SQuADVwxP5b+bo9nVUkRPxRjEtXzM+BB+yMdUh+yrGfEw
   sQ3GeBPj1yEDgf74MuLxpaRfomfes6Bb03zsRdMwhpFiWrGYLyJ9H+qJs
   8VMkJioliCYQDGr0gAb+kdCFmvdx7dh2HbJRycrGiA/OoDWvYESLgJA+B
   mWTp7zEL/SKNOz0A/Z7mQbDDsQBnodyDgB7Ueh1Uj3wYj6qCieDnD5wBf
   g==;
X-CSE-ConnectionGUID: cK9dq03ZTAa62dxLS6SkZA==
X-CSE-MsgGUID: VKcxEam4TJ2pSH5+vhY3Sg==
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="33754105"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 01 Nov 2024 00:10:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Nov 2024 00:10:02 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 1 Nov 2024 00:10:00 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 1 Nov 2024 08:09:10 +0100
Subject: [PATCH net-next 4/6] net: sparx5: execute sparx5_vcap_init() on
 lan969x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20241101-sparx5-lan969x-switch-driver-3-v1-4-3c76f22f4bfa@microchip.com>
References: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
In-Reply-To: <20241101-sparx5-lan969x-switch-driver-3-v1-0-3c76f22f4bfa@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	=?utf-8?q?Jens_Emil_Schulz_=C3=98stergaard?=
	<jensemil.schulzostergaard@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<jacob.e.keller@intel.com>, <christophe.jaillet@wanadoo.fr>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_001012_228492_CA6D9554 
X-CRM114-Status: GOOD (  11.83  )
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

The is_sparx5() check was introduced in an earlier series, to make sure
the sparx5_vcap_init() was not executed on lan969x, as it was not
implemented there yet. Now that it is, remove that check.

Reviewed-by: Steen Hegelund <Steen.Hegelund@microchip.com>
Reviewed-by: Jens Emil Schulz Østergaard <jensemil.schulzostergaard@microchip.com>
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index bac87e885bf1..2f1013f870fb 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -770,12 +770,10 @@ static int sparx5_start(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	if (is_sparx5(sparx5)) {
-		err = sparx5_vcap_init(sparx5);
-		if (err) {
-			sparx5_unregister_notifier_blocks(sparx5);
-			return err;
-		}
+	err = sparx5_vcap_init(sparx5);
+	if (err) {
+		sparx5_unregister_notifier_blocks(sparx5);
+		return err;
 	}
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */

-- 
2.34.1


