Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A13CFA46B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 03:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kbtSw1Aby/sTwD6KXzGCGPw3alKIdaP/BVzSXLrVcsU=; b=NHGk+u0UwbaoNPK2tZQIMIEUn3
	gkFrW355LHub54xXF3kI//E9GJGVYdsxCwxpWJB8HKi2qaOIiTX1Y5TIC/ciDwK4vvRuQJobert4q
	pyAJVUrmVRz8UGERkWYxqzQvyeD3MCdQ4S4Hp+ZNB2Mgwq6ER1r403ShmdHnUb+2OAclZ97+bWL4e
	fByu5QvGm6l0s7RvRnl1MeqAOnuwRwzJ1CsgMz09Pq5DpwEBcQu2kwVN9asBYkoUf/jvh5JP35vP+
	uN1eDtpoaJiq30IwSCHEiNBzG+yCbgKEaac83yznClzkMKsV+RGObIIC6LQAzLM4V/2+fuKCRAN8N
	IV8zBctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHOL-00000007jqr-1jtq;
	Fri, 21 Nov 2025 03:00:57 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMHOJ-00000007jqG-30tv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Nov 2025 03:00:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOIhlnJMCbGDrKYnjm8x0gRzzJyig8MsAYHRV4IoJ4TjUtt8tsS6IEGlPZUHHe3Yp1bhCiuR1j5gYoD6SxYNJ4mikuvTuYXhl04GKLyvtd7kp7pvJ2dSwZ3v7Oock/3RRTyOxcca319ld9Ckd45XaK3EkaC8qDOo8wvyCsjxHoCe/APk9vxf6JPb0V2/VT4vUfvovUhySs2BPRALWfY0NCgsmJNG0z2TXFTwRiPO2kV8QGMU9Kurt5yF/yzg7jr6PvDciW2Kq6qDnb+6IZCJrhDM+BEmj96pijD6ER6ss6/zU42CF9BRdmtWkr/lA4kx2daGBwkuXIfrGCYEgrULgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kbtSw1Aby/sTwD6KXzGCGPw3alKIdaP/BVzSXLrVcsU=;
 b=lB2aFqX8QVhtiZjA3hXs4SI5QZAQ7G910OoeQdTB7DW334mOvjvNWfXgPx9nz9qw3QxVvz6WzDMU9BQSPYWIQIhkycQeyuo8cYvQQ4XcQa+l9mJ6c3tbQ5nf5T7fxhMh6b1sWEIES+IDRQJZBg2nuiODYIASsdlmTX55bdoCoY+QRgF/DND9oG91hg9Seq+2cxOY0Ns1Tk7M929AW+sluySWkjsI4BaJkk0+jaYHusQBCN6wdmvrSIR+LncSFHRHq6ewerkYlHLf6j7LVAXMzSK6GDVahQ/V+TlneU3wkSbYZXPHz4dLQuDT0uISStGa2nwXPeWAQn0yF55eP6Wbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kbtSw1Aby/sTwD6KXzGCGPw3alKIdaP/BVzSXLrVcsU=;
 b=M/NJCFs7KaGWl8iTXfmIYwL1xL1yaMAtC8SveHAlLYDd6KEhw53MR5ZiiYmpqw08ThoGzW2o1CD7lIHznf59CjZI293IUWC3GEqPMaPixHEKoPhN0/y8B4yK+ElTqEM7CDDqGvKEPUHlUTXMoiCfr7AhDnw9O+bBKk7fcm8uAmGi/pgAXhJfCCP8v5sDQQea3SVjlPCZQM/G2FGPirAc1NfkvKV1z5zAVDkv/lAwxsza4Wte1H2fGqEArSTDBzLd1hhAI5t6Ei+abcEqehmSE69zjcocyeXmOvNOPI3oHfQ023vL3fXssDBW8yqUQ6YWEJITl/c19k0nkxtWgIfzww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM0PR04MB7092.eurprd04.prod.outlook.com
 (2603:10a6:208:19c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 03:00:51 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 03:00:51 +0000
From: Carlos Song <carlos.song@nxp.com>
To: frank.li@nxp.com,
	aisheng.dong@nxp.com,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	carlos.song@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] i2c: imx-lpi2c: change to PIO mode in system-wide suspend/resume progress
