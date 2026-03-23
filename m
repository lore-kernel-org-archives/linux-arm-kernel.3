Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91526F46120
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QRUiXFGV+EzrITNxMGgXV1L6TDZxT0VZaihtxvf6DI8=; b=ewAZGAS6c8xL7DMjVwXr00plf4
	hZKi21by8fw7Cnd/qPDjghcBBI8MqZUmpCyxCMWWn1Sc3CuTMVl8/802NUls893ulKRvfywF+X1RG
	oyikgkQ4sF2+TXcIu0lrgcuB6z6dZMoSN7zAHHN7G/Bmgu1RNzXAo2hjStNLL3psy2rtMXnZhn25/
	UKXIfU9uLJ95HBCs8N7DFwYMqhn3OsRPIAyi8FGE2zCkDb5QgebCJ7+Xtrtyf0mX7a2CDr/M0qn/z
	J08NFyW9XcAP7vODLw1g6hyJmGAjwXGHaLVzsUyZGtdZydBppEejH5ZUq5sW+D8fl4RYyigPmaWhW
	ZHjawA1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fnr-0000000GsUC-0W4Y;
	Mon, 23 Mar 2026 13:58:47 +0000
Received: from mail-francecentralazon11013002.outbound.protection.outlook.com ([40.107.162.2] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fnm-0000000GsRB-3esn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:58:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IxyTFcNUUkny4iUd/puRCoMlJXDSme/Va/junilCIURCf4b7hxuA2kYWd8Ce/e4CM6eKhnE06Any66yr0zOjBJ4DdkxN1sCW6dutZux3NuiEBXz1+NYdlEzSGjuT0qjffAZAiaxJFlv4QGF9YDQorE2Hie5IiMVpNVjeeFMlkqujlDHUVmAcBiPhT/Vo08UASPhU5mBPPLCbRhftiHPkzSR05aWrKnBQGab5q4eXudXLtoiT9mkW/eSWueJMJoqdZvRgtkao58JuCLjA+lKlTk0q5c9GCFgy9R5ZVAHHWCxkGF8/CMt8luC47OxtSc/BibVaFvPZvg/ETjbpE4bi7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRUiXFGV+EzrITNxMGgXV1L6TDZxT0VZaihtxvf6DI8=;
 b=N/if+j6o9E8dXAIvhUi6lkFBF4LBcvLtt+pEK3Q5j8zaF4eSvddoHdUIe1L4uxGaq5mPr6HkQYnBGbeR/Zd+34A9evtamYT8saWacqZwZA9EJcwIcEpcACXQTVSWa/GycF0rY3zeDmFkdWCIjrrGqD2sxuNIO0P1rxk8gdjerTdUjVUBvRQ5Sv5ieV+FUYI5aqIzpo3YoqqE0MpyKAPuExYN58KhsH0mo9VTBOmIHf2guwP+fJv/w9VAiXUtvAbIJATNTdCTVud1H8TYSg3eriPIE204HFkmNEdnm0I76z1/V7lZyw58KytyMqyhbfwylV6NEcSlyy6jUiB4/Cx3HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QRUiXFGV+EzrITNxMGgXV1L6TDZxT0VZaihtxvf6DI8=;
 b=KlwJCwsEmP72zw7WWN6ivEtQ7S5tb+GDa0QnTB2YYVgXwf/gHy8AC8wkXSALalcmuCy+4dWdVC7XIo5DX8sb74xuOR6S2D1yRjuRb2x6k2b/texEuZ3mjXsti8XAOfk3qF5RVT6tBNSXpUAvjeCTQ9LZisjQnW5B4cx9uxAqExaehKKtBlHEo/Htg4MLUtZtR784kErExbZlfqAswFq5hLSW6Fr07gY/ET010oaQ0NJP85WZFqOqJYhegNW+10bJ6kLx1/FdedPCTQ6oW0+Rpj7ANCvrkqFzViCPjEDwMvkgYPudKEgFtEdjfnMJC4B0MAKFCSclMcLe7YdphQcpCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM9PR04MB8354.eurprd04.prod.outlook.com (2603:10a6:20b:3b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 13:58:25 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::5c3a:1a67:2e02:20d0%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 13:58:24 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-can@vger.kernel.org,
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
	Andra-Teodora Ilie <andra.ilie@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH v3 2/6] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
Date: Mon, 23 Mar 2026 14:58:23 +0100
Message-ID: <20260323135827.2129371-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
References: <20260323135827.2129371-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0061.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::22) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM9PR04MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 262b3375-e452-4179-b074-08de88e4404c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: Qhc4sNUZV6aaHKUBDipWlwX6xemLeXvNGfBMHBapH75G37yIWOuQPE4Uk05fwdt0vj45qN4X0cyH/kV3kj81+uWAukWf+Vu/ASHUOe4SFFb0KwLNekhwGPSfTGjBDUuKIcYx+l4cnkNNRSf3R1xY9rqlvEoIVakbmHn9gXIi0b48+GMulBGSEycdIsSa0FhfSAUnWtNkqqfhcdpQrthnPb0io3xlmRpcSuSKlhFRjSGmb8igFFVPrZ5pKXmMQRkw7KGQRVrZhCqws1RNw/khm3P2G1I9SmunvCt36dliv9MMI9RuqPUrsg9vLAI+G/w3MYguihzMnOiU4nVcT5aS6NkmXiv+deVMMt3Vznk4drE7nqJQWzDPgF6jNQ0zetKNntxZQc3F80szRpLY5BLZCvVrTmXtS6bAyJ4pGGInLfBJfdv/y3WkY6FCSgdJOvs6bJq97KWSegpeZvpl8Gg/cn6mCB6tTO/SHRQ42DPbEIlN+FovVfJZX14MWHKaLjER1GU00+coENFLKBV6wRMfJJy5oGvKqboNlrY8CrqBPHkjKRBDB8ZG7jO+/BcxT3KOVwjBb1yUDhDnsa4xNlot7rDPInJid/KusK87e4tP1y9X8+dEBadjidTjQ+ZAYvjHgwEt3aqxhLyrmTdacFB5bFzqFWGDQT6WpbOAfZtBJWlqXeo5FB99R6l6mjzreKq7VqMKZtxIZd0x4xAvmC18cSXZ4UYNMagtPzUJcftvKyI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWZZWnN0R3phbEVISWRqM25TSGcrU21vdTA1UjJWVkdkVmcyYjB1blN0a0VQ?=
 =?utf-8?B?SWFhRXRJMFdwUTR0WkVCVGdhTGhYTmRPbHhocGdXUW5PQ0JEcGhUM2ltUzZC?=
 =?utf-8?B?NFZwM2h3TjloUFcvdTNXRVpKQmJNUVJZK0ZZeHlLbFJFM3Y5Vnc5Ly9TdGlx?=
 =?utf-8?B?eHd5d2p0OXo0cWFLUzhEVkIxM3gzZmZzdTNqK3lrMUhRTnFSTmhTbkZ4WkJs?=
 =?utf-8?B?MDR4ZkI4OXMvS3crN2RBZC8rcDhuS0RQRUVja3krMXk2dlZFbTgzSUtFQzRM?=
 =?utf-8?B?cWZmVUM5NFExRFUyV1dTWjdIcS9BNXBuQzRmRjFlTGN4U3BKZCtjWnIyZVh1?=
 =?utf-8?B?ZGNyTmVVZkhUeERteVdrNHU4VVRId25qb2NES0FIcndqcFpyeVYvV1ZCdE51?=
 =?utf-8?B?bWpvNjBJbjlWZFRlS3IzYnFFcXJFOTVxWGVZdzdRZGZyR2tMM21hUWRnY1cx?=
 =?utf-8?B?MUc4SHloMWx3OXhZY0h1MXUzSjM3NUQ2WHFjbXpOTTZnTDI1ZHVBdE1KdGRE?=
 =?utf-8?B?WWMybVYyMzFmSTh2bHpZdUhDbjRzQUhuaHV1L3FBSW5NMzE1cmh0bWlUS05a?=
 =?utf-8?B?UjQ0elk5S1hycFhiSUUzMm9TS0FIL3IrbmVSa01wYkhCemRBcHF2alNOSVhh?=
 =?utf-8?B?YUdBeDQ4VmZOeWpTdVZ4VWFGVkxMbDhTSjE1K1l5eWJqZE93ZnpPQ1M0Ri9G?=
 =?utf-8?B?Zk9jV0hOc2hrOFVVL1lwbE40Q1hxNUxOdzJhWlV3TGJITDlOb1dUQXZtSko2?=
 =?utf-8?B?UlVKRkV5OHFhaTJmTW9Ca1R0MlhXcGlxNVZoLzBwc2M2cTltM3RWT0lUdGp1?=
 =?utf-8?B?T0VZSW4rRUZzSHRQM2k2RmJ3QmREOW1yR053WHpJNFdVeXFnb2tCSGlDRkJx?=
 =?utf-8?B?Mlozb01yelU2OXo5dC9CbFVqdnJFRDZlUkhNRTltVnNvK1JJVEV6aWY3RGZz?=
 =?utf-8?B?TCtsazBHcjQvVGR1cUtYOGtlZG5ENWowbmhJRThIQmg3N2s1N0tWQkdQTHk2?=
 =?utf-8?B?dTZmaEdreEptb1dQbTh3bDcraENwbXliSkxVZXpNV2ovNDhWRkhpMGVWY1kz?=
 =?utf-8?B?SDg5dEtndHNHRTRhbHVTZ0NJRjRWVVlEdW9PVExEUVIzZ0lRelc2WWhFWVh2?=
 =?utf-8?B?dFNoZEtuOU9nWGF3c1pLdFhaOGgvS3ZyMUtuQTFJQjlOdXpvWUVoc1k0OURj?=
 =?utf-8?B?emZ5dXFmMERhSnRwNk92a2F0ZzBXMEozUlBxSzlXdi91S0R4TzVTUDU3eVk3?=
 =?utf-8?B?Vm1VQWQ0eXJIc1NzREhEUUZBNFByWXRjUDBoT0J6eXpDVGI0S0YvRlNZaXJJ?=
 =?utf-8?B?emY3WWc0UDVObUFzOHplVGg0eVBTZTlkdHd3eUdYZm96aVpZdUZ4aWJWY2Vr?=
 =?utf-8?B?L0swcExpQ25yNXNlUG9kaFNjOVJTOEhQTGRzQ2FaUUtQRHBjVkIxay8xOE1k?=
 =?utf-8?B?TXFYbHJ5VGlFaWZuRHdMd0p2TzFjaEI5WEwyOVFJekxUcG16aWh1eHBUYVVI?=
 =?utf-8?B?VmtMQkF0RXBhMkJ2Q28vUTZVZGN2R0NXejk4WFFTc2RRK0tLdmFFTUIxK0lD?=
 =?utf-8?B?UkdLQllNYjUyZnNVTlRvcFRGZHAvTzRKYzV5L0RNUXQ3UUNDWEJ1YUJZclI2?=
 =?utf-8?B?LzRaOWFZUUJXUTE5YmMrOFowajIwWDNYa1NQc2R6QnZJK1l4dE43L0ZJbldF?=
 =?utf-8?B?V3d1ZGxmMHgySGVFaWF5K0I5RW52N0IveE5maWUwZUZoRklYaGFLL1N6Tmsr?=
 =?utf-8?B?VWRuNklUQTFlNGRvZnFkQjZoQjN4aDYwMi9RbFl4L1M3N2FJTVdOT3FBYTdN?=
 =?utf-8?B?NFlpQXB0ZVVFYU1ibDNZSytiQ0lhQ1BDSGxmVHRrM3NoRzRaOWhWMTVlZmhz?=
 =?utf-8?B?YnRPRzh2bGdJMURqY1VOZXpwb3ZxTCtmenQ2ajNySXlLa3JKaXpoZnlQc0Fq?=
 =?utf-8?B?S3U3NDhEa3pFa1RMSm9oOFBsRjdYWEkzd0IzY3FEZGtwb2s1cVVNa2hXWTJu?=
 =?utf-8?B?d2JCSkE5ZVUvVm1rZytxdmFkWXFSQkEybTJ2WUVtWFFUUGFlS1JHWk1ZMWlr?=
 =?utf-8?B?bjFGSXQwODB3NXUxaEl1U29idUZnNGNxLzV4Z3dDYk1mOWp6TUJWcHpPTENt?=
 =?utf-8?B?ajdmOCtUNHB2cGY2eXMvaGh1REEyWFhyUjdYa3RPUkppbm9GVWhvWlFWa1do?=
 =?utf-8?B?b3ZEcElKaFN6K0cwTzNnMlNjdFI3ZFMvOEl0WmZqRjdMNG5nOGhrTFcwMHBT?=
 =?utf-8?B?eUxXNVhJYTBIUUtYZ2RaanFKMUM0N3ZIQWttKzFJbmVRbEc3cEt6VzY2eTk5?=
 =?utf-8?B?WDMwYjVIYUMzd1V6dGIvSEY0VnhSa1UrMWRCRUJWTVhkNjNrWDlNb3RnUGli?=
 =?utf-8?Q?NAss4Fkaok7l5BMQ=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 262b3375-e452-4179-b074-08de88e4404c
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:58:24.7483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcz2VO9/OkVAuQDze9k4vqCcZ06ccrzISSglF41jes1Czj50dZ7BTVcO86ksxD+Q/9LIO62vaSnw0U5EteKHrdtRkoA4Ca7uNo2KIhCpcVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_065842_908830_B992897B 
X-CRM114-Status: UNSURE (   8.89  )
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

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add NXP S32N79 SoC compatible string and interrupt properties.

