Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85500CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6wIzk1StstHCsnsAzgLwnJ8Jo32GyZZhgfGHgPMPDo=; b=e6jvm3rC44lsk1yzDTgROrhlVg
	PYTR/VUm+YB2fP4pKNoEKFJ+fG06riQPm28fvb1F5rJI5FKwz1kcqQL23EMjIbVjJ0lQJi0dY7i77
	Weba1rOuKRpV9RAaShJm0hzipRcmvIP6sU/M4V//s4fusa7Vb7fk+NZK04v1MhA6p4Y8JJB+R0y2f
	siyhan2wa7AE9pHAqO8/gm0ojhTM/ejiTcEuWi4unPdGU0KHghiiSynFMLhHI6jFJQybg/FEYluJt
	rb9u/1CZg0fE8CjWqEq2Il61tyUxp15l0sMVxXjAgrVOdLeQpNyN1zFPSMG6GE+9kZ4unKczWsW8I
	E3VFpV9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBm-0000000FkRn-0cY9;
	Wed, 03 Jun 2026 19:23:42 +0000
Received: from mail-westus2azon11010054.outbound.protection.outlook.com ([52.101.46.54] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUrBi-0000000FkQY-3Pwe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 19:23:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bE0T8Kf6r1UPm9SHBRyuvpftbZVsQVDIDRMelkG/NpQuLFkrfEXUVublK36syagtaCACHzB65BIBc1pVd30QJeJWTcxvt/zlHXr3RdsfTZ9U7eT4E8k8qg0GSpMxmBUIEd9cgcc4AAVTdAzxeOh3ZU1p/gg8sxxH9JsgeG15sGQsLKwxMqV9GuLP+EyWZyUfIWnlhcfsLbvfjkDkC2vaOImeJjUNPpUjIlBTHyO/4BaxGqPW8aVRbGabEh+J8obFDULxWaLD5YW5wn32bHBB3woRugM3uA4k4TUGrM2k5xtTDOAvLcKfBV6jZ2CHasOCXh61wKvly9uUUlroN8a4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6wIzk1StstHCsnsAzgLwnJ8Jo32GyZZhgfGHgPMPDo=;
 b=Tya00EsrVzWvQQC9RUdqZ1lI6M49finsKDa1+c/1Bz8ilHM9sSEhBJeHoYbdSh5Ytvca16GuX3IgFxPn4HuQ3EIEPtdEeGgGkkgJSm2bjKrsoyGqtSvPVXXaXjadt7uSdOec9cvIxBMQKOLvASnucWE+kOkCfJvle+2RUD6fIPBiVp8XtF2lONcdYRKxSieJF2IRPu8B7kILvqAzfMbEM23j9e9+8yBkP1SZgUPcQw5bONoUU0DpKRzbwuA3/nlg2Phjw8fHUicopxQ1M4fJeqN5RxZ1AFJnGA/JSXeTfk/J2qJETiuIoxzy4oJj40+bOT0Tj+wwIhxkq81NyQPqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=microchip.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6wIzk1StstHCsnsAzgLwnJ8Jo32GyZZhgfGHgPMPDo=;
 b=b5j6wV2XOgTy4qGAiOzfgq/I+hY+4E0m/awWfSBGBH+Ia2DdF3+e+EoRhXP6S4oHWmw1s4nPRDR4FN3S/8O6gh59GV9BUMK39mhqq7MZBbLDZo7p8hlElYnxw98+ETYYiL3XXuX7E5TF1voCwpjxXnp6uCw5mC1X6baR6VYlqBM=
Received: from MW4PR03CA0264.namprd03.prod.outlook.com (2603:10b6:303:b4::29)
 by BL3PR10MB6018.namprd10.prod.outlook.com (2603:10b6:208:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 19:23:34 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::a6) by MW4PR03CA0264.outlook.office365.com
 (2603:10b6:303:b4::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Wed, 3
 Jun 2026 19:23:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Wed, 3 Jun 2026 19:23:31 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 3 Jun
 2026 14:23:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 3 Jun 2026 14:23:05 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 653JN5Mq2372249;
	Wed, 3 Jun 2026 14:23:05 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Andrew Davis <afd@ti.com>, Bryan Brattlof
	<bb@ti.com>, Jason Kridner <jkridner@gmail.com>, Robert Nelson
	<robertcnelson@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 1/3] dt-bindings: arm: ti: Add am62l3-beaglebadge
Date: Wed, 3 Jun 2026 14:23:03 -0500
Message-ID: <20260603192305.1347908-2-jm@ti.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603192305.1347908-1-jm@ti.com>
References: <20260603192305.1347908-1-jm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|BL3PR10MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fc0b10-74c8-406b-cb65-08dec1a59923
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +fBhuX2mJob/fNSUfmhcV9+qNIhESh+TmMt6bqc5hFTs55kAOx9+z02TlI7XoqXk11Me0cktn0xPxhvsuufhSfgD9ScW2/oGzZ38+L36aQoXwogzvKHIuNyzYCcUtqTk2s5gC52pyzETY3ElcqDx0lNL5hoS6EE+pFSLN3efkTGdvRCVskhzrrVnJYzUz70H6UZk+0KrOsNSS3NPZE6dVxuSy5kVcJT63Yi6B6WM3DjHghUMHCVdFAFl3W2QJe61VK+Er+iF4BsYSaRDEt1IVaSU27U2BlnSsqdjCAbzbTICc/Sl1Vdx26hsI3bZHhZ0sKy3xLWIHisWohMNxoxsZMa9VxnXkTu+pDgIrKP90ArWwgcYkN2M/ndoc4SSPKaoSEjp/Mh8ZmDc7pXLyc+bDpu773bm41MmY4X0yzfZ1JHRzfv1OB7ZIKSfj+AHcmkVEYgOzhAgZi1wD/6x/CFQk1HCOxSH4+A9JrfWn/0yC5n5QgeyQ3D/sS18JTUGG/7HCX+9Qldvsj2QZdRS8IUxHYxjf9tJW34FT47z4qB0elGWWxFy420XDOAdws3Vh5ENmczdHIVOlr876e0gP/mQIwDf3EY03nD9v2iClAv2JqnWjX6r5MKOQWn6wQ6LbpOCMwMhFTLzeZuRrsJFEvpaciCkiSrAV7Qx+GyFApFEdM4895Cz9/FHVPFhbnGMunLorRvY6xNde0OGsEutpVz2bwR1QdsJAG+6+geL7Ykphy0=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tqm+hpvi7AjbigauW4iFryuOPIQRMaIYyVq7iiEttmW0YB8SolRrw7yJhtvtwV8eEwraR4PUjzhxksAmOYSQKrX6+WL9nPLj3zKj1hRQ5tTwfGyXVBiI1PrJiqQEV8B888WjAw9wQ0uLBLxINxC2LPXLPpfmPM7nWOchoTf/9KKwY9bbbMdr4a6S1LBRpJfzsCdvUGcLUbhi6/Ql+mhaOWKfIvdYTgv3+lYX24qxvzD+UKF+PGYmrz0CfHjjGGB3pSmT5aWd1ZxVtZLORC4TM5ismpHrdj854qbldZgFqy+QsXjTsftk1mrW0JHL0K3/ckbwnjBsWOMJkHMqneZVE5NTX2uZVcoCColX0RbyLM4/SuApvkCHRQzMwoew1oW9QhMEhG1q+2X1LopWSzNgfakFU4nXYbPe9F2lvnyLeS3wx9KFHYW+GInZbwXSAcAT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 19:23:31.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fc0b10-74c8-406b-cb65-08dec1a59923
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_122338_861178_83D04452 
X-CRM114-Status: UNSURE (   8.26  )
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

This board is based on ti,am62l3.

https://www.beagleboard.org/boards/beaglebadge

Signed-off-by: Judith Mendez <jm@ti.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes since v5:
- No change
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 2a6a9441c23de..d9cd3fb712fdd 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -40,6 +40,7 @@ properties:
       - description: K3 AM62L3 SoC and Boards
         items:
           - enum:
+              - beagle,am62l3-beaglebadge
               - ti,am62l3-evm
           - const: ti,am62l3
 
-- 
2.54.0


