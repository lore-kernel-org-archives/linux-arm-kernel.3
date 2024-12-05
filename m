Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ED1E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 13:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB2AuX2rSGhL8VpaWZ5HMuplj5cH17yU0HKWkdNMBEE=; b=XYDbtMzTRcf3xrVbN/nMnFRDk+
	gWzH/TamO5WBpFC2kkt5T121ypr7f6ovlPbAQPnu3rNoMLdA/uN3Uaexy2kvprNtmNjDSdvlIUW8q
	L4WQxMWUxqivYWcXuC1Actw4FuYmK61hwu7yoKGENrcfiCAgvXuwviOJz2kvjz17oR6i4K4UiUqWh
	bQPjekSGhROpGZg5I2mYJRBnEFcN5GaO/3PmoHMXabKSy/xE4N9lBh+blhSmhzV/iB0BG/BuNs6TC
	mCQs+22YwWC2E7vvk1lFhkVLt4sTfsW0+p1VwJbI3oEL32FtKfnAI2wPnWERGvxnZAlyGdT8+UNex
	ErauOlUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCLQ-0000000GFQo-3XDm;
	Thu, 05 Dec 2024 13:56:40 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCKP-0000000GF9h-1eVK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733406937; x=1764942937;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=PGYbsklcZxbQKe46gCtSJ/T9MPciNf2YV+Mvvz1GowY=;
  b=KeL490m9YYcWY9SAZCWu5eFaaFZBx7QFRq0j6nYtFojFDPvRDkwWH9j0
   ySR/t+/rVdOCqLVmOrdltzP+O6glRCUHdj9gjzA8XvR5RZFlbPptOxBQn
   7LYLzYmzDeTCHhYJ2yEZj1FPCRt97pPQbgskDpVVjuXzPDDNeakvAQ5o5
   Xk6vt1Q+DtIFuBaazI9wbfUE5p4NCE3PsMv1IYmhK+kvm632NVUaKdv+Y
   Os1xgbCl2sEcZXMebKQJe5Kd7q/w7F1uclUNHPMFsvDBboA/yS9oUPMEc
   Nzo/sVlSLi7PXOzd2dHSGBcP0o5ZGyUlT6XTH7Z1CCi6gPBjZIFQ4holK
   w==;
X-CSE-ConnectionGUID: 7ioOcpSzQfuJnUZ0WQ6I1Q==
X-CSE-MsgGUID: qF9MfwCwSdCrE3fz2fX5Pw==
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; 
   d="scan'208";a="34869386"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Dec 2024 06:55:34 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 5 Dec 2024 06:55:26 -0700
Received: from DEN-DL-M70577.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 5 Dec 2024 06:55:22 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Thu, 5 Dec 2024 14:54:25 +0100
Subject: [PATCH net 2/5] net: lan969x: fix the use of spin_lock in PTP
 handler
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-sparx5-lan969x-misc-fixes-v1-2-575ff3d0b022@microchip.com>
References: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
In-Reply-To: <20241205-sparx5-lan969x-misc-fixes-v1-0-575ff3d0b022@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Richard Cochran <richardcochran@gmail.com>,
	Bjarni Jonasson <bjarni.jonasson@microchip.com>,
	<jensemil.schulzostergaard@microchip.com>, <horatiu.vultur@microchip.com>,
	<arnd@arndb.de>, <jacob.e.keller@intel.com>,
	<Parthiban.Veerasooran@microchip.com>
CC: Calvin Owens <calvin@wbinvd.org>, Muhammad Usama Anjum
	<Usama.Anjum@collabora.com>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_055537_502628_1322C578 
X-CRM114-Status: GOOD (  10.15  )
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

We are mixing the use of spin_lock() and spin_lock_irqsave() functions
in the PTP handler of lan969x. Fix this by correctly using the _irqsave
variants.

Fixes: 24fe83541755 ("net: lan969x: add PTP handler function")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

[1]: https://lore.kernel.org/netdev/20241024-sparx5-lan969x-switch-driver-2-v2-10-a0b5fae88a0f@microchip.com/
---
 drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
index 67463d41d10e..c2afa2176b08 100644
--- a/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
+++ b/drivers/net/ethernet/microchip/sparx5/lan969x/lan969x.c
@@ -273,9 +273,9 @@ static irqreturn_t lan969x_ptp_irq_handler(int irq, void *args)
 		if (WARN_ON(!skb_match))
 			continue;
 
-		spin_lock(&sparx5->ptp_ts_id_lock);
+		spin_lock_irqsave(&sparx5->ptp_ts_id_lock, flags);
 		sparx5->ptp_skbs--;
-		spin_unlock(&sparx5->ptp_ts_id_lock);
+		spin_unlock_irqrestore(&sparx5->ptp_ts_id_lock, flags);
 
 		/* Get the h/w timestamp */
 		sparx5_get_hwtimestamp(sparx5, &ts, delay);

-- 
2.34.1


