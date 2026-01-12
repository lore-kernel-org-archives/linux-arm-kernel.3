Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AFEEC9EC8B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 13:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=; b=aMwS6vhPU+go8zgDAbOnNYQHSh
	93XBb6SWQcNO9/C2gl66O/YcTHGWJqLqZgiknIPVBPcCZmS0kObzuLxbpiV06W9eGmyILPvPZe4W2
	+YD5U4OxbPsXPt+XLQ0oeSavYOudgxhoBqFbFrnHApDMuNh6DBE1kAKbU9BMK8y55C18616vnlNNG
	yD5ZtjUqTddBNcIqzQRPM/O+Xsrtx+mTrNzE4iOLVS/b4ttLCg3vNh2z+/iowaXtyQlsC7O3yK2tN
	FwmF8egV1nXYXKrbChQF5UAKzLzAg+0NO4UoRQL9E7hULGdO+BTWYsLVGuXToJsrz1SgRY6R3fkAy
	Rl+p5dQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfO-00000005Nep-3KMJ;
	Mon, 12 Jan 2026 13:09:06 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfHfM-00000005NdT-3Apg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 13:09:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHucKy5bWwMMVtz9QLCuohr18eYWrNLqpIkWetjy8Bnxk24oDugorO6BBWO9dPno/rjDouF6ecNz2WwPj66i22sc9fV3s8dZQ1KFByc5NwMoVCfSY9bIeDh69tL/AQx/3z+tzQvnbZl9Hr9QqR1x52wAFYf/GD0AqZ/UCSRe/6cUU61IQ2OlxfLbFDdMMLvbU+Vfe+JD+MZZ5hhWg4q1xA9ouaBVfZen41VV+/9IAeHXNU5aina50OVGXUX437ubOhTVwzwLcJIMZlNCRf0EGvP2retzSl5KQD16SFtVF3S7qHYVNZuEVB4f9N8ZArvf7rxRr7UWfjGJoMg0ZXWIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=VccIfOVTg6k/70H58nNyxXseXl1VVHxJ2hpX8aAmrZCengC2j0tnUBLSp/7vfKNSUV9Z334DcMqog5EUIV4XppFPkA40yEUzEFCEnxq9cwQHt345Hia26cZNAqibdAXhEtSZ3NibO5i9+tFc3RitZ1d6WSVgEYAbvGpw9aNf0yFyryXesyYK31GC63O7gh6OqluDfWPvq3ckc5/EGL0WyyhWYZxViLKUz0/uACg87oH3ORUTH/1bIZyrg2ISSyVrJAAVadfwJnBI5xsMzju7x+ge5AQgee72qShCeLt6d7W146WfnYQyTViCxEb+nrJU95+tG4iPF8rSrMlJZ+Wi3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGKphL8uRafGIEp5khSeFT4jf3S0jqRd2zl+TmBf3s0=;
 b=bT/UGCWJvW/1bIBtr7U6FwphHvB6HeOEHgCSzFaEl8NYQySag7svhEJr0vgvz6lSGI5uHZkUQuKok01YtRew1KcsWv0qv+fkzflA07R+szja+tgc6VlDA80+Rk4aCXix68CefohG8Ns8I8mRPIx6eTJdFYhhrgJgben7Yhs50GdeB5xi8aVIjuvvOBZSt84Ilhz3abclr36YzmQcgwdyNp0Wl+RHwhH0twsR1L5diRBn13TmxpgHg9gWmsjlAC1FRDRZtE6ZSeHHdlvhgPu/J3RluPxnSNP/kpdsnfUI3ociWbI13idDhj+mMGqlY2TmrTJLdBhdYeQ4d9opidcluQ==
