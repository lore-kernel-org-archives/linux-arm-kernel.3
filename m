Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAA4CD4857
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 21:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Cc:To:
	In-Reply-To:References:Message-Id:Content-Transfer-Encoding:Content-Type:
	Subject:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCywrE6Jd92+wpSdZxKuH3upZnuVg/CHVqNfu6JEk3M=; b=lw/BF7LI247unc23A6uwKceYwz
	sKtpPVm6VRj473Ffg+cV/HI1eaTXQd/LUg9O5k4icT1baHtt+DlAxQf3t/XEFYbIObEzTCGXACobc
	MeafR9swhj8cdeG4ZneRUReYLn+sl8oFIUTLQROQcEaD3HrkHOPX+1jpkJljNRrG1HUMPvNgLTHPw
	2Ehag9CWrBy9AelY9Jx+tWDxl7IOHriO+YMBytBHFgBPCbsLu+GEaQ3TRdkP+5TMlACyUi9QZC61j
	+l4ZVbZVlpdZxMaB/a21S62EVN5E6X23Yvt+6t7XaizzrfQcpV5ZOccNNFUqBKLEckKzYDCk4PHMX
	FcpxGYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXoa-0000000ElbG-4BpQ;
	Mon, 11 May 2026 21:05:25 +0000
Received: from mail-westeuropeazon11013021.outbound.protection.outlook.com ([52.101.72.21] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXoX-0000000ElYG-46m7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 21:05:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WiEK7tsLDBYd0VvHxtRlKYwypmBwPSw6uHk/0aM78Qey2iM8aRT/XEcgWlX+c4qSggjT3cobfPGJ6TP9MyUrnKlgqDLEiNzZrtTpzN32ninclOkJ2nSJD/blnjX4YAlt+5jaOnKfytHBdaTUPT8cAss+eyLji8nsTMjX6YylNxZp+nOzCRRye1/Ct6Sk9gepTn02YCMLGmk6znvbzu6Hro4uaMhscb51nZO+es93c+6fWp1ZhcfbORFiqJCQizRnJJ7I8WI+xR2/U/p84qCUKyIUASu5k1ZpxjDp6BR90gTtDnFEcF1ZdA/JCZl8yknANcCHd53u1a7skO5l4ynDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCywrE6Jd92+wpSdZxKuH3upZnuVg/CHVqNfu6JEk3M=;
 b=YZIsC61daFQHHkMag0hUmNcHxVsH+HSkxgft3x/2u9K6h0hjZwxBdZA4gns3ahUJ4UdCYvLaIWoSmlGwEjautVCVgGfHItSU40FU5RRkDD3LTKkoj/N4mNe/5tQzk+qmz3Lc52/MnHyxv45ojuFmrlW0RvQmv+k4ZoHHd0vbpwZtb/5G2Vj5RGoTZKa9pXXhSkYGp6tCoXiPoZimA5HdT6rPsUYs8k2r+bwliHdb1bSMNt7oHgbl71jYFjJzQCzbbEJ8UFFoQl4LGv4hbTYzc0mT7sevU0w848d1CLblUKxd5Ee2lfCVgxBK7hqdlozNpuMAJJ67kByKs3qtr+74sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCywrE6Jd92+wpSdZxKuH3upZnuVg/CHVqNfu6JEk3M=;
 b=g4359tl1zaGBA5Y5bpioYlRBkXLnDR0AYKI+ZSPZntG1bjgGs3YWtIBup3/QgX+PxVYX+wSdljTJj4a05CT6tRutGL7t2eBPn9uYRH5evYCCnhQsRD9flUwSjqYgMFsZHpkRNZe3rcPlyGo5Mh5qPkrs8FjfDFulX2Q5mPv9pKj+8m2n/di9jY+Ebh+OJd6HwOfe2BirEByAmR6jRF4IFFvU7PKKBjXKGG7PswesFNV47kk24bLEwyuBD1Vjue1uLx1JmzAafTn/ByqS27T3x8OW3ejKcWL51/wFVNd/wp3ljhu34972eOLts9Xz5xUGbrWCHWTty6cjBW5HaK8x7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9155.eurprd04.prod.outlook.com (2603:10a6:102:22e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 21:05:18 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 21:05:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 11 May 2026 17:04:57 -0400
Subject: [PATCH 2/4] ARM: dts: imx: add ti,deskew = <0> for ti,tfp410
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-b4-imx25_dts_simple_warning-v1-2-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-0-01b855a5ce25@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778533510; l=1918;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7JrEDKX68J5setCXrxVbwENr9/ZXtrr1vxZgPNEyzjc=;
 b=uqlf0gnEdkQZf69x3weWTyX/nBWhXyd+EuaX78WaIpjAmkvOyKkvF8XXZupZ/PkKwQf3SPa9O
 bC/AeBqpa8RAxkjGhT1hjzqDxy6HBXestVhgsKrLgB7VggxW6QSKFKF
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::6) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f959532-f49e-4d2e-7310-08deafa10166
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|7416014|1800799024|56012099003|22082099003|18002099003|38350700014|9063799003|11063799003;
X-Microsoft-Antispam-Message-Info: W9Wo49UI/RSu4WkN0xiFQzOadaqoDH6VipeMsNWUSuOfrVKpOeZQUv8yCTABa1R3s5RbpBZ8HTyIHwpmyeOgJ1dhAcMvyasFW7bo5pqz4r+CXEnRE0xjnFuQzaUV8M8jmxdh9WDKSZ7lrO97P0EY31tnL8/hCNJK1KkuxHyFR6ZtrOdhtBo5JswbE+WNX9Qj8sMPGOc3HJzfRBRb5ajYoNrHyHUA3bb/9HhFEhhKb9OXF/mkTicJsYqqZqlBMOzhCg9tfFHMhjuJ+XtePIf99fgTN5yLqHx/sdwXHQxa/4QaaAyJny4Dme297HtdikjSrOtTCycXPPziJxsb/PurpVqbI+KR78Frq5BAwZ2lLHDE5eAh7/3OB1LGJV+K2YlfQ0o/Ai8k2uq7qoZCEOpNZ1u5kb20SGQrAnp54h3HGrbv790hMLgPELe+3rqF3sCFRTYSF2Kjt3vbGNXFb4/3F5nfyODL/BbcYmMFkDzD8geHR/lIxpAVD0TodDB0zQSHXzRRL448vTxnhfxUDVceIcpOyiuOhkeq8pVH8N8dRIvSKWYyEHIYaYBjWzsSB9p+ECZPsGyKiIkkdRgUdqsOyoe8noz0k0U8UdQYZ3E7agl+RaBJ+uviZjxPL6XuQXJEfJTMNAPkwLlT13eKNub3SFPy0kRj6gy0tf7il6ifi2CtkAP2n3jwAtcenmLlKQsa4noq3AAAT/BPLVANBEtuWyTaxkss2q1djq2WTqfSnJel981+C0cs8S8AgtJcdooM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(7416014)(1800799024)(56012099003)(22082099003)(18002099003)(38350700014)(9063799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cElMTDFieEZ2UEJBL2pyWVhqeHZIRFBKQytraFVOTGlMRmlPTVNGZVVKc2tW?=
 =?utf-8?B?Y2pVM1FMcG5xWnMyWVVOWHRxZFBMUnFPUlB3MDVhYWs1TWluS202U2g0YmlU?=
 =?utf-8?B?czJYR0V4SXdXVU44bmxXTW1PTTVhMUpUZmdobmxaQlVLRXFqSzRmVkNRRVBn?=
 =?utf-8?B?STVlWFI5N3BWU2hCWHdkcVo5WW51QllOYkVWQklTdkZ6U3FKYlk5TW9wQnhG?=
 =?utf-8?B?a2tibnFLUngrZlNxSStpTmdTUENzUGt3aThWT0xoMTNEMVFwV3FQRkUyUE9z?=
 =?utf-8?B?SlNXaC9BRFZxOWJaZkZ0YmtjWHV3SzFLODdKblduOENSbDIzZGc3N05wU3B4?=
 =?utf-8?B?Z1pnZHdqTmxFczBEY0hNdzlmNUsvWUhRNTFvek90NVNqQnhoUDhyV0xDVkJ3?=
 =?utf-8?B?YVhsWHBCRjNiekIxMmFRTG5hR1pJQkV5ZXhCTEZLcC82ek5qRDJGTkh2bmhW?=
 =?utf-8?B?dUdHL3BFSllMUDRaaFFmc3JISzArMDFiTHFMZC8rSWJlWnlodU5NZEZLNW95?=
 =?utf-8?B?UUMwemJ3RThiUERKdDMvQ2EvRkY0eGtWcTlaSUZNbTc2WkRWbW41VEErbVNB?=
 =?utf-8?B?WVYwVEpoOE4wZllUZGR5MUF4WnJNNDhmeW9JWmlZazRXY2hQcm9GQU02Y3pN?=
 =?utf-8?B?RzQ4UFNQVCt1bUZ5L2twY01wQ0Zoc0FrN2RIT3V5OWcrVTV2a2lidzIyM2Nu?=
 =?utf-8?B?SGxjSzlzanFwekZtNmxuTUlqclNmckJINHNwQXZvMjZtMjZMU21oRWFLRUVl?=
 =?utf-8?B?M3U2SW1KRDh4UWY1c1o1aVM1SFM4WkR0VE5UNVFyRm40UUhLK2VLeUw1TEFm?=
 =?utf-8?B?SVl4aG0zSFFkN1VhSUxIYmc4bEZTUHZCRUk3Y0J3ZEVqb0I4NU9XMkVqQXhq?=
 =?utf-8?B?MVozUW9rRkZZTjhNQnZPV0ZxdE5vYWE1NmFsTWJqWW5FY2ZSS0g5cGR6ak5B?=
 =?utf-8?B?SC9hVmJuSHhlRFg1RHVvOGU5YXpBVlJwcFpPQkpYRkwwWk9TWTJYdm9BNUtX?=
 =?utf-8?B?QTVQWjV5T1RMMXlZb3VHcVM5a1JIZE9DNTZSdXduL0N5RWo2V1lvUC9kRXA4?=
 =?utf-8?B?WEt1Q24xZ01SNUYvRVBIbU9hTDcwWUNQTGRBcG5yK0szUTlEdjFiMWR2ZnFT?=
 =?utf-8?B?S1UwalhUTFNPTnp3ZkFLTUk2emFRNkppSDhiTy8vYlVZR0lUVkU3S1lTSGl1?=
 =?utf-8?B?NENNY1p3VEJPTTFDaEFHSVpaaCsxdjFWMzQxd2V6TTdVNy9Qa0tGZzBnc25v?=
 =?utf-8?B?NEhMVUF1VVBtaDNoQjh6WDNpeG1GcHhLeVA3cThBczhhdlVJNUxHOHJiMVFM?=
 =?utf-8?B?Umppcmx1MjNMWmd1akhDZjVxZUtkeGU1Uys1UFdKdmpQOEM4UFdFWlhkYnNR?=
 =?utf-8?B?c1hDZ3AyTmJOQ0I3OU9kTW9ZOGhDWmd4V0k1UTFyUmFYTWxDMHc1dDlVRG40?=
 =?utf-8?B?SjNrcjZDQVgzZGF4L3lsVXYwZ0NxN2Z2QitQY1NrL1RKcFR2UGdxbERJcFBu?=
 =?utf-8?B?R1dyUmRWMGxPM1V6UmRzZnlzMlU0Y2FYTXV0empLVWdDTFVrdElJNHBQMGRv?=
 =?utf-8?B?bGVpVFF0RVNZMzFYd2FJcWlGM2tnVTZMNUxWcjFOMU5qK2NoR2lXNzg3Sjd6?=
 =?utf-8?B?NnBud2NFTzQreFpCUUpVUzdqTTVTNllZV2hoL0F5TVFtNlREM0NzQ2kxaFNK?=
 =?utf-8?B?alVkRFl6ZTVmUWU2MUNDU2ZDN3VrTGVSZFlFamMySHM3Z3hNZkVHS0NsenVD?=
 =?utf-8?B?VVRHZFJFK2ppeWtJMU42R3NvOGp0QjRzbUQ4RVVCOEpMOTY1V0JFTGR5dGpZ?=
 =?utf-8?B?NjBlYjJkallyZmdKVWtjdnlKWEg0bzJRS285WlhZcjI3OFVQQWMySllHbURj?=
 =?utf-8?B?NWo4ZWJqcGNqeGg4dm04cEJRN3ZXK2ZHd3R6ZWJNNnp4aTQrNCsvSmRKUmV2?=
 =?utf-8?B?NVlaUDJTNE42Njd5Mlg3ODZzOU9ydThKN1k5N2hlZlRqZlRrOXdWeTZ2Qm41?=
 =?utf-8?B?dzFIakE4QThhUkNLREY2cmpuZFNRREVCa3ZvR0FIZWt4RGJXOFdkbkRwOHhX?=
 =?utf-8?B?UUs0TWthY3hPMTc3eHJZS2M4VVFmWWNwTEw1R01BNVlZbmYrNkw4YjlDTWh4?=
 =?utf-8?B?V2N2bnEyRUlUbU9HRDZMTzA2clZNNVVDL1BzelFINDBBaWhObS8yTFlkSWtu?=
 =?utf-8?B?Y0ZScUtibVBHbE1jV2JkODRaZHNTWFpFTnkrbm11d09keklEWHJqNys1blZt?=
 =?utf-8?B?K2VQWEVEeUE2aG9PWVdReUhCdVJoZThlU3ZYUnkvdk9td2Z1UC92cTNDOUo2?=
 =?utf-8?Q?1hOC0sxUyeDzO7Y8EB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f959532-f49e-4d2e-7310-08deafa10166
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 21:05:18.2596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUZ4I3hyuV6wd1gTXSs05rEq3oWf1gz/nR7iJXG2NbkeO1tEkqWMCmvvKY80OjM2VInGljhlo1tdEQO0wiXCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_140522_024925_0C5200D3 
X-CRM114-Status: GOOD (  10.95  )
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

Add required proprety ti,deskew for ti,tfp410, which have not defined
default value in yaml. 0 is default value according to
drivers/gpu/drm/bridge/ti-tfp410.c.

Fix below check_dtbs warning:
    dvi-encoder (ti,tfp410): 'ti,deskew' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-babbage.dts     | 1 +
 arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts      | 1 +
 arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
index b17264e06e6916057c426179e4207c4a28acf1ab..a02e9cd0b3fa04efc4df49f8ad990515d5e81671 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-babbage.dts
@@ -126,6 +126,7 @@ dvi_connector_in: endpoint {
 
 	dvi-encoder {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
index 0814f5665a59c3a64c6023714a3b58230ac80dda..02be8b6da69619a5d33a7b1e964e951addefa676 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-cx9020.dts
@@ -60,6 +60,7 @@ dvi_connector_in: endpoint {
 
 	dvi-converter {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
index c78f101c3cc122f418b708b1c274ca11b586b65c..6a6ef4a25d8dca7363a527aeea4ddcd81acd58bc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-utilite-pro.dts
@@ -61,6 +61,7 @@ aliases {
 
 	encoder {
 		compatible = "ti,tfp410";
+		ti,deskew = <0>;
 
 		ports {
 			#address-cells = <1>;

-- 
2.43.0


