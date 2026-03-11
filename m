Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ACBFD0650
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=roWpjnYjKT6TZ3yqhz0sPUh3Azim7Ka/UW4YABn3/D4=; b=3N/gcGU4E4X3c1hMZHCP84ratJ
	US49bfORADgOI7Td/JVz3h6n7+fAX8Nh/qaY/11HfzOrTrWr8liUHPLprLvzg2eEIZK2aMFvUkniL
	+OgAFk5LV6ZcsxEMy+bBpWvQpWZuaJky0ghuwGLtvdBH//QTGLdP0kvvgmKaG4oa7uHvnTBd3ORte
	mkj/lOLQkEf7OgbnTnXdaqRi/TVgg2Jn5QmQ3vcozIpdcnvSvJ5P8NeaCjeUYtz+QiWPBBhB+rPFc
	qgnXSDxFAA9tqYSwyNhMZbHRsqlgccROFYY0Piu73DrkOUREV0rb9caPdZpI8Nfo6Fr+7d4QgPI/f
	0IbkwB7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Efq-0000000B7w3-2NJo;
	Wed, 11 Mar 2026 08:12:12 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Efn-0000000B7ue-03HK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 08:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rroKIQh96ZeUa18i1Kvs+sLgwQvkACouRtT+DAcpp/OPfzufBtPoP2JZ46WNlRmjQvCx396GPICMSPDLb7AGTs0xUyWHg/k7aimnOi4GOYFxu88lSpfghQqtLfUVpiDWehU15lVHnhHFbSPaWiX3jdHXMMvKfXvO7PJwneGXcl6EQx3L1K7P0q1WOnrbw835tynJzLuzWderVm01mBvKpXjJVJzfVwLWH8jiN8M8uIHM1rywtx/VCOO3yTqFxbqVZGaBv93XRIdOCT4ciZ/3ZM9zdgzAu5dCn/cnSQStcqyi3SN686Y2VuNKUxatfvKT7NxwoTs7sz0LtrRPNzBy/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=roWpjnYjKT6TZ3yqhz0sPUh3Azim7Ka/UW4YABn3/D4=;
 b=h92FwBoEpcoy6kQlGHcd+lzuranVCVt2RT/lm/Q6WVuyh2OKng+Zjj7sf0hiRGyLVFNKon0hv8mrzg+0YrZVRdwecxElUO8Fbdo6+BNuPbiKU6PumpuRsKtn3afIN3InpQPgRyjuBB4WdRDF0OGhZ2fB+GndWac0jvKu1P4ZZhL3e2KCESv2/+HSYzhd4dydGC3Mrc0iZ8EL5cwT6aRIsfEjDMMLmNTrwTs6OfOVDGzKRmyP7Uc4XnhE9cDwKlB9/hxyYi8MCOWCtB8l7+dI+HztTzD2B5TrWpFeY6H6kR0AwRy412m5oqxDXGLm8ehP47jFz4dIaZqRwSbvm5F5gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=roWpjnYjKT6TZ3yqhz0sPUh3Azim7Ka/UW4YABn3/D4=;
 b=x/xmEYaeLE65VTGUPJPOoHv2uyysbIRy8qcP5KFXAzE7XHXLpJAg9vwQEbBG1PSNGhmws941yYZdQrUTHLh/uhYlHzktOSRjScdyeCYfkWATF9Jkv/h+V7Ln5tVeUMbfYOEn8QKE1RgS7gEywNEP5LRZgZ0kpPRTGwBy6XDcsdxdPYH4I3cae9J0WKqO+626WyB2mhIb+BLCf5o422oMyDPPjypikNhPck9ji21LMVclHn+F98XAgYYQz4eRP1SCDgmtyM3yBifF6J7lEttkCerCPXHesx0ssYezEbp5Mk8dLeKaW/cP6MjMz07hH+wkdZlZGE3wWJLSIKTd+ASj4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS8PR04MB7559.eurprd04.prod.outlook.com (2603:10a6:20b:295::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Wed, 11 Mar
 2026 08:11:59 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 08:11:58 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/5] dt-bindings: interrupt-controller: fsl,irqsteer: add S32N79 support
