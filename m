Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5748CFD37B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 10:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHx5Jjm2tihRKabBEmXsjN5rNhiafmMtR3xsTs0+9qA=; b=s4AF+QVHy0XJ+uu6YosyHT0Fhm
	/RUq6vp9O0LkYw1vt6kyV9a1YDaUq/VG60tZUXeTYyihJ78Vo4Og13+gjWatP3pt3yPShm+QHwK/O
	6I4KMrXNtvvKPUTjlajMeah4V6mwB3xp5Bxh5YbzqhOeIjU5BW2eazuFgDQfDVdNTpWPsNdsenpUu
	il51oyfb4AtGsUaGiqXZEwKi2O/RprDh9pMouDlMsRukegWuyX6q4T+KWkRyxY9iYMnpuFDqTKt4u
	QsAUFzhuuxKo54GhZfB74gZeMAIQiY8I1+wukJ77Uw666dndIcBBA2wLvElDQOjkXdp+xf9mYViIv
	i8mKy9+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpxP-0000000D5Lr-3Y7R;
	Tue, 25 Nov 2025 10:07:35 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpxN-0000000D5KR-1Fm0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 10:07:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBT8uIxMdwMZQ4eTazcquutlYoRlvqdp5MbaADNJsc3GhY/As/IASppqULupOSbWhCkMrS7xrvdkCh0yDp96q/ag+YMSe1ghtYAOX6ZyH7VQgDaMwe4acxMBgXQVpWoC4Q/OH2ME9HDqu+ameeBE3fwuN1aS0fLpM0CRbbv8lR44oB76Ut38GwXBbmj1tBJ2lfdUF+9lzZOZv8RMi9++qSttLKQpOu3si9ziRIfQtAmOTkDS6qFtDZC/4B9bq3TTBOjO4j/dm70KGybICdSjw8tF6dWyWEGJAwKGVqlQgap0dNnfXLCveRZlyNYyzA+ee3kuAMYlziIcr5Ime3fIZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHx5Jjm2tihRKabBEmXsjN5rNhiafmMtR3xsTs0+9qA=;
 b=Rk5Lk3wAu4zL1SsVekDjtLUtBjrR+71lrgagRgyOTBw18BFr2+mV2VEBVX4Xhd3JS5CnF70yeJ+rhTBy95o/ws9KRZGgLuGwmqrYNXTMxs9OAvGnbExBaNzPyuz4kXVbNqJQbZszAb+0TXk/pr3sSQtzb/UWT+Lp+gcFhzKunRLBL5xxtgAsvL+XZvAj8/XotIRt/mXoUk3ab46RILw4d8/cnYDIjvAXVX1M5D2l8nzb9irej4TCOOux4VBbCRtg+uAm12k9MqC+dzfA7zH2hV8yt/jgGDanoI6nJeFxX/tQA+Xh75BLarZd+wz3l74j96mSANjBnwEZEwZs/fYR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHx5Jjm2tihRKabBEmXsjN5rNhiafmMtR3xsTs0+9qA=;
 b=idEu6X70VxwEDOHztrF1Ev8I21ShPPCvUFO0afkvbgcL9P8Ch9cFm7nRpg4O2h2DftRQbIKMkyZVklBWpAyTHEZGHsUDZ+wEqF7Der6hk9NSXxlEnO30tBjYYoulaSzmu1RjFi3lzfzXVMolbknN3EtbuzYm2gy3khN9glZbLvYehK8mkLz9eFb0gEPCnP5ZxaWZPU45zHxgF7Sh3WGYWxkajmfRbesiYGcJtWr0WN/Gs+ccaeewxC2pZssHpEjANAdikaejBBggnNWg5jkgFM+kgz1Tk+JJyhFTafgx9OKY0yXB8bjih9zFZBd4O57rdlxJc39h1JtdIWT2hVIYOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GVXPR04MB9735.eurprd04.prod.outlook.com
 (2603:10a6:150:118::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.18; Tue, 25 Nov
 2025 10:07:27 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 10:07:27 +0000
From: Carlos Song <carlos.song@nxp.com>
To: broonie@kernel.org,
	frank.li@nxp.com,
	hawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>
Subject: [PATCH 3/6] spi: imx: avoid dmaengine_terminate_all() on TX prep failure
Date: Tue, 25 Nov 2025 18:06:15 +0800
Message-Id: <20251125100618.2159770-4-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125100618.2159770-1-carlos.song@nxp.com>
References: <20251125100618.2159770-1-carlos.song@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0063.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::14) To VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI2PR04MB11147:EE_|GVXPR04MB9735:EE_
X-MS-Office365-Filtering-Correlation-Id: 15032b76-5e31-46db-48c4-08de2c0a6fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|19092799006|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5sKWqczLNe2vu3mcdm4KfjrPZUbKIsx3KftBVS/9JWt1/5Yx8ltOxlP6JGwb?=
 =?us-ascii?Q?K3KmvXZ5HmgSywKeXlEAlQLfVw8pfXyH7IN9SUuM8C+1vP7+qx0j3pcGQSKV?=
 =?us-ascii?Q?yCVjevpcT8mFgeFbs7DK8CarnnLvqN+htWElmKC5kg+45eZNy4gvZBox968n?=
 =?us-ascii?Q?MypAOCxpcur9arALUtZuRxz79HmOv+HAK5FcQgz+O17mNTbH+TZYpY5943ag?=
 =?us-ascii?Q?aRXN066HtNEyiIaY3oc8pu6PXnx8OMt+if0AJfrwBtsx3FKUvDDL2xMNPJxA?=
 =?us-ascii?Q?9DU0clK686OaVUItKLIjto7VfgEXrBU5y7YvEeSISa7R0gqRfsJOyUrA3YyA?=
 =?us-ascii?Q?nfqG7P4sQm/C5kq9oXAUXNWkwmMPiEhzHQCFGoQL6j+XsIoxWokfgDzO8iuV?=
 =?us-ascii?Q?zK4slp7zU3bYQkcM0ke/927Erw7kkosQsn8ZR3Yzc3qeN/80ElfYvJQL4ebC?=
 =?us-ascii?Q?/PRqOMe8U1PvMjR2fkHEF0YK2fHRaRHnvJjeFbDkHy6+fHhpZsuLzxrPAAsC?=
 =?us-ascii?Q?t52/0CYwYp3M7ee+zo0OmTqJJMk4ohIK1Gc+zEWp/UWjOAQ6dEtQd+PXXmpi?=
 =?us-ascii?Q?AAisupCdfxJ5cMSiBsnpkgF1zLjrmuCAcgeoKYWPGzIokSintfOWHwLNbRMe?=
 =?us-ascii?Q?0yd3po7WMU+ywjHLxFGcRWWa1tHCrLmB1Es7wtuGK01tkbaYNCoweI+zMAxh?=
 =?us-ascii?Q?TdPHl4i/vY2TZvPKzM10EI2+hgUcU+kHMdejHDiQ7Ng9hAXdQQDH7UiZ9pU8?=
 =?us-ascii?Q?ioxcHtazk1aqzP42KDgWrTNjNM7jSN+op7rMyZ3/2I7Oks9n25N14lf3nl5/?=
 =?us-ascii?Q?hwnY2igpIUT2CWrn5tJHXJEglBRZCcCpblVNJyvqN8cbwmOMSJpyk/DdnJaD?=
 =?us-ascii?Q?fO4/xr6SLZ1TM8L6WRFG1Dyv80gC7AnqlbQ3ApYUxcPVF/r1hhNy+8sIjyyU?=
 =?us-ascii?Q?6xUit28JF1bFWfQocxUERTxj3rHM6FVgiFp0gaWEdQFbdG+/TkTde1utI6mq?=
 =?us-ascii?Q?Q0Smhnh02DQ6nChn8VPL2fGj+7m4kIWKf4TxbCVHBSwiE2SBDh++93/+42HP?=
 =?us-ascii?Q?Dbn+Cu7zWW5ueQK/JQBvSqCR4UPM/neZ4ZKphpv7af/rMQHssth3MUX4+702?=
 =?us-ascii?Q?1XfHKNRY/U/Wz2jIdQpNOXg/V0Zl7k5o/Z4chYi0GJmjrVePyFA+V1fEn8vx?=
 =?us-ascii?Q?b7uSl80AuSkONrIZnusy0rU/Hsixn+0DeBP5xaeyS5OncVZ6s4eZT/T7LhUM?=
 =?us-ascii?Q?P2rQb3I6JEcMwBQYqpaKK4k2OWExrkURoX8n0/RSXoEl8UVeNNG7ofDrupkq?=
 =?us-ascii?Q?lpQBx1K6O2yjlH2gLq3hkXc12QkdP5PDVw4YMnp1X0Vtg2iSJDckCA+zSC+m?=
 =?us-ascii?Q?4T2QQ+gHa0EydMcuBqf7JdeJFEzA7Z3IlK+1xuyAwfy1tUl3gC/nKMiTUnty?=
 =?us-ascii?Q?8VYMUvSSXhYRxlLIZKMISHamzKJS/yjymuumAs6V68G53yiFlNiAQ9WnSwrF?=
 =?us-ascii?Q?EqhtGeANH/1Z25DoZCsQciyOZPuTlw7vR+F+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?93FSXV73qXgsOJp0k+VD1HbNZyMZr5hdM3YGshtq4neX+qweOywnHZLoi2fe?=
 =?us-ascii?Q?e1Jq1+Lxv8xPmY/+PgvSZ2cBuDTzcObNtQUkUshBCieePHJqv2wLLCSax4ju?=
 =?us-ascii?Q?SXosBUJntNlB4KvR7VlDvrZxWJLwpxVHbC1J2FcpVT41cAuZI2S9qv+YpynO?=
 =?us-ascii?Q?wNVQjpILlM0DkOL5+Njom3O17OIreiBISiIQL39IZB1+mYXVJPzomqRXgY04?=
 =?us-ascii?Q?A1683yDFlEEfdEZh1McKVbKPTySVWA7A903m+M/9RaBl8kaPh76ehGkLuQ7p?=
 =?us-ascii?Q?/Hl11hh95nxiW28WNPoBGwzGJXPAunr2VD4t1A7jiuGeSLQHHhEAjTzJJRuc?=
 =?us-ascii?Q?7VGzTjW496UG0i+v4nTSeD7CJQmFkuDOsL0BBvHzyr4O+mVa4xjxDJ37crNd?=
 =?us-ascii?Q?vTIty9a+SBJp7fcoCs5AI7/Cb+T+b/vQK0687JNXTixXyszBy2r62TwdOoSi?=
 =?us-ascii?Q?pTJaSA72r3E9n8XsOQZKh6sWTnaDhBiWVaIKR/yE1Oi/iqdWTaVSMXAkh1Xm?=
 =?us-ascii?Q?O66tsARIUS868UqnES+jwWujqGyHG2iMxHiJ8UvBJ5xVagxk5sCYYQR2hU7B?=
 =?us-ascii?Q?jsF2wJAdgue6stEGhYsimGGJwWxNdW8fu6YdeeWCgSJK/CPzpxS9VFA0c/Sz?=
 =?us-ascii?Q?/rG4PlgAo8H1XULse7U7MtpsB6yC8R2FXCgSgGRGflWgr4gDh29kedrt6zBm?=
 =?us-ascii?Q?RfVdiSNmkX/ZeH7NBc6NYfhvg0tHvdX3Y5XRmLKtvKdJwSO7A7TxAYfhzgST?=
 =?us-ascii?Q?0bciTsoGL+bogoEG7dQEbS3D//pR4iswe9UOAN4q51QYqMBxL7IhT9Tk/DBI?=
 =?us-ascii?Q?DnS4QPrLmgjMP3xDBZUQ7X7pjvhpujdakHgiMkyNlY9TXQie7FQt8MYmFT5G?=
 =?us-ascii?Q?bF9XtMtKC1fUpuZlogc1FNC0ZLZiya6OZricHRtJXN68r2YqskLWzfe6iv4f?=
 =?us-ascii?Q?MaEgT/PY5v6OBD6+ONq8YsMxXNJO2xrIaBX0T26/2j0cjSHL2I45/9JcxGio?=
 =?us-ascii?Q?XETIQyNnsrC4OlJexUg5QIatj5gf/EjrrrcEVRbubVai/5qsMUE/W7/3Rl/K?=
 =?us-ascii?Q?ZoKXQg1kkoBNDulPUHKWhY8pczcAftkhlAM3CqKFb1oZYuyXfJJc83Q3Ycwa?=
 =?us-ascii?Q?csA/EgEPcwrbhpkj01XDR0fyqKIHIhRuWHMgbLx6kzk9cvMbCCigddxl/suS?=
 =?us-ascii?Q?jqxAD/PUlnhhCNEoXOsao0s55wACYqjinfNE0300PfvSLmx6r/uR9m/aD9I9?=
 =?us-ascii?Q?mTdxwarYjlDboETqmbG/+M3QCqbMayqGNompVkFNWHAA1UAkswMgxHfU1kiN?=
 =?us-ascii?Q?Qy9iajmitaAUvDsYacz83iCte5L1Yf8ZCMeVq9QoVANZUrfAGBKV7SUFvjdp?=
 =?us-ascii?Q?S17kQt3t7QZpMnkq7mLVHhL7TNvvAiq8IdwnOLWhEsYBMMBZ8rp1cL6/qR8i?=
 =?us-ascii?Q?IQaPgCIdiCD4GaUZEh7bAk4rzGZxZMr9cWS/sANHQGZtzRgJfgecvMmTtfU0?=
 =?us-ascii?Q?xirvw8CE7WeDtNOOK+8twHTQ4P3y1lKlh57pK1hSexhi94dHTepXQrECJPfx?=
 =?us-ascii?Q?o3ItMzGGwC6EppU6mdnvIItISukjuIVaeCclb6dT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15032b76-5e31-46db-48c4-08de2c0a6fc0
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 10:07:27.2981
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 05RhuIUgcW4r4hyNxTeSOUXXvCCQGwmb48Bg6WTna4zWm9V/nk0zC86H3wk1tDK7kkfpplaqMy1gXMHV33Dq0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9735
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_020733_339537_52BC8D29 
X-CRM114-Status: GOOD (  10.70  )
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

If dmaengine_prep_slave_sg() fails, no descriptor is submitted to the TX
channel and DMA is never started. Therefore, calling
dmaengine_terminate_all() for the TX DMA channel is unnecessary.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
---
 drivers/spi/spi-imx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 012f5bcbf73f..186963d3d2e0 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1468,7 +1468,6 @@ static int spi_imx_dma_submit(struct spi_imx_data *spi_imx,
 					  tx->sgl, tx->nents, DMA_MEM_TO_DEV,
 					  DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
 	if (!desc_tx) {
-		dmaengine_terminate_all(controller->dma_tx);
 		dmaengine_terminate_all(controller->dma_rx);
 		return -EINVAL;
 	}
-- 
2.34.1


