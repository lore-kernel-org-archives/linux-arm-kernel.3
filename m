Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787D0CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uGar8mU4JXSyaJE1iXsK/uzJqDIo5VXfNcdsMWDyJxk=; b=w9WwPOnzSiaodR+JIPHpwKFFNO
	IMCs7jES3raKG+6BSpGwDd8GnBz4Vg6C7WY24zPISrEdI1tWrfX9XUxprX3b5TxGXm9y3or0SMjWm
	YlohV9djK9fO5HNPsXz2tZSOmcY6ZbYZL5dUcWKifmM1jDHmz085JM6433Ng1SiH8JuatR7+6GL4v
	GDAijKLM+gYRmiTQwVdNetrOzFgEiVL+jzNA89eM+IFT1Qi045pTBWDewiZU8gEJOEdFETzMnC2Wg
	CsObRJmm/6lWS34vICnX75aG2HXMsjRIQiEcAGVNNjQ7pb/l7M8lNtNPX2mThLvyPP+FJEVXlxDBZ
	HzLHw9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v5-00000008mYf-0xxV;
	Tue, 09 Sep 2025 17:14:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvYr-00000006O5n-2fcH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757413613; x=1788949613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TsHx0E0bZEcU25DoRIWksMw+4boTtgCMbcApd7sVvVM=;
  b=oSKeLDqKzdcxCDemTLmVEgib31y3h92p3o5mvogascJNeE6HLMgQDN9l
   4o1NLaV303TumuCbytlxY0OFvFno7WLx6DU+kyPqcffDjoOSlRmmKYTeI
   JGcN91ZJW0P9K0LSHgfGerxiOqaoFdSYTIlGyVAJwwNyqrUWjrHiBFMWE
   QadfB22ym0OtT/tAIWiH/QTX/FWB0ljU4O0KEhNsdkNlDn0ZDnym79ZYp
   lRLPffg3OaWtthV78dnancITaVic83sCeqjZEQn2WRKUy7+/cZoqBKIbj
   93mwH2hQXBJ4UisKO04KWctGsuPV2pm2eNmM2+CPxVuqTt9qkKC6qR//M
   Q==;
X-CSE-ConnectionGUID: 75xiUm+nRtary3wX5uzH4g==
X-CSE-MsgGUID: eSJAwpQATcGykHA1prwJMA==
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="52016379"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Sep 2025 03:26:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 9 Sep 2025 03:26:11 -0700
Received: from che-lt-i64410lx.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 9 Sep 2025 03:26:06 -0700
From: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Balamanikandan Gunasundar
	<balamanikandan.gunasundar@microchip.com>, Varshini Rajendran
	<varshini.rajendran@microchip.com>
Subject: [PATCH] clk: at91: sam9x7: Add peripheral clock id for pmecc
Date: Tue, 9 Sep 2025 15:56:38 +0530
Message-ID: <20250909102638.47624-1-balamanikandan.gunasundar@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_032653_923392_F77D6A87 
X-CRM114-Status: GOOD (  10.28  )
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

Add pmecc instance id in peripheral clock description.

Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Acked-by: Varshini Rajendran <varshini.rajendran@microchip.com>
---
 drivers/clk/at91/sam9x7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
index ffab32b047a0..bce60f7393d5 100644
--- a/drivers/clk/at91/sam9x7.c
+++ b/drivers/clk/at91/sam9x7.c
@@ -403,6 +403,7 @@ static const struct {
 	{ .n = "pioD_clk",	.id = 44, },
 	{ .n = "tcb1_clk",	.id = 45, },
 	{ .n = "dbgu_clk",	.id = 47, },
+	{ .n = "pmecc_clk",     .id = 48, },
 	/*
 	 * mpddr_clk feeds DDR controller and is enabled by bootloader thus we
 	 * need to keep it enabled in case there is no Linux consumer for it.
-- 
2.34.1