Date: Wed, 11 Mar 2026 09:11:50 +0100
Message-ID: <20260311081154.381881-2-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
References: <20260311081154.381881-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS8PR04MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e8ffd66-c516-4e95-f8cf-08de7f45ddf5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: wIHA54slpQ0GZO05pEL9AhShpM0A1pshjI4EPHXqIEqZ5SgVp0WOtbKgceoKI8dc/U98FeiONNyiAzZkcdR2QmBRzNwzaozeLBFOv6x8LlQf+Ws3olRKPVGr+TReYuMuZHt/pD5ZTa1z951pBD2rT+LGHrxJgObzQrs3KJy0ygywY+zeA2Xzi+vlWrXuclIpp5QVGu8f0LaJ//lqjMsf/q129MZdWPvZx7opTs9/3wZryKIpR4UpuQKoXZ57oFEIgb1GCvIer45JPW4Dl+APbnof+58p+uHXTiryvMODvAYH3Ba1NeFqEJlxsD0JBovztHMyiYN8USU5yP59sbgEMCKCWd1s2rfwouaTcX4OKyl7Mzn+ghrRBSTJbsZWvfIuGDZAXnwQTm8nLtrIQ73sLdYOJFFxM7n2ZFk/WQoqalfrlvPpaNpGsEFfF+nymQUvv8cX0/3pA/++VTZsR8EAFD7AhR2bqLgolvv7VIaQm0jzIWfpQL9r4qBs+cSAIliFWbLBp6DvHAuMQeNrmy6ANGGWOdWHn5MDpvtKWKK9Z7upQKjjf5s0h6B+RqEYHoL1hRodQfSp7c3xvcSURvGDiAcvPujXTjrGzqPGjpwMlRhPuL0OsT+gz1DVupRunpejAvqk54nmSFyH7fVD1sAlRepNbXbV/nXdtD7vua8wyPFofMU11sJ2J/xAs+/0RYUC95kBQBIss3Tgui8q2A0m8yQGYBNCKLcNclTkoQ8koMo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmtVRTFIQXN0K29zUHFYSkx2ZXRRaDIwODE5L2tQOURxNXI1UDF0YlI5eXFr?=
 =?utf-8?B?M2Q3R3RvNS9BUDE3dFZQeGk0WUUydC9RZ2FIdGZhcmlaR2cwSkY5Z2UxV085?=
 =?utf-8?B?Z0hQNTRxRGR6UUZIeVNQeWNSczRRL0M3ZHlaOTlyb2pBQU5BK25WTEhieVB6?=
 =?utf-8?B?QWlBNlROa3cxLzlGbjJWOXloV09kaTcyY014ZEhhazlOWEVmb2c3ZkZWTmlo?=
 =?utf-8?B?bmZiejlhdlo4SlVhbVJQK1RDb25hZ0ZYYUxXK2trZXNaalk5T3hEWXl5RW9B?=
 =?utf-8?B?ajB4R3F5cDdvbnFJb1U0dG5zQXJLTk9EQUM0RitWOG5BOHBBcDFRM1QxT3dT?=
 =?utf-8?B?cktHM3cwQjJYOUo3bnVHdWY0QzJVZTBxUDNOL2R4VCtjZENQNWpvWklKRU9Q?=
 =?utf-8?B?SzBjRFhDVVBHYWtIZ0hNbUhDRnQ0Tkt0TWVLREZGTjh6Si93SldZZ004LzBK?=
 =?utf-8?B?R3lkamJwVTFMYUExczRRbXRnWGp1a0doaFl1UmVEQUpYdWhXTkdwWXJrQWdO?=
 =?utf-8?B?MHR2TUJqcGZBOXBPYUx5ZG1NU0dJSUVXRmlMOE53clduOUZmZzNGdWhidkRn?=
 =?utf-8?B?bmFNU3hvRFBMUU9Ta0kxQmxsY25nM3ZuNmVDaURaR2F1ZW15VDUxaG94Vzc3?=
 =?utf-8?B?aGtXQUF0NFVHUGhhYjc1NVdNTUhhNTBIMHAzNDU4S0FDbEJQM1oyNkdRcWJY?=
 =?utf-8?B?RksxTFEzaFd2QlhYbGM3WDNCZFF4VUdub1lraHM2UjVhbGxiUHVYeTcrUnht?=
 =?utf-8?B?T3Juak5nWnFJUHZBY29kd3FQbHpCc2pqbFc5Ry9vZFBpZFVmZ1lYU1E3NCtM?=
 =?utf-8?B?OWZNekZaYXlyTzVDVGo5WUw1bDVCVzJBUGdnelJzNnhZeUxZcHEwdzhpNUdv?=
 =?utf-8?B?U0ZzWnl5UlZqbitZTnJDU2k0dzljWjViOWR3SUdUWm0rODBDV0wrckFRd3FH?=
 =?utf-8?B?RElsZUg2aGtzbWtNbGZhZTlWWmlDUFNtaGFESVVaT2s1REtoeWRtdldvQlhB?=
 =?utf-8?B?Y1FMZGVFSlZPSExheXl4QXY0aWFKdFRBMmNqRGtLRzdWbEpLMUlBUlFlb1l3?=
 =?utf-8?B?RzlYZGVJMlBxYVd4Vm8yb1kxYTFMenNlTFIySyszMGR4Zll5aFRyUWswd3Bv?=
 =?utf-8?B?YzdJdStKVFZZNjlDSm1vcHNoTERoU1VJb2F3aUdNWGdTcXNvSENROWlTYTUy?=
 =?utf-8?B?MXpsQTFkUGRpcSs4TUFKSklyK24zVmFvK1ZNNUlQbk5lSUVpbHhPQlN5dmFp?=
 =?utf-8?B?NVBPcHNOdnA4N3NkakszWXRsVW5hbkVtUXhjZzJPQWpySTA4YUpjZGJqMGZZ?=
 =?utf-8?B?anluRkZ4eVYyQUk3M2lrNWFVT2xhQmpLQ1g1c3Z2WlU0SVpQbXFkNlY3cTR5?=
 =?utf-8?B?SnBLeHFVR21Sa3o2dVMwcTVvMWljNmVxWEpRQWVtUHNqWG12RmNCaVo2eG1T?=
 =?utf-8?B?SUs1NUJyRkhoL0VUcGRjaG1IYXNKTnZ4MktYRDdrOVMyNDVRa3Q1eGl2d09j?=
 =?utf-8?B?VGZVNkFZQmhienZ1eVkrK281NDlqYWxQVGNITWV3SnIxcTErZC9USnhQQmR6?=
 =?utf-8?B?b0JVUi9sc3N4MFZPcEdnaUN2ZGkwblRBa2EyR3d6cjZFZ3VzVC9TL25Md3Vz?=
 =?utf-8?B?UVpSZEdXMmtvR29qWS9DRy9KVkY3MjBxQnJweURTVCttblFvTzJabGdva3FS?=
 =?utf-8?B?REtTNmF3TjZWNzNGVUZFNjBtNEtuYndKZGY3bGhTcUdSUUtGMmJ3c1FsNXBB?=
 =?utf-8?B?WmNTQmhKR0MwaFVNYllFZXE0QzhRYnlkOUlGR1NIWUdKNms3S3NCOWVjYmhJ?=
 =?utf-8?B?bjM3dk9nUVdsNnQ4QmRXbGhLWURrTmxVTmxoczhRN0swdWs5cDVpOHhaYXhG?=
 =?utf-8?B?MU52WkFiME5CdXVsd1EvWHhZeGpqb0E4OFg5c3A1bHJUbDB6M1NrVUNKZVk3?=
 =?utf-8?B?WDFwaktKMzE4aXAxN2hITzZDeVcrSnY1d2ZrNTA0TTI2OHpYVzJkMnh5Tm5T?=
 =?utf-8?B?Q2Y2RjZXeFRmMlhTSk5qKzVxK1l5QW0yTVhpVTB3dHMyMUhkNTg2WnNjM1Nz?=
 =?utf-8?B?L0FwR0NhUnJROE94cHdmaURYNUFDSWp0aUI3em9US1IxOFk3c3NSaE1saTI4?=
 =?utf-8?B?dzhDUTFGM2szNm9TdElDclRrcEt3bXdUTFhnMEhQZG1pQUVGTTVQVHIxSlZu?=
 =?utf-8?B?K2w4UHJJSjUxL2wxUVBUaDhEczZhcmZycytBNmQ0SmU5Zyt4Z1c1N1d1aUNK?=
 =?utf-8?B?ODh3eHZpaGY0RW4wN3dEbWFHVng0bHRGVkt3NTBhZTlJTXAzL2xQb3ZEQ1BN?=
 =?utf-8?B?VnFUMzdrL2RPNjlGV3QyUmgxWWFTQS9YVFdUUVB5Z3pvbnlPZUt3RG90WFlQ?=
 =?utf-8?Q?Ct0tl2VVpT8U0n8w=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e8ffd66-c516-4e95-f8cf-08de7f45ddf5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 08:11:58.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BekFL9GkT6XtT7lSWffMXpza342AUcuPxqpgg/nprS/m5TGbjcUb9l1sXDuuSiJ/spJd+5hEY5aGH0TPWzQQBHat95c5WgkX2V6adPo7hkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_011207_044929_97795EDB 
X-CRM114-Status: GOOD (  10.66  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add compatible string for the interrupt steering controller used in NXP
S32N79 SoC.

The S32N79 SoC differs from the i.MX version by not implementing the
CHANCTRL register, but otherwise maintains the same programming model and
register layout.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/interrupt-controller/fsl,irqsteer.yaml           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index 5c768c1e159c..13cd37bf48e4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -12,7 +12,9 @@ maintainers:
 properties:
   compatible:
     oneOf:
-      - const: fsl,imx-irqsteer
+      - enum:
+          - fsl,imx-irqsteer
+          - nxp,s32n79-irqsteer
       - items:
           - enum:
               - fsl,imx8m-irqsteer
-- 
2.43.0


