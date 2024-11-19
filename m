Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4B7D62073
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 10:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3MYDQqisN2KniiILQsunnGU5a0Xmilz6YeeH6WTn3TI=; b=HJp/qLjUK+bir1j5zxN0EJ1LhX
	lG/gxiseWfsQVxgQANXmQ07+s3qi37cnytgym/cEZA9y3qxVIpCq+zVUaCn06A6b275IGPSwMP/G/
	8t50CE6OqqoI6RfiRpZWJMNO0AmnSFJngMyAVpD5yvPg1g56BbVbIN6FE9D8rV7eDJ04a7Uadjn56
	TGuCyJ35Ln3phF/GegXERToj9xe7ceQZW8mOPSW/8EVvZKPytinwn4QBMOtfair/yaNyTc+teue0S
	8bM5id/4Ni8XJhay7Fu7sN+/8HvHsuv6w2D9wVpwxe9PbB+6an8pUJrYLmupZ67GhFzcW/hGldDel
	AUTSAlNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLpO-0000000C79J-3XoX;
	Tue, 19 Nov 2024 10:51:26 +0000
Received: from mail-vi1eur03on2061e.outbound.protection.outlook.com ([2a01:111:f403:260c::61e] helo=EUR03-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDLoS-0000000C6sP-2B5l;
	Tue, 19 Nov 2024 10:50:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alrdz4e2Gr8mqKZWNAeIV6PJHkcYxD5dMzEAVZRpSyG+cLiDWDWLXEMqY+Lc8NW9dmqLcUyu6Gy3V5mHCxkRkm7nM2hg8DpUMYotuLqeWotWdIw4EsEx+HICviSkFPfBXXojeWG5rPSctRtpxjI18SrBDGRkHtwQ0259XqNeCcMWQ1VMIKIBh5e5rg7TyVYnDHClBgpXI+jAOeIg5jOmio/+n6RU5nuKi61l03nIw5cpxk7dsubxkC6wSimQC7rOkxOyBuf0LLiDhRlpSd7nOl/7swTCorVCaY2hm8jZQ1t/xSTNlFp7TtL1zcuy7pX6ciwy5kcPxD13NqHcr3eyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MYDQqisN2KniiILQsunnGU5a0Xmilz6YeeH6WTn3TI=;
 b=u8KkNih6CLZM05gY63vrYut/nQJaRM7QLFLYgzRn/SekHDACt+YIm2Vs0R6wa7oK966Y48wvKhtj6VVc+Mh8kJ+ywrGN2nt+Br4Nznv5co1dWbylP0BPGkkABiCsShZ916BbcAPEjypvmcHmRfD/qE9uJifJXfvvJWyrOxu/iBPAz5/98u202EZZdxpN/d7uEyIiGjGYmCx/MEtqggH7vb/SwTvjL3JasoDt7w4AIkiCZcW3SwpLviBPg7Cq8VOXE/BM2Q2VH7O4KP0yjniJAfMnQmR/kbRJq7mpw6urFDV9Gao6KmJAfWnEdcucw4LXd+PNY+VOt/x7O0DveUPfpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MYDQqisN2KniiILQsunnGU5a0Xmilz6YeeH6WTn3TI=;
 b=GiNTmxVDtUXe671yUxluSVHihpvL9DsteHv4q8zfk2Eo6OyzJtMxv+ZA9yLUvi0niw8EdVRMSSgBH1XNUsKF0JyxylPykHCUD/gQg7Ojls6VmLNk2X1dkPzzt6ZLj0L/h1n0MnNiepdhhWhzJHUcAtLp8VwilIgaDgqIfYR3um+8UoBS6rTHf9wOpmVQZ+kigvaoCR3SccoCjY+j2FW+rpkvo2yP4Thyl0tMpc1OXMGspPUp1b/l1XpQkXbYhRtQ4/Qo8MB8xGppogEszca4nkeeSRji2kkJPJj4OlczHAvf3pU6zMDZ0OZeyIinm6WC1oHG/AAT/oeZWAWvLPVBKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7637.eurprd04.prod.outlook.com (2603:10a6:20b:29d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.14; Tue, 19 Nov
 2024 10:50:23 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8158.023; Tue, 19 Nov 2024
 10:50:23 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	jun.li@nxp.com,
	alexander.stein@ew.tq-group.com
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2] dt-bindings: phy: imx8mq-usb: correct reference to usb-switch.yaml
Date: Tue, 19 Nov 2024 18:50:17 +0800
Message-Id: <20241119105017.917833-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0162.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::18) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7637:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d436e68-588a-4fff-89ec-08dd0887f7cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YUf9Gb6Mp6Bm9EwqG5iD0H/Fv4kH7qpWxuZoXImVs+DvmfK9GQzY/dDIQSkk?=
 =?us-ascii?Q?NWmQQn9r8Wf0SYiH8MK7p7YMp4QffvtDEQEi7E7DDUbEAbydDMx+UrHtX78b?=
 =?us-ascii?Q?rOla3gzcILpe+fejLw0FxAOlPFDNv5VronFtnTfMva+ULQKBBSsg/+i6g99w?=
 =?us-ascii?Q?DW4kXNaCJoOmb1Sq52WhDJfavEIleukd1Z5UZmWUxNEPdQMuUN2cFbWFuCtG?=
 =?us-ascii?Q?Lfwzethn39hKa1rzHAy/B1eWxf33V8QNwUGbse3h2RPgVs3qf0MgYfcOp8+B?=
 =?us-ascii?Q?rKaOa52UuYQKIinc96G7ZA1gP63bEe4jAqfdQmSXT2soRgcDanIzlLIYpIJ5?=
 =?us-ascii?Q?Vh+NqEk/1bgzVDzrovZyZKHnwnPvIuUZdpgT6gPx0cu7uz9c7BSX5S1dum39?=
 =?us-ascii?Q?62UK9dZbhlmx32DQChMSC7T2oob6cZJLx3d8qhmxQAXj5d0C7Sd5TNH7mggi?=
 =?us-ascii?Q?5HRaRauHAut94uEXGV74V62OfjJIAO0iozzpnG5x7hmXsJ8USLVHuxoMcKFi?=
 =?us-ascii?Q?ZOCa45cyQH+aOGxDk+qZ/aObSIpRLmoQarphuE9nNg2/OzlqRiHbHm49YK0Z?=
 =?us-ascii?Q?rk0OWAoWF2lAwUldIApPhvhg4ObnJSeDSIT24N5DuyNcvFDV8PhXo0kEbaQ/?=
 =?us-ascii?Q?DxraKcnvYy/4b9YQLB3dpQJDtLfz4awkRKQ1wXewOr+f4HzHcnJZ3B0Z6do0?=
 =?us-ascii?Q?WigTO6VK3nqvwheQFvvb+ZyK622twtZLo0vT7Jaqtdg0fkol7JFV5PjBTdDK?=
 =?us-ascii?Q?hjt8yxzV50ErVpdBNXBUGRypxzmMrwguePfTq+xsMB3C46l8xUC9b06XMNg3?=
 =?us-ascii?Q?mvGQpps05QLprZG33VfwCOrdft44L0s7sdwMJQr5Cj7eU07PSXSPav0RiV44?=
 =?us-ascii?Q?BkhTQKGZyQY8TpXrx5pCOzlY12CYOjcZvG1JUWVhRuxt/4+LBbTyv3UKXNxE?=
 =?us-ascii?Q?4As263qem+V/Lw4Q5zerXMBFilR8DvcY/OGy1yP24q5sYRHYBg5Pz0u0xNQD?=
 =?us-ascii?Q?v//gWImeBFlWcbWRqi6v8gimkIgGkEQEMG6JMhBsBxL/P9Ls/xlfW+wdoq2I?=
 =?us-ascii?Q?OruTTMa63MVWlgjMJvSipH40Mgw4dN/F7qRXcCEl3hIL5J4lM+cCNiBuehaB?=
 =?us-ascii?Q?9CiF1wCRV15knWqKfLr66iD044yfRi5Fw2BnByxPWSmMDTLtE77UBcFy8KyM?=
 =?us-ascii?Q?X3QPkWB7DNStSJPwwJjocQXFBm4tHt0FoXuMDwYnNWVZ/VfZtjxVIBTWXeZF?=
 =?us-ascii?Q?UBUzEk62tNq3qJuahPKBUVfmhGGboJi0mkapvkpS7ov3PO7jCTApkP7TV0ik?=
 =?us-ascii?Q?TNdZxmiw3dEjcqOvsxHn2XPWpcrf53bH+MUw3vGZuQbt7VTtiiY72zkROv5i?=
 =?us-ascii?Q?TFCq62FvHVEcOhDNDaAtOx1UOslr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?joiBkPphpMJYzUNjEs8+nL/AGw+sjPn8xaUC0PcBzgB0mgVulwXlTcXhtcFw?=
 =?us-ascii?Q?Nf2eUtLG7QsPu/ECMrdcYbMmMkGWvoHMftoijbCB0qHVdgkOpKvxmrl6PImB?=
 =?us-ascii?Q?IdBMJzKloTLm4XCjVFMYOC6Gyqgnc7PRjMBnBeu/NpkSu4viSw8XrexxzBB5?=
 =?us-ascii?Q?+yti46eN1kuoEiAOoVuG5QZ6xSsi2MrFdroRHbc3Q8wFZIsDAcN6nTW9zXzr?=
 =?us-ascii?Q?+0/DRyjbYEbHODlFcGXitvWc6UhY+mx5lCcsTdmOYh9GMW7LLa93yp6H/+Ab?=
 =?us-ascii?Q?8mro65FG7CFpYckOjicZG2VZPW/fvdoohppHnObKdSlrBXcTff3sP4cAa20A?=
 =?us-ascii?Q?l2qNnpOzkHUVieFpN1PXsUo7b9Fb6GPNg9E1E1N/iyelN479bbpK9eqo1edt?=
 =?us-ascii?Q?1STZiNnrV8pEwcbG/YolDBAPDlFEsLJh8lM9RWqBNvrkFirZ3OwDB0uRyjRc?=
 =?us-ascii?Q?Z63MI3qj0EVRQsqpX3ysenlCMfbh3SCEoi1Dum3H4qnYH76cWMxm170s1YBN?=
 =?us-ascii?Q?Vu1mlpKmWFsjEraEamGFBLbJpWntFxQayQsHg52cZu5tIGtSnOkp1ogeGpRM?=
 =?us-ascii?Q?d3iGj3fjoVv/f2//gt3Osd/ul97y7i33sfMkPPvZtNtyMXHPxb7MXI+fsuja?=
 =?us-ascii?Q?tjk0E3rnNRYSQhxzJXGq5GeJR5OmIEI9VIOHs76t1+kJ8VNCg6LAV97549nw?=
 =?us-ascii?Q?17j9UX8iWAjm+Hk5YDHAqsLJmVsX4p8x4SbLnx7b+V+BEvpSB8wcl4uDFvRh?=
 =?us-ascii?Q?uRNXiDLGbUM1e/dYktyTlL2P8kWDKELigqk4SanRs538++gW8OvqoARSu6BG?=
 =?us-ascii?Q?YyrL2ClKnLCuodvxMilsQnZqDSKnXhv0KCThC5PZEe1BparlDfFZyAoZ4HE7?=
 =?us-ascii?Q?UM+DUgrFDJnP5iOOg9BFyRrk85aQ9sMFj81ot30T7F4aHu5aNMkEM75yIHyN?=
 =?us-ascii?Q?r1+bvLEOO9BI9r4UgPx6KFZxV7SfWriZrV3QFLh/9oviOYjMi6wHNQWqdMqa?=
 =?us-ascii?Q?qsX+owYGO3511TIX0JjdYs2YJk9IlcKwESqxHGx1wYJ6eh9IZtfeFlvzZreP?=
 =?us-ascii?Q?tDzY0i6OsdW3CwuRTJJRzYvAOjtBlIK0L3MCtaZdzePucV/tcxvKxXvq3f3j?=
 =?us-ascii?Q?W7+RtQwmTVVcGxplCqgdOAtUA7kmr92RPqDUXjZc5ZuVnQbKVSo+hIdg4DMx?=
 =?us-ascii?Q?ypP95Hx0XQmijmISWcMwaqjPbxXRNMlfb/CDMoAD43gJt+B29RzjLzKvrX2U?=
 =?us-ascii?Q?RArvbCbuRDIHvVUix41IPVV1BcvN/zrpmI6hbEo4oIM9dPaF95feJv3VXtpe?=
 =?us-ascii?Q?lf8vQiixlJJ0hFzgJumyfP9aCFf2VnCfN7c3cn0wRL070kmodHP7qYk8blaO?=
 =?us-ascii?Q?i4vzorQfudIsSMmSRMrYXN76xojtjc4vYI8sop+DPx5tAYjDe5x5mG4w3tlv?=
 =?us-ascii?Q?nwV2Aw10Sygj0xCP6Gup05Ft9Yt1kjlYG7goHdDg44TtgOiZehxSanwQD3wI?=
 =?us-ascii?Q?p+XFxZIqtXopLvF7om0V5vBpp40g0p2/BNddg0tuXnjqwwSsIJkL+sC2TWWB?=
 =?us-ascii?Q?GIaTeLX3JTz8c4clAYH4HD81vzWmmHKj8xUKljKl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d436e68-588a-4fff-89ec-08dd0887f7cb
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2024 10:50:23.1362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQAeUeId5um2UEA/fPa4sEnMV+ecy3+yLyHeKShTcUGb4PVyCHYvDZYuOi/tJzu3YAePyIZX1g7aVjzNMwjp5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7637
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_025028_559704_ADE5F21A 
X-CRM114-Status: UNSURE (   9.56  )
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

The i.MX95 usb-phy can work with or without orientation-switch. With
current setting, if usb-phy works without orientation-switch, the
dt-schema check will show below error:

phy@4c1f0040: 'oneOf' conditional failed, one must be fixed:
        'port' is a required property
        'ports' is a required property
        from schema $id: http://devicetree.org/schemas/phy/fsl,imx8mq-usb-phy.yaml#

This will correct the behavior of referring to usb-switch.yaml.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
v2: remake patch and subject
---
 .../devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 6d6d211883ae..daee0c0fc915 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -113,11 +113,8 @@ allOf:
           maxItems: 1
 
   - if:
-      properties:
-        compatible:
-          contains:
-            enum:
-              - fsl,imx95-usb-phy
+      required:
+        - orientation-switch
     then:
       $ref: /schemas/usb/usb-switch.yaml#
 
-- 
2.34.1


