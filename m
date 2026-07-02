Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F17C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 16:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WIXpHrXZz8lVJqRXUoVfTfWarW/kql4r9EwWgjySmE0=; b=jUGpLdE92LEjpf7xPHUkUPr+Ur
	eo8MFh7NeBAHFitAcLSvFrm8T1SK9BobqBzbjCMnW3cPv6rEse7y627VvbL+3x92rcnvC8M5RQa7v
	CuB5I0bgyjvF53zszk44nt9onYzEtZjjPyzSgcIK7v/Yysu29mv5Vrv1J2T0vmxs1erGawoTfAbSk
	eAN5F1I/dt8Q7ZEzz9bGKIy2mgQ63L3Zh1czGwHcsdhq3H8m3D5MgL/tk6KXXrajYsLMycpbfjkHW
	/ELTKQXKXVCxFI6SDgoB4LIZ6WOO6iObkzt+Ryyc3jF2S6qLTHaBLL7URX1MA+uvweGDJwcdMcTWb
	pvNGkLVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJuT-00000004x2h-0gPu;
	Thu, 02 Jul 2026 16:05:06 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfJuQ-00000004x02-1Tu7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 16:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4atZ5bWmJlQIzo1tIHMkrSuYMEq6+LY9q18dAD2trw4iNrUF/tjDbo/oX7FNKj/dmlgxMc3QBr1/y7Rq/cKgQwvDdQLc9NRNMC1wFVNdBgsVrykqmLowdXupgkitzHLUZUmYJ6K0K/hui24nuzf/dl2iJcRe6qcoRLbYhW/QH1LPKA/gMfLq56XlEI5KyVwUZUn92T5hxi8X6ED9B8WKd8WxvvlcS71ZfoOsOK9ud0t2gIN7KzTBVLhODEg7/2bwS1yPjrL1BSSfwGfIdP3JjJhGmZcyFF6+3IQXN65QqDQ81f0m72Hbatpg70A+Ux9sYcQoH4t8ctUHFM6VsHi9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WIXpHrXZz8lVJqRXUoVfTfWarW/kql4r9EwWgjySmE0=;
 b=KIxTK0tqadXDB9IOG7Gx5Ha0/2Bzi5Utji4D2QY/+i1cGYoBqesI1ZijyjxqQqt7XVEOa9SNFwyMGFgU36xKJt5798lnFToRSFA8s8Iwu5kP5w/+2kSQ5LRgoLgRLkQ+CBLIzFPc8ie5/muXjKn11yPsai0T15/JvNiST3mTS1Z/D05QBzcv7KoH/RZ3KduqvI4BzYPkno4MpONFLdrBccchoSiCmq9GYLiVUSb9v/OXLO0P4gIdlfW/Zo+Ox8/IutmtDLcvA+MnfH0bFekZBM5gnEzw6i8KunMxo2XiZZhVnX1Hly82GNbJe7jJrLXqYdtgiNn6ri/crRkfkWQzLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WIXpHrXZz8lVJqRXUoVfTfWarW/kql4r9EwWgjySmE0=;
 b=ken7IBJ+VyKcjcM+L/1Nhm9AxQwoskaI9mmoJDhI21MGg68Qe1EdBm8slwBMggjMk9KnQqJVobfX6sNXgdIE/5rsjZxFXtTEUUYgLnBCbPYL+DMqm4cA83gTb6MOOmv6o+n3SDON7VZHsJRhQxO71olK69V3BIPSR3PHygJBpbNUgPWpRUVR0xJl+y2bjQpd7LAI7HJbg0qtESAqLw7waz5z0h5SHKkU1CJqTNimAUqOEzXfGd9K1YZzYX/OqPjPD6leo1MEsV1c98s6OL33xztXUzueT5GPtWHF9ZB2uEGV44JgbMQahlpbYwRUVpBv+n3PD9GaZtfNH4j0E3WcpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:57 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:56 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:04:04 -0400
