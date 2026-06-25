Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDCFCDB479
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 05:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OPDYO0+M/AjUDvnz3Rs7tqThwjoA/hINLOCOWS41qf0=; b=ZLnEzwnbm5kLICu+6AxBVJtQqt
	0NGs+3F8OYIczXk+Fn+f5Pf43D3h0u3gNcAaf9PTnYDlUQWMEQ+qJ70wlsVjetntnNIw6JihCikQr
	sWVR4QB1uNQpuW7Zs4xQmLvvM4958iruD/WZQpv2VIk6xFp3sFYI5djrp+g5BqvRVFCJRNsdm8/jV
	Cezr3MFKT3UmW6bcqtIysrpNPZBycKvmUb5LVg/pFUdz/tjE1c+8/PDLJum4z0fxI5iezxaCpG3Rb
	A3BE6DlP4orwiFo2ozzF8bx63bMuIx2JmpFQTvUSdP5BLfaf3be71eIHTV6M8OF02OXrOIXf/BF00
	3GLhFN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccQo-00000008eiG-2QEG;
	Thu, 25 Jun 2026 05:15:18 +0000
Received: from www537.your-server.de ([188.40.3.216])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wccQb-00000008eeh-1M0u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 05:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OPDYO0+M/AjUDvnz3Rs7tqThwjoA/hINLOCOWS41qf0=; b=pZNhL5JoQGKIOgZW1ZOfZ0mfE5
	TUYuq9iZNfgc0xvlAN0CslDP/n5i3TcqPG9jsqWDJfTp5b3v4FyATvVLxoRyxSgO/vgOa60aqQh+G
	1PI3MYaLbQsGWWw7AdDHsLSjz0NW06/OljNT5izf3ejGLhwbq4RhZTD4pA3lIwJ2WuOd77/eCeEae
	+wEVVPjkt5hoZXkiMKNxRdI0XttAoQJYlPV4yI6WPP7vL/9oS4GtYM9lbQeMJJLmScFY8mjOVJ3P3
	Fwi6ckAqjihqAtJqZenQDu/ztiou9EQgyy6v8YRsD3Vt9mYvNJqxyreLwHCJGjYCB9W/f3Yy2xK80
	vwUlc1LA==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wccQO-0001Eu-1y;
	Thu, 25 Jun 2026 07:14:52 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wccQO-0002rW-2V;
	Thu, 25 Jun 2026 07:14:52 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Paul Gerber <paul.gerber@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/4] dt-bindings: arm: fsl: add TQMa8MPxS board
Date: Thu, 25 Jun 2026 07:14:44 +0200
Message-ID: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28041/Wed Jun 24 08:24:54 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_221505_366896_34D84E6F 
X-CRM114-Status: UNSURE (   8.27  )
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

From: Paul Gerber <paul.gerber@tq-group.com>

TQMa8MPxS is a SOM family using NXP i.MX8MP CPU family.
MB-SMARC-2 is an evaluation mainbord for this SOM

The SOM needs a mainboard, therefore we provide two compatibles here:

"tq,imx8mp-<SOM>" for the module and
"tq,imx8mp-<SOM>-<SBC>"

Signed-off-by: Paul Gerber <paul.gerber@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v6:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59a..6237fb2ae50e6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1310,6 +1310,18 @@ properties:
           - const: tq,imx8mp-tqma8mpql            # TQ-Systems GmbH i.MX8MP TQMa8MPQL SOM
           - const: fsl,imx8mp
 
+      - description:
+          TQMa8MPxS is a series of SOM featuring NXP i.MX8MP system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be
+          placed on different carrier boards. All CPU variants use the same
+          device tree hence only one compatible is needed. MB-SMARC-2 is a
+          carrier reference design.
+        items:
+          - enum:
+              - tq,imx8mp-tqma8mpqs-mb-smarc-2    # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM on MB-SMARC-2
+          - const: tq,imx8mp-tqma8mpqs            # TQ-Systems GmbH i.MX8MP TQMa8MPQS SOM
+          - const: fsl,imx8mp
+
       - description: Variscite VAR-SOM-MX8M Plus based boards
         items:
           - const: variscite,var-som-mx8mp-symphony
-- 
2.54.0


