Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 007AFCD5BA6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxmGCOlmasP56wKB2q15eI4+6JzGKMRZwvrBRS+WKQs=; b=wXWir7fxVwNdM+YtinH9rcgtBK
	ZYrqfcWflfza/1V1TuYVx3+6VDNXEwlQ18fN2vNy6hfZU4V40iy0VrGu4cfeHlQ1zdENeeipowf46
	oFuovn/bfnq4b6HhrBk60+hkGpJaPNL9gg0PhJiB8A4/xcrhB7oRMcbqRfEaz77WvF9eqNCov9hWc
	6mQmt4Brx4CW8fj4PU/OpnPwozOAv6/CKTx8FUp8bJZHXnfs1ju8YgQbSb/W3k7M1jbLCupakoTHP
	Uw4QZArRyu84zq0B+MxnOsaAAPfuIYgjRsWcbErn29z5ChqfW+mLpd5fWR1zrhlwBhICIr1I0MfeD
	7rLQ+GmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfXJ-00000004Uy2-2VyY;
	Wed, 20 May 2026 11:56:29 +0000
Received: from mail-westcentralusazon11010016.outbound.protection.outlook.com ([40.93.198.16] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfX7-00000004UuE-43SQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:56:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kgyZzxx47OilxKq/Q+tCGpYPgwcJXoW/xyCVUhrxgorqLmwyJNn8rRvXl7dW/KJ50G338pxs8MBIP/oCFCmqYDGRT359HgprCOr9D7XmDV23GwdXPTQ2fCDraHpKVswCgjLa5m+xRSib3VvG37lpQFwrf0iRBwDkpm7ENu4h6F0RkOWKJu+/S1/by3tAajGU+5NXChNxFgcie+1CRTS3/t4ukl84WJ77cmLMluMxm1h5jU74JBAGtKWTOWd4O566p5xKSv1vA3j5hQognyzDMGLO+DFTvYp9kl2cHXrAZgJkoFSOkcbs3/XFEbaJqZGrb+87bg2pHtgWAr7FROg1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxmGCOlmasP56wKB2q15eI4+6JzGKMRZwvrBRS+WKQs=;
 b=r0nxTuFWzCt49nXUlSziKeD5SKy90kksncxbYv9x5H5DA2omhef0kKvWuAcvo8FtYcD5vo3u4ctkwYLG2WqaAtm60c3ypN3Nvbz6j8kqO8se8SHo0nz7NkywkPS9Ch9eCmQwdDLr6RdRt5xFCJ0o5nw/vPufTIzyRRcbrW7ncqUztwj7NLsMKbicKD3DMhyxDLyPknOlrMtMPE3JH6lmdoi6BlNJV67cQbt9vZdhKEZzcQy/z2V3uBlbAdeLlv5NlF0KhtjjpcT5QQ1h+tECDTP1J4h/Ie1fupevFLjH0J1YP3Exx4vkvH9kgmYP5oPkGUhn0RJsTgdQ3co1uj2Xgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxmGCOlmasP56wKB2q15eI4+6JzGKMRZwvrBRS+WKQs=;
 b=rO+uEYdHWAYcZ18GuWdKjOdpASVcKiIWcLm5tBJr5mV5iFslUxk+AV6SWZcsbPIufsvxnzNSXLIMtGDW6ZWNCaPznbTlIZc1z+1IZEsbHRhdkEoSWa4xtWQHhj4UNnk1eCVqRD2zNWddyQoOIPm7IxW2gVjzrF/1FwsenHlj8AM=
Received: from MN0P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::10)
 by CO1PR10MB4594.namprd10.prod.outlook.com (2603:10b6:303:9a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 11:56:13 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::87) by MN0P222CA0009.outlook.office365.com
 (2603:10b6:208:531::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 11:56:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 11:56:13 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:12 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 20 May
 2026 06:56:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 20 May 2026 06:56:12 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64KBu3SW1386033;
	Wed, 20 May 2026 06:56:08 -0500
From: Moteen Shah <m-shah@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
	<nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>, <gehariprasath@ti.com>,
	<y-abhilashchandra@ti.com>, <m-shah@ti.com>
Subject: [PATCH v5 1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
Date: Wed, 20 May 2026 17:26:02 +0530
Message-ID: <20260520115603.2662930-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520115603.2662930-1-m-shah@ti.com>
References: <20260520115603.2662930-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CO1PR10MB4594:EE_
X-MS-Office365-Filtering-Correlation-Id: 90c0c6fe-61f0-44cf-139a-08deb666ca62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003|3023799007|5023799004;
X-Microsoft-Antispam-Message-Info: GO04RLbQzhMKRLR/aLJLaBZGaoMsH1K1aWRmlWQ/a1a+88drkvghiQiZ92aB3jGxQSWqczC6NOI01kF14/uiWhuLb7aQnreq+++/5Nt4yWQi/S3SdD6JOo44+VH79p9pO4mnvHO7OGWta96NZ8IhVrssXQBvpoeZXCwfIURwf4uvnGDQX3n4rPXBrRnbRO/LAqVcXyNQMMa3nSCXYoh5g1EzZeyra3F0lHo70jGaA2Xe1F81NbFMmacRtJDmL3cRPMx9d7LhuvqfFM8rsNPm4/soHA6WDTmJeDaIIqVdphiKAYVtvocDRk3MLJMIBfQm9n/1isdF1vrMaQ0DuzoAi0t85BvrAoD9BFgR88c//aW/77oLFjLNAm8Nojmbw6W7nffms9LY9yQsRzxYE4TUZwczeDCA9qEES0CMgEldwNhj4WboWPpS6L7YXcYKOtcGYuMQ3jD+lEQCMhB7+huAKGnMULq+THR5TtpUB8rNHvCMnj3xzj9CW6TlYekmv1YrchJr3xcppsJdJeKF+egZCEGHXDzgCh0DC+fpy3XT9wVkpmFqWL5sUogYy6pJ0tFq35JrXiUuh/hq1pTcGZf3X+IzqCLWTvnTdfkhum7uYXllq/9D/p/a75VIDZNQsxNxvFNsvp3Api8gsWHwlSP0DqpcvLwTu5xAYQ8MoyiDFIgPcz1lqjCeJ8IdYQcb1UdxckBSeJpBhdo1GqSVuG0ntM4b6wxfsn70YibRFQytzVE=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003)(3023799007)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 1FKttyVihoifGXhi9ePTJqFkNUkKNUfZReKgFsDBTLH/B13MqoKswzqnS70jKNdNjW42Du+n3KpxkshTe+izUom+2SCx4KJTqgHk3W4Zu6Gd9brBzzpe1OFpryN7b0GyraiZURvqRXMsgpmmdGfJ0C8PiZY8tHWq6GYjv8g6QlZ+gEX2FBs4XK0h7V1fDW0BxXO5qNexj1pJOxtjus3a+JjSAb+rL1HmqPfGdQw8obk0BeZaGbB1+S7soBjVBWAri0o0gOTxu4vLEZ/g0O8LrVsPqxqZ/te6WjNkWx6i6gq1m9WrAzjw7itp0TWrn4k37x2icFRYwImE1DtxJ5G9e3V+JymN9SQFHu9wydjY8mFV+np6PVY/P0faWHMqhsjYRC1gLFMNRX8sCfw43lCj7H0r8+ASjIBbqlXQI2S4vAY4VhojGf4eJQqEGADuFCAp
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 11:56:13.0300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c0c6fe-61f0-44cf-139a-08deb666ca62
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4594
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_045618_020773_5DEF009E 
X-CRM114-Status: UNSURE (   9.75  )
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

Add ti,j721s2-audio-refclk as a supported compatible string in the
ti,am62-audio-refclk binding. J721S2 uses the same audio reference
clock IP block first introduced on AM62. Per writing-bindings
guidelines, the J721S2-specific compatible is added as the primary
string with ti,am62-audio-refclk as the fallback.

Also extend the ti,j721e-system-controller clock-controller@ child
pattern to accept audio-refclk schemas alongside ehrpwm-tbclk via a
oneOf constraint.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../devicetree/bindings/clock/ti,am62-audio-refclk.yaml   | 8 ++++++--
 .../bindings/soc/ti/ti,j721e-system-controller.yaml       | 6 ++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
index b2e40bd39a3a..6c8fb0793070 100644
--- a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -11,8 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: ti,am62-audio-refclk
+    oneOf:
+      - items:
+          - const: ti,am62-audio-refclk
+      - items:
+          - const: ti,j721s2-audio-refclk
+          - const: ti,am62-audio-refclk
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279..364be49f8c7c 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -53,9 +53,11 @@ patternProperties:
 
   "^clock-controller@[0-9a-f]+$":
     type: object
-    $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
+    oneOf:
+      - $ref: /schemas/clock/ti,am62-audio-refclk.yaml#
+      - $ref: /schemas/clock/ti,am654-ehrpwm-tbclk.yaml#
     description:
-      Clock provider for TI EHRPWM nodes.
+      Clock provider for TI EHRPWM or Audio Reference Clock nodes.
 
   "phy@[0-9a-f]+$":
     type: object
-- 
2.34.1


