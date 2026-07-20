Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8A7C44525
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 09:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uMiv4V0yRUmmN6Y3nzCKiOy8nJsil7R0iRp0cWjpmhQ=; b=pm96RjjBW/4Ve8ZdFwzX0VJLxy
	bdZoJXVWTGnMK7mRirMGshjWIjoAoggopK+EPL5tSsAjVb+xkhzprdqR860uemnSnFZNPdEEjEQ72
	UH+VLZVoN/0OsdE7J7t1SxFB3wln3JCDiCSMBW8xGB90mrx6S8ZooCkEGe1vamWmqb/+LRSwFY4c3
	OBFvZtVGJKTXwvuq7Re2JQYk71VcbLXcCr19hxmkLdT3plQqV/AIEanrbKAoJxPGpKLDg+Va1k7kd
	IjuAm0aAKUByJrUUjlpZ77YxNGGX73lhnICa+FMKjG6fBW6iQTOvMKpL46sQOReXPWS8QqucA3WVF
	mFdpSQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkeX-00000006N6G-3q6h;
	Mon, 20 Jul 2026 09:51:13 +0000
Received: from mail-norwayeastazon11013015.outbound.protection.outlook.com ([40.107.159.15] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkeV-00000006N5T-1u3c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 09:51:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8KztaS2VOy8eH+jOtaIZafms4Wa5H50S5LMjqqNv+coscHlluTCRPyT4EUU/1cffkn5hVse6fbDTKPh330QVMNVr6RTIaq6foyKmAtUSnjJOjrwsr2CnNz+w0idAVRarGHQ0lJFJM7LPi1qXHVBluFvDgLVqLxg1kUSM5z4w823Rsz4F0/r7yasnaaGVWTKjc/Wf7Lw92PXKtm72Qzu9w+xpEkGMo39S5iF0RijiPHTb2AbZwJn0sx7fXjPGfHhk4dsyTzqKbFbzDbzY2bV3Vs8sfdoDAK5YTo6iuz9b1sEuVHaZ4ulhBCkIWagTSjNaRQ5CsaayXyXqZjsUvXcmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uMiv4V0yRUmmN6Y3nzCKiOy8nJsil7R0iRp0cWjpmhQ=;
 b=vdaBj5aRU/w6/+WNlUndM3xmUA8v0+u25Wpd/LCLT5rHWKsXEiTbd/xrjURdw0dbwSn8QeSLwjGIiOfzmTHFeF2AhTKww6HKc6+THxKzCCCfN+1+m7VY1rYNfHD7jdXYS+RyX3+W8UySvHHjGyu/ZeC7kwSr8j3mjHm5csqsvWphD70ybOL7fihngEfY2bWer6PjQ8ZL17EELO0KRAZzQO8EEoMCFRYPOXVKizGePvAZBgLQAlgDd4WwERSNKDlbAkWI4IYoQuFevsrK/aq4dRdnlwfPHGj3Jjk2GNIcLkozRMc7v8YRBpS+qmIjJnb1ETRU8Z3SBOVsxiHzX1BR7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uMiv4V0yRUmmN6Y3nzCKiOy8nJsil7R0iRp0cWjpmhQ=;
 b=x72sbDV5/MhcTS8fHt42/p1OrkDV+TOmRhJoF3kknTvWWTsC4+Ji4nWbq/t4nrX+q+SLbX51i02N1p+93ZFnG6alexWN+Edw2MMuKkYwPFWhXQPY8ei9KyyPFgM74JCXm+qeAKYWNO4tiqBSFJroEvyYpfxI+j/ixiI8fmRuvDQbjcZcGRN8vAxBKV+JjQrukCNz5LKV0OXWjusbtO/pvXIOujPtESwa1c32+7PhcRpMRoQaiYzCoAXFOJ83RWu0w048uIRpK6nPIChoy/H3p/efCX2pBcjp9Ikca4KEFqx0Nz03K5vKvM9RW2fANTexmNx1o2sJ6GHPTfI7GR95iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AS5PR04MB9800.eurprd04.prod.outlook.com (2603:10a6:20b:677::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:51:05 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0202.023; Mon, 20 Jul 2026
 09:51:04 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH 0/4] ASoC: fsl: expose individual DAIs per ASRC/EASRC conversion pair/context
Date: Mon, 20 Jul 2026 17:54:46 +0800
Message-Id: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0194.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::6) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AS5PR04MB9800:EE_
X-MS-Office365-Filtering-Correlation-Id: 331b23ac-39a1-44c5-446b-08dee6446988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|7416014|376014|10067099003|6133799003|56012099006|11063799006|921020|18002099003;
X-Microsoft-Antispam-Message-Info: MUbniJSF/yFS7YxV3gmZvi+iytmwN4/jA9PhlUCuWo2QvaRQjJOrXkuCmcl72T1ouiF4o2JClyhg0zyXzTWKXhn8CPfJB4b0JXNzrPvp0mpfn8wk1Yo/TtYWVdGMFSWMltO0DgPoCY6/Tkq8dfMX67Ih7UcSxdRHqQWyVXrCWEmgaMbmchZj4+Ervp5Z7u+LwvhAmF5fKtuyNsvjFnvJvd/enzK4gd8S5Wz5S2zcjURVhGzUPsDavu3AsqydfIPinFQJvd7P9K916FGPmwIARKpy/HHgup87LqjlHIJMXeJhx6rz3evOtxwyBjqFpoRtfLh17+XuUz89zcGKrUy6x0q10rig0rT1ng0WjNssevev7LmR4LnJhAFDB+5yxy+QhuSzzvw2bDtgiehmB/fKg0jSYlpc6QFThSupJVG95gbzlx4s7PIOkIHg6SQxaMad6mPRGQC50/MaE/poZlXSNPPD90Kf5oiXzawq4m6cAD6l2I9t2/3E3a7NcDwXRb8AcO+XTq3sQVOfDI85L278RKFBwJqQZG/jAgaP4Q+HPYZzSTFmkhIzJmxDqa7ZX3RH62u/WcQHAPOPdM5ObiMITBnzjzR/3eFBnggBcylN/vADsmkP+i9R1chtA5MTD1pG8NXhQBYbK9lf3azFC/TLKIK7B7n+a2Rvy95TBR0+PeIVl6Z14/qMaW7Aba3WKV5NkUrN+38Vpw3YYTXcv2G9yg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(7416014)(376014)(10067099003)(6133799003)(56012099006)(11063799006)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v5R/oIFIFi46RvLZih5bANbJcaESfb13I3J1+akxd8727J2cffKV+FuqSOBK?=
 =?us-ascii?Q?vKBB9No3WhZmbzv8uJZbIgsSQgt/4oon7l2HZ1GEohdqPTpua/i5e9N5swyr?=
 =?us-ascii?Q?pzQUhbqPeOPldZN4b8wCSVBJNHbFlPXemWbRCwseAiOJ6eE/73E6LZUkf3e+?=
 =?us-ascii?Q?G2u9zMheQerTrBlIc4Dga8ChVafg5ZqwUpI281d92cnoeMC7aKu7EfvnIu6/?=
 =?us-ascii?Q?xOsE7TWYLZ8V6A5uVq+GGU34k90jSRuHl4LK7nreAaK5PCXsnpvsPB/1uqbx?=
 =?us-ascii?Q?1+0P7ueOXcjKFv6zyrIG1Re1CROM8PKxT+VRFy+Giws2HRxRPxdTHPN1wJOZ?=
 =?us-ascii?Q?mLmNWGfU5Q2fp4FwdaqM9/VGxqOenl9g8JxONy6WvIXPPevJAMTF2wW0BFjZ?=
 =?us-ascii?Q?Uc+AXP2VRJ6ya/LA20pmGeItXgjt2oEu4YIhw/Tbl7NWxGknnSqiAsxp5v1K?=
 =?us-ascii?Q?Ru2uxbgH8mSTC0T2mwkcTR9lwtwGmbZ7pqz3L8iKjhawWHdLAoLKLWhvALEK?=
 =?us-ascii?Q?D2LCh0GtrqsoxmZrUQc5smy6/PJdSxVibHylf9WUC9Keue125X+GtN89jOVd?=
 =?us-ascii?Q?p4dV+YbgtJA+OYZSMCj1uEiVDDwgE2jP1aLUlka8OykU/pNOz6JvjRFLlF2f?=
 =?us-ascii?Q?SkHRft7tzamM/WG2TXywrG8WE1si7JN034g6JvLaJdUDPHn4n1W08UHjFC/w?=
 =?us-ascii?Q?8Iv3TTBhgdoG4paOnt3dud+ktQAe9/C6atPU1K3T49fgziag4mXijv3bChRH?=
 =?us-ascii?Q?BZ9bJvS90TD+KamhDf8wQAA7zgZPKOGH74ONzo3VGYynX8wxV8iVXPrDQjzl?=
 =?us-ascii?Q?YjImSUdoI7MDcgBApnSqiUueUEuO+n6/K7wsV2obx9Dbh/znZCZkSIL9dyCE?=
 =?us-ascii?Q?UrJJDbo5iz3/oNSBEH6+xQuJK6GLm1I1v9e3NxHMCAqBOy58BWMJ3LcxYX+9?=
 =?us-ascii?Q?mFts3mFco4jZstgc+DC/ezYFyvmFe/b1eAWalEDUZVMeq0PeXAc1vbuN5pWE?=
 =?us-ascii?Q?Jl/lkMsmM6G9D7wv7DZlQviBCBU2ZPnPHIZcgQv/4VxV2Cmq8LDDTPMK8w2m?=
 =?us-ascii?Q?4pNJYllhq6oMn76hukbPUG3peGXr8Rl0IAz6zMPtXoxwNLqcLG4QbFNJHyW0?=
 =?us-ascii?Q?pAJHEuWRQFM1dw9bi/HvrLV3/HKk0wibiNmHkZyi/di8FnecRrqh9ghhBrCU?=
 =?us-ascii?Q?48o0gZy6INb9GTa01NMhGkz9TcNC9BACV+P7JvwGovBIZ9tYne0koMwSb6iq?=
 =?us-ascii?Q?yYfTeGk34YNeBf+R48LJx3mDkSVj7XjzepGyp73VIQe/y5L/EdpLa9ak8Hlk?=
 =?us-ascii?Q?+gVp5TSstJErW6omKCaLlI2DhtEaDyCGbc/DgkXE6kev2sqoNqIk/uv0yd4y?=
 =?us-ascii?Q?zakkEqnvC24Yo0nZGqu7z8HATQ+SYXjOlCenZ6wA6Pg5oUd1dfltmcAxWdks?=
 =?us-ascii?Q?TwgldxSAYInw+iQ3e33Wi4w1u769dmYoojUvDo/PbOwLdpWngI6adGf6e+/n?=
 =?us-ascii?Q?erZVUcrWjArmbxzrqaEC3/voRMN1hkPMvFDC8Cydav2mvwsHu6fm0c+sYLJN?=
 =?us-ascii?Q?hNtvVPvIjEz/R7xh4eOomzK1V6+8qmyduc9FbRATgS2c3WB7LJhqnBEEq7e/?=
 =?us-ascii?Q?Dsaq5Man4QJa4tik5Eri08xG3hklhQca3dKvJK0DJXrBwnazLzeQWRpHrawO?=
 =?us-ascii?Q?zndlF1s+LhO70pm36wBWr4RJbjE8gRVggR0BIRq6uN8ZorwipVvRbnD4LarT?=
 =?us-ascii?Q?Q5WwNMmxpkkMXi9vnHw7b8Az1DsFv3Rj4PGeQBBoBVHhJ/vCdFpc?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331b23ac-39a1-44c5-446b-08dee6446988
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:51:04.7832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1U5jKQArL26a23ftWt6JjgQI5nzwr5zLNqcxfZZ5HhNZRJgp+Rhjtby4fj5aQIs0J9B4UuyQAZgHZSWOvhDQB2qYH8Y4gzx9vmGv1bsY2kqixuubaZ+Tp0JQHzXEhMV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_025111_504295_80059E35 
X-CRM114-Status: UNSURE (   6.89  )
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

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX ASRC and EASRC hardware each support multiple independent
conversion pairs or contexts, but both drivers previously registered
only a single DAI with generic stream names. This prevented individual
pairs or contexts from being routed to separate audio paths at the same
time.

