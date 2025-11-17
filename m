Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAF2CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PVQJHrJWhlagKeC9ETVwWymdf23EeXs9KXo4Z4TKE8M=; b=yjzAVPmxZE445RGUx/HZCx1DHX
	7gb8UrTq9LGZiF3MbIICMrbnOTvNZMBITLjZbdZUIgirscHF6G54SuJpHBjgINaFkvbezb71SKOQQ
	a/ZIWtBbjLrUhzM/7vRbDzAcRZQclTEuvw6sCMUQ1YrAcS3RXgLbiwHxUv+4yCUyj+2kTNcF2a3z3
	uVGn3jn0M9L8+UnhZSKYvozY7Nqz1qRtqi4Vdg9/rtfYrZ8BKAFCPkBpgiBP4njNJVlFlpG7Vinst
	Pbli7aYlsenpHAC83xEUv78dqgQ1KQ7ISYTL89tyl8A5NEOQ0Gmvm+N9s0+Smxn5hau+yDxbx1BxC
	b4o1KL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyzS-0000000G9cu-2g8H;
	Mon, 17 Nov 2025 13:09:54 +0000
Received: from mx-relay184-hz1.antispameurope.com ([94.100.133.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKyzN-0000000G9b7-3VQ8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:09:51 +0000
ARC-Authentication-Results: i=1; mx-gate184-hz1.hornetsecurity.com 1;
 spf=pass reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PVQJHrJWhlagKeC9ETVwWymdf23EeXs9KXo4Z4TKE8M=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763384977;
 b=P5R6HBx/+6Q3VSVyApvRYE5+K94SYc6BQC/pfM9bLUswXZ8VcRaXKDUmMDH81qYhK135KPnS
 6JL2Z7x7SoIdZBU5NBDeha9FtcHKwLFoYGfS6g6ovcX0LEAnoyMEASCUUDFis/ZICLoFIsJv5PQ
 YnNZdXZzlIehD/jY2N6OyxlcYL+WW3Kg3ke8M0f1ccuDsuwfJIEazco5lGtHSSCTxtAyYaTBZtB
 7sWB0TxY1efgNs2cBPAhLhWADpK/izIox/vWZPSLkgJK4F7QOODol7K5D6ycEh2yqvnfxPG/qdk
 nasZ7KaQJbG8mkj2o65qXd0wPZsck+0pZ4Hw9DW7Nn09Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763384977;
 b=pLZW2INQXlgqQ4Bji+b3toM8NDVshwZFuJnJJjBo/QgNEbOEYwJ5QYBvCMyN2DWpRxzPnxjV
 PBHzELXwWzqAVJ9CyN5XRNjGllhEUcvEoT3MEUeTNbqKqaVQYGxXqMgL1gtcUMQjwhjw5OK5US0
 q0+CqTAy2PDtr4pyqLfNtT3K/H39bM9rA2jAe7OniAQV3pPB72XH6+8t4KReNnE4fiqWcKhVble
 T0b5Jy5VvI8KwXAIGnCPQFnWyT+fvS8IZLfzeMpYzGfPjCyV8KLeUSEkDhTMceYAeWpPKuHk7vP
 riXvvjzpSfgS9Jt/655yV5HFa8+2UNZUGVDEGk2o8AqIA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay184-hz1.antispameurope.com;
 Mon, 17 Nov 2025 14:09:37 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 8BF77220BD7;
	Mon, 17 Nov 2025 14:09:18 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add TQ-Systems boards MBLS1028A and MBLS1028A-IND
Date: Mon, 17 Nov 2025 14:09:12 +0100
Message-ID: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay184-hz1.antispameurope.com with 4d97PC2b7gzZcGt
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: e2915acad8a6ce551fcc14ba3130ca14
X-cloud-security: scantime:2.389
DKIM-Signature: a=rsa-sha256;
 bh=PVQJHrJWhlagKeC9ETVwWymdf23EeXs9KXo4Z4TKE8M=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763384977; v=1;
 b=ZT3YrdFGnW3JDlkwBj45+wiv/PFELaHfDbAPaax5dDRi1KnTM1y1SYoBOk/EdRe24qo9QI4+
 4TBQZzg6EurM3VxPl7E8I6T7nRluZYwlQj5+fjmhrSy7eXnd7JHdABZ5p2BraROHnS5N7Brb6GA
 siRnMGSDzjMCQkEOqO8mo3DIieREvxwUjSsesVRMY0JUTqxnSLgwaH6LgNpdZgMKGiGVc+6tfJt
 NCrETpUolgS5dH56fv4ncTsg41Rapma5ZuhrJFXxES/u2K2zkCeA8tUBMJRNlqPvz+M6d0+CtvI
 JJhu1B9ZOo234ysh2jpzSnrNtc5DEM6u3Awq9Ot5eW7jg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_050950_012198_2E5CB5ED 
X-CRM114-Status: UNSURE (   8.88  )
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

From: Matthias Schiffer <matthias.schiffer@tq-group.com>

Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
Layerscape LS1028A.

Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v4:
* Add Conor's A-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 34ae86d370f69..2288ce271c230 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1666,6 +1666,15 @@ properties:
           - const: kontron,sl28
           - const: fsl,ls1028a
 
+      - description:
+          TQ-Systems TQMLS1028A SoM on MBLS1028A/MBLS1028A-IND board
+        items:
+          - enum:
+              - tq,ls1028a-tqmls1028a-mbls1028a
+              - tq,ls1028a-tqmls1028a-mbls1028a-ind
+          - const: tq,ls1028a-tqmls1028a
+          - const: fsl,ls1028a
+
       - description: LS1043A based Boards
         items:
           - enum:
-- 
2.43.0


