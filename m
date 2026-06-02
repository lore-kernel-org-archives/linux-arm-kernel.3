Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E7CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dx1mmzNu0nkJmpnkHIX5axwsRMhzh62Rft9E/Gi5m94=; b=t+9auqfzmjkWsRZHdeCFqtCy+K
	YpUUQO4vemvzx2A/5xqvcsKEHBq8PW2naUY1D9wbQBgO5tZaKb0DmZOnZmD24wapumE0goec8H2I7
	ru7UVShPlBC0EvpL2S7kT418wLTQnTshwSNwN1wIrNWqPn5LQHkgvEs+kLScuUI7W6vQ+6hO+hV0P
	jQJlqKR5hM6mQP7aR8C1OfslWx4KV7M/75ISzTY4SBrcqD/79wR5iBTlh5saFBh3Bv4dmk0H1Nr1o
	Pqop/UaXg5X6AvBPzp4PQlhCyAABXzlLhOglCawCK1cTQgLeuDk7FTsC7cJoFw5MPo0HFVlx7qF3u
	dBocwp9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSzX-0000000DabV-2X9G;
	Tue, 02 Jun 2026 17:33:27 +0000
Received: from mail-northeuropeazon11010060.outbound.protection.outlook.com ([52.101.84.60] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSzV-0000000DaaI-0R9X
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 17:33:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cqBIjG5WsvmGALC0OgwaIVJglMXfG+iQq3hVt53WR31ItspgoIPe6hJuugRiHHfOTlrKWogMKrmkPsoZaRDe2oyEZn+1RLLuzSN/L2hv4+fZS/y3pn+c5n5aZsD5l9xFq5YTighdpYR1EdL4rJ2EQiYiuXQve7I34yMCyP9j1et/8cYDFTTQ/pMZ+8eTCWJ03ET0/K+anC3i2s93UUjqgtP7G7rZKynQGFndZF8mRZrgQHEt2JROLcoUlxU0YmkpfwrNZo18o238+9CfQUmZoW1pBwGtXdb1gga8S3x0UxKUaajPbcCgbUv//axNLjr1UrZKN8nU9jW22lvF5iVLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dx1mmzNu0nkJmpnkHIX5axwsRMhzh62Rft9E/Gi5m94=;
 b=dgx+INBfWF+nPoj+Az/Wzc0mLJ4NpaZ68V+7WUfjyW2fypPU684Iij9vic/QM83o3wpvGGjlhlVWA0KuMjJ2lqjO+Of5LaOheg0KOCSsGUZNNUoyGdTLWX5k5qLSz1uqvHlJmVBVQluVUlZMwmrpB0etxHz6V2pnTdS1T2junyswJAKi7VuxHPWLZl2gNbRkytiFMrO9RVMM04tw4qLuXb29D8s78PKBGiPIhRdCdX1eccSepraSEIQHGPhygM46pe5+65MlfjRL5XfcE9DZnaQ3P/A6wUL4Zz93DeEVnJFLDNR38nbOw9pXTaSQPEb0y9MUjFU5hqACBW2dnFxzZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dx1mmzNu0nkJmpnkHIX5axwsRMhzh62Rft9E/Gi5m94=;
 b=Fg4vdGrcZJEDZhK0GFK1NaLOJ8JX1sDlAYjbLrcWyUNKMpTSJ2+64l4SSKh/5t8V0ffpQv2osjShxlrkykrQBiuHe9mVtnL1wCtf8m4Kn+00PRMxq39HnNOBi4rTq/XZvNqvL1D506UY3LF/A+G3yrdEIyq34BUVSi0+lHK+JF6krF7+nDqShoao56CXXju40JJPvfN0KUTy4rBXr73/a5poEVBvy6ixkXdQgOTCgUwRQX7ONUgyJtlYu6w8Vc6t5EVCawgEXsFu7rE/tgwVBk2FPDILGpRbiWaBrkyv2sbwLiU2gm75VWuT9QP3ywC4B4pS4Xn7vywtKrzBmlYw4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 2 Jun 2026
 17:33:21 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:33:21 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Francesco Dolcini <francesco@dolcini.it>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v4 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Tue,  2 Jun 2026 13:33:07 -0400
Message-ID: <178042156156.3430605.11944248821061210803.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1P222CA0078.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: d61779a2-82d9-4235-fce6-08dec0cd0a7b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info: PXJi6fKUkBZ2fAWqnHBF37g3jbCB9bWoSal4gHQ8DxWElJpuKZzPo9tU5ATjd/KBggCegjVBnR6qMTKQz6p9XRKgSIKMthPkg21bjqqPvAnawNx2lUeeBV3vO1puW4N4tEQgiYyBoGdzmbeBLBp0Ny7badGFyCg1xvUh8K3Pgp8dOw/1FiDC68U4RAdSqIAaW7cwdLFAMQTTScB2j/5SFa9oYpjU8irCz2iZCzvNpefk/4T5pEcC2JtNceSLef45+VfaJV3R8hlH5bzyxOZwunLtOPaoJMO676QDgqekg0+GSlmFTea5h3yA4HSramuz9CKNl4MSXRE44A6jrvt7QV9x10NPsc6WCjN7BF8+k936MteO55+FpkQtxH5Qj6zw8eioceso/Nr5BLuaOAjzVztJV8Hk+ZEM2DfX93rLp0s1cLzMNnY1B74HrXceGrgzeJAPkXzwVft1sWZFK/ycKs5AQQbI3FWTR6E3XJCZc70Q3PaDTY7C4sSGe1wk3KXRUUJ6W+aRNHEXjzQqWkHCVIwlN3D70aO1j9AhoaEGt3QrogpfJi07P6JdxXtn0K92/lcO1G5MDIQddqON2q9sa1D3rvyOa6o7Wm/3JrBDt2kiuPFOHfS87204z1/9l+xfQN/i8vvTFCuuZdNavDfAjLFzE+sBfHyGlOUDqjjU6WvGT8UgbfJZEgxAe9LYy6CK
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0pYQkszQzJqeHZ3NGk3MjVJMlhnNExHbTBnSXErUURUZzh1aTFTNGp6alM4?=
 =?utf-8?B?am40RHhmQWpMLzlrTTl1M2xhU0pDT3Vnc1k2SUkvTW9uZFR3WU82OWFTRTlV?=
 =?utf-8?B?K1ZmOFhLcnRIdGFoRGZWVVlDaE9XeXEzejNtY0JKcmQraWxjL0FpR0ppTDMx?=
 =?utf-8?B?bk50SlB1L3BQeUZQTnRUekVBdDRObUxRaG82eE5MWFZNQ2U1U1BGWk5kZDJ4?=
 =?utf-8?B?eVordTFBMStwR3JJclYyd213ZzJiakNHOUtDK3MwQkhoZHI5TWx4MHljZVFY?=
 =?utf-8?B?NHZXUk5vMk5nMHd3YmFEekdqM0RlR3dFMTRraUpEV2FoWFIwSnBBL0ZOWEZT?=
 =?utf-8?B?M0svSWtWM3pEN0RRZlFhU3hCSnphd3gvZS9PemRuc0k4MXM4aGxDNEJESkZi?=
 =?utf-8?B?cTJiRXYzYTRXR0c1cEJRQ1BQYTZXVHEzNFdWRTNNNy9uR3pIZEtBNHRhL3NJ?=
 =?utf-8?B?NlRVTTVKYytqdWw4VlFmZzVyUHhsNkQrdlp5THczUTFuRmpkYzJWbWFPY0ZS?=
 =?utf-8?B?b3lsVzN4amo5NFl3eUt5OGU5dUxCQWNpb1NwQzM0N1RvRVJTVS8wZmdKdWFz?=
 =?utf-8?B?RGwwU1RQOFMyQ2Myc3RiaVl1NjBRcy9qZkdvMk9yNUxTN3BaR2dEL2I3d1ph?=
 =?utf-8?B?dVBWbWJ5MXJoczNZOXo0N0YvMUhVeVAyVmFEVnVLZ1EvOW9wWER6QXVWTjdW?=
 =?utf-8?B?TSsyNVZRQ1ROYUpWZnVmS2pjRU5zVlJRL2dkZGtiV0czUnEvUWdWUnZheU84?=
 =?utf-8?B?KzFxdEVnWVc4UXM3ckZrKzF3VXdYdWU3NXdVdFpXTVNrbGJBQ3J4dHg2Y2xn?=
 =?utf-8?B?UkkrZWg1aVJaZms0R0NEVWdwUnFOMWVIai84SEIxYUVVa1E1WVZ4S3lrTStY?=
 =?utf-8?B?Zzd1NG4wUFhFQVU4bWJmeTJCZFJDaC9QdFphdCtwWllUbkdjdGR1eGRxazhH?=
 =?utf-8?B?Y01lZ2hRZzRtMHZweTZmN3ozRUhwMVdRQTd2NUNBWHl4ZGNtRUJZaVF1aUVQ?=
 =?utf-8?B?SDl3LzRMbVFSOE4yZTJDL2ZRRlVMNHlaQU5ja0lYM0pqVFdpaytncDhNMmRo?=
 =?utf-8?B?NTdPUTZVSDZlY0pCWnVIUlRLVjNIRzlnTzZjejNSSFFyWTJXR2d2Z3RrRlJU?=
 =?utf-8?B?QitSTy8yYmtVaTdqWDVaR3NGa283WllrU3cwc0c2NnV0N25kbzNaRHJoZ3JV?=
 =?utf-8?B?WjVha2ZsR3N2NkcydlVSVW5Xd1ZZQ3BuZ3JsOHBCbHVIaW4rYmxQSHJ6bmZ5?=
 =?utf-8?B?RjltSHZOd29hL2NVcVpzMTlvZUhYRnFIQm16dUdIZlg3RE02VmNMNDBsczFk?=
 =?utf-8?B?NmwyZlhrbnhGaUZ4blo1b1FEOUZjeWQ0TlpYMm1QQXZvdWJ1d3I4THBSOUd2?=
 =?utf-8?B?N3MrVHFsZTIzVC91ZjlwelNqd2h1UHBvbWc5QlgzS294SndxTzZoQ01adEt1?=
 =?utf-8?B?eTFoMVNnLzV3NEE0b09EVjRhZkNtbHN2cVdrSy9rZDFpZ2NFNTJ2OTNoQ2Jh?=
 =?utf-8?B?eTdKcTVpVTFTM1lkQU0rclFvSEpaN0NMZ1VZWXMyYVlpd2NwOXpESGsrbERh?=
 =?utf-8?B?RDI5TVBXT1c5YiszQjBzRnJmdFhQOHdkbzU0S0htdnpXVXN1b2lXQ0NFU2Vq?=
 =?utf-8?B?VlhaY0FkMC9WY1lOdXZRUURzQ0VxR2JiMzc4aEgzaXZzTWc1Q3dIMTJnRyts?=
 =?utf-8?B?ZG1kUzZOejhuZHJ6VmFxN1pPelgyZXlhTTJSbzVpdlBOUEdKcDVURjAxRVFr?=
 =?utf-8?B?RzRVYjZuMEY3L3gzTGpWRi9EQVFqclNZVW1GU2YrbSs4M1dERzRwd1JaZUh5?=
 =?utf-8?B?OUdmeDZtTERrWXVLaGdRbG5iNE42RUNNeHluZlh5a0R6SDh6UEh0bWtZcjh1?=
 =?utf-8?B?d0YrL3I5bG1sR0J0MnA2YnhDaUFJVW94Z1MrWUVJWXBrdnR6UW5UNHZkTHVF?=
 =?utf-8?B?clVES1MxZklGQ0F6TXVYVEtOUXE5TEQ3azV1WW1tS2lOdXl1UFp1ZXZ2d3dW?=
 =?utf-8?B?Ylc0OENrcW8vYURsbVY1aEFuVnJsQmRYK1BkdEkzTDQrckdjbW5NbDV6MTFa?=
 =?utf-8?B?RkNyTkJPYWlyZkdYRzV4aklqOEF6aG1BTEZXMlE0R29VRVMrWVk5SXNtOGZi?=
 =?utf-8?B?YndOWUNkK0lxVlZlcWgrQ3hsZHhkM0JGSnR6RkI1UmhaL3ppMFFYSlB6YTB6?=
 =?utf-8?B?Ry96SVZuMkF3cGZCRG5aSXJCbmlCMnVqb1gveFV0MEEvc3JvSm02Yk11dmNY?=
 =?utf-8?B?Z3UzK1IzWmtwVytrZHFzSlpIYytRSTFKTFZsa0xZZC84QmpnV3c1aFhqeDc3?=
 =?utf-8?B?RkQwQ0E0R01oTjVNdXN2OXRERU9UUmZFSi9aRmVQbTFsRzQ2SlNzTEtPbUhp?=
 =?utf-8?Q?9BUZ7WHyhdMSdDh4/ZkMi6pvklw6iwOPoyxwj?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61779a2-82d9-4235-fce6-08dec0cd0a7b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:33:21.1284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qCJxtgCdOnhHaoWnGiv9sOQ3gnioS/F1hgqlCCgeabAxWk5kx8wQtkGef6Le2Fi4qq5d7t3jWRVByQbVLraR0Ej8xQl7vBKw2GDuzYy37R3VRY9uNBN8jMQa5eHDvRFl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_103325_155663_34B784D6 
X-CRM114-Status: GOOD (  10.93  )
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


On Thu, 21 May 2026 19:11:03 +0200, Franz Schnyder wrote:
> This patch series adds support for the Toradex Aquila i.MX95 SoM and its
> currently available carrier boards: the Aquila Development Board and the
> Clover carrier board.
> 
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
> Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
> lane DSI or CSI interface, one LVDS interface (one or two channels), and
> some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
> and a WiFi/BT module.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Aquila iMX95
      commit: 4d0c0b7fcf59b1410fdeb18e2837d0c1e9ec14ba
[2/3] arm64: dts: freescale: add Aquila iMX95 support
      commit: 5daa24ec08a8f57a7f41a16cac140a69db813bba
[3/3] arm64: dts: freescale: imx95-aquila: Add Clover carrier board
      commit: 802cee9b535163f66fa635888c2922c760d5d526

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

