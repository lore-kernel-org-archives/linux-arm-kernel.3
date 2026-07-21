Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99B5C4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 20:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja9Nl2u0OJPCda8N52PsDMpePMClOG8bu8nRYay7GWo=; b=p2QFtXcP5mT0lBEgNvjiIbYHNc
	O3X95YU5mH/EBGM2dRaReqMfyNbH8COa0TqzRReBXei4U+uPpNCJgFtiJxi2+v9S9/CSygaqSflHP
	apwMjF/AkqikDpMMGYEjexz/ElNaCBrBEFWO/x9cqvQHW3duEeW0uvLImZFoeDn5GRB7VuNvlFN7k
	nPRQaTMnRtQuQ5WzjvCcar6H0c6YLt+/R3XZLBGRRKynWDgxvr2KPyJY5WWkSx0/hmQba3SK3kjJR
	C2t9zTfHnrh9/LMDD8UJKyZtAe50t6dvwtUvWOzWmIoRFTAqG03SQu2cExCwyPKDy23lN5UtLYoZw
	6kjW0CZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHO9-0000000AP9r-3Mt1;
	Tue, 21 Jul 2026 20:48:29 +0000
Received: from mail-westeuropeazon11011059.outbound.protection.outlook.com ([52.101.70.59] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmHO6-0000000AP7t-3zA1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 20:48:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jy+Y2ftUigcXAPi0bTT3jUQcC3V1sON1uhdu0zagbj5xs8lutfE5RWLOkkC36bln/AQgdRTCaEm6lDcGThpSX2VgzSbMc5KFwoFD+c96sRWA0fLu23uvskXxUscMseIcpwvx511PzJCDFbblCzp/DRNoTg3XJs/eZFWoDYy49YVWERnkw9q/YY1Z1jWD0dtbXyYBUi/lG700JRaQxsEppQltO+/F/uw8HONuI4v8lzoKX2vlppcuQbjwOgUqahAvz/koB1GJkYq1owlxQvOMi+IY83Jt270qMVIhHLi/sUV3hSnmm3j7Bqj3iC3TKz1YzTtIy7NFIFKmPChYIR9uWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ja9Nl2u0OJPCda8N52PsDMpePMClOG8bu8nRYay7GWo=;
 b=A8YZrwYXye8VohDAap58CyN4f0d5FGiwtHb5lgS/r0qINeRv+xlSO7JqLsBIIv9cLS3MNaCbKTgWk3b0KFJnxxV6zOL7wOQjrIhuxxuXv8CK71nC7DM0tFcjeDiDoUgYvkZgFMHAArXlVJrxSl20OHuh3tTlX4T/Xj/TbIUNDNbrCh/rfd0zmOg/KxKS6iFiWcCK/iZaEvz1B5U7+9t8nH8eaJar8N7xkgIBprV9Tzf9YHjX7dx63nP6WPfWJ7abHYGDZlKyjJkdH7ET4E9oha69694InAYA7gn6C4/WCE3cD4BYABLXo8cEs0IYe+wffeptxyADzOEwH+WSBsXGxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ja9Nl2u0OJPCda8N52PsDMpePMClOG8bu8nRYay7GWo=;
 b=vKCQ13j76oH6tm8/PjGSmRk07jZc2w1ZZo5tp7l7AtuF0l9JDAVOlWonV5LzsIjkvoIOi3PJ1fzpLTWdB5O+UzSjfia6q+wo9yD7jI5hZPEZMuBahRspDKdFS/rpkZCowdmuUuMVJBT7VrFiS6OLgwdfjVngD60N2JH0Qo/p7eYfEhbVpPjYzM03h0PB/s3iip3AF5EDyTJpcuklDWyerb11kmVwlJgLasAF5T66lSlibvDstALsemKbM9s4o2C8Pj7y/laa2DpseYb38h4MtNWGQe/sGKtYjSf601x7Zcn+SY+zqtIYNxRjUFMaDTH6Y2qMVVxxFUrF5eBSDYdeLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com (2603:10a6:800:12c::22)
 by DB9PR04MB8284.eurprd04.prod.outlook.com (2603:10a6:10:25e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 20:48:22 +0000
Received: from VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4]) by VI1PR04MB7135.eurprd04.prod.outlook.com
 ([fe80::322f:adc4:8d65:2ba4%5]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 20:48:22 +0000
From: Shenwei Wang <shenwei.wang@oss.nxp.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-imx@nxp.com,
	Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
	b-padhi@ti.com,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v15 3/5] rpmsg: core: match rpmsg device IDs by prefix
