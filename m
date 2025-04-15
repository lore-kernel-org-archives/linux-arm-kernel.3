Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B203C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=; b=OzQO2L3dTLsMAy0Pp/22tMjYhh
	kenD7Hs9OU0yR1CMMuo83m+YIo4St6jbi4GruTayWXcwovwQ+CHUjnARKBVDy3KoqbSXmhQdEcCES
	BsfuguobcTOMrLT2q8hhReYnUD0SJbC3JqtixSih7Wbdup6WuBwpB1gOOr5Zs36W+7T7VtANdv266
	PlqmTI0oe63DWu2pRMw6uBYvkgP5jTxdqEQPJMdn+P8fTKmbzvEkBppYu776qJA2+MsqHYonmnpGl
	/664bbOSPZc7+v/H6/Ni0HTnbW94CFEH1Ki9U3hAt/F0mgVtHe0kJgpoIHyNFM2l1J/l5AnEdkIZD
	XYGdJrtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4alg-00000004of1-1dG2;
	Tue, 15 Apr 2025 07:31:40 +0000
Received: from mail-sg2apc01on2071b.outbound.protection.outlook.com ([2a01:111:f403:200f::71b] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ahk-00000004nbv-3lbN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 07:27:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w4mLSMVDLc1muV3DFnR2IIEeYFCQJjHm151DQve8E2mvxyAJiKAqzGCMXfuhK1M6BnyUoppXeBlNMJN41xs1X72MBhX7JJY9KsEXxK85p7GmoQYMhsHv/X6WwOhrhY5+ZFGwmjGwou5nG5j0esUTekE08PXiUM6nErB21SXegVgTYKIHZUnisSxVXL071eMuAz7+vK2VB13mknxym0ODSTeEIS5V7WiIUeD2jSy8HhWeuvYw078ZSdVmvzT/LjuJPDzsfh/UR04FIkELbBZj7W5ilpXecshf7wVKhfKMaSNAOTdk7e+lGBvl51eDs0/5TrRtgqGpx1IWju32oAHvjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdPnR+qQTKK1uT4ot4BQhrMALpF3oO12PDINoZXQpt4=;
 b=q3ZgcKsANycgp1YJ3IPiMMUTQ99qMSWZFi7lDibK0iJCGDNDxNWZsP4oh2RtMnNg1p14GoIYHsB/3Ud/XPNxLUxosQSH3hS9DiFtdWzDVWDEJWDgUoiJ2Dj9uA3Hm+QWQ44SpX/elLLjtD0UPPXioXjYLzZBGVr2HEOi7lIWuBhMAsMU1SvaQJdGLvp/PSo+awiQi2PYSLfoF+z0gOlBcQrmxLPhL19eCOr0oO4FkgYG0AoppuzDA6jGmKU4QQTmj79uKWtnc+g6VFThT49/hAB90IwyskHwEzMD1Hup/2Xff2DwSs9tQsMxMFHX6XJ8KRGd6mpb6iAF4Bygf3eytA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCPR01CA0178.jpnprd01.prod.outlook.com (2603:1096:400:2b2::19)
 by TY0PR06MB6883.apcprd06.prod.outlook.com (2603:1096:405:15::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 07:27:26 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:400:2b2:cafe::a6) by TYCPR01CA0178.outlook.office365.com
 (2603:1096:400:2b2::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Tue,
 15 Apr 2025 07:27:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8655.12 via Frontend Transport; Tue, 15 Apr 2025 07:27:26 +0000
Received: from localhost.localdomain (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8C7D64160CA4;
	Tue, 15 Apr 2025 15:27:24 +0800 (CST)
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	jassisinghbrar@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	maz@kernel.org,
	kajetan.puchalski@arm.com,
	Peter Chen <peter.chen@cixtech.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Fugang Duan <fugang.duan@cixtech.com>
Subject: [PATCH v6 02/10] dt-bindings: arm: add CIX P1 (SKY1) SoC
Date: Tue, 15 Apr 2025 15:27:16 +0800
Message-Id: <20250415072724.3565533-3-peter.chen@cixtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415072724.3565533-1-peter.chen@cixtech.com>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TY0PR06MB6883:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 185a4ae4-a7ac-463d-50ae-08dd7beef91e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wr1NtdZI7SQHzMYHt6PIRz373LAlN1+TmBRk+h8ZOhmRJ6NSDVMGW9wvK3fv?=
 =?us-ascii?Q?2NB+beuzn8GZ2n5Lqas0pnjTkbef5t1TO5+INGS1+lizRuQuKMhTAuelCLP2?=
 =?us-ascii?Q?/vqcFAnH9bJcLz8yfKveEftDTtMoKmLT1rtPzHop4x27tqAf/6b7e7OWUko6?=
 =?us-ascii?Q?d0bZmsKaz6/BEbb6jgIxvV5yoFuLyW/btk59jIuHFnv6lBSyQ5sacZH0DGZA?=
 =?us-ascii?Q?kDfoXNNhYZXQiLNxwR0aeK3lM0kFmZvgAsbqOc9e9uBO+U2N6/AYc5Wd9dVw?=
 =?us-ascii?Q?5WUuE2NNTJrIsKtUkhR28liSPIge/vN4D3Vm2lpwMDP/XIPYwTVg+vJ+gNZp?=
 =?us-ascii?Q?UPdIKkEWqdibDGQCdO3B2UT91vkRyxdELHlFrePSKULim0N0g3RsR1DNFGXT?=
 =?us-ascii?Q?FkN8qxrq3d8fRHwIt3/dR6BvGq8mh5BUVx811oo7aKW+586cCDnV4HOcd0pn?=
 =?us-ascii?Q?bGHBqOHNV7kKv4bfPU+F5qGFAg3X+KKIUZR2lHYzm29tLqyk4c2eiGUsPtjP?=
 =?us-ascii?Q?cNebDAvUxjyYU6BHYzjKL4x0wn2jYL4FZEltXHyPYofpY+ILg2em/D3D9luC?=
 =?us-ascii?Q?aGAo+Qii89dwmxN+9b492Sd69q3EMhvH8+/K0Tqzj6YtDmhlZuRiQbOaMcIw?=
 =?us-ascii?Q?W+/vv5v2/FIMIw0dR1YqHSMoWfyKMOgGXUqqzJzfLAB6w5TLi3gQNYDDNEOJ?=
 =?us-ascii?Q?ckgSHgHKbYn7goyyDsGL7Gmuu2eo5Gel90TdoRs1NVvWNlfBbxFnR/+3EQM5?=
 =?us-ascii?Q?ONzcRda6tfn5OIjr1FBnPAIHxcd8eAMpQUO8ln8f8vnYCdfWzzR4ofQew01p?=
 =?us-ascii?Q?iOqB+Sa+1XRV1Y10ZWPE/FiuVpsW1R0g5fg7jJ4eTTcAdbTvx3daB1S/nO/y?=
 =?us-ascii?Q?VRu1ctaXx29wMqj3eYhXMg2h69Imh2asFDV00JYOaUh9bgx5/By8tYTNSASr?=
 =?us-ascii?Q?0Q01oz4sr6pErZc5EUnycM1kY7ZZrkKP0FCFGLji9JRj25gJ+PEnebW+qk1f?=
 =?us-ascii?Q?Q6k3/aiHBUTPEo+rRlei/MUCI9QKqywmf9a+PamwzbyUUr1eiQylnpRleCSB?=
 =?us-ascii?Q?0vP+iLmyrFAHrsxf/q7KbvN9jyVt3vpLRIUWXC1czhRqMZF/Y9bItUy1X0tu?=
 =?us-ascii?Q?lRZWoLtbRTvl5293Jf8AGQMU6jCW1avVHXoXfSaIzVpBADH5wqWpthdwNzwV?=
 =?us-ascii?Q?Ax5bpd5QMXnNPjmWLncdJY6/rePhUb5blN7Umf01nRArd7hJD9XSBeGMauNm?=
 =?us-ascii?Q?mc3pb04cbZvddYp9otxZZRPoJnMFHP8qugFT23PvJY8JlFZ+14YE3OvHOuXN?=
 =?us-ascii?Q?d0xZKGs5Pkoh/Bd98qvRnBazGZYG3CBfVOW4sv0TVwT5z9FK39u49k602/e3?=
 =?us-ascii?Q?go0tLS6iEnt5qnEo1GN9bGLAUVgeZkJXJyiGOdY91nUI8awLQMH2y7SmOGX0?=
 =?us-ascii?Q?K18M+Ss2g3+aUtQ2FnTNq9CAn6BnApVpOQaXkyu6+RYyecGN6XCyuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 07:27:26.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 185a4ae4-a7ac-463d-50ae-08dd7beef91e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB6883
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002736_935431_79D5C90C 
X-CRM114-Status: GOOD (  10.50  )
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

Add device tree bindings for CIX P1 (Internal name sky1) Arm SoC,
it consists several SoC models like CP8180, CD8180, etc.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Fugang Duan <fugang.duan@cixtech.com>
Signed-off-by: Peter Chen <peter.chen@cixtech.com>
---
 .../devicetree/bindings/arm/cix.yaml          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/cix.yaml

diff --git a/Documentation/devicetree/bindings/arm/cix.yaml b/Documentation/devicetree/bindings/arm/cix.yaml
new file mode 100644
index 000000000000..114dab4bc4d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/cix.yaml
@@ -0,0 +1,26 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/cix.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CIX platforms
+
+maintainers:
+  - Peter Chen <peter.chen@cixtech.com>
+  - Fugang Duan <fugang.duan@cixtech.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Radxa Orion O6
+        items:
+          - const: radxa,orion-o6
+          - const: cix,sky1
+
+additionalProperties: true
+
+...
-- 
2.25.1


