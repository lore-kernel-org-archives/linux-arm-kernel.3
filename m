Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F67FD4F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOeSSqq9x1VbGCtygaBOh9OH+Qb66Ud+ElZ/8hMIMIo=; b=F6vX1SlgHvFGxT37kK0zYGE8Pj
	g1sWOYFPiGKvT0poZEUSKzJRB4ZdYaPBDi6Q98LPavt7fVdzPIM2BRNHeL+V0Tkr1SPQ46pNMBxkC
	Oxv2UHUglE6Do8IvqAGULMM5//Cgh6emz2euGQVhwoc5ACtQsh1l5dOz0FDt86xUm1LLVyUcwT5ei
	l5GRcJbb0nfQGXy2Bsswp8DRWux6ug7cLFu100u41QGP+vmQBMsh6X8lUn/WeVO0bIT3oOq38Gxuk
	YdRBIpwlEnhcm/zoir2Xk1d1Rs745GerhMRJpkvdmdlnLSI9AXnvcrnibX3aj9qlaFRr2p8ZOWfrH
	vh1sU2HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01wc-0000000A5mh-1aaK;
	Tue, 10 Mar 2026 18:36:38 +0000
Received: from mail-francecentralazon11013036.outbound.protection.outlook.com ([40.107.162.36] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w01wZ-0000000A5mM-4By4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 18:36:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz/1k1PMH1lXNkO/xPoR7HxMqd9Q5GRuhsqPwndSlMXtLTTfvfaxKiHARkC2g7LpJEKFVMV48opEobzGK9g9SrZ2iQLWLBIZ0Biynujq7CP4rNtFB39pxGkyuYh6k2OVp3dYH7ePZIaQEmpLm9KYZ18jfWLL9XI1ccWkNdpPP4Q68ZQUWWCTCDzmNy6wvhPhIXenLteEsH8oIqN3xJZRGNqXa9Rn7shIi8ijTizN2NKmHx2ydITVkqtJ32H7R+GbNw1jdbTbGQPSBoT/3aT7Mgz+lWI9dvE02KcCNfUHE7y7fdsPHVkX3vfX4sfjgRQtjmYXnczUpRMkPwrqbFFu3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOeSSqq9x1VbGCtygaBOh9OH+Qb66Ud+ElZ/8hMIMIo=;
 b=bxK/1kskQbwbhwapPo28FJJvO7tvZ7NEkw9fEEz5uNcPuRSMnKSNvMYuEU8/vyp0vLYAcJp6+uiYkhpztBQYxeuDq5rD7+CwMJiQkQzOfEnmoho0XSAR+8/t3YoGgEHzWTkTohpZIVZraKNg/lDUgTkQcoZjNF7LkZ4XkmhPPJgOnHWrZzKLUM4BJaMznLDpEvOnrXSd7m+QUjCjnnF7VfCKn756JDvEUAhQlieLUNQeSuzDmBC1m3Hkuzbo0wXspoSQ0ChAPw9Pf4IOtvyVvs4SfdZAausonBjNf4tF0A2To2pVEwwdflgsASsQbGhlG/S9sz+xVNGxB8L4UTgDrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOeSSqq9x1VbGCtygaBOh9OH+Qb66Ud+ElZ/8hMIMIo=;
 b=ZxkeDKiK6OFvSWbzZpVxVDg8pGUBah5JRepHk/ydGCes7dX62GG/lXx5ie1qmc1hDKQFcj8T37b/PPzKGcbe+WXsoqVk8MGaiGnd7g5VpXDXRg71i8UyMy93WGO5riAIRMo6lu2f+Y5oM3AocmX6Fv8z5OpJEtAS1CQW4iSXKG53FmWS61DgsqGu8tuzVnx/tdX0f/tlOTcUHReusfNStn6Gryp16Wk3GJMpTX2Cv3bHMRaLB/9XjPJxje8hbWHXK5DNpyvNz2lNOCxfhqs4KfrEWYLTZ7MlCyN0xoeW1vlma1R/7k5ZoTdk2vbMkyqHCmQJ/IYaZa3fimhdvH1Vdg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11711.eurprd04.prod.outlook.com (2603:10a6:150:2d5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 18:36:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 18:36:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock
Date: Tue, 10 Mar 2026 14:36:15 -0400
Message-ID: <20260310183616.2229522-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310120014.3178231-2-alexander.stein@ew.tq-group.com>
References: <20260310120014.3178231-2-alexander.stein@ew.tq-group.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:806:21::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11711:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ceab17f-fc8b-462c-5b1f-08de7ed3f273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: X9o2RkdziPLwM7mrAjTAew7ugHmYxZm2U0tE66YL3XerrlF9QwBknfJDR6zGhVO3XDi5pAbPVHylRHdEuF3bRamp2Yq93yVxRTJjgtTXQHjjcRo3z/K+rV8Bvq1jUfqRM7E6C01gUSmn3EHANaL/+A0TdOO6dkLvUaXracnuVbvkzYJhjccKpgIdTCXOyH++tUPRUAmBiyjxXW0eGczr8DEImsWK+L8+jS6hc8cwbEdEl7OEWp3nY3FFPZZV/bIgk2SZWx++VnGwLGxsBTii+jtSENciiE4cyZgeHdx7uNenVthLO99CsGSJDJ+SMwHMg2OXPm7siQpaEZanlph/F7Wpzhrtk/oboWJoNMbZ8r+28gDunn3c6+NsWMB8uuNu+zdXWHVQlE+9UmThZtb08shRsH20NWSiYM7Brk0XNvI0H5hlZTt3giVVol9O3BMwjNnPYntyyElufO5SbbAeD6Q47ILrxr3FIRVDan/B5pxASUuoOXCOrobG4hYMGpny0aB5tP0zRQZOatDhM7WO2q/ud/GmFJoQDaa5PW7IAdEkSDqTzvE3S9fDJK+gYRBEZRlNMQmRlPDCSohX+G5+XaaL3h/3bDKjkX4VuzIJd0z8PWzPXe4qZ/Lol0+PVuVpw8yz6iEKRFwvWA/WMFRORPK2suDALjMI0KaxONmJJBnjGU+WkSABWeBZoycFycQdGOXgIX/adcv/RiNcfocUpg9qQxx948Twxjb10ennkZBfdjz2rOUQORTykEwfLu3CRZydFD/TpTrFClA6TSJqVqjWjHxbbEqqt+dHm/waEF8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HFalZJgLlMUPt4IKBH3j1LVuMJSzmrxMoIysvnCIPLUtilY7W+btov+L9j+/?=
 =?us-ascii?Q?8XHM6+4tN57nlDW7tdkRIopkJB4shl49cRBJdbrY5nZ46TuDQNO0OL5Qzah7?=
 =?us-ascii?Q?LvDuB2t3apeRbKII7OVGI+V9V1AZW6mKvQDhDe0bozomFtsV2VgSiFFUaRUS?=
 =?us-ascii?Q?f7yGdO2PrqTjzlkYJzANeFUGO8Qkq2AMJQvBt8eiV1DZHpESvGGDzJx5pOb/?=
 =?us-ascii?Q?WcMcn3eHh/KSucisVuE1ZnURElB0PDByPNQYTEMHqP69sVCuslsyCGcdpnEl?=
 =?us-ascii?Q?uKh7Mr+TlC5wHS8h5xsFzkk34cvnG9OwOK3bGGRKKL1hfokQnx7nBhk3KAQc?=
 =?us-ascii?Q?MumwQA4LenjS3RIty5bw/AKS83qqeQdGJ+rZa6hUR1AFP+zQGzo6DsJ09nxe?=
 =?us-ascii?Q?qm5E7lbK16HrxHYY966wuJn/2Nl0gkwGmZqikOau8seAGKuMc5JPvWwAWc1M?=
 =?us-ascii?Q?dHgdSi3v5fqlTrcdsJPQVMZj/Wr1dITEHQ+xxm3P24g+o3NeQw5mWhlVtr8p?=
 =?us-ascii?Q?3k8INlUMXHCUTmOj0Fs+dqwu/xZmdG6h05FJWWmndELMBwS5oppkTVRGQaql?=
 =?us-ascii?Q?4SEbMNC1qQ6pAjihJN+BlEj/aEsqjE+0P7DCLYF37bN10Ui55QCS+5eIuoZl?=
 =?us-ascii?Q?5xQbNlrMZj/1bYdmu5eyhUrGQC6CO1DJKldLF4CbyjQSC2+TuCYzYLa+kir8?=
 =?us-ascii?Q?J6PwO/50eL3h1XvrlhRBW/O4pJMoTdLJ0KZkwvKkFNHr1N2G9r78vySgk2uU?=
 =?us-ascii?Q?nkIQtycvuol90DyYZLmOgD2zXQF7LvP1KcFkwEuHoiYZjsJz4BR0KQM+RsaT?=
 =?us-ascii?Q?VRZNX4dF4zZt2TtWG5y72sCmbtJW9GJ17Zww+OvEY7VESFjEpd27nocTJbgi?=
 =?us-ascii?Q?1PkgbblEl5PyIu49aM0V7Li3ZoPzA3xNzmz6FESKSLj8vRuxl0X2ufumJHWx?=
 =?us-ascii?Q?MUJYh9L8HsciH8qZVQn2yEQWxyhuVh7AnrQyiQIv94uxXcwZpoawY0DfMylq?=
 =?us-ascii?Q?MXkk0BbYJ1r6KV4m9Rjo5rddBm+T1Ul8vI6rRE16slaXnXYoP2GJm3WkPZMO?=
 =?us-ascii?Q?tTyOdozSw7pS1UuFYW9HRuJVAIDPUElGG790ZGLLRUgVVFYHynHMg1/L3IrX?=
 =?us-ascii?Q?FzIlYKcZTInUIbILQBoYdDuEel9cFlGqNNIUvjiwSTyAJEGEUuVBlVBqUsbG?=
 =?us-ascii?Q?uDWl3qGdid8+FfpORpm1T5BeSz/QwySg9AZulEC2qjqozIpic/sHmtQnG+EW?=
 =?us-ascii?Q?KdJyZlX0ZOmzppmCMbddnpdwk2hyPFbNHoCDC8M3eYtaFB7AcUvCOvsFmVsI?=
 =?us-ascii?Q?UpPJVILuSySvCOdLF+SC5giubpMouebO0E4MOPv4FLCSjL7SeCyxwBhHDARt?=
 =?us-ascii?Q?RcNLZPeAvERU5MqmBII8DrOSa3TPNRkJMV1fu2I0NcIFuVYVr7ji7Y0yPN0S?=
 =?us-ascii?Q?f/u1SJrTTAkfpJw9mj4Lkf/LkQDolP/ExEMtVy3N79boGTN0BKmXZYK97aIP?=
 =?us-ascii?Q?pRurITcWF2wMN3sTWY8Ipr2N7BLLR5e5/aB+0O2LW2gqTTViMAX00c5SyPiO?=
 =?us-ascii?Q?LiS3WysUKwKpxukfYR6cZY7gK4V23cnD2Qk1c5/S0qhJvyauixuQKxdpTkSs?=
 =?us-ascii?Q?W3535DlW89nzUQMBvAo+NV+Hg2ahsYecfWkILo+Zw7dHSX6+4gvRRCxnfvba?=
 =?us-ascii?Q?RzJUypsGkBB7djm8dUAOOSEwX87KrZ9PeZg2MHWHit7g1N8Z2/hhWQJyV5Ip?=
 =?us-ascii?Q?rMzbuA5x5g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ceab17f-fc8b-462c-5b1f-08de7ed3f273
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 18:36:30.7759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mpjKJFoafOLdqgU41pFgDS/snPyUzwUgoRk5X/EufuHyktdkp4oUYGXtf4d6uMkJ6ly2pw3rySZjznF/TMy6zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11711
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_113636_035616_E27CEE8A 
X-CRM114-Status: UNSURE (   6.14  )
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

From: Frank Li (AI-BOT) <frank.li@nxp.com>

Subject: Re: [PATCH 2/3] arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock

AI: Commit message issue:

> The DSI burst clock frequency is to high resulting in flickering.

s/to/too/

subject: arm64: dts: imx8mm-tqma8mqml-mba8mx: LVDS overlay: Reduce DSI burst clock to 600Mhz

Frank


