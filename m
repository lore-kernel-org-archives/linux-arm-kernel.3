Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74726C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=skMl4zQ3Q7v8+67T5EhG9c724MlSUpoyqiLNRIxqYqA=; b=HOwUT0b+fW6SbcUyG29hrKPaNA
	ynfFfRoWWfHX1w/LJa7zIVWIcrcytbObFYsuxwrbtiD+LPK/swOhKi3IrDzv+p8NtVDfEfo9dPjBB
	S4D5px42hZNFcI+PY4oKnfzs+dldc8M3u+nZi42k7BnwDzq1dUIazqfkQZlIQgqmVym3elHVsU02H
	V7x/CQUR8R/jvdMHQui89fReIEQ7oWZuUasHejyE3d80ft3UVO5gVpX6bRCxWR1SpIuQN3CdEHy7q
	YKZMNXsPj+y+focE7r6lqq5kcdW1genYWbj87HRjs5O29Y0eJjeYpBPcXHP86FkXpPgeqmZAWPnCf
	Zpk8NKcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9aH-0000000DK5B-0tqr;
	Wed, 30 Apr 2025 15:42:53 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9UR-0000000DIvw-1Zgv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:36:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reoURxNSR8tigleCQOvewVt+NaNCkdLMHqg4QSUyHz/gBGsLkdeaCml9rXoDHJ3hOYQS6w52W95oayIoIkybiRV8rg9GUdkhRXiA15yR/xtZkQ999haKU7GYxGE9lQ9+rgZGyzF7r9FwnPSbUyR1nJVEzEv4N8FkrRv94wwBHnT2ZQihpqMoSqGaa/RvYSrWBoFBGZeLz769MYLaa5evpydDkzkp2uNbUXhbITdaAeJZJSqgW86S0lW8OxN3BtDBBdPS8au4Pi9LHtK6PNIt+LR44gI1KfvAAAq/q4wlU+dwi0sVY47wpWbisNGXLDdzpX6/voUgHFFYxYtPqjCo/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skMl4zQ3Q7v8+67T5EhG9c724MlSUpoyqiLNRIxqYqA=;
 b=WJm5xMDr3xWr/JY+lfTiikyFF/85xXeHIZsydUezl5HOCQJe+qCAXaujS713sZwl42zFgn8GtMsiMjcetK+v8r1Wv+13jziPB9RapVlSj4K2Qs2v1SJkvvYFHE2uKqKo4jiD0JSkwV+NaT245qPSXWiKce9CxZ6jLCLqauwcMCLFAOCTEwavyB6TfBgMgvLw/GweEuh832ebItxUp7MXxi4mxD3iDB6Va+jlJZs5I4vdkVf7T4+CfbZhyAt2bsj86ZVjtRapOVllidp9C0rzD+yV2WfkRrY8yv1tg9gUzYM4QaPaRRNbHjYcZDnaVzpH/GMfgJxJaZYu9COyfRz03A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skMl4zQ3Q7v8+67T5EhG9c724MlSUpoyqiLNRIxqYqA=;
 b=mt0Q3WUDgZLoL6FsyvZncM2vtyJ0onWpaZ/hJi4ih2wBEoj9fcLYzRKsh1sG/nnLS1yM8M51yCZ2fDHcZrxQUutmy4GgeWgUWIGYZ5mbNtJjln6iShKVGdWNyFo7oo8/ui9jXMC0a3P9AunSd//LTR1WtJBw7Okxl/SxBpJLDVRGFCoxcihgilJilkGyTGq5R41M1280LUaVwELn8ViVCXFNHscL3ONXb1aYUdUCk27uaTktdyyLhvxJJ6a3uVhgTuY/eh+zH5jZDD/7ji+X1mlnacpC+zUVyVlEnw5nexcUUzJ9Ws6bIrMtABlOVvvKKVaxqUygsKnn+16PFlnrNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by DU4PR04MB10742.eurprd04.prod.outlook.com (2603:10a6:10:58c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 15:36:41 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:40 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
