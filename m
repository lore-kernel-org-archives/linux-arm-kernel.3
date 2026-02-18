Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D4EE9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 08:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FdRqN9LmRWbrFSZ+SEujD3fkvb19JlYvgEjll31AiUk=; b=ngFZlbKuYOWzS2NOOmMPEnDDe5
	vL6n8wamlN95IlzMdAEM4/Kggmn7ecRsObIVwTiwZyzSBtQBKC4AhAaeDZ0MGsrcaYiXZL8gWeZJX
	XSnwYN45+t9Y6Y8S2HiCjCnl1YDYJyW43LOhS1NuAQJP/4/mLCxVcq8jDISbThyfV8J7XEs0yHA8B
	gV4KsA5jKzbhDYGEY2zwl0559X11J/Oe88ex66RTBFybhC8vIhksDLOkFsQgFVFtkQQqoA80pnlHs
	OXNOaFwXWzPugG0BgUqgXAzgk6Eaf8rI+CzEJ9JhxahMDdoUNiWx1VM91gKTsYs2TRyUC/9eoUuwn
	pvlKBBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd32-00000009Td0-0PlF;
	Wed, 18 Feb 2026 08:36:40 +0000
Received: from mail-francesouthazon11011038.outbound.protection.outlook.com ([40.107.130.38] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsd2w-00000009TZT-1UK7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 08:36:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CnJk/FqlFJ89T731YE2HmOeWRHHgkLDXNagkvPxseOrwXp+OOnDwmha91ctTcnYlSFLGuol3meqAlJCvi2+KBCLBIWggQAV7n9X6ryJWGy1e3m7kUBrKhA+57+5r7RnlYxVON8/vz33me4AVI3optZS+y3xjnOBkt6SP4D9YpAvDxRfrtOoezJZSBEVRsSIJsZsbftW580BEylLSZD0BUh3dIPP3Q+WpuyiHwAgngkMXrZ0LEYoeH8RRrOxWJY3HhXQUqI6uVOu4c62NUP1IdZaCvxAIGno2Fep3cuogH3xmv9cZW5WA4am3UTiAArFSa3CDxmC0/QqlvePVhxl+Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdRqN9LmRWbrFSZ+SEujD3fkvb19JlYvgEjll31AiUk=;
 b=jVmQ/JHoj0dqHNWZPMMxBI8dync3PFEHeC7Zh5GnsmUn8yL5+yjQoKIAH+qWKONByrpJm717ng5m4JHVUHnQ3iihcPIzQCbZwFmqy3Spc1C8lxtk1vUblYnXQ8oslyZ6rpAzpbu23/92gs84QJ3E2NQg3pQt5uww43sihuqGnEg84RYVdYUKm65jpAghYMH5JS4QjuVC3eQCN9mJFKh0jeNLwpK6OpvhRzH7ZyLtUnVCPD1iXWJZ05mViGBFXZVuNUqCIXnM74MMJb+SZPSry4SDrwdyBHzkzn8Q5JHkM3d/B+3waznnwfKJVTzzQ/27Cu5KjLoxIv80CsaWXYprzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lunn.ch smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdRqN9LmRWbrFSZ+SEujD3fkvb19JlYvgEjll31AiUk=;
 b=QlypCfowmw0IY3tw4H5pX5n0Ys7Cv6YMlulle87p0bwwoRZGTXYXt+F4eCHraF0ILiWG3lGY3VqTiXRCIGq5/8Q7+YDg5ZyWhTPfMyug6l8HWXA/jMB+r/HhSlVt6pM3UuB91/c1IYq4SfgO/FzhgYOA1anNPC+BnxsikwoHDldUC8gN8o/ZywgL7XoONsO4qJQAKdZOC1XQwcVqjREeef4OGPjDpVTPEdloxIH7VAlRbY/qxpYsP71Id57MR9zCJTOBgsICg050gI7axFJpwhLyze54AXIAJvixTPzT5x2mn4NiAEtBWs6mSwBd4z7JwdQwL+qtNs/xpbkJ0lV+KA==
Received: from AM6P194CA0066.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::43)
 by AS8PR10MB7400.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:613::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 08:36:28 +0000