Subject: [PATCH v7 8/8] arm64: dts: imx8qxp-mek: add parallel ov5640 camera
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-8-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=3896;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DTzjcwsMZnU5X3I679egLBtPndSMzRGzIJdHEg2WA9E=;
 b=dYTEKmS9kVDaE7LRKUH2pH3kSiczAey7GONfoq7gzQw8tqN5SxMqzMkgrOmAVhMRLYe/vnmIb
 ZACuHtiofbTBjD27gp7hh7XFnYXQMwqNcFhxFz1WwNMLSgNkuV3TtMo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH2PEPF00003847.namprd17.prod.outlook.com
 (2603:10b6:518:1::64) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: d9553cde-b8b4-4a7a-4006-08ded853a91a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 18OO3lEiCClgjEQKBfJmShhUFCDug92V6SrWm+jIVAW9L8F2HhiOq54ce3KusUlJtLVmd7Ysep1EfIr3KFqBaIV1XXzPW7jYvKyZUoe9Xdatz5/TrEuAZvlA1Pl3dG9mxzCq2L5sI+pbxU2niNu5N2v/ieVM5GkpCk/dQ4og+aeLMtCOyzp+wUJ45D5q+a0iBF9uq/9laSdtjGgE59BEGJIJWNTNUCh05W7bO/G9IDFNTBRjqH69SQFsEQf/dLoz0aFkHMh9q4edwvs2BM/zG2BRDMwRCTXGnQgGcon+CEsAsX+fwG2RlMgK7vDbE1jm7O19RW7kr0Xv9pe7Dbh/vwovqFSzuu5Rb7obtscWUuA+hHexj2IPaYDR+Xk4l0BTMnRi/dmNGP+eHmS18CX/l9U9b4TL62zz6Xd9YyAqcZNzccskU8+r89GaDqKFZQtR+NeGnN4U9vohYVVrK93ccD8eT/J5XGHGeNCRfzZccaG5fSKUV041oa+TKrusQkaf4QE4we3j9Z8NBelhi18utsLunfua5ew0f2vCDmNMQqKID9/4UfHHT4Mf3P2qoKMu2uRMmaCw5d44OU+SyVMkgZP11JPIUajxm1Sa6uk5R7dXQzU8M5XJFH7BFNhe5KrK/pIFogC2J5aa7fbW3JfvD//lTzT3DvzjBlHePv/8D8vlvmQ6OqDoyEL5y/8RssZjGy8i7UM9o3mJwGUihbi7jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUU1R1lDOHh0U3hJMGdmSWJlQ3V4UGx5MlpVN0hsOUlUQ3VDMTlDMWRjR08x?=
 =?utf-8?B?cU9ManRVRWN2dk1JTlZHOHZMSEdablhyWEQ5RE02OVhjeGpHeExPQXhJSk1Q?=
 =?utf-8?B?MUM0YUozdWxZeXdNZ1lOeXNJSlZmZ0hXbXdaNkhZS2Zwbmx1N3hPWVhSSksw?=
 =?utf-8?B?UjBwUWxkZjN4U0E3eW9SSFB3dnQzM1Q3OFNoVUsvZ2UyaGgvelVqaHlIb01v?=
 =?utf-8?B?TUNvNXAzWUs5NnNsa2I2ckgzTW8ySnNVNExMNW1hNHk1YUs4R0dEdiszNVVS?=
 =?utf-8?B?VVlwVXJVTFBxRk9xZk1PVEU4ZW56NFpwd05MQ1NJQnlmS2h0aldvd1M3dlRh?=
 =?utf-8?B?dFJ6OXdoRXZScU52WDROeDFjVGcvVjVXZEx4SGtxaWNOMUFDWnBxNTBqU3Zx?=
 =?utf-8?B?RGExQllZVXhZcDdQK2tuQkIyaTQ3RjhFY0dwUGpGc0xlN2NBcnF2b2dtRVV2?=
 =?utf-8?B?OHF0TnM2WTF1a2orMEtBY0VFYTk5V01ZOHBFNUVZcEcwc0pjR0NDQVdOT2FR?=
 =?utf-8?B?Tll0c0lYMGJaNDFLY29nUXF4a0RNem12U0dFdDRVQTNZNlhoNkhRQ09yRDFs?=
 =?utf-8?B?YVp4Z0hKYlJFWVQxN1JvU0x2SWdCZ0oxU1NRTE8xV2dKOENBS1B3MjNONTdR?=
 =?utf-8?B?QTlkSm53Vkp5a2JBU2R1eDNHdVE0L1VaZDFXTFNKQXJEeXhnSGFDVGk5T1I1?=
 =?utf-8?B?N00vYm1tNnlTZlBOdUd4NWpTd1BwQklQY1VhK3gycUFVYjZWbVM4V3NJM0Nx?=
 =?utf-8?B?ditmYWtWaEF0VGxsU1FzdjJYcUkvME9SWkt2aUthTGo3TG1HQ2lxZGJibVRz?=
 =?utf-8?B?TXNwUVB4WkI0RUFzNkloSlBxdURNV2QxZ1hDd1FKMjhOaTlvVjZrbFhGSjd4?=
 =?utf-8?B?SmNNY2ZIczBNSWpWOE5tTEVMV2M0SURnQnBNT2pVY3ozYTdWdnBCUFFNNFlz?=
 =?utf-8?B?K3ZVSjZ0TjdBcXZiUm5aN3M1Uk5DSS9WZVRRMmZyN3YxZnlDaEtJMHFLbEY5?=
 =?utf-8?B?REJZTDBOR01PYmYwb2hHMUtqeVU5SVpWVThyRjVTZDl4cGZncS9zQ2RyYjY5?=
 =?utf-8?B?NktmN1pXU3NLTkFTYm5pZDRpRTNTdVVkcXFEc0JvS3d3YWVFVzE5OUw1SGd1?=
 =?utf-8?B?QndWL2FYSWtDVmhRTkdzaFV1bGlqakl6U1hINTJLcU5GNkszcnBXYVFvV2hZ?=
 =?utf-8?B?NXIzWGdNc2UrNU1EOGsyU01sNlhLSGc1TVoxM1lwMThXUjVSekZUd1JFVGhi?=
 =?utf-8?B?VWJ5ejRKWitFU3BwcXhSUEEvZnZZTnN0dGVQT1d5KythUExjSVJQR2lnZDNa?=
 =?utf-8?B?NFZUc2lDK2RxRk9ZNGI3WUJmRjdZRFBLdXBMTWJqYkkyVEdQS3BVS3d4MUxQ?=
 =?utf-8?B?b29TZmc0RG9xQkI3TW1jT1d0TmNDUG1NYzhRanB5Q2pkSHl1MGRsR0VORmpQ?=
 =?utf-8?B?RVhDUVZUdHhSQ0pMQ05LNDVIUE9MenM3Z2pZaGxKVWp1TjNMRVFNdkxHY1hV?=
 =?utf-8?B?V2RFVDkwYUJVNm5BS3FPVVJTVEE2TGVOdjdGQ2xhYnJQUCtSY2V0OHpETUVx?=
 =?utf-8?B?eWViRVk2clhkc1MwOGE4c2YybVM4dzRURnZKNUp0bS9YWW9mZGRLTEl1eDJR?=
 =?utf-8?B?SHBUU3YyOTd2akw1TCtwejlMMDc1MUNUY1BWZkNaWlNIb0dkUmFDeUxnbjdQ?=
 =?utf-8?B?VjgyU2M2VkVQazJTV3NjMktqV2xXVnMvMmNUUXFpMHpGeG5RUXFwUFlGVC9S?=
 =?utf-8?B?d3d0dXIyc3NVY2tKRTZmVGJkb29HMVZNTml4L2tYK2JLWDlzdUpIdFgwZ003?=
 =?utf-8?B?NFY5UkI1ZE00QW9QM0c0R294dXpoYlBNNnE3Zm82bTNZQTJxTW45U0dUQm9T?=
 =?utf-8?B?bk12WTlpTEE1TjJMY1VsbHpGSWwrZmt5Qy9JUm1oeXh1U2tSZjVQTDA0Snpl?=
 =?utf-8?B?ZmhBZWZBc1lsOTdsZitUUWs3OGxQTVBHTmRjMFRIbmdwQ1VZSEdVUXo0ZTJY?=
 =?utf-8?B?eGEvKzNBZnR1QzNMUDZhQTNsYjZ3YUxwTFZRRGtrSkxzNTdUeWJGdkVDMXYw?=
 =?utf-8?B?aXBlWlZHL2toeDZFSC9KK0lHMXpqaFB1OVFYaVlHTkdUVGFqZ1djL1VXSWhW?=
 =?utf-8?B?dlN4SHpReHlRZDBFQ0dUWmRhN3JOUXd1c0NVN1FXZXZoczVpZ2ZXeUI5YjVn?=
 =?utf-8?B?aVl3ZThrVnVScCtmQmJsYitBZFlUMC9GZUZwbzhsRUFCQlhOTUc0VXZ3Y3Rw?=
 =?utf-8?B?R3lwblNtdE82cmFjYy9KSTdBYitDZkM4R3lkNjZKSkdreVJKRnQyVTNrYnRV?=
 =?utf-8?B?NVpkaUdKV2dhWWxsc3ZiekR3YzhIeElJWDBCZG5vZnFTNFF4c1VxbmVudFRC?=
 =?utf-8?Q?cRMxtMHnaXIVj0Uib1ht6VEmOixnufZOwN0na?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9553cde-b8b4-4a7a-4006-08ded853a91a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:56.6637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vBZSPLYYP53u01Xggxk/HxRMHm/i2o7cm/6SJvM3cozHlYBoI9HMAXqB9QpN58L0c2Jz1xz0LdU4oWfLiBo4AxU7kM+UZ9rUzEXctInCyfo8/uYVFiqXZfLTxJfFXBRI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_090502_408998_6534915B 
