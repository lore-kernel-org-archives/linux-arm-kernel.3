Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A94ACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 07:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6O/zHz6VHNH2clBthNEnurAD46ZT8OtXUs1Vwyt3dZ8=; b=IKvueFBrCb8OcL8DApEnjB1xUV
	OUa8GHwqMbuUrXC/vNmGtKJ62maOcIO25n1o/wiouVfWiXfcY0ePh/YJpMP4p7lrr3N1FUyFRtB32
	rXDqE4RCqJkWXuSOjtI2fT/81z5iPx4vceyj6l5v69dkeyx5CyAuIHepbJKqZs5/B1Flxw1Y0iIi8
	6EpWUFYNJgWvx+z6WdUTKzU4aDjDxDiquP7MS3F9QjcAcrVX5XPDgdeolAtQhoh3Y+leC2IgVqQ8H
	qpHmjP+TO+CTMZTVWmAYxqUKE/EtKonHzjVFkN+a2jnx270IHYHZaSreb4ezkMSeJK9YZ8gsYE9Jd
	isgM+XPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfnc-0000000ERfD-19ku;
	Wed, 03 Jun 2026 07:14:00 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUfna-0000000ERaC-0Mog
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 07:13:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDiy2OAcOPKU6j8rOvrorp1y12z2ZN8pzImifN37J5h/8ckcLT1DaxI4rOSyjv48BRsQ3w3VRkdQS88/7d1eKJixWjau3oKXEEiufwOHchSc42EYgfrgUNo2dGK53+Q73jJ67TiAoJ+gL8NrnqyGayJ9kO6hY179Y2XaHPJu/A64vu+3I4TxSMxjWNhvsnc/fyUGdNLL7nXkF1LMiFphxaw0kEO8aBcig2ZLfg82O2mqJznTcS3/WZX2VXvqLb09melvDRKXXSanoMGDUetSh6ysUoONAwstL0X3YrVMywaFB0DbBkjdnssck4JuT5oQUIop2ibKW4PU3axk/DaQAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6O/zHz6VHNH2clBthNEnurAD46ZT8OtXUs1Vwyt3dZ8=;
 b=d3X/xFt7oao57WrEdsdUR6Df3MhOURo/blPox3WolLZndw8fQV2AXdrYWN5YOkW4pvztXK+tw6bphA0HCzHth3hypV4b+RVH2cjMTAWK7YEoJxH4C8qheGUVv2zI37Lgen2j1nd/57O0Om8W4Jn5ki9Zt1s3znWBlh1TLD2uioFYXnscu+2F94KZtXHxJ22IDMgSmhMFMs89fJ7sLc/R0cG7kg2Ko6lkEesidn8ZHU98RAHrM2nR78N52hQDA8b8TaiF4zWXymXN7S+bVDNkyBX+O7YECQ9PxZughJ3EYPyiIzgg6cmKroi2579C4l+V3Wj4k3aE/bEmxfp0I6SnVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6O/zHz6VHNH2clBthNEnurAD46ZT8OtXUs1Vwyt3dZ8=;
 b=xON5SIeC11dng7ZtKLdyumnPGoqkuy+1jOp7iM7Ch/0nsrzHeWSixZe3JgM89A16Se9Fn2PGMRLVi1YgfzZqup+sWIIzO+fN+qAeSs6DQtBEXw5L6HSQq0xfvq2Buk+zaCZFLzGdzB5O+KN+OUA+LN48W1X/K0M/z4vNAv84YwFH7g9hmQxVYRRWTqRYpM8n1kb/jaweh6wHS0D1KDHRn/Yh0Vh/K5Bonp/RetjwB7b6xV+b8o5b9XsIQYyHOPsts0fXf55dERDk5Dsswfy+XqweE94hZk1TrFh37/C0u13qCxDeVckFml1CZ7xPEzNmOrLwLlqv1lDbyoYgegaNVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com (2603:10a6:208:132::23)
 by PA1PR04MB11406.eurprd04.prod.outlook.com (2603:10a6:102:4f1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:13:54 +0000
Received: from AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6]) by AM0PR04MB5858.eurprd04.prod.outlook.com
 ([fe80::bdf4:c9d1:4e3f:68c6%4]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 07:13:54 +0000
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
	Larisa Grigore <larisa.grigore@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH RESEND v4 4/8] dt-bindings: can: fsl,flexcan: add NXP S32N79 SoC support
