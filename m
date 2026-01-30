Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B07E6BF10
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7dpP6i5ssvfQ44o7l2AgeSlVgDYIehTIhPC6kJVcqo=; b=Cv0+piTboNTCvMbUzWIxSPfjX+
	it6J/4FH2HaitcIxlmpA4JY+Gf1adXHE2Am2vgF956p3F1i4Ezz6osEW+ITem9e7hG8KG7Havcl8G
	F/r/UxnGBIETD5C2MbLgh3ghNQ/buOw4TsxdQeFbO/ufXJ5QpptX+zNnDBLkIGNsGLv5eQEuSuvfX
	xMMpHR0YVdNevWmEI1dmBzzwbpAHdeRdizAuOD2G3nTC+c874f+1V9ziD7tuW7XUuLi2c2ixYamN9
	UflksmnJ19gfp9rSORAIb5QQpi4XPzCb1JBLrig7e/+BolQhSGknDa+f24zyoqwpQgmsXGOQ/sVr7
	bdJ7mTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvai-00000001yCM-2Euj;
	Fri, 30 Jan 2026 20:59:44 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvaf-00000001yA1-2sSA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:59:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cB9V1bjTmDeqfG05Gfw9xujfryWvS2ksWG1HfdqgFNrOaAaMHIpgvwwQp9C/lImxki11+87++mzoEmlZEdsTYkkPP35oLMigWw2MgAt6A8nAnSzbuwln910/gzMRXBS7N6rJaFLcwplA6bwJpzc8mpfjWjQQ0NDuNvul6GRWfwEG3QrrAYx3w05UpQ/n87gtaEbujWU9+dn77AXNma2JzqS4yQfA4JRQxX5ApZ5BKwBQLQ4iW7Coso+dy5QO3/f83/+/EFZEJWrHxNMhVsX5x2T+MzKrVjw1JmWqADPDtxFvnU0dvwHTHs8Z62vqe2uiK2ty05RwvMOFBoKNYMbFZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7dpP6i5ssvfQ44o7l2AgeSlVgDYIehTIhPC6kJVcqo=;
 b=gsBPrpIQnWGlWmYpVhcFmlOQLC3Ix+HOJ4BXELzLTPYogbfDIUKZBsdIL/p7bNTDj2oWmYkJYKRje/zIIKC/8r2Au/AB+B9lrkhpRYeliM3IBzEPgOK4D6IoGFlyeLvi77FINSik92zhaWolL9hVA+KZvU5aRrvRqM0bciJZUATkm2uu7DRs6CbIv2+Je6XHZljXxbhjzEIHX17dSH5NUgOBiPbn6WNlCz7PlnIL5erMkL7SEoEBjD7nd8Sz1ui/BISPLC2ubA5zlLfEc0pEP4Zxh6SiJBOZ6OorNADCpsCNRWaQxKwEcl+ky7JXOxcU0a42/nvaK2rNeLJWXAnEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=gmail.com smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7dpP6i5ssvfQ44o7l2AgeSlVgDYIehTIhPC6kJVcqo=;
 b=mE5ztpzj2CJ7VLAD6fteUBS7wP53H6aagEBrJD2vmkX/zheU3dMeJbcX9FfHHqX/EdcBQYP8kjxUqhRjX78D4Pq7kd2GyG+JGimKendA+aXLw5YrjZzeYiox8UueR1S1mUHMgtw5WHwCWGYDm/DsabMVD8eX3ZbIzqBHrDRRGX8RtTZYutsRcuC1q2Q7pIvD6UTwLhV3CDj7P6kPFlOYFNiudx1Tt/TrkxpqP5jMcpH+yrNBvJU7qn4afILwfXW+zTQ17Q88ylBR3H0dfsT3tbSMke+krNGRw3zdBocig0H3U6jgJ14ezp1QQT9lstLYdwWoKN4pMgv7U2CrOVulmA==
