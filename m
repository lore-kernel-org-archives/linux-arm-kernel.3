Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07ECD3424
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 08:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=; b=LexGMl/GRJc0yN+UqBuncdebRF
	s6ZwsEnwicFttMNdWT2NdaTT58zJ8/aPlL3jL8M065aby9W0A61HYMNMv88eHF+jp85X+MinSOhDY
	JMyu6RNeWgg+9NFDsgh1p7GEJ+z38e7zctv51nr/gzlBu6/S7MMuXzQoP/S/iKk1Q2QiW8elxdmsp
	Inf8H7I62J1LtQRDu+C05xsDkJjnSNpQX/ITc1XFM9yFyICb+H61FTJbHA3lvSqW7VSh1kg8NI73s
	019XMUZ576bULNljyLUCfrCMmmNFMRdBjLlsCE/65xBNrN+gruM/hnHi1Qk+79hP/WTwR0GacPHFg
	2YdvlSAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXzK-00000000EwZ-1hP1;
	Wed, 06 May 2026 08:52:14 +0000
Received: from mail-northeuropeazon11012042.outbound.protection.outlook.com ([52.101.66.42] helo=DUZPR83CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKXzJ-00000000EtO-0aiP;
	Wed, 06 May 2026 08:52:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZFpH92p6v5RgL1daP6gQ3QPB853/iI3tInypLbwdtw71dNsfW/02EbnIEZqxXU4VVUM1U2TIpBBwXMhpq6gijC137ADue0cAjpqvYAMd9lvamRA6IMKIZuSNEHf2LL4tbs+X9dKalTife77QTZTaheb8d7EnmFAtfqrOM4Lyh6bD6jEEOBDp+uF7nV2mAGe5mKEDhf4RRhnKRmmQ+TI08AzZrze+9HXS24BuMGi/0qnPyQ7s9Jq6kvtHwsorC+jSYd+ycycfwi57wcGaijOiHAmzgK/sgzNbgia9L0ThuVxOFFn55TUg4pmzVak/PLwzBNkN3ZRuonHeaCpn7Hrhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=Q3g7Jz2hJoNqegPbV+okRKrtqVJGzhu2+IKldQlGPdSK3YbyW4h2Is5mPNwCawNT0r44mBaD40Hzn80oiczhcIjh2ttX5zaCmSZexrDkePyrTYt9wl/HL/A+ZwcAXe4wsYYDkiqWHItVPkJX4sQs0hXduL2gLL/RE3A3ImGHdwKhw0PLdgiPDkIG7N8cKt4qTlb3MSkQtsWHnvXI2Z/weVnrCb41D6N4UZN/gDyfwShBDHILPeOQdNybBUQcGbiOw8frmMDn8HQjWhQ57rBhJX1Vbka2gpvDWPa6poEV1c4J8PyGE2TSvvprlspdYxVerEiCabt9K2Xl2ytQiH9bwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAX47NA+H+Kr9loh4CJH6zyL2Ytbc582ZlKTBywjDVM=;
 b=TC69n21hQRB+OPEWp+NcO7PI36QncGhd5vTcMQ2Do1Ja5J9fN2tZ7KWzu1ZEfB4RuI+m2oSdv8ywaD+HihexGJT9EvGqBv9WTPAhStE5hT9Q8eruBUcbgx5qy3uW6cral4jkxROuBYSRUc8BQhgOOjLK8HYNu63tiVEeKgHbL9mLS7K6S/vKZh7GTtlWiCsxpnalCQhPbpqPPz6k+ou7pe3lqUv6OvL0kFyeaDn/3JcX/5J9ndCfY23Vm4rINBmpwrR923XXkmkJbVSVPn1QBTHEdPQxXAXEMmWUcMgAGQOoT2a24wSuE/tH2zlgD1HFKYGLlKXaSSjDGFzgEH33OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PA1PR04MB10443.eurprd04.prod.outlook.com (2603:10a6:102:450::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:52:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:08 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:02 +0800
Subject: [PATCH v3 3/7] media: synopsys: Add support for RAW16 Bayer
 formats
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-3-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=1267;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=gTGgNuPQLiZHsNbt1aIGfhNfVgG9RhDn2rIQ3XGEZMg=;
 b=imBB1yorQUCBhXuNxsA0n2QN9Wi8xNGntQ52M1uy1xTk15Lo9iZZnqlHhpmSvj95OO+av/ziN
 z4gvEgJYG3gDdj+qgFOFLn7A4n42TSy8XEvsCDphAxYxnoIEG/dhoBK
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PA1PR04MB10443:EE_
X-MS-Office365-Filtering-Correlation-Id: 918e64d7-a0cf-4f28-71ad-08deab4cc150
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|376014|7416014|18002099003|56012099003|22082099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: v2eiYrWk2gsQtv8Mn+Eu3MRIbMz1lBp/kKZEi+aKxKAGz0TPWu1EP54vmbJjH9GlF3vi17AdwbFXTtAf/HVsZjCPHZpDZp3fGxH3JVuYV/razuquskRFMjpbyolzd/RubB+bLeB4ia7gXAtdCfLKX6k9hbRRizWVdUVdzjRSvPiS8rUCra9LkTweWq1DwPNMemftBSshNXGjjGwkt70+gFHbMDmAgZDrdKAQsrL1EEIX/zoTN+r6d5lTXAT5iFdYg52owVi2bjsTsWbgBcUua59AOBy7Ggw9LmBIs+rl4KepDQozF7BDAAOpA4O+dxFWH9xHBYjAK5u6qmCHJZ4ZnmFW5lTffBqwmLMpzKORkebdgSi7saoEYu4WaVAvhibxM+th6/Mxrt/+/Itpw1y/mLA9nunwH0dImLeL7nYFaYqZ5QklU3URgeel/IDLr7hQpsepSudetBtgRhNUObX44uLjHNnTnWgP9AteZdgbzDEo0cH92g2ZNyKXTNy7GObvqsZu25iusbO2Wg1RN9mmc5xrH9ube5B7/oDdXpJiek6WvFxOExi84Ui9kk+WhpZKBbFHX9GHlMuBgY3bzD0EDom+xmIOaXqyUv0iUr9Rp+n1PU4rC9UEHYRKuuXLrzL/uWc7tdUeXZpcDam/EBWazG9/RJqaapeZONhaQM7W6eSa2h+UlzTHKmWxYKdVMn9gKY82ScgIaIJlo7kG//hJSa9iK9CjJ8BFwwivDdjO9ZrA6RQKPgGahMTVTeMnbGIcPhgQcBP19mC7wFm705bOwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(376014)(7416014)(18002099003)(56012099003)(22082099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHJXV2tYUGg0SkdvME9JMEVic0wzNEZELzdjMVc0WlhCNC8wb1h4ajhKS1FJ?=
 =?utf-8?B?VXFQWStoVE1OL2VLNm9UUnlENjdjZnJCNWpYakpRNzBzS3IydTh6OFV5eUxF?=
 =?utf-8?B?WlgzMzZBellmaDF6cnBDQmR3SGJLVnE3VmVpZXJtdVo1WHkyZUJZMHVuS3Y4?=
 =?utf-8?B?UUdUQXQ1M3Y0OVRSYTB6ZTBaN2tVYlNwSFFlYnJESnQzZldoVmdNd0hJUmRq?=
 =?utf-8?B?TjV5M0FhWE0yU1FvNnBrSmxidTJ1cnhlZGRESDRMaGRNUTJPNnVCaTdCcXo3?=
 =?utf-8?B?WWQ0blFnQjlsSVM2S1BVSG94aGZyUDdQamU5aHh2cmhCM0Z1bHlWNFRldlhB?=
 =?utf-8?B?a2MzcTRQKy9mSmJIRGdZQXJYNWMwRjlzaXY3elJ3aTNZS0s5dnV4WU1GMzlX?=
 =?utf-8?B?ZDNLZ3lCQ05DSlBQcy9WZXpSbUM3TlNWZDdjWFhmL3R5SHNjdHRwL0o5VUQ5?=
 =?utf-8?B?TjZIdHJrZ0pQTStOL1ZQbFZKTDRoUCtuamVjVEdjaWxER1ZHWWVGU1dOSUZh?=
 =?utf-8?B?ZzhEYkJncmFBaktWTWRyV2I0U0dXQjN4MmpRek9IbnBkU0VlVU9jTEV5NU8x?=
 =?utf-8?B?SDU1M2VWamZ1dHZ3MlVYMDgwT3E1cnJNcHJ0cWx5R2R6NWFtcHgxUVB1RUhK?=
 =?utf-8?B?NU5rczJIalVhRS9ISmNVbTErZTR1ZmRsYkdydm1vbU9OeHkwdnZlR24xcXR0?=
 =?utf-8?B?bmNNd1NPYmY4VXlpdDVIZ1lVV0Y5VHpMc2NGeTZBSHhmT05OQUZVT0Y3RHQw?=
 =?utf-8?B?TzZNOE5Pb3dzSi9ZMmhoYmlKYmtuMFVrWlVFQ0Zoa2cxckNhMjRDYXI0cmh4?=
 =?utf-8?B?NEE3Zk9US0RLZjhsemZ5VFhoUHJRWWttRHRqU2JKY3gyY0FEbXZhUzR5NVRO?=
 =?utf-8?B?dWFvWmFCRytVS0Fjci80d0JIbVljUjRpeVNTalRRZVZnK29BbWtBcTNaVUdD?=
 =?utf-8?B?N1l5dklMdllUa0IxcXNsb2ltNTl3T1p5eitKZnkzbm5ybzk3c3Q4MEp6Zitm?=
 =?utf-8?B?My9FOGFsN2gzS1NOdUtTblFvV3Q1akpQWlZaaVhqTldEM3VkNkU1azlIUi9l?=
 =?utf-8?B?L3gzT2NleGR2RDhqN3JmOWEya3hqUTNITmh5K2E3UkgxZW03eXgzR2I5Vkho?=
 =?utf-8?B?UnZsbjY2L2c5SXJSaXV5U3RrdEJSNE1UcCtoQUtYd0ZWV20yV0c2L2lIU09I?=
 =?utf-8?B?NXRtV3hwL2t5Ky9ZRC9oc0RjSmNtUmJzTk9SNFlWV2ZnaHQ1TDhPcXY5VUxZ?=
 =?utf-8?B?NmhMMFhqY3VTZkpIYU56dkdnck03QnhGejFBRWdJUmZ2bHBVRGdoUW45R3JJ?=
 =?utf-8?B?Z3krMk9WTHVlZVV2UjdxNytzQWdMeXBHS3lxVnUrcno4V3AxS0ZHWEtNeVhG?=
 =?utf-8?B?cThETnhudzg4OG45dEVjVU9neVBGQVF2aEg2Sm1HaGhSMVlwd2dBa0dxc2lk?=
 =?utf-8?B?NE0rOVZGRERXbDdjSUJIUnp3SFNaTlRDV2xhOGVjZnlGTGsxVGZnZWdrTjht?=
 =?utf-8?B?RGo2YXRNZU5veUxpcXVmSG9NZWlFV1ZjUjVzR0krWk5lT3pMdjhldXFaRXY2?=
 =?utf-8?B?aU56Tm9JOXFzL1E1Uy9ZL2g5MHUzc2dmSUNSOTU2NEJ5bHV2UkVMalhZVWFR?=
 =?utf-8?B?d0xXUzNlaEFFKy9zOHV0ZHNWVlJUV0xzRzlqSGh1Z2ZMYW1uUDlGZWhhS1pB?=
 =?utf-8?B?SkM1eXhFYWJhWHordWdnYzBBbHZtVmVCa09kSFQ2OGg3NWNNQzE2Tm5IS0lP?=
 =?utf-8?B?ellGVzV2QVBkVVlWVjBRSXRCR09oV0pxSkhtNFFlbFR3UTFzMnRxaUR2QXFO?=
 =?utf-8?B?QVNFMmRlWS81OVVBc3RhRThSQnh5YndkVE8rcWRmWU5henNNUzNVUGtaQWtz?=
 =?utf-8?B?aHE1eXZTRC95TkJFU2hQOFJ5S3VjZlR4NGkyZG9GOW93Q0JUYUw3eExuRWVD?=
 =?utf-8?B?TTBRTHRla1VnTUlKd3h4MThuS0duTzRFcWl6UjdFSzQ1ajRtNldIY1VnK0F6?=
 =?utf-8?B?Y2lQcUxHd0VGYlRFSHV5Qm9uMkcySGxkMStJOWs3c3hmMFVGdzNHTVFDdEJN?=
 =?utf-8?B?RmErZ1VSVzFSZmFsYW9icFp1c0xpZk1wMm0wY0dibDJrenpvcnVZd3ZBKzhG?=
 =?utf-8?B?WEg4UWsvTVA1aG1qekJaQTJVTUxJc1crWVQwNlp1bVQ1V0hpTGJVWStwV3la?=
 =?utf-8?B?SGh0VFhGUk03WjdWM2xCRXJBMVhzY1UyeVpudmVLWDhuZnlXVDRFVHpLNytB?=
 =?utf-8?B?M1B5c0R3UitVY1pCOHNCUEdlRlJUNzJ4MjZUTGtqbnE0TUd3RlozcXppUGZU?=
 =?utf-8?B?M2JSb0F0ckwySVZQajUvaUtzbmZwRXFJS1J0Qm55REpoNkh0dXB6QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 918e64d7-a0cf-4f28-71ad-08deab4cc150
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:08.4152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +APc1ew4ttki9IcGMQvTGEBQB2w1cOXoc3REB8dJfUtio7amFf4bjiZtwS7XS5q3CI4X1mKOFzxCpT+oLI8ViQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_015213_191112_98A755D8 
X-CRM114-Status: GOOD (  10.49  )
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

Add higher bit-depth raw image data support for the sensors, which supports
16-bit output.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Update commit message
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0b80e84983f9..f45466ede2bb 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -252,6 +252,26 @@ static const struct dw_mipi_csi2rx_format formats[] = {
 		.depth = 12,
 		.csi_dt = MIPI_CSI2_DT_RAW12,
 	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB16_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_RAW16,
+	},
 };
 
 static inline struct dw_mipi_csi2rx_device *to_csi2(struct v4l2_subdev *sd)

-- 
2.34.1


