Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03984E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bkFJyWlCX9yGUlHrW/SwXow8osRBxQbViEK6fBSD9V0=; b=2qRDBNB+fGi3pqxYY4AWMdSTOb
	JeoWnNRo3BTjiQuG90NLyt+lEAtXNrDx53p79giGkp6ITTz+fj/h+u/2yFoIEjdJJ6KeTizLdswnY
	Q6j601/4vj5VUqW5LFfzqDpBT9DeP6X9HPEUtUTtx3fNEdmMFf3n94CIH4qrqgW8xM5a3aw7Y5xjj
	mtktG9Cv6zpqN8CU6Zey+VaECnNkC2X7eqY6SZgGEy2IOq2MIsKeg1wuwg4QLZFeVogaG4yVcI7U7
	RKmXtbKXTLE8pywN6919L4vY37ClkCe957GABJSYlTs9Eb5I5B+Htm92NbSbu8/iOrQxyRYTkEGQ7
	okuJgFEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzou-0000000BV1K-2DbT;
	Tue, 10 Dec 2024 12:58:32 +0000
Received: from mail-dbaeur03on20607.outbound.protection.outlook.com ([2a01:111:f403:260d::607] helo=EUR03-DBA-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKzkr-0000000BUAo-3rfL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 12:54:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WFBhCOWMTzWDjuTTIzTOEt6CHYPx4WcRwV0ZXshC0IpnSO9iMq1+6HNCtuG0by0nyPoa2x1zJcTUkXyodDpSvc0mNOFBg6t7GQqHN+WiqpHVpnAfc+6PshOT0aGUHAk6oz/j0BEtflce9fCBGFiCf+JUH5+PB0+5iV1CkXQHMb8R8bOv3UuZ4a1kHyh8nb7hVsm+TfevGsyDpVFsvUU1pXm35taWcq8nigNlf99GpXm2z7NYssBC7UF1tReVJm8XcO75UQckxem1o/xbFYrp8+RboNZoGIHGe0MIlIxicJABwTZWsYgRW0CQuswytvTOtr7uM7q+dQ5bmtw9BHuqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bkFJyWlCX9yGUlHrW/SwXow8osRBxQbViEK6fBSD9V0=;
 b=qjOUW8C6K6k3qtnjvxfSTmjyUjj1owgtm/b/3XVl/zlZlJN6lZFHlvgTopv1ujii+8nZ3ygfkXyZBqivcASJAJu/aLX4oNvrA8a2f60zDycoAW/CaQ1wmNZsHKEVt/ooHtY5fm3SS0c8R4H10hcFw2ZHIUnT+9vHfZ03tbEpv6oRI7O/uEDpG2pnIAP4RGF83D+AaVKOPIaX5DOJhw/bshLI9gZBFrZ0QtdTnu9tZaLElnX8Wfthi2tU8D2Oq0NhbNQe0Lm6HwDSBib8/dNDwxymXwe+4WMMoUX3bu5he1nua7xin3oZY8vtSW3OYW5GmubutYfT/NBuQlVAjDkxOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bkFJyWlCX9yGUlHrW/SwXow8osRBxQbViEK6fBSD9V0=;
 b=Sy/e22JR1vKCKqqif8t67Xgi9GK5dMMEAJuU3YWve5mwUsz/mDKTKtkkqcUNjRRzbIEJJ2t/GbmaAI5S97XGSRk9b4nmQ57f1HMDLQTBLdlD3wNHYIiFKQOjq2Hw040shEP8wAXTi8z6F37da7MdB4i3ipTyNy5U3oVdJjw5b+qY2dRPMkIt+QAwRCoAPqBIb0nNSzR9P3QGWNfxUz8pzpIbPISsnQhAiwEsRkZ7UQ2qOHLuSiMj3pOUzZftaiSwB7MekIt8yGNEPZInrc+0wUKxsHxkcMk6Mre+a4sGHOAGHy+t8Ojtt9rxiOKZQvkzKz0llbTjZCpkTGkdpDN4nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 12:54:14 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::84f7:e2c3:ceed:c0a6%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 12:54:14 +0000
From: Daniel Baluta <daniel.baluta@nxp.com>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	robh@kernel.org
Cc: krzk+dt@kernel.org,
	conor+dt@kernel.org,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	frank.li@nxp.com,
	aisheng.dong@nxp.com,
	daniel.baluta@gmail.com,
	laurentiu.mihalcea@nxp.com,
	shengjiu.wang@nxp.com,
	iuliana.prodan@nxp.com,
	a.fatoum@pengutronix.de,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [PATCH v3 3/6] arm64: dts: imx8mp: Add DSP clocks
Date: Tue, 10 Dec 2024 14:53:35 +0200
Message-Id: <20241210125338.104959-4-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241210125338.104959-1-daniel.baluta@nxp.com>
References: <20241210125338.104959-1-daniel.baluta@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7fdba9-04f6-4a8c-f9f4-08dd1919c032
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f/mOT8rWDYWMF7JJr2O43tO1WhTSyOHKvx5VEEz4Oz4OjTGjQ+Vt2nmVpY5i?=
 =?us-ascii?Q?nl/yeHzTkhu2LwnDwZyWXuCXnmJ4Xuof9JoHZ6bDcSy2cgHbWS8zCgZHdPYg?=
 =?us-ascii?Q?XmT1EWUtrOLXFZ2P90DTJ1wT+YrPYGyJbvUwMsnkiBOH/fAsmT8QGuzXyJeA?=
 =?us-ascii?Q?Q9NqjxbDqubTriuZJTfuRlziKFHSVuXwtb0v1obhydbOL9h5JKarl5uwG6/l?=
 =?us-ascii?Q?CrlEmDv+hkp+t5fI5Vg61X/asUK8q96kOB/I9v4aUHes92D1MUOaSRuxcF9c?=
 =?us-ascii?Q?FLSQ/2A+8q9YLbbB4btJjd2/IYdzP00hyOFKuuoKt7SE5ciqijWjwY1gNX0B?=
 =?us-ascii?Q?Wh1WPtmQdaXPuDpeOeIc4mnX7G1rqR8rNGPwn6h9CHGfnLtxJ6pgME+0bsiu?=
 =?us-ascii?Q?Jr8Dx3DJS4OVw6aS/AdqUpysIfe4A6iDD2bZsOkUZYgvqRaGZjKyoWIoc+L2?=
 =?us-ascii?Q?Culjm8dq5dF/ld00QAKpyYFCOpaBGbSEyIkpHI9m57wxxa819XqLmFhqxBw8?=
 =?us-ascii?Q?uSZH4FDSbLKMaf61Dqzg8niYxwAH6MlH9IGqGjlTPucl332QPsEgtWn3SiNd?=
 =?us-ascii?Q?5IW0VLb77W2eOY5abssEBYa/yYnlTJ4nYwcWwnXhpJBpIRAOBqFt40WzKVCr?=
 =?us-ascii?Q?ubfXEXSTrXmAUFsZbFnrhLmoCYlJXARAZ02VfhJKecrbIY95/2O7XY7MejPf?=
 =?us-ascii?Q?R9Ma6FjbwizuY4+zxo1DsHbOuRFeTSnnL9tRXRWHBlrkSpQbsO3mBosPgib6?=
 =?us-ascii?Q?eIyLv8zpSEiGAEmerbDEFIk4rFUjxKrJ2f3Ow2Y5AdgC15IbmaJa9/1HFZJ+?=
 =?us-ascii?Q?IyV88M6Pyn97sJB81LPgakZCs7x+jEGFDtunska0j26wyGO53mYMWD4BEDhc?=
 =?us-ascii?Q?/Bkf2f7sM7t5rzo3FLSRS1j/Ox7jIC13ubacxt8ep7NRp38OiH06RWQrit+i?=
 =?us-ascii?Q?nY9FRj8uRz/9EkfcwFnJXz4TS+rrWHy/Iehlf/Dm4EnHzA+NWHn84v7NSGMs?=
 =?us-ascii?Q?7ZQbrdzxJFGmrgO8Dlfh8b7xaRJjoinI2La73grfnJVHPltC6sdAsXRVFPSD?=
 =?us-ascii?Q?gysI6vAQ+aAFH4oqf49TwM1PNhYPiEOlmhfNSu9/nBov38hYhqQh1YPf+q8J?=
 =?us-ascii?Q?n/uJbGoM8x3czkNVQY5rcGX06H+KD8G2Tf6c1Hm24pgzj8c0AMbvQUfPCcq8?=
 =?us-ascii?Q?i+CoIPVwRLZA5mIuGMpmniC+4MUSnXr5GE5cW12+rtKWDwhknptsuzGT20HY?=
 =?us-ascii?Q?+Muary1HPzPgrvtR7RzEAdzQCRKxpqYbLzmGP4k7zNhx2ou/fo/+ktz27+t6?=
 =?us-ascii?Q?7NQ6HyJLcF3lAc4dnLQw11K+IJKlaWyONY4nIDbBUBuMHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CRIEG9BdHg6K8hlYFnO9wxe3u2OPO8PXdWCToCsjXFfs5CQ2Ze1RXXTDz3+3?=
 =?us-ascii?Q?ZdqGCqkJfeKR4MA2H9ToMdQmUm6VRAMu8vav3G0Ek7aUEWvssUAQoUkPy8JR?=
 =?us-ascii?Q?4pdJfhdb0qwU4CjioUQDm9Hg6t+w9cYTOX+hOuPUImCxBdIe43yC9uzMy+Zf?=
 =?us-ascii?Q?Hc+etyY7vneRm3qy12ifpxtQrr0dR13kxrHplEky4cOA016MbixkYWSFomLI?=
 =?us-ascii?Q?RYhtuBlLFRVcfkq+0JrGqU6Gu++ojpZ7Kl18IMxqzsyDaMYlka9xtD26ODj/?=
 =?us-ascii?Q?STRk1Irbduab+jmpTpg7abfs/ynxmP3z+JZCLR21iSkI3WGSuwhbknUMffyq?=
 =?us-ascii?Q?HWr4XQS8VWXbvBmNguqikbDdU8mE057LFXbNbu3vx61rKJ7dPjPplbK+iRIg?=
 =?us-ascii?Q?Z2G0kJ5TZKvc9G55hS1QfIx8PJph2rLc9a4uPaqVEC4xT/LgndBieOinJq09?=
 =?us-ascii?Q?jtFuYz5yiK9dfcY9lAC8+t1vAwRr+OU9YIXKurX99MtQbQSvAUU2Jprso3fK?=
 =?us-ascii?Q?TPKy2j27D4rvyMf7cFLJG/tyQ1cbij6azMPuEf37LoxmYzCgezeEA5I5uqaw?=
 =?us-ascii?Q?g/BD+c43VvLm/+kqoy/F60HoDkoHX750iZmzsZ70WYkvJqqrm2QQzAUK0W3y?=
 =?us-ascii?Q?OGyRyOQ4fTd91Xbf4Q5jFLvy1JhmK10RNgPsAhYTlFj9oAGzSDgP0XY/IK2r?=
 =?us-ascii?Q?X1Hn75qHLGXk87Y216Dfv8JDfWxTYrt6ARNSeGyNU1z1rJX/JCKWK+3GFbIL?=
 =?us-ascii?Q?+qYPsePEYmJuetgC2SRTRAaPUsXAWh8vNQBBJz5VNYG1HoZbeFr8CeHfl2aO?=
 =?us-ascii?Q?dItM6Rl9o8k5vcofCmCIuWbPR5T6DvpnIaDDCMSSwuIMVr5rIKPZEuaAbm8v?=
 =?us-ascii?Q?kfDxcWFdyjZPGNi9oL7wE1l7MYPc01pl8tqQOUKTjQrLi7mnilPFy6VRXnx2?=
 =?us-ascii?Q?5Y/5k/H6dN03dqVYlsrCyBUNUnNLfRauuf9t1sUTOS/c5afhx/MIV0apGFXp?=
 =?us-ascii?Q?lSz8dEH8yf+OrJFqie6y682yvlbVhRbqJWN89vsZi0+3o/k5mqJqxqBCbqCh?=
 =?us-ascii?Q?0kjy/dIbs5AyJj5okHimIzDkNTB4AKq5cENtDcGhPrmSol6pVfB5RNItC0hP?=
 =?us-ascii?Q?zUHjyXRdWERag9JkqfSDBGjDJEbkOX6iNE5iquPzSp8us41GS7iSRf8CHFrI?=
 =?us-ascii?Q?IlqNYYio6lPrhJ55mO4zBEVIoTGjGXxDRwbBpYeAgcqhN1d2f852cBnzNU6c?=
 =?us-ascii?Q?iUvpD8KuqFf1KSRn38troBjauWIJ5u97YKMACPB3qPcdU6z9Tbj84AkDLGhw?=
 =?us-ascii?Q?BE9HUkvpA1i0A6wvMAZZV38X4gI2CRGN5XPY4UT9KZwZoTqIYQdkoKWlfxVL?=
 =?us-ascii?Q?FOiw1foNqn7va7aTJqouCutSkfJwDDAE2ViRW3lZbHizKfO4+1s/uaGoy5vd?=
 =?us-ascii?Q?ByVOCwd+Kw/D4Pt9kTnGV7CIU252iWvdWZYK/EmhPjOrYd0TKUJyhjrB1pby?=
 =?us-ascii?Q?RLeX0bpsYHuFf9jwIQwYrSQtP2uVTZz+TlXp9fWIdOQBgJfDNeAuMK0uszfN?=
 =?us-ascii?Q?d3ZrCH2xVznZwwnY3VyX/dqRIEVH0RPbyoDyGMCMcRVz6vB1qkU+sntJA65k?=
 =?us-ascii?Q?tsn8mZQeHiUFyEx03MbDGPsVj9IdXh8vDq2RLJ+yzuBgU/LNxGwbg9PF+cTk?=
 =?us-ascii?Q?kRcZEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f7fdba9-04f6-4a8c-f9f4-08dd1919c032
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 12:54:14.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n06lUGfByM/QQNrGdeMf1niijZN0rvsXosBLD8DrxgLDYginMN+8LJesbzJeRooANFbjIfg8JCdRMNcVrQ2LsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_045421_957277_C7A31287 
X-CRM114-Status: UNSURE (   8.86  )
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

DSP core needs ocram, core and debug clocks.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 2f94c55e4999..b42e6430123f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2416,6 +2416,11 @@ usb_dwc3_1: usb@38200000 {
 		dsp: dsp@3b6e8000 {
 			compatible = "fsl,imx8mp-hifi4";
 			reg = <0x3b6e8000 0x88000>;
+			clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_OCRAMA_IPG>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSP_ROOT>,
+				<&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_DSPDBG_ROOT>;
+			clock-names = "ipg", "ocram", "core", "debug";
 			power-domains = <&pgc_audio>;
 			mbox-names = "tx", "rx", "rxdb";
 			mboxes = <&mu2 0 0>, <&mu2 1 0>, <&mu2 3 0>;
-- 
2.25.1


