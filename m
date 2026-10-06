Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA349CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aH4NM/KZb5+9wYFxa7t/I5gNB3UgntYE6bpMrvXN0Uc=; b=ffdqUEIWhee0kVACyO7fCiIann
	LarkW6Po9d5C5pQIgVbKpKY1481sgTr2dzOW+HYbg22r8r58N8oXCoorC2xT9CAt++u3pIKlaOICU
	LecOrYpFnTOU4L04c3d/1JzO6mQCT3FtWZzZPu5tZdta1OJFldURGp3WAdIxEfaCzA529b3Y70Enh
	E13BcixBFfNOQDIMejpftLWA3UaCoRQ80Rs9zm57pMY9UriMUC9Ad0XqHSbN3pS2s6LSOoxX1p3rE
	8IlimpY+0ffjjHGwaOh2xAzoZrN0Iu+u6/67UW35CDTdcUnwNMa0BkjR2BxVWh7+Xk1X0jEyBTKkb
	PMPdRWqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE57d-00000000qj6-3SVq;
	Tue, 06 Oct 2026 13:22:21 +0000
Received: from mail-francesouthazon11011020.outbound.protection.outlook.com ([40.107.130.20] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE57b-00000000qiG-1zCw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:22:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2y6FS+eS9roZoDZE8efy/tM9dMZVNwIbrH0NNv7qEynRhf4JybbuCUV3dz4HJA6NWGHfKEMEOvAeC/z2PBKmVTcEAXFPt7wma9R1/6Iz4CioTiPJ4BiOc+6X0RA1d63KK4sMZ/JE7FiiMCkaAAHM+JBq/LDmceBUvYm/DsUUEW1mdaAkb9+jRgDAV/RtSa89QJjnDW/2KHN8K5/55NzhbTpfwm+CpNXZZSi86h+L+rjfwJ92ePknF43NGkM4xVie7DWStMNdU5tdmX+82yjFBCsRXlYiBnp2sDJmajuQrvqfCFkbAcI8r5xJki+y0lZr7IbJqjCKqRYCXudnVL6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aH4NM/KZb5+9wYFxa7t/I5gNB3UgntYE6bpMrvXN0Uc=;
 b=gsHVmBE2Syp+pNqa4d0mIRbpfI6xp62ZrIG7PQmwxUqXoV6XTgJsTyfh3ChzPOnLSaqjTzJFeuXpBKeBFrvwqvEPIJFm+S5HtEAfTzVVeyytNLpCMFapoj7PzjCkZRlcdw6kDuKxDxmVPEytc8ZGg50v71TWvVjnKA6/p96Bu+2Z2u3jdrEgu4tDLjCeOI/S+dvU6SBepY4ErlL8FZa9XFxhJYuMz8KRBP5Kaytda3Gfb8AViV9OiEN8MrnHHKvsqZ8PSGj3GEaEEPAntW4HCYZtR8aQ4TU1rBGPr0eJJ3KOB1TJIkXUOZcfzEULETTatzqLEJ8H/WiMchUcd0RBBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aH4NM/KZb5+9wYFxa7t/I5gNB3UgntYE6bpMrvXN0Uc=;
 b=mzDYHaPex6AbxiBt1YdVifvN5+IFco6pZYPWwVpQ7P2fw/7CMGktnUZkDkGRfprDiE5o02lvefyhDFEpb5y5dR7jP/JAM+7bvUPOyYA7KtkgjH2vE5yVDTcH45Db2wyCeGwDpoAwUStf6Q4D6csMhZmIsyP7aDIKEDE8MqXw0SXqDWZpFclbD7tmdoD76KbfAi8FUAiIbqeRmixzSChUg50LyAG8qj7ZidTwKdzg4UBxmRZvMKb9n4ZPvHpfrxA7cna/pY2S69WkYH9TaFnIJ8izwnON7BsGSvRb1ogJRJqjoOVlmUR5r8eQNL62upgOl+WE8WhopMGBSZE81eVkpA==
Received: from AM8P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::8)
 by GVXPR10MB8490.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 13:22:11 +0000
