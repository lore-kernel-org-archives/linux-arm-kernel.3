Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2452C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 01:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTTt7IBir9zBweCwAPFzunv14n6sj9nlz4Pz7qQVOqw=; b=D88C80zLHCLAEjqKvkG+jmv9Zd
	S8SJ5M7vsJb0M4AgaH7seZay7ojHRLzEyoXloYxKMGRu4tQ1lZJeRvR1jhUj3Jlxr7sh4T2C6lBV8
	JR6epRHpnffb6qtpJyP3vOLNN+pVsKQc5f5Icj3rdF3I5R/Y3w/XGm9sAlMXjMQ9wm/kxWKLZUeWW
	nLrfc72ysxCs2Io82uPrLgQtW/H99qBAbSwIxCfXIGeIqHzda5KZPTpwyRveEA8846DVxB6EUMll/
	CXMnDEj+Rc0acSyMQVxjS0VdyfWwFi1Hr1/TelWN5h5BOudq+zU7gDOULE1oYjn93J5FaC19hWmUt
	BCgfk6Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOag-00000003o2b-2Yph;
	Wed, 23 Jul 2025 01:48:18 +0000
Received: from mail-bn8nam04on2062d.outbound.protection.outlook.com ([2a01:111:f403:2408::62d] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueOVj-00000003nb8-2KYO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 01:43:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=giY5qdrIGOF7yHDBYoqwYS6sqHDWBS8zp0Pb/sOgea7e8kbjv2pb3+AQeWYTqdccbBP9ENulTQmfigGlJAwQtE7GzQQ3hbIgQGja1HCx9VVKpjNwHnbbp9v+yqiR2itNy/NPorznqToYOCeZ/ekQIu9jdAETg4PHA5gB/rDIqzrcLoA95MySUtNRlsPhtLqCbHid/gkp+t8qw+hccWLjpqnytSwYntqbCUwbu74smImGC09L/FytJ2DDeoBZqJX++3SETMmF/cknz4DRNIeMMZR2RbJ593pQCR58DSBR71vJVn3WOhvtmBsCsGKdT427IDybP8STwnEQNNUmCE0Www==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CTTt7IBir9zBweCwAPFzunv14n6sj9nlz4Pz7qQVOqw=;
 b=x3PnsJCsdNsZ1dpkIcIkO47NwUxw64kqM8O7Fgpk4/9bUS94x/mtBI+ylBTfuBFZUJcM2wnV0k09GFLGQ56XauiYI3P/Fuej39x5NuY1UzxwvdbfP/d5rbd/DPAQ1wOAwujygDdqQ+gBNKfUA4KbVL6IHvkkIrDDnGymHVik41yCSwoJyKcikWfhuWGRZzaAirhMBa/hkV8s/x5OgYzUo7iKaXDRcYcoiEPN4CiwmNJcGp75TZj1iVY7p/QNI4oXRo6H1iFvjTqDGuTbhj0sijB9JOJ6tFIAAVRU5HypWcQcgL+JNxa348+nAjgKQcBZY9z842ADnrn/1EndytzJVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CTTt7IBir9zBweCwAPFzunv14n6sj9nlz4Pz7qQVOqw=;
 b=us34bLgPFoCRp0jLOkjV0T1/vy4acGQeax6hIEaB59ihKm57SJvYdsaNHidRNvouFvBIor4LQVvG9Lgr9MYujxdQscC5vMUazOankv1m4mD+oX4UT4M1YXpq+awO8Qv3pLGE/vXl2+CLPW3yHNRImW1r4tv24aRu6wPL9HlzuM+W6jOTANyolCWt/QjBuCPOhqTm9400F5EzoOBQdaSro64ICNt86Du/2QdAk4JB+F0lDVBTZcbUHhJo8/Wm9Q6y2/KmAd5DKL/T8kf0UmrsNfXhdA34X5qi/nQs50CWUhlKNiEqOz/N4q4N6JCci6UEWVGIj3GhOg1mib0a9cg4Cw==
Received: from CH2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:610:50::27)
 by LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Wed, 23 Jul
 2025 01:43:03 +0000
