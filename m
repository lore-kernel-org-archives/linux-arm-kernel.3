Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AC6C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 00:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S4nGN0CSQHB2KWPpnR8tVMOWyUfm5YVcNnGHzKT+Zag=; b=KMsUAjiMBMuvh98VRiTszfJej7
	D/tkQYCHB8c01/ShkkUDGxnqDH3wl3Bu63s6Ys3gnPrb4XRBjaXYNQtVd9l1OUSaAcIV5sjCEe9v5
	jBOXVGP+tU83hz1Ylbm6Ufe07ZyOj64ImFFkD8GjXnCtreiPoOM4DIaqGWcFh3PYXHok3nSjX6TqX
	u60gyiXRta4Bx0IuAp1tGFjcI3p5Pd/Jb2b6V9AMkRIdfuR9BsMIscdB0zoG4fXK270txtLroJIMs
	+2zSO1hyv25jxz4ViqVT4NhQT8didsYgoDPPORDmP6zRpHJe+9QEa0cjSkafNjncrkXW23hyolzc7
	Ujbb/VHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmIv-00000004lKp-0pAV;
	Wed, 02 Apr 2025 00:50:05 +0000
Received: from mailgate01.uberspace.is ([95.143.172.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzmFT-00000004kbf-26KO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 00:46:34 +0000
Received: from perseus.uberspace.de (perseus.uberspace.de [95.143.172.134])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 36F66609D6
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 02:46:22 +0200 (CEST)
Received: (qmail 23164 invoked by uid 988); 2 Apr 2025 00:46:22 -0000
Authentication-Results: perseus.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by perseus.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 02 Apr 2025 02:46:21 +0200
From: David Bauer <mail@david-bauer.net>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] mt7915: mcu: lower default timeout
Date: Wed,  2 Apr 2025 02:45:25 +0200
Message-ID: <20250402004528.1036715-1-mail@david-bauer.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: /
X-Rspamd-Report: SUSPICIOUS_RECIPS(1.5) BAYES_HAM(-2.999999) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -0.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=david-bauer.net; s=uberspace;
	h=from:to:cc:subject:date;
	bh=o0+jC5T0IbMLQejhPVGo1EXsWLgoRdQKJfBR4m13l28=;
	b=OpGqdC4W5ncDvQo4pt/v3IzaB2oV6KRY2hoD8pZXVBtby0ahijnFpy/vpf+yX+YQXjsdm66KtF
	dHmteresF3/GQVMSquiuhBnL+gPayZMCxXCUtqwb2MKywYZ6YHa9pXaijLjY02tY34WvXpYeM5BT
	cOP/BOQQAmUsC6WzP6tOdET3NRaMLYeL6HWV7NDWtC5uZtlT54zxEPeiJNq/1xaYRzPuZCaNU/x2
	MwSk4zeBQn0WVUtVIqG3XzMK52kR7TtehMGfHduYR+7d5wvja812NOkJ+tl48/Y6SoI/TT5zobpw
	JcR+bebkwbpytcX7Lq0XTrf5ymEs6nVLg+yaxVrTywTpjHBY6FWwn4tSBQNVq+Og+S8cLmRWBSNH
	GG+VcVQtGYjrSEX2Y8HvN+xVyrLqZ3g2hfnDcKufHcPWBQUqxhXpL+u9BeQ2eeRsfnDaHI2x8Daz
	dNYHOTxG3pOGx4AjjWxTeQwqk4AVFAPSWF5hqS4wusHoj4fY1ALqbwRq5zSJQgG8ZGcA7Um/mTeS
	Ah0/4zwnzbAfxyOK9o1fofoJXvI+CMzwRaex/q0ysefMUtY1k7l/fuMvC2bsURfClq88edPq7FYv
	RrsX4Q33ia9RFapToaXaH3TRUMKhlQH4Q4bwXeG0NCM6OKsjbLtkNySdW/9jimEPMyWcQMQ3EXTt
	8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_174631_976831_7CFAA450 
X-CRM114-Status: UNSURE (   8.89  )
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

The default timeout set in mt76_connac2_mcu_fill_message of 20 seconds
leads to excessive stalling in case messages are lost.

Testing showed that a smaller timeout of 5 seconds is sufficient in
normal operation.

Signed-off-by: David Bauer <mail@david-bauer.net>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 3643c72bb68d..c1c5afed571f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -197,6 +197,8 @@ mt7915_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 static void
 mt7915_mcu_set_timeout(struct mt76_dev *mdev, int cmd)
 {
+	mdev->mcu.timeout = 5 * HZ;
+
 	if ((cmd & __MCU_CMD_FIELD_ID) != MCU_CMD_EXT_CID)
 		return;
 
-- 
2.47.2