Date: Fri, 21 Nov 2025 11:00:30 +0800
Message-Id: <20251121030030.1844530-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM4PR0302CA0013.eurprd03.prod.outlook.com
 (2603:10a6:205:2::26) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|AM0PR04MB7092:EE_
X-MS-Office365-Filtering-Correlation-Id: f1866aff-7487-47de-9e91-08de28aa2d97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l54ljM6fBz1b290UDeL3+eLUQDfKzUmbo/ApOnIfLrl+l/ivEkaWvOO0+NHo?=
 =?us-ascii?Q?c9JDm0CZtcxbYkKrqLh/yWOwSrQVi0O/Y2YSVGln/awp80lbmqKjinBr04pp?=
 =?us-ascii?Q?5MHzkuiibHC7ejiziyZMY+zNw+57ZjeqXcp9UCnOryqcrK6rgbanFGe3ozss?=
 =?us-ascii?Q?XgU5IWyErf0W2dnKzrY8si4N9eOjTP8O58ZbQGdxemiAxwW9qKF3qAI49SL4?=
 =?us-ascii?Q?+BFTq274nQg2lGUDxP8rvw8C2BBAuqIAB+b+I3cyhFbGyW9dfC1uKsUvv688?=
 =?us-ascii?Q?p/uibNqFxLskTRBg4xYIUaK4ydKLpNbQEQb2Uy/4dYZTYqyD+IkjYMRTW2ei?=
 =?us-ascii?Q?W7U+y6lZzd/cZSny9P1Nn8pev8WxD+Z3YMtyRWRSxR4uXLYlSZUzxsnYGubs?=
 =?us-ascii?Q?FLy6zKDU0hrq/pKZxI/or1Ls0In590PEaRBiy6Y3yHi5/4k7xxovaY1/2usJ?=
 =?us-ascii?Q?LZs6aoYUjf/nU+XL0t2ncVCBfitmDF3xuR3y+Fp26jQaWDn79w4MXroNxNvR?=
 =?us-ascii?Q?bUn0pjFWBW3cNZUy6cGiSwQtEhx1MV+xJpydp/FMh1cjHXlbqeB3OUN7Q5Na?=
 =?us-ascii?Q?tbTnWmy7QmhQG6N0pJPcH8dZiclzqGGMPS1jfDXZ/06N/Z2mkTSszPGhEi45?=
 =?us-ascii?Q?42YDc9V6u+LLDkXxH93i1UB8cXx1FqYww8BYZ4Vdtuu6x+9zo30U9XwfuYEJ?=
 =?us-ascii?Q?ZyA/6BArWQfL+tKUUu/zujW9jNXZwiEyHZHefB66iASGNONKdVvEJEM61WR/?=
 =?us-ascii?Q?2S9ZdW8zdx5C2pB9Ykx0frSw0jIdSMW6rs42S1h8I3xQXe4Kpyl6h4HLgOon?=
 =?us-ascii?Q?peATsQ+CWufHnfXVifvDa4qYTqEJqApcfTS/WxZ+MIp9dxMuMe47dMPIQDLf?=
 =?us-ascii?Q?dl1whGY0HQoTjxUkEzO8gC/Hyet5Chedww32+XVFNF/F66gQuepCt5HALCP1?=
 =?us-ascii?Q?Gg1Cx88gXAK4EmUC9nKk2Nu2/XT7NZAJCTMFTwJ2IIOehs1NhDmapwAaYTg8?=
 =?us-ascii?Q?QVQaTuyRZbvBJNdEkCkOX6W2nwpG1OnSQYXM+XwU1oAwydsb9uXF+oJv76dj?=
 =?us-ascii?Q?jIbXsEpm1EvjAWg04YB9bwoAn68FyLqpjd20dSrLUJTSTD3wanLGI8MUZTlX?=
 =?us-ascii?Q?z3kUqvR5Etuw7aq/aPBt2T2XG8WMbrOVbSpoUuVMTwPhRWmZrMGuSWXgpc+g?=
 =?us-ascii?Q?eR84SpoGX5LelZ2HfjlYkJo6ResMGia8d+ujBwMwB3uPpb8mk2A/dmdmpMkf?=
 =?us-ascii?Q?ukYaZA6XUmYqiQJgaPd8Y4VpGqzu4ooV7N0JU6z61qzA7c9YGI3ig0U76dyW?=
 =?us-ascii?Q?iEFayFjqEWKVRY3LXNwawPZhauCic8o6gC/5O7zfRgXWyYjKhzFVpXl7tXUB?=
 =?us-ascii?Q?ZRgt2n5huR3i4FVVNuvjIgmv5KDgHNNFROe8YQHk8chFwfNIeTUEvHGAcZ3H?=
 =?us-ascii?Q?ch1NaprRrsjJ54dMdij43ftc3dSqeVPVYLMMGb81C8mkANCjQ3djl0jQFFMs?=
 =?us-ascii?Q?ejQsUoWdJottbrUSr9F8sNbWZZtx5bvmMi2C?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4H5wTF0b5AorNoD4FgveTQdaDltOljWFLw2fYAkIowXLn62v2OncR4v9jeTg?=
 =?us-ascii?Q?5NomjBxNv5FS+WTWlhE2PzgmarmtRhrrRcvxFeBoDlOuxg43lI0razMmUFyr?=
 =?us-ascii?Q?NB6xq2AogAGE8QyaOY37CwAfFS9YcHqtMnxmSTNKbBd0voaD78tbGG4ifvBJ?=
 =?us-ascii?Q?aLu7B7vn0l4k37ffyvfzAz7oMOyWxa4uNCSZ/uCXf7a2p8njCz+yBqxLxBoj?=
 =?us-ascii?Q?fTX43ui9KQPLbz7CBepEUVHunL/KtugufOTMXCOEkpWmr68cmjLz88nSc88/?=
 =?us-ascii?Q?jRRZmUTuutY6mJ8hvea8gbSu1n8Jm7+zx1wKuWaNSqNVq2XuQnC7J1stKsV9?=
 =?us-ascii?Q?cOnk4W5513Y6hjTWxSOr50fGLwpsNqLxjSrAkhh7KXqG/ukPejlZgGAB+CoJ?=
 =?us-ascii?Q?bsz2AfHefC1p1Ci8nG02t+EZdqVTHV5aXTKUefwfcKWvoucVXuSslOfhoyPE?=
 =?us-ascii?Q?ytDGmX3NKK/xy6kA9Hgft50ImL9agdDsbvhf1Wx+zjUqHoJUipUA3Cta1xI4?=
 =?us-ascii?Q?nzaMwY7ZPG0vHJC8a1OIbrVQdzFTfuoiBfsDOu1FVLJj/l51lcaCfAKj6f21?=
 =?us-ascii?Q?YQYTkiDVewJcTJylimjBFmNpJYrSjW8xsMqf8m6fhWOsRwNRjwZbcMLTS0CY?=
 =?us-ascii?Q?z9x1hUvWUUIkrgyfY8QgLlTFmxzzUXRiExMnTE6/U3IDffPEGflPQ6kpCXOw?=
 =?us-ascii?Q?NaFVselh4P2VFiv+d63+yze4a1RlH2KYsiKosk7d3jw6YnCQwFHeUjAobzH1?=
 =?us-ascii?Q?ZjiHSiZFFoUXRhD3K9PrPBEapq4h6uMwqUN7hnmYvf3gZXLmkNuGaCdfmT5Q?=
 =?us-ascii?Q?HBLVxFyVOfSa9uk1q7plVSCHGNqzCAgFYejZ6aYe6QOwFGNx+Ep5i7JyjoOa?=
 =?us-ascii?Q?v8jd0HU0vpk7dcfbzeSyLP3lfOOT0OcGSmepT4exNxqrzxwopUYSKPXNHYyw?=
 =?us-ascii?Q?JtqDBLtpTqa/pck7NnhScDVsWPa4yHOLb5ZWNfbblodEc9kJNQYb2a/joDMW?=
 =?us-ascii?Q?pHnUFsXYcjwkPES/0xT19r/vCyXr6V8Re16Szw6qgfek2Q2Pk8u6uLjpL4Yg?=
 =?us-ascii?Q?zTgUUVD7hvz7fevnupqv+J/aNnfePdPfWUFEyImlpi8ao9FwVYL4G7vHkJQH?=
 =?us-ascii?Q?MZm4ZbQ9pj+ekAGcsK+Se2CGIKiYstKAxO4/XkoQZiK8uBuTprizo/fM78Ql?=
 =?us-ascii?Q?PKWLzGIH4Ch/wx1kZ0Jlyrv9UfeU3O7MPMPb+Ae5+j+6xt0+NxTIHjFPhCiD?=
 =?us-ascii?Q?HBKHqdyJkCJcHwi/hVmEX3Rm0T+ogoKCYf9DSy0Hv9D/l3OAlZREwHaF5l5A?=
 =?us-ascii?Q?3qBV16quhTkhs+VvZD6XO51lLyLAOIlver9YyqQzLFw5ZU25YrEsuNRfQobG?=
 =?us-ascii?Q?072vkRPLHmBVkxOqSjjdNS1I9YIQmnENWMMypf1QSkj1OC4veGEJg6+aWg++?=
 =?us-ascii?Q?J25F9CuLlN7Tjg6Uh27xajR06IegimGHOQzACSn85tvjI2jKDHnQTUBdA6fr?=
 =?us-ascii?Q?Lvj8o5T3jYte/cS/78YYDiumw39jWZEh6zA+Xk9WPHRP6IjPG6KOsQN5CjXu?=
 =?us-ascii?Q?aUEtz326srCHu785mtEGFvBW85e8m8I1nQ4mWLAU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1866aff-7487-47de-9e91-08de28aa2d97
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 03:00:51.1848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QNXqfomNraMiAuc29cpmad+j2bRzLQelmL5cJXSu7//Svg5IQgi9GwSfjWpPMw3Vs9oPquQcS5zGymawN+HvbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_190055_758938_3C02F371 
X-CRM114-Status: GOOD (  13.67  )
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

