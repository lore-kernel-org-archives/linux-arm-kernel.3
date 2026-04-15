Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597E8F41986
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qrLSGcagcVwgtnPXEm8RjRDGKneiPU47M6rz9TQVWzQ=; b=EKMjfK3X3iBP4l4NRJ8QtpXPGh
	u9H7YYugUxt0+bdP92a314QzGP7r0q22mfw0y80E2Q6VUnvd2nU9AERD2dqW6F8xS4BPSA85keWmE
	xrlrj4lG19VidCVbOVY8W0CEOljxI0umek4EZYXBIUoEJlaHyULFAPpmkDkXyJDJllyND1sBDDXSS
	dPpxQ26VI0d34k5Yu/BL8hE/9MexT3ZWejpi3DF7HSb1cbrXHVJXs2+PAhOdHugrF/qB7OqMIllcP
	S97Sd1otuaGR7pmqaJvaKrgbXxVTmNXEQAqdrluoTdx5N2RC7sEGIQDoaaoMYjQRGnYMFH2P3Ti+m
	DU/guZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvU-0000000100p-1ZaR;
	Wed, 15 Apr 2026 10:56:56 +0000
Received: from mail-northcentralusazon11012052.outbound.protection.outlook.com ([40.107.200.52] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvR-00000000zzj-3nBc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=feMAWm+AbOtCpojWt2XxYcjJIXc+ZVklRkcrlEAOhP7LWTaXKNczi2h1HnKxwt34bemEgY9+6+U3olIR2NHY0/J0oNcu1CRmOS6nZEG1nS2iJ6JzVkeXiWFmPkXUX/2cXOqCC0sQkq6TxVL1rtjAtwpPTAkWokuDG0ueNPf3wQuh/QCupDeYDcFr6MSwCW96R9KSC6mFSoFqn3ZhgI5RVWF6KF+rF3Wac05IziyY5m4y2G/gyACphmePPI7gJ6VFoU1D3DzoiS14BrTEVuNWtsJ2STUh/Jiq1WODwoGv8Jw5pnXW9RSZHeLnGQjRqd3YMMbEaLbJni8BvhVGjFHouA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrLSGcagcVwgtnPXEm8RjRDGKneiPU47M6rz9TQVWzQ=;
 b=tdb5ubXmVQJRR+eWtRZRnY+nuW3WOumF+ecG6K4+O1eiUgXLNNRk7Syw85TbzVF+IRZM/zH0P7SjuJaJzGNPWI4ywyBG6+keZUWsjIsvNDAQxuXNsAp/UyaKgD9pi/fFzWfjI11YUOTipyLw5Es9rZl8Fw/S6hmt4BKiKCPZHZUyI5h8WYyynjr8+0lW5X5mzbzXHJONwKznYNeg1L/A57Pc1cf3O5sXGG2bZdqZT3tayFmmvuXyIlkt3MlECpfoq8d6l7QHbKh8qfpN8Jq0NjZZiRnRkODsUmGEPaO2zWLOtb5DXm7D7QwzVVfppaNfPmZkkZxlS1/B/EgsZNaDBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrLSGcagcVwgtnPXEm8RjRDGKneiPU47M6rz9TQVWzQ=;
 b=02tvjP5yEk/GCVxQjjgGUnmfzLn+HcH0acCtKmfB5Bn5MhrQPAEff3gXzn8n9lz0kzBIbeGO1of4pzxv15pxT34LHgtVzNjVi0Qq498s+wkNIWbQ4H7MwiDKgepWjp4dhhZBdBcYteA++Du9l1G0oIafEy76WCxe1KqO1J8tObo=
Received: from BL0PR02CA0119.namprd02.prod.outlook.com (2603:10b6:208:35::24)
 by DS7PR12MB5960.namprd12.prod.outlook.com (2603:10b6:8:7f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Wed, 15 Apr
 2026 10:56:46 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:208:35:cafe::1c) by BL0PR02CA0119.outlook.office365.com
 (2603:10b6:208:35::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49 via Frontend Transport; Wed,
 15 Apr 2026 10:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:46 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:45 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 03:56:45 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:41 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
Date: Wed, 15 Apr 2026 16:26:27 +0530
Message-ID: <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DS7PR12MB5960:EE_
X-MS-Office365-Filtering-Correlation-Id: c9c596ab-2c75-4d51-d556-08de9addafe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|36860700016|82310400026|376014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: +MrHV6JdjLrCrxY/Z7Tu3nB21oCtXWAYVSxEU5nuuaemxFCeKB54uQMy4dCmEB2Q5VMWkA+VqfvCdsyfv4/QobBxhrpZktvhAHp0QDgLwU9ptDoxTl0K+4DUp0DdVavgwHdayJceZ/zVw/0Kdy3jaZHyHPM7vcBS8vlImPkHAQrDAvrB9+8zYe3DctiLhTvZmHP2DMNMnO7MP26rnamjZJRrzD1/JwojqQHpYm+iiDg0y5HneePoHjj5DTVae30U/b9Q5I9bIDhhIrgIozXVmc6kd+t0x8szeMMLKHErWMU184qe3EwZP1gNpq8Rddeq+O+3TZAFi6F/fH4h6fUUIP9IUGs8RFQ0mSovJ1WRdWnJezPH0SbXtcu7tTW6pbKtvBku/YvUbfjPrAJbM8fve6i8aB81riA/Gj+HDstbPg3sYtUUYlpnfPun65Pr04ZniUkxbEQWoSONhCOmOpqA8t0MDJAsNmh3wVXMqSN6vM2A4+N5o4YQEIChDSCOG9tqWlb4TrkCDDnknWgPdsMqV1y0rxjnFIa1REOnNgsdYaqoxHG2IRcUy7EIoJg8O9PfKkY4pd+eapYoD4eXMl5hZPt2CvzKnpkenAHouKMGjrLeUtQPSBwMLvzqru0qvRQHUsxwJJHW06i88u/PD8RoyjGVu8N9sLGl77PPeJc1zs6Yooz95wIKkZarlZ6seQiS+++WYjoVD6YCNtDUBvrzGZLg7s7GHCmI86b6gfCe59UIFIOqoaIkm7mkpPDhpMUvF1CrxIGOoOCFe4NaN/9KAA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(82310400026)(376014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: NIep/w6h4oFbDkwriCKAOm7kaTvKPuo/o44etl6AwYFCkkv/+KeVmfS/qfDo8B/MLfhbEA2GcUoXdF3gtlOA4Fn2t9ssa/H2Vm3bmlF3q7l8nS6JBYj8OduGIN8fWkV1RSs3j8X5JO2xJFPHGJarOdN21cOZxLAF5f0svV9FwOt3t+eUoV4ti4/XZVSdF4B7DB4x+E+PusXibxfz15jY7i+kTgGOlOB5dtN5jc4gPIC3WOdjUAlMPbNdYR+6K4i+M/Jlo15HY+ao326PzldiUadsZBXEuI0zuhTAjE4UhAolJfgG5rRcpT4OGI4fVu0m6EM4rpMqEi8N4M2p0apwP5fAlyZ4nmI8q/JErGJGVgPvo9m5LDixLMF3l5q8yryws2TyRmgKFspwYSNP27okPGBDX1YjGvclzEDc34wAJHNb+TuWpfwMuPZZvYPgrnW/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:46.2138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9c596ab-2c75-4d51-d556-08de9addafe3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_035653_949011_02C65856 
X-CRM114-Status: GOOD (  11.97  )
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

EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

Changes in v2:
- Add description of EIO block in the dt-bindings patch

 .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 30a7f836c341..1ca067217509 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,eio-gpio-1.0
       - xlnx,pmc-gpio-1.0
       - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
@@ -30,7 +31,7 @@ properties:
 
   gpio-line-names:
     description: strings describing the names of each gpio line
-    minItems: 58
+    minItems: 52
     maxItems: 174
 
   interrupt-controller: true
@@ -89,6 +90,17 @@ allOf:
           minItems: 116
           maxItems: 116
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - xlnx,eio-gpio-1.0
+    then:
+      properties:
+        gpio-line-names:
+          minItems: 52
+          maxItems: 52
+
 required:
   - compatible
   - reg
-- 
2.34.1


