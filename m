Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3297ECCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=; b=BxieIAYo6uNBs7qeTqRpEJ/ftz
	TmpKb1OkyriB931m1te7LzRqeifxlVhbarbuxI83TatiJ2jRL++jsZOdGoBgtVCdZA0KYl7AV96Ud
	WgFld1NX559KoGvMiHN37C9y4VQSxu9Fd9VkHGxEn8BCJiZ1Q6E6OMSRXI9UCbI14CxO+amE+3+yP
	3QfjK/VkL7LFSKAEWQiXPTlSbRE2tVVD+7PO7cXyKD6D5n8i9yN3qfuwrW3HJnBKcRzI+4i3js8+d
	mshKl73ry9PddZrcVSZS2XBeTfVb6qHWHZ9iPcBFPmqJPMH896hiTQg3kJVIpqpcuZAFL0zaxoPcB
	imyoSClg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0jR-0000000FfNh-1y2T;
	Thu, 06 Nov 2025 14:12:58 +0000
Received: from mail-southcentralusazhn15011021.outbound.protection.outlook.com ([52.102.140.21] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0jP-0000000FfMp-0lbW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:12:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzmEmeCcrhdKehbdIKVq0lTRfmZuJEQ/iLEdjEIjIrSaTYwvWuH0Znz20DppDiy4hAfMwXrF5BV6/vAROIs+UFdaLrVY6iRnK7wl8dyUvhimY+0c81Y2Pqb6maMfsTIHIUND71W0UTpuDWEy6H70qfw1yAGbnvYu8KjRrCw08Fwx8MU4sZDuc6hB51pEz6HM+iidjpaaL9uwYXiWY441l62xrBbVum5t6473ICoengO9gSnXeAFXCZHSxSCCJDMxJr3zZTcLOPdOy8hEAcPoh8qDGePm6HgAGdY+Rmr6XLO8ouJdpnLZmoXGSvrvQKavA3+C7JJp6HhKdcx4tSWVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=ZE8tPBiaABivo0uvCUlHIkQdpIIWj1hrBTU9itnSJDeJoxQVKFcFDmb0YcUm5AvLWmnSNviPYz6DhXamCwrXtW+z+NDlrXMPkem/t9usQcMt7eO8scgOTQ2JcGymtcpQPtGEOJULoe/JSkSWd1XqcwqEgEwapyNK8hqBPSX+JQii2kV+zLC4M6SZzAYpC96pICAgmSVkXsDYjKQXe1rGY0ZJ61C4z5BaQgRDKqre9Ad1rNwCl0dj6s0k0lLebIMzv6tlkcIzLn1MkQ9pxQtAWnMKXfMtUGrav/A2JayXk91kEbhPKMxgNvKdW1/DQLfvJHIpTFfhlbxiBuVZmNCmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duJDXO+fhq+Rv21gThwiydO2ou+qKnc0zaGOo2+tdHM=;
 b=RwFILzwfSM5UmucPDYeuGpuaSgiKXEhfDUhBjLFkSdMz5Jto/gkRK/tm4esOKmNZNHbxNI0JGG0E8dQG/K7FDFLnAgiuxgEm+DNLPlMG518hv2ZO1atKmKRwUNf7qu52ZX02KQDGCU1KF3f+6Jao7JDYka33YK73Z2SFOdAe3fw=
Received: from BY3PR10CA0006.namprd10.prod.outlook.com (2603:10b6:a03:255::11)
 by BLAPR10MB4979.namprd10.prod.outlook.com (2603:10b6:208:30d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 14:12:50 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::8c) by BY3PR10CA0006.outlook.office365.com
 (2603:10b6:a03:255::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.12 via Frontend Transport; Thu,
 6 Nov 2025 14:12:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Thu, 6 Nov 2025 14:12:48 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:46 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 6 Nov
 2025 08:12:45 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 6 Nov 2025 08:12:45 -0600
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A6ECREP1335893;
	Thu, 6 Nov 2025 08:12:40 -0600
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
Subject: [RESEND PATCH v2 2/5] dt-bindings: mfd: syscon: Add ti,am625-dss-clk-ctrl
Date: Thu, 6 Nov 2025 19:42:24 +0530
Message-ID: <20251106141227.899054-3-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106141227.899054-1-s-jain1@ti.com>
References: <20251106141227.899054-1-s-jain1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|BLAPR10MB4979:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e9bb355-127e-4b1d-faee-08de1d3e9091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|34020700016|36860700013|82310400026|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vw3rw18ycASn+v94codKdA40LzaGrvshAXE+0rCwDToEKkj35hHjqsOdvEcF?=
 =?us-ascii?Q?g8yJpMNVtp+tKmqeLzPu0yQCNxUZeROf128Q4n+ce7f/6GGkjIvFrqnWnG2w?=
 =?us-ascii?Q?0iq8M382BAdFZq4kjg4zqP27ea963VIiUxcoSLN03iK/XfSUyMySMiYdZmRp?=
 =?us-ascii?Q?Jr3igkPTQEGPKZXYlmnvE/1Xs0TrCrm1yiTw7L4ZN92nzyG2SgX0SoILuEXe?=
 =?us-ascii?Q?NDj/q8k0ZC8B6bg7M4b7asOhbooT3UIHXn4Y73Q9pefAqa32BwHyLEhRin+Z?=
 =?us-ascii?Q?O3ujwUHxsiv6x4QH4jUf1iQaLazleUB9DPs/OZkp0NcdD07sJxpeBhI0HT5h?=
 =?us-ascii?Q?txZv7mgzPgc4Pd8yTR59vaf4JPFxgR90wI54jiPWM7gjQ82Gd/MJOskWq3GT?=
 =?us-ascii?Q?Ivlhcx4aIYHFMc5ueksVhxSgwFEAX1tDp9O5H8N+kurD0KfLcoEGk0iciDlw?=
 =?us-ascii?Q?kCDB3h6INYO3AD/p4AglKZAJUvwlOIWeuvCzI04h5orR83s1lCDgrvgrg4aR?=
 =?us-ascii?Q?tprRR38H/3XHe+dtqHteQOtqeq6A+cbt7F//HnG8h2DIoKVtOAAckiTUO/0Y?=
 =?us-ascii?Q?5us7tWTTETUTrjp/O9keQkSeLIBBYD4ywuVfGoua6T5P0Qty9IxFADB5+3z1?=
 =?us-ascii?Q?t9f8rpydRs32noI980J6RvZnEnq/weKm+sRldz2B3hdxdv3JWtNuGMnuIfUR?=
 =?us-ascii?Q?+BNEPS+jvXepP9ATw6GY+/3nMAsqvfsf1vDlWAI3zA6K27zWetG6sUFuJYGY?=
 =?us-ascii?Q?TkxJOcR7qPanfMy3xf0pnNG5xu2/iHI39P0ZgfTK3jdWuEqYlRO2VEsYEtVy?=
 =?us-ascii?Q?7/TEoih0JcT/wSi3/E/gik783UqBilfAzTkFdvn6AtdZAHeLnBMmCIqE4MzR?=
 =?us-ascii?Q?aQANaDV1W7/KUO4qkxEyG8JHk4L0NqnJ1Mo7nVL/5CXnihgEd1E7xqiOo/A8?=
 =?us-ascii?Q?GhfGvYpaA4kHnruhHC/JykQtLf75acK29Cllbxmeok1PRxm8vf64EVJhTKQR?=
 =?us-ascii?Q?lmhYD9dC49QI3y8AJpR53inaNo030YtHVH+5kJiAZSLpzY+54dpimG+ogpy0?=
 =?us-ascii?Q?ueFPlnOurppUiNXAdWWcms1O/1oL8dHt2IkNVgwVUJW6iJLhpgXXHaYE2ijA?=
 =?us-ascii?Q?/F3+53JsM0L94XgDP9i+gxZET5euunOknJqVPLOYue489IcS+nKYPOntTxhY?=
 =?us-ascii?Q?Lugvm64v5jrD4v7ACwuN0Q2hHdxbTbj+cIJnnQtRiq5eho0qf0drG2ZYNbc/?=
 =?us-ascii?Q?4u2JdR7LG2vVCOIFNRJ/9dW1rWrb/ggehwYm7O4/gaiTwQlMu+ap4nzRzppk?=
 =?us-ascii?Q?nO4XWRjmiL6/Uiljeifh+5gxTZ4oT5+esC516qACnLkhvsidEG+zoIyw7XXB?=
 =?us-ascii?Q?tNsaagDXhY6nEAHgSAdpnHOEg/+Ih6p7JbWMW15PzTvjjVhOJ1c0pMrhCNx+?=
 =?us-ascii?Q?FdutkUxVaHMCF3ZrVhTSkLdGsbVT9yopecwBWmkpTRpbfVeJy85jQWU3+Zvf?=
 =?us-ascii?Q?y4EHSQlUtLzHA0Jh/6a6x7En4LBx/2C+YAZBbdoy+42CiGtxux6S+DMDibra?=
 =?us-ascii?Q?Zksvexo9GDtdYAhGtdiMrZlBM5q0r/z8nNJ5In+x?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(34020700016)(36860700013)(82310400026)(921020)(12100799066);DIR:OUT;SFP:1501;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 14:12:48.2502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e9bb355-127e-4b1d-faee-08de1d3e9091
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4979
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_061255_220393_E2EA6EB0 
X-CRM114-Status: GOOD (  10.25  )
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

From: Louis Chauvet <louis.chauvet@bootlin.com>

The dt-bindings for the multi-function device (mfd) syscon need to include
ti,am625-dss-clk-ctrl. On AM62X, AM62A and AM62P devicess, the display
controller (tidss) has external registers to control certain clock
properties. These registers are located in the device configuration
registers, so they need to be declared using syscon. They will later be
used with a phandle in the tidss node.

Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")
Cc: stable@vger.kernel.org
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 657c38175fba..2dace701b9a6 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -123,6 +123,7 @@ select:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -232,6 +233,7 @@ properties:
           - ti,am62-opp-efuse-table
           - ti,am62-usb-phy-ctrl
           - ti,am625-dss-oldi-io-ctrl
+          - ti,am625-dss-clk-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
@@ -260,4 +262,3 @@ examples:
         compatible = "allwinner,sun8i-h3-system-controller", "syscon";
         reg = <0x01c00000 0x1000>;
     };
-...

