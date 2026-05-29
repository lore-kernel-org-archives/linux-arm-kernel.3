Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE4ECD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 07:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AYFw6W5Xxrcpld/yNA3aWA27tNFzbyVObiXzFRg2wEM=; b=EEos3VrmBBFrrjyxnc2C7qSuuy
	rYhhXeIgDFtm0IePWslY2nrVVz44WAvT2YsRgpMiN6gpzELDf7Eot9pTlYic8UneThBOm+yiJ/AV2
	n94d1gfNyyrLeVUoT30ert4m4enVYkMmsX0Tk3XXR7mC8qrR9n2kDQLQYjD3sDXK9xn/pno3QR630
	9QNLF4beBxaOQMS0CXkLeM1mcfmy+T8yEk0f0Y6MIXwyYsW0fIZHkAJLno2jI38lEJbqZ19mlyoRU
	KKr6cJkhEISQPDUe0+lVEzu9jILwuPxYlo5qE7A/besC9QjdAqP9KvD4yqD7FlKIYmun72/VFFPwY
	YKaGXGQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrk0-00000006srt-12Ro;
	Fri, 29 May 2026 07:34:48 +0000
Received: from mail-swedencentralazon11013004.outbound.protection.outlook.com ([52.101.83.4] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSrjx-00000006srG-2kCi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 07:34:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmSFBbu2gj/AnlVgh+1jIU6VA7fyDk16adpjWNpI0nVbtrwjyPESTCU+s8wermeYZo+FAn+BTfW9FoS0tW2DwRn9i19HTmI6PsevnJqjTjyc9vUG+lMduudKXpnBnkOcrORb6uxG63ZU+1cMS4Vd7d6sKJZTuwPB60IkE6UxlV20d6w0VEuFLSEzbh0YlMw7h6DjmUfUjNOKuexAxFp5iOak5kcmFEP7ecEjkNE2IXuIJyM6qNGoQoHiAy/UJNmDrGuHm/91ZGy+eJeu2B8qOMhhDsh2Q5Ny9OnBRk4b+6QhdVc0OfocVIVdt8vA9S90i8b7EN2yE7WAzIcbRKWJnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AYFw6W5Xxrcpld/yNA3aWA27tNFzbyVObiXzFRg2wEM=;
 b=wNRmZNzPRUPh8vvN0UjBGibNuNMBo76/PqyycIURUTKvyCxHs54MmWRB2jNXw4jDtc6m/IxM6AuxpVO+cqIMhdOLXGP6f3iBoS0hW4rVrDWs/2ukh4p+qQfr+UziVzGUbghNIbHr1VBRZRaGt+sCbjlnxAqTs9n+2JbkOsudhkjEqw5wgQcgBKUHp+lMI7EG1KI55y6aPsQ/zgK/ZOqogrX4ugmtzrQ6V1q7Amkl+He1cMBPuCABqr2EN592uPxSWrcWTDnpxoOzhXpIZJW5voa1LnV7ktSXplKiZZFWT7eRMR58wmqlypyW3qwMsTv4++q9R0uiylJfQ/llz3wyJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AYFw6W5Xxrcpld/yNA3aWA27tNFzbyVObiXzFRg2wEM=;
 b=JzFR503LjaET+PdZF4918qhy/WgYO4kKitEqHlt3SNzzYGyp2Z3r0R/725uAGHnh6ozZMGD/rIVFhSjCiAK1DqyX4VlvjxZZyiXkfnNugzI5qm3u7tzc0Ah0snk9Q1hZPecwfNwA+Hr7GfiIDuH+29mT/AYhDRDb84WVKlLWSa14cEhwALymXVhlWxeUD+2iDJjujqlhshVHG4BSBxedMeVMiftEi0vZxHhK6wOi301Gzw/Sei+ItXehSUluv5yPlMazCpTGtpv330qD3bgaBLm3I25q1dzx0lQszO2+uu9xuDEdBWmz97po7Xv0ukB23FHdqsKrldJLR0WfKMZsHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 07:34:39 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%6]) with mapi id 15.21.0071.014; Fri, 29 May 2026
 07:34:39 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH v4 0/1] add PWM DTS support for S32G2/S32G3 SoCs
