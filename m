Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E9EC982F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=90vRHS/V2op7RmcBd44fFmnN4zQU+VelDx0s5M+vwFw=; b=l8snGKc4wYkQrFPJjlpc6zMBjR
	uXgo+zl5DS+0G0usAbs9cepnCbVxYHmc1X4ncYnZrjaqHIeKTj3hQzkstwd5tg1Jy/n6SaTQXOxBb
	NhMfG9l/iS8SFPiijjj0OM2qdyP4y3Oj5ANB8QEj+x6+Bm0qKLQOyBhC0RvcrLw6Cf+pjAk9nIDHO
	IB+rSRqYgvZvs7uljZUL+21/xX9vxjxXH+spWMacNsGzc7OKTP4RS2cnEeQkDKrXABK9/Ea1lrkhk
	r39d6tYMxlj2t17UIP4nzbzLUiHaoT72L/76wqJqU+YqqUe4JDpzXwJKBFvyo19d6+9FlyFIR7P6d
	2+1E+Mcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5Z-00000001edI-2jAF;
	Mon, 21 Sep 2026 10:17:33 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8b5S-00000001eW2-28vk;
	Mon, 21 Sep 2026 10:17:30 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789985835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=90vRHS/V2op7RmcBd44fFmnN4zQU+VelDx0s5M+vwFw=;
	b=gkxvSpuv72pdDAU+Guw2nph8bf4L2JDSxsjrTxK+uWqa1T4WNFbcnX3SsRQQxo3xM6U6/r
	CSKAwPaAmAnh5LzqH9Z2Kak6BZUIuOvxFQutl4knFZ7c32vytzwgtctZhmepGfHyZ/U/Su
	YC90r+W8XdPV1AvwR4E6QSCRhULS8Wuqi2LbzXdeAxq4E4RxJre4dOkbNJDhJWLcoZFeG6
	tjCWCdsuKmdUM4cRZpVt3n1waBUw/2xB1RPNg1ppKHkdQ3FdkycG41fKsXzSnvACJTCoSX
	PMEfC6LpVH/toWyXlHkmXr4JGCY9s5QDIBemp+43D036n4ZZlqDtUmv6SSdPjQ==
Date: Mon, 21 Sep 2026 12:16:45 +0200
Subject: [PATCH v2 2/3] spi: Parse the rx-sample-delay-ns peripheral
 property in the core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-spi-sample-delay-cleanup-v2-2-b460d572fd32@kontron.de>
References: <20260921-spi-sample-delay-cleanup-v2-0-b460d572fd32@kontron.de>
In-Reply-To: <20260921-spi-sample-delay-cleanup-v2-0-b460d572fd32@kontron.de>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3132;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=YuOQ2sqjfzq8/kx5BwZr8fKOIcuHnw/CDnFbgOkUBAA=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWsji9aPDbc0nRt8r6YtWRlTY3Tq9N2kZQp3JBijdgvNZ
 /0Y+UK7o5SFQYyLQVZMkUWK3+K1rVmsj/yx6iiYOaxMIEMYuDgFYCKnTBn+h79LeVOXc2jiqovm
 DkEbTEuNv6XyGH/6+ubYP+ui+ILMLYwMzacnvPUOyKm/LVk0p7fJxuyFmtGz1yGXntrNkzbVbJr
 EBAA=
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_031726_904868_356A2E7D 
X-CRM114-Status: GOOD (  17.53  )
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

"rx-sample-delay-ns" is documented in spi-peripheral-props.yaml as a
generic SPI peripheral property, but the core never looks at it. Only
spi-dw reads it from the peripheral node as the binding describes, and
any other driver wanting to act on it would have to duplicate that.

Add spi_device.rx_sample_delay_ns and parse the property once, in
__spi_add_device(), which covers every way a device can be instantiated
and runs before ->setup().

Use device_property_read_u32() rather than adding this to
of_spi_parse_dt(). spi-dw already uses the fwnode accessor, so the
property works today on ACPI and software node platforms such as the
ones served by spi-dw-pci, and parsing it only in the device tree path
would quietly drop it there.

No functional change, since nothing reads the new field yet.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 drivers/spi/spi.c       | 9 +++++++++
 include/linux/spi/spi.h | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5b5b3bc5f0d8..9e3c24ed8f9f 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -929,6 +929,15 @@ static int __spi_add_device(struct spi_device *spi, struct spi_device *parent)
 		}
 	}
 
+	/*
+	 * Peripheral properties the core handles on behalf of controller
+	 * drivers are parsed here, rather than in the firmware specific
+	 * instantiation paths, so that device tree, ACPI and software nodes
+	 * are covered alike, and early enough for ->setup() to act on them.
+	 */
+	device_property_read_u32(&spi->dev, "rx-sample-delay-ns",
+				 &spi->rx_sample_delay_ns);
+
 	/*
 	 * Drivers may modify this initial i/o setup, but will
 	 * normally rely on the device being setup.  Devices
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 88d17fce02dc..fb4baa0d3398 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -169,6 +169,12 @@ extern void spi_transfer_cs_change_delay_exec(struct spi_message *msg,
  * @cs_inactive: delay to be introduced by the controller after CS is
  *	deasserted. If @cs_change_delay is used from @spi_transfer, then the
  *	two delays will be added up.
+ * @rx_sample_delay_ns: Delay in nanoseconds by which the controller should
+ *	postpone sampling the incoming data, relative to the sampling point it
+ *	uses by default. Describes the board rather than the device, namely the
+ *	flight time of the clock and data signals between controller and
+ *	device, and comes from the "rx-sample-delay-ns" property. Zero when the
+ *	property is absent.
  * @chip_select: Array of physical chipselect, spi->chipselect[i] gives
  *	the corresponding physical CS for logical CS i.
  * @num_chipselect: Number of physical chipselects used.
@@ -235,6 +241,9 @@ struct spi_device {
 	struct spi_delay	cs_hold;
 	struct spi_delay	cs_inactive;
 
+	/* Additional delay before the incoming data is sampled, in ns */
+	u32			rx_sample_delay_ns;
+
 	u8			chip_select[SPI_DEVICE_CS_CNT_MAX];
 	u8			num_chipselect;
 

-- 
2.55.0