Received: from AM1PEPF000C1AD9.eurprd02.prod.outlook.com
 (2603:10a6:20b:219:cafe::76) by AM8P190CA0003.outlook.office365.com
 (2603:10a6:20b:219::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 13:22:11 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM1PEPF000C1AD9.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 13:22:10 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 15:28:14 +0200
Received: from localhost (10.252.27.219) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 6 Oct
 2026 15:22:10 +0200
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Date: Tue, 6 Oct 2026 15:22:07 +0200
Subject: [PATCH v2] dt-bindings: nvmem: st,stm32-romem: align
 patternProperties regex on nvmem-deprecated-cells.yaml
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261006-stm32-romem-v2-1-f2e156f563c6@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAP71xGoC/yXMTQ5AMBBA4avIrDWpSurnKmJRNWUkRTqIRNxds
 fwW713AGAgZ6uSCgAcxLXOEShOwo5kHFNRHg5JKZ1JqwZvPlQiLRy/Kwjgts0p31kEs1oCOzu/
 WtL957ya027uA+34Avacb828AAAA=
X-Change-ID: 20261006-stm32-romem-87af60196bcf
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Thomas Bourgoin <thomas.bourgoin@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.252.27.219]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000C1AD9:EE_|GVXPR10MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: e787a687-6636-41ea-12f7-08df23acd40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: BEtVUArjBC6DP76NTkMRbWDfuAEBpOC9cSqWbF8UotnkiPcZkipZwS5vuH46hMbdN4wSOrTRVD8UPWY6IWLDOgewScKNJBWtGUGHs3rhCow5LcURgRpoekcyjrOdSUz6YsvOKSETAp9FzglU8aZ/eZRnWQPLs05wvI9Ffk7lYxbLPtpl+cVROlaCGFYawGhnshDdjUHt7/+s6bxJm+NQGB8czh3RNyD7D6q4ESmCQNzFhViGN2ivSDwTsxANTT9/xAolUOHaq2yEZ+dx1iWnndSGmiB0wqCnZ6AoogYxgNf5X94bWo3YNMpYLVHdhE3cw8bScmE8Fl/J9aWDElu28vzqOzsS72VSvohev1P2mpBlc7P/fxURIlh3PmscMpN2L5mJeNCGc72KDDEitRF4CzrJLz0N3FmPk5mfJ/8WtR2nONhcGBIfs86pfoJUzv/+cTqHYsgAko8xDzBVSuWw1KryLrTofd/Hk6C+adgjtFak0JWwRR2dy1vEdoV7cEbrIkPVJw5saTbCqjEZJh+JlwLwl6JAuqs483VhZ80pr9PMCs9XgLlmEnO2Mrby3Ujt9TCqChDhVu0NUIgCfeu1Q5Y1G1OrZN1dJjhAOLb79R35xB+E2iFOCa4oOaAOrBCe7CFrbh81jP58pD0XymNEOlK14DCVLcCSwgzjeOPqGIA=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s4vsK2lAFjnijmirvKO0HLTeVxAWtWna67YRjNzUx0agB6dJYKT/AikdPdL6bPOtuZKzPYzsbyAgoNvXoTkCHcDChYVTJQndRmbrpRLQgIgHRKu6CLIDLNdpGgyTS0ExlWbyR/+j1iti/0VGvyJWkXAdZsuzZ6MeG+HVLqLO9hyYHtq2JzYeYx6p4j5DkQCBGFI3Tsy1MnymOlPditdtZMDFekr8ANQyfANlA5EFkqF3QoLj/EcQFZakkOeeXx55vaSqb47+YL9XXqA+Zk8w4wOVrhRnjMtXkm3YysiTChoPGTM8pGw3eLlG3u6uF40VZj8pDReWcElEdRniCTI6XQhjjzGY98j12E04sPI10x2lABt+IYqg5YlkJy8MIjIuWoTLNICTnahU3O3QCSbFDugjoD6fYJusU9BYTjvND4OSHQfCWIFAao8HZP4y/l5g
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:22:10.7834
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e787a687-6636-41ea-12f7-08df23acd40b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000C1AD9.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8490
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_062219_626071_04A7F0E1 
X-CRM114-Status: UNSURE (   9.71  )
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

The patternProperties key only matched node names of the form
"name@address" ("^.*@[0-9a-f]+$"). It did not match nodes using the
extra unit-address index used to disambiguate cells sharing the same
reg, e.g. "trim-rd-cc1@1e8,4", causing dtbs_check failures such as:

efuse@44000000 (st,stm32mp25-bsec): Unevaluated properties are not
allowed ('trim-rd-cc1@1e8,4', ...)

Align the regex with the one used in nvmem-deprecated-cells.yaml
("@[0-9a-f]+(,[0-7])?$") so both patternProperties definitions apply
to the same set of node names.

Signed-off-by: Thomas Bourgoin <thomas.bourgoin@foss.st.com>
Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
---
Changes in v2:
- Krzysztof's comment:
  - fix commit message, invalid node names, underscores aren't allowed.
  - split series
- Link to v1: https://patch.msgid.link/20260821-ucpd-host-fusb340-v7-2-rfc-v1-7-c5e27cbc0795@foss.st.com
---
 Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
index ab4cdc4e3614..a9988b1d63f5 100644
--- a/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
+++ b/Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml
@@ -31,7 +31,7 @@ properties:
     maxItems: 1
 
 patternProperties:
-  "@[0-9a-f]+$":
+  "@[0-9a-f]+(,[0-7])?$":
     type: object
     $ref: layouts/fixed-cell.yaml
     unevaluatedProperties: false

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261006-stm32-romem-87af60196bcf

Best regards,
--  
Fabrice Gasnier <fabrice.gasnier@foss.st.com>


