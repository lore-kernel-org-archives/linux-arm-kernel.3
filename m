Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C44EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oJsSx/HEoPwxVcCgWGLUI27XyrVQkgz7krHZIgH9oMs=; b=rnetXl5qO/LwNMQhNpEsn6kL6e
	Mjh0pOzSW22FgQiMMWG4XPm2DbXjvXmDykuFqQoOSI1QIGiZmZhgBqezW7lPMl1ox3fP7OpS6TdDo
	VY6h5LbYW0KuKiQ9rk5Nhq3bJXhPi37Q/cw200KbtCxqUby5Ie2P4cJejp2e2UJ8sbAD0cLV1Qdcl
	e2tB0WB8E5CqoFWYzxlhFSqZqyPB6UmeLtJmkngcLQkdzvN89RxInXlJXoRuav2ICf70mUOqko2N4
	xfgLVDOgOZYLSwtFrsiKnWTdtmv0j3VONWyi+h5VAIzZkynlaM4PbbhsznLc+1FeWntpwP4eOX7sw
	OsH4D3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6W-0000000A4aD-2Gtz;
	Mon, 13 Jul 2026 17:06:04 +0000
Received: from mail-westeuropeazon11011020.outbound.protection.outlook.com ([52.101.70.20] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjK6U-0000000A4Zc-3Ehe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 17:06:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x456DPZZ/t9mf8JNLetQLLFsqxpbIrrmjAPuNW8FgzZAOzbbGGqJ6J9fsXKhGnicyNvT2X41hZW1KAjUSyjbDXs2ZWGZqZYhFTZaJqujilyhaObMTjMYVeQGR4Q+nUTljthC1efKBzMzHsG8iB2iTUswFdiywloHcZsQL1r+9FrPpvsdm3XTP3HjbcAAh8GfbZUWgx/rMJWRWwdAgqUi0QCzmA/2i5KqTmtHA1AUHOL2GwrP3w7Mn0naznx8LL1jq/Vyj/39C4gZmVa57JgcvZd8I4Ys/xnVeICn+8uFKeG9JiJyGeHaKhSWFDhLLA6oySNvpaAw+1eFSCD6iwqKBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJsSx/HEoPwxVcCgWGLUI27XyrVQkgz7krHZIgH9oMs=;
 b=xc1XJgsWF9z6TMu42uYQsfXGfFexUb3JHQ4cOZa4gvmEMbrYjXj0zTi+EmErc6glPOoZsQtghEDaUqjEbqz+j+MpCWNtFVYW3z9pjtrq0ep0zA4X9teY5Zr0q5I4eJqQd2pdjoysoyBf7i0xvMr802JqC3OT+7NNy2d1MsyoDIPk+5CoDoUtSst/CrDUOYQQKorLROgbhcq8KmvbUBUfUp1fx2HIOKjxUO6itLSc2qd7uAavudChPEnawE4z/NwaRyb1Bkbz5o6z0d7uXiiWyLdLhOm2xGcKIO4aRTXagRq+IcVuYOY8voxafOujUt5ULYGr51xIjTqtL0c6nE+X3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJsSx/HEoPwxVcCgWGLUI27XyrVQkgz7krHZIgH9oMs=;
 b=tR//pdO4O3vvsAAxmlBsBDbDXNoiYQbVv4YB1J/n9WFZ5fULUm7zpTQPZBFA/lPXSgEp8Cenblt1aiG/8EohQlenV8SgamjCuEhCKxTRqyV35Dmhzg1rUpnWcw/suoBZEq38MjDrCwUK2WFgReC+tb9BBHefmFBLftNhL6Twn6OuYR1ePAF3HmRVRsDguLFVl5A9gWTGSixmN8Fgr5gUaJKvg/abPjEt9wLRicIV3OXXit1YhwxAx8+5Ul2v7v+3Uui5DF05/iAnM4M3NTx+Uo0N8gN8axHZcDuq5dIdXh42kJr5nZbuBvI8jkK67pogXNsdOZCGqtZXspJFp473oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10228.eurprd04.prod.outlook.com (2603:10a6:102:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Mon, 13 Jul
 2026 17:05:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 17:05:58 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Esben Haabendal <esben@geanix.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mq: Add DCSS node
Date: Mon, 13 Jul 2026 13:05:51 -0400
Message-ID: <178396234795.544810.12859518885796012821.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260711-imx8mq-dcss-device-tree-node-v2-1-037026d45c21@geanix.com>
References: <20260711-imx8mq-dcss-device-tree-node-v2-1-037026d45c21@geanix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10228:EE_
X-MS-Office365-Filtering-Correlation-Id: 2026cabe-2735-4d58-32be-08dee1010267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|7416014|376014|366016|19092799006|1800799024|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: gJkWV1LYp8KEj+qj9bJ/zhiJdBWNTsdg5jce6ZGPXhZg3bxc/DXmP7x4vsl4gWomBbysQSs+X04M847XxwVfzGd7cWbZueitN9GI52THgy+Jzad7sh/Y1wi3miTXUBcKdYm1vw/S2Wg1a0HIM8xoRibe41unT4JETu3OchtoKdvBkxrY5ZF0ttZRERWj1q+rxIWvR5dDLRKUbUasJDBqm6JLRedhwyPzkwLvj/t9QhPx5DC6FRyJ6FLCLroDOOf8BQZLTzSgOchd0iijyD0VTuf457BJnylLe+rpCwBNs9Ise1evDt0nX7QgdIfw2/wbORuWb7X5TG0JmnXBL9U7OSouH93dtDgc40Rflf2Ix+f/ZGP17PFhLsuKeyUHEvpr1fTDOqUNLNjMy6NMVAdFolNV5hyxrCCIe6acVG2ZfxtZKMQtUaZHi5egXz+by23fq1nN9tEr8SHEEYOFrQ4p2icy+LZdifsvsuIS3nE1ah1Rv7iCWF82vpqLM56FKpR7IXQdta7uipksZ9dEmsWKcM+EM1gB5ePefk0dBxEraUZOGsCWycfZ7VQCS2Cj00K6trUlkFxUTwehSWwF2CCo/u1jC+xYD10Ro0MrYWEv8vdx+e9jN6Wo7F7lBUra2lCS+mCTSE4ITeacNjl5CaOJYADh5qJIoAamoAYPM9LfEo0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(366016)(19092799006)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNaN3NEdUVyQXdLUGFmTUhQaDdjdUJaTTB0ZDNYZTY5VWkwcVdqeXVzemdj?=
 =?utf-8?B?U3pDM21taGNJYnkyY2ZtcHk4Q1FFUWE2MUhITzRTQy9KdGpTekRMa0U1TW1T?=
 =?utf-8?B?em03cGw1KzdhM3ArUzg1cGdZUmJrL1dONHlSTW1RS0prN1RUR0xIVFVrSEw5?=
 =?utf-8?B?bzVGcjlVdmo2U2k4UzJMUEpDWDJLc2MwSTd1ajFHM0tzTjZvZm1CUWdzcE5L?=
 =?utf-8?B?c1NwbGNsM3pDTjAvcktzMFhGeXlaSDErRFlZZ0xwM05PNm1UU3Y1NldyaHk2?=
 =?utf-8?B?REFTdGJZcEN3S2xMekc1Q0c3V09hNFlDV3J1RG5tZ0JLcHVwdlJlTnJzOG11?=
 =?utf-8?B?bXl1OSs1cHBCTk9xQlVKcE4vWHZxZDB2T3k2bDZ5LzJXa01yR21QcGo3NVp3?=
 =?utf-8?B?RjVqcE8yQndpTXNrdGNEZ3VRSWdsMHFOblNPNmRxaXgzd0h2ZFpZaFY5NmVu?=
 =?utf-8?B?TTdDQThEUlhHa1dpTGJUejdrT05UM1BRUEZNcVRod0xkV0JabkRmWVVOVGxF?=
 =?utf-8?B?UmxGRkJvTlhIQVpNWGpOcjEvZk5UdUxkOUwydVViaGxUekpIb0dRUkxEdTV6?=
 =?utf-8?B?cHMzSjc2L1JEQW5GdE5OZ3BneW5FMkhYQlNhVnYxK2lqSzE4eTM5NHk5eTZY?=
 =?utf-8?B?Yy80d016b21nZ2lkUWcySkdwOTRVUURwL0NZd3E5cTk2cjUrcnVIcnhXSDU5?=
 =?utf-8?B?NldwV21Xako4MGcxdi9GYzJsNEM5RjVod1IxT3hldUg0OEhaaVBvRXF4T2Rr?=
 =?utf-8?B?aXlvd1IyTEYwNjZoVW9hdHlQT29FUktTT1B4bVZlMDVHVjJqV01WYkkzQlFu?=
 =?utf-8?B?eWp0ZzFTV09Ba09tTEhRR0lqWjlCc1kyMllHZXFHdS9TTzg5MHNWRDVPZ2sz?=
 =?utf-8?B?VUhYeVM4cTN5RzJUaXdkdHRUdlRnM05jeDhIb2RBSmV4eWJxYTJ0UkV3ZlYx?=
 =?utf-8?B?aTRhWDg2R1ZZRFIvZUl1TktiaHVRRURNZ2hNcXcrMlJBSzdaazB1aGNJbDZ4?=
 =?utf-8?B?OTZKejcxLzAyZmRUOFFTbnFwbllmL3gvR2U0SEZrOXdlT2RHRy9BRVBDN2h4?=
 =?utf-8?B?THBSb3JWTjZicDFZZXJocGZla3pkMUlUTHB5OTdTYzdXU1BWb1pKYmN5T2ZD?=
 =?utf-8?B?V1c1L3FSaXl0enRldHJHazMzczhKd0dWRCtxMS9hRzB5WW02M3FUNlIyTlpv?=
 =?utf-8?B?VWxhOFFnZFRCWjBKTUJMMHNtQUphVTlISXV6Z20xTk9ibmJnSHBTci9NaGZs?=
 =?utf-8?B?dUh5RGEzbG9GMWowMWVTWkdCRGk5N1BJNms3VVJQS2s0dWxaZkFva25sZytj?=
 =?utf-8?B?OVdaQ2tTY3BXWG1QMS9HUi9nN1dRbWt2aW5kTklEOUloN0FVd0lHSTJpbyth?=
 =?utf-8?B?T2cveVBsSE5EelNNTFBSYkJDS3pOZTAxYlBOc29USXZWb2xuVVF4ei9JeEc3?=
 =?utf-8?B?R29lL0RPZGdJOXRiUC9KWHJHVENTcHVNclNuMVhURGpVLzlLNWNHMExDSEtP?=
 =?utf-8?B?a3ZVUXBYVklBNWNSNlJ2UnBabHpocmpxaklPOVZXU2J6M0JuRUZ0d2tCayt0?=
 =?utf-8?B?Vm55UW9CQUZYZzZFS1Vua2ZHN0N5RFNRR2s1TnpKcTVKQlE2a2dNSWFlcEY5?=
 =?utf-8?B?a2doUGs0V1NTWXlvQ1BxbHBvcVk0SmNNOFdXRjBWekhKTUgzTkdMNWlRV295?=
 =?utf-8?B?WHgrK1ZlbFFHZ3JoYkJmeFdHVWdJRnlvWjhNTjJsVFVOVEprcGt6UUxJN2JQ?=
 =?utf-8?B?UDBFaVpScnArNjFBTHl2UzRCTXEyanZxdmFxemVZZnFQc2ZnLzhrcTBkdUZv?=
 =?utf-8?B?bTQyWktxN1p0UXZEMUpNVVlmQlcyRHVQOFBmcGRkN0Y1Q3I2eUY3dHZPRDZi?=
 =?utf-8?B?eStJbHptN29oRUx2OHB0N29yZUp5dUlDVmJkQ3liUjZsNHE4eWxtenNHSzdR?=
 =?utf-8?B?bCsxalU3VERBekVuNGlSanIwcTV4ZHlzNG9mNnVOZGFzR21Sb2dnNmhEek50?=
 =?utf-8?B?ZEE4M0xzNmZubzN4TW1mSU5RMzBZOElGMWpxSjRITjZrTE1DNU1PL01tV1J0?=
 =?utf-8?B?Ym1IYUpJcTFjSnRreXBQQThSc3BRZ09NR0c1blZ6eDlBOXp0MmdiNzNwbHhM?=
 =?utf-8?B?ZkgyYlFPcStiNXVaaitrdndtc0NqTGtKbktxQ2JFTVFDOUIwcy9BTFFyM1dk?=
 =?utf-8?B?a2JyelRySnU0ekszemtzb056ODE3Wm02eW5NZG56SWVVMkVDMDJ2TGdQODlo?=
 =?utf-8?B?YWlrd0xmcmhEMlVGWmExdVFodnNld29nbm9OMDk0Sis4MFVhc1BFaFhGV0Nu?=
 =?utf-8?B?MTRxeXVhWm0rLzQ1TzRSV2w0eWJEbzNjbVNyN3I0WW1Kay9OdVBhRVE5eTVy?=
 =?utf-8?Q?B+3rYT4naSHZVLoA=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2026cabe-2735-4d58-32be-08dee1010267
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 17:05:58.6732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9oPZMIhjZeL4ubhsVl4qW8FlQ3ySOiBkoXFtHuMDZHvPkhYJW6niUxCK0U5EEyzKtJAzaNN1KogAx57YK2bUR0s3dYTVglZHV0SLz62khMF90KoIz4/rU5vEvUN99ieJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10228
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_100602_814401_F068EAF6 
X-CRM114-Status: UNSURE (   6.83  )
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

From: Frank Li <Frank.Li@nxp.com>


On Sat, 11 Jul 2026 12:18:42 +0200, Esben Haabendal wrote:
> Add node for iMX8MQ Display Controller Subsystem.

Applied, thanks!

[1/1] arm64: dts: imx8mq: Add DCSS node
      commit: ed93dafad1121ad5c8e48185789e4eee551a0434

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

