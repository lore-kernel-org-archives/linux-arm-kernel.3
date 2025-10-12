Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F3BCCD18F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9tLjtrNjk1hZ/AsjYl5tJ0dev/qb7f1nlrD5YY40hGw=; b=atzXUwz7dc3f3fD4iC4NprHQoo
	+8GuZBejE2yGdoFRX+32dT0aYfbf9BfSc3zk9ajsxKtcslUtPu6PmsqaeDgUJWZqBafNEW3yKRm5b
	pztoPQiZR6UvvRicG1oicdF8aF24hMFmKyfURWyZ5fv4o3CN8r+XPtN2OchRIVCU631OCmEavDWmY
	6v8kCZ/W6OdDKgeb4wHg5M7IF8pL5OwK6F1aC+6Fuo6nItScAY8PHLBm+pejnE7btGndmSdyG/KNm
	tjZYSLZgtPSugNvtz72pvZ5vHvvoockhLCdG0nj6thWCiDfy5AA3KBNrZrWLEMKiPOp5++iC70Nk/
	6O/oGEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1f-0000000BJcR-0rLR;
	Sun, 12 Oct 2025 12:18:11 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7v1K-0000000BIhj-1470;
	Sun, 12 Oct 2025 12:17:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kwnJr37jA9JHy0LY7DqzIzET5L8qfxxX1td7LmlG7f8Ax85qd3ixkscd8SgnGnUE4bRzstmtWg89cjsWGfh67ZAMxoVAJ8K0Ff9feUPm3wKDJI62fx4sn0S54mfLvcJJz0YynOD1qBSsxx2AFIhB4Mev4LB15zD63Z6iVpKwSsunx/N2+uNyMRBPkIvX3Gx1Pvb0JDKb56StPRf/+hD+hNDe6j7AG3BlE+xstQP3Cv7mw45F4LcbWWmHKV3jrWllm3PmYJ1G2uTobfWYoufrgUHisbtfy1P2kTBgnkwnvbVhU+Wc/lnAuoVhuKFe/aGBSCa8b2zpgUS4W95GXabCTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tLjtrNjk1hZ/AsjYl5tJ0dev/qb7f1nlrD5YY40hGw=;
 b=qG5uR4nlchn8tHwLkbaoxtiDYj550NXOtcH4OEsloi1ZmXR2SI6BRg52T8ewugPfT6qUKLrkSIqDgdXwVlWbLBObNfmMa3DRRmjzzB93R8rwETrpc82W4rIn9899msahpUxNlg8J53Jsp0VYVtbmnUzknRBbGfh2C/1A/vmLYRaIsGX5VZNUUohX6BVpKFKgDDIPXVHwcNCn7tElB3ZbA9I9ACMIV3jIVdCKsGlCKqCVakgJcCr8ZpqoMaPH4nVtpFrqWz+LQtetTsdcdT3KqIJRVjcM91d6YIQ+2Mz573XMcjDyfMWdFbq9yHCx7k5Q74Us3UOjrKSwIUmQ1LBNnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tLjtrNjk1hZ/AsjYl5tJ0dev/qb7f1nlrD5YY40hGw=;
 b=ZSr4OM/vit5UU3hHSNfNmENobUqqZG4UWuO2giBi36LkHXmUhntulHIxG945s4rcAFOAekcZCYlzQaj8jpR/RpYxxXd7sEJfxzqw8seOajO5PLRQ92aLDHAvVeA+kXtIbvbznqpE3HMYbWfqW302hlXY0Qea95qyXbu9mCqvL2yGennQJggFbJT0jtxmkAPX0cs0XU9Wm/8PFeT8xbQwkRIasXauwiu/cjN/KZ6sHAIhyqFtNdM71CTnSsC1UXeG6my/sozpyKJwO/ibrTE9Qp/2zaqYamWPAq8RTkMn0hid95SyJJNA56YsARFYa/LTWw9kgJlvJSDDDZkJ2HNfLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com (2603:10a6:150:7d::22)
 by DB4PR08MB8056.eurprd08.prod.outlook.com (2603:10a6:10:387::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Sun, 12 Oct
 2025 12:17:43 +0000
Received: from GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0]) by GV2PR08MB8121.eurprd08.prod.outlook.com
 ([fe80::4cd3:da80:2532:daa0%3]) with mapi id 15.20.9203.009; Sun, 12 Oct 2025
 12:17:43 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Andreas Gnau <andreas.gnau@iopsys.eu>