Date: Tue, 21 Jul 2026 15:46:46 -0500
Message-ID: <20260721204704.400781-4-shenwei.wang@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
References: <20260721204704.400781-1-shenwei.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::15) To VI1PR04MB7135.eurprd04.prod.outlook.com
 (2603:10a6:800:12c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7135:EE_|DB9PR04MB8284:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e8cf270-e395-4f0d-b521-08dee7696748
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|11063799006|10067099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info: H0d6JA89KUdW4lpFuNm0408pbRIG8n9RRAS9Jkh8/S2D7lDO0qBha1nY0+miwqQPKYYtm5sLVIkummVeeJ5t1h9yKa1eiTY7UP4kAQsESTugqpEDqh2nF3Ry5SSoWNiUD5v/33yWS7Lg8Dz2dS48AdutWrzpYbUDGlAnXvN3H0r0SR6Bbh2VJP1CO4AG7x1bre7Jm5i4OJyfCEL1+DeGpEsfqbwYNZrL+LbnOL31ziMdwwYGAfXsznGqNamu5k+Z0NCjbmA6pbXFrief6LTQfAiXUA10rqt19/e3dabfUWAbs8GVAIbFydSLsmBHHwMBmsl6RQmJMYTJ2WPjuZ7bzJnsBo4mRoaF9uNi6g0mB9qyE545oPU/NyukpvfpgmNiCok3N5pks1mnhyutPhfNQBAJ1ou+5vQ4GjvDJsXVPNDB5pPXcp/K6hzEQAhbRO9fPNqg5KGT4UVzy3QNGic+7rziMxa0VPeTPNgGutCr6vX/KVN2PaEHnIGzaUYDVN9b5gifFXuGd+gd36MRzJI1qRICl/WOkDCUB+NjYmcYvuvplUQp/Y1butWi6mY+PzNcfGd5LAPyg1B/com2BGYxmz6L4ColX+vLMXWVtNw8+PbWyjfuE8xGEdEVu93Ryzh3Uzx5dQrXRC3OKex2BRN7RE0juUAM8ZSX8ullCU2RaOdXJ341xXNsSQP1cOjTpHumXM11yYNIDIihE5zRYZLROQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7135.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDyjckU8AX7QzpYHXxwFaQiQ5x7KwMHa3ZkG6k2S+BoHh+R+WtDEBdWSWYGU?=
 =?us-ascii?Q?CX/BcqM1TND7KE47G1Zp4um9RaRl6JlJIyMll1LIR8gSR7lhL1cGBboubT+I?=
 =?us-ascii?Q?OuvcXMMbhzvlf694bKptp4/5QSrDG9HJXp557SMuIFoJp8AAHiH4lORrGk+1?=
 =?us-ascii?Q?tp9KaqkQ7816Y801Skm/7/lv/5DhiKLX4RBankecFYNdyQy66FMywlYQ7IdQ?=
 =?us-ascii?Q?pbJDgeP0oNYeieNBd7DLFxt631jrddLP32d2p6o+gwdQ53yr057Iuf4WtSN+?=
 =?us-ascii?Q?0oWi/XqufGe9Z5gNBx/MzzRTmgexIievmldOrpLFx6Oaw6KjYjyb4p/0vx6n?=
 =?us-ascii?Q?xlWE/pru7kC+p0C55UwilgWWYmzAfGH1RnfT+reXbhmMuQwqhg9xCHoD52pT?=
 =?us-ascii?Q?DjonWt9dgsyqeh3sCUjhimQA9YEQ1A9Q/KYNv3bWEYfHW+U/Rg2buE3LTDeK?=
 =?us-ascii?Q?1ByO6bralqVxNA6EtRHe67gagEkAxrv7ik6dVaQwJDW67lHjwXnqQazMsDuy?=
 =?us-ascii?Q?doPVKrbIrz0aNh93mz+xtPiU2w18pdmcuG+chLrdpDwFPQDzMOXixVNS585o?=
 =?us-ascii?Q?l3mCbmG+c1uIUsk9PaSAGJRZ8clhOATYbBEDsYwqwCo1TEEAONVgQlF4gXGA?=
 =?us-ascii?Q?vFlbcpnYVp2QYRH60dNlvr/rFgHMO6sd2X+xo+y2NjhkzL51Eze4PtPun/Uy?=
 =?us-ascii?Q?oYgMTTO15aLYNDniVonH3e3BFywqcV7qSv7v0sna8G7jOUUnuNR4xkA0TvQM?=
 =?us-ascii?Q?vV0dG37KDz8MTgUJvm0HEPO3nRKbeEwqrVuWzEQtgZL5FEc9z02zyc/x5TcO?=
 =?us-ascii?Q?U7Go81d+GiJyXg5998WvmTNBiUg8b/uDZugo4YUSukDnn+PiFNphq6m/A89H?=
 =?us-ascii?Q?jEHgRy7vRegVRqAFZ6jobmMvaOXpdXva7fkgwggzhSvnJwSjDyJq9PPPJnv9?=
 =?us-ascii?Q?Zfhg8oyqur7LrLtA/LBkfEjbgFZolY5kEY5OQ35grlyh4Z4/XT33OQlvlzGd?=
 =?us-ascii?Q?pyuUIAMxxYdHqwmFH677uaWobGO0oaflsUW6RRrrebAZ2jiVlXazNeJrTaVo?=
 =?us-ascii?Q?eucbxJ8xCi082rlFS7zR5I4wphLibHVRCNPkihESgcuGzByhfGUm/z8dm6rd?=
 =?us-ascii?Q?C3wZ/Be8voU3MnmgYkXQ1A8VphDYzXhXtJsLSXCyxH4oKhN0hggCGWylV2Sf?=
 =?us-ascii?Q?KR+v1qsEN55sfI9y+g/eFCkDWrHN//SIKOZ0Vf6Iv2gfEnDnsK9huHLA+jwz?=
 =?us-ascii?Q?dNL8Yr1mKRds9IMQCZTOimXBpjjcjOCfizvzDzWbHahEwQy4q2rs0Aec8Er0?=
 =?us-ascii?Q?PSlImW7NsnfVTvCMfic88UH8mYHpB+RMS0+o5QoU8lSXpYO5kTiN0+O2T+VR?=
 =?us-ascii?Q?YKdjo0j6k0Ald5GrST05n3tEbCo7kweEyFO2TTekBh1PVHsYhpEIhQ0OPP6L?=
 =?us-ascii?Q?kI08c5HbA+DgD6Ma8HWjZLY5q5ec3CgS+JibUY5wfHiglcUE3m9v2Co1sd1d?=
 =?us-ascii?Q?s0Ig22QgXTMGuD6+O1hJ3IG0P1W6i/cV+NeVy7fgZf/56vAi8KeOEJOe892W?=
 =?us-ascii?Q?Pgf5O9x7b62lxsNWd98dvR+DtjvObInxuyroQ2Nuj40nmfABzBaAuNNLtglR?=
 =?us-ascii?Q?5yLnBrFNA4BIbguVy/rRh2Hsf4sWQXPPGhUelrx7VojFvrrZjJWdTbt+KJ6V?=
 =?us-ascii?Q?u1JEg7zJRvZF87380RTzzYcSu4Ns5GiFhCndEVWfemqVxX1ocKBNCJDSnf2m?=
 =?us-ascii?Q?CYY6jbrgOIi93LGKieS3D7frkUa2854VvCgNXlFWLumHHXl2fJlx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8cf270-e395-4f0d-b521-08dee7696748
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 20:48:22.5059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wmNFWAU5E6DsrXhl9YC8HhKOMXD8EQPjzjKUBP3JevDUnikxUNB5QyeZLY9Yy3A0RpvvdjIaOMcdeL/t5KZ/RAJatktZYthnPTfC9fiT7BA7Z60g83lH0mvUBAWwXNNS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8284
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_134826_992933_445B4427 
X-CRM114-Status: GOOD (  14.47  )
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

From: Shenwei Wang <shenwei.wang@nxp.com>

The current rpmsg_id_match() implementation requires an exact
string match between the driver id_table entry and the rpmsg
device name using strncmp() with RPMSG_NAME_SIZE.

This makes it impossible for a driver to match a group of
rpmsg devices sharing a common prefix (e.g. dynamically
suffixed channel names).

Update the matching logic to compare only the length of the
id->name string, allowing id_table entries to act as prefixes.
This enables drivers to bind to devices whose names start with
the specified id->name.

The implementation is copied from a reply by Mathieu.

Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
---
 drivers/rpmsg/rpmsg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 04bfcc75f05b..97a4db52b040 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -386,7 +386,9 @@ ATTRIBUTE_GROUPS(rpmsg_dev);
 static inline int rpmsg_id_match(const struct rpmsg_device *rpdev,
 				  const struct rpmsg_device_id *id)
 {
-	return strncmp(id->name, rpdev->id.name, RPMSG_NAME_SIZE) == 0;
+	size_t len = strnlen(id->name, RPMSG_NAME_SIZE);
+
+	return strncmp(id->name, rpdev->id.name, len) == 0;
 }
 
 /* match rpmsg channel and rpmsg driver */
-- 
2.43.0