Date: Fri, 29 May 2026 09:34:35 +0200
Message-Id: <20260529073436.1767786-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0304.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::9) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|AM8PR04MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: a77fd38a-cba9-467b-52e5-08debd54bd94
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Adl+YxFrOtxu7/XsdLSRHrAjOTqdzkSlCjvc+TKLrRRe5AwV3K9+13HDZkZEtSQIZfv0n6aM8FNBpmiHYPBbS2CgGbyj6MbWJ1935FkYDpJpqIsy6nuoZjp6wmgGKMiUA/433Mg4NCSkd34+87HG/DFKI/l5WXh7RuZLtPWkOn+Y0qXMi61pKxPk/+slnG/UUe5YQQdrR3nYUM1XP7C2wGS/1D/TZjXDFQlfV7OINo8sExSUuFL9i6a1a4+/+Sn3U3p+0IHdXxuuB2sepOBolcibyPjRCzvnxq2dd4ULr76WpdpeWl39Z34o966HtG16gDSbUM5K1uS+O2Z7Ng9DcNgsAZgZbwiQd6SlSpJqmijWH9Tqr44WmK+cY806WYeWvo3fcuYhRpE7UndmlX17RLUu/g4vDVXTSm5lBU3gy+xyJlYOi3KcNfCIkHuxpRiFTImMG1jKYP0xpyyXS0XlS2t5m9c9ntySaMGR19y/SDLnJVw3/DYIXT7pLWUviRPm76XNEXPygL9MIeLDi97osLO3ZaebKgnFCeKUI9olsmvtQLtjbERv5lKfJXjjtpTqI9Fo7CFIS6g1fMKBwzCZ6/uSPMKkdvXdRCs1uL+/xEKzFmv/SAqPYGLr6CfshPVcNt4bZRNlXvgyiTvGmkgGuKd+oaYlBjxgg6rUuHqUX5zjrQXjO9eDI16sPjauPKkQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MCs5RVIyYlFGa3ZCVVI1dUlBL2hiRjUrQ2hrNmlvYWlJNHBNaHNQaDcvMm02?=
 =?utf-8?B?dkFQOTRkcElrR0VKdzJ4UFlsNWNiYjdHelpFVXJTM05jUEM0ak1ucWdQWG1M?=
 =?utf-8?B?cEYyNzhRcG4zc1NvS3psUmdVa0lqUFRnWk5NVUVQVlYwTWhpRFJ6Z0xsblFC?=
 =?utf-8?B?SFEyMkwyK3laS2VEdHdMNEJPVzRhSEpRWmJzTWlZQWl3SURWazJPZUxPNjk5?=
 =?utf-8?B?ZEJ0Ukh0QjJtUmJuZXBsT0ppcTd0T2RPOXpMTy8yQytTblVVUFR1ZzdKeDNJ?=
 =?utf-8?B?VUVSVUtnNkdXUWw2Vng0ekw1Y0tleDBqT3VkRUdvL2sxaVp5YXF0alNYZm1Z?=
 =?utf-8?B?U0VCYUpsQ0NhSG5LWlZMV2xQaThDQVlrME5QZ05MOVh6dkNOUWtrTHlISnNE?=
 =?utf-8?B?MVNEVVQzWXVpdFhQWkZKQitIdkQ5d1c1SU9uSitXalZWbVpWZ3ZHbWlCZEtv?=
 =?utf-8?B?TmtWVEVzVW96U1RsaFJOeGhYSldla3NOT0NZZ0Z2bEZuZGdEMlJtM0owbkEz?=
 =?utf-8?B?cW5KVUpock4vdUNiZFVpeDdEM3Bxa2xCdXlzQ2xvMnl6RnVsMU5MWDZkQ1I0?=
 =?utf-8?B?RlpSNTV5cXJCS3ZydDdvd2RoZGZlZE1PVVBDZGIwWFc3YXordFArSWJURnpn?=
 =?utf-8?B?NWMrQnI0Vnp3Wm5XWWxHYTg3cStFR0VLQzRHU3JISGQrZDNCSzJhdTZOeUg4?=
 =?utf-8?B?aVREVkxJb1RBQ2lxSHRPNldmeVR2S2d1WXZNQi96Tm8vU0d6NUlSV2FWYUhr?=
 =?utf-8?B?SWo0Y3R1eG80WFZ2UXlJV3ZrSXpIcnJqRnhmRmxPUkUzUFZ5YjBxQXVnd29G?=
 =?utf-8?B?RVFLZkdoaU1lejdPM0VTcjZKTGhvS1M4OU1KckFQZ3BESzZmU2Q2b25VdUd1?=
 =?utf-8?B?MlBocHRaclBLcHlJUHJObnNldk9IQjZxVjlGN0Mvdm8zZXVsSWVLbnZzQUpp?=
 =?utf-8?B?eDRLZ2xrRlloSERvdXdjWmtPKytVT2h3ZkM2T0tJMGN5c3ViYjB4T3M1OFpT?=
 =?utf-8?B?ejNXSE9HdCs1MS8wa29MZ295WHQ3dXRTRCtobGJLMitzUmdGcmlaZThiellt?=
 =?utf-8?B?R3c5czRmc2RhdnhVVXkvbVFIZkdDcWdzUnB6K05hMWZWZE8zQWRTVUo1a1g4?=
 =?utf-8?B?bnRwOU5VTUpHNWNHVER5K0YycjVpRzFEYnVRYnpDMDZ0VmZja1JXQU5PREZK?=
 =?utf-8?B?VElBaUhsNkFzSkswMGVaOTlNS1FWeGFVdmRKTEFwUGJ1UUdxRlF4SDJvZ1NG?=
 =?utf-8?B?a0k5WUJkVFdGM1pxYXNiZlNYdU90VHluU2trblo3MXNuQmdWNDBqMkhTU1FT?=
 =?utf-8?B?OUlOWEc3Nk1iTVBjN1hwTTVvaEtmNGpIRjBBcmt2QXVGenNlZEFZajFhcU93?=
 =?utf-8?B?ZDdQRzU0RStvbXMrY2JYM004MUx5ellxZ05PNFVMakJYeFNaU05mdW1iUVkv?=
 =?utf-8?B?TmR0SzdNWHY3ZWJSaXY4OGxqN21GcXZ1dlk1RGZLdVMyczZRc0FjVFZtTHox?=
 =?utf-8?B?eHk1dU02TzhwRHBOUUUxd2xpYXJRNldHTnpnSG1vWGRnQnFLY2NobVZ6YkQy?=
 =?utf-8?B?OUYyL3V0MlRXdWNUNWJyVlpQdTdLQ0dKT1hSVlZZd3FHcUprZzNVZ0dDR2Zs?=
 =?utf-8?B?NGhoeG9Mc0Z6WG1ZbXFzeDVVZldWS3luQUhrOUdLWXlpOWdHM01jQXRJZ0Zs?=
 =?utf-8?B?d0VYZHV3Vi9nb1ZJaVp1YXBGdys5NlV4NytnV0IrZVRQSWI2WXNPTnpsQStm?=
 =?utf-8?B?MHhYL0RRTjhKRVQ5YnlhVTJJY3ZmMEQ4VDFlRUpFdS9mTVlGMVprTExXNENU?=
 =?utf-8?B?aWZtc0E3ZFRyWkxZL3craG05L1hvbTNEb0w1TmRFSkZVeEhUMXE2eTRNaGxn?=
 =?utf-8?B?MFU3Uk1obXhHNDgzN2Irby8zZmJ5SFBqSTVPeXdvaHp2ZHpYSnlmdGpQRWFY?=
 =?utf-8?B?VVJCSHNxK0IzdXJrMWFQa3MzUWRnSVYwV0szMDMzREcwcnRnUUdKbzFLVDZ1?=
 =?utf-8?B?UmRleGg1VTdKTFlaTzNhWnNRMDZQeHFwd3g4c24rajN1bkJYUDh0d2dGRzBu?=
 =?utf-8?B?QU9aS1hyOGtnTytSaWRUUEFoRzczMVRuajlrZmxmaUFKbGt3QkVDOVQ0QUgy?=
 =?utf-8?B?Q1NKWDNab0R0UFBXTHFocEM2NWQzdzZmUmgweVE4YmhNSEU1KzJydTluaWNQ?=
 =?utf-8?B?WFdzRkYvMHUzMk9hZXVKcER5N1dadVFndllKUG0zZmdlTWMzV1JZQ2NkeXlM?=
 =?utf-8?B?V2F2bnhqb0pLK2JMTXU2aEY1Q050RUdYSDZqNEtQeDBIUmFVNEhrMmxQMHV1?=
 =?utf-8?B?WmN4ckhHYURySnprMlNaQjNWM2lDWDFZc0tUZnVBcG5LM3hiUUVtbmlxYVM4?=
 =?utf-8?Q?C2cA1KvZfvdsUvDlHxNQ3i0Ms0gxSWHHBAVy1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a77fd38a-cba9-467b-52e5-08debd54bd94
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 07:34:39.0271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d+tPRGdAeyVOxIUwLhL2fC94l8xjn1a2bhYVJvAk7GBdgcJ7fj+ij/6IZnFII2bFCQ+STk4dEZvkGQ8nYD7CAAaQqeO4spSEF3snkf/fS5ivNVEvlnYGINM8Y0LTjE34
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_003445_714428_9735EDD1 
X-CRM114-Status: UNSURE (   8.37  )
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

This patchset aims to add one change to the S32G2/S32G3 dtsi support:
- Add PWM dts support for S32G SoC based boards

v4 -> v3:
- fix indentantions again

v3 -> v2:
- remove vendor internal issue tracker

v2 -> v1:
- fix indentation alignment
- use hyphens for pwm pinctrl nodes
- sort pwm nodes alphabetically

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: add PWM support for s32g2 and s32g3

 arch/arm64/boot/dts/freescale/s32g2.dtsi      | 28 ++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi      | 30 ++++++-
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 78 ++++++++++++++++++-
 3 files changed, 133 insertions(+), 3 deletions(-)

-- 
2.34.1


