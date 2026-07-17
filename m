Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED24EC44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 03:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdA+b8Si9um/Amzm2X55qXer/EowQsn39kDbVPtOek0=; b=dtqK/DYBLc2aNZaoOolOS7wrPJ
	1Ig2Led1iVcZujF4h3AzNC12KBSqSTWVcmozWn3cLHptvG+wqgiz7du3J2kg394yab5zJYmIvfaL6
	qjEpAJ3eS1JsllZV5IbHmKeOCFM5nX+F9CCb+c++J0H872hqUgJTah7rNmdMz8nXCLeBjZV27VY+F
	haVJ2XQjRqx3Qi6uII4rXa/oFNxeQZPsCH36oE3TTj0Y/olqIdv0CFWo8g98dSdsLeqhbmZ+t+e8Q
	Skv6qu5MmoQ096I4aFsYmHUs6Denrbcl/xj0mIWNjy/yoEl/moqlNYKHArcUwL60F7rKPgZw8QHnM
	fj8G+Wsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZbx-000000014md-3KiT;
	Fri, 17 Jul 2026 03:51:41 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkZbq-000000014h5-1ekG;
	Fri, 17 Jul 2026 03:51:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAjKZjabCfQKxz8onUHDLNVBqu+pMgDMjXuQT0Y5t8yHe7AkW9Z0iADV0Y3/yHQBQ3dSq2/bav0YAK5kJ4zgyRm+TD/hyyYrd47b4NdK1Aymdib721QEwirvsSujutsyxRpB8HAUYgMMVOFPZv/qJ81F9I2fssIrmh88JdTCByZeNyEMVS5XhfxpDk9LhqfK83a/1Sq7dPqklTiwsE98FJRRo6jtY8Od5sUM1J7UPDODZYvk+Gsc98fYoCk32OUrtMDB9iVmArAssepkCsgEaqV7YP6H4i4WBeD4v5L7hn3XXiiHtTg4IpGh5AA25v/TrfiKBL+L1ngzfP1VomgrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jdA+b8Si9um/Amzm2X55qXer/EowQsn39kDbVPtOek0=;
 b=OjeMCnHrWN2lOSeTLxXlQiszt3RMUuYls7uzCG7/KH665/k4T8vmF5AFEjx9mAPl/Bj+xoRJSrBD11A4SQ9oXSQG6ZySNKr9Dj4noG6zqEW8RSP/i/YsbidsLLL38stJkaIuwwS256iUjBiNY6+MQdmK7sI/x0SLGLOm0DrfHn1t7NS7hZy0maZ8JMmyqfP3D3dcE/37ot5+S8SvOtPouZUudCEf2yaw+DbEbZfW9MDYC8JDAsRgnm4SzqLKiipzS9Q0yAZgCi7nnN9p6oDkcDHPi43z4Z3osp0+PKLy8W1y9K+aQ6WGUKlnRsCbtbhvOpiPaMr5G9dGtWPnBVGC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=amd.com smtp.mailfrom=axiado.com; dmarc=none
 action=none header.from=axiado.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jdA+b8Si9um/Amzm2X55qXer/EowQsn39kDbVPtOek0=;
 b=WVVtfatTB636gDF6ZHnl6aRu95p0mqVU+FTFc0pMQHEtOXY3XQpE/eu0F4uQ0hARZxtVb4tcYStBeQ+skALTbRZ4FZuKqzWp7haNMdbZdpAiluuikiq5QEfnmIELYqtMmKAiCLclYIUPd8EkKdZg5J48ivBdc9pbQCylzKCG8jWJuF14JJCFMzzinbvkKZL2jMIWvDIOgUzSryHe4L9UTP6vuufW4JZqISPpQHGfwiZqB88DBBHulXET1pABHlDiUigI3dmVsl5rxxXZPUD0MVukZFHmL5J1boG34GQShSGutoHPNq3tfL9qc6RrWIETMl6vu2XISMCmu6Uc/WGaig==
