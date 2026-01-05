Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C28BC2A07B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 10:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cS5dgrQvDRE890+fRL7vnSwHNPqOBbj92FO19PbXu7w=; b=07QHLfk17140rnE/nf3R1LMebp
	CkBVv7tOCpRBbgB0cTCjzHsKE+pyYiPmEKJpF0rT33XT7+rEDPXH/AJqzYumEPz+FuRJvstgdx56u
	FcKtt9DymGzCneGMIeFVpiKWYLzOamHTI7z41rjFgK7sjqX8jrZKYn6X5CJPYG3eEVbGZwT6QZY4c
	PYhx6MZx2EI98RGWWZin2Tz1faXqjYSSWb+WvHfy9/K2ur4JrOGGhDXHfxeckx9w02CMNHGZlByYr
	MCTs3Rb1J5NEPyVAeHEz+hRFXa1LsUUMbHyRjZoDKO55I72shLY7UWAFcLbd79I4IpAXL4W6m3XcG
	vbaurzOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchOB-0000000B5Nu-1d23;
	Mon, 05 Jan 2026 10:00:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vchO8-0000000B5NX-3lEv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 10:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1767607236; x=1799143236;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xQSdvZemonWKFcvogkSyedmORtzPF+JXg26oljkZZ18=;
  b=CvC/x5Lirk/OySkDS73rNt8/4zQHVJz8J6PMLW8kR9SOhBkS9HS9Vyg4
   DkUelSGu5QW98lWtvlrv6CJgiVCrwjWAWYkd20/zySs7tm2EHW40tBcrs
   ydgRnD8s1TQWBRDyZw6AJbm+plt+yoabVH5ghZ+sSqmS4Pfk0ieZYdIRd
   7NfHsDi2pPtUNoUhicy+bzq3mdJX21pePUi78G1A106viaDqvODd7qqW1
   rJx+zJB+m4FndyzayhWhWV8z6g+8EqYl4Trs6VDebcOytOnjyf9+cH4Ov
   Oj9IySpBRUsIZgMJW/OWNBCr0uLnNLssigWAMJN0a3t7BvuBnAlZ6t2v5
   A==;
X-CSE-ConnectionGUID: 1cStLnPtRFaQ+RdhyhcX1A==
X-CSE-MsgGUID: +D7jvq+CSPSE/XhOcm2XOQ==
X-IronPort-AV: E=Sophos;i="6.21,203,1763449200"; 
   d="scan'208";a="58246851"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Jan 2026 03:00:33 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 5 Jan 2026 03:00:18 -0700
Received: from ROU-LL-M43238.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 5 Jan 2026 03:00:16 -0700
From: <nicolas.ferre@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, Nicolas Ferre
	<nicolas.ferre@microchip.com>, Ryan Wanner <Ryan.Wanner@microchip.com>
Subject: [PATCH] pinctrl: at91-pio4: Add sama7d65 pio4 support
Date: Mon, 5 Jan 2026 10:59:56 +0100
Message-ID: <20260105095956.19615-1-nicolas.ferre@microchip.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_020037_172687_D39FA960 
X-CRM114-Status: GOOD (  10.34  )
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

From: Ryan Wanner <Ryan.Wanner@microchip.com>

Add sama7d65 compatibility string.

Sama7d65 does not have a full last bank of PIO lines similar to the
Sama7g54 SoC. Sama7d65 only has 14 lines on the last PIO bank not the
full 32; adjusting the SoC attributes accordingly.

Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>
---
Hi,

dt-bindings already up-to-date with this new compatible string by:
https://lore.kernel.org/821255840c09d8d9cebbb1f2daaedd8a7c138875.1736522006.git.Ryan.Wanner@microchip.com
(even if still .txt)

Regards,
  Nicolas

 drivers/pinctrl/pinctrl-at91-pio4.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index ec5351fc282e..41cbb46ac589 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -1053,6 +1053,12 @@ static const struct atmel_pioctrl_data atmel_sama5d2_pioctrl_data = {
 	.last_bank_count	= ATMEL_PIO_NPINS_PER_BANK,
 };
 
+static const struct atmel_pioctrl_data microchip_sama7d65_pioctrl_data = {
+	.nbanks			= 5,
+	.last_bank_count	= 14, /* sama7d65 has only PE0 to PE13 */
+	.slew_rate_support	= 1,
+};
+
 static const struct atmel_pioctrl_data microchip_sama7g5_pioctrl_data = {
 	.nbanks			= 5,
 	.last_bank_count	= 8, /* sama7g5 has only PE0 to PE7 */
@@ -1063,6 +1069,9 @@ static const struct of_device_id atmel_pctrl_of_match[] = {
 	{
 		.compatible = "atmel,sama5d2-pinctrl",
 		.data = &atmel_sama5d2_pioctrl_data,
+	}, {
+		.compatible = "microchip,sama7d65-pinctrl",
+		.data = &microchip_sama7d65_pioctrl_data,
 	}, {
 		.compatible = "microchip,sama7g5-pinctrl",
 		.data = &microchip_sama7g5_pioctrl_data,
-- 
2.43.0


