Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF82CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 07:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8K6Vn31mUx/5f0i+rVyE2TilvTczYHetbh2S8zMQkE=; b=nH8HT3rYjVaDlgEhsZVC019vWG
	+N1x3kSKi2JoP5I4uzmwFAGGTR5CVjcPT5LTrVFZfikRnuvQJLOcROUzlnI4JCAiOuLYC+V1xdx9C
	jZ3OU1EV9MA5s7jIze9EDWQk8NoPPuTk+kG/r0L7igfZYSJrPRxJNZOlc1qjq+xsnoMD98Hok5LZs
	SO0p8iGCiE8a+UQ2G15S3ifsy9NXGqzyXVt31/vPaZ7pql6TbI2Jh7/I5epvq6LzdrGCzmqScOv5A
	GDcUuEhXwLEZAv4vNnd/iV+tX6NhVcCm4gqTG1k+3d9bkTEwu1w2hO9dAQu6mtBwO1W81qqI22crc
	C5naBNTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWeD-000000001HO-2rT2;
	Wed, 06 May 2026 07:26:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKWeB-000000001GV-37SH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 07:26:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778052381; x=1809588381;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=JITsFlRhNPddbBiE7x9vC95CAEMQC2QeFvYuXGtu3Jk=;
  b=vs5qxlovYC920e+15m3k9ESNzafy98yGhl13VJVwR8+rI9gN30/jHzvg
   HJ7JK+PQSSeRu/B0pXcATMsAgxFwxztNRbsHSnsdynAlrNhKhSNGNjbxZ
   aLp3q+umx3PiKE88O7QHqqPyWDLmq0Yz149NghBd2kZcuH/AtxFqZalL4
   MHQn08wB3DZDZLiQsUtyV9GMzNUko+gOArHtvKkWyVTwHqWcJW6TyShOu
   Hm7lXqH+AxPPbjJW14uMztzj26yK0+yOzxusnUQ3gUmsOpVbNc+z2iLpz
   W7yhXWYI929yW3OEf7MJ4/4792Df/LK+dK3X+72jWKUW/PMzgentgRI/+
   A==;
X-CSE-ConnectionGUID: 55FQtZaxTi6fR0HFIcyGwg==
X-CSE-MsgGUID: eFJSXsBaReiFcz9TRMe1zw==
X-IronPort-AV: E=Sophos;i="6.23,219,1770620400"; 
   d="scan'208";a="65355704"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 May 2026 00:26:20 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 6 May 2026 00:26:18 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 6 May 2026 00:26:15 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 6 May 2026 09:25:38 +0200
Subject: [PATCH net v2 3/4] net: sparx5: fix wrong chip ids for TSN SKUs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260506-misc-fixes-sparx5-lan969x-v2-3-fb236aa96908@microchip.com>
References: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
In-Reply-To: <20260506-misc-fixes-sparx5-lan969x-v2-0-fb236aa96908@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Sebastian
 Andrzej Siewior" <bigeasy@linutronix.de>, Clark Williams
	<clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, <kees@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Steen Hegelund
	<steen.hegelund@microchip.com>, <linux-rt-devel@lists.linux.dev>, Andrew Lunn
	<andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_002619_802341_B0CFD012 
X-CRM114-Status: GOOD (  12.67  )
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

The TSN SKUs in enum spx5_target_chiptype have incorrect IDs:

  SPX5_TARGET_CT_7546TSN    = 0x47546,
  SPX5_TARGET_CT_7549TSN    = 0x47549,
  SPX5_TARGET_CT_7552TSN    = 0x47552,
  SPX5_TARGET_CT_7556TSN    = 0x47556,
  SPX5_TARGET_CT_7558TSN    = 0x47558,

The value read back from the chip is GCB_CHIP_ID_PART_ID, which is a
GENMASK(27, 12) field, i.e. at most 16 bits wide. It can never match
these IDs, so probing a TSN part fails with a "Target not supported"
error.

Fix the enum to use the actual 16-bit part IDs returned by the
hardware: 0x0546, 0x0549, 0x0552, 0x0556 and 0x0558.

Reported-by: Andrew Lunn <andrew@lunn.ch>
Fixes: 3cfa11bac9bb ("net: sparx5: add the basic sparx5 driver")
Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index d5e6644ff124..078e02627394 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -31,11 +31,11 @@ enum spx5_target_chiptype {
 	SPX5_TARGET_CT_7552       = 0x7552,  /* SparX-5-128 Enterprise */
 	SPX5_TARGET_CT_7556       = 0x7556,  /* SparX-5-160 Enterprise */
 	SPX5_TARGET_CT_7558       = 0x7558,  /* SparX-5-200 Enterprise */
-	SPX5_TARGET_CT_7546TSN    = 0x47546, /* SparX-5-64i Industrial */
-	SPX5_TARGET_CT_7549TSN    = 0x47549, /* SparX-5-90i Industrial */
-	SPX5_TARGET_CT_7552TSN    = 0x47552, /* SparX-5-128i Industrial */
-	SPX5_TARGET_CT_7556TSN    = 0x47556, /* SparX-5-160i Industrial */
-	SPX5_TARGET_CT_7558TSN    = 0x47558, /* SparX-5-200i Industrial */
+	SPX5_TARGET_CT_7546TSN    = 0x0546,  /* SparX-5-64i Industrial */
+	SPX5_TARGET_CT_7549TSN    = 0x0549,  /* SparX-5-90i Industrial */
+	SPX5_TARGET_CT_7552TSN    = 0x0552,  /* SparX-5-128i Industrial */
+	SPX5_TARGET_CT_7556TSN    = 0x0556,  /* SparX-5-160i Industrial */
+	SPX5_TARGET_CT_7558TSN    = 0x0558,  /* SparX-5-200i Industrial */
 	SPX5_TARGET_CT_LAN9694    = 0x9694,  /* lan969x-40 */
 	SPX5_TARGET_CT_LAN9691VAO = 0x9691,  /* lan969x-40-VAO */
 	SPX5_TARGET_CT_LAN9694TSN = 0x9695,  /* lan969x-40-TSN */

-- 
2.34.1