Received: from PH7P221CA0064.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::18)
 by BL1PPF01DF926B7.namprd22.prod.outlook.com (2603:10b6:20f:fc04::f04) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 13:08:58 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::65) by PH7P221CA0064.outlook.office365.com
 (2603:10b6:510:328::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 13:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=atlrelay1.compute.ge-healthcare.net;
Received: from atlrelay1.compute.ge-healthcare.net (165.85.157.49) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 13:08:56 +0000
Received: from podman-dev.fihel.lab.ge-healthcare.net (zoo10.fihel.lab.ge-healthcare.net [10.168.174.92])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id CF142F2E70;
	Mon, 12 Jan 2026 15:08:52 +0200 (EET)
From: Nandor Han <nandor.han@gehealthcare.com>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	nandor.han@gehealthcare.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: fsl-imx: document continue in low power mode
Date: Mon, 12 Jan 2026 15:08:48 +0200
Message-Id: <20260112130849.3748465-2-nandor.han@gehealthcare.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
References: <20251230-pastoral-enigmatic-chamois-b65343@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|BL1PPF01DF926B7:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 050ef424-a9a8-4993-5614-08de51dbbea4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?azGkrR1SWUkP1fkeHOCKpTaHzneo7GHS0MR96/vX14NP6p9ySjhPbuDqbXp4?=
 =?us-ascii?Q?GbiuWnYHrOXi5sIKk6Ei6R1bJd6Cg4vT6GHPAZjqUY2eZ3IXlZCkzYRmWf8Z?=
 =?us-ascii?Q?v+i/n/K75CDuF4mrMFIVQiUE4DX4exUE4CJkAH0mWwm2TRxpthVBLFRg39st?=
 =?us-ascii?Q?/89R9lGA8LdDzVAx5G8zIq8rKMy31OOWfJDwnGysrzyfFlwlSS42efzIoF0N?=
 =?us-ascii?Q?7uxW55PjRf3cEfzHG6U1TbLpv3sEcvj8maKreo7kryH7AeLHfBkzsvPGRVul?=
 =?us-ascii?Q?qIZ1dZ69bPCFGRvIprG4mftRLysARmKKYZF1w964Gt95vfy4rJFQGfwcACPC?=
 =?us-ascii?Q?P70sr5NO4E7g+vbZFMkstQng83YAGY1xXHDyIc3A0o6ZMoUERON3HbCSbgwE?=
 =?us-ascii?Q?cY40tj17QOGAw1erqOzSd9fnw/9Ib8HHzxSfNZciXlwNhSIShB5d0B0KNJHI?=
 =?us-ascii?Q?Zrk8lYXzRtQE8alfWNwF1+XcabuB4c/TibnoN4UXEy9zdO0KY0zzp0Z6FLqy?=
 =?us-ascii?Q?ZkjwUvHSIaKC/A4LdPLULVa/O9ziBXd36n2LIorY3gPuP4RLrE8AoQ9tjF5l?=
 =?us-ascii?Q?gVxxFoldm/nx/tHsuxYqVoASf+Zb6puVrPWU5zV842PCtXz4OuRyynM89QJ+?=
 =?us-ascii?Q?Gt0vxGp+pcRv7YwRSRJd+5HxXdvvgJVoRVdk7MgPilisTB0z/OjLuWqbrQZi?=
 =?us-ascii?Q?adhKuFlGswPFe/AY6oTpXHZy0xDkb/9T/b2wieBDcgl4+U/lP1M9rQZHH9D5?=
 =?us-ascii?Q?dOX2jQzq+ost2LkxQV2Br7TrcnTMRuc5rytD4gITHavsd3AQ8MvGONRbatPJ?=
 =?us-ascii?Q?X1zf99AHllJEiv9TBjhqiB4KYHZ2Dc345I1tYhFwyo6Bqa9C56HdGtAUZ+Sl?=
 =?us-ascii?Q?092EaGxBKW3qwJ0TlEMkwYMA5mHlcnu7Y2EK392CJmdZicZIrDp4+YWy4FnG?=
 =?us-ascii?Q?NZLjyAPSEHeEMptRKoHC3StyRsVwPCQ8FY+QMG41i2Jq9vEI/+I9T8vMlsMD?=
 =?us-ascii?Q?MfpBFJaObIYOcAfYKBWDFXnQgYvcnDAadhwe8U+5DzxJ6QGlS/KQTgyzrpT5?=
 =?us-ascii?Q?9bvlaD1lgfVNFKwiz6Er9muKKw1XnnyU4y37SeTwdhSRZsMAkWnf1yZn3f2m?=
 =?us-ascii?Q?NWhHqCVsKbOtcu2DxGXXWPIeUZbagnIXTcZJiZpba1hLeXW5rBWB1vst4jVI?=
 =?us-ascii?Q?Ul1TlXWAJeA9aTQdHK1kKWdFu4SHxdE1lBPrjQyA8pl+SGAFLTXhzmgJi968?=
 =?us-ascii?Q?8d/qZ6h3B5yF55BpOcupUjUy5Iyg33xvcRXK6+A2BAROxex3elxq+dVUYjlb?=
 =?us-ascii?Q?mq92391vRWPWnhMlTke2yiadhxrUKAQ+c8JLSCcz3HCWuibpjYEj1r5Gr5tN?=
 =?us-ascii?Q?pVF6A0L97pDh2BY/7XCCbW0frH9F9w1yNDIVwH/eJ5MIHkFBRmNV0PunLTiI?=
 =?us-ascii?Q?L/mHoUG5MKSLqDKRg/MOmmECbGDO3Bdt9TLhS4F8P5iZmwqahc9MUqWGjYAh?=
 =?us-ascii?Q?vWrSYqg5/fZ8jmDDx+jCKr/oKi4bMaYu6q+POL2J05Jc21bjQrXk41aKARv9?=
 =?us-ascii?Q?rCZQvsYPzjs9mEzLSJs=3D?=
X-Forefront-Antispam-Report: CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:atlrelay1.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 13:08:56.9527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 050ef424-a9a8-4993-5614-08de51dbbea4
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[atlrelay1.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PPF01DF926B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_050904_824164_03DF573E 
X-CRM114-Status: GOOD (  10.52  )
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

Property "fsl,wdt-continue-in-low-power" allows the watchdog to continue
running in low power modes (STOP and DOZE). By default, the watchdog is
suspended in these modes. This property provides the option to keep the
watchdog active during low power states when needed.

Signed-off-by: Nandor Han <nandor.han@gehealthcare.com>
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 34951783a633..bf35d02d113f 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -64,6 +64,12 @@ properties:
       If present, the watchdog device is suspended in WAIT mode
       (Suspend-to-Idle). Only supported on certain devices.
 
+  fsl,wdt-continue-in-low-power:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: |
+      If present, the watchdog device continues to run in low power modes
+      (STOP and DOZE).
+
 required:
   - compatible
   - interrupts
-- 
2.39.5


