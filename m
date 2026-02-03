Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7769BE8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hH/zcV6maCcwI2PtqbjgHurndta3ayNB1SnTbHkvSi4=; b=Q9waxwXs3HEh6awEIJUmcbwi5M
	NtHw2Jh9hvPjsJZHjmXp5KdSmNy1Sr5VlNi33uoDKWrxcm/JeDAFLPdPV3kP3XgadxuabzV7/6JCA
	GSNfKB6hc4/Ovm1kSiXE71CJ4/8I20QfpMO6AZqwZn9i7RBIt1u852bC8M6JTEzPEh/n6Sg9a3fZb
	Z9hAKfSV2thV4dhnAZZOvma8gV+0+/LzEadmTotfy6lDzlaP0aYtFtbiKnTTLolJG0SkCkso7qBCY
	3p7Myalrwrn537FfokM03M4V0XMl3YIOEUfXxB2k0gaaIFzV+ZX8jeRllS7lT31cfBqA6iXjoW9Qj
	CuSd6xTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKG0-000000073C3-0xu5;
	Tue, 03 Feb 2026 17:32:08 +0000
Received: from mail-swedencentralazon11013013.outbound.protection.outlook.com ([52.101.83.13] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKFx-000000073Bh-3M5d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 17:32:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JPHXRCUqs8VeSr8Pc33NbbnZ0dz650wx0KYRvTXJWjGsXV5QWzQbVNGYJ1Yk2K+FSJqMZ81C43/rhd63Ql6lK9JsyVdO3FKW5+/226IAU5xEexRQC92wfAnd+slupLBcCrOkPtbA2zDYoA4N5fqS8mTpzibfIh4jIa7efyqW1jJXMWmI9wq3+05aewp5zddVY5QTm40nayLkS1c9qCgtt6526e+oxOj5Z7Syu6p+QWfDI8DYvmk2mjL1eQxvidO2wY1i9unZDRzrGF7hokRX9xBBF0+R65VR2yGrFHfxlbkzhpk2OYtm20UAxongVOXvmEJRE5YawvJpcf0EeW/YiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hH/zcV6maCcwI2PtqbjgHurndta3ayNB1SnTbHkvSi4=;
 b=WY+DxhiVrWGuFjFqRoO6CEWEAg/kjIswG7V0ZaYQaluA2utzsBw2yAvwcW6s+WgUWrYHnET7ke0gfuS0oyXEOWwVYEWI0B1dVfM3XRUXvJoCfxCCDlDKXOe59lTo8J0YpPT06QJRrbwan/0XwUIpSI4K0K59qYog0eCjC0FJBhqOCWBX5kp0DpMhRzrmnlAj2YYU7FF/KbqtT6883Tscqezql8nHVEG9XmcisQwzVpjZYN+bdgnnpudk8tD/9ZTZsh/tmi4qE1TJYD8zTlPG/ZdQ/TjN4AKW1ZV07eCDRobaW54rIvkgt5ZQKkGuIpjKc91bwvSDE6351+w9KN805A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hH/zcV6maCcwI2PtqbjgHurndta3ayNB1SnTbHkvSi4=;
 b=B+6uLkxAwRtZs448RhWfAP7s1/sbTCipZaHgAMRpJtPbvNTfwFk7FOaRorGIJRUI3NNg4kevcfOlkW3RaKkTYxId3RQZW9kuMP6kQ0dDo9/XYdeCC57kd9XRwj5ApUIh3+6sJuFY7sMpU9H7a4uB8xkwLTc/RQv2GU/xEC1B5t4BlW+AD+k6xo3PNqaOlwdms6h4cIxMlDnBfCB5wklIlPd2LuwbzhdUJ30kUm8PnujWBDelyOunfw/PY/eEJIau45nkWgHpnDBDPZaHpSWkI9AypeRtVJPJ7XuVsdUhQNyuc4RnidxnigZ8e7yh57wCI3HMoDLPVu927tIHlBDf6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU2PR04MB8550.eurprd04.prod.outlook.com (2603:10a6:10:2d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Tue, 3 Feb
 2026 17:32:01 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:32:01 +0000
Date: Tue, 3 Feb 2026 12:31:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: dts: freescale: imx8mm-evk: share usdhc3 setup
Message-ID: <aYIxCRTdb3TdzG2d@lizhi-Precision-Tower-5810>
References: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203142158.3929433-1-mario.peter@leica-geosystems.com>
X-ClientProxiedBy: PH7PR17CA0041.namprd17.prod.outlook.com
 (2603:10b6:510:323::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU2PR04MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cde1af3-f7a5-4eb5-f96c-08de634a2386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|19092799006|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nu3blSUbivkufwmNPSuK5mInOdPFteGJDt+2mM6VrrEf73/U2cncSqhI2rWn?=
 =?us-ascii?Q?ckymfFfs/XY8wxHgzFpv6ZVcTeJgoO1EYbmdclKpUqwuxTZSsjQ5C1Z5xyww?=
 =?us-ascii?Q?ErBzIHV9Rw+FWkoe5RZeHBlL1bOSfMTa9NOqjtZU/lq5UwhhCzoQOHi5+Mra?=
 =?us-ascii?Q?5C5tPzWvFQ7R+bmYjnJeVFJMN3Ax4+I9lv2YoYLqKXRDeZvnHUBCqNJiUbWW?=
 =?us-ascii?Q?YHm61IaMRc1fJl3mlRHblbMsKdd26VCNwNKV4Apzcyk8+LqLo8QP8g3V31zJ?=
 =?us-ascii?Q?XbnYV1B/5zteqker3bCXyRBaA2q33jWPUJzB/rBQB38FU/PrzBHhHEjztOre?=
 =?us-ascii?Q?7yJRN3hBGQ+yAH7HDpIVerJeyXa723o0N2D9HkXXpr2NmoVhd/XqRxFNVnCe?=
 =?us-ascii?Q?ZGe6R8e2rXQtZUW7wQVTn8vTsBbTMVzYhBv6UbPA72Dp4kH8iiIrPoy+3geM?=
 =?us-ascii?Q?RbGQePfVbQPtKoP7fo4hrgwMEK+HoJNauETL/DhkElFR4Km8hhU98YCQFJKq?=
 =?us-ascii?Q?fdyPF5pL9ljiCwgc0IqupTGYlMG3M1Q7kJfxm5rgam4GiI5KG0t4O06p8UG/?=
 =?us-ascii?Q?6ON97OAuyPSR+uKUWY2fyroWzvUynVfUpKhfOAdhaOL64DwOMjpavxoqm8uU?=
 =?us-ascii?Q?Q/WvtbNGqyOXBPCoy4GrXRktQZ48n/6HTFJbi+vxwPTsPv3Q63s9jDMnQpla?=
 =?us-ascii?Q?lgkG05PxxQbSNDgzLzFTGXiN0C5cSV60XycGSe9/by3aBzz1BFQaFBeHhcND?=
 =?us-ascii?Q?0yp7yuG19bL3QAT8xJCdYxAeAjz2APw3/0UVf49ygPwXbqg9Dy8M2CLKFjSN?=
 =?us-ascii?Q?vEhxpPenMuE/TsC4sHTvNJSE1LidnvMv1tEtqp2AdEAh7oJKvbtbtvCLU3Ul?=
 =?us-ascii?Q?d2dDlrEP/4upnvj7lQPdoMJR/P4sx+ypUAevWRapT0RUxd1RHW6IaCTgZ4nj?=
 =?us-ascii?Q?Idt7SFH9DwXKdqeslFrtOHuY4bmF2b51nAYyafGgumFfJURRLEgl7G9tmWMm?=
 =?us-ascii?Q?l4xO7pcn8eLlxVMC3AzWUmNIRnWOsJgzzczSlWfsEVmKVm3NNw14UOQDcyK9?=
 =?us-ascii?Q?JAcYKtJ2jP98rWGZIZ4JEqK1PxeuoCk5rIbs4p1y62qjBN23OT5EHCg6xefj?=
 =?us-ascii?Q?EBD2FnwHR0VwUfwklYzTQvZCc1Glnq9vNoh4POgSWaB6inguDFlpW/iXP1oH?=
 =?us-ascii?Q?xBDJ52fatDn3p7IUKYfRNRvQHUj/SNsn+y4bJxX/l7q37W86XDX4EoCzD/NJ?=
 =?us-ascii?Q?ZYyX38FElVpbC+MD+Ba1ogQSFZdOGFPROjr7KX+kFwmXtH2oUEdexTJFx/Nv?=
 =?us-ascii?Q?Sg2ZcIrclBPvFY4e3asGRvyyqOqqUNlv5MwoXUP6cQ+I9rqybbL48vpQ9I+Z?=
 =?us-ascii?Q?aCvNk/HgkILVcFlRsxs8aVKZ7uBGTNbggNIsjsA9R2wX1Oo5tVtCSaf72KPU?=
 =?us-ascii?Q?+9WjiJMFldK1fdkoap0C5RaChzHGdzgAxrX70G8Vbz5ZBBbTqIMEqYF5CYkl?=
 =?us-ascii?Q?ayVp3kwzUv2j1FI8sV2Hn9R74siw/35myvE7GMIJAJ+oL5j65oFcNXMDuSKe?=
 =?us-ascii?Q?rmEsL/agUeA2GJgNocgPQ2jMTsHb/Q0S100dMUGZgdk9CFJA9cj1YkBOVf9p?=
 =?us-ascii?Q?tX55NRFbBHqHFepOIppO8j8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(19092799006)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCUGpB2ymyEw2HIHJVMsMNvrT7BWx6ruuoZXwapaNEF9LmjF3eEyEI/orvvN?=
 =?us-ascii?Q?AomaN6xSXN8CFLjtg5JGbKgSI+HCRoaLDw58rF+UOQ2xPgg3nbqGHyMf3nFv?=
 =?us-ascii?Q?7WIllcReo4rWj6wn3l733F+vgMsFVRVSTfZdiE38QMuoG/6GpspwSB9gqUt6?=
 =?us-ascii?Q?Wt3JCtl+dzYt6eazBR+3iS/1V8zREn/RVJ6v6+cDIbGJR+UNUn9q+/hukwsO?=
 =?us-ascii?Q?1c2eeH9uVdf1MqRHtVGk9obIutZGqquz8NdeAl67SIT7n4MO9ioO5Hs0pblq?=
 =?us-ascii?Q?B4/2+VTVXcqatcfgAlmpWT+zBOffjNjw86AYqUh66dC9ZM8vAa68DY4iq3gG?=
 =?us-ascii?Q?UJL2h+WmNHhzO9tdRrgt2ioogr86qDloHXOZtBzGyqrfoVO4Q9FkCDGG6wcW?=
 =?us-ascii?Q?BkyhRwhFzgzBgbNm97sYsSXxqpF01JZ2v3eQ+I8ImwlSM5Bp+j4CP+lOSF+u?=
 =?us-ascii?Q?4mUWiO5NckhcnhI9wkqdO8feXxwhpNqBRoldVNrcsEQ2v3PGEgs0nTeGPrGH?=
 =?us-ascii?Q?t/kepSaJPnCv9nivwte2dtOxobzr4qbYUMGaUFNP1xLBXufm9lxl+748+7Vc?=
 =?us-ascii?Q?OAXEVRhI2lMYna20jZyLSJbB1A4FBpcTOYVGkndAORcrnSOeS12CU5deC/BT?=
 =?us-ascii?Q?3Kb/tsQt/KE33Uqs9PaODUbdT6a1CNrHFwC5kSfVftxjEguNNBBJ01K1wOYD?=
 =?us-ascii?Q?RWTuJrVroTmHdU4yMAnNWKWB6jUF1ABpG3FmwBQpJxWHUuNoo4RZ3FDDfsT0?=
 =?us-ascii?Q?hNCSZEYpyveHN7SMjW9OlI8twSBGvyO+84CAIs+Ki4QBNj/Tdfi/e2lNYU9G?=
 =?us-ascii?Q?re1kb0v3yHENA9mkTlz+ZjW5C4A5tgnn26kXXioVWgbCqhGZOJ1pUBRXJkXD?=
 =?us-ascii?Q?auJVFlVHX2eYwKtZbc+JbVv4Z8+el+mWoBR154+wyrVv1FMVwT1VJMXrJ095?=
 =?us-ascii?Q?69gtnoEOGTIb2dYbY3QMqSszFu9bi0zhgfmWSSC5XeiCmn6f81ZUrbgA4PG5?=
 =?us-ascii?Q?l13tkjDVBuLuPhO/Ho5MD3d0lvl4poLtOXQn5CrWLfVEU/pYiM3CXemuj+DQ?=
 =?us-ascii?Q?ZFm5EOXxi2nkyv1qRyq80I4YdgNiysPEnispzJOyU5JDotX7ZMxguh3Puvff?=
 =?us-ascii?Q?zDrATNLvw8G+diCgC5ldRSdwcd9nOk5R0WijKLOrGcgldxg19jYDq2cnIwio?=
 =?us-ascii?Q?W66f0hK8cJDJP4LiSADPmuXaaFViVyrqEhzz6/H0BtmJ+Xepvg8+OhVrJ4/a?=
 =?us-ascii?Q?Gl7rGh8bVmVBFdajV2gZF7FFx5T55T8GOSXZyEX//f/gvJ2O+8iV6T67jdNM?=
 =?us-ascii?Q?PD/Zi5oWASkmkbEWcNEprLqu++B+sXvKojWJTNZqiJnY3D1sw+bmiMBCwRqF?=
 =?us-ascii?Q?LcAfgWJIqV5U8p/EiAQma/N6kbpC+wLI31inUaHIyjCBFVst85fuBrX6ArQK?=
 =?us-ascii?Q?hWMOFi8tiNI0X1gZ+y0XscEJXjDTP4T3qLzLrp5k5OGdCtbBurOrc/S9nIVm?=
 =?us-ascii?Q?AEYVnAtcF0x/IZtyRqwUfyYgQXulRHGsnupUkz4U7L06rC6aMrRoVfKF6dwZ?=
 =?us-ascii?Q?k1wlZjCnHrcpZcUeIffCdrFADYwwcyqQc3SBWKGZpKXvQfjclVP6usxyOsnT?=
 =?us-ascii?Q?dSyGJeFnjBTOj6hYpmFHPFyCWEX6R/c6Xqu79v8iWjrRy19cxH3WWZjQhpSg?=
 =?us-ascii?Q?YXUCkZ+eS2YP5qLovq3JO5c6vGvEz/kl8VRJah91ZkBRXdD8HsnACwwDPT76?=
 =?us-ascii?Q?k1Qx5b0JEg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cde1af3-f7a5-4eb5-f96c-08de634a2386
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:32:01.0645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KW3m3471S8yC/Zd6UQLmMPPV64V9UmMWB5E6Ttia3QNwhcLb9mPiqjOirDHeJTrV3GM9lEBdxkkyQje0ZlEpsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8550
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_093206_004548_6826DA99 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, Feb 03, 2026 at 02:21:58PM +0000, Mario Peter wrote:
> The eMMC controller on EVK and EVKB uses the same usdhc3
> configuration and pinmux. Move the common node and pinctrl groups
> into imx8mm-evk.dtsi so both boards inherit the shared setup and
> avoid duplication in the board DTS files.
>
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> v1: submitted
>
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dts  | 61 -------------------

evkb should remove the common part according to your commit message

Frank
>  arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 61 +++++++++++++++++++
>  2 files changed, 61 insertions(+), 61 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> index b68954bcc383..002ebdeeb2d6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
> @@ -53,18 +53,6 @@ flash@0 {
>  	};
>  };
>
> -&usdhc3 {
> -	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> -	assigned-clock-rates = <400000000>;
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc3>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> -	bus-width = <8>;
> -	non-removable;
> -	status = "okay";
> -};
> -
>  &iomuxc {
>  	pinctrl_flexspi: flexspigrp {
>  		fsl,pins = <
> @@ -76,53 +64,4 @@ MX8MM_IOMUXC_NAND_DATA02_QSPI_A_DATA2           0x82
>  			MX8MM_IOMUXC_NAND_DATA03_QSPI_A_DATA3           0x82
>  		>;
>  	};
> -
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> -			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> -			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> -			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> -			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> -			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> -			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> -			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> -			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> -		>;
> -	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> index 6eab8a6001db..6e53828b5d30 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
> @@ -649,6 +649,18 @@ &usdhc2 {
>  	status = "okay";
>  };
>
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MM_CLK_USDHC3_ROOT>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
>  &wdog1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -839,6 +851,55 @@ MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x1d0
>  		>;
>  	};
>
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x190
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d0
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d0
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d0
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d0
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d0
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d0
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d0
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x194
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d4
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d4
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d4
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d4
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d4
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d4
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d4
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK               0x196
> +			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD               0x1d6
> +			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2           0x1d6
> +			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3           0x1d6
> +			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4             0x1d6
> +			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5            0x1d6
> +			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6            0x1d6
> +			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7              0x1d6
> +			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE           0x196
> +		>;
> +	};
> +
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x166
> --
> 2.43.0
>

