Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF2CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V+qTJm9HU4xT8HeJVkqMwKiWEsa8kkhyKdCWF5wmNM4=; b=eT/VtfrPGcMUjX27mToCaCmtng
	1wXQnPuujhhWAqLRsVV8ZFrQi1Gyhc03eCU7053b/W8fyXvNmtpftiLUTigz4xbLG7EiCnj3VHUFj
	N9w6lvMhsl3EEsTrv6ilgVirhmVlvsveJjzX8ZF4MG5Vrmd8VDx+QhTme653zlg95TcKZM1Osm7f6
	EzKeYfMfeqqvKe3aLP27EHqGhMq7UDlL0KgiDtkWF4tlWiZtSeB42rkldicggNK+uY5Y5Dg3C32L4
	F94WmBxKGjVW6LUoO4UYh/rde5HB/0/IeB9ywC+N7dV9OTWY+M6wmaLkdPSD6IWs5kZI3+OsQX/q0
	68v+Cxmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxU7-00000003jfi-2zis;
	Thu, 07 May 2026 12:05:43 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKxU5-00000003jf7-28F4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 12:05:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778155541; x=1809691541;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EslzJJMqkthcUMFMyk8m6chx1s41wR3exbqWEeSABcI=;
  b=RS+NHWwh/e6XEl832MIxKa000YSFzkxxBSPgrnT+q4oHK5jq+L27eN6g
   DUNog8P7yxp5soVFqQPczmHTkJ9beffdrQsQVwL873NtQ5a+JQkSbxBNY
   rI8DMuko+w915axZIvgVvaQ78ArsE5ojB9Cn4WJ1DQlFAUhmc9uzO5hTd
   omKWbwkYnZ2ohU4ld5I8gPx5U8px43LBpK6uH893tgC5izGh0QWugClA7
   Uwv4pfZHEl7P12gfn+XtoeNKw6+JfvxkrscpZYMEQhtERSAOXkDuYbFmj
   z8/QREVo7YUVlspQgeAkIgobBvq2z7Xhy+scOJtjUiHK3sisv5b/cn7ui
   A==;
X-CSE-ConnectionGUID: yBpSBo4qQtCNmd1ecBacGA==
X-CSE-MsgGUID: tpTIs552R8K2d6BHX5VvgQ==
X-IronPort-AV: E=Sophos;i="6.23,221,1770620400"; 
   d="scan'208";a="224414037"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 May 2026 05:05:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 7 May 2026 05:05:38 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 7 May 2026 05:05:35 -0700
From: <nicolas.ferre@microchip.com>
To: <theo.lebrun@bootlin.com>, <conor.dooley@microchip.com>, Claudiu Beznea
	<claudiu.beznea@tuxon.dev>, <netdev@vger.kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH] MAINTAINERS: change maintainers for macb Ethernet driver
Date: Thu, 7 May 2026 14:04:44 +0200
Message-ID: <20260507120444.9733-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_050541_611489_D409AFC5 
X-CRM114-Status: GOOD (  11.57  )
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

From: Nicolas Ferre <nicolas.ferre@microchip.com>

I would like to hand over the macb maintenance to Théo, as I'm unable to
keep up with the recent flow of patches for this driver. After speaking
with Claudiu, he indicated that he is in the same position as me.
To help with this work, Conor has agreed to act as a reviewer.

I was given responsibility for this driver years ago, and I'm glad to
see it continue with talented developers.

Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 37b105a443dd..ad60104f30a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4181,8 +4181,8 @@ F:	include/uapi/linux/sonet.h
 F:	net/atm/
 
 ATMEL MACB ETHERNET DRIVER
-M:	Nicolas Ferre <nicolas.ferre@microchip.com>
-M:	Claudiu Beznea <claudiu.beznea@tuxon.dev>
+M:	Théo Lebrun <theo.lebrun@bootlin.com>
+R:	Conor Dooley <conor.dooley@microchip.com>
 S:	Maintained
 F:	drivers/net/ethernet/cadence/
 
-- 
2.43.0