EDMA resumes early and suspends late in the system power transition
sequence, while LPI2C enters the NOIRQ stage for both suspend and resume.
This means LPI2C resources become available before EDMA is fully resumed.
Once IRQs are enabled, a slave device may immediately trigger an LPI2C
transfer. If the transfer length meets DMA requirements, the driver will
attempt to use EDMA even though EDMA may still be unavailable.

This timing gap can lead to transfer failures. To prevent this, force
LPI2C to use PIO mode during system-wide suspend and resume transitions.
This reduces dependency on EDMA and avoids using an unready DMA resource.

Fixes: a09c8b3f9047 ("i2c: imx-lpi2c: add eDMA mode support for LPI2C")
Signed-off-by: Carlos Song <carlos.song@nxp.com>

---
Changes since v2:
* Updated commit message as per discussion with Frank and improve the
  commit log by AI
Changes since v1:
* Updated commit message as per discussion with Frank.
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 2a0962a0b441..d882126c1778 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -592,6 +592,13 @@ static bool is_use_dma(struct lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
 	if (!lpi2c_imx->can_use_dma)
 		return false;
 
+	/*
+	 * A system-wide suspend or resume transition is in progress. LPI2C should use PIO to
+	 * transfer data to avoid issue caused by no ready DMA HW resource.
+	 */
+	if (pm_suspend_in_progress())
+		return false;
+
 	/*
 	 * When the length of data is less than I2C_DMA_THRESHOLD,
 	 * cpu mode is used directly to avoid low performance.
-- 
2.34.1


