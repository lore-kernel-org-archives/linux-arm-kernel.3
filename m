Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDC1C2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=; b=AyWhWv6SsHk9w2xPGKoZ8Ct7Wg
	KBofHoIXxTiRw4x1++OqEpH4WMN9/WaPG4xrMRr/RgwfX1WxR5wqkEeM8fwDysM5jT+1Hp13Q9JAH
	9nSv5W2VogD/Echc7Y39UprecmmX93WOv/Oi0jKmw13UHIILkimkPt+NFBaxsz0RJKDZ0aN3D3qx4
	nFoaXKkLK+c1U9bNf7sqlAakYQzMlY65lEmW6Qb6bN6rbiC4Um1Gr2mhybUOYTgPstXKvLhYJ0Ahv
	66RjubGzZBMfDydtUZ0sPElW4gym810PYnDr8FfHDSD9Z718KJAdOVu7R3xdhFkYJZmwW8ZUvzemC
	IQRk5eKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcaub-0000000Af2y-2k0A;
	Mon, 05 Jan 2026 03:05:43 +0000
Received: from mail-swedencentralazon11023117.outbound.protection.outlook.com ([52.101.83.117] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcauY-0000000Af2N-0PcZ;
	Mon, 05 Jan 2026 03:05:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KqEAncfIQ1eCfme7tX4HsnAbRFArybdk3ROl19MNPKyRiCMdLMgIo+h7TS8W39VKWd6dCJYAVZyUHPu22SrbrFu4gfaB2EzMmygrhdHxUHEzw1qQqRFuicVujrDee36DMY3EmWtUxXtlVVZO+y/n/8OPcvbpPXfyaSE2zktA1HB7NdT2ny1yDt+y/lYb5vsp4aPukC5WKd6RnTlsHF5UrRufMbvWtMa40d9alF0H/k5iMIGk7JWbgjXfpwwk3qnF4xoM8nALWULQJt3qJsfSbFnfChvbXkXUAFCkIU7Gii3m/uzZf4+LyLz3M6XyX+clslZiPZwTfht2qs9jEE/9tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=;
 b=FqrnPWO8BG5/r62eQH8Sk6zu1T8LxU3gB29SJk+BHAQmS29muY5rCo+mhm8oT18ArjK1j9a8LJxKUGGwqetw3ACRm5c4kQHR3SGaZG9c0W3fHyw5vrxykGkBo0fqA3B668kMyP7Zf4MD1bkkMgbrgLCZYSYpVUnHb8Rb52K2RfujiDBMjeBLeRwTOQtmu/i5TSqLLV5kjD4WigofeHTDOFSQiG2naO0vbN6qnezl9iyoC5+HC3jUtlRN/HEh+LlyZEilz1WiDjj2L5byud23dr+K3H+bxQqr6VxfdaGOOB2zfbB8Jbjm6ufPZT9W7Sl9DuhLEjsb9uW1mu3oCJ8iqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=iopsys.eu;
 dkim=pass header.d=iopsys.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iopsys.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8w4f6Xe9RCgSiOF31ngEOzpKmqTqVXfAlS1iZOURsQ=;
 b=j5vkhMYzBBFCon+mFBCfRPZoNYBkYAO25+tihDujhEEsSwBeA1fPuqZZDrefL63jUttvQkyClsFp/uEsYP6s1zZFMZR+UzqafqF1V1RKs22R0GKsWkxGCQKg/8UMimMs+SEQFGChfDT8sqcrHpLSKRpxrIVAo/h356AGPrj+bwvpn/oS4wF+1Poz0NU2vSJixj3oCU2NHKZNUpDIXp3AKVPJN6FmWarSIY2z9sSf+6Gl4QnDRc3UPO0hGXEe44ljpu8G8JrHahaZY2/TBYInnqiJIicS4jWhMqZjZZMpIkfTG4P4OqOa+NG9Ki3KiiA0xqD3TFJfx945O+xeyNIhdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=iopsys.eu;
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com (2603:10a6:10:49a::20)
 by AS8PR08MB8492.eurprd08.prod.outlook.com (2603:10a6:20b:565::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 03:05:30 +0000
Received: from DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc]) by DU2PR08MB10037.eurprd08.prod.outlook.com
 ([fe80::3c7:6d2e:8afe:e4dc%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 03:05:29 +0000
From: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Subject: [PATCH RESEND v2 0/2] ARM: dts: airoha: en7523: update dts
Date: Mon,  5 Jan 2026 06:05:17 +0300
Message-ID: <20260105030519.4101456-1-mikhail.kshevetskiy@iopsys.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI0P293CA0005.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::19) To DU2PR08MB10037.eurprd08.prod.outlook.com
 (2603:10a6:10:49a::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR08MB10037:EE_|AS8PR08MB8492:EE_
X-MS-Office365-Filtering-Correlation-Id: b9972c51-0e7d-4e4d-2fd4-08de4c07484b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rLGcPnnvyqLTj2ZwdHZPyC/nBvBrFHSSvaD48b0KutKshoU6w8R6Ob0V52mB?=
 =?us-ascii?Q?VII46mYqM8hiKDz2UyG3+JfNr9XddXwz6E/zwHXuIVpZlVijgFxz9lkcteLH?=
 =?us-ascii?Q?AFFiYtZ/GO7fyHHucV+m3u/8XV2eQjTLKOOAPio5aA0jpwGHPqOUaNuAfiI/?=
 =?us-ascii?Q?Au1V3QmrZlP9wyoZLX1XRhQxl51XnZgkppvBW/smxe68BuvNR9cKDtc8M+w1?=
 =?us-ascii?Q?pRs0ijU5AiSj94ZzeBUirrncaiJxQ3UewRKT9fjTNVAZkO8b8+30Iv0/xE8d?=
 =?us-ascii?Q?BL+sgbWaxEwZO1sqx742lt2DowII30jiORoL1CT3xmbZU5cybE+r0aUVVfmb?=
 =?us-ascii?Q?7Dysl/bjL5d+4jETG5utedNJRE6nC78j2gYE5d8JKmME65nrr4sap9ZRforc?=
 =?us-ascii?Q?8q8RZPuPQ8KLtc/EMBDSQjEBSkF5ga/fSyY/0gPydwE0TT9rKOLw33HkTuVR?=
 =?us-ascii?Q?DcEfVTLngCdq8aZRhjFtOjkUN7fc1NvLhjL4GrPV74GecASvvDCkMcQKzYMZ?=
 =?us-ascii?Q?RLpEMLkZaj+ipOAtcQGnVBXHNOva1VwGe79TxQ+X+RFYKyHptwpDZUw/fBBs?=
 =?us-ascii?Q?rra7SsIGFbr3uF1t+Q0/eSDmfQizaEO/hd/T8ZVuWKAkQoviK7ZbZDRp1/cp?=
 =?us-ascii?Q?jVy8HISRpzTBt7rtnih2FHJBn45/pskra4DrwfJSdCcSZ00Ag8o+W1ocLXn7?=
 =?us-ascii?Q?5dyWWgBwqXL00d3iLflM8ZoG6PEpiJ4MlX8A6PYYDinkIBpG6c5xn5ogsRLY?=
 =?us-ascii?Q?GuCEJ5J9qvVKiMmAdGU1kJRFbLN+OqPb+PkpnootXsGmjsEYRmIfwtv/yYZa?=
 =?us-ascii?Q?iKEE8bhx3nTrVlFOzGZ8Dm3/Ip4NIM+mx5eWgriG1V1mwsO8F5vuCX4O81UP?=
 =?us-ascii?Q?ZE8wWkQqsdw5oXBtADepYozXdb+e+CUpMijGfrdOz7JMnDLVYH8vhypbDP3N?=
 =?us-ascii?Q?3hK7T9gBQro7OyEpHfBChVJP70QxeMnf+RLDkRiosoIhR//b23o/5zYgecfx?=
 =?us-ascii?Q?WBfUZpQN/GOvv/SSxbMY9RBPyX705Yi8m4tody0tuZmKCbdUM4PderYpSs2p?=
 =?us-ascii?Q?qlCja4BY1NHO3qRR3YwzunsOdiiYSLbu8b/IksfSCUWlwsGwyT8E1DiARSnO?=
 =?us-ascii?Q?+2DXL+gGS6ipe1KCxWlAOoZ+nIGLKR2quYomyEOWf6B6eJckiKcwiEGNWjnJ?=
 =?us-ascii?Q?lNFSLnE3rfkhPQcmvptEuyWbzIP01J2tnukPwky6q/cpbOoYMT13HMO2l4W4?=
 =?us-ascii?Q?qnPLeges6lafQC/5z6wEcHvkIlq32X6aiPUWYyX8OpX/Fca8wUM6McKxHxAB?=
 =?us-ascii?Q?uM8ZeGhRQh8xNVMKSe8GjI3PG9JQmh0WbQWi+Q9K0vuej1mSWF6OZ11jbU8K?=
 =?us-ascii?Q?/q1xTxh8q83bE/4rITVUwfQ0RvKptjAHj6yVIRIw6u96NiPO7FFVfa77OKw3?=
 =?us-ascii?Q?uN7ruNaMgWonyZXTK0yV6730NAKoM/o5Eyz1EvSCkpi6UeJ3kzBS7DZlGHln?=
 =?us-ascii?Q?kyEcFuKmaFrC961f4lIfhW0uti55Y6rmNZeD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR08MB10037.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tu1ZoTvY7X0NMs3KGRybfNbI/0QhZDjJcCLMPUowCfuz3vSwV/TK9lNM0SF7?=
 =?us-ascii?Q?Ka0w24KLSUFIVK4STl0tV4c9PmB75kFqQTYyCDoZK2e0GnExosS2LLd56Grr?=
 =?us-ascii?Q?Qp8MsB3I0YRkkoDVW5+UCm3nTqyhbktDg8+z7s1UVWnn/sR3HQFKQ4dDJiil?=
 =?us-ascii?Q?0VbxyShJ7jY/NVO5xjpGsCf0JjErsd5ABOBTus5WjYPzZyzZ0T/nFmgJG1uk?=
 =?us-ascii?Q?PmHobeU7+Mop3JeVMw8SgPGFmB5qHUTx/4Afb1edU43K8yIXeTKgv1hV6KNL?=
 =?us-ascii?Q?s2KFrIBHTok8vAre6SE1oIKy+Y4Y3YCJULek9qEMlDzdwJZHsNSCifxOLyss?=
 =?us-ascii?Q?lYiM2ZwClu/PK/hCkIstN3IBhdEHor02n1lA5pzhtCJYfrdnsIb72PA7fTSh?=
 =?us-ascii?Q?ZLkJniPj/gzf8BYzDcLLa1akwrEA/Qfb8wW4bA3Sn0yWDnKxcEGr/Gu9Pfi6?=
 =?us-ascii?Q?+tb3C0cvG/jzvbXhcIFX8j5RpnHiEtPb9/5sLZsc/QSHjB+U0AniYYalo6SS?=
 =?us-ascii?Q?n2vxiaWMfGcEzGayBsJ7YcRQDhQ39Lo4iNzpEXKB7BHO7pto0ygaJOH3zsKw?=
 =?us-ascii?Q?k7hGan2XMZEPKIYuGQoftAV+MSt9lejiCYRa9OmCkpcc0Dat09laDT64bwEx?=
 =?us-ascii?Q?ejvjSCy3HuNJxuOmfeDju28MauDZ7++DUoQmd2YRU4X+f8LsRSg72vZX0uqO?=
 =?us-ascii?Q?RgsO7D8goTxa68O+B/vPRQRbKPi/z+EEMWgzKFhLnfCOfZI1KE3yy+qQ/q8N?=
 =?us-ascii?Q?5DUAYUfPEEVU6afpIH+AX3k8j+/RVYflm1M21Y0t5B1h1OTQd4z6orAnY47h?=
 =?us-ascii?Q?1T9ntKigWOE2o0fi6HXiSyyAM3eUzbu3RAQzAFjIcqlNR9l1X5QVSPXCQZ+U?=
 =?us-ascii?Q?KTm2JSZBidS9apezc00ep8BG5w+3CGWhwtJaVPL3Iah42DoqAQ0LL17mSO9g?=
 =?us-ascii?Q?X/1IAsOB9pmz6g4JijTKyBtqhAzj3k9K9KpFN7X4cbZ8PMhhmX83LFZDjcZF?=
 =?us-ascii?Q?1v476je3BWzhjuO9sCvwtLkOMUvI55mQh6E2LxdvpzouD/nIU84j7VN9UrWt?=
 =?us-ascii?Q?ioSqSyr3TvJBNflOUtwi0rm8m+GbaSoYjLBGW6V6Jy/gl4RkL5FJKSrOJnXS?=
 =?us-ascii?Q?23iZQ0lDWxLm6TF8ZuJmCyJOcjd6B2K6O10tPk2uXEUTRSEMfrZeyBGjjdX+?=
 =?us-ascii?Q?oTQm9xfDHGFlK6fNbQ3ez5cuzviWU3z8r/K3I7dCBEigUxbPDWThJpyAT0YR?=
 =?us-ascii?Q?BvX3UOhWsoq9DEffoHPl9ufO88EoX6IIylj2m2Js33Lund5Dhs6LRQmC1kIQ?=
 =?us-ascii?Q?u+BWiwn31N6CNWeyhIn4jy4OOTwft8opacGj4ByUiuOlL1Xje/1Y3xkbtV+v?=
 =?us-ascii?Q?OEQuscDWa1lD+HHaN5Z5VZLODkncb+Xn9OE/XZUEsrkIvcYlZA8O09maSC/e?=
 =?us-ascii?Q?jNpEba2dnwnEp2POh8YpxBqBeyHcgpInlR9hQ3ORW55oKZO8c6u0Pka2RJhJ?=
 =?us-ascii?Q?Zo+heSP91uAX+UNqT77PSYgTsc+3quy9nU9yw+ZpCUg72peZjTyrIHHbF379?=
 =?us-ascii?Q?pWI+erVQUDUGJ1rBg1tA5Y1kGkSyvfvNS5qKXHSXe+QvW4nxeDAAKRqrPav1?=
 =?us-ascii?Q?2jt6fG0/fcbpiK3DsTsguF0l0xNKZoMN60KLURRcTkYS9bF9UwtEAzoPRbo8?=
 =?us-ascii?Q?N4j+CyZQg+mna8ljMQ7p1epTpMSI3l0TmomqtgrjquIqApsYZPBdG9bttbG8?=
 =?us-ascii?Q?gVm9KgE5YH1OGNVRYSd8J4S0PTrxgF4=3D?=
X-OriginatorOrg: iopsys.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: b9972c51-0e7d-4e4d-2fd4-08de4c07484b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR08MB10037.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 03:05:29.8054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtzV2FztZrhNmrbvII/kQp2LXSWYWa5vHfRz7A8hCpCGWyWnuonfHImJPoxLXRpZ1eQPgOuaY+dDrhcRUDhHnEco9+EGNQWexPBubTXH78U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8492
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_190538_578354_9EAF557C 
X-CRM114-Status: UNSURE (   9.18  )
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

These two patches updates dts for en7523 SoC with the recently (linux-6.19)
added features:
 * reset controller support
 * spinand flashes support

Unfortunately none of these changes will be activated without dts change.

Initially these patches were parts of the following series:

  https://lore.kernel.org/lkml/20251012121707.2296160-1-mikhail.kshevetskiy@iopsys.eu/
  https://lore.kernel.org/lkml/20251017201126.493496-1-mikhail.kshevetskiy@iopsys.eu/

All other patches (except patches from this series) were already merged
to upsrtream linux. This series just groups remaining patches together.

The series was resend because of no any activity for almost 2 weeks.
If it's possible, I'd like to see these changes being merged to linux-6.19
before its final release.

Changes v2:
 * update cover letter
 * update patches description a bit

Mikhail Kshevetskiy (2):
  ARM: dts: airoha: en7523: add node to support spinand flashes
  ARM: dts: airoha: en7523: add reset-controller support

 arch/arm/boot/dts/airoha/en7523.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

-- 
2.51.0


