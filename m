Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC2FCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 10:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ijKBFARJQbOkLlcgiBdgZo3vki9e1DiRt0bRXzBe8wc=; b=DrOh33+OPaMZhDn82Ou4iBmaKg
	VbJow4mv0mXTsO28z1n/6sK2mvvxUH9XtyIJEXePLmnaEx4aSh7IG+fwTHjOStVxCFawDk1z8Kj2x
	noejqCDIXDwmHm2C1UfsFZwrFdPV0q9yH1lpC5cSWSDyjsDloMAcE4nCMFxaprW2l+7yHvX8WknJP
	nCQfqZgE0+xXF1JUa7YpnXGeVGNOfOx9XNFDJseL8TCgb3ltEyR61ekp9CrRfWTNM0HIjdWCf87G1
	XWR+k7katEpvPykKJWdATRKfomeZlZql9+6e7+fLaUoaFupmsbwZzYDcQysEhLO61lT491nT/eV5V
	NqpGZ3hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ipH-0000000HQz5-0T8k;
	Mon, 06 Oct 2025 10:52:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5ipE-0000000HQyH-09cJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 10:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1759747935; x=1791283935;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=gm/Cvg544MWI29JKrzAG4mwd8sooFCbAMI/8/oJiB6M=;
  b=hIFDTSZHAm/+UGoPX9Xk5ah7//JB+dwpJwMUo7lmeBIvz3jcJwRYW4YZ
   AICBNCP/nAKBVv/AGOZ35y/fp7eru1HlZOgbigqC1Bbar1GFhW+Cb0omC
   mj44Vhn+MzKyn9tlcDuGeM59heZQPodMnGs6wcbl7WV953E/MbBsXP3Nf
   xX9NbYxY2Q6a09yiVJP3O7IPF0j46Ss8RgD/PR/Fg8FwTFJx0TPIeJ5f5
   WR9AipyPW/oawac0jxNnOVSH/3vKDM4UAoVlajv0qquECjhCFNpJjF6tv
   l8V79M1aB0lg7iDobTNdrtnCHr7wn9E0iUBStli/YM90i+6G1WnRIl8M8
   g==;
X-CSE-ConnectionGUID: Kr+Q+dDzSjW7mslzFvIb1w==
X-CSE-MsgGUID: nADP52EgTE2cUcdQ/J8xqg==
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; 
   d="scan'208";a="53412948"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 06 Oct 2025 03:52:13 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 6 Oct 2025 03:51:53 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 6 Oct 2025 03:51:50 -0700
From: Dharma Balasubiramani <dharma.b@microchip.com>
Date: Mon, 6 Oct 2025 16:21:50 +0530
Subject: [PATCH] counter: microchip-tcb-capture: Allow shared IRQ for
 multi-channel TCBs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251006-microchip-tcb-v1-1-09c19181bb4a@microchip.com>
X-B4-Tracking: v=1; b=H4sIAEWf42gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwMz3dzM5KL85IzMAt2S5CTd1JQUi8TUxFRjs2QTJaCegqLUtMwKsHn
 RsbW1AELilytfAAAA
To: Kamel Bouhara <kamel.bouhara@bootlin.com>, William Breathitt Gray
	<wbg@kernel.org>, =?utf-8?q?Bence_Cs=C3=B3k=C3=A1s?= <bence98@sch.bme.hu>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-iio@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dharma Balasubiramani
	<dharma.b@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759747911; l=1486;
 i=dharma.b@microchip.com; s=20240209; h=from:subject:message-id;
 bh=gm/Cvg544MWI29JKrzAG4mwd8sooFCbAMI/8/oJiB6M=;
 b=bOTY3HZhE7E09lIqJ/OSyYN9TUABG4lzTG4EqLahS4+YGLDcy4zbM0JK+JTdp2Lp0rQEkFtWE
 OfPw2NWn9OnBO/7/RQqhs6jifYZwI4NhbGgK2zd1Drh6xX7gvP3A2SR
X-Developer-Key: i=dharma.b@microchip.com; a=ed25519;
 pk=kCq31LcpLAe9HDfIz9ZJ1U7T+osjOi7OZSbe0gqtyQ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_035216_304224_57EFABE1 
X-CRM114-Status: GOOD (  10.53  )
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

Mark the interrupt as IRQF_SHARED to permit multiple counter channels to
share the same TCB IRQ line.

Each Timer/Counter Block (TCB) instance shares a single IRQ line among its
three internal channels. When multiple counter channels (e.g., counter@0
and counter@1) within the same TCB are enabled, the second call to
devm_request_irq() fails because the IRQ line is already requested by the
first channel.

Fixes: e5d581396821 ("counter: microchip-tcb-capture: Add IRQ handling")
Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
---
 drivers/counter/microchip-tcb-capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/microchip-tcb-capture.c
index 1a299d1f350b..19d457ae4c3b 100644
--- a/drivers/counter/microchip-tcb-capture.c
+++ b/drivers/counter/microchip-tcb-capture.c
@@ -451,7 +451,7 @@ static void mchp_tc_irq_remove(void *ptr)
 static int mchp_tc_irq_enable(struct counter_device *const counter, int irq)
 {
 	struct mchp_tc_data *const priv = counter_priv(counter);
-	int ret = devm_request_irq(counter->parent, irq, mchp_tc_isr, 0,
+	int ret = devm_request_irq(counter->parent, irq, mchp_tc_isr, IRQF_SHARED,
 				   dev_name(counter->parent), counter);
 
 	if (ret < 0)

---
base-commit: fd94619c43360eb44d28bd3ef326a4f85c600a07
change-id: 20251006-microchip-tcb-edd8aeae36c4

Best regards,
-- 
Dharma Balasubiramani <dharma.b@microchip.com>