Date: Wed,  3 Jun 2026 09:13:38 +0200
Message-ID: <20260603071342.641874-5-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
References: <20260603071342.641874-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::15) To AM0PR04MB5858.eurprd04.prod.outlook.com
 (2603:10a6:208:132::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB5858:EE_|PA1PR04MB11406:EE_
X-MS-Office365-Filtering-Correlation-Id: e1504c47-47d0-4def-aee2-08dec13faba2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: diLWSW4wVMpLT0BQJ4oIrF7diZ6hGlhuDtUSYxGT9UVj6fTqC273T380OOHw5veNRTW6Yg9lNI9PJpKR+ocHF/HnYPvmnwiRfJn1PEeRtIxL6CKpnEDi8azM2UtJG/Q2szPsqyBV1gtM4Lo9YNDYK22NDgZXd/Ns0KSRxwD35Yw+NSfYCY3aFpjW6HW++iM1fqo0ZtCZLXqDKZWl2WPJoH/qFZIzkal72Nmw73p0iRg/ZPW/0/LassEOuP1p6UdgpF2rl4rC36vasyMy+j13u8jatXgdTMM+wj3jB3o/VZ4APk/9LZnG6YwCmrE/31ZggED6R89ccVDqn9q/OZrtky09I/wK16c1460EKC0kYBkn59PU7wzCRjrvAWeqWaiEn1pA9VHzha32AeQJ6LWhbx4/w4nV4iQj9BrFTzRMMslkHSzGO054TAWdtbheh+BaRMRQvaJVSaeyDhZt5ySK9bNfSxr8zn2zMwvyATtRTMbBHN3idM/FbWJkqOZ49+N1F1ri9nD6WJEvz0J+xO9zbJxk3j/FOtqBTCLO6nk04TszFVfMTWGvy/935saJE5FMgZR4xN2uA12nN4Ku+7b8WhWG5OKUvryKvDz7MSjyomp1dUHl/IZNcpIgHjOwBg+VJri/nDkefSVMWiFhuez/MUVkPAwVQZCAQYLS02TsRi1YbJBEVd+QInc7uHcduSbQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5858.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWc1TkptSGoyem9jOFh2T1lHdzgvdU9EWkFmTW50L3lNUjh4R0FmeVR5d1V4?=
 =?utf-8?B?S0xUUUhXU3VHS3dyUU1WdEpQQitUNHlMb3ZGOUxoVnRaVDAyUi95VHM3dXRs?=
 =?utf-8?B?Zy9LM3p0TDhZeUo5WncrSlhlYjIvVnZEMmZ3NDFZSm5qN1ZmSzlpMHBxRFlU?=
 =?utf-8?B?TFRIY2RBaFpZcWU1dHlLZlJtTEczcm9PK0puKzJCSmhlMldwSzBqemFUYVh3?=
 =?utf-8?B?MlJ0TFR1M3JJaTFvTlRNczhTb3dxMTJlZDdWRis4cTd0ZExwbmFXdFJqS2Q4?=
 =?utf-8?B?Um1acngxT3NTa3FNeENlbUVkYWhCOWk3YlB5L01GZGVLbmpwemNwazBndUpy?=
 =?utf-8?B?eHhCdkt3K3graWdNcUpVdmJNYTlJWHVBOTlHZlpHbE1RSzQveUJQNjhPUGpo?=
 =?utf-8?B?MDhyZDN4NU1wb0ZqaG9UbmVRckptK2FSS0RVZG5wdlc3K1ZIN1VCQWUxeVAy?=
 =?utf-8?B?RWdHSXJxWG5vWVhoU3AzK0ljU0NkMWlvdEp5UzBNS2N0ellpSThtdVNtRE84?=
 =?utf-8?B?eTRBaTlOb0Fkc2NmMXViY0x4TkJPeDRKbGJpbjRldkgxN2RRdDV3MnR1MU9G?=
 =?utf-8?B?d1NFcE84UldJaGxSSzJ6NVVLQlA2WjR5TVdLWDNUR3NuZTZqQ29rekxyditu?=
 =?utf-8?B?ODZ3ZzdUNmNaWXlnSWZkSzFTQUFDNDlNZFk3UEZvVlFDVitXZWZpMXU0VENt?=
 =?utf-8?B?NURmQURRdEt1K2NDeXJjY0o3K01QSHhLVTVyUXk2Q0w0QVUxdk1JM0JYMDRB?=
 =?utf-8?B?S3FqeHVFakJjaVpFdFFFenVITk0yMmwyeDFTbGp2TzF2bTFEWnNwdFFKM3dL?=
 =?utf-8?B?QW5oN09MS1piQ29BMjRxUzhnQ3IwUi9KdGlpTTFrc09jVkZjaWdGY3hpaXht?=
 =?utf-8?B?aFdNMzVTRzMveHB3cmhQNHp2b2tWcEo5SmNqcG8yUjF5bExCYWNDam96aDZL?=
 =?utf-8?B?YXBHd1k3WXJMQTlCK3lZUUhpUkhybHpqUmVvL3dDcXdsa2R0TEl6b2V5bXRn?=
 =?utf-8?B?T3FlMHVzeCt3RE5LemcvUjZjUWRUdDZmeGlXS2JZSm1RK3dNdlQrcjlrclEy?=
 =?utf-8?B?V3VYSW9vTkI5OXdseU90Z3pkSVFTbDJnL01kbVBKRWs2K1lWTzBqd1F2VnIv?=
 =?utf-8?B?ZXkvazJWUWc3N2Yrd1ZZSWZqSnVKNGJnRlZjVXFEQm8rRGJsT2xxUitIeUgy?=
 =?utf-8?B?ZkxTUUVvdjJBeU5zeU41Z3VIV2dNU2dland1Ym4yVDAzdERuazQ0ZTJEZWN2?=
 =?utf-8?B?RGhZZUNYV1gyQUVicEd3ckxuUHkwVllldFk2dnVOODkyQWVLcVd4NllhZjFa?=
 =?utf-8?B?a2MycTlFZ3Q0RHcxR3JCcGdCNXcrdnNjMVZaZGwvRUhXcktkeXB0SVlSTWV4?=
 =?utf-8?B?dTV6SHI2bUtiM3JaNWJpOVF0dDBWWVR6QTlWeWJjSlNmYWtMRk5TVmcrWFpN?=
 =?utf-8?B?Z0RpdEVoRGZWRUN2WUdMb1orT0xLSGI1S3lReWdqNTlTSWFWTGhtUHNSMTJm?=
 =?utf-8?B?UkN3L2pNQmlTZDhQSmJaekZvR3p4dUpFVFV5R2IzY3R6dTBsRnBkZ0oxeGpt?=
 =?utf-8?B?d3ZyaklxajJWR2VMSStEdzBKZm9kc1VaVWhmNkc3NmE0RWN0OGpPSDJhZnYr?=
 =?utf-8?B?L1JTRGZiU2NmakRuMVpRRGFEQmNOaU9zQWVKK3lXK3lGWGVwaVF6NWFkSk4w?=
 =?utf-8?B?b0EwWks3NjJLWHJta01oL3ZRemw4TzNMNmJSRHdlMWxRekRISzIyeENQZzQy?=
 =?utf-8?B?aHpId21yY1FLNHo2TVlMZXVKUmdHdllweFJKZFpxbDU3ZGkwTjJFV3d3WHZ4?=
 =?utf-8?B?UGdWQU1nT3BXdWFtaDhXU1A4Y0Y1ZmcwTWx2QWlzR2crS3JZalJYeEZCeGdY?=
 =?utf-8?B?SFA0bnV2cWJxdnN6SVJHSjVFZXRBUUFIc3BIc2JrOUhSbFp1R0FLbHZlMUVv?=
 =?utf-8?B?cEI4dysxUnJHZWc0VmI4ZjV4MjlSMG0vd1dGL2J4cXAzbnBiSis1Z09CV2Y2?=
 =?utf-8?B?NDBqVmJKVmh2bWtuM0FSZmZRaStUUGZZUFIyejQ0cVNoUG9RQjhUYWdIekZJ?=
 =?utf-8?B?QlN0UUE5U1AzQ3E1dDZEaGtlL0c4dlRFeDlnTXh2TU5OUk80czlyNU4yVlNK?=
 =?utf-8?B?bkM0ZDgvaGF0ZWZ4K0I0cnhMUTUrYXE1cjNqL3ViSFNYRFdjSG1KUDVCeEsx?=
 =?utf-8?B?REhGZW5OTVM2NHFhTi9SV1RLSDBVc2YyZXJFSWdPR3hMZ2RMSUExdmlLcGFu?=
 =?utf-8?B?VStDUVYrUGh4T0pUa1dBKzY1OUNJQWF2bkhtc0lvcDlHZytzMTVzdm82Z1pD?=
 =?utf-8?B?Q0g0WjZ6QUxBbHdRWUVNVnh6RlJqdXlNNDNzL2dnMGxLcG83YWZ2S3I2Mm1Q?=
 =?utf-8?Q?86gT+5o2SNbXfkhM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1504c47-47d0-4def-aee2-08dec13faba2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5858.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:13:54.5280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwWRksdLZ803CpyD4/659P2EtJBu9V5uqWZvIh+XylvFQhmVP/vXKp/C2cUolu/O+nevQJ4cMQsjAjrUBoBt3R++GIB6MktF2vh1JpCDsY0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11406
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001358_151077_8424E654 
X-CRM114-Status: UNSURE (   8.79  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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


