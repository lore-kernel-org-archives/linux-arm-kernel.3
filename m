Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14BBEF36FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QTNZh4pLSlUShaRuE/hQso3278vbA5BSN0ZOowzrEzQ=; b=S90bpRGGYBJYG1wv3L0BlbQKhh
	917QD5K5sJKMJA2zao2ylgrKYBZNQJyr2srlFssPNJCSMSCB2Q0lLV9ZA3Fgyk7yqF6ljgq65d4ri
	SE3HQUdYjtJKfB3ZiHSGh/F+37TWcRGdqD/2EL988KWdi9Dmqk00+OoTRdo6oNdoVmc04IGdVLWQV
	wFRIUY3Ba4KMruoKBCFyogI5nRdfl3YFW5qW55IHe7OXHPy37xsesSpVQkJjITFVog0znnixV8AXi
	4Sp1b+OGm5XQtCJSG6E8wnoieWh7OjheMmr/3jkMVjZGJxllsmaSQtuISB/c+IK2BXqYYzzhQryQ2
	JItTdlRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVRK-00000006qIh-3Rpq;
	Mon, 09 Mar 2026 07:54:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzVR9-00000006qGh-1sv3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 07:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1773042839; x=1804578839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PUMHJIQe9paGHdzwol89drFjlfxsC2i93u8l7eBbM/Y=;
  b=RYjE9IO4IjXi13UdYeE7o2wrqzogjwvDMN7zyVBn7qhDa8sFc4VtgsrO
   pmVyRdn9M1dmnrLsfQ1UYTiBTL5w2bVRx86iWpLpRZRyFwMqyscVliJXA
   vuy8m+EqScm2mGEyLDqeaxBEM/UHH9GiMI3jpojkp44SUUyOEbYY0zO9m
   ylMaiXT/w+jRDVCy+TBSg26JOlJ6FGRJkDRbm26oYc2vje51kpSytB/dz
   9N0iWpmXE1flyXve+9RWrK0nPZrajmv+H1KLbTm5//3d5WN+GVU2ikbox
   pOjFxLh8HG3uPfwxyJfuqbFCpmJv6I+bLVveljbi8rsJ2yD/EcZz2Ra8R
   w==;
X-CSE-ConnectionGUID: u8JTaPxxQWWCViC89H2kCA==
X-CSE-MsgGUID: fMAVD45cRNuJjk24eijUkg==
X-IronPort-AV: E=Sophos;i="6.23,109,1770620400"; 
   d="scan'208";a="54818268"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Mar 2026 00:53:57 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Mar 2026 00:53:49 -0700
Received: from archlinux.mchp-main.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 9 Mar 2026 00:53:45 -0700
From: Mihai Sain <mihai.sain@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <varshini.rajendran@microchip.com>,
	<cristian.birsan@microchip.com>, <balamanikandan.gunasundar@microchip.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<ryan.wanner@microchip.com>, Mihai Sain <mihai.sain@microchip.com>
Subject: [PATCH v3 1/4] clk: at91: sam9x7: Remove gmac peripheral clock with ID 67
Date: Mon, 9 Mar 2026 09:53:26 +0200
Message-ID: <20260309075329.1528-2-mihai.sain@microchip.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309075329.1528-1-mihai.sain@microchip.com>
References: <20260309075329.1528-1-mihai.sain@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_005359_550303_5A51753F 
X-CRM114-Status: GOOD (  10.80  )
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

According with datasheet [1] table 12.1 the instance ID 67 is reserved.
This change drops the gmactsu_clk entry from
the SAM9X7 clock description table.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

Signed-off-by: Mihai Sain <mihai.sain@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index 89868a0aeaba..66aadebc51a4 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -420,7 +420,6 @@ static const struct {
 	{ .n = "lvdsc_clk",	.id = 56, },
 	{ .n = "pit64b1_clk",	.id = 58, },
 	{ .n = "puf_clk",	.id = 59, },
-	{ .n = "gmactsu_clk",	.id = 67, },
 };
 
 /*
-- 
2.53.0


