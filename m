Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591E0EFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ii//u9q3CC8Z+AjPCag5fDK81jRC15cv+zfgcDGartM=; b=J3wq2ZnjafrcmKKDD0Zap7Ici4
	rH96tqHyVfmQ7CtIHFNvVWXNa1npSIIosulOwwh0YOBs0/oDk63EPaJnGdkxNbYZVcdUVnKF86Mkm
	K2a2VIBKmjb7Nm34COFuFwmszqL0aCrEt4nWQucnUylKrqNpHEcf6eUyQdJGoumo3fHmtxjmYnDOc
	m+ZJSACCi/dsjriMb7v5K63G61o8vclw6oUptvuYY4vdNnbfZwWyiAUa9lQ5a4geIKPZDVZ7COc2O
	A3eV9EkaUAdqotz2mwPUoH58Xifl0mRC+g+g+3UpcE96vJNFHlMV+TPhw1KsLL5TDAd1RDrBHRAah
	/pPH+BFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvArF-00000003dDA-2tQo;
	Wed, 25 Feb 2026 09:07:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvArC-00000003dAu-3uFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010419; x=1803546419;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=9VZ1uVovnXCdERkt2fVQaLnP6Cbs4phjqlrfHL7fq2M=;
  b=Ck0mdsAIIc6RKP0z7/RFaErnUsKXlgla1Pi5xC/LLM7fUeH9rHQucmpY
   boTeW3yx25OD5dTRala/93pXTT9bAzlp+EgU4QjwYxP29BW7sLoXMXet3
   kqIeypGsUkiNQxUwAsnu3D+8XN9omSlJgZkgjmpzeccl3tDqpp3WvOF63
   /ICmvd2urOzG0PsnZFkQJj/PjXptSzAMo7+4oDDwQ2jZenlun3oF+pvbg
   1cU4RxibRxbmDGYIe9VVy+6tXiEoNM2ZXr3VQ1wJis2sU8F1a3sguXAF+
   zbfA7sL9sgEsjAp6IrV/1MLBFojcJSZsmCQFJ2vs+lQnP8qPTxU+VCALM
   g==;
X-CSE-ConnectionGUID: qnurV3sJT6mUYuyKYf9Ihg==
X-CSE-MsgGUID: vQY8kQEYSXyRvmukcJalZQ==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="54259087"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2026 02:06:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Feb 2026 02:06:23 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:21 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:30 +0100
Subject: [PATCH net-next 7/7] net: sparx5: move remaining init functions
 from start() to probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-7-97036580b9f0@microchip.com>
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
X-CRM114-CacheID: sfid-20260225_010659_039545_DA2E42BF 
X-CRM114-Status: GOOD (  11.69  )
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

Move sparx5_pgid_init(), sparx5_vlan_init(), and sparx5_board_init()
from sparx5_start() to probe(). These functions do not require cleanup.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 581f87eb9781..fb3010446707 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -727,12 +727,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 			 ANA_CL_FILTER_CTRL_FORCE_FCS_UPDATE_ENA,
 			 sparx5, ANA_CL_FILTER_CTRL(idx));
 
-	/* Init PGID table arbitrator */
-	sparx5_pgid_init(sparx5);
-
-	/* Setup VLANs */
-	sparx5_vlan_init(sparx5);
-
 	/* Add host mode BC address (points only to CPU) */
 	sparx5_mact_learn(sparx5, sparx5_get_pgid(sparx5, PGID_CPU), broadcast,
 			  NULL_VID);
@@ -743,8 +737,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	mutex_init(&sparx5->mdb_lock);
 	INIT_LIST_HEAD(&sparx5->mdb_entries);
 
-	sparx5_board_init(sparx5);
-
 	/* Start Frame DMA with fallback to register based INJ/XTR */
 	err = -ENXIO;
 	if (sparx5->fdma_irq >= 0) {
@@ -939,6 +931,10 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		}
 	}
 
+	sparx5_pgid_init(sparx5);
+	sparx5_vlan_init(sparx5);
+	sparx5_board_init(sparx5);
+
 	err = sparx5_calendar_init(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to initialize calendar\n");

-- 
2.34.1


