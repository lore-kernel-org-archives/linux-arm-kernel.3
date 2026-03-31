Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A060AFF60FB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 10:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9tCI94e/hrv5EZhlMZWiSlM8XB0VQ6pQ/471GNxoxYg=; b=cB7oZBoPnDJCcHVPDFlqJBqwhX
	3Alj9RnTeg4gdZgrPKJfXzSQmrU7T2yIgn6cxFjO/BV2ZkRNXv87IGIShNFRVQJBeTufjQkedN/k7
	jHCbf3dEN4EdEqBsl1YS/TBiYQ0OrenIeZ+/XGJzAFTG8btqKosgdjICcT2O8LG2dIv+OBbTwFkal
	m848H/YH1fnISfS+RbHbk0PBeMLiHVvS6F+Ah2dX+SayoIKGz7WGTwXSn7TEXg3dFsqj+SISSN3LL
	zFY8N0mfj0ZyR3AW1RKY8BDFXYWotO2SPyaSPTQVRKAzmRRsxiXVk1IfFjxHMOjqk5+Uz05HeT3Gg
	wHVxQNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WL6-0000000Cmd1-2iEq;
	Tue, 31 Mar 2026 10:28:52 +0000
Received: from mail-norwayeastazon11013004.outbound.protection.outlook.com ([40.107.159.4] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7WL4-0000000Cmbc-1Wb0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 10:28:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHKcwasSbjj8MmezdtEKnjYivVXHDU/mZb6kBlZ3wMyupqaUCLq5494AKoC8NOEqGkckJ4f8mGO81G+QkfFaUSFBXzC8ROgT8t1Y14pbvKfIGOKZ10VpdxjtODJnBLaOYy0yQ9XtlCyvrDIEl97reXmS4M38UyYYu3zIUGQWvFQFh7qPE4I0oxzqrS4DrSnOu+25Acbdd7IHY03j52+QFP3b7l/UCmj8+gVO8XEM2m8gVgkB3YdYhkSeATqaNNWfslhosaevs0Q1ow/7iH03UkyVJ3BS+qVSwVvUDYjVQvSk7dXVcM4cSnFIIDMVhVfc78vySzBIv3qlUBdf00rcjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tCI94e/hrv5EZhlMZWiSlM8XB0VQ6pQ/471GNxoxYg=;
 b=JHW+wF37EWnSdGvGLkBkuQS8C/jQeEla99MnfrSiqorNbCWgfZiKsfI1fUVZ4DxQg/g+dn1COHns+tzP9VVWiDq3SGdp1LyjxLmuZX7mpdn4iRApN278WvAuTdPAtYpiyeAwhMNEVNucOASCs5gH50o9Uqm0KwMTFN+Y6YWzhuJtpa4LbdWwDnFMGSWLwSQpa08mXrntRMH2lou35subE+MtxNRtimqHPjiQhXn9IGShcjj3i00oZV3W/v+yCIUrbHo537+QDWSByoeKGEQjU7tzuJyHO9+50bJISMC6rfFZERP+lNbbJWhQudVUNHPp6ILy2LfPEWmcEfzit215Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tCI94e/hrv5EZhlMZWiSlM8XB0VQ6pQ/471GNxoxYg=;
 b=HRstRfEpcdG/xUA6WegbMMtl92rWpnowMsp6sRB09JrRICatF7JICoX22CSsIJnxGrKE+FTJz772jSWLFzVOKIZFlO8oZRHr427xrINpBUvQHWjBbmUmZag/seoDy7MC8aAQyDuvwIfAd3363RUaT4iehV7B3vxbZIm/UvNL9nt7en0pfwD4FPINTManmKFR9x3Z9Qvo/pu0TrL+V8wCz+z1W1oE8Y3Dwdb25zuuHfKx2nHP0yzKUFi+S3iAYEWa2cvmyWcfen6kBavwYe1w5IZAsCl1w2iE6eXuxQP2cTgQeOauRhfXfW1h6gHjhbqA0U6WJ5uMgmLpYrQ6JzE1Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by MRWPR04MB12354.eurprd04.prod.outlook.com (2603:10a6:501:81::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 10:13:17 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9745.027; Tue, 31 Mar 2026
 10:13:17 +0000
From: Robby Cai <robby.cai@nxp.com>
To: p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	aisheng.dong@nxp.com
Subject: [PATCH 0/2] Fix active-low handling of MIPI CSI resets on i.MX8MQ
Date: Tue, 31 Mar 2026 18:13:29 +0800
Message-Id: <20260331101331.1405588-1-robby.cai@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0094.apcprd03.prod.outlook.com
 (2603:1096:4:7c::22) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|MRWPR04MB12354:EE_
X-MS-Office365-Filtering-Correlation-Id: 44316c6f-e435-4cb4-29df-08de8f0e2077
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: js8TTHnr6vZn8boiOTMy7cVnh5GQHXj48Zx5jNhGQALAcVM3pCLkMsNOlDDlAYGdG4kUc3qANDsyJMlFdhM/gh3AUGpzYIOU/xanFugFz+THCCkTOijsGwclbIgozegpu0HNteckCm/zBgUfRnrCZfJEABQrZbmYYB9uspD2/8bHHkGl/dpsT+WexQYOfYmlH0N7Epn8jQ3xkKBo3jGehcdHlc3+m2upA5AttZ0YxHtN0CVbo0CLs0DscH1VeZ2InzVPpheLX9mhg3q12r8g+uEAhfl3UPwZ529zZWbUMvzlXsVPQcKbRLF/NrstzshsNgBJZWmKthStEyzUv5OH+27yZ0jmjCnZQPURj00YcMVcfJuTW7vowkbd9GEu9XtfQrOEBpX7vtRiSAdINHpsDqQfNCd3rvsJ7e86OHjjM7YBBu68Yao08zbcsMojuzAkOvUMpIVQZPS8kezamNHBO4q7J4aNzUfMhuFBHWL2BaCCTsM/30szKg5GzpJJquwSdhiqn/na9w0LowreYdhwM3kkgKX6AmGd0DKncVI0gA9uvA0Zc/xeeaTL49FyrCwcugPHnOh9Gxco6h2MiKyO5fBEhXTriEdY1s+poMPFnXrwhM9JBfu91anUX6J7UfZrHDdBeN0cjclIbkh2+xYlmFll24gwb8QAI1VWw1Xk9OyELM13pnOHknR5x6czNBNhJovoRQL1uU2M+rsg/Du+CP7+NcyoLQ7sdRAmdbOGGAWIr9wubE1bCAr9ywZC2XVk5PDZ9m+hLH5GZsIbwjgFrhs7bkgZ7+6PBsJVTJqdhhI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?idAnuLPLq9mf0O9moLo4CBLoSVR6LbNvBBdITa4kq0XgY5YKDao15U2PxsPi?=
 =?us-ascii?Q?tjtEJGAjltcI2FUofC2k0aW61lnwZ7ggNX6MeEm21+3oRISlWW5EkdcU3FBs?=
 =?us-ascii?Q?LauGSM5nJgGHL6Z92U0IgZT8Xsl5oefZE95kqfld37HqNi763eRtpEOUjumH?=
 =?us-ascii?Q?MaHruHliKjFM7q2JRpeQr7QOg/JgrkVI9t/nZ+EBk96i+5Bk/KBRpOdjKUHC?=
 =?us-ascii?Q?Aq7d1662Njt9YfOpexkJyFN9+8bCDIoeJQRaI3DB59P1Hqm8CzEjV1Ohn3Pm?=
 =?us-ascii?Q?BuEqbVUXW6iAaV8UP85VbPPO+mQM6Fs0yUOjcrPTlOtAJfLbyjO2hTfZQInr?=
 =?us-ascii?Q?rZmrm+HuaMwXMDJgpy8oA45fyhITI5JKL5z+6B0ik1Tl8b5DzCRtOeBShM1N?=
 =?us-ascii?Q?yKexvpPGrgbHZyP44K+kOL2/P9vDgBPQIZ74rAxS+gYDUFYcFREKl1fNFi+l?=
 =?us-ascii?Q?J3QYYV3DWjpghY4+aPQDZRADvb/G+yK73kLGTqW65erqf9aeb1qht3UaRGaj?=
 =?us-ascii?Q?VsIja2q9wJGVswGctJ/O65XpJ/cVnRjrK1Ks8O1rWAlpObJ1co7ri6IXhf+3?=
 =?us-ascii?Q?6NDUi48deNAw6vVWsfU6PT1MIpsbK/YUTO0iAB/fjcUm2r24Opv6h65CN7xP?=
 =?us-ascii?Q?BttkQP2Vc+t9hzpVi9sQHCOPYVNFNPW58OmPmXUFRpoBZd7zgD5gQK5kUuet?=
 =?us-ascii?Q?O5OWk+zXqEr8nHF/fE89jDS0RJkIk7FnncOqMbmxnU76ia4kfoxYqGS/NNP7?=
 =?us-ascii?Q?/8ngcCIiI8XvHNdMlrLncjsytW06P447LJBhHxLJQgWAPyRB09n9c7sp2O7N?=
 =?us-ascii?Q?N4B4lYHrd0YuNu8uPt7z5P+sNUBuWAfwEVJJbmPn9O1pOi9hnRFB5ywYcBvt?=
 =?us-ascii?Q?sQ0dPPbohRKj6T7SAPKbiHTm0CYAhCvtl8cLagrb6z3Z521f8JXcv9+FXhMI?=
 =?us-ascii?Q?yeDWM7dQTIpZttQX2RgJnq7HTGcg+kkmR5pmqzAXvyLDSDJB8nmQi7EayFMc?=
 =?us-ascii?Q?hacZbhfx7lEZICsTc7vDQOmRJ+Q3X0dlCxFwSVGD7E0RiVsU2i8PvJ5xv2MD?=
 =?us-ascii?Q?S5gHwQ/u5pHCVLl8QYf8NO0TDuasFbEOOyvMQ67oYcPjwixTgf18pJ0JoYXj?=
 =?us-ascii?Q?R0A7EpFK8maUivqwfcmpy90ZjO0iSeJzsrSz4tRfyg/d6a6sSVd/ENJSP44L?=
 =?us-ascii?Q?YXQTPGSWIel3b4d5ujLlSnFHo01OUgrDpSL4S7AtvBgfCPX0I0F8zQHIgCeW?=
 =?us-ascii?Q?/Ihjz80Cvp6vaHhDjnTPRcCOuHJ8EuMpSbUS/mabtwbbwcYmPG7RMsSY/W3o?=
 =?us-ascii?Q?tHnS11zAACNMt+AYSfKmepk++McCB2WEbJsdR7HN4l5+dQ9TX63vro7YWOZ5?=
 =?us-ascii?Q?RPe1iTaKPWEenRSuEfuDOTbNAii3XXlX0OpAbph+0rc6LS9M08uVxCUzQ2AT?=
 =?us-ascii?Q?Le5Iz1v4QfFff7hmlvB0oQXZ7WamZ7EmRh36/ekDW4dDfO0I+yPTarKkV2Oh?=
 =?us-ascii?Q?u35WeUq25Q/WxrBxeZs8mO+brbx7veA7f5HStH/TofW619ezHHzIoyo0jMV8?=
 =?us-ascii?Q?JTFnmEsdmJzhubX3AsUjFnmGxm3CyVzeYY7JxawQzsBVgZQBbpsFDOOwhNEE?=
 =?us-ascii?Q?rnWWssOG/wN3JVRpIgn+5P+NRsPd8/jpx/gNIW2bLfyc6J2QnLQWaiOusHiS?=
 =?us-ascii?Q?+5WgZA48ndwMpCrzET0gdnmJdkhrBwMw5ZjzFyj7iVYh0d0Mia/z0vvM8762?=
 =?us-ascii?Q?fo0j/rfkKg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44316c6f-e435-4cb4-29df-08de8f0e2077
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 10:13:17.3169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0xGHv32BNQnin3olW5kLavuHWETvqNid7u1ed1ozTZ1PbHOfEMvDtVb38au4KRhCvS5vFK36XvzhkrZC5Lm9eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_032850_397856_93C2E66A 
X-CRM114-Status: UNSURE (   9.36  )
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

Hi all,

This series updates the Device Tree bindings and reset controller driver
to correctly reflect the active-low polarity of the MIPI CSI reset lines
on i.MX8MQ.

The MIPI CSI reset signals are active-low, but the original reset
identifiers and driver implementation did not clearly indicate or handle
this polarity. Patch 1 updates the DT binding header to add *_RESET_N
variants for the MIPI CSI reset definitions, while keeping the old names
temporarily for DT ABI compatibility. Patch 2 updates the imx7 reset
controller driver to correctly treat these resets as active-low.



Thanks,
Robby

Robby Cai (2):
  dt-bindings: reset: imx8mq: Add _N suffix to
    IMX8MQ_RESET_MIPI_CSI*_RESET
  reset: imx7: Fix handling of MIPI CSI resets on i.MX8MQ

 drivers/reset/reset-imx7.c               | 18 ++++++++++++------
 include/dt-bindings/reset/imx8mq-reset.h | 18 ++++++++++++------
 2 files changed, 24 insertions(+), 12 deletions(-)

-- 
2.37.1


