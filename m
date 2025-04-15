Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A2EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lpk3tUCx+LmdySb3k6XF7loFPVhvy6rQVkP5PVbSh18=; b=QrUPIDBjDa+L+gYBXRZc7xdBZY
	n7KXiyZEBJKOhHeEaz0ySjh2WcyW3T7njMN/2dkJaecaD/or/fHmfn0uUL3dzopFsEgptfxMHJWlb
	QydSZ3+HBE3jMBWE33pH20IBOgJt/NEwcnMmbfM5FnO/6HVJh4UgtGPWwQTZlgBiM7NJICgloUO+X
	ygsn6B86vg8gskzopeZ+ktPZLq3RDIDQoixpp3Sortru+SWv9jyZ0zrAuMmDMCZwHaO6kmSCjsUH3
	cDpVvHOMlpI83bLFjx90NkgQMNSQD+V03X5/hcvPsJ/dJQDuRsJ788TNpCWa9NGf5eQKnZOeKbh7M
	yIzu7kHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gFT-00000005tRZ-04wK;
	Tue, 15 Apr 2025 13:22:47 +0000
Received: from mail-vi1eur05on2070f.outbound.protection.outlook.com ([2a01:111:f403:2613::70f] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fye-00000005qxP-2Jbl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:05:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsKyDe+O7tLaQzslmtFzwBsMaOeFsOHf/sTyzDx46xS4Y/qG6+RJ4UQzB9ucCIlqvyALic01ycVnk0PsMo8ErvAQ/IuYz62xfrZOxN1joLKZihkoIbGrzSBxyWoIhJquO3NzPF+j7osvgYXeSFKlgwtbIRvlyHiNmrxoPcWYafZzQL9AsWtJdJnGL8h9R12ZGQtMdYKnnE3h7Z98c9llyZoMBLH74A9UOiFKr5sYjUDqnUQq8YqMmcfWkBu4VaxZhFTBBnlyLOfwkAzg6WyxCpNlFgdWMkjX0W4dnh0kiR5usFRFrEmenrGakTLXr0BE9tTEH0tX95MEAaer4pbKUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lpk3tUCx+LmdySb3k6XF7loFPVhvy6rQVkP5PVbSh18=;
 b=mK+S0Fr1Fgrh1JDlWeOrtwjmzGqhMTVjBW6tTSbSm9E9Ca78hGzCCnIzipGB55oUsUs6B6mhjurVeJJ7GUnjIi1D+KoWp10mIFs/Wkm/fJz2dVy40xMog8R0souuSvsSqW2558xS2RwTw6zv4V1TY8vnF+aP14FAG/1pyQQkT0gpcNj0EFtAOi9WgCXNXboB59PFt9H5sZ45H7snlw4xK6e39wgmmfU4XuMGvSLyuThHFQ4NZVmNEbCDjMGNDHFcMICzVWpgQE4sCs/onRRhesGmcSgB7Nppyfnbr/334zHOBsfbKI+kaRNo++Hr/CSEi72TFm4MfTN7FubDutIoeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lpk3tUCx+LmdySb3k6XF7loFPVhvy6rQVkP5PVbSh18=;
 b=f8J+ugpM6OZQQNz9hRKCxrVSfBal5Fo2aF1aUBpfiNKAr4NFxQJTd+D8kPLzM9wjqayHgHCHruPWALoTgEAiaE7/Fp/1xM4V522APw+yByV2VP4NLgO9fjVCvPRVJ4abStse7Law7EuZtay7zsHWM5kuKWUstMWtdBewoNguuNSxKByl8s9lPG9fygf9r2TfbSR9pEO8TDjoY2ywRrkYcSdncZSMjKQmjVX1RALd25idnJpCJHL752kGbMCEXKGVC6Vifrs3AbUtdLe7zZzbqiU/IeEb1T+2BTSOZXFQKiZwPEJU6XSdGcmnIXa3TPG4uhAZ1hEPK0cYha1Vo+tkeA==
Received: from DU7P194CA0007.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::30)
 by AS4P195MB1718.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:515::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 15 Apr
 2025 13:05:10 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::33) by DU7P194CA0007.outlook.office365.com
 (2603:10a6:10:553::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.34 via Frontend Transport; Tue,
 15 Apr 2025 13:05:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Diagnostix.phytec.de (91.26.50.189) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 13:05:10 +0000
Received: from Florix.phytec.de (172.25.0.13) by Diagnostix.phytec.de
 (172.25.0.14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:09 +0200
Received: from lws-haller.phytec.de (172.25.32.139) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Tue, 15 Apr
 2025 15:05:09 +0200
From: Dominik Haller <d.haller@phytec.de>
To: <robh@kernel.org>, <kristo@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>, <m-chawdhry@ti.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<upstream@lists.phytec.de>
Subject: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for PHYTEC AM68x based hardware
Date: Tue, 15 Apr 2025 15:04:56 +0200
Message-ID: <20250415130458.33714-1-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.32.139]
X-ClientProxiedBy: Diagnostix.phytec.de (172.25.0.14) To Florix.phytec.de
 (172.25.0.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|AS4P195MB1718:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b706fa-db8b-430b-4f52-08dd7c1e2731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cp4E9xudZuacjQ90zXh07m4neEV54nFpDI5vk6v3oRz3LyUmYlKi7XNYp1kU?=
 =?us-ascii?Q?b2Pz+q7+SWCc0wTIWNHMaCOR3wY87qP/5DA1qv4x6uTsVqI+tIF2KjX41Coy?=
 =?us-ascii?Q?fbgLgVbl3oY0am4RrutUwv4Jkwg1vKboLxs4QmQcRYMcc+qOC8J4NTQmpC3R?=
 =?us-ascii?Q?DxGZWbU4eOSbOaazkgbx3A8Iw4lncwSigB9Cl3+9WqN7OTRmOSY4BM3ZiSkK?=
 =?us-ascii?Q?72rN+48cgaTMNLAiL2EVAe4paRERO8sPlrkKYAzBoCvjKkh3BseqZU1Qppu5?=
 =?us-ascii?Q?rPyghdmVzdJDz7ebxZ28klsGPnoa+1RcOdKcAHmux5Fily/GiFS3b8UjJrtx?=
 =?us-ascii?Q?kAjhJJa8DxJvLSHnlCuWT87o3rX6N+a9Ky1otQ83p4x3OWP59d8Qr0ckXxsF?=
 =?us-ascii?Q?jeJi+6wGIaMBDd0Q88sM18Ptp+r0KAcXk37foLfFyoylHcmPAu1CAXfGTKpw?=
 =?us-ascii?Q?ac93jsFaK0fbdJ2YRemb9dRjB8ueWF5K0BVeUKbwXPnph3SUsT5IuK0a6Q/U?=
 =?us-ascii?Q?QackkMw6QgjwKR5nF46U1BZ8Yixe9HBG3T3BIhMlJBL9ySoGl3sAdSZzqEAD?=
 =?us-ascii?Q?pTGTbU4FoQLamfjPNDQVBXqypYm+9/wFisji7N+G7VsuXyT/ubUk3MtAueke?=
 =?us-ascii?Q?qGijIE8kswQQ3ni+mSvZaszLgPmVJZneao7267ogi78RSk1dRX1DN9qJTSPo?=
 =?us-ascii?Q?Bb63QEVwzIc1nuAiTRaWKuUsjequK/08iVRND+Y8lIBpm2PzPxKZ6FYMC9Dj?=
 =?us-ascii?Q?mVDqcceKjSlZmZqvxfvY3jyanbUHKhdD43YKo3HlqMYP2RmIWdmMoV0hq44H?=
 =?us-ascii?Q?vEYfCgdCefkFL2OMxYpeV2v2mlyuL6gq36HwRmT/1okxBqEmPIi9VrStS5w7?=
 =?us-ascii?Q?bkggvG4JM7l/h3uH/l9V/f/jgQwrddcdo0TNrC6HKAL67aQIcQqgQhu0OuhJ?=
 =?us-ascii?Q?PlTn/F/dpmKGZ2EUQVBDng4wEQ4RBpmb6k+Y//WwnVlzxY+OyWtjtmDkItkA?=
 =?us-ascii?Q?c2xQTOw8p5D0ZogtYug+5zjweph8mednvT0NPpVNP5UniLW+750wbYsF69cY?=
 =?us-ascii?Q?yQoP/EeJ9lrIun3p4CpRCMOtnzgQLm7PQTU5uEUeHI0ekyD58nGw8+aPYbic?=
 =?us-ascii?Q?jUjeGNTR0zwWv6tGKdszNXKl5RUknGtlt4/KoPfc5JT1967uqZPBiTrOU8TV?=
 =?us-ascii?Q?IC/5gUlcDSSuCeSvK66HJ9ThrIK25GRFWn/Go2KpqHxzxvYoXtvuguWwtq01?=
 =?us-ascii?Q?zxtm4tTFMXimsmiYZzun6yHAFr0tO5px0b2GlITpS03B8xyDsrvZsG95BCZ/?=
 =?us-ascii?Q?AH+YYdhd++Fj1VGvqXFpq2mzoOlbnTQBZdAK2oqJAlr6f1MCn/MJ1u7QMrXP?=
 =?us-ascii?Q?sIocNyp01UeinCL0shx9PR26/7ocEZo3oVD9JlaRo5RKU48t7/Z41LVSzZh/?=
 =?us-ascii?Q?jCchxQKj8VZHlGgqX1NtNeAFMR7HagVHxtA2ytlEFj2CYUdDdK1lI31To/6G?=
 =?us-ascii?Q?LGG7m2US35tySGyE3W+jc4EFoNy1+DkSAUb9?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:Diagnostix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:05:10.4103
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b706fa-db8b-430b-4f52-08dd7c1e2731
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Diagnostix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P195MB1718
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_060524_889962_636D0BF6 
X-CRM114-Status: UNSURE (   8.40  )
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

Add devicetree bindings for the AM68x based phyCORE-AM68x/TDA4x SoM
and the phyBOARD-Izar carrier board.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---

Notes:
    Changes in v2:
    - no changes

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 18f155cd06c8..a03fdb9c0482 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -135,6 +135,8 @@ properties:
       - description: K3 J721s2 SoC
         items:
           - enum:
+              - phytec,am68-phyboard-izar
+              - phytec,am68-phycore-som
               - ti,am68-sk
               - ti,j721s2-evm
           - const: ti,j721s2
-- 
2.43.0


