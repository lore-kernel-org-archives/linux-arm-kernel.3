Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C45D5A6EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 08:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gw2GdgKgzxq5HSKx9n+vRdiBQcPlh5JwuYYecwcvkAw=; b=qjF/+gk59joSDrDHnWxllDSdVl
	hEiHVmXiB7xsN3Te841pwIt3gDvbIqlN1/VnBu1EeIN44iu/1K+rGSh6JZoHl9rhFZlT8QASfJGH6
	i5tenL9GApuRwFeglCFXghV/WVZlX3fwWSU1kfGRxX0rgR/HBR8bg9jy6hAgQHoKCg7htG18ODesN
	c4c414i9J1OeW42bHlTbYAFSwC0p6jfsbj9MFjnPy4djOVTih2CT74PrUu6kYvh44FxQV+VeZdoqp
	I5QQvJ7I4gXF6nxy43n+6n/Xxx43lqs63ithl6bUlPER9TOAn/PSVQ93VA2mQAH2KUmUyPT4IMlbm
	cU52pi4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqYZ-00000009v2a-3rl0;
	Tue, 26 Nov 2024 08:04:23 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqSl-00000009teq-2NVe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 07:58:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P12dig6tgFJkrXDO51C+qHkErt90BUGaePKGXNRlqOMM0wK2HddRUVpE3jQH507he2ksWH2RcZZtv44GoCpzWLuaf6yw4b0DHWQkYj6Z1gsznKI43hSg2h5tHHjKcEnj5YcSQBavRAhrhfH4QnD89wTA1C1J7HDZ+WRbmR9AR5xQ1ZOj9wX4vYGFy+YEOw+W44RUw0uFkGvY2Y1SccdjEVxn1cYnlb5VdcFSvK4nJRQJGdjoqP4R7bc5urT4uC1t8pN2WhVaBaUcFCe33xfo7TZLagSHfe6T5KjG8sAoG1ziNuT3qAasoYXY3ZW3M0Fx/3QZuG1qRk6EyqhkDWcalw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gw2GdgKgzxq5HSKx9n+vRdiBQcPlh5JwuYYecwcvkAw=;
 b=tLl1WaRFzfru8l7vELIY7Q/XbWIu139osFoMzSpNY4p0gg5sHNzbvCwrY4IaQJ4Le0f4dWBKPWPfmVehJF1Blmso/ZHtJBEjOLOgkKeOdrq2a0POVQZfjzkZkWcwoPW94UNnZyXuXsXt5Cecs0K+1HNTr+5jT0iVi3GUS7lXargG12UWAH0KR6xMjF7ZdVgyqAaUf75jZ9AugT0HKhcs4az1Shdxid09seRCXNVsIW+57Od/4SPgq2QVC5TtwVQ/0IbYu1EuzFQ0frc++6i3u+MMq1CVF6lK1G5Qdg1O0H93GWmPKMKg74ZDLMsWIWi49S4rZsNO2w1bo5IKlR5zbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gw2GdgKgzxq5HSKx9n+vRdiBQcPlh5JwuYYecwcvkAw=;
 b=Z122owBxm3Q/xOnGyoVAoRA9E9by67yLopa/YhtSl1CqkcbFqDzE+1UtKUFbYWtdYpk1cVV31L+sGUsNtG5HWgU1lURiuLd++j8io+NHwjVtbJ4lmop2dtHtOHXcS2/OzD1+1fq01vpOni/EOj0qv4V3rRVfcOzXiYbL81G73kwf6jPh7DJRqJHrrrZ9bA4mumi7ExhQUftOVuBI3nDooG2MjZlr1mWCse2sZKvqElBjUTy0caoXq1GsFk10juuVbcXd/gHz9KIWcrp1vzdBWvHi9GbuFMzWNQQUaHgmEV6h+uR64OEFzwPcAVekg8ZxFpkDASM8gUpYdSJ+smBzMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com (2603:10a6:20b:42b::10)
 by PAXPR04MB8489.eurprd04.prod.outlook.com (2603:10a6:102:1dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 07:58:20 +0000
Received: from AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93]) by AS8PR04MB8676.eurprd04.prod.outlook.com
 ([fe80::28b2:de72:ad25:5d93%4]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 07:58:20 +0000
From: Richard Zhu <hongxing.zhu@nxp.com>
To: l.stach@pengutronix.de,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kw@linux.com,
	manivannan.sadhasivam@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v7 06/10] PCI: imx6: Fix the missing reference clock disable logic