Date: Wed, 30 Apr 2025 18:36:28 +0300
Message-Id: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0032.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::9) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|DU4PR04MB10742:EE_
X-MS-Office365-Filtering-Correlation-Id: f9581a9a-a3da-4039-c981-08dd87fccd17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IMX+VsBGq1GCTZIs8w7VAzuvc33OtpoG+Bldst3maI6Rme7qoP63nsRT0f0v?=
 =?us-ascii?Q?35slmIiuagXsAtWMhD+1agNbSzamR7aLkBPbDzu0utuOYoWWeEuxupjNfhTL?=
 =?us-ascii?Q?mZHoO46DUFzRXGGV7/rpvPxTvRAuQr4hme6wQRIEKR1Y1ZkiPP9rVY3l1GYY?=
 =?us-ascii?Q?Mj7Cof9o1w5vySBECDs3CwU62Nb5uwakwa07w+vpBScbvo0aO7nuFPCiXclZ?=
 =?us-ascii?Q?r2CbX4nqHnpDFIb0uR3yWvvwB0N1237LWhcjCUzLdmgAsAQ0dVvs55aS6jYF?=
 =?us-ascii?Q?ZKNcYIUfifGm/MxCHLhdZ2Y5vOZGMhchwVg8Xc2rxeRw3afKv8kYEIs2jFdg?=
 =?us-ascii?Q?yJnBiJxWMaq29LYmMOjPZoLxLshGGqw0tdSxnLVLOgmV8Hzjnm6C4be99WOE?=
 =?us-ascii?Q?08XyvxUXqn40orM/NQ6wdt4otcMroHDtL/nGg4752VGEWt1+vNT5VkqHppOX?=
 =?us-ascii?Q?162KcbXaZMZ+VSEb+0ywfTii9LpNiAcaULTqjStiobpTG55xHEuklVefJ8va?=
 =?us-ascii?Q?OM/mdEdKA897c5ZfoaJxfJrOLqSF9qrLQNHjET7+f4lmrHigrnCQpmfk8Ddn?=
 =?us-ascii?Q?Uouigd5hqPgAD1yQp4zckF1euyKGE+A9C3HWHQNPsfqdaEgz8AjuDfGhhGHY?=
 =?us-ascii?Q?QwA7HQvEgtqMwpuwGYLHtAVvGkjfueT/ACk4xy+/Qg+Q3wF1p7dubnOHz/gG?=
 =?us-ascii?Q?+Q1C2oZzXsc643P6zT60QvnMBK1WdwHmNp0QQ8qbV7fJTTvQDyKR+s3QLzdJ?=
 =?us-ascii?Q?7uVPMxlXd2V1fIeRenDzEeP55kFd6Rz70t3DgewW5BIPeHltplw/7GBInJXS?=
 =?us-ascii?Q?nxvlEkbKyygI1XAqx5+YFBX+Hnu3eaOmG5EeKiDZWsQx5qrS1H4XXa++DSck?=
 =?us-ascii?Q?tUPxNhxhNdrNlmQQBAGRqtY6MWHO6dDEbdT/RnUjOxVHAnXmuRrKupqpLcRm?=
 =?us-ascii?Q?6gf0KTvrjqP80UJjwkmUfgkWWXMR9DyF+aXMi3oIQrd+SFQYuq2r3hfyYqpq?=
 =?us-ascii?Q?Lsb1R7/fBjnb/0xr1DBdm8/pL2liOR34dgUZR2gFPvmyy3IqsNf5VhBw0XbV?=
 =?us-ascii?Q?BMkJcGDIniE8gHQLdnmUowzWlN2jiAzNOUkrl8mx/fmgUw7N4ZOqXiRBmvvs?=
 =?us-ascii?Q?yqwjIObYxGj1IxU+fWNy87YMAInq1fUXTV1oLusEswXXspVWDQdEq0LWioy4?=
 =?us-ascii?Q?K+074dukrzzkFlyRmuf+SUWb1aZmNHWNHYkOo80Ef1e9ti8lCjsoF80KImu1?=
 =?us-ascii?Q?MQGc8NPllJVcCGyxmXZ8Cnvp1SeoH7EOLRPA+p2+VRQFSgafJNjosYMcHNzC?=
 =?us-ascii?Q?LK58tliFtU4P7W/Oup/KgLwZIxSXtzuWSQfxAjzn3Imhl7Mja4RTHJ9WixIX?=
 =?us-ascii?Q?1hOK552K8qHx6qwgWtL0Ogco4EZmzppVGWY5OHkplDJSi4BX5BxHSSPeyw4W?=
 =?us-ascii?Q?+cSMp3amhfc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p/Zi3/mtGZIjdibKRee7B/GvXaLHBgAF8y3yr44qmim8n1QEoy2k+vsgHQ/o?=
 =?us-ascii?Q?NyIXJlNtYqxSROu3Tw24/R4MgNNvFt86xvHoaEpvVZX/ChV+s2KlO0S8OB50?=
 =?us-ascii?Q?mASNsd3AJOXqzt7nBst9Sw2TIEluQxaKD74a7jaG+u1aEbzQT25QxynDRqYZ?=
 =?us-ascii?Q?Ms8Tp4eK0rtnK0sQ1xvKtrpa1P3HpJkJm3waE3HXU4QeW6tdd7ramTdPrAw3?=
 =?us-ascii?Q?GAPSRL8p0oPt1b/MvtqmS0txF4/3QOLAm3wHHhQz5BfbmxxGKGnHm0ZUGFmA?=
 =?us-ascii?Q?4jV0p1ZOERO30A248kekf5+YJMnbSLxH6+OsU5NzaADMQQt8mrpf/l4ja3qB?=
 =?us-ascii?Q?o482Thw0byVF41qt5xuE54Ylus+vp8sI8E3a7okPI9/EM/CnAcNOcSe++FB4?=
 =?us-ascii?Q?e+lzZhWIFAygxK6cD7Gp1YGRDgc2qzKtmrNq4ELunZGwBEB+8mSKXY95Kc9f?=
 =?us-ascii?Q?bEucCeuAQGZu9vlwviMqGkJzJNCvJtdBML7xm4akMwWSMdeHGUk1HMURapKI?=
 =?us-ascii?Q?OkKmA+T/3zbOv5cNSFpkA1BIz46NepYmHdk00C4OYTKHVe/4w4lVl1WRlAKj?=
 =?us-ascii?Q?7UAazF65iwmpaHCYJKPcuAWIr7jNTRnzEMizHWmIP/X5S9pgUcdRLgr4Z2hl?=
 =?us-ascii?Q?evbCGNNY77NTzQ4mumg0oDdddIN9JUIoDUNuI1rcyT1o873rLezG7I6HoqEW?=
 =?us-ascii?Q?B0F289zDYw+T/nSO3pW9haxaGa0XjJ3kt98Qd3i0pqOjjZuRwNo7QaKQwk66?=
 =?us-ascii?Q?SDYJRKT4mpNJTFYMV/CmH3L+uI0iDqDC2lHqyNnKebDjoO1B6WqdGQKWkf5a?=
 =?us-ascii?Q?7whvx8wtOr9lFGm4fI587PCeXuN9Mnh9gDVpdaZeDIqpGmCHBDLpH4BmeHtu?=
 =?us-ascii?Q?h8P4cM5IXLH/qckipvq7JL5Bb6F2/FX1Fyf3A9qDuJNYahIgka6eY6rKNGJx?=
 =?us-ascii?Q?cals64EZvZC8WPo8d4hg+IVCdjHUv1Rdz/AhTZuHixz9ZYH15QwjNLsDd2BM?=
 =?us-ascii?Q?rHS5v/qoaryrlnAVzPb/VFCsTjK7jhlf7sGHjp5JsaVixcSWQ725nigjGXJV?=
 =?us-ascii?Q?bAUihED9g8Pzg99uEWF+nifPHb1ZscW85baCHmC68Nonqa1zgEvIchZGNZPr?=
 =?us-ascii?Q?izY5lua2rMOKgRfJVjrpFmEKv1PeAKs6Fs6V46powd+VxuB/EQfUz8ADPeyf?=
 =?us-ascii?Q?oTMN2qbA58KigQdFjfAPX0Weuqm7G72dk2mgbZcNLeyxEqG6tdC9xH6GOIoE?=
 =?us-ascii?Q?pb9CgiwxK2T8eRIUszM0xJjIpw6Meq13AE/n/QRsolKZ2Ov85RBlfG8S97S8?=
 =?us-ascii?Q?suEt3kXCeXKRX6U61EGFU6Lf29hpbCTR4okzsvQrvDKyfOk4D0Tk0RZ2M2y+?=
 =?us-ascii?Q?05kHftQ1Z5jdlkHXsaiqLhZKXabA3ynuDIqvE6U3Q3Ic6CqUasJu4GV2zJpH?=
 =?us-ascii?Q?tqR/tvlOYlfs2GHEU4pVQn4P/wNJjRvPbxTZx0EBtr6AoJVjOooqHt3ttC44?=
 =?us-ascii?Q?nxnPzISlT3j6gOPCVyN09F9bwQd20nWgaBsoSDwQPfkArhTUk4HMni2JewTn?=
 =?us-ascii?Q?6QwexC44sLgIIw/diWzLif48AiosSJnLfS5rOS9a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9581a9a-a3da-4039-c981-08dd87fccd17
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:40.7647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IdyNJLZ6SKIEG+NQBHgwYaTo7XYzgaxGpTXz3d2p++dH5aMNonEwhFrrcxSIZIdpYNVWnUVG/fdCAunVsucFyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083651_417551_A679BB0A 
X-CRM114-Status: GOOD (  15.22  )
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

The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
worked in mainline. The DT files were submitted initially as-is, and
there is a downstream driver for the QIXIS CPLD device:
https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c

Since the HW works with the already existing
driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
strings to also cover these 3 new boards, instead of trying to upstream
a duplicate driver.

This patch set also adapts the DT nodes for each of the affected boards
so that we match on the new compatible strings.

The last patch describes the two on-board RGMII PHYs found on the
LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
driven MDIO mux.

Ioana Ciornei (5):
  dt-bindings: mfd: add bindings for QIXIS CPLD
  mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
  arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver
  arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs

Vladimir Oltean (1):
  arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
    driver

 .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
 .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
 .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
 drivers/mfd/simple-mfd-i2c.c                  |  3 +
 5 files changed, 103 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml

-- 
2.25.1


