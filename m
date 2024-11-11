Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88049D12D63
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 03:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWEq12+o1/GmHr090GhGfb8iCz6vV3+rhIQN5YY95Mg=; b=Xrorogne8X1Nz08oXoTlj6UiWq
	cFJTReGp5WO5abbxTqnWoxt+9TeCkRW6aZTi9wn9/xdCmed9hbAHXk8vueUD19KJinwFotmlKAM+i
	ecN6Qg2o0o/oyA7C3l/c/u0HperxMUeKcQjgm0xwUzihqTevUuSmhD+/mh4s3fGza2CNr9pJ3uAmU
	0FKfV6GGADkS3WCR7BzTdu5G7/aRpKmWClJm+lVEjKoiT8vcj9PgdpFX07GiLIxsedCob4kfyB/aj
	h7vYIUv+7k902xDrybDS6fqqs00kbkpPLmPmrj0MQ7isZ2AIjn4SDuuS/uhKESlDmNCX1kKeolkzS
	uJFs4B8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAL8C-0000000GEC5-0zKQ;
	Mon, 11 Nov 2024 03:30:24 +0000
Received: from mail-am6eur05on20605.outbound.protection.outlook.com ([2a01:111:f403:2612::605] helo=EUR05-AM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAL5p-0000000GDvQ-2FOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 03:27:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jQ4acYLY/KFnp4MDh3pyp+H5qQN0mB1D5G2TJliDcaJvUr+e8POkQXW/0mICUpyFkmamVLt22TDt6sIz74jeAO6GTzHYZHZEj3VKTzrhY43BhSb5bQm3HyYJfzcCSMDEaH3Xu0XCN4OJqvgN/NIMam7P3+51Dq4v1+sqfDgbdbu0rtSsvDTqg5rB+cawl1vsPCT6hjrAmEekdnu/l12CfY6YpF7y/CSXA8wfSsw0B7aQIC1W/mI4f2FspcVSYDpFy1OiSLOmSORe3ekrlr8ujJiJ6Gk9OYbQ65QFSdvP8UwGFTTquhc1grY6pL8mxnimto/ZXr/GASf0Bf82UceB2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qWEq12+o1/GmHr090GhGfb8iCz6vV3+rhIQN5YY95Mg=;
 b=qrEXVROMTgaDrPFUIe5caxlL+h4Vvb5kawQHk4ciRwkozwcN3jScPrx3y6krIIRdfwGnvbvW1n6nljnkW8tlYg71gGTc3E+mwUunrw9Xfr2hE2oVbWOzHGj4y5Q07Ktbxodp1652g0xQzgXZz8isu9GGVN0xDR9Fybj7orGwNQJi4W83tugfv0RPSTPvC3zXBNVA5Bdtff1SUb7eEJEyVVwPw3sJ9gPW5nGwDOk0w3BPjwEYQTl9jGILfRj5fbUnpEDjwBt1tWGqZUxMu6cVf0zjIOhny/wyqdCYG8RewTePxmPW/PTTomHwlpdu6U8JjSFRQU432WW7Zv4lej0AKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qWEq12+o1/GmHr090GhGfb8iCz6vV3+rhIQN5YY95Mg=;
 b=UltMUqlFXr58SAfX901p8CwPhQ8WGPRKy7W6cLximWnGD8PyEEt7hwooHwt9Dio1qcWy5seCbWzledN71/3fwZqz6H1XGm9DjzoLeGx8c3DRX8hxAvVF9AdJLDGaiD1IrVcLBdTMz+QffLrXbgIxt1NxjmLyauz6lkcYNRpUCs4BElOtN1DbEaB2ZgtjvjXQ2stbKrPyEy5vRyPKcdIW+TkCAygdcqzm3s1sqVv13shCJnQizuNV31XM+S/65RcEQGMfKOdKebsCGbQOyau6jT4Va2uuiSk9p8YPy1xdUP6UkK08AINlFzxkRVfHkz8rqNlFN4MNCfgW6fm7wpyfHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com (2603:10a6:10:127::9)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 03:27:53 +0000
Received: from DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8af7:8659:9d42:bd84]) by DB8PR04MB7065.eurprd04.prod.outlook.com
 ([fe80::8af7:8659:9d42:bd84%3]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 03:27:53 +0000
Date: Mon, 11 Nov 2024 11:27:01 +0800
From: Pengfei Li <pengfei.li_1@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, joao.goncalves@toradex.com,
	frieder.schrempf@kontron.de, marex@denx.de,
	hvilleneuve@dimonoff.com, peng.fan@nxp.com, m.othacehe@gmail.com,
	mwalle@kernel.org, Max.Merchel@ew.tq-group.com,
	hiago.franco@toradex.com, tharvey@gateworks.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	ping.bai@nxp.com, ye.li@nxp.com, aisheng.dong@nxp.com,
	frank.li@nxp.com
Subject: Re: [PATCH 2/3] arm64: dts: freescale: Add i.MX91 dtsi support
Message-ID: <ZzF5hSPNJQEOc9tm@pengfei-OptiPlex-Tower-Plus-7010>
References: <20241108022703.1877171-1-pengfei.li_1@nxp.com>
 <2350046.ElGaqSPkdT@steina-w>
 <Zy3gXvuWb76beZKo@pengfei-OptiPlex-Tower-Plus-7010>
 <10563047.nUPlyArG6x@steina-w>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10563047.nUPlyArG6x@steina-w>
X-ClientProxiedBy: SG2PR02CA0057.apcprd02.prod.outlook.com
 (2603:1096:4:54::21) To DB8PR04MB7065.eurprd04.prod.outlook.com
 (2603:10a6:10:127::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7065:EE_|PA4PR04MB8000:EE_
X-MS-Office365-Filtering-Correlation-Id: 9caac4cf-f2c8-4424-1b22-08dd0200d3c7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|52116014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KIMOc0CN65OsXRfpypk4STnL0RZFCjNPKiTNquqdbnjBlkyAgm3ZGsQqd5kR?=
 =?us-ascii?Q?vUdKAkjcV4VoCQdZlZ34hgQyeyuvQiidIBJ06MOcXQlVCi7eztQq6jSPVh++?=
 =?us-ascii?Q?wy9Pgwx9721Wbl6wCctb3BAkDQYaoqXfe8ZRpQYo4of5RFJKbEhnB9v5InUF?=
 =?us-ascii?Q?tX7jzxR7dYU5DCiGMnX+khKBfN3X8hZUrnd11Ellkh9LFOFx9KoUY8uxtqhu?=
 =?us-ascii?Q?UhQwH8AjCvVWJHxIdSbvlWkJLQM3gT6ROpXn/fsPOoMO1FtVUBya63Ti+dUN?=
 =?us-ascii?Q?OEayfLxucKKKGoeAWcuxTqP/9eIonjWUUbt14Xaq05Ek+S9FVigAi7hXWFwo?=
 =?us-ascii?Q?cRoIKW83b6rjvjBwtJdIplb55mG24oRMB4OnjFfsGdRMzWujOBjVCV1X0xz0?=
 =?us-ascii?Q?b69CnmuHCclN5DcsO5Oq+6nwCXnX/UfixuG2ESXMOqNkud4iE7FOOlrYKy0N?=
 =?us-ascii?Q?W9/ii176LwlJxzOcnxTpPeRuJZavOywcVIKsO9Gj9ZZOUCGKKznbaP/3IdfU?=
 =?us-ascii?Q?XmtbiyllTMMWR7gsNVtbgAu4cnsHWEAdhYUNBmNMRX9kKAJzr+80UClCOH2H?=
 =?us-ascii?Q?aNLJpxyMH+XLTbNFVp2SQKQNJsy4DV2uyr1WEtqnIaLiMcmmKOdKF6ChBZlL?=
 =?us-ascii?Q?grq5nCQKrC8sNAmFmkRqcTbaleJlnou2zDJBX7lWFxaQeJcwzCpmnPWmiW/8?=
 =?us-ascii?Q?JC7ISA0Ye3dP1lD4nm+WMSZCmfH/tBqAyLajzjlvoIpN5AwnFooYJ74dIr/B?=
 =?us-ascii?Q?Uo1Rq1wf20deEzu+yVWzuARkcxJ0lFNhWGU/MxFTVS7fYVU8jJ/pAksBG5+X?=
 =?us-ascii?Q?9OuG/PeGTAYU0bfLuPUUVlmHKvEUEdBp1lO7Atlbunnmw6UbkTL/tXHyL3pn?=
 =?us-ascii?Q?hp0Nv0zP4LGIAqGaAaR8HKb6XzjYLYWEQtTRnZY5UZ122pUym4GNa/JLCP8Y?=
 =?us-ascii?Q?ie0kYy7jodt0yAYNg/VEXa/yCya532KaHFKnnBOPLwLrvyoiAbIGFPb2Squ0?=
 =?us-ascii?Q?MpvbNJezuK/TtysOBqkw9UPBHA+X0pAwsdqlAX1E8mkzRfUbUtoaUaKlwWPD?=
 =?us-ascii?Q?vsc8j68SzFZvdaWBZP+Ir7ziNevxxxN9UCQpPdj2fHL1XWKNCmKh+HFxDJe7?=
 =?us-ascii?Q?+6dIRLny3FtEsEbZagez36bLsNW92qJOSK/QGqwx/G1jvfbQ5KMEJEA36FeO?=
 =?us-ascii?Q?7DXn5DQzMgS4e4iObtqBUE290/XsrbQjmnGPzx5TjsFDXiQlhFfSl3gVX7g2?=
 =?us-ascii?Q?/zFeqnjhmExChK6bcM9g/mNlKpV1hYAbPtHN94UrJkQQxgnuqDOZtyHKY0RP?=
 =?us-ascii?Q?5zMb1v6D+yKB7YiHH3z6Cjw5idOejNHcsJKTsVmvCfyJLF7KuAPJrIGq/3PW?=
 =?us-ascii?Q?4SDsLhU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7065.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9NevOCJTVW18G0VuoIR3hBRv33LpMe094553zTSt1WHhB+pxIfHKQuaOMewS?=
 =?us-ascii?Q?Md16Q0F/+8ZKjibFSe/zkIyF0L++eFK2ek6E7736cEzbPWR+dKSKZynoQ79s?=
 =?us-ascii?Q?rvSsgHtEPfzyzmrdz0VzHv8djlN9cZ7M19uLs+OlC82bFUsYt5sIWiuX0DSE?=
 =?us-ascii?Q?wmN/9gljUs8Jx1n2T8lPOrwGFzMs7jdc2EEpt6OOgqIGe4saDBIDw30uGD2k?=
 =?us-ascii?Q?9m77gUHV6hKe40cHMWV/tSfbJWZvOslr3RkxA7gF9YnTrDVOEVzzoAfhPv1U?=
 =?us-ascii?Q?6Ji4uhGUAxW4EQJgvJdDrOZjLbsnMACuIRxcux9eHQacRsJ3G2DxVvs7iBsf?=
 =?us-ascii?Q?UxBmNqDf4Jhj36CN6CuL958JfPUy9KZ6MyuqVKGyr+GxQeDK19iZkQ7kX6U1?=
 =?us-ascii?Q?BEcBU6f8Egd1uhOrnN53c7euoRW30BUAo2Lv+eZRUZc4xUP1HDxBi/EHrvxB?=
 =?us-ascii?Q?WP3ISALl6H3mEhp9q68OAQwAw8fs4h5OFbDnjNHdpB3pAGQqA5asZVuZlZHw?=
 =?us-ascii?Q?EPrEg1nN/G7+YBOzfuzxt93u/zv0VXFvc21v0a1L+qRV9dph7AeUFv93vixM?=
 =?us-ascii?Q?dZS2I05DJR/IUk2si/F9f5SMTJ7W42OJoHCxOCFjsf0XVTnWHi8Suj6jwiLq?=
 =?us-ascii?Q?AXBCVwxtvuBMXrzz2NaLZS8JSqeTlz9EsCAK1zZlbLMMNcw3gGk0mdbpJbhF?=
 =?us-ascii?Q?ej7y+HHLFEMpLyh9JMTsLXQsVtdOcf1vhJWtjWpSNFDktiIY5Actnch6W+UM?=
 =?us-ascii?Q?5Xfur8yacvtkaF4ID5+vsB5ccdBgnSw+ee9jVTPAiIeyWPF/1rTAT7bLLiLn?=
 =?us-ascii?Q?58LeoXJGvZmjZ6MggKFWMKVeP3ZjV8RUfT1yLDPVAWRbqusOja3TjSKC81ht?=
 =?us-ascii?Q?BZW3q/h2H2SehqeoAyXY8yvMWVJP8fvlGaQ2mIZd19xhQ/nU9uf3nHKS9DGQ?=
 =?us-ascii?Q?cYcPLE+J6Lq1M/PW+9YOJQC1MWkf+tZW4jFFMlPHdEJRbXOmkldsJs4ZbNna?=
 =?us-ascii?Q?1iEq3XmfBFW/TlobI2tlyPUBqlex0h0dAMXWA3dZWeCPu2dULMd24pVn2R3J?=
 =?us-ascii?Q?3uO/qKXHsG/a7lnlobikkd69VWbvcQ87Lhkxur4+jmzo7bkTlQK0DzVVhBNm?=
 =?us-ascii?Q?GLSFdych75VBTET7Epjv1ZBaR2/dT0bxWwrGgT5ztkIAvSKWWl9sRlt8jVMX?=
 =?us-ascii?Q?AIL4qDy6ENbPMG4Mc9Sz+beifyIh7R9fodrWwtOx2jer2MEN5nHCKssz/iPP?=
 =?us-ascii?Q?GtBHetM2ttbUPSJzGGwtd92jvu9i9txrUcPeZzjT13m4aRrGxdhVGslhaHca?=
 =?us-ascii?Q?dT3L+xMuBVY8fX0xffXC7rCxsAULwQu9aKZ3J/7lR4MHWytjLNn/THnNxL5i?=
 =?us-ascii?Q?tRyk+R08IcG9g4cGr5gdWWV7UC+jq5rz5Km/iEm/3TH+Fl1cvq1yWo99YkPR?=
 =?us-ascii?Q?Jcuat800WGVvWB/SCUnDQqm82NKd+88C+GsPLlNLMC4/Ahkcs1BZqcWAfWYf?=
 =?us-ascii?Q?fSU5AEFVWxickVKTaeMJHqj8+6xsaj+46cGM2+CZ1pBXGDYSBXFjRhTbWCeq?=
 =?us-ascii?Q?DGHVVmXQ/2XqKws7C+h8kT4xd4MxETUFkuZJNFg4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caac4cf-f2c8-4424-1b22-08dd0200d3c7
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7065.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 03:27:53.4791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 79AKCPu9ZVuTzB5l0JrNefEe4UBDwzLEI1UslI2swyDWVFFq9sXPcwLt/dQ8Py98XfYusUNVAqGd91BMU7+Qfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_192757_607139_21D5756B 
X-CRM114-Status: GOOD (  35.09  )
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

On Fri, Nov 08, 2024 at 03:04:29PM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Freitag, 8. November 2024, 10:56:46 CET schrieb Pengfei Li:
> > On Thu, Nov 07, 2024 at 01:49:50PM +0100, Alexander Stein wrote:
> > > Hi,
> > > 
> > > thanks for putting me on CC.
> > > 
> > > Am Freitag, 8. November 2024, 03:27:02 CET schrieb Pengfei Li:
> > > > The i.MX 91 family features an Arm Cortex-A55 running at up to
> > > > 1.4GHz, support for modern LPDDR4 memory to enable platform longevity,
> > > > along with a rich set of peripherals targeting medical, industrial
> > > > and consumer IoT market segments.
> > > > 
> > > > The design of the i.MX91 platform is very similar to i.MX93.
> > > > The mainly difference between i.MX91 and i.MX93 is as follows:
> > > > - i.MX91 removed some clocks and modified the names of some clocks.
> > > > - i.MX91 only has one A core
> > > > 
> > > > Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> > > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/imx91-pinfunc.h | 770 ++++++++++++++++++
> > > >  arch/arm64/boot/dts/freescale/imx91.dtsi      |  66 ++
> > > >  2 files changed, 836 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> > > >  create mode 100644 arch/arm64/boot/dts/freescale/imx91.dtsi
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx91-pinfunc.h b/arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> > > > new file mode 100644
> > > > index 000000000000..bc58ce2102b2
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx91-pinfunc.h
> > > 
> > > FWIW this is a 1:1 copy from downstream kernel
> > 
> > Hi, thanks for the comments.
> > 
> > Yes, it is same as downstream kernel.
> > 
> > > 
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > > new file mode 100644
> > > > index 000000000000..a9f4c1fe61cc
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> > > > @@ -0,0 +1,66 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright 2024 NXP
> > > > + */
> > > > +
> > > > +#include "imx91-pinfunc.h"
> > > > +#include "imx93.dtsi"
> > > > +
> > > > +&{/thermal-zones/cpu-thermal/cooling-maps/map0} {
> > > > +	cooling-device =
> > > > +		<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> > > > +};
> > > > +
> > > > +&clk {
> > > > +	compatible = "fsl,imx91-ccm";
> > > > +};
> > > > +
> > > > +&eqos {
> > > > +	clocks = <&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>,
> > > > +			<&clk IMX91_CLK_ENET_TIMER>,
> > > > +			<&clk IMX91_CLK_ENET1_QOS_TSN>,
> > > > +			<&clk IMX91_CLK_ENET1_QOS_TSN_GATE>;
> > > > +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> > > > +				<&clk IMX91_CLK_ENET1_QOS_TSN>;
> > > > +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> > > 
> > > Is it just me or is the alignment of new lines not matching?
> > 
> > Not sure about others, the alignment on my side is correct.
> > 
> > > 
> > > 
> > > > +};
> > > > +
> > > > +&fec {
> > > > +	clocks = <&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > > +			<&clk IMX91_CLK_ENET2_REGULAR_GATE>,
> > > > +			<&clk IMX91_CLK_ENET_TIMER>,
> > > > +			<&clk IMX91_CLK_ENET2_REGULAR>,
> > > > +			<&clk IMX93_CLK_DUMMY>;
> > > > +	assigned-clocks = <&clk IMX91_CLK_ENET_TIMER>,
> > > > +				<&clk IMX91_CLK_ENET2_REGULAR>;
> > > > +	assigned-clock-parents = <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>,
> > > > +					<&clk IMX93_CLK_SYS_PLL_PFD0_DIV2>;
> > > 
> > > Here as well: Is it just me or is the alignment of new lines not matching?
> > 
> > Same as above.
> > 
> > > 
> > > > +	assigned-clock-rates = <100000000>, <250000000>;
> > > > +};
> > > > +
> > > > +&i3c1 {
> > > > +	clocks = <&clk IMX93_CLK_BUS_AON>,
> > > > +			<&clk IMX93_CLK_I3C1_GATE>,
> > > > +			<&clk IMX93_CLK_DUMMY>;
> > > > +};
> > > > +
> > > > +&i3c2 {
> > > > +	clocks = <&clk IMX93_CLK_BUS_WAKEUP>,
> > > > +			<&clk IMX93_CLK_I3C2_GATE>,
> > > > +			<&clk IMX93_CLK_DUMMY>;
> > > > +};
> > > > +
> > > > +&tmu {
> > > > +	status = "disabled";
> > > 
> > > Why does the TMU needs to be disabled instead of deleted?
> > 
> > Actually, the i.MX91 also has a TMU, but the i.MX91 uses a different IP than the i.MX93, so a new driver is required.
> > However, this new driver is not applied yet on upstream kernel, so it is disabled here for now.
> 
> Then, the compatible should be changed as well.

Ok, the new tmu driver and dt bindings and the compatible changes for this node will be included in the subsequent tmu patch set.

BR,
Pengfei Li