X-CRM114-Status: GOOD (  14.27  )
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

From: Frank Li <Frank.Li@nxp.com>

Add parallel ov5640 nodes in imx8qxp-mek and create overlay file to enable
it because it can work at two mode: MIPI CSI and parallel mode.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v7
- none

changes in v6
- add Guoniu's reviewed-by tags

changes in v4
- add hsync-active = <1>

changes in v3
- replace csi with cpi.
- use imx8qxp-mek-ov5640-cpi.dtso since csi use imx8qxp-mek-ov5640-csi.dtso

change in v2
- move ov5640 part to overlay file
- rename to imx8qxp-mek-ov5640-parallel.dtso
- remove data-lanes
---
 arch/arm64/boot/dts/freescale/Makefile             |  3 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso | 83 ++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 001ca3a12c0ae..3b9e9844f11ef 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -554,6 +554,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
 dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
 
+imx8qxp-mek-ov5640-cpi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-cpi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-cpi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-9x9-evk.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
new file mode 100644
index 0000000000000..9fbdd798f17d6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-cpi.dtso
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8-lpcg.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/pinctrl/pads-imx8qxp.h>
+
+&cm40_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ov5640_pi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "xclk";
+		assigned-clocks = <&pi0_misc_lpcg IMX_LPCG_CLK_0>;
+		assigned-clock-rates = <24000000>;
+		AVDD-supply = <&reg_2v8>;
+		DOVDD-supply = <&reg_1v8>;
+		DVDD-supply = <&reg_1v5>;
+		pinctrl-0 = <&pinctrl_parallel_cpi>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 3 GPIO_ACTIVE_LOW>;
+
+		port {
+			ov5640_pi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
+				bus-width = <8>;
+				hsync-active = <1>;
+				pclk-sample = <1>;
+				remote-endpoint = <&parallel_cpi_in>;
+				vsync-active = <0>;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	pinctrl_parallel_cpi: parallelcpigrp {
+		fsl,pins = <
+			IMX8QXP_CSI_D00_CI_PI_D02		0xc0000041
+			IMX8QXP_CSI_D01_CI_PI_D03		0xc0000041
+			IMX8QXP_CSI_D02_CI_PI_D04		0xc0000041
+			IMX8QXP_CSI_D03_CI_PI_D05		0xc0000041
+			IMX8QXP_CSI_D04_CI_PI_D06		0xc0000041
+			IMX8QXP_CSI_D05_CI_PI_D07		0xc0000041
+			IMX8QXP_CSI_D06_CI_PI_D08		0xc0000041
+			IMX8QXP_CSI_D07_CI_PI_D09		0xc0000041
+
+			IMX8QXP_CSI_MCLK_CI_PI_MCLK		0xc0000041
+			IMX8QXP_CSI_PCLK_CI_PI_PCLK		0xc0000041
+			IMX8QXP_CSI_HSYNC_CI_PI_HSYNC		0xc0000041
+			IMX8QXP_CSI_VSYNC_CI_PI_VSYNC		0xc0000041
+			IMX8QXP_CSI_EN_LSIO_GPIO3_IO02		0xc0000041
+			IMX8QXP_CSI_RESET_LSIO_GPIO3_IO03	0xc0000041
+		>;
+	};
+};
+
+&isi {
+	status = "okay";
+};
+
+&parallel_cpi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			parallel_cpi_in: endpoint {
+				hsync-active = <1>;
+				remote-endpoint = <&ov5640_pi_ep>;
+			};
+		};
+	};
+};

-- 
2.43.0