Date: Tue, 26 Nov 2024 15:56:58 +0800
Message-Id: <20241126075702.4099164-7-hongxing.zhu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To AS8PR04MB8676.eurprd04.prod.outlook.com
 (2603:10a6:20b:42b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8676:EE_|PAXPR04MB8489:EE_
X-MS-Office365-Filtering-Correlation-Id: 2aa0831c-1c1b-4226-ac01-08dd0df0181e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w4UpRNiE6U8rUkbpBSSOchl215Y4xU/gtwaXgqMRT3RSzU9meYpf7YJ1RPr0?=
 =?us-ascii?Q?Us6N4x2Af41czVdGg5aAW27OfIpYIWXy+G+KnatyoWNiRMo4qHu5lsXOTZK0?=
 =?us-ascii?Q?E9CLDwD9U9x+rv4GGV1pUwpbxbQhUgsRUwpC/VTclnjV1HTfuuZ5vPJIjKyc?=
 =?us-ascii?Q?k5vWk2DFayuSp0agNzIybDm1gzf/QVFRyYwiAiDHkS8jE/sJDYV4eoqvG+sQ?=
 =?us-ascii?Q?L+Ry+kDh/PdkSV4q40BLPOhB40KCxPxDFPe3+xdJ+cgBbocJj0Z9DSnBS60K?=
 =?us-ascii?Q?nnIoCUsXsdFSIDLaktCwYjYZIKH55CJz+EikfHXgeat+0vJBQ1/lqscqa1lb?=
 =?us-ascii?Q?YjTamIa+cz5wzcdOjAlqQQQw2OM7s8xPuan83KrL6LsW/e5WFcHy401ABOYp?=
 =?us-ascii?Q?TF45e1ajX4ALwCfZsgIFfH1AJsk8OpIdND5aLiSVN20lrXc6/RaKrW+OzeyV?=
 =?us-ascii?Q?ukMWQYxxMen3THiZEMwDjTdJBCw3hoIar7dstHoOr1YhUg5jT0RUgsearf0B?=
 =?us-ascii?Q?WlBHqt49rU1FDGRHTTKN6NZG+L6fLyGiw3NDtRWR9S9QLt8S4VYYgkJtHrNC?=
 =?us-ascii?Q?Yq1pwEzeDVAan7mTyoiiuoK2iTnzvycvHgeNpy90AnyUJ9YFOVzlhma8K1my?=
 =?us-ascii?Q?B4rK4YaoY6aY6vKIPX65iLwjFuIu0UgKXdh8LKoydb6TpVD8v6cKvhpjiz7z?=
 =?us-ascii?Q?fii7LWSXPo+T94So3lrC+wZgfniqFevGG9DuCuXcg/n9tGTO8zx5PNF0llCc?=
 =?us-ascii?Q?MAoUyPUmRw5F6EsROIJ+Sqv3x8eN98/Knu2tQfZp4L9MeFkE86MJXwCZ8SuO?=
 =?us-ascii?Q?f00EjZbRT/S4qWE8pkBjsxQTj6lgC9QrkFHCJ9uHrBrcqbFBB4z/m379YNIq?=
 =?us-ascii?Q?CXzRBvJ+MiroIpiXtiptEEZXuQbE9fxxVMrIZ1GMKFWsL/wnNtIIVoJCxb/j?=
 =?us-ascii?Q?uU5BwqVE5piRNM/sOHIkkKEWgSBH20idd8nhnRpG+skZaxPIIxeI5pKsKUzj?=
 =?us-ascii?Q?2O7JVnOjpoiC2F4UtP/imuwtQ3fBgo0JkFYUtdTs/j4achEx6RfCz7aQMDv4?=
 =?us-ascii?Q?7CHJnuoG4+UMnoDM0wCMw7cz0fyDkxkds/tutJPvX9iVSIsj9OeMab+RTt8s?=
 =?us-ascii?Q?sI+QPExAQZv5ReCGwKXxKfC3ojpqjJJL4JONgB9aCZkFrfBGe06e9nvriawY?=
 =?us-ascii?Q?8zS3tRQM1jjw/mXqQmhOXArdRZcSPzd54OBIFIdA0mn0eqXJ7V+1Zl+RX+UH?=
 =?us-ascii?Q?C0O+H/J5lUpXBfsWnSjMWwkh+I4TvRrlmm24bNCdiHHRu+AhZtDXRYFFc/WB?=
 =?us-ascii?Q?JuE+aWa8uILg0VSFBIkVTgsF3K6DR2NTqPujyByQeXFBhO5frEPghC8yHkrM?=
 =?us-ascii?Q?bU0shSXlyxQ7/RNuI6ez4V06Sk3O3ubnc72g7o5dfGdbB5PLtb46X2IFzn7P?=
 =?us-ascii?Q?1948yRbzakA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8676.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ok3N50o/l2ekSoPqSnoGH/328NRxW+HzA4WvGd6hOhnvX/mmxhhc2mp8hL/g?=
 =?us-ascii?Q?qMfwY1nIvtJ2txY91wYjX2WCOVAeBKWV50JOxbdmTVfcC9zHcGFBj2gRNUWV?=
 =?us-ascii?Q?QpjW2mQ+cnSnb8iGFQZ52UoHH3Xc89HKHfbzM6m9IH/aLGhDzwChSAg37qf0?=
 =?us-ascii?Q?A9bjTomsN+0gfVMZ5xt4aXKoj8FsdsUkAz4tuDmcVU0R4vUKKfaVFveXADZD?=
 =?us-ascii?Q?Ktr68G9275USI/wfgVCEyAoFyP89340CAJ7fdFLMA9TwFXZdhSOSbREe0cNp?=
 =?us-ascii?Q?FIQ5/tbvYLtkzM1yPKBwp90gTmS4PSlspm092sXE8h09S+2YT/VIaePyQN6V?=
 =?us-ascii?Q?NTZze+HOM/HIuvg3aVM/J67bOpVmHkmekryJLKLDjNGtDIoSCet0ScRhL0p/?=
 =?us-ascii?Q?GyKQFe7POjM6dRoHyyDkaxw8KULxIMJdfumr1VHWEIzvD8TDueAnURaX+Ufh?=
 =?us-ascii?Q?HhV5xwh9iaiqG/5T1jLn8LtuVH+HTgG5XsxdUDmBo6o9pPrlNa+qGf5UJWIQ?=
 =?us-ascii?Q?+XMjSc7SQlOmzX4pkXH9V16t/Wl3aeBz16Ll5sL9RzrIGts/vAXJUUVmf9I+?=
 =?us-ascii?Q?yVY31LQSLExQABZXcvaYJUOg2CuIIsLxgRwVhaGxBAWcFvRf/QkY6ztAHkzQ?=
 =?us-ascii?Q?5MsjxuKXE61BCz8vKOlUNlfm3HuTbGCRQrCDytOvnLMbRP41RKP46LPRM5Qz?=
 =?us-ascii?Q?DDdS0YqwQzQa6cvJxOoycALLy8rbMjOpCe5qg9s7Z1QlL8D8es6hhInvo34x?=
 =?us-ascii?Q?9ydLWoRHBzATMgSl0F/l4rzZ8BYxUczGIItt7iEuuD1s5w8ZfcctQdMddXpo?=
 =?us-ascii?Q?XgC+0Nur7qALfagT/PTfqsbx+Evpu8gexCTy47M+HCKGnTiPh6Iu0QIC8Du7?=
 =?us-ascii?Q?SLOSugNPCU2g2vYNRAjoBmz1p7wmN498I8qXiW0xcpFeMew6yr09HGyU5WyU?=
 =?us-ascii?Q?By7RPlTxWzwuudposlDJKpnjhUlBleYmBwcQB4CnmvHgo4HWKl4MUN85Ufi/?=
 =?us-ascii?Q?yFf9S9MX53oRlmkpPZJZcNqJNnrDiDN9zHfGIh2BSiBmK1gwJr9ZPkSxXcq4?=
 =?us-ascii?Q?8u7bH9X/2O/e4rMTyznmOWWxUOKcPdmBb2b5JVYuy0mHz2oc/zNu3ebzXJzX?=
 =?us-ascii?Q?UobAJGzcQqsFITR2162huQXwNbdcFKi0Aqt0qzDJzXRBmbqvuyzhC7kJsPAR?=
 =?us-ascii?Q?MmDg4tmr+ZSHRY+Uw2FU0R5G2pme/djq0DRRT6BTKJWp5kJfm/AxSdnVxZAq?=
 =?us-ascii?Q?cD+wBvDryFXecfuIdc67hK8XRAD+Dep3P/gXoTvF8x6NxcmjGyO1+UMt1Y6z?=
 =?us-ascii?Q?YpCsXiKcbwUZNjnbB3a5q98hH/9QpIBUcyTKngrqf2dUAC7XDBaGQ2p09ptW?=
 =?us-ascii?Q?XmpdlhgwEbK4kb/fsixq85kYnZoBzflgp3n5mQSLsC2qPOMBZMrkUS5rBkkV?=
 =?us-ascii?Q?dP6IRID+17a4Y9uaUCFvMHAjYyFHFr9jQlf+go0BQbX1I15evDHRnV/hCYsQ?=
 =?us-ascii?Q?dqvxO6GhKXDZtMM090rTN6BYt9FB4LPShZW5jhtLSrLnjLSPtHGE485mNeoZ?=
 =?us-ascii?Q?T0IKICNKpBPsPLu76ObLmodMh3yqhIBKZqu5zE4a?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa0831c-1c1b-4226-ac01-08dd0df0181e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8676.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 07:58:20.6690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTYJovi5cncek4WfgNMnw3OwMdFh2HdXAfjY0mV9aDeVESHIvAjZVv2QgkkxjikKJKL38q3ImaSoqpn10gbQQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8489
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_235823_604489_0FEE1991 
X-CRM114-Status: GOOD (  10.72  )
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

Ensure the *_enable_ref_clk() function is symmetric by addressing missing
disable parts on some platforms.

Fixes: d0a75c791f98 ("PCI: imx6: Factor out ref clock disable to match enable")
Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/pci/controller/dwc/pci-imx6.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 413db182ce9f..ab2c97a8c327 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -599,10 +599,9 @@ static int imx_pcie_attach_pd(struct device *dev)
 
 static int imx6sx_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
-	if (enable)
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
-				  IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
-
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
+			   IMX6SX_GPR12_PCIE_TEST_POWERDOWN,
+			   enable ? 0 : IMX6SX_GPR12_PCIE_TEST_POWERDOWN);
 	return 0;
 }
 
@@ -631,19 +630,20 @@ static int imx8mm_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
 	int offset = imx_pcie_grp_offset(imx_pcie);
 
-	if (enable) {
-		regmap_clear_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
-		regmap_set_bits(imx_pcie->iomuxc_gpr, offset, IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN);
-	}
-
+	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
+			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE,
+			   enable ? 0 : IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE);
+	regmap_update_bits(imx_pcie->iomuxc_gpr, offset,
+			   IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN,
+			   enable ? IMX8MQ_GPR_PCIE_CLK_REQ_OVERRIDE_EN : 0);
 	return 0;
 }
 
 static int imx7d_pcie_enable_ref_clk(struct imx_pcie *imx_pcie, bool enable)
 {
-	if (!enable)
-		regmap_set_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
-				IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
+	regmap_update_bits(imx_pcie->iomuxc_gpr, IOMUXC_GPR12,
+			   IMX7D_GPR12_PCIE_PHY_REFCLK_SEL,
+			   enable ? 0 : IMX7D_GPR12_PCIE_PHY_REFCLK_SEL);
 	return 0;
 }
 
-- 
2.37.1