On S32N79, FlexCAN IP is integrated with two interrupt lines:
one for the mailbox interrupts (0-127) and one for signaling
bus errors and device state changes.

Co-developed-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Signed-off-by: Andra-Teodora Ilie <andra.ilie@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 .../bindings/net/can/fsl,flexcan.yaml         | 30 ++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
index f81d56f7c12a..d098a44c2b9c 100644
--- a/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
+++ b/Documentation/devicetree/bindings/net/can/fsl,flexcan.yaml
@@ -26,6 +26,7 @@ properties:
           - fsl,ls1021ar2-flexcan
           - fsl,lx2160ar1-flexcan
           - nxp,s32g2-flexcan
+          - nxp,s32n79-flexcan
       - items:
           - enum:
               - fsl,imx53-flexcan
@@ -173,11 +174,38 @@ allOf:
             - const: mb-1
       required:
         - interrupt-names
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: nxp,s32n79-flexcan
+    then:
+      properties:
+        interrupts:
+          items:
+            - description: Message Buffer interrupt for mailboxes 0-127
+            - description: Bus Error and Device state change interrupt
+        interrupt-names:
+          items:
+            - const: mb-0
+            - const: berr
+      required:
+        - interrupt-names
+
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - nxp,s32g2-flexcan
+                - nxp,s32n79-flexcan
+    then:
       properties:
         interrupts:
           maxItems: 1
         interrupt-names: false
+
   - if:
       required:
         - xceiver-supply
-- 
2.43.0