This series updates the DT bindings and drivers to expose one DAI per
conversion unit:

- fsl,imx-asrc: add a ports container (port@0/1/2 for pairs A/B/C)
  alongside the deprecated single port property
- fsl,easrc: add a ports container (port@0/1/2/3 for contexts A/B/C/D)
- fsl_asrc: register three DAIs (paira/pairb/pairc); pair A keeps the
  original stream names for backward compatibility
- fsl_easrc: register four DAIs (ctxa/ctxb/ctxc/ctxd); context A keeps
  the original stream names for backward compatibility

Shengjiu Wang (4):
  dt-bindings: sound: fsl,imx-asrc: update port binding to support
    multiple pairs
  dt-bindings: sound: fsl,easrc: add ports binding for multiple contexts
  ASoC: fsl_asrc: expose individual DAIs per conversion pair
  ASoC: fsl_easrc: expose individual DAIs per conversion context

 .../devicetree/bindings/sound/fsl,easrc.yaml  |  79 ++++++++++++
 .../bindings/sound/fsl,imx-asrc.yaml          |  78 ++++++++++++
 sound/soc/fsl/fsl_asrc.c                      |  89 ++++++++++----
 sound/soc/fsl/fsl_easrc.c                     | 112 ++++++++++++++----
 4 files changed, 318 insertions(+), 40 deletions(-)

-- 
2.34.1


