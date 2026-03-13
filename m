Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7115C105F7BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=; b=QeSeMO7llD0f+Sn6ETEycrU9XI
	QYikeldSbipYCasaqpzmSsNI1F5EBXmwMXis1QFJPqK3cIe+75saEWNLD4aR4hFQBRkkEEKEP1fmb
	KVw2DRK4AXLe+o8+otEmZ6UT8Uja5AZtAlURQPCQmN30DV3EQx/TJxYBfcmEXhGlNvkqOT8M8QCY5
	LdJhLjm13KWE+jNFy2TkHKDiSDjqnsiY3gBrdPxNhiI5bxHo6zjnwdAcjzicj4EKiw4j83lxrmK53
	plS0LrFvrlz9USs9ID+kY8Wk6qkM6HT1Rx2DCUTcNgF6ANv92jsnrqie2MKbo6Vc8uIFSv2uo2x9p
	gbfMcypQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14u5-00000000bAu-1eIV;
	Fri, 13 Mar 2026 15:58:21 +0000
Received: from mail-westeuropeazon11011006.outbound.protection.outlook.com ([52.101.70.6] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14u1-00000000b9f-1O2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:58:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/bDczlf1gM6ToXkrYhLMGCH5U1beGE4XkpJuNpErNKMFJO7D8NrIK8pX6HY7gxaY6pXXtPBQl3mhvnnE56N4dZuJpd9II02P0lJJ4h4joCW45SGnVi7RMVLF0mqJcYXKezcukHUm99cjpHsYHdsWiLc6pEOZVIm1kF2Jv1BNzlu0w8prCiOfQ5aHTpZ3nE1Vz1Yoqx7DRFBIsMZQknshWjWn5JvJGDkyFdYbB97Q+vehLF6cAVYtkgIPeOsNzFhj2e98w8RiF5i2PCngK26EUfQABFC7LtOJZXAXWE5b6w4hykPzbqS/6Gfqxs8YGkyRre+RqJqMUe+BFAIXm1vjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=;
 b=x5p40MVtnCjPBxbQIjcBXBNZHEfCteZgvTV4m3GgYXW2DBa8G26aJ0UN0XAXuwuRuLmyxMQvFyKM4F/OQAQu60HN9JN35NIS/o5A2g05MXynYMhGbFtiGVerkriUMv0jh70v4IesC4PoAf2WRDYWImgZjTJYbfMSAjmFWL6G+B5BXn0ZL4CoLDEHG3ihxE+UQOA1LM4j8ih033JXQv5Y3+4hEVzLtb0Cy9ff1VKwtuKCSelPaHSZktSle2iAOLe84AuVK/Rc5aYzJZv7AW0tjru4E3HyxBQddjNtoioEDlJBHJHrwPDglziXuFR/lGnrEV+6WNxn87X/G9n7zYWo8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nw4hzbpOJL5YmzCGvirq40CjEwql3JhlrZMOxHbuxEs=;
 b=RIClZbvtTSFMpPzpwfYnwKqE1axA3TJMbyS/kn9sOSku9musGokK8vuauduLZazs6A6aloAep5LUcF0+NMBejcQuwztf2EfmlXZdIVk8SQ7IbK7KOv3eYtm77msa7YzKaOv1L8Z8hW762D0cy2HMABKaRgjYXFNmeI5z654ksnxlVb20yNknnAuX5952MEbff95VvWj5QDuDvQ3BDfAHB4jYOosrqDBKXI2IMYafdy8D7VwjrPUsvpixPKFdXW94Ot2WYQ8+VnSzfysE1IrTMr+RnUpp5pATEKVCnB5N+lGzG8cVU/LcOJxlNtKyax47FPESbLYkxvs4/oxFyP2sjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DBAPR04MB7382.eurprd04.prod.outlook.com (2603:10a6:10:1ab::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 15:58:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 15:58:10 +0000
Date: Fri, 13 Mar 2026 11:58:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 05/11] arm64: dts: freescale: imx8mm-var-som: Add
 MCP251xFD CAN controller
Message-ID: <abQ0DT1jtWVNQfL3@lizhi-Precision-Tower-5810>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
 <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d007d05d5927820aa06389c07dad55357d5f8d4e.1772898346.git.stefano.radaelli21@gmail.com>
X-ClientProxiedBy: SJ0P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::9) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DBAPR04MB7382:EE_
X-MS-Office365-Filtering-Correlation-Id: 83746e9b-8470-4f4b-f4d0-08de81195310
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: SVpSfCHd17aFqNgMd6mdoDuNf9cnHyztazsN9d/AkDAnrLc2pHhGCXp2Akahpm529qURqXQySTH3pRNTJnkDXO7tyNWzMlxMYCFezslCtPW75thKYjIJCk2vfMRXqOmTl/Uf+Ntv+HHB6IqQfGmwZlP1mYX8BIYu3+5GdnnTMvDZHapdqxyqurDVGSPshkocATSKor3UqF4+Zs/MkmuNtmU3MXPGLvPZ2dFjWmYG6OtBe2s4W3lx+tnP33X5sw2iF0TJDfLreB/KhL8Trqe/+Ijf+vRcBdqf/gLJNzlHasE7tCC3vBfzjpZy4AqoSB+pB3kU+M5WAqnJ6ZUHd+Bhr9M/T8YW2WXfeybN/NUualLlzU3irSvdm929uCbq8HCr+IQPk9IRHjJQONEQzDKbiTtPG/QzAGCqzuy3TflFbsdMan4vrIkfBcB61YK4RrhqCoAjbHm4npvYxBnyvSuql87La+aEF4RxV+gOzu07rMCuENWGKEmJeso3b8rUHTLo1C0r+++PB9Q3glXF7HOOQM5iXRiuckf1e+U5pLnlLSLnoZ6/vrcgeEefiizhyl7BkYyy7pJ/I3SbAUPwj4zNi8TSRNDKX48y2z42o5EcnKvlapHMscLm3cRBiEHoAlcEQqfBHJHkb1WfTwyKTbIbtaGqEokdC413s7Ii2dgalM9nzHAlP6Q1rF08YoX+QQa4gkoJIebFI+lMSQZg3hL+11CQSY8I+1WDdZ49NKyPoWxeV4eaez4W7txUr2RWQtSEnMJbz1u56kAK4ZzpnYqTHIYKL0KqaI1JS+gGZWPZJvk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MVDvh8p4oW9UnZyBVrK+FjZgDmxnVkFEgez1/3fHdxthOsIwVgHgRuY7pDE5?=
 =?us-ascii?Q?IwaLSkKeRi3aCAoLjEhA6DP6Bt/QkVpobg8DYX2rQ/QPpsVBQn7DGKtSfeBW?=
 =?us-ascii?Q?oivDg1IbRHvnFtzLKm7utseMRYftpVtA4vvhvC9ZApfE4yDzo3fLU2dCgcYs?=
 =?us-ascii?Q?ta/MuChIVVOde9Su5UmKD+fxPcCCtCS78KaEMOLyvJzofwADdwgmp72HXvgE?=
 =?us-ascii?Q?5RKAY4h5qwtVbUplH4mB6iH7oE/L7v627vsadGWvOpYfMUSAveWiI7d88A7g?=
 =?us-ascii?Q?uQRmAvgSZndbDWtzR/tsPOegQmeXWP7spAPBO0F3h7xtQi5SU9KZgVJKOpx5?=
 =?us-ascii?Q?D8BY/keWXX6IauXQdNRAAdqtWfcksaUWjO/v/04XUqoviw10Rg+i99yOoKYW?=
 =?us-ascii?Q?s2V/GBpjaRO4spy8grPie3o01swBWo9TiyTtVraJSAy0RBdx+anwX+p2A048?=
 =?us-ascii?Q?+W3GqCRY1FEM+B7mT1spEierCisJe28l9+mzLoWrl7u8NWvwGKF0rKWLt5UJ?=
 =?us-ascii?Q?Fx8cFXXtF70h8Bm8kRx2GPPlHhO9d4WZ0QpnIKOqGHkMX2u0fqK9qfvvCQgn?=
 =?us-ascii?Q?drFsUYyH2i6fcPwAK8Ay8Js80Lq2Qr3lIYWX1uzGPZv+3N+IkIvstbnsuN5Q?=
 =?us-ascii?Q?J03esQdkf/saZ+1WimFvsyMrFL998mwEseoQlU9iWsD92bFQlGonfVdSDF6D?=
 =?us-ascii?Q?xHTb352FGRBhDuIlvMQGdQ0R4vniK3Uk0aRiDyjdenJuN1fL70kOhQIt3IGt?=
 =?us-ascii?Q?OdaGn1YunVQdYzO63c0q6z2MA5jel+spwNu2hz4lOvgx5mRI28DZ5fBbAz6v?=
 =?us-ascii?Q?0A7ceAVtL88P516PS7XLQPPIiEuSH4311SSTh4dzCOx47rdaeC/zfywLsiR4?=
 =?us-ascii?Q?VCsQjdzCz2veeIJZIuEpZWthKolMIkw/E2P13CS6ikD99MQr7jNJylZ3MyMN?=
 =?us-ascii?Q?dZBt9lKu204A+5ZhrPEVXzlgGuwPaYx7+MPgZyuNkLuOMsJBuoqzpK35r8SL?=
 =?us-ascii?Q?PhNwjipO4YQETVCiUQVurYcDYptSyfPlIT8ioxXQGx06Xsr3Saz+I8fC9ECi?=
 =?us-ascii?Q?BVyx11Q4muePa3AYYet4j6aw1fx+n4VeJ9IyFXF32EseTE2fa6DacVjKmmZd?=
 =?us-ascii?Q?Gy16wjUxkC4vBO9DNWXFc+jWz3xdSG+sAbxj83Nju2V99Szm+1jQHdYGy0IS?=
 =?us-ascii?Q?AKyU4a84mx6CO+w8L0slmsV/1yZvbMzcH8ChKlQdvGUv2cQZ9Gcmsqj1cBnj?=
 =?us-ascii?Q?kluzVd6xay4jCnGPvgNodWWbCQDO3Pqr3p15Z57eJCnU097RIsjmf8UVS4lf?=
 =?us-ascii?Q?Mv7z2p+9F5yiBP8nIMiuxoh4gVxOqCtyr1OwtnGZO9RFF4FnOsAgWACAVzTG?=
 =?us-ascii?Q?AB5OuR34pAjJ40dAz3V7sGBkxFwEnidAsq9IiubhtIGXM2zw8M2QPvql70Cj?=
 =?us-ascii?Q?IMJApAAmUEIzR2DHv4vY6UuVTi7aOjVWFhV506wK8MWptLrJnGIiGl1GPtWd?=
 =?us-ascii?Q?torXk8wWqy+gxLO5zWp1h8w+DDbYxLnTRS3kEIzVDqEaFbKyiNYVMNsD+0vO?=
 =?us-ascii?Q?4HEkfXAifXOcRIzR0Svb99mW/UdPAxWS/9Fpgsx8NeISHszdyYyCEjXK3xQU?=
 =?us-ascii?Q?q3p2Y6h6ku6KiisvzCtu+q5qytUiLJw+VIWoQzCAOfPR/P1A1AOaC2Nuszt7?=
 =?us-ascii?Q?BAbKvqgbhWCzRCF5qkyyoEHwctljS8ji8JBtVObQ9O07er0TavxdPSutdO89?=
 =?us-ascii?Q?SNd6GOEWng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83746e9b-8470-4f4b-f4d0-08de81195310
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:58:10.2190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h57VwEPmww+x5mTAsb/n7K5/AryTbZitA0c+XKJ0zQZKx8DSKRxT/Acw1jo4yStH0pxQxYhC2DrRUmP/S4GMjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7382
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085817_370781_83CEFD39 
X-CRM114-Status: GOOD (  11.34  )
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

On Sat, Mar 07, 2026 at 04:54:41PM +0100, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add support for the Microchip MCP251xFD CAN-FD controller connected
> to the SPI bus on the i.MX8MM VAR-SOM.
>
> The controller uses a 40 MHz external oscillator and requires an
> interrupt line and a dedicated RX interrupt GPIO.
>
> This patch adds the fixed clock, the MCP251xFD device node with the

Remove "This patch", Just said Add the fixed clock ...

Frank