Received: from CY4PEPF0000FCC1.namprd03.prod.outlook.com
 (2603:10b6:610:50:cafe::ee) by CH2PR16CA0017.outlook.office365.com
 (2603:10b6:610:50::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Wed,
 23 Jul 2025 01:43:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC1.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 01:43:03 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 22 Jul
 2025 18:42:42 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 22 Jul
 2025 18:42:42 -0700
Received: from dondevbox.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Tue, 22 Jul 2025 18:42:41 -0700
From: Donald Shannon <donalds@nvidia.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <joel@jms.id.au>, <andrew@codeconstruct.com.au>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>, "Donald
 Shannon" <donalds@nvidia.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: aspeed: Add NVIDIA GB200-UT3.0b  board
Date: Tue, 22 Jul 2025 18:42:38 -0700
Message-ID: <20250723014239.22667-2-donalds@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250723014239.22667-1-donalds@nvidia.com>
References: <20250723014239.22667-1-donalds@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC1:EE_|LV2PR12MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: af043bba-5cd7-4290-9675-08ddc98a4379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|7416014|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uAaV1fgMH9mhZ+Y88lN8BFrtTLmK90NxOS/3qO8jnhJ1x9ZCQisNKkbNqqqF?=
 =?us-ascii?Q?6toP7D2ze/2iMvlP7rWbkhBiL2uxtOuUT8/p8ly5U7X8YrJfF+1Rg6lVNf34?=
 =?us-ascii?Q?82bSoem4Mm2EhYSSvBsiw+dl5fpBxVxTZKcb4bRxnloYjj/0ublIGF9jQDJc?=
 =?us-ascii?Q?zuquPu9L/dlM0RpBdMpgxNCMGNngzXS/fzrJ318B4CbolNXGL59qSxp7Zq9c?=
 =?us-ascii?Q?329kXGDWZzqLjorDEMLWv7u34CyzmSErHachS1Kf2hp2F7eBlvimp8iYRBHR?=
 =?us-ascii?Q?e2Ow7jU6H/y9CwP2YPrSMy0Ri+AsNCbS/LQzmeb4vz8kWNPIj5gbYAapnX58?=
 =?us-ascii?Q?HQYyQ7fDLuzwLa4dW4PCjCu+/JUrVVXeDuscKOYS1XtA9zjOQEKruZrn01W2?=
 =?us-ascii?Q?4vtEWlUFcVxY6hxIkupZW76btfc2sSaf//ztVdgfX9DOlf9nNdz3W6HDlyr6?=
 =?us-ascii?Q?luZMR1yge1CXPhy7a6owJ0l2VIHWfNnWJzzT7gjMYtmr5nKAPyDp0kqzputo?=
 =?us-ascii?Q?gXZxWXBHG8p+53Y84pdS+D73PaDndTu430xRfcr4E5+8f88HzOYzIwOf/Lqb?=
 =?us-ascii?Q?kue95IVCIBWzkU/T+HP7jXBGEVsccXAXlxjqHUSPM9EozmIVIwBfTKO4l7Lw?=
 =?us-ascii?Q?YdEW2C5HpkwJ1xWfU0h1oU/QCVZtXfSTSGmfI5qomRRoXWUw6CDNS+ZZ6xt+?=
 =?us-ascii?Q?tawh1/aJ1DWF9hKQAfMs9MHFG0nSRTIaMT9Ga5cMwPMDyRPTQPowCj9e6nIX?=
 =?us-ascii?Q?KgCqZDxkyTs4BE3KOu0+Uf8shV1DP614ISi5VV6KD7K0kdIcupG12GzMRClA?=
 =?us-ascii?Q?HrMrP9s3H2d3Y50CYjVdpFo4DdDRUK992kRTfmt1t5Kckl+6ctc9NHw2QOLJ?=
 =?us-ascii?Q?FBreg9Bx+FCKeEAlrc/68zyfXLZYvZL5xt/K/dRhcK8Z09Dl4zqsy2ra8fQD?=
 =?us-ascii?Q?1Uh7G862SLyY9pwHm8lxvEPbOCrhEccyVJdjqY6ihcuED8AwowzjcXkAmksU?=
 =?us-ascii?Q?3xiV/dXJezWghuUzdTihjPgatiq6Mtc26VD5wQ5THixz4JenkwJKuoB7Psco?=
 =?us-ascii?Q?AlGFLg4T/Mk+XSg/GLoQ9QZsitMkWPIeRU/18YtmktpRHhLaLQQo2VZW9A3l?=
 =?us-ascii?Q?PKIsd6p/WiBWQR3jEaqqtRvG5FOryHBAgcp7iUZXZvcdi/hrQ2INDszwyDuI?=
 =?us-ascii?Q?2JrMdsdxT5Yw/tqLZemoUl/g7pWBHyY0yI+Dqd7mvbEmwv2osrTCiiCMQhQH?=
 =?us-ascii?Q?B382axmZv61LuAktQArW5B4PiVjMOI6RFJv+qiwuajJEAGzpiJ1rVP+wkj0f?=
 =?us-ascii?Q?PANnl2ISIhdzKqm4lDu+BfEkKmn+DScRXJpUdqqp4Umo4951V46axoIMV25E?=
 =?us-ascii?Q?sax6m6DSEZK9Od4pNsfBGRPer9Dj2a0p2hn1menglfmQ+XghES2QfdT0cpMb?=
 =?us-ascii?Q?+R3s96pOXDoQKomHNtjxPK0I/xhUeNJGWI++WEsk8UqGltKCbKAkRLmMX3We?=
 =?us-ascii?Q?AfmCm5ujHn+1g8pWEir/m8gjiO/0KZTlaoNo?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(7416014)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 01:43:03.0093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af043bba-5cd7-4290-9675-08ddc98a4379
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_184311_595051_7E925D1C 
X-CRM114-Status: UNSURE (   8.02  )
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

This is an Aspeed AST2600 based unit testing platform for GB200.
UT3.0b is different than nvidia-gb200nvl-bmc due to networking topology
differences, additional gpio expanders, and voltage regulator gating
some devices.

Reference to Ast2600 SOC [1].
Reference to Blackwell GB200NVL Platform [2].

Link: https://www.aspeedtech.com/server_ast2600/ [1]
Link: https://nvdam.widen.net/s/wwnsxrhm2w/blackwell-datasheet-3384703 [2]
Signed-off-by: Donald Shannon <donalds@nvidia.com>
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 456dbf7b5ec8..624581db2330 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -99,6 +99,7 @@ properties:
               - inventec,starscream-bmc
               - inventec,transformer-bmc
               - jabil,rbp-bmc
+              - nvidia,gb200-ut30b
               - nvidia,gb200nvl-bmc
               - qcom,dc-scm-v1-bmc
               - quanta,s6q-bmc
-- 
2.43.0


