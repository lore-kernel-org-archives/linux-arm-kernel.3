Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA556CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QXdUvXSxWrs+FwX6iDSuZBIRT4MDrWOtuvhT0jlw7bw=; b=qwiPb1OMuhSnPAuscK5nrPM9uq
	jXvzkP8PMcFQwBy7EB9aZIpHMgpkzwQShgEcEL5i6ViqRefxq4ZXdyK7Ieex9EN6/9WfH2Sdrb3LB
	ghvR54mJTG/xJU/18P/XgtTiSY+mOpdIpw6fJFNq9DxLahjT0/kl1bgEA62gceRBtp8CqOxTo2VwW
	ON5O61yIQIqPT4C5xXVF7ty+rHKOFVeNKOmvCShZ6NrnslM42eJ0Uj3vg5lHqdvgrX8YgKMSM6BUu
	q8WHSFj0eRwuGHInJpCcW/WlBKsrwcxuljdmPNiJKsj6l1cMIfSM8TXiclY6B+xFojxwllTYXy7uF
	ez1zKIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0jL-0000000FfMG-0dGm;
	Thu, 06 Nov 2025 14:12:51 +0000
Received: from mail-westus3azhn15011001.outbound.protection.outlook.com ([52.102.149.1] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0jH-0000000FfLs-3172
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h5iL6FXT3S+StaV0OhNd4FIOYxHpGY7HJofpG1zXewsmmE5qniPS08TxMkTs7RqPQR902fEjfFu7MYuVLjQtKmTSRvuAe+8CIexXXaswNXm2LXLh75KidHc8bgm+hKu0FJrjHQX2x3NcB+tXwLNroqoPbzEoDfsgUe+OIbhU4nd8S3hBHbuC9ZwhF2CVEeSp1ym8KGCEULTLP2eD6exN/N9f8dVQ7vY0yqMGmTxUTNGM3uzI7AJDvpyDW7RhNNzonqGZcb7dsl4n/sJsrPXsemUzIllVIm+RLogxQkJM+nigfGiCXCwBLKwdLGpZ+iLB4E2W9tU3xK7QuIxCZsVt2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXdUvXSxWrs+FwX6iDSuZBIRT4MDrWOtuvhT0jlw7bw=;
 b=BgTbnDN0YBC8vz8s6YAmOE5pvmvEtAU0xAAwNlqOpczw5725nsFzpM2WkguXFp0DInLFOCtkhdWBVK7Sc0hPdp4s36fvGJxt0oScZvheJRT3zxAZm4t/MlZygjfwMeUSlY/Gk1dUbVG3JoggX50FGQHePaGlnmvQ/NqHPcUmCnjsyqzY5ogB/bKhJaj3R2PP7wUhlXlNzLmSlm0VU/jKMfS85WsHzD5JpwzrfuRkdyxYZYY8iI904qYmk+COPHlK7F+Hrq2UMkwPnY/TSRrIHrsCM3VA12w/VG5m/ZlAjHy2nkwc99vJ/FqOsCqouxXhq0HCBW/7Rk3DjQzwaL75+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXdUvXSxWrs+FwX6iDSuZBIRT4MDrWOtuvhT0jlw7bw=;
 b=dqBNPo6As9oLRNcHD4hSg2TqsX+KCdXBdZlx/0UUVd6iz9JjI5tdwXy23RDEmSE6aBShrz4TN3zI4mH3WKoqAFHHSwJgtsAdAhCJZlUNyCZ/1vric/Q4CNGRMOhPIjsKqLlBK5HPtp/p5S5cyACmOn4rUqAsDk+xBWz2ieeBVbU=
Received: from MN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:208:530::23)
 by SA1PR10MB5710.namprd10.prod.outlook.com (2603:10b6:806:231::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 14:12:41 +0000
Received: from BL6PEPF00022570.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::90) by MN0PR02CA0021.outlook.office365.com
 (2603:10b6:208:530::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00022570.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:12:40 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:34 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:33 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:33 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREN1335893;
	Thu, 6 Nov 2025 08:12:28 -0600
From: Swamil Jain <s-jain1@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
	<maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
	<tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, <nm@ti.com>,
	<vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <lee@kernel.org>,
	<louis.chauvet@bootlin.com>, <aradhya.bhatia@linux.dev>
CC: <devarsht@ti.com>, <praneeth@ti.com>, <h-shenoy@ti.com>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [RESEND PATCH v2 0/5] drm/tidss: Fixes data edge sampling on AM62X and AM62A
Date: Thu, 6 Nov 2025 19:42:22 +0530
Message-ID: <20251106141227.899054-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022570:EE_|SA1PR10MB5710:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6906a2-b797-4cdd-275b-08de1d3e8bdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|34020700016|36860700013|376014|7416014|1800799024|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pPJ9H9CDGylzq/SFYOsCpnBAkAktJzSOpqu8Iyw9BLEANi5fqMKAnTNeyOp+?=
 =?us-ascii?Q?Q3dkVPr4yfrxA+PSwN0rXAVQ7ehsoJhwlRhcMDd7LNnwqOXxg5vY2AX7ZYJi?=
 =?us-ascii?Q?3hmqt76V+6d4iApc7Awsds5kXPSdHIxC5I1muaOo6nzV7ubGilNbMWeEu+iW?=
 =?us-ascii?Q?irpOzHPtjiLKJDAlOEgWig74CmUauubpGqdyAszqY59BAptrXZiNx7Owr7w7?=
 =?us-ascii?Q?MmVcYSDO+BDfP1SvX0GIxsMS8FCrTBpEs473cd9qLK11vRBkc+Kf9vb3931i?=
 =?us-ascii?Q?tkTGTbTXGz9Cr6BiY5lCZNAzouwQLs0iONIsNLm/MQgjr6PdgH7lzACXak2E?=
 =?us-ascii?Q?cot/0uPJnpsjaLmIz9C5mT1sSjFQG1IO1uOKk6A9T9yDt6U+4b+tLYAehOno?=
 =?us-ascii?Q?SDqc4pWQd+THQ4fhtcYBe/HhzOuuxqkzQEDTunWHYHTKUzmWH81dYf+OaFb4?=
 =?us-ascii?Q?4zJtGlLYkq/tKBBvjYBPYl2f4ZEVnnoCuXOkRO4u4YWUo0bKUNZDEEkTcGvM?=
 =?us-ascii?Q?RheT12EaWzOjQfsdxkACdLNerqLfcptvRx6PVvXd11iCslhFPj6LP8yKxo3+?=
 =?us-ascii?Q?ui2aEvKgLfIVpuBgPBbRexzA7g/JXuEzV7WpwPg+V919GLzF1vzpYYZdITuT?=
 =?us-ascii?Q?26InOQrgfe5xUwmKuc0DR5Rvlcsp5CEAqwPhVtIsMCJm46/3OKi3vJNEei3+?=
 =?us-ascii?Q?aTKQfAE70dZA7SnjDxagd2E7ArGQWn6Kl4MkSrhrb7eU6EYn5R5dOXxo+UE4?=
 =?us-ascii?Q?BcBf/H3fdsK3yKCeNBvO4SOuem5KyKzp1gVs3DEsVKa/SCRHIkNOxzXjLtW+?=
 =?us-ascii?Q?K+vApYk6ShFrkGnQGqLSVwsIC9pCugd284zuWoMC0wCUvt6D6eMvwMzLJdoM?=
 =?us-ascii?Q?zmrc+fQo9J7hUSEZCWaSdEGff2qiVYYKYaOz5By+IvN54kkYUE9E49GhQNw3?=
 =?us-ascii?Q?5URoCUVwg03A5eRaKziTLbm4sc9xrxe2tPqs532hJjE4FDPyboDRp6u4W1Jd?=
 =?us-ascii?Q?oX8Rk2xPQSySQ9o4kNmf9EWxZWHBPtVUDZ2UhMkwLp7ZFhfIZf8hQsElCwU9?=
 =?us-ascii?Q?SQoRGxqP9Jor88mGQWLct/It9NusjSS2jlElnf6WW09g9kBAgvPPLomwrxnG?=
 =?us-ascii?Q?whWiDxzedUNSL8MvifmPdhcs2wiRIGfN3y1iMkXcJSzbF2BYY5PnfEr294sh?=
 =?us-ascii?Q?JQkecN6DgP58lw3g2RnvnU2UX0C3Ai+haDdemL0Tonydcz+vquao8KvEINcQ?=
 =?us-ascii?Q?n9YEUU2F3l0NZN6/tatyvTStGaZmLC3hWG1YM+wyWD2qE5gB1Z9oeOrogHnj?=
 =?us-ascii?Q?tIavZZiOnbaSAeMD17tD2QVbxW14T7qtnj3dEFzuksbFOUWk+vZ2syteAScr?=
 =?us-ascii?Q?csNTpNHXOeVhPxdOESPBTl5I93zNZ6OO+l/ei4W68zRcn3ukjDUlRJIQ0AFu?=
 =?us-ascii?Q?3j8bORjU9CEaKdsqasbpw2+Yk2bewB73JQZvfRM7FMB0wFg8ILrYwN+fSOvI?=
 =?us-ascii?Q?nXEgmQyEPaY1AhywkMHa+m2+Y5z6xf8ZKPqlLWGNkGzKna/eRgkLFZMLgKjs?=
 =?us-ascii?Q?tUmD6+W1AgRer+cgqQAjgKG3e855FeFB3Yj38GQI?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(376014)(7416014)(1800799024)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:12:40.3715
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6906a2-b797-4cdd-275b-08de1d3e8bdd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022570.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5710
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_061247_793003_A9DC6A70 
X-CRM114-Status: UNSURE (   9.43  )
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

Currently the driver only configure the data edge sampling partially.
AM62X, AM62A and AM62P require it to be configured in two distinct
registers: one in tidss and one in the Control MMR registers.

Introduce a new dt property to link the proper syscon node from the main 
device registers into the tidss driver.

The series targets to fix the issue for AM62X and AM62A, later will add 
the changes required for AM62P after DSS support gets upstreamed.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
---
Cc: stable@vger.kernel.org

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---

Changelog v1->v2:
- Add all devices requiring the fix in cover letter
- Update Fixes tag
- Use "Cc: stable@vger.kernel.org" properly

Link to v1:
https://lore.kernel.org/all/20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com/
---

Louis Chauvet (4):
  dt-bindings: display: ti,am65x-dss: Add clk property for data edge
    synchronization
  dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
  arm64: dts: ti: k3-am62-main: Add tidss clk-ctrl property
  drm/tidss: Fix sampling edge configuration

Swamil Jain (1):
  arm64: dts: ti: k3-am62a-main: Add tidss clk-ctrl property

 .../bindings/display/ti/ti,am65x-dss.yaml          |  6 ++++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  |  3 ++-
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  6 ++++++
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |  7 +++++++
 drivers/gpu/drm/tidss/tidss_dispc.c                | 14 ++++++++++++++
 5 files changed, 35 insertions(+), 1 deletion(-)


