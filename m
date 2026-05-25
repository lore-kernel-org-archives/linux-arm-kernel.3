Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC58CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HqAXblrv71cFXI7WjWte9XiGfURCm6xgTMyGnJXdh8=; b=iEHll+glKODBIloF5cs8yR5DyI
	id8XyLuHUT/ztIN7h3VU+iTD0JJja74k+siiCMS3FypfEKb+Pfnqcbhfu275EyKGuy5RWjtgHeooF
	myyFqDMqpt5W8TjKHiyb0HRzJmlx0by40+tyMtiuN6hb9/MtsYmn/W+ueFHYtIhuHQyJLdsB6++Wp
	fZBXbh6rQXqYmg6sqvQ8Adz+QkvXlV3aTxmCkAqQWAWA+//Od3XXvNvqREgmP3lqnPcwGRGIhuA3h
	pRylyfhk8lTQYclJBfPoPzzahiSBWfgtTY6kAoNvEJI9jjNLRcSL7S4NxrlDTAiCJVLOwDbYyUGz+
	GujivoGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYD-0000000GnX3-3yYl;
	Mon, 25 May 2026 09:24:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRYC-0000000GnW3-2MpU;
	Mon, 25 May 2026 09:24:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0HqAXblrv71cFXI7WjWte9XiGfURCm6xgTMyGnJXdh8=; b=esPjcZpK1tgmq3qA/8GMEG4BnM
	piDeeqcBvBTtlOffEO5R0dZEYSraLFrFWGdmFU8vKbRuA2vao9u6c9hZG5VN5LDF7hb3FUSqAocm3
	S51Ha7YS+F3uVRjHBXYMfkS3VgQdG3JgbDHQUua3z0rH+MjOl5rZGzTCq3ozHJGHEUuu7dC5BuTIM
	Oz73OWRqfAAt6zg8jzuPWhSEHQegfvHrGPQBCS5GjLAdykOZyr28bJ2wvph+ffhBAxVuTXiGfQjtC
	QYDsdaQPm7hkqHsZ0KqWW1JtMlHX+qUiZA/vUvMnJfXWPVxzBcN9DMKJbLu41nDdEQcknyBNel+XZ
	usuQUk3g==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRY9-00000008tBl-01rd;
	Mon, 25 May 2026 09:24:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1779701081; x=1811237081;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VToW2tkGDjYtYxUbLXPSzNOeI+eD0zBQHgakEB8gWtg=;
  b=QsQm2Ob10Tts2+x1P+i0HdWPsEIsiv2/VyKnwl839lIJvWK85zrgYKqw
   uQNO3LVNWjCbZDbVolrmvn3ISkYySEL4NQRRQXRZJUbdfutCMq4oTbeHI
   zzqYJ0pBawcEkaZFep0nE3saOWidNS57jH9pjvrxXK1ISwdIFbb+t15FS
   C6gB7hIECHUyHgsS4aUr7TkiTQzQNTZ4I0tyZScWtSBrnHlXy+EN/Vmue
   GyVkhj6AC330p9yihSHOzUYdSk7BJ4nDPMF0kBFxorcqTfeNMpHN5MoNy
   05Rg0iYAAlZHiqla/EWB9HrffxrFoudySYJSXgoFE+QfWLJR7X3VCM/Ez
   w==;
X-CSE-ConnectionGUID: vqde+N29RQu654XIWvLctw==
X-CSE-MsgGUID: yu61C2IcRBK2mUEiEzYbnA==
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="57215508"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 May 2026 02:24:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 25 May 2026 02:24:38 -0700
Received: from che-lt-i67131.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 25 May 2026 02:24:29 -0700
From: Manikandan Muralidharan <manikandan.m@microchip.com>
To: <alexandre.belloni@bootlin.com>, <Frank.Li@nxp.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <nicolas.ferre@microchip.com>,
	<claudiu.beznea@tuxon.dev>, <linux@armlinux.org.uk>,
	<mturquette@baylibre.com>, <sboyd@kernel.org>, <bmasney@redhat.com>,
	<aubin.constans@microchip.com>, <Ryan.Wanner@microchip.com>,
	<romain.sioen@microchip.com>, <tytso@mit.edu>,
	<cristian.birsan@microchip.com>, <adrian.hunter@intel.com>,
	<npitre@baylibre.com>, <linux-i3c@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
CC: Durai Manickam KR <durai.manickamkr@microchip.com>, "Manikandan
 Muralidharan" <manikandan.m@microchip.com>
Subject: [PATCH v7 2/5] clk: at91: sama7d65: add peripheral clock for I3C
Date: Mon, 25 May 2026 14:54:02 +0530
Message-ID: <20260525092405.1514213-3-manikandan.m@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525092405.1514213-1-manikandan.m@microchip.com>
References: <20260525092405.1514213-1-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_102441_701598_2752C0A2 
X-CRM114-Status: UNSURE (   9.55  )
X-CRM114-Notice: Please train this message.
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

From: Durai Manickam KR <durai.manickamkr@microchip.com>

Add peripheral clock description for I3C.

Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
---
Changes in v3:
- Fixed indentation issues in the clock table entry

 drivers/clk/at91/sama7d65.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
index 7dee2b160ffb..ba8ff413fa2c 100644
--- a/drivers/clk/at91/sama7d65.c
+++ b/drivers/clk/at91/sama7d65.c
@@ -677,6 +677,7 @@ static struct {
 	{ .n = "uhphs_clk",	.p = PCK_PARENT_HW_MCK5, .id = 101, },
 	{ .n = "dsi_clk",	.p = PCK_PARENT_HW_MCK3, .id = 103, },
 	{ .n = "lvdsc_clk",	.p = PCK_PARENT_HW_MCK3, .id = 104, },
+	{ .n = "i3cc_clk",	.p = PCK_PARENT_HW_MCK8, .id = 105, },
 };
 
 /*
-- 
2.25.1