Received: from BL1PR13CA0341.namprd13.prod.outlook.com (2603:10b6:208:2c6::16)
 by CH0PR18MB4258.namprd18.prod.outlook.com (2603:10b6:610:b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Fri, 17 Jul
 2026 03:51:28 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::82) by BL1PR13CA0341.outlook.office365.com
 (2603:10b6:208:2c6::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5 via Frontend Transport; Fri, 17
 Jul 2026 03:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.5
 via Frontend Transport; Fri, 17 Jul 2026 03:51:26 +0000
Received: from [127.0.0.1] (unknown [10.4.1.181])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 3DC734186B5A;
	Thu, 16 Jul 2026 20:51:26 -0700 (PDT)
From: Swark Yang <syang@axiado.com>
Date: Thu, 16 Jul 2026 20:51:10 -0700
Subject: [PATCH v3 3/8] dt-bindings: i2c: cdns: add Axiado AX3005 I2C
 variant
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-upstream-axiado-ax3005-upstream-v3-3-c429095143ec@axiado.com>
References: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
In-Reply-To: <20260716-upstream-axiado-ax3005-upstream-v3-0-c429095143ec@axiado.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Jan Kotas <jank@cadence.com>, Michal Simek <michal.simek@amd.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Mathias Nyman <mathias.nyman@intel.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-usb@vger.kernel.org, Swark Yang <syang@axiado.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=syang@axiado.com;
 h=from:subject:message-id; bh=CQh2z2uNqnXzk5ByqPrD1md+pHnsCGo/NsON1EVbwHI=;
 b=owGbwMvMwCHWlWK8+EozbyzjabUkhqzIZXv6Kw5/Z12vyHH84976WxP3O2hmbU3e3F0yS8nh0
 rsripKTO0pZGMQ4GGTFFFm+6nzLP5mrfa9z78pSmDmsTCBDGLg4BWAik+0Y/seqNr3bcmHl1JT7
 ClINu8+8mPjRXe6e7m3eDR87v/Kb80sy/BU4tSpNl/FF0pP4Hz82sbg6C989NOHV+0WneH+cMee
 dGcAFAA==
X-Developer-Key: i=syang@axiado.com; a=openpgp;
 fpr=F52CF66FC96D2BDE89BDA9758A6433A3D4830D5D
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|CH0PR18MB4258:EE_
X-MS-Office365-Filtering-Correlation-Id: 11482943-5ec8-4067-2064-08dee3b6adb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|23010399003|376014|36860700016|82310400026|1800799024|921020|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XOafQ4ajy9qGuh0zgMq+z2IXvDZAG7Exs8Q+tyZrKZDeSTlW5WOG8v3Unt0pvcXAkk/Btw264fx9lk0PgU4ATmj9t+1rk1P9wflbdnf6KNch+i412WZGMSeFgnYQ3LlUtqZ+at9SwKmwir0GWhxDel47fkiVzt52ExpAjKYbDULEH82TlIPxyylbSvLQeE5duWJ/ETrgVl0sT9MrDX5jqqj6YcZhCXhNa1dSmjzjaJYKbB/kkbRDeKFWF0ngNQT1vjnfKsweOT9p6OS3ae+hgcXdS7W4b1SOl4oCd9Odx9U6yQblYRCvm7L93rxcWub6yjdGJS/GCPS5jIi7005oKn9Kk5x5J8nRpXPn9SNxR4WI8u9C9MfUZA66MIzH6lUxPZ4M7x5VY+sNFVRIRyn8auXdPUBhMcA8SEbPOcq/DzoJ7cWrak4sEs90M1DOfpvcL9HO0XD57PjKsUWuJyrWO8cxB4svS27QN6nPf/EXORxLqd0RKeErrRWoQT+8MwBbUyHmgAHF2/XpFF/nTKPo+OW8EdJ4Sa81/0r8E8EAzYDxQrPva9R4Cgcy4uyCU1aCYGlL253Fxyg/skkH8RR2weyg8QJ7vaxvij6mgG2RmW8uf9JC54M/mZC5QM7wQGcQJ7GPd9Auov5uQ3+XHtvUbXweeKjX26Wn1EPYHfZrWleI8YHN8JYcCa00Enf5CFvDUrN+PTUYcuwrH8VIdAexA+NVqyQmTvZwZQdqcIw5ixI+aWXkTqTp9yAMCEUPXBOe
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(921020)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TIovB7T/e/Ad61CjInigwWvEmCr1tpYsvTzI8r/rgPZyQF4B92lpzTz0qqC3esF0LNsmTzmSS5YvLp6UQN2lvbgWuXql4qjqrINANLme7M7mloER9oBGA1vRzcAihN+2/bEOcQRPxrmIYJU+FW2fL/cTjGPmLOlPYdIzQk9cssPETLKJC5y1qKPsrydLfIyRi9nubOoRERifGT29/56jrMl5fDftm/gReIDvXp4w38PsXsepnoNm3++XslW0pHzxhSrkSk1zLGQPcw2jDmU+w0sHr/q1tDroOYP5XgUBFN99yxbAh70HWzjTdOCCoqr+4Vk03M9GNNaB6UiiK3QM0RoVjVOBqw6xCZw94YFoKj5XZL8FcaRGxSiYc7zs2C8qGFk1DKwFAQu2qkX5u9dx6GDzteEdTEWKZ4yzjZ4CHs2BFR+mBOAcVjLq8+RNGGNy
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 03:51:26.9371
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11482943-5ec8-4067-2064-08dee3b6adb5
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR18MB4258
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_205134_448690_2185A84C 
X-CRM114-Status: UNSURE (   9.22  )
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

Add binding for Axiado AX3005 I2C controller. So far, no changes
are known, so it can fall back to the cdns,i2c-r1p14 compatible.

Signed-off-by: Swark Yang <syang@axiado.com>
---
 Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
index 9f1d35ce1fe8..4dc69d54f75d 100644
--- a/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
+++ b/Documentation/devicetree/bindings/i2c/cdns,i2c-r1p10.yaml
@@ -14,9 +14,13 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - cdns,i2c-r1p10 # cadence i2c controller version 1.0
-      - cdns,i2c-r1p14 # cadence i2c controller version 1.4
+    oneOf:
+      - enum:
+          - cdns,i2c-r1p10 # cadence i2c controller version 1.0
+          - cdns,i2c-r1p14 # cadence i2c controller version 1.4
+      - items:
+          - const: axiado,ax3005-i2c
+          - const: cdns,i2c-r1p14
 
   reg:
     maxItems: 1

-- 
2.34.1


