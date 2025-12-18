Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83C3D6D234
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; b=TIkryNWIRIQzczp2hhhU4yPMag
	BIUh0Lw53HWVRlnlluGz3LVSsKH91ahjmWQaXU4PGosHFDnfP6qBJqSl5fYRUSpUhs5wPyWl459BU
	aJmHusO2UuTHlvzdRLLFKCp3mHSgzZ7u9MFSpEd86fVFDCHxfHEK9dzQk8qmS6KTdu/q4QgupQfXv
	No2gZyeO7No9o/20RnDLcfUNp/vOb1+riXfK1EdaWxz2tzJU1yYCeee33pdJtTWX6zqfy5uLBI0OT
	5UU7ZXR0dll/FVpmFx5juqKz4aXz7Et1HXJ2OXixIQllPmtw01qamKjdJnFo2FUrigKb8VM474k7i
	zH2kb3yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpI-00000008gHx-22Ho;
	Thu, 18 Dec 2025 15:22:00 +0000
Received: from mx-relay71-hz1.antispameurope.com ([94.100.132.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFpD-00000008gG6-0ggX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 15:21:56 +0000
ARC-Authentication-Results: i=1; mx-gate71-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071289;
 b=GvswWLdOnixsPwF+4zcIh2sQQb753Q1ILgXVPNyVwdMxw98z03V9ukkve4bYS7xT9pQCZ5RT
 itnvpNSP0noLdFq8n64JzYQ5f3dXk77oqKr1j3gglXL4UokswqCRVChYw0iHw8LLutj9krO6QNm
 T3d2bLak7e2L7IamfzxqFT6Q/0ZXPKFcMFqC3yUUl4pnUTY3CmNj2Nmp1zr7Izq2Vh92nKq/3gL
 KW4KhSTyijDUSWJlWQJ/XGbW5FNWqCrCeKOMFDkyiVTgXKj0auOT+6l9B/QZTBdb1miWt+2HAwZ
 sLYT8omq9TmkBmoKvWdD0wjy7Ybg6vx3PMC0afsL2r4QA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071289;
 b=e9KKSgAVooCttrSyfMiQi/GIFTvbKQWzT8xN/6vVQA3e+/+qRWCoxh4JreHH18u6OKBDqe8Y
 1ALP7KwiM8XRop6DkHNLsh4NQQk+uKzP0cc/pbpSVQs9Xym6AQxcR6jgMgBE5boPx71AjztqNMf
 Z58+BlSaVMFuL1UGL5po5Uu5Hx3BAAflxd6t51KEKBjzyE15LJKlRZ+c7wQdxwVmIb9+yKEFjvs
 4oWUNn6MrAGIrsY/IdmNGW0u6jWw7plC2OBG9+ZMoa8jJu4doMqB1Yh3EGVkTrBcGDI6wFcKnQ1
 hYw8F7J4it4JojxaBzFQf44AqA/4WAUB/qc8FX+yJcvbQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay71-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:29 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6B138CC0D7B;
	Thu, 18 Dec 2025 16:21:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 18 Dec 2025 16:20:51 +0100
Message-ID: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay71-hz1.antispameurope.com with 4dXDs34QP3z3fwGG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 66d9300a35196336384c9a16144f2bee
X-cloud-security: scantime:2.419
DKIM-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071288; v=1;
 b=cPPEptkpTwPvcuGEUSnerREsFrgM5KPUT4VlH9Tp2HT9hYrluc/sq/A6yWKHrGc29AB8AyJM
 wIJQE6YmS2bxZy6UEqYU8Yej+2EE2nXGZT1Iw83m4zv/Mjf5f2/idFSWZVw+hR5CUz+qrtqbSR/
 CGFxRfUMgyR8XjjsSWzihMWot9f+KaTPOYE/aOEt16QHVOPuGV7E7ZCxucnNUXVSTsvD1HZjPZF
 XPEIQESSqLK1ymZbnzvbJOqzYzFA0BU56Xow9LNJAlSPwW34SgPXHcAnDalifCAdAS/jse28cCL
 IM+XjtkU8FFeUWZcSu809hSO1teaGOUs+i6MFTfyjCYAw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_072155_357321_9649FA2A 
X-CRM114-Status: GOOD (  11.08  )
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

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index dfe9fa5c4dbc4..6384b36b6f385 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1401,6 +1401,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0


