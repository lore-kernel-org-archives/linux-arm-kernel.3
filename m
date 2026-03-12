Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6F3106704F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YpdwYV3Nne4CXLmTlhS6pYlL4GWEYFSsMJozPr0nblY=; b=ZpPSISRmhzL0Qne2vKcCn7LOYc
	1pDvqQqQjvNKx5nSY9pbF1BbpRL4h4HnpiAyIluVMJkVtdYTlWVCsocbptKMvAC7NThd+SS+rJghV
	HZMxzJFRND6RwSI1lQ7Ytnj4OcRO14fOzcTBpWbg7DiXxjaIdOKYLhAKDMJ9QNkMu8ouLMvlBCvmk
	gG8aPIfHU0j4BFrE4xHprjIlk0cCao08faMu914nV2JF5ag7HwuT5yUR9EqVMsqS4NFDRTGB2EGgL
	P15Vf0BuqD39nJ90y56sufsP83Mhbp77vXOrX4VVSIyZh5krhaAfQxl6AgybidmdlEkVuAA9MXae0
	C44ou5XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i5j-0000000EP9j-1341;
	Thu, 12 Mar 2026 15:36:51 +0000
Received: from mail-francecentralazon11013054.outbound.protection.outlook.com ([40.107.162.54] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0i5h-0000000EP8e-2G82
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 15:36:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiHHuv41h+uaKTY8XncDL/i0WrcCW7vteNk+IVuvLPAvWPuXiiMB9wHJ3SUu9HH5nj05JGT+OW4zZ/EL/1uQl69VhtkXwLTpZJvaaR3FJRQ1FBH/BXKS+T5hddCak87ypgf7eCVnG21fNwmnmK4uTC7Vo7DvFbBib18zvWZpMLqmxLyAMTeUK+ozkclKIbMhazDLFelqx35JvakZnDOrwtgPV3LEgjd7ndGpyIIMuZ/hA+ZlA1wsEaoZ/DGoqd9k7jADFgtfcE76XWTWTH33/ar9R1IeWVXEQlKSkY5p7K0VrDy3wnQ0tWC5itR0gUxytm+swfSGVnItbYIZXy2APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpdwYV3Nne4CXLmTlhS6pYlL4GWEYFSsMJozPr0nblY=;
 b=sdq3A1oZxgSEG5ZYFQ+tfEfWSQeuppq/XjiJTDNFkp5ctmK70E9ZEzE8iUNaBALwg5+WuluQI/HEYLFmqZ4a3uwj4T/ML9Bi1V1IfyJ4Ex2jAiVPOvag1pUGSp7MEZ7EgnI6u4c0LsBP4zzGtD1G31MJoBJFWWOPmtuno354MoCVTHKLARH3oINKkok+LTqUdZR12COgsIPOtv0TjTdFrqhLcr0jLILuLR/59XNwdNhy2SfcqEJCRRLpJj/5LlCA3vTXEs0noF2dyvKI+mOmCvWsfNyC7Ou74pMqgOzBu6smOPmmLjYQhWk5JiD4cpiq9NbOcfI+Fp/Loh6oHPUsfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YpdwYV3Nne4CXLmTlhS6pYlL4GWEYFSsMJozPr0nblY=;
 b=WzyVO51pUUgk1hM2FfD+uTPqTw0gyRKiIFhKzLoI/m1DOXYOpPUBOLebychCJgtY4ZXzr5QoEkDDQlAN/61ij41IvJeX17Zx5QvwG5TO3AFw0ZxcRFkLzVjczthAIf8cgeyAR0mGJkMBA862Y76+VKYmLMsNOmiEH3UW6MUNEuLMFlVFvUYGXYrXwvLCFcMlIhv7ZTcZJ3zfTHJt1xNGexTknNWJY9Rd2X0X4yDv87kneKt5dey/yAPbQa0nf6399jaem01a3eWh6sBWrx1tLRGsKQ23X9dxQhafG/EXbUKcWjokewQ5Mc2qhbBEz1r9OeVtP1j9hPlN3s3hfwQn6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM8PR04MB7412.eurprd04.prod.outlook.com (2603:10a6:20b:1df::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 15:36:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 15:36:39 +0000
From: Frank Li <Frank.Li@nxp.com>
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank Li <Frank.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: [GIT PULL] i.MX fixes for 7.0
Date: Thu, 12 Mar 2026 11:35:54 -0400
Message-ID: <20260312153557.3338430-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:806:f2::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM8PR04MB7412:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bdbd64-e6db-42c4-f0fa-08de804d26d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|19092799006|52116014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: DSknI944ab96VvqNMvUg3Q38NjYuWbnC3sbp3CDgmhIbnVUHrlg/WrWkXm0S+xoIE1+uF0oz/googx2rEeq7NUG5Ye4VI/S/Q9KOK1Nf/U+I+TWmwxPKWQpk2bCHGjIazwqYnPOxrlRQlgtb1uFeo+zL+h1SgfLNaiylcPkAxMreGTXM3601hWBCOkDbG8IXJN8rgR/6hxhF26eg8M2mn4ih8JT2Kq08YRAjx6ukyYVuf2822hZDaYmytMy9mzyJWgYx5Mab7EqFg661MGoC5uHYxOr8qIerjzThdDML+YEz5ooyEAROjad2k9Eg4xzFygPOjWbgCvFyA8d9wVf6M4IfoIMkvYML/sqk4i8UUCblxmf1TCGsS6X9iRhm+Gs1Km9Jd9GEsqPPKr1m2p/Tsus531r/YvhtdOU+lsmmO9LhviX4ukZFZMcIIfakWoQahgxUHW+aSjnn8ahxGMMbfo8vHzE7bUoCo/wmWc9kTMvTqJ0QC/RdBXtdv6XEPXYSTVQF85EE4cxvYdzcY6JAwWsqMdUHb0nggfm4OW9LO0b+FwD3iZUCj4jrry9rSsOiaZujpOMgnnoB9h4HfGZhK7RU9GwH1uqEgkrsDN7fsMglFp6tSyl73Vjg2/ci5m8FG1XS+z2yWX/rZNPjCvy6ljWXqKRDFuoDETDpG6MMQM5yOcMOvF0JC4NgU9LFniZaw568G3M5wVvXvjQ175skJNifUA5+FF2waVagAvfUDYsZSyCxlrfmtsa4QRbFGecliRYNqQ5ClxuLs307rSIPagNHc2R3sYsco6ifv1SYSeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(52116014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e4bUbYWcoaF64liJxRlgECLWhYEDGB33B16FDvAOb2vnWsfnoLHdOmYyfma+?=
 =?us-ascii?Q?8ba9GDuFvkKMVz88OFfzqOtHEVFA7j5VpMsbQX53FGBkOdtcX9eOPBXX326K?=
 =?us-ascii?Q?+8tUUexGKvrMc90PhqXDsqOGIXwyZPqWyOZkH1vaK5nYxRa3Zei+8HXO6slP?=
 =?us-ascii?Q?egdwU/86L3hH5nd4TUGNd6fO07xor1jtSyoHHg/LJK+z3lBl1EoaewNkTHb8?=
 =?us-ascii?Q?xsYxGUW3rQ/z6GEsOiUnjUduaborGheuQ3zU+YbaWP9qhA/Y14C/bDxQ8Apq?=
 =?us-ascii?Q?gLZhvwetPnL0FB3JHtQYUnMZ9fbU8jC0T8EELsKDixmi5r0vAUqUJn9LsyQh?=
 =?us-ascii?Q?ccOw7aaQ9F7f3/rOUkCTRCGimwHLRXlCwbMva3T285x453wa83JUB3fUSYFH?=
 =?us-ascii?Q?Y/m/QPbbwngKgjJdCAkk3wBiA6hfZiocSI71bCBRcfUWEmz4iYgxnDq5fdjw?=
 =?us-ascii?Q?XEII0j5L2P+nW9nO51/39X4x809exGpPDwEfC5Socv8SBxcYM+La2C51FtR0?=
 =?us-ascii?Q?jpXdKfjD84gvfkcW2kQ286UNR8XehR9tiCZk8EOmxxz1jxyK8jTUKofLajhZ?=
 =?us-ascii?Q?2VZGoGFlXdcxN8P+9blYSgtbadIq/RM80zi8HJ42K6H65gV27GSiEID5Ha18?=
 =?us-ascii?Q?q8TXcA5unXd6nM5ltPhUWCFKikbPZSOd51S+N1kMhRPkgVXFBve3Fvp8zhJT?=
 =?us-ascii?Q?Hf2jhajWQruWmJcDFsXpMaTwRJgQZrHK4zusdtWLsfTusgtSpeDdwGhYxhXx?=
 =?us-ascii?Q?e5nxvjkNbypgolHd2kEA11SfkJmqsOjKIVRjNMfpWMFjQUN740q3fcWV5iBp?=
 =?us-ascii?Q?SkqiL21NaJuebkGHs+S7IIwjtHTTO7EUSBJrOAQFQBTgytFLzUfPidqqyJYd?=
 =?us-ascii?Q?RQ3mRNf/tTi/lAo12rSXE6hlrtU5m7VTeYhF4+DtViiTnO+yNe/EJctu/BXm?=
 =?us-ascii?Q?0KDaeIOPgXiY+k3e6yvXlwF7bWsvJkcj2Q0xI7Wgl1ZxmvGR46Y5Gle+RpmH?=
 =?us-ascii?Q?4AuPLZ6dYAXq25HCGXvq8OnRiuPse0Uff3jL7UiEJQTHsELlW8YASLrURcQY?=
 =?us-ascii?Q?4C9Sh39v+xulBTPpjQWc7kcP7qJwCSWqEegjrvF3SJFja53fCCX02AMWWfGa?=
 =?us-ascii?Q?4UI1ErkQqWw5jhdPRelrLPMrbrsvu6GGguox11103GPT1jb2iqtGmEUAldqs?=
 =?us-ascii?Q?eZyML+HkC89gzF25Cfdoq54lV/knDD19RE2Pp/w3h9b2HZ7zRe42jc6O7FH5?=
 =?us-ascii?Q?LV7N6nFdb1U43iKaE+rCCHr6nazju9No+kgz7LUUKw5C7GdfwyobaPAj/cTk?=
 =?us-ascii?Q?broaopLQEUndRfvGNXkgCH3hzxWf8cJaIhwMmgcx1MTsSjP8oX2dfmtj14PP?=
 =?us-ascii?Q?1Q+BMTfRcN50FqpGYRGDHm4uQdSXg44CwVplIMJu2NTPuCTSJYTiKR+f+Zzp?=
 =?us-ascii?Q?EuFKCvLZmhZEQy9D+TI4tuz80u76gcQwXgzym0IzTZTbx2QY4rsAhDVI2sG+?=
 =?us-ascii?Q?hO4LKp6MDv+ebO/ooVlNw69DoeBomRT+kOnL6wzrM+4gtRhz+xyXb/DgXIwi?=
 =?us-ascii?Q?ZIhl62iMvF5kYKF8y6B5ZYMEYJgrM1t7VTCtwnxxuNlwdm+Da3vnNCsmKlN6?=
 =?us-ascii?Q?5mBD7kYdv9xEsKzbFADY+DncKLmEFMjEZXkhbo2xDoLdsZ5/CAa4l2ZcML2f?=
 =?us-ascii?Q?kWyITFNIsg7GuLCBixtfS2MHCFKqV14RSZnXv1IPogoIKR/7Unz9yHf7r3pl?=
 =?us-ascii?Q?xb1aVWMnGw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18bdbd64-e6db-42c4-f0fa-08de804d26d1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 15:36:38.9405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /odF6o9woKOp3c8slL4GkUlJO0owXHwllpQwLl/7lLN3P3DV9rzrIqN9gKGeTA0/gquOcmEfRi1WHa6q/0thdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_083649_597163_2E55764E 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Frank Li <Frank.li@nxp.com>

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0

for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:

  arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)

----------------------------------------------------------------
i.MX fixes for 7.0:

- Revert the NAND property move that broke compatibility across multiple
  imx6/imx7 device trees
- Fix imx8mq-librem5 power management by bumping BUCK1 suspend voltage to
  0.85V and reverting problematic DVS voltage changes
- Correct eMMC pad configuration for imx93-tqma9352 and imx91-tqma9131
- Change usdhc tuning step for eMMC and SD on imx93-9x9-qsb
- Correct gpu_ahb clock frequency for imx8mq

----------------------------------------------------------------
Luke Wang (1):
      arm64: dts: imx93-9x9-qsb: change usdhc tuning step for eMMC and SD

Markus Niebel (2):
      arm64: dts: imx91-tqma9131: improve eMMC pad configuration
      arm64: dts: imx93-tqma9352: improve eMMC pad configuration

Max Krummenacher (1):
      Revert "ARM: dts: imx: move nand related property under nand@0"

Sebastian Krzyszkowiak (3):
      arm64: dts: imx8mq: Set the correct gpu_ahb clock frequency
      Revert "arm64: dts: imx8mq-librem5: Set the DVS voltages lower"
      arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V

 arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi       |  6 +----
 .../boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi    |  6 +----
 .../dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi         |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts          |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi        |  6 +----
 .../dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi     |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi        |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi     | 12 ++++------
 .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 12 ++++------
 .../boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi    |  6 +----
 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts   |  6 +----
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi        |  8 ++-----
 .../arm64/boot/dts/freescale/imx8mq-librem5-r3.dts |  2 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  | 24 ++++++--------------
 arch/arm64/boot/dts/freescale/imx8mq.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx91-tqma9131.dtsi  | 20 ++++++++---------
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |  2 ++
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi  | 26 +++++++++++-----------
 21 files changed, 56 insertions(+), 124 deletions(-)

