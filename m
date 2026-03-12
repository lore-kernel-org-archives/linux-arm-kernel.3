Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63F8106ACDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 19:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vi2x/PAsbGQMSdNCuMzYP/IPgcG+NUlHm4qA77xxBk8=; b=MIqspRY5NkZsBq1HJOhkLEnq81
	tSYTJXtZ2QZvRVBEA9qaOMY9e4PVDE2GPBYo98nQhYGIo2onE6vqO5vewGtG6pz5KUgD1kHDWXygA
	5TDvSIDQBqRFVB3DIRgRE50xQZWmoJqzSB+LVpussTNhaaxitIx7H7h7T1ZFpTngE9utLLJAiqcJu
	XivgdiEgDVD6KRllh317DqC6VOoe9i4zOc49zOKVgyi7+9LaNoZEVCPSWybBFv+09Lq8Hoy/+Gpw9
	T7ZtcmYZ6Ge+Wa1yGWHXCuHfAGVjLbAdDLR0Ibetme7krstCz5hDwsz9CzMK50O0A0O8zKpFLpSQa
	51otMd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lTv-0000000EzwP-03fO;
	Thu, 12 Mar 2026 19:14:03 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0lTt-0000000Ezvj-0ELJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 19:14:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMwSZXguht+bNw+zE/Azv7IzApH1GjGRXiE/k7YECCBn8zEFsgykhPg46A+QOSoWhHBdXiSucprJ2yG4pMeiqMIIvsSPT3AX/elTJ1rFd22DKgletp8bry7IP8edzESudXScbLkoczi/Kk00SEvmHPHq1pnATCFlm+U2HLI4KdMqFCKCnLONmU73yjcv5h1G9SDsED4EAygfEUL19FSzVxNxuO0NxccExL//Ff5yxbeBkWpPPZr/aUdWoV4TObFsJcoyYZGalXjeZ6p1RKO2gkj2/YUh0QhCB0dM/dMok3U3TX40CafyIdsN97Z5hyK85weWHsHK83f/LQ1Hk47ysQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vi2x/PAsbGQMSdNCuMzYP/IPgcG+NUlHm4qA77xxBk8=;
 b=sk6fNy4mplKjUCgxrkPGYn1YbK/f8zrb3IUSsRgu6tcG4tgY1mQdx3HzHpsoYOBC3neUPm8BDaqosQJwHd6NCkfVdkkADg7dgskxmpXihO4QJ/u97f7O3h98T7qWQrScCJsxrjaJ4N3ULSko/PgwDgxio+ua5UskB2+6WixmFyAOSAsU12wIL2MCm/6tt9YhObBKR7AuaIZz4mksjRzkxcGzqNdBV98pHkS4tUT7HYUBF/HxvRu/pCvJXskn1xamVs7vhClM1ZkAMvo0Y917ZWhEVKf6Tvd3xcN9pOttbjqoZQ6wK9bedb8GoavN1on+JNO2LbOpc1H1wq3tBjjv7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vi2x/PAsbGQMSdNCuMzYP/IPgcG+NUlHm4qA77xxBk8=;
 b=E9dgEqxNRBQ/1CEypz4QJ44oSzbc/Z+Tf5v3p6gxcxLva147xZ02N26qol1Gn5Z905BsOSMK2I2DqrTXirNL8dv7xY55Cn2FUeylYNGYJMo1CX9xRucB47w0/dzW7qsyPbxkBPRWbH8F/BFXWRpn38mH7sHpjuXA6qpFyO2a59hboO6IOUu7qa3J7EngMZPW1q5bKiWWOASfy9002d9+tTRf4McGymYTSOHk0udyWccSjoS2C7Fw8mF3QDqu2GWW2w9mn+lBj1E6pr0/W9BcfrEe2gymdkAoy8lnfXhiwBtwb7nHOROjAbMbjydhMQ38epdg0J6rR14PYw3gFAYl3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB9124.eurprd04.prod.outlook.com (2603:10a6:102:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 19:13:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 19:13:53 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	frank.li@nxp.com,
	l.stach@pengutronix.de,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>
Subject: Re: [PATCH v5 3/5] arm64: dts: imx94: add pcie0 and pcie0-ep supports
Date: Thu, 12 Mar 2026 15:13:39 -0400
Message-ID: <20260312191341.3479958-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260312092745.295578-4-hongxing.zhu@nxp.com>
References: <20260312092745.295578-4-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA9PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:806:23::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 946647a9-efcb-421d-6a15-08de806b801d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|7416014|376014|52116014|38350700014|921020|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: XNLry3DGRrFdgrJBcWhp9slKei9fisMIIaXhcMrSgz70QuUZdg/9YOhH1PriGTNDukB0O78HE+w/RB68fjFh5MZYsnQu4+puqm2xT13j11K2Dtz84KPq8sbV83ZDEjJXotk+5bkqeqwG+Q7cJg9ztQBeTvXnEXFvho2ZT9god+8Z2gqH9K+ldWCvm55InA9om1c4rc9CEZbxEprdL1qtELHdQvc84CeFqPH6hEyHF8JOFemGEICZfSfpoU67tj5DaHusD4bmCcOrkXQmCkqguZ/N2DoF8/bAUxUTxQB04zqT07zdd04M+gFwmoVNX0qMBOfJZJsFoROS4iFZUZrWYrqecCoxxXekm2nTPiJvdMY5KI7bX9nq+2XBusDQ0yCQZDIIIRJbCqxzY1m8D96uWsKuUefmHMfI6IZSMWgf0ZmNFOkCuCC5q8Bef+pPwJ+xb3yvobKbYMCi5/I4S/wHs23n0FI5de3z5GcQZw8RBeOx1sAH1UzoZZK209OqijY191T/MeewcTqwg5JadLXBcD8lPKgulGbFlFWuRJQPr8Hd4SCKfHOEPDTDGC+Y4bWFqEPtYg2p1w0shZzy9LKVUv68+3/FYLDe96CDQWoIUlVv4xaUMtloVZhSY2V73w3N2fFLmpikfdSdnIzNXn93GQLLhRkHVMQpB+ojdJO1d4zCIPj/wEudd/hk9WNXrq6a3gsRD1Tr2SCtLY5ZSuuKHXmkbZDeB7kqB8vygYrLjcz4mbG6YM1nv3RvIX/6Z+NmMBmORw4WsM3bRgDNlwYlrn+QGP/K9KMB53jBuckNXWnwNtbkIqpbBFetyYRskvXJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014)(921020)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enS/IGzccxDGlQZW6vYgWMnrar/zmdZcBXK9w25FlC/UF05zX+HCT3Co8bW2?=
 =?us-ascii?Q?x/PKJwEWJvc0V/L1gZmDT0qLUUpAb/7tY/NGPQNG2X3N2izJTDofbOwvjxvp?=
 =?us-ascii?Q?2ffn0aYQocXqjpDNQDd9IMEBUkOvvO5y+GXzkUh/TuRWaE1zt7FBrELu88lk?=
 =?us-ascii?Q?UkjOHtLgSnh373qqfmNp/fEGzEoolf7DQfygSy4CtaTVptmyN2LzWvQTONAP?=
 =?us-ascii?Q?i6038cz/wOIn+SEX+HzUX07xHA1G28kdpHbXkOTlnJQxNTEIAklA5JPtoJWt?=
 =?us-ascii?Q?JIUdUiyl7XAqgR0aw5p1DyAUlSuL1Ll+Y9v3j0t/BiRYLCIHejF2eqNYlUN6?=
 =?us-ascii?Q?BTs9iWLlH1ktsGu1+MfJwJiYV6GQZ9x/k8Fp2XldgAk5qzxaeVZ56Bv65/BL?=
 =?us-ascii?Q?HbycBA3fAwmzB34LK/9JJbVM/i5yDwFmhD83XtLZA18iktbf5NiZwh+ZZNir?=
 =?us-ascii?Q?rRZkKyvOiR8brraVFXBHhcazQJ9hTUO+OUNkxowCD6gvT3dwyN8tNrHq/8rE?=
 =?us-ascii?Q?gMyPqPBCUjQRXOnzxpJHrRU0yq/4wv2vgxuf4I+ZwEYgrcFVRptvMW4oeQ7F?=
 =?us-ascii?Q?CsRUDHvbCQ2W+B0+8aCYPEU8WUSrZlgxBTE4st0oMZp6ie48yF8Q+nqxj95G?=
 =?us-ascii?Q?LACngeJOOc2m2GCbthCVTmuoSknwNgALXIuNS8xxsMkTWfseooIViU/4TQ53?=
 =?us-ascii?Q?lFdM/3ki/oQ6aDuQzhzk+QSO3nBywzzWG3cVjmMT2Ouk8nJSdm1qvzV2mPYS?=
 =?us-ascii?Q?J4DgFy8Y2Lenh5dPIeRET2xG6SQkNjQJP6Zr9xhRWQu6Gwmxwq4n1jKjOGtJ?=
 =?us-ascii?Q?70L8j9KWfp7QF8m8NbNWpk6puNxCxbvSGBjcBmJHDeaNk3Cruw9BtTW7deoy?=
 =?us-ascii?Q?VNvSBroXnkhjGzIlkB/y5MU9Q9/qZUMCzYp/2dcUHBRSmpDRbonSFleOlL5v?=
 =?us-ascii?Q?5bNndq1exYkaHOIUS64ehvuPVNWBZOS1VYxg7N4kzjCuNfgT255tnOGOc/po?=
 =?us-ascii?Q?zSp+nnv6YMW2EIonHS5DOozcKE4W2OGAM32JjQdF1FPNFvYO3aXnX/qBUlUz?=
 =?us-ascii?Q?c5XrrxwOuTU+ykYgQgGFbkY2AlrVY5+QVmp/nALbzw5qnY6ZIGcF+Bcqz3Sr?=
 =?us-ascii?Q?X8q8brIN1445wZc+OlXw41tAxcZRoqzR04uqCzSCa8vNqP4R6siX4s9msErd?=
 =?us-ascii?Q?qx9EDjDs/hiJjlQ7bsb5ais3+zHqwsLNjjoE0ezFO/eQnVD01Ei2Ke5rp+Nu?=
 =?us-ascii?Q?gO6aGcdIwI488DaThxs0aOhiQtISTStWCPGb+cU354jaTNUkYxgucYvfUDO1?=
 =?us-ascii?Q?BiqmlpQTQ3yMpp0TloXWILQVRySqmx81AlQaW2vGng0u6tywt3DhjJZVFHqh?=
 =?us-ascii?Q?UAEgYczbFJYzi5FOzXrKefZ1ygmxhm+xqrINT06x6NUZB1HgjbLWsCpcLJvu?=
 =?us-ascii?Q?XM9nC3pQbI3mwjiyR4xtfSavxmxHmOMLm0A9e7M8jsJeIRfc0xg7e3fT0pHH?=
 =?us-ascii?Q?+4o3kkHHfgsnIQy/B2Ne4kYAhRxS4Gr0MVvvNvByUuLuMRs6dF7gKnKJrSYJ?=
 =?us-ascii?Q?QeJ74dnrZ1EXcHVymnPxDWodHm1kCYxBhjLEGeTfYYIfXHoBqcdMMe44eKjO?=
 =?us-ascii?Q?KQv7Hd+KL2bE42p3GsRp5ns5/UiB10nxRl7tefis4S48Lf7TrRe+u48a8wrT?=
 =?us-ascii?Q?hBmD+d/jwpvY3o/XYi9Xp6d/iTfxfn8nGsp1xhMvOAdlIeq8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946647a9-efcb-421d-6a15-08de806b801d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 19:13:53.5379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H60njgQjtYnmTHFmmQ5KeMcZKNQ2edc/vwehXHgSDZdV//lGm/5lF7mYPKF5altTE+iAfIdngNSrRQH/G12p1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_121401_122007_581B6C32 
X-CRM114-Status: UNSURE (   5.89  )
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

> +		assigned-clocks =<&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
AI: Missing space after '=' before '<'.

Frank

