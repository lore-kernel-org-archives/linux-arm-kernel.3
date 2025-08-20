Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0D5FCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=THxasewbB3NZErTvCJYSyt0kphg4beTkQydrDvdXdg4=; b=HBUZzTHIaSRhX1RxKO+NfMXXjO
	/hNbniv1TII1TkMsB6BDKaAorgv7PQ747V+UI63KwMPPAQSB1ZQq8mzz4AKXfSwdipqOivN26OtMc
	hPffpS1+LGMNYLDaQ9QFIn93dbIWdFu0wtBZFe5E85k0GeiDRTCmjHMdeBReVNwxFi80gpc91QrSp
	+90moIaMSo/Xqff14x77jwrerxZh9s6f0jfIqLhJiAIS5gOnuQFSshlgz574kSDjwEoaJujEBx11X
	LSovdnqV7p+xZTV8hUfW/iVsGk4B/D9g1fafQYJ0CzJlbTi6UbJwtGAzsAOMqhxZY967u009DNNc7
	7rDg6Wvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoplu-0000000Eu1E-32Ee;
	Wed, 20 Aug 2025 20:51:02 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolfW-0000000EOdW-4Bgh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 16:28:12 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4c6X1b4fdBz9txb;
	Wed, 20 Aug 2025 18:28:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THxasewbB3NZErTvCJYSyt0kphg4beTkQydrDvdXdg4=;
	b=htAFSp8T2V57wTvbTeZuv7GKfkBTyRCwGxdnY4N01iRVv8otmuvNdXIuqsSDWLZsKfdQJM
	OvNaaWiNEOue4mKyEUXfI27MOMyWDqxE6syZ87tGCixt43XCbFAX9a/JVFvWeRQyYFCd0k
	Fa7rHBD8BFtIP0lFDXzhm0iiWG2GaEmn7qY5zfE5MxyQcZPoHPtWyKrs7K3ncW1u/5TgqQ
	OpMnzBNmhHGUXD0q3gAfcPDjiqxaT8OGKEPfjAyaj6NckTMgy1NmfXTxx9AyT0F1l8OSHa
	/LIvbFUukZa5eMtJwJ9lPCOjQZqyTlPX32tFrTAP4xQniSq/qmFILltxr2JzlA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=a1+ovQjM;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1755707281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=THxasewbB3NZErTvCJYSyt0kphg4beTkQydrDvdXdg4=;
	b=a1+ovQjMwVryi89XOnY02GZGO38nm14gzCqRrfUYXtHyPimtmo9abd/TGGB5q2KnYyBbDa
	NTmxWQs8lGMLDpzOnkvlCZiEIla9Vf0itvnfUFcaHZ9t3YkWbu7GpW7vtRa4QAYwoh7t12
	i57jvW40dole+8/6pAlhUfi97dNMzYfH5v3hzpad/rCPrFZkZ9dPgnk/BFXoxY+YW99RP8
	QUAzntF5gkRicgsrPuWMKUvLlPz/tgnad+9aMOu2Y3D65R3zVLiazbwvf8g09e1yQ+Mnjr
	fnLVle5EcqrGCXSiZUAhnkXiNMoViEJ/lC1rSI48LHsKyqyJItisTcHQPj0AJw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH] arm64: dts: imx95: Fix JPEG encoder node assigned clock
Date: Wed, 20 Aug 2025 18:27:26 +0200
Message-ID: <20250820162747.209626-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 42a9365009c8e456f2e
X-MBO-RS-META: 6ftgtswhgastpp3ta6et6eeoxbc7m4cn
X-Rspamd-Queue-Id: 4c6X1b4fdBz9txb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_092811_187083_1BCDE99D 
X-CRM114-Status: GOOD (  10.68  )
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

The assigned clock for JPEG encoder IP has to be IMX95_CLK_VPUBLK_JPEG_ENC
and not IMX95_CLK_VPUBLK_JPEG_DEC (_ENC at the end, not _DEC). This is a
simple copy-paste error, fix it.

Fixes: 153c039a7357 ("arm64: dts: imx95: add jpeg encode and decode nodes")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 4ca6a7ea586ea..8296888bce594 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1843,7 +1843,7 @@ jpegenc: jpegenc@4c550000 {
 				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&scmi_clk IMX95_CLK_VPU>,
 				 <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
-			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_DEC>;
+			assigned-clocks = <&vpu_blk_ctrl IMX95_CLK_VPUBLK_JPEG_ENC>;
 			assigned-clock-parents = <&scmi_clk IMX95_CLK_VPUJPEG>;
 			power-domains = <&scmi_devpd IMX95_PD_VPU>;
 		};
-- 
2.50.1


