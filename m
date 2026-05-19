Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06407CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FcHvjuC+IclZbY+mD0gMtK3eSC88AQ/2hR9toNCXVP4=; b=Au4wrsU8dg7lyRkKq3UAwAEGEl
	Y4H6wLgDK7BWj/Idr1RJEiy3mguQjHedW0CIkPax2flw7un7+Pqc/8e4g49l/bKtqp7CoSSRR4dzA
	JpEMvCNl7yDGo1byvP/C6S5pK5KVn8lYjGwvS0rVYB0mDpmB/7qWLMhiRFcmZ5Xc5AkiUe+r4z1kx
	9ApbpF9O4oUVVmgKYfWCsUS1tixEZga/o0SdSowkHJ0YsfOMrV5xAasohrbVfZgTaA85Yk/ewDV2O
	QLJ45pXXtPceQYIJKtUTzABnQXTCMijkfXnkPoTp76iJlmNpc5HtYlc9GxbxHKFuFbF3iT0989ZWt
	eVTbxdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLfP-00000001sPI-1qXq;
	Tue, 19 May 2026 14:43:31 +0000
Received: from mail-northeuropeazon11011049.outbound.protection.outlook.com ([52.101.65.49] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLfM-00000001sFC-1GiB;
	Tue, 19 May 2026 14:43:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CearO++omXUvRJnT9yPB8RJPdWi/1Yp8D/yAHy9B4SPaaHfrNORfNH3D77yvFE91Ou6fWZEMaZf3FHmRZq2u52logQE9IK5kCA3HPU+K8iGKsBVAQvH6C1PGTGwULPMdp1x7FS7AgNO0WFOCVVEiTsC0F+X3LKd9dA4TYmenV0DNjp21xOFjvN9mbKlcRzCzhq2tVNRtdXc0p6XUPl+tbjQi8uwD8sPWQ9cjXa2M3//QlNuvFnxsHF/mDEgUQvaNmr/hKwYTLuRAAVAMM14OIPRMXTlOZ7DUiQSUeUZedmPa/lr5Czcz9FVKwEYPHyT9XdjIR/02YEl1H+9+JV0btg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcHvjuC+IclZbY+mD0gMtK3eSC88AQ/2hR9toNCXVP4=;
 b=lrtcOQQz8hqXEl5qhdsiWprp4i6Wd3J2JVdqTPWX2bo+IApDCFjHirKzq8q+6Zcm1ofFs8P2syBEUDgK1bTMTPT7dRgkkNGS16gAvt6EmkolCgIVitpTC0iOHwzdmDSWKx4FdGt2HKbmO7sn9zZhxK0EaL+i9kS2Q7azUxw66OwdkfJG+ryGOFVDJa6NTuB1/D21jTvp8d3AHxoxMwGvkhB4AnEh+vjqTzygwMh4nhFQVz+QGg8K2HmWXjEXoTJxAgo4/rtKhOP2The+7KGUDmk21ZaVTI8y+VkUvDFsaHcTXd9CvTvsqHp1voasfuTAqjfWC2dpHRJRGalUa1xnSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcHvjuC+IclZbY+mD0gMtK3eSC88AQ/2hR9toNCXVP4=;
 b=tOMTNjNwR4U3Fv+M6LHsQqGDhyzg31ah7Ptn7D8CPCSeMLxuMB60g49uvxfIX2qSGgxeUJUNRJa6LwTfUslA58orT6PSjgDETbD9+wha3tYR6QtuWUMUKHfC2tlWDaXIBRz7owmwZC9p2F5UZQO37i1Qd/MT++I6WaaHIfSmv5CyPv3JInQlX55BKF0abqY3B7di5jQ0hlPUhfSDP6NHb2a30L4YpRVC6vulAiagpISwv1ErTKCawer2vH4IjWzrTCVpssfaZqTawwB4huCRElFK++Ho4vpZnTEu7T3O3sCw6fSPWQ5XSQoBGnGJ8V2204EX7Pbxl7sk0chsm+1FsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by VI1PR04MB10025.eurprd04.prod.outlook.com (2603:10a6:800:1e0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 14:43:21 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::3826:2706:1e81:c9e2%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 14:43:21 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ying Liu <victor.liu@nxp.com>
Subject: [PATCH v23 5/8] dt-bindings: display: bridge: Add Cadence MHDP8501
Date: Tue, 19 May 2026 14:42:28 +0000
Message-ID: <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0030.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::17) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|VI1PR04MB10025:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed4b3f4-dca6-4ad7-a479-08deb5b4f928
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|18002099003|22082099003|56012099003|11063799006|921020|3023799003;
X-Microsoft-Antispam-Message-Info: fIPDUQnc88nVUQMKNaSWmZgJ23AT84dPJIepeEAG0g0Vz7TskRRuErbQlOTcoVqwEFz/SN3m9j4Far+gc8O3HfJWQkkkJHOSW/MBqT9cTW22lAaxiaRjQmmO9pKYDVGdJHBZShrc6bJxFtgzzTx+yFRqLCu27s3Z5ycrwPzrGP1mz0/7F/reVcYS/EmdmNYFe991JI6nTYFP0vMVLEw9FrLeexsiUlN9dItFnnnwiGXUU2SqwpAJ8/c2Gpy4yM/PapxF19KVAXyThD/C1fitf3BKmOBuidycWnlCg4jg020X7/C7RnBJgq3RnR8YKabiZedHoLE9NDmy3U3aqS879FZA+7/afpksrI10v5NZn1Sgcpu50t00/Kk/LccyY1uPuK2ln7RYEvldNGXASyfdw9vSDeurvzFVPMw3OaNwmv7lsEWmCc7SwJqni/VKVCaAtzTJ8cfNea60dwP3LlyTxM3AdxTYBbwqfY5Ya/M6/gJLmml/6bp6PynlyyeBl3DW2cMr10U66pR5TPWG45eIF+3xxp4L3zRKDr4WgB7iKXbxaZOj5a23k2R3btfDCEwpnyI6XTRFdIYpjsdIo6tJn9UxBfP9tBJyNfkxJcSkYuXjIeOVV4RZvhJNwoIs1bbVvLOLHIFSSbmyO6wXIJfWu9iNHnwVfV1pID3hwwzkX1vi1/p55TsySzYsJcrYaft4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099003)(11063799006)(921020)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVNqSzc4NENqc0dlUCt3UTVNR3R4UXhXbGJLN0JGcThVRXpReVpjeXorZDZH?=
 =?utf-8?B?d1hvcDBTWjJFTkpSK2FWYnpsczVFQkxRMjhSR25sWFExK2c4bWJSbWppakhR?=
 =?utf-8?B?VTYwekZ1Umd6SVpDa3ZiVnlQUkhHaTdOTHJ2SVRVWVlDbUk5Q3ROR3NTYlhz?=
 =?utf-8?B?Tnk3cFcvZ05zRlRNbDAwdGRUbGJicVNRWTFTOURRTlBpaTlQbTh3U0RvaTJT?=
 =?utf-8?B?dmlOblRnRytjVXNGd0o3cmFXbzFidUdzSEFUem9VOEJlV2p6Qmx3VzV3TThI?=
 =?utf-8?B?SGE1dU43ZEp6VjEvb01yeGRwYjN4d0w3L0ZIcnl1QjdkcmJINktkeEtuZ1Nh?=
 =?utf-8?B?NFY2U055U0FFOC9rdEFSVGV3dHZJQXFoTDZ3VWc3aUxHdTJKbzlmbFE1aWg1?=
 =?utf-8?B?VU5JNFQ1OEdjYnNTc1h6d0Y4UFlqWGlmY3Rabm1GaldnSjFkR25xOGpFQlQ4?=
 =?utf-8?B?cXdsWlBEMjhtYU1GYlhsbVB6bzg4L2IwblFaWmNZZFJpeFdwN2xZdmg1NlV0?=
 =?utf-8?B?YzJkcTVmemI1K002QmhnUVJFQyt2bGM4Q3MxcjcvaU9OMHNhT0x0YXAveWlD?=
 =?utf-8?B?QzBxM3FKMHdlYnVBRld5bFVOejlSV2NKOUtmWEZOZkhnRldNYVpGOG1wWWRl?=
 =?utf-8?B?TmRXTFpGQTRMMGRnbDVGK3NoaTBqNGpwSVBtZVpISTFJVFlUVWZjbVltVEVZ?=
 =?utf-8?B?K0hOTnNMWkNZblZNZVNwakdMaWdIWXhoUG9xM01lZDNlR0paV295SnNPKzky?=
 =?utf-8?B?U3RjK3JxS09pYTlJeUFXVGUwNnZIWHFWeldvL0lSbmRpYStQS2ZyR3p6S1dL?=
 =?utf-8?B?bHVUdi8zQXBKUlRsVGwvWHUzNStpM2trZVpNWHEzUHVya01YVUthZk1RelZF?=
 =?utf-8?B?amUwczBiZnFWbmc1Zk5yN2xEK2hKeUp2VndjMlMzQzhySTlWRHZaa2liSHFh?=
 =?utf-8?B?VVpQMGlkQW5YTXNjdVRkTWZTVWZ0REZtM3VzMVVxeDA4eXJsSUZRbnl3SWNF?=
 =?utf-8?B?N1lvUlJNMkdjK0VkOTQ5NU4wZ05uNFlXLy9ubUZuMS9zbE00OVQ0NUJKQk9S?=
 =?utf-8?B?d1RrUEdSY0paSitvTUw1RytFbjlWdmc5Rkt0SFBCWjBwazIvQmNCYmZ4WWRv?=
 =?utf-8?B?VGFFT2psUmdrenU5UG11WjhmY2pBdzV4UzB4cmRmbVZXQ3NSend4aTJmSUxB?=
 =?utf-8?B?MDlkTk9LdmJDMFBGZTJZbFlNZXFuYVJ0VFVpMFI3akpBSmxtNDB5L0hXWjFh?=
 =?utf-8?B?WnF1TDZObGtLUnU2L1BLY1Rick9KTU4wQUdkdkhrRlRLZlpFdlI3Zmk3L0s2?=
 =?utf-8?B?OU5FVS9wVEhtT3h6NThFdTRaVmxoWlkwVWRSc1Ezd0xlNzRaN0xXcVdLY094?=
 =?utf-8?B?dUR5VE9ielh1ZUFuMzc0SmNxVEowVWFUd2wxQVcxVFZBL0FaR0dZUjN2RGZM?=
 =?utf-8?B?MjJQZXJwV25JaWZOcDlrRUFCZGxYMi96TWhOYnVZbEtKMWFEeGdXUkFSTU9W?=
 =?utf-8?B?Nmd1TFZMaC9odXczWlhTMHNyTmlrL05jQ1pBZXhXQ2JxUy9FdFFaVE5tUlVn?=
 =?utf-8?B?Y3UwcVBPdXM3cHpTTFkrN1lIbHlRY2JPZlgwdlM4VVA2WkJkVHdYU1UzWkZV?=
 =?utf-8?B?SUZUZXg1MU5sdzFVRWs3WnI2S3pJeENJZU9IMFBOYWdHb25rYVZiZ2hDZE9K?=
 =?utf-8?B?R09XVUxUbnlPVlJtTUd1eFA0cms2K2NmTUc0MG5yTzBVbXNGekJDRDBzbUVR?=
 =?utf-8?B?cHpza3JSL1RsRTNaZmRraTE4UE5zUFlUSFBYMGxKL252d0hIdnJJQ3ZxUGJH?=
 =?utf-8?B?b2tzUEtVUVBQVmV3UzBIOXJTaDRWYXR3TzcyY1pQUWZVeXJKcGp4cUhDdHM2?=
 =?utf-8?B?OTFtU1Z6bms0TitsOUs5UjFZdWhYZm5iZUxWK1FmRW1xWDJPWENqc3o3aVlp?=
 =?utf-8?B?dnQ3K0ZrWERFUzhNOXpFa0ZKLzdsd0hjWXE2aVUweVdQbFp3WHdkZXJYY3BL?=
 =?utf-8?B?TjZUUG1wTmhtNTRqQVRJRFd5b0xLQ0hjWFBQWFQwcTljakhDVFRkbHg0MGtD?=
 =?utf-8?B?MldLUmNvUjRlS3dhS3gvcXFWcjlpN0RDajBrdmR5NTZPZnROMlhPMFFUbEV0?=
 =?utf-8?B?RzViZGVaRTBLZkF1alMwY0VBeVhNSE1HZDVWY0REa1pyN1ZRazR2dWd5WVZW?=
 =?utf-8?B?dUZObjB6aiswdWk4RTlIOFR3Q1QrVmZuYTRJd3RIVWhiR0gzeFVWekZMM1gx?=
 =?utf-8?B?K3Axb0FEUStwenovMnpYZ1E2QUZrcWdTZ2JMVDdIaWljR1dSdEpvV1htZnB5?=
 =?utf-8?B?OWhxdWFaWmdxUEMrdEVsU1VRL21EclpxcGlubUYzdlFnU2E0VEJzQUZPcjJQ?=
 =?utf-8?Q?Ulq2xXoVel0lDmrk=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed4b3f4-dca6-4ad7-a479-08deb5b4f928
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 14:43:21.4023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mSYYI6pYpfYILViJFyybHZI7WorByXo/pBblAG2PsB27am4N1DJCnwwoZIqLqn1fX16nJ8CQtX/bbK0TFmu1og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074328_353130_D93145F2 
X-CRM114-Status: GOOD (  11.20  )
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