Subject: [PATCH v10 15/16] dt-bindings: spi: airoha: add compatible for EN7523
Date: Sun, 12 Oct 2025 15:17:06 +0300
Message-ID: <20251012121707.2296160-16-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
References: <20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0424.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::17) To GV2PR08MB8121.eurprd08.prod.outlook.com
 (2603:10a6:150:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR08MB8121:EE_|DB4PR08MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: b3d3efe7-4338-453f-3806-08de0989581f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WdHOLQUntu9Lr92RVaumrojpRZ75V+B+GDzVNg5fG23pr2Z+44lV4eJTsRJ3?=
 =?us-ascii?Q?wLQHN0BvKdHx1Oly57Xv0PqvlovlklzhiYtBE6WrUyFg3Xi8eNLoSYwINksj?=
 =?us-ascii?Q?tT10KXA30Q4Hzz+OyAk9eTT55/Sxut02JokCFIjl8y3sYSOlbD0Rbxoaya39?=
 =?us-ascii?Q?T/TMH5CCeLmy3QTMvqxruw1LE4GbHrgh/xo1eqNKbmaIUqBYl+cE51lmGZo5?=
 =?us-ascii?Q?AQ1ZzqNyxqD4hi0CecEUTXHV3TG2UnMrXWvbDlnzi85jip/p/6fXxWuFkhgU?=
 =?us-ascii?Q?29k4qDQ2JJ+4bvTyiGKgWZCzJkJZ5Ph1XEBoNRlT/N1PH9NPrfbx6TzD3G2T?=
 =?us-ascii?Q?FV3/n5SNpZxJvOWXLvLNJLYCX3rPZ0ui+PqENZUyU6MkQd/+a982+NHG9j53?=
 =?us-ascii?Q?ePgwTbXj3gqC1PQF+4ku+N+SoNNMtZWGMz71yGuuZR73LyrByLBicNJAyQLw?=
 =?us-ascii?Q?RglKxTYFYg7bIyILfbNwEAge9yG0TYeacoee2ZmGLFiK+etkZmrO5q4YuKhQ?=
 =?us-ascii?Q?SZegl3LI3AgGXDZOA+0JLalBG0+5zWF9EJoA8sGlNewDlqHqNvR9iabT8wQx?=
 =?us-ascii?Q?2I5IIbAio47Zc42bBpgjkzNOlOHLvQwzFBzraAMDfTj50t5+j5eKIiafhOCv?=
 =?us-ascii?Q?zCeFk8Oyl0Lc7lIiFQCMEO8xo37IoC3OYslXOFtlLWWOQd1TZmTOpRr0W/pD?=
 =?us-ascii?Q?uyV+3h5J5UavPZLzd2d6ip8Aum7r3wdvX7ICMmO5/0l8KxpS3t3RD5GSY2QT?=
 =?us-ascii?Q?1AaEcIvcAqMNC/Yx6kqWmdQEIiz2pwd+Kxp4UKYtLTDQYRGs3NqUeaR1kEX8?=
 =?us-ascii?Q?yTES0lpLYTT7okG6y8YJkSzmdMIffNnPi+8zPpPTFn1H09oHLm8WuuZ0SwXP?=
 =?us-ascii?Q?FxVi4eug/TdUABKSsvoApohOCW5v5BJASy+ea4QxaukMaMR9qT9HIYKMS3of?=
 =?us-ascii?Q?YdAbJQxAzRRl1IVocPyMzwzD0Cx5bfYRu9z1WMQRpoNBiG2GhrdxM5p5y4HK?=
 =?us-ascii?Q?pk2B5CbiziyYIjOgIdZPYfxUI9UJqQR28CqJkSw95+JdxpZ4k76mVKhEXwho?=
 =?us-ascii?Q?oBurSceE1NNYm1BIfJKEtfhk9dF+kibOHbNWP4BXQiAC5h5a4fy+cPqVW6ow?=
 =?us-ascii?Q?Y2v7a4L876shIaXBR+VoGsYMuE4F1M5OYy20RT1VYeg05KR4HDiH1mio9U9Q?=
 =?us-ascii?Q?kqMGeVPkiKVg/CfdiA2NHlhjWWAiPJYEFiYvYJJ984svsbnM/v6EU9K8IB5F?=
 =?us-ascii?Q?L0+jInMNbUSuwkmc/Bm9MLYROXb0W2EnR4pjoq27l8FjWsrmFrdmctGpShgn?=
 =?us-ascii?Q?JQacDn9qduqCyGaI7mOz6WwFBzfcEjOTMjML4Wp43cyaR1i4g4xYOXxx0xat?=
 =?us-ascii?Q?RMrJQmFBgZfcztHHOvz//AOAm655XdlPYhdZmcyBmsUAkXOjxr3BA7hcbwWO?=
 =?us-ascii?Q?NmF0sWuunTIoxBVh+0HHKr9Q25W9Ph/MqLyb9BkEA96kMpdQi/vNL3+z3IEn?=
 =?us-ascii?Q?K9kksP7LDMjpQXAoVuTjh8keqvfGyVlFacDFna88Es2qoWcFQmSCwgN3xA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8121.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E01yCbRZmRikrCbfmkzrbNNQKVW7Igz+xVWvvhB9xlbSSxWMliO/9U0ZV5vU?=
 =?us-ascii?Q?z59tC7M1cBn6s4W6AOuw1IkrwkBLCEn8Ad2OUWDQI5t0ONRBmPc0LZSlBmoI?=
 =?us-ascii?Q?tu7GRtUM21S8HQyo+oTt2Juky28goR11ONzGSoWFqbgjclKJ3XkCfqmiwNfC?=
 =?us-ascii?Q?4KKmKPI+qTlQgUYkxQpPjahfVChs62MDiXq4y+RSLV4m+0ypqTySwaAjI8lh?=
 =?us-ascii?Q?qbbh8La/558PdRDHCJHOaqQesZhCiR45jYYEgCcCKG1UYscLGmdKj4hE198W?=
 =?us-ascii?Q?dBbHEYpD18cmFHLgt6hE7tDrZKCz/iApo8VL/R3LB2JE/uDBTiU/zMSiPFU4?=
 =?us-ascii?Q?TbVM34fwZ5oeadVfvbbGwVVDe8RQCWGYE73fg/YPUNbvRbG6bBUEy4hGsKzj?=
 =?us-ascii?Q?h8sRDuWp/e4YK+LlXpkT9LHRITyZu7kvbjMh72pTyFzmCqTWyNlDy171fdFq?=
 =?us-ascii?Q?IYYk3Ggc33VQyAdMUikt77oVfrxgsO9z1UC0YkjoEED2Up5plTm9gV2s59jC?=
 =?us-ascii?Q?r1APwZdrY+3gIgkbP53wEknoeB7JPFkcAGiHTdskJicjfFT6wJULbA6CPw2z?=
 =?us-ascii?Q?+1XI2xN6cA3MxWn27dIoMA87J3vtm9Zmkpgf0Zj5X0fkqfkMyy7JfMDLyAfY?=
 =?us-ascii?Q?0KS1cpHql6surk484F0sJFVbq4dolTG/sHOAmCKIfX5ftyts5YWX2s/xxSbZ?=
 =?us-ascii?Q?q9cDNjc476eshOMj8gKHW6xM+2jks0ZHzvX83+VULo2MKnNNuRIq4L2unpqi?=
 =?us-ascii?Q?CmMzgwLivdOW+GOHOgZPAPwmhHHx+w6XFEf60cAevsd/zvhVsh+Co8zwvXgO?=
 =?us-ascii?Q?Q+KvfC+xSXCWxUNoe2nhOxiPlQF68CuWj309ttSqJqGUcTjyebIVKWuDzp5k?=
 =?us-ascii?Q?yZ7BRqZKV8kwldaTMGk/5abOTWSLVp6xGv0dcZ5BCdZfTzAz30u+PyFCbpaY?=
 =?us-ascii?Q?RJNGvJSroa9n8n5RSh7cuY+JJr0ctsE7d9t/uNWiZRAIGeodWUgmeAj5sE4G?=
 =?us-ascii?Q?eh43iZLZXptHVrnEjK9xyfHm7MWbrAImpx1bNayiTj4e+WNpvX2Pp82EPXIM?=
 =?us-ascii?Q?GhXuE9nM6DI3GTp/Wgn9FwgKxDw350qNPmCDH9SKU6fIEuTR/BZAw5n3SJ1J?=
 =?us-ascii?Q?0aQCMeWxzO4IqpWzRCgEsbJTeETfP7lfQKCLu/h3AR49CA6UhK77rba5BscW?=
 =?us-ascii?Q?mus9D4M3RaJ9AP3OFxgM+aOJTqikYm6RKpeAQYk0W9RcwvaGycuY/EZMbntT?=
 =?us-ascii?Q?bcvGuBJKJsVtTtW9HwVLgaGVexP46e9f4UDH3oYhbb88JZsihnbZVv0bBqFO?=
 =?us-ascii?Q?/Z6GMwVRNKmRhshb/KlpZSq1rwwz6+Q58qpUuodgYn+28WgM2MUgjeA4paOV?=
 =?us-ascii?Q?pNsaMfGv0Wfepa0ohEmHQpgCRjpheGbTngV89WErE8ASTLeLQJKg86+Cq2SE?=
 =?us-ascii?Q?t2r3KbL6n0r30gzL83ichX6vY9dV6I+P5MnCAx+//ofVFw+ukAbcgaOAKbrU?=
 =?us-ascii?Q?aCHqDmpR0z6kNc5WCl6AiMQ2fKxvjxiPNB4uDBwdj+GfE2mA0m09MZxz0qW7?=
 =?us-ascii?Q?JJmZlRZsW2KLVrv8jLFJ3HSx5NBLRFK+gizg4ot8vZfTN4NgyALHBAL8KLb4?=
 =?us-ascii?Q?xQ=3D=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b3d3efe7-4338-453f-3806-08de0989581f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR08MB8121.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2025 12:17:42.9527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgf9dC31E0ys9X/ar2cq1pOYgfZioWrz76y+Rdj49cf72w5kaMnWsV7Rf0+8sLEoZmeLPZvZdC3U9PjU7UHOb0N4xESkts2RgGhOrfoHfzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8056
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_051750_496847_7BE50144 
X-CRM114-Status: UNSURE (   8.07  )
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

Add dt-bindings documentation of SPI NAND controller
for Airoha EN7523 SoC platform.

Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
---
 .../devicetree/bindings/spi/airoha,en7581-snand.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
index b820c5613dcc..855aa08995b9 100644
--- a/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
+++ b/Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
@@ -14,7 +14,12 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-snand
+    oneOf:
+      - const: airoha,en7581-snand
+      - items:
+          - enum:
+              - airoha,en7523-snand
+          - const: airoha,en7581-snand
 
   reg:
     items:
-- 
2.51.0


