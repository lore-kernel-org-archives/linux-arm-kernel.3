Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F743C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 06:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CNfgiJGe75bxYZx7cV9w6QGEfQoA8UhTS/OM8EnSOvw=; b=TYWx9OQsitpqKJzSoUMyyodZSN
	OIxog+Zk4FyVPpOg/JEkpVRL0v4hYk0GopTRsvVtqbCbM7RwFbbtlanPJlCGbqkcq+SjvFbmaHXno
	5P2b8ZfseOTvBNHYP7U8NWZz1M3N14bDkvFL937qeonvyzDiurwneQzFAxe6C2R1OElS3SFIw+kX/
	3hu8NmPil/ee/DlHV211Ww4S6WVgjP/YEb31R48AMLraR0ZyxqgRwIc7GpvKKdTDsRTSMLgC2bD7v
	GRkkJ+WiTr5vo4AFx8DOAZltSjo7ChnaHK7/YVv0Xt9snOWSDrTldvRAHYTuermBkwesUHwqFE0rH
	nBw0xKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtrT-0000000HM4S-057X;
	Thu, 07 Aug 2025 06:12:23 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujtov-0000000HLsF-1BRw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 06:09:46 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujtot-0001Uf-Uj
	for linux-arm-kernel@lists.infradead.org; Thu, 07 Aug 2025 08:09:43 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ujtot-00CKWc-2O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 08:09:43 +0200
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 6B963452501
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Aug 2025 06:09:43 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id D72C74524EF;
	Thu, 07 Aug 2025 06:09:41 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 0258dc56;
	Thu, 7 Aug 2025 06:09:39 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 07 Aug 2025 08:09:30 +0200
Subject: [PATCH v2 1/2] dt-binding: can: m_can: add optional resets
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250807-stm32mp15-m_can-add-reset-v2-1-f69ebbfced1f@pengutronix.de>
References: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
In-Reply-To: <20250807-stm32mp15-m_can-add-reset-v2-0-f69ebbfced1f@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de, linux-can@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-e44bb
X-Developer-Signature: v=1; a=openpgp-sha256; l=767; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=iej0cdjc27k6Bz33u+4F6cGRHPmWzI4nQIndAd+/u4o=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBolEMeg2lxWTBq3MMvHt25j9u6XXC9I/VkjDdGX
 k/6brPbb9eJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaJRDHgAKCRAMdGXf+ZCR
 nDcfB/46rZcF18AjrXct7AOwzpzUrbFpJPu1JY0dGrhO/g5HBMLJSzpesMYyGxb563gu1Zmh1mR
 xx4xFP3yX7WGilhlxg6wBNSLjoTcMZPy9Tkjuzp55DukC9ZzGJ9DZupfM5ShEykfDIX5VhkkHsM
 mkxUjouLtJt7nt7+M5B9ce0TVLayuf+7BA+cfz4rF9gSdosCXLp5iAwSzxvuvS298zbX2SNxVOX
 M/sqxqPmllLpRIRXKHLiDsvzlEoOSX9dTon8FZZU7PMdz/k7heI8SAOfNBvKg2zJpphKQjSUNLj
 EUwxPLtVM1zI3NvftYu2DsX3zRjSFdknETy1ahWklUxW2Ie6
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_230945_335132_AF109B87 
X-CRM114-Status: GOOD (  11.01  )
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

The m_can IP core has an external reset line. Add it to the bindings
documentation.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 Documentation/devicetree/bindings/net/can/bosch,m_can.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
index c4887522e8fe..61ef60d8f1c7 100644
--- a/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
+++ b/Documentation/devicetree/bindings/net/can/bosch,m_can.yaml
@@ -50,6 +50,9 @@ properties:
       - const: hclk
       - const: cclk
 
+  resets:
+    maxItems: 1
+
   bosch,mram-cfg:
     description: |
       Message RAM configuration data.

-- 
2.47.2