From: Sandor Yu <Sandor.yu@nxp.com>

Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/display/bridge/cdns,mhdp8501.yaml     | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
new file mode 100644
index 0000000000000..57e7e95199777
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cadence MHDP8501 DP/HDMI bridge
+
+maintainers:
+  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
+
+description:
+  Cadence MHDP8501 DisplayPort/HDMI interface.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mq-mhdp8501-hdmi
+      - fsl,imx8mq-mhdp8501-dp
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+    description: MHDP8501 DP/HDMI APB clock.
+
+  phys:
+    maxItems: 1
+    description:
+      phandle to the DP/HDMI PHY
+
+  interrupts:
+    items:
+      - description: Hotplug cable plugin.
+      - description: Hotplug cable plugout.
+
+  interrupt-names:
+    items:
+      - const: plug_in
+      - const: plug_out
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          Input port from display controller output.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description:
+          Output port to DisplayPort or HDMI connector.
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                description: Lane reordering for HDMI or DisplayPort interface.
+                minItems: 4
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+  phy:
+    description:
+      Child node describing the Cadence HDP-TX DP/HDMI PHY, which shares
+      the same MMIO region as the bridge.
+    $ref: /schemas/phy/fsl,imx8mq-hdptx-phy.yaml#
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - interrupt-names
+  - phys
+  - ports
+  - phy
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mq-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    display-bridge@32c00000 {
+        compatible = "fsl,imx8mq-mhdp8501-dp";
+        reg = <0x32c00000 0x100000>;
+        interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "plug_in", "plug_out";
+        clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+        phys = <&mhdp_phy>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                mhdp_in: endpoint {
+                    remote-endpoint = <&dcss_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                mhdp_out: endpoint {
+                    remote-endpoint = <&dp_connector>;
+                    data-lanes = <2 1 0 3>;
+                };
+            };
+        };
+
+        mhdp_phy: phy {
+            compatible = "fsl,imx8mq-hdptx-phy";
+            #phy-cells = <0>;
+            clocks = <&hdmi_phy_27m>, <&clk IMX8MQ_CLK_DISP_APB_ROOT>;
+            clock-names = "ref", "apb";
+        };
+    };

-- 
2.51.0