Received: from AM4PEPF00025F97.EURPRD83.prod.outlook.com
 (2603:10a6:209:84:cafe::f2) by AM6P194CA0066.outlook.office365.com
 (2603:10a6:209:84::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Wed,
 18 Feb 2026 08:36:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM4PEPF00025F97.mail.protection.outlook.com (10.167.16.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Wed, 18 Feb 2026 08:36:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:38:10 +0100
Received: from localhost (10.252.6.190) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 18 Feb
 2026 09:36:24 +0100
From: Christophe Roullier <christophe.roullier@foss.st.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
	<maxime.chevallier@bootlin.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/3] net: stmmac: manage error case during stmmac_dvr_probe
Date: Wed, 18 Feb 2026 09:36:18 +0100
Message-ID: <20260218083618.67805-4-christophe.roullier@foss.st.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218083618.67805-1-christophe.roullier@foss.st.com>
References: <20260218083618.67805-1-christophe.roullier@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.252.6.190]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F97:EE_|AS8PR10MB7400:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d215441-0562-4c29-69fb-08de6ec8cdf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zv55qgp0aAegee/l9zfzVUiNyT6m+2LqTlpRauEwFhydjf2hhO9MPzNJoOsg?=
 =?us-ascii?Q?uO7MTmmNriC1cndRLGlZ76WPUnSpWBUlCjkP+QxdJfSpSwGpsVinYlYpAx13?=
 =?us-ascii?Q?A2YNllYPUEGlfbUrPQzY7cefwT4+mb40zeB4IE0jE20Dc6D2mjUfU/wwX4PV?=
 =?us-ascii?Q?6JmvJOXOV/tnG8uJ31811UGegWNbpfcnlqJq7eTzwPOkTAaTW6Hr0fJUjrca?=
 =?us-ascii?Q?UodahuW2yAM4ILuqbjBGkwDTMLnL93qRaEMh+M/xxkkwYvKhkNBB2CtbTagF?=
 =?us-ascii?Q?ZzKyyDcd1ZWXj+khP2H22Iu3eERbk7VGv6wURjff4fqjCxUki0M01a/wc9ug?=
 =?us-ascii?Q?THYlS17NFdfbaPnj1D6p7SPflm6ErDCe8wHzL9L5KO70te5crvbpR8LijurF?=
 =?us-ascii?Q?Xt+/O2Wz7GCIE1uOc6Wq3n7C+P7+wfoV4led+7GtBa+GCJdazY4MBedMNFEq?=
 =?us-ascii?Q?eQPlu4nBrVDHvFX/uD4LujB81fpNqSDdvmsF3hMMi0WlcFdxz/NGcRuF0y6i?=
 =?us-ascii?Q?xvkJ/K4vVJbNkzx2Y1yr0ojyWbJRjEgBh1LNJtIa29fWfZlAqaSlU0uTZRek?=
 =?us-ascii?Q?ioroCBA2r1AyK/W3d7BQMvKhqH7FjcMqGvcRP0TKPB7N8BaoQHF3BfKfDB8u?=
 =?us-ascii?Q?uV0rJym/rmglcIVDsAVcZ9pEjymUys39KSpAJxSeMFpLcKOwoo+tgpMzIXfE?=
 =?us-ascii?Q?skGWEdtYNVofxlshI5CvDiGpzt+nP0cEFgmrpHlERtQboROMGalL3YDeOIrM?=
 =?us-ascii?Q?WuMB8hDVlI2LxK70fX2WwpLxYHzzNonHjnU/oV8RIJqIIn5Ed/aPSqpx2Hbk?=
 =?us-ascii?Q?UiwjEJ6eX65bfC6NivHivgJjF1d8IvYmRbCvGRCYeS8hugfLQfoLfhsCjSU7?=
 =?us-ascii?Q?HLyIAPIhm9tDBWFu5dihRkUW4tTNfsdipFyrPIAnSrcz/huE86vseNBNVUc4?=
 =?us-ascii?Q?jMl58zC4l/ynnhJ+W7qhF6v30H3/P/6YfX+bS+l69ciRGs4e2EvNZC0oCkp3?=
 =?us-ascii?Q?TKjj29NZZD2Unf3/Wf12cCwJs5k8S26gZ/87KBhNJQgmbGl1UHJz91NX/ly0?=
 =?us-ascii?Q?FKjLUmcGjF9B9cc7cEBV4hx3LsXx0CLhH97saUMI1exe4AbZ4L7EGEYf0gXG?=
 =?us-ascii?Q?zd5OehanU/s2URZDa6kF2XsHcxUW/6ZD6j/HnA3Pa3V/PueRucgpwMFCEOSl?=
 =?us-ascii?Q?9+iCycmG+aCk/ixHAFqPrt+yoHG7+S2vgHYA6lJHywirx0htMD73sN3LqFex?=
 =?us-ascii?Q?ti40qSmyvunupOlphObMIA0SRGjPfMLH41FCeMwmo54UTeDy+Bajeg26e5QF?=
 =?us-ascii?Q?9pTU++H6NT0OkF5oSoKO+ezagS3PqyPYE+XHe72xLIW8jQLcpymWNDB3n0fQ?=
 =?us-ascii?Q?E39xa0gsN+3X8PNCZl+VYI7LEymklAuNGDSPlR3OYWCqyAK1MgHLfALG2r/B?=
 =?us-ascii?Q?M2W0e143dqYJvnHPx5/9Sl0htCVuEBylnFMWVU4rfmjo4ddK+tleUr3Og0Ej?=
 =?us-ascii?Q?lrcoXd8lQxjRNsb0tFj4pAWZqE95xgxpxolBIpz9uS3sPWdxqvKQRu8Z6ooY?=
 =?us-ascii?Q?Ag5cV/kV7D5SFjyrQV683dpwOvttxg68qNGV/0Xxopi7/eRDGiXKDzdjLt1H?=
 =?us-ascii?Q?l22vvN+9B7KErSV65l9VXNvSGn5DQX90P1ZEN0Sktr2gYMeBfMscQiHEy+TD?=
 =?us-ascii?Q?34aj/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U9H9cl1TDt+8s6IMisbxBDnLTtyrvNscbvUwVP39PVRe47MgpqSDrDW7P5EmOcNgl4/ttgNpw39CMyawWAFmcpzTjXA6CCGqDjkEvWZAm1R5vlWacHH2ZrQFm9iKA9LyyDj5WTou+q1Di4WM2bCs4gIiRNBh7ofjqumd72AjbGepd8DF0BV9DmWz5f5zXpoGETALwNhr3+o4tEkHTFtJHuWPVoUzqyBXmKoMfM9zAhIQXvQAaUpLOJUWwfE55e6Hykcx+sxQE1kIy3egwlOsRrYS3eHvYVoY/at0hBdoQyJViAwlL/JE3OmFx04w6X9uNOkK9zn7d18gzd6h2eqLWTBjgLNL2RVqYInWXJDEdCaUSOWfS6o7BUapj/4T/FU8P3zgk2ODbvLLgCZO/3dxOC0p2xadzZJ6mPxwhQX5sMBAs2xzWR/7QLctIbNn3buK
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 08:36:26.0402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d215441-0562-4c29-69fb-08de6ec8cdf8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F97.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7400
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_003634_404724_8BA3A34B 
X-CRM114-Status: UNSURE (   8.37  )
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

In case of error during stmmac_mdio_register, pm_runtime is not
cleaning before exit probe.

Signed-off-by: Christophe Roullier <christophe.roullier@foss.st.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3d4f0e4cb53fb..d8eff228f3971 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -7999,6 +7999,8 @@ static int __stmmac_dvr_probe(struct device *device,
 error_pcs_setup:
 	stmmac_mdio_unregister(ndev);
 error_mdio_register:
+	pm_runtime_put_sync(device);
+	pm_runtime_disable(device);
 	stmmac_napi_del(ndev);
 error_hw_init:
 	destroy_workqueue(priv->wq);
-- 
2.43.0