Received: from DB8PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:10:110::35)
 by PAXP195MB1344.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 20:59:35 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::e8) by DB8PR04CA0025.outlook.office365.com
 (2603:10a6:10:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 20:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 30 Jan 2026 20:59:35 +0000
Received: from lws-haller-privat.phytec.de (172.25.39.212) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Fri, 30 Jan
 2026 21:59:30 +0100
From: Dominik Haller <d.haller@phytec.de>
To: <adrien.grassein@gmail.com>, <jernej.skrabec@gmail.com>, <onas@kwiboo.se>,
	<Laurent.pinchart@ideasonboard.com>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <robh@kernel.org>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	"Robert Foss" <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <upstream@lists.phytec.de>, "Dominik
 Haller" <d.haller@phytec.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/6] dt-bindings: display: bridge: lt8912b: Drop reset gpio requirement
Date: Fri, 30 Jan 2026 12:58:15 -0800
Message-ID: <20260130205820.83189-6-d.haller@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260130205820.83189-1-d.haller@phytec.de>
References: <20260130205820.83189-1-d.haller@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.212]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E2:EE_|PAXP195MB1344:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f777489-271b-4f44-a153-08de6042798e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0KfECOlxvlp73ZVTC4c6hW5/lVFeg/OPTXG893cAFL9tWTts2CKwm2ikWGyX?=
 =?us-ascii?Q?PRnDQdKxpKDnzaADoVIvsORCnEpZvnQmUEh/fcTPkwfvzs0J3a04zWYdzMyI?=
 =?us-ascii?Q?N06wr3wYkkEr2XULnAcXb1TOppAt8vQSu18pke0G0NwWMv1i5E/5ZPBWIOjx?=
 =?us-ascii?Q?m55Ognbq2Pg0vbjPQXnvY9U45cWW2PoZNiMJosY/03KWdRhQfhNJOSclfdUn?=
 =?us-ascii?Q?EFklxA3hpKdFL52oSjet8UOC4YwqafOL9P7glb9m5R0nTxjI7BeE8UNNtcLu?=
 =?us-ascii?Q?h9c8dk6cw1/4fVdrYMnetCEAlD1l9oae5/G6AONnsn+thGV/A7XZSyBzGPSY?=
 =?us-ascii?Q?SLMlXUY9zX7PnOYEK0caSx70mX4NHmTc0inZFOr4Janm8umb5KMz0nGCZeBI?=
 =?us-ascii?Q?PQXp5K1wLhcTgnsLgcPuBeTjBnZtHqcjlKG4TSzbLsflFRrbTc8cO6LMDD7w?=
 =?us-ascii?Q?un/fN8JBL/vZmP5dYUu13gZJut5VeFSkCH5NEyBtclDbmKsw/wk9BULvNN/E?=
 =?us-ascii?Q?b74072uLD6l7tdra2i6tKgCBmUzi2lQ5RL93d3ia/6t4xIyir4pxwjYWdfdE?=
 =?us-ascii?Q?2NgmObZHGojGjcgihMr0ae79f9FdDvZdhi0tMd1bvg+FjA+iwWsjYktsBNJt?=
 =?us-ascii?Q?+rt2Urs8CdtX1NkboinZ8wGOx+7yoIJ5sKrP8OGxihButc2jOr2VH00+Omge?=
 =?us-ascii?Q?whnurrYUxf38FVVNRA6rwTQAAjCXRZOWwziuS7ruUuMNvcm9O7nLV+MqvQGe?=
 =?us-ascii?Q?6He5vEFfbZkz3iZGntHamRuyehmNQjLYdi2QufOAUq2/+vClPLlVV2/jpySU?=
 =?us-ascii?Q?D2AaBUskS336FiJmNg6iKrXRyC2tHwQ0m8+JzqDLa0xaBWI3KO7oLykBWupE?=
 =?us-ascii?Q?ylTtwU6W2eRu7se+iaaKgkkaX92tlYBf7HFdv+yImXNXP/jn6RIfnAfzsAP3?=
 =?us-ascii?Q?4nwiTPvgeNQ16hcTqAxBmtc88ZwZCxivLq1z+WxwDZkxTqSF8h764gHmPLav?=
 =?us-ascii?Q?w9TIlf/6rIpTm0GdFCaQKuJkSdnwARz9MivR2dEyTEqcc3kXBp8y7czfgKhA?=
 =?us-ascii?Q?uwe4WKV0ayoR3OcbxhKgJG9p8HmyFHyamoYDYyIAW+3EoDKWye+D9RVKZY8X?=
 =?us-ascii?Q?QyOMZjOao2XJllOshE4M/KZ5jd1te9o8H7qrKUVc+6H796/KCiAJm4lSZ7Qi?=
 =?us-ascii?Q?y7AOtshqoVr4xtREpBbK89z906JBBYsdAwhmzhcLvZpHSWGNQu5Rmr2Vn1hf?=
 =?us-ascii?Q?IJ531aStreDEuVUPuid1/w/cnVkTYdweCkaDqNpOrJut6qcp6YnJo9ekR2gB?=
 =?us-ascii?Q?f+x5XNtp2x+u5QjCX5RV5+cxoBS/m+533dNaQvUNVppGLIKmmD1NqskhDsGq?=
 =?us-ascii?Q?nP7BdrlqDpYjVFQBrsXfCwtjuErjHQCOuFWZzsJ+AKEUN22B3tV0pIw/5PC7?=
 =?us-ascii?Q?XRzTeFrV7CZN6UAbe3IKQFsGj2D4pRhCYGoc8AR+2uC1tFcaLU+8OElICtZl?=
 =?us-ascii?Q?sYliRZIgY8EJTK2++NAXyEcteqAETwERZIPKvTkxaVsO7Fn/vp0eOWCT2+Tz?=
 =?us-ascii?Q?Qk6O4MMpeYOh/m8C2haDC5vTq4Yx0Pxc2SMj7AwwBbApsk9RPhPdbvGSPCI3?=
 =?us-ascii?Q?zkbsuv6+LJ68FyBwQfmc36piAKgjXS0nVj6idNybbtYqMPWC14k2Gsr21pYL?=
 =?us-ascii?Q?EIxnINGRpSKiYSZchPMKiBuZivs=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: oha7x6bevYlFtTKbECAVatgXrn6evn2LOPBPMTuhKutgmJc+cad6jXpb8Ik8JDlUIIAZ8k6DUtUGNVgulfRJuXjDv6sQLZKj1AmL9mMciDQxFHZLjv/2tg3CC2w6r60Xlopq/b1vJnGfXUA1CzescRQPklHEsjEuErlLX8gpxtNbfeLVT0mU6BEeRFOwRDJJovgIFZn3UyIoQTPiZ7dRiRpQgBYDbj9ajveWMc8n2hUnN/hSZQAS10ML38iJVTJv/j3lpx5OAmMkw7tsAe+vp6/ojGTRLaME9n+u5eivABj7qrycA6bkxizRTpb5Nf842KEXYJ+M8ahEUBYbZ1WgkKIcBPIDHnNCsnb28OQyeWjQp8nBCb/AqatyZp4BFxi0bVLVO3RNX93JokDXsAUNQ0zq80fADA5E4xJ2QbJxY2Zldbz14VHmc8T7ZYa1MjSg
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 20:59:35.6000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f777489-271b-4f44-a153-08de6042798e
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP195MB1344
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_125941_726424_11818242 
X-CRM114-Status: UNSURE (   9.85  )
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

Drop the gpio reset from the list of required properties. The bridge works
fine with a reset not managed by Linux. In the driver itself the gpio is
already flagged as optional.

Signed-off-by: Dominik Haller <d.haller@phytec.de>
---
 .../devicetree/bindings/display/bridge/lontium,lt8912b.yaml      | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
index 2cef25215798..63f000ebc9c5 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -79,7 +79,6 @@ properties:
 required:
   - compatible
   - reg
-  - reset-gpios
   - ports
 
 additionalProperties: false
-- 
2.43.0


