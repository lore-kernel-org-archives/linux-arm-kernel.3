Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FAC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wr2AnAyGpEYLu/a4pBAtgSY2fg4oeIUJzy4LCp//70Y=; b=SIXtJgqB09zRvheer3Zd/V77Rc
	4Bfx7BLb51AigdLku1bOjEVVTCBafK+vceeK+TYm19rDSU+OfSi/6z/+iZjMw4NgWJPFYF8KCByyU
	tHMJAx4dsfq+387sh/rvAXVq1ZB4JzpeqcDkCc9Z9T0Tx57d5UBw4rLmDCe3lvElutcbckOUZx6uy
	7G6Z+99w6auW+zvsviuGHCPMu0AXLib7IMVcyvKyZcVK+Pi6oMYy+OD0NyW5vV7xYe/tVQMlfBs4S
	hs0gqj8hsvBcUsTE+QdndPrlqSdejdTQzCQQvV84fP7Sj48w90CA8vDK/krZNa/nAeMCJyhQ/tyyN
	TrUOvP0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5m-00000001eqE-2bug;
	Mon, 21 Sep 2026 10:17:46 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5S-00000001eW3-1b1Y;
	Mon, 21 Sep 2026 10:17:30 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789985836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr2AnAyGpEYLu/a4pBAtgSY2fg4oeIUJzy4LCp//70Y=;
	b=cmOrwUCTWdilfAHxEtzSuHM6KjEy4V3It1tIQkfIDrJ3/t46crfCBjguJonZ0BXwSAf+9t
	BsPY3ODPdm7uX7WC7Swp/CP6OICUd3WK5MGxfdib7w/KjyPm0HPsPjEbrivbuAIS8GaU19
	z01z9Q9CaxFEyta/iVXRmyw+V6LqtW3GmAKhxKt6f8EHeIcnybVD5JYEIvY/inDcr5akMB
	ZDXIL5YrwNi8er9I7TRFIQlyp34VHphzY028hcp7Q06nKqumLzbdHLqcI0PGFBO/cc+OkS
	l+JipBP8JrLtHH/Fe6nOp0veXuU4BlMDINglyuHMZtGhy0hrsrPhpmlpBBCDUw==
Date: Mon, 21 Sep 2026 12:16:46 +0200
Subject: [PATCH v2 3/3] spi: dw: Use the rx-sample-delay-ns value parsed by
 the core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-spi-sample-delay-cleanup-v2-3-b460d572fd32@kontron.de>
References: <20260921-spi-sample-delay-cleanup-v2-0-b460d572fd32@kontron.de>
In-Reply-To: <20260921-spi-sample-delay-cleanup-v2-0-b460d572fd32@kontron.de>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2128;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=mgQgwES2Pc1SSRbRExhFGQn56WBZxKlQB6CyUrwMRTo=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWsji5bV0uernm5YpecuwZu75OHT1blX9jo+FAs20D5xa
 GLXlrzejlIWBjEuBlkxRRYpfovXtmaxPvLHqqNg5rAygQxh4OIUgIn01TIyHOzS+Dgr4odU+LpW
 g4W9HDIG82Z/CeQ55pgsn6M87X+IJMMffr6OgqdeO1dVFbmcfHbuXmv+lEk+U5trPNeGdi6tWPu
 fBQA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031726_901254_EF4F68FB 
X-CRM114-Status: GOOD (  15.47  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The core now parses the "rx-sample-delay-ns" peripheral property into
spi_device.rx_sample_delay_ns, so drop the private copy of that parsing.

The controller-wide default is deliberately left alone. It is read from
the *controller* node into dws->def_rx_sample_dly_ns, which is a
different node and none of the core's business when it parses properties
of a peripheral.

One corner case changes: the peripheral value is now treated as unset
when it is zero, whereas before an absent property could be told apart
from an explicit "rx-sample-delay-ns = <0>", the latter overriding a
non-zero controller default with no delay at all. There are no in-tree
users affected by this and it is very unlikely for out-of-tree users
to set rx-sample-delay-ns on the controller level and then revert it
to 0 at the chip level. We should abandon this configuration that was
probably never meant to work like this and doesn't make sense.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/spi/spi-dw-core.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-dw-core.c b/drivers/spi/spi-dw-core.c
index 206d3f9dd83d..b86b607cc817 100644
--- a/drivers/spi/spi-dw-core.c
+++ b/drivers/spi/spi-dw-core.c
@@ -1104,12 +1104,13 @@ static int dw_spi_setup(struct spi_device *spi)
 		if (!chip)
 			return -ENOMEM;
 		spi_set_ctldata(spi, chip);
-		/* Get specific / default rx-sample-delay */
-		if (device_property_read_u32(&spi->dev,
-					     "rx-sample-delay-ns",
-					     &rx_sample_dly_ns) != 0)
-			/* Use default controller value */
-			rx_sample_dly_ns = dws->def_rx_sample_dly_ns;
+		/*
+		 * Use the per-device value the core parsed from the peripheral
+		 * node, and fall back to the controller-wide default when the
+		 * device does not ask for a delay of its own.
+		 */
+		rx_sample_dly_ns = spi->rx_sample_delay_ns ?:
+				   dws->def_rx_sample_dly_ns;
 		chip->rx_sample_dly = DIV_ROUND_CLOSEST(rx_sample_dly_ns,
 							NSEC_PER_SEC /
 							dws->max_freq);

-- 
2.55.0


