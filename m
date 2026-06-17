Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D710CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNqMUerv7N8+bvgZGVWPeQ/EBmi9TTf9ApjS6e8XmLo=; b=qGV3CTL0FvkRzBL8iSXODASRE7
	BVvj/H5WHCdusPy+v2V+TQ+Mjg3Zq6RrTOX/Y4SH5FOwyQc0ppgf4zNqwL+nEtNi4j2vTxPel/zwn
	KMvKESciBW6ziJEUaynTEZQH8VlLbzHw4VPHzKJZ95uMCuq/2XUyq7HOdl8yqMhxzO04DOtDgjdp8
	rGKcJ6DsbGhL5BJ8UReG/gj6mC50ETBcPEeXpea47xgYaMWalA73ukmj3sZU3F+bC1KPQhP9BSOP1
	cv2DJU9tVWVAejB1xtbOe9K7HhIvaDnhIcUmgHHol+BsNhu66n86qFUJ3LiuGZmtm0oVvmS2SFILH
	HVCELDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJE-0000000HKS7-2YD3;
	Wed, 17 Jun 2026 12:23:56 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpJ9-0000000HKLZ-0S00;
	Wed, 17 Jun 2026 12:23:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JDacl8kVUeNKTWnwJhuU+EUlqcX8qCJcN6xFH/zAO00QEbWPVX8AZG5ZZ3K+4ypdUzFiOwHe9z6MTRLlCqPg4ucCJ7sMbqCwT1RUn4tZuAy2lP710yhnULJplDo+fwTvhMvfOWLjf3LL4U9NHfLX41UG25oeaVzF0stJiQKe1GHV5S1sChdmCv61pEYz+oTFlQsD4BAD5EzaIZCXm++Pr6jR8dN1imZDm8LgY27jAIo/kPN/qN9bDhfVUR7R/0Hh9Tbh4huH36/kJA+JBNSLjX1oKB66rzLJXxilQQqaKYk6uzc12pxiM41JqrYGhESr12NnmQRQj9qQxwd1aeLaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNqMUerv7N8+bvgZGVWPeQ/EBmi9TTf9ApjS6e8XmLo=;
 b=nNoFBPztFKuM5KxeXqa8AuNbZQg/aq8QCJX7g5X8DusGVs6jFzSgFUCuae6ayaBUWw9iQrssnkhPXTsLLvDzioJRBwlGB/+9RM0Q68sjQYI9cjvYJh5CG6NyAiIga9I21LjaY1VABAIB6Yxrt0ojuJ3LuyTvwVmrjmQ6XX8rbXbW8hk+GmPYPMuU4bgKLl8Fv3Gs/sbAw8bdXsv0uWikppgPIRNDCeWOgG88lnrKF7s0jhehFGWoh3J1u1NwfDn9/xM2BwFXPI461Ins3oLE+CMCe4xBUxWSrj9Euii7J+HAZjuQOMbgMI4BmCS6eOkWoig21hBSfvrmx/9nt9ES+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNqMUerv7N8+bvgZGVWPeQ/EBmi9TTf9ApjS6e8XmLo=;
 b=1QkgQH9EETcfC0yIb1vWtJ/NLLPkWS5gRTI38n5Etkqx9cnCts9rKt3Vi5EUCJg9fXhMFqEim5BHZVQx78Mpz4N8wDRGtYKZwFQcBFrtoUQYZE2W/U9ynM1RCUjdmES8P5D0486nwFd3Oo3KZEjbkGv37x9ZKj3hAbgvjhy3mqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16) by DBBPR08MB10697.eurprd08.prod.outlook.com
 (2603:10a6:10:52a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 12:23:42 +0000
Received: from GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6]) by GVXPR08MB11763.eurprd08.prod.outlook.com
 ([fe80::8790:5e3:beb2:5bc6%5]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 12:23:41 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Date: Wed, 17 Jun 2026 14:23:14 +0200
Subject: [PATCH 2/3] dt-bindings: phy: rockchip-inno-csi-dphy: add
 rockchip,clk-lane-phase property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-feature-mipi-csi-dphy-4k60-v1-2-4611ff00b0ff@wolfvision.net>
References: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
In-Reply-To: <20260617-feature-mipi-csi-dphy-4k60-v1-0-4611ff00b0ff@wolfvision.net>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781699017; l=1111;
 i=gerald.loacker@wolfvision.net; s=20230502; h=from:subject:message-id;
 bh=+fkUZqO5tCw1DzVBFV98c6py2Y8GYrpd7jphqoojX9M=;
 b=ngnCM6Se9ob7/8fVybKAoS6c1ECkebotHMfkp9qfwRZEZUSKVLoDsu+LAhAindPwZR90554Je
 EjSRAaDx7EBA/ioU3dporBPQE3oACia037n7q7KiebE4FFBGkLNr0N5
X-Developer-Key: i=gerald.loacker@wolfvision.net; a=ed25519;
 pk=UXhp+obGMUOjknszonesnb29P6a2Kk/K5eBuz62ggVE=
X-ClientProxiedBy: VI1PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:803:64::18) To GVXPR08MB11763.eurprd08.prod.outlook.com
 (2603:10a6:150:313::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR08MB11763:EE_|DBBPR08MB10697:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f5e1e2-e274-4397-3fc7-08decc6b4424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|366016|52116014|376014|7416014|11063799006|3023799007|38350700014|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GdkqO2dpsYcApEHfilJFGIR63oZI7sbbksfl3lXApJDu1r6wetaY+Evy6pE4zjtdXPfcRKqRM4mwuhsYBO5FaXnUnCH7eN405Y51DeOJ1BWsakmlnEm2gtoXwdDYJBMMBfVbXhNoHx2oxcdO0uF+0wDEU8lXrPb1JaoBvI/RveNkbSCH/2YP14N6pQX65VgjR1+qnicVRwh1mQrDiwjdv9TRpKVJ7xL5h2BIzsaQnYeSjNuz73suDO40+MbP5FAiFIjL9HvIBJycJji9QlIedtjIAuHX93+uimx3QsS6r9DpZL/Urw4IGPnFOo3LFlxUsS0MRoNalEo2cdhzDSAQEA0sPEPudlMCdm89O24WosYFpwqrW1I/hEBUpPmoXGqsnDPpMiE9WDqnAEnpkTkWSdAqGIiGDlSr7v+KZDMIcCBV39SX4MV8d3KpQN5/biyHfxymezdPfjv82z2nG0U/Ecw/VSMwpgl6vw0cfdqSpRuBV92cD8TqvEAWFJ8P/KPq1BozWQPH3BsFkj/gxpLfH9l4WvvwORTv9CPmf5u3wMeA6x8dpwJ0kQh9hwzHjUlXy54nWixAF28g3o3IdghkJqiVvW8fZMjx/6T4qX7+ANkM1ay6zBhNJeH0GWUbNsNCZGWq/wtnS9QEpRfmp8u+czkuIhZZNacxKLyZcaOOEVKpZ71SK5ET4uImTfP6qxbmxdfRMWGOSWK1oYqfvJzspsEP8OKuicBKu89nKWM2WiMKVyUtLO1L5xVbkSFUc1C3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR08MB11763.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(52116014)(376014)(7416014)(11063799006)(3023799007)(38350700014)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1A1dmR6VVNVTHlFdExpZGs1SDQxVzNmTXpncjNGZjlhemlwZ1l4c3B5eHgy?=
 =?utf-8?B?bHJYYml0MTZuaHVFVkY0a1BzQkZEUmtvVWxibGxQK05zL09PUzJPVHZHZDE1?=
 =?utf-8?B?MUNzcjA0NGgwL2p1Vks5UmFJVUJ4YnhzeWJML0o3aTdQY1hBbTR0cFFsYit6?=
 =?utf-8?B?Q0J3K2k3TmthaXFmS0JnNDZQdUgrSnZBU2c4OE1BS1oyZytNY013Q3JUQ1BQ?=
 =?utf-8?B?K3NldnVSd0I0S1gyNnFrZDdSdGxJSlorSC9SLzU5Z0pzVFZQRm9kZVJWNW52?=
 =?utf-8?B?MStycjhrMjB4OVkwcG4xOVphUW94NkxBYWJOTHZrWUd6NVlwbm9YV1JDcHFo?=
 =?utf-8?B?dzZ2TkVnczc4Vy8vT3pWbVpsZHYyWUR4WFhuMkE1MmFzeHdTSUZUbEJmdjE4?=
 =?utf-8?B?NkhZQ2lWdlRhVStBTTdFNjMybjh5TzE0VFkyaTRDb1pyTm5WbU8vYWlaSHRY?=
 =?utf-8?B?MSs2NnBDYjVRTndHV0p3UWtnaUd3akFQZ09iYUhVaVg0NTNCK3VnK0dEQ0NQ?=
 =?utf-8?B?MzVvNW5pSHoyMUJuMUN4NHpjMWdrNm83dU83cCtmMFVHYk9RcXViS3pKTG5U?=
 =?utf-8?B?UEh6OENhdmh6azdlaTc0ckxuSWY2ZUFMVXpCb0tPc3g2WnhjTTY3UEhDSzBR?=
 =?utf-8?B?TjdsOFZvMXowV0JlVjZWbzNGWDRKbjk3VnZBRm9OT3V1TzZxUlRkOE0xa2V4?=
 =?utf-8?B?VG51SEg4QUo0RVZoV09uRGlJYWlhOW9naFBRNzlIUy9yU2Y3R2NIT2tUUEhW?=
 =?utf-8?B?dDZaSWRLYjZpWXZ3UFBHSEVtQnlMdlY1MldpZnI0YWw1eHpNM0JYRjFkMysx?=
 =?utf-8?B?clFEQXoyYUxJMXNKeFluNTRQd1F0RU1CSnlxazJkeElrWUVwZ240OUF6Y0x0?=
 =?utf-8?B?RXJZbUVBV3I3S1ZlS05ZQ2R4ZzZjc1RvRy9keVFCczVBd2hLMEZSeExGck9Y?=
 =?utf-8?B?Z1Y1R1NjUmZwbHlqRlFtVDQ3MXM5QWFLejd5OGZmZWNLcW0rYmZIUzdCY2dm?=
 =?utf-8?B?VGMrSUREWjh4NWxqdkRFaGQ2eXk5R2JBbjJFZEtBTXVsN1NEMlovYWdaTlpj?=
 =?utf-8?B?Y1JsTDBtdUQrTHdJYm5oSmJ3K3A4OVpJbDZDbGtoQzZyNy9qRzZsYjNhMHcy?=
 =?utf-8?B?V1lXVElVa3ovOFFld1J1cWhaVE9VMklaSzZweVZmNHh4T1I5MzdkWnNuT0ty?=
 =?utf-8?B?ZnRuTTMvRml6T2drQ3BJOTdDcEJ6RFd4OHYyQTdZYVZicnhMYzV3UWVUZkkz?=
 =?utf-8?B?WUZuTElabGdkNTExcExQSHB0NDBWL1JuZmM1SmRGT1pGdWEvZWE2c3hSNW1Y?=
 =?utf-8?B?SmxTbHNvQmVUVUw1R3lCeTlRTzB2ODNpc2VheXNYTC9DZUZGK0daQVM5Qm56?=
 =?utf-8?B?UUNHY2lTVUlsQXRWbmZpU0RaU2NSaUo4ZmRxM09HcTZMRzBsUC9saE8vSGIx?=
 =?utf-8?B?dkJxekIwLzRFa1dtbTlQcHFGNjNHTm9JUUlLWlBKWkhHTmlQNU1EKzFqR3Jz?=
 =?utf-8?B?ZHRzVnd4ZnVxN3NzUGRSZ0RVeXZQNE8yd0dBNmZPUkE3Yng2MjRML3B1MmdF?=
 =?utf-8?B?S0NKNlZoOXJsajV3cWUxUjRBS0R6OVBJZDJTMmZBeHA4dUsxVmNTODBzRGZv?=
 =?utf-8?B?K0RLRi9ld3RYRlRjVFEvb1NzUkRDNitPNVV3YzQwUWw3RHdXK084eTkydTNX?=
 =?utf-8?B?Yy8yUVVTektPRFJNN05xZlBPak1kR1p2Y0dqTjFSOXM3Z3lzbXgyTnhld1Nh?=
 =?utf-8?B?enhCRm9xL3BwdEpMbGMweGdaT3U1cGF4Slo3YlpqNjFyWEtPMHkrKzhhek1L?=
 =?utf-8?B?TFgxZkdlNUlVcUpTanhWMTA0ZjhpaittOXY2VjN1b29KcWw0WFZlLy9sUFhp?=
 =?utf-8?B?dGQrY1dmY0E3MUEvNlROcFM3SUdEOG1OQlhQQXl3QURaaGdWUDVwRi8zVUJN?=
 =?utf-8?B?dlRJWTBCVHBIejZvd0ZnVzloN1AxK2hJbXo5S0Y4VGhPN21FWXZ0S2lROGx4?=
 =?utf-8?B?RGRzUDM3NzNQMStVY1FkRG1XWXFQZjh6bG9HV2NyWVRtODZqQzVrc05zSWpO?=
 =?utf-8?B?MkJzcHIzYktnQm9saWtSelpCV3RwS3RkdzZOR3lrbEpjdFhYRHFqWFBHVFhj?=
 =?utf-8?B?N2U5UDgrQkVOMVVjQnRDZzlRd3pnUkJBd3k1MGpDUVh4NStIM29mRFB0SVpo?=
 =?utf-8?B?akNLaHExcmV1bHpnRk80UHlZTmpFN2YyMFZjT3VaMy91U20zQnREREFOdVdv?=
 =?utf-8?B?OHlVQ3FLSlpsdjJxcm5vQjhqZ3RDOTFQMnd2Z0xVQ3VqOTB0N0l3WUd1TjFr?=
 =?utf-8?B?cGVqZGNXN3U2RVZQNm11NDNaaUR2WHUxWTYxOHB3aFVFdWdtZm05OURpSEpZ?=
 =?utf-8?Q?QBO5O8Y6C5tt2cEc=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f5e1e2-e274-4397-3fc7-08decc6b4424
X-MS-Exchange-CrossTenant-AuthSource: GVXPR08MB11763.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 12:23:41.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iopv0W0x5RnE3spVhMSmY4O/bT8iCXb2OywwYsZW1lXGGavi6V4chgRNzV3eTOZvQqhSFNOvbQb152aS2kysMmYCQyXipZ+9nDrtfB4ROOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10697
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_052351_202886_50CD92FD 
X-CRM114-Status: UNSURE (   7.34  )
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

Add support for the optional rockchip,clk-lane-phase device tree property
to allow board-specific tuning of the clock lane sampling phase for
improved signal integrity across supported data rates.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
index 03950b3cad08c..0d824d1511bc0 100644
--- a/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip-inno-csi-dphy.yaml
@@ -56,6 +56,13 @@ properties:
     description:
       Some additional phy settings are access through GRF regs.
 
+  rockchip,clk-lane-phase:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 7
+    description:
+      Clock lane sampling phase in 40 ps steps. The hardware default is 3.
+
 required:
   - compatible
   - reg

-- 
2.34.1


