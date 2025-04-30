Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0AABC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 15:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHNeitE3QF/vLkIQsap2EQ874CvOLzWA9V++Ds/+Aag=; b=D99NkaWU84apNGGquEJHoc4FuU
	af27Ou+n6WF8z8dzPo5YLTBhbjwRTATzlSdJsk/acpqFYQa8SVJ51LP85uRrBInhVKnNGOO2D23as
	ej+auhCt7iDiZOA9WjARV7IDK1WZaq8XlT7UiuB2RXxyqFYrX1y8Tr/Hk+M2+9IdULbJtChlzbVb9
	T+EA7rm8HAfApBBte57MDMSqVrvMkAwEwhievECo2i/I9xJvD+nfork3nNfvosO5oZCYnqjf4oERj
	l3MjmXrM1KCx+DE9M+ib7JtCPGJBtKu4sjVXPSiEn0a7zb+v2BmxIOzEIDAGVW1eCzoxZHDcbKU+y
	aAPSCORg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9cB-0000000DKLF-3otw;
	Wed, 30 Apr 2025 15:44:51 +0000
Received: from mail-vi1eur02on2060f.outbound.protection.outlook.com ([2a01:111:f403:2607::60f] helo=EUR02-VI1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9UR-0000000DIvq-3dX7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 15:36:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtZn8oWMBB3oobuYBvq62VidNdtRPYSjgrtIO3yNVgBFZZ69xTGND1OMid6Z+8mpNcSuKky5xVPugdxpXiZwpwe4H+DMuCK+HcIIBxMl+lYNhiAV7WDWEug7Vl/utk65rF1nl6Kj2WkvwBNdOf3MkyNe0xH0eny55ka+LE3s7zjtIK36PXcdsC+JuYW6Dn7UxtZ9jJkUOfhjqgLOxNOE1iv7x/wlWd9xz0hmKQKiTExYXyV71e8GcwlUrICsQhy+S16+xrk1lLY/7SlleYvmO/DJLsEhZeNpWAJ7kJ9hvq435n2+N33Vm4c2clHU33YbkuuOfDb0fArrxHYzeh9COQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHNeitE3QF/vLkIQsap2EQ874CvOLzWA9V++Ds/+Aag=;
 b=N7zXa8KUV+HvWZuLg3j6Lldx9l2utLtpIAXkPg9Lt2vI0Fygu6mW7ajGDwpcSCfdEvyN1zjCcCe1Lk/Noprzj35x/NUTNzg3NRgVnsX+dTQhtyc2HKzpl/cyFDbRphj7EFvtZkSSiEXUiq+wc6GoOkgqjwSnc/2D7NyqfGdln9RoG5zxvrB30+neczuWRnKNt0a//rnkqeGzJql/gxIw9cHDqhdx9gHaNG8h8urTnCjIjTPVIXd5Ox4Tm5RkVwssnLcy1pEjdfxtCgBnij665S7kaUapQqBl4GUmaL55d9oWv/3Eq/oOMDDl6s3W/VVSTM2a3B+nE2JhgXuQh4tJGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHNeitE3QF/vLkIQsap2EQ874CvOLzWA9V++Ds/+Aag=;
 b=FPHHxhYGJMbZzkVznuLfMWdh7Q9D8sdiLkC7LjX6FNfG9wUfsuKo0+w4+VfeZdEKFhLbCap+zxGdRodTKGqzE9PpLw7z7Dmlfneiv45o+SnyPsWy0OcNQhvBjQ0c2DkxhJKQS59MGXxFssVyrkaMBjnZLWUxQjJDCxSX7rcqR6Vnr4ljCLScAwsBexdRV5kA0kr5iG828dSda9+MvcHrjT+s80ckyZrVBkcYzazf5TJlcIPwlqLrr93xXGLkIib6JM/6DcCxN3/+UTzmriCAPpkQaFcg5F2+j6Ts6Dm9unmFDFp+XvWFjyLAammVwyO+1Nr0pxy51qjQD6RYw3cJlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by PAXPR04MB9665.eurprd04.prod.outlook.com (2603:10a6:102:240::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 15:36:46 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Wed, 30 Apr 2025
 15:36:46 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
Date: Wed, 30 Apr 2025 18:36:30 +0300
Message-Id: <20250430153634.2971736-3-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0040.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::20) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|PAXPR04MB9665:EE_
X-MS-Office365-Filtering-Correlation-Id: db1a31a9-4367-4290-1ac0-08dd87fcd0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xSPp/uf7JsYACEubLQaUMTaRfVv43cOazX1dtDTbB2exWY3G6glDmyuJ+czp?=
 =?us-ascii?Q?zaF0ltBiBt4yoHVHTV6xos9ZcYnMFON5DXgTLJQ8QrDdt7kyDtmfT0Nb6z1C?=
 =?us-ascii?Q?NM3a7RnXvj01oOw2aQUv0kzTPi20Vgk5V1lTMf9nzj/utOYQe5UlHCsbyOxC?=
 =?us-ascii?Q?rUaj0uxXEkm4TqS2j1wJVOy1qkrqkIHhZeTEnfVz+lOwb5ZVsn9BjTkGJViN?=
 =?us-ascii?Q?rKS8s+1g7yIsHzQqfB/gV1BNRyQZ4w6A+LBxKCO7u4uAoliu9fvwSKUy2U7Y?=
 =?us-ascii?Q?U5j1alG3KSW9gvvJYPmbuTgXszF0Sql/VJLNSWINOq0w6Rsc9vFVCb2JVkw4?=
 =?us-ascii?Q?L+Dh/HWMnhJLfc6ZOilE0lllCqumlPmhtJnxBN4aweFH9VC1f1RLvdDwLy2+?=
 =?us-ascii?Q?fOb8tzU0kQN9nRK/d2Ai/NHrgxsC17rLQz9uy5u8yQpTcKmMf8nVLG84A2ay?=
 =?us-ascii?Q?M+MeNKg0EYOTSOSRukf8KejqQBDpAJvYqHWouFbkPAecNVAF7x1cfWs+Kp7Q?=
 =?us-ascii?Q?jnnZp+N95QHyXMtkWDkiPrDVL9T7cR59c2gQIwi1FQZo/PyxLGmdPnAoU2gu?=
 =?us-ascii?Q?KkJ5ZIif37IdCDINjexvHjQ3Yp1zGdRRXHh/Th4WgxtfvHfs2Z18mXOOblWz?=
 =?us-ascii?Q?028yQHDgAq+MTMgsunwgQ91jS1VFuVad4RWd6nKCfDYu1BMoRM2rYwDpojT2?=
 =?us-ascii?Q?b7QQdsFwQ1iwzdzlg8L1L/T5kcWsINJrQI74VXJ7ZubxOijjMg0cccn8++jN?=
 =?us-ascii?Q?Zi94x+XGhhBjgenWSTZvVSLwfZbrB2pHwzDKSvl0hmx/tvWjE6dtgLtJFrwN?=
 =?us-ascii?Q?PHFoA9MElj4/C1K5dPBmuujRj/I0nh0QvXcKCSJm4hsUkSgcaQRozxatiq8s?=
 =?us-ascii?Q?IjuanBdGI38WfESwojB2X9tDj0tpLkTmzpf/vjY7/elWCdOvcLeBdEgHfdzt?=
 =?us-ascii?Q?2Ajd64msrE0+1MGyiNNXEWdtFtRdL40pCJ3dZ4wI67eRkfgQuqmhnfSJXjkH?=
 =?us-ascii?Q?GjQYVJjWSqUDBA2sDfdCXmRmU7J9qtT3DGVfWvUvP2vsywXeC3zLhsM7rdCU?=
 =?us-ascii?Q?x+i9OmmZOefME/UWEsogDKqbaNAUCzg8bWv/CWoEgg86TkZxy1/Ig1qAPilU?=
 =?us-ascii?Q?v4i3DAEXEOb8TIApK0tKXbj9Vk6RBGB00xvfDBSECUR5rkd/yyJ4wK/s+0Vo?=
 =?us-ascii?Q?ItdnH5RvENfasEGHdxi2/gCSF0VoO6V+7i1gPPh1HSdxvrc261ZBmYcpG2qz?=
 =?us-ascii?Q?px65mTYAhT9CZL3ri3zbsJkxc6KNetW1ik4qt1zFJ4wYrWODTgmytGXj0IO9?=
 =?us-ascii?Q?8a4rMcWLqk0lynidWc6ov/k0eHT7RkWWHANT3DeGv9DRW8IOYJLDkKSqqa0F?=
 =?us-ascii?Q?fUQQcLRDUTniQooVDRDBW68umIQNVphYjrp3YwhLCVsPVqeymA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SoB5cq3fhW82AEHftUImHqqbHJRoOsGTHidG8ULeAkjr60XWh/rqjU9E9TZK?=
 =?us-ascii?Q?EPPP0aBtQlY7aXXZJZQcXaCz6+YExpsQlol46um8nCQk0/WzSEzJtj9ROEpn?=
 =?us-ascii?Q?6zKJG08ao6BhMHf6uBO2wAZOg6vBPOZhg5/OWbtESRSTV2ehHtIHoVn14pF2?=
 =?us-ascii?Q?B59fd/RKOJDDBILKUZYboLiX+aK222k2vmGoqzPytzBjWTM01UtRJg/VvY6S?=
 =?us-ascii?Q?HXsb77i8p1kPOTb5ODwuRx8WlSweGcF2wmB2fHlsbe9NmF7pGbmSMjfSqZj1?=
 =?us-ascii?Q?3aQyMRF0kRDCSaoR1SiqAayUUEEDXln6xplGSFBW59dRDidnIc5rN7JLRNb7?=
 =?us-ascii?Q?l0VweYbNV5LLifFR1b9m2n5YZtr9j7M4v1bDGx9tTUEsb0FraO1DrfG31QwD?=
 =?us-ascii?Q?avbHxn2dPbbXsfl4w8+LVwB9JslJGHxeW/wsSo403gxf3U3RJT1m1XvXtQud?=
 =?us-ascii?Q?vIo82YJzvP0DXS2PPXqKAv8h7inAk0VMyDSGpAlfXpznYYyzxP6Akh1SLYTP?=
 =?us-ascii?Q?IwXIJiUur060jN+ywNhGnIHFpCz5Bktbij9BULZVxbC+TwngwuNo5gKFZH66?=
 =?us-ascii?Q?HIpc+t1/K5Fd07cGRj8EcEWXtTtBJq4umqxZMaGDZCsgOmBY5NsVWUVUVBcu?=
 =?us-ascii?Q?6OjTWLj5O6MJX6iB2zFjM6+hmhbf+UYLmvyIYih4TdWMpuEQ1W3WcV2WGeSv?=
 =?us-ascii?Q?ccDyAJe22GsEMUKqm4cL0YOd7Erk0r3g/r2qc1WQmB4qpvvvDxCU+L9adDe6?=
 =?us-ascii?Q?B+jW/TrEdbxxhI8lngN7PdBqcHlcYzIS7h6TyEKQzQekySdW9ubMnQLIU/c1?=
 =?us-ascii?Q?rlGYWKXqIn4SW67C/ZxTEfdWZifNCkoqk5psSj8y5dJLbExiUKTC00hB+d/r?=
 =?us-ascii?Q?ezt/ZQkDNK3qkldrJrCopjoSVrM74mTM1uLVNHK09pW2mT7VsrTBpT60UiY0?=
 =?us-ascii?Q?gMTYD/8AFjqVcFpL61dJWRIUao/5JfWkc5V9USwAl/Zf7jRuzEVtufp/Zvlf?=
 =?us-ascii?Q?CvApX9N9CFnBa/oWETsIQMTE+8HzSc9gKhq08UTgcvv/nTT8xHwLSRjLomHI?=
 =?us-ascii?Q?FVaxpvEvLS87HTAmMjyGXPIO98kFKDXUfQApLQKNjeyfZ6u8OolArvllxxeS?=
 =?us-ascii?Q?/ITQDQ9ncCZplBDLZIBwH+a1peSe3UR3XVEvVdjDl1u9jc7Re121CHQ+sAPy?=
 =?us-ascii?Q?l6J8ZYVqH865M5tKjbBiQaCSTq1v17/7LHOgqChkNqTUg7REOzdm7vQKOArF?=
 =?us-ascii?Q?VzBhoUk6IQE598zvEVtcX2UEayG7zUBtGwsjxd449A7Xtjk+8hdPeoeK8WYv?=
 =?us-ascii?Q?rdfoktDsvwv4J0NSbpv5QPMVr+P4LpA83AOMEKZrftBzYKeljnxYyOAxIDMb?=
 =?us-ascii?Q?yp9aRMMVlzJaueCmI9hZwaGv+hH1P5p2+Mao2aH4MZstY4xUdItZQLRJhZM+?=
 =?us-ascii?Q?caWtwBiKC9jZeurtTlcTmWrYJnRaVPC6bg1D3v1fZq+L1LGGcHEPyc47Lcto?=
 =?us-ascii?Q?8JxnZynJcMANLvtPKr9yqFE0XK1wNX5iQJYICyyoQZlsS6us8q/xxwUUNY/q?=
 =?us-ascii?Q?/IKxF3jyB7YbR/EBu09pCRtn/N4aSjS+6muiE94Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1a31a9-4367-4290-1ac0-08dd87fcd0ad
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 15:36:46.6719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQc1TLwOyyeerFF1VFAqAd5ESx8WnrQHx2uDUbkV5xeFxRPw5qg/opnqDlIHggnlk1zKU3BVMRT1rqZXw/CpIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9665
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_083651_905445_044298FA 
X-CRM114-Status: GOOD (  11.35  )
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

The QIXIS CPLD found on Layerscape boards such as LX2160AQDS, LS1028AQDS
etc deals with power-on-reset timing, muxing etc. Use the simple-mfd-i2c
as its core driver by adding an individual compatible string for each
board.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 drivers/mfd/simple-mfd-i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mfd/simple-mfd-i2c.c b/drivers/mfd/simple-mfd-i2c.c
index 22159913bea0..506b69858a84 100644
--- a/drivers/mfd/simple-mfd-i2c.c
+++ b/drivers/mfd/simple-mfd-i2c.c
@@ -99,6 +99,9 @@ static const struct of_device_id simple_mfd_i2c_of_match[] = {
 	{ .compatible = "maxim,max5970", .data = &maxim_max5970},
 	{ .compatible = "maxim,max5978", .data = &maxim_max5970},
 	{ .compatible = "maxim,max77705-battery", .data = &maxim_mon_max77705},
+	{ .compatible = "fsl,lx2160a-qds-qixis-i2c" },
+	{ .compatible = "fsl,lx2162a-qds-qixis-i2c" },
+	{ .compatible = "fsl,ls1028a-qds-qixis-i2c" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, simple_mfd_i2c_of_match);
-- 
2.25.1


