Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5F06C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 17:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ipUmui8TJzzr8XggvtlSs6nZP/vI0PIg2RgYY7dISp0=; b=t/zhYSrOmrU5gqNtHDi0qGE9fr
	Mo4Q0tLrCmM2P/UFpZ/ykgTK54eBl7CIKg7xXxygR09dvpxbV+UpZ4aN/0o0WgAtEBuHXfoos8ITv
	DIl4DrwfGheKCAhfww8vzM1FsMqrvajyAIywivgmupIGv1LqiS2QtKOZVXr7NUJjHCNHNfzDrLHhN
	wvQo1jhRvwQwOZRlUD4cex5WB4686f+L5EXs++hVChaxsZRvdHH5Y+NNhKb16GfipFwBcgRIo1MDu
	4o1pg69lnFKHSI7cQM4xVqaLtnOgH1BxvSov3c8GwebV/NEd1h54/mCsGnRBSSLhEZiZcAG5glrIH
	snrWwlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecJY-0000000HZfV-1QyT;
	Tue, 30 Jun 2026 17:32:04 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wecJO-0000000HZeH-3XD2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 17:32:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKOLwcufPiEKzCO4KuV6xKjvv1RIY2eQxJUWAyLnLSfUIJxMJkD63gDniRZzOgGZNAhWsDGly9Nm7GvOsW1LmJ7odD5Bq+zYcmGcaAY4WS0rYxKM8gYsOoCIWsiTa/x/kMDd0e+HTc7n60NuPngJbMU0MdMxFpqA0+uor2HB+8KE/kk+aAgkBRc3tMA0Mxl6AVMQ3qxBBldE7knUWh/aUdNBsfYPoCX8ZGuTjyK/vIKGKDulyAfDVcrV3NReqbCwbtyMIO+Q94fR97HANU28PyxIw3oLoAf8ijnW5GVAGFJe8wBlDBawj/bsRww1XJ9U/M+ECY15eQiqA6mUx7M7MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipUmui8TJzzr8XggvtlSs6nZP/vI0PIg2RgYY7dISp0=;
 b=eEFVghXqWGZjKg/XnrqdYEzmsGe+WwJ77YsVYoAfKf66XV/QCT4pye2IEmvlGsmSzA+Uv+cbZ7UaT4yHpoobY8sufuGQNcc445nkBiP/+uQg12kM2TiLpPseDzHOP6Lx3bwKee5UZLjvCJpFbwIgYSsfI4NFVB5XL67yxlljsNnrIKD2FVLqXsAa8udWYMVJ4lvs5x4PEO9kVkJhVAVlaUJx0oNt+Y2Fd49iCw2sa8FKcgudxUH/i1z+7waxPNsGY7EtN+nCOtMsYfVs7Am1P/j4JNz8lz2xMtFFEmgapwGIdfWbQPOj88+m4aXvWgRSq2RGuLB38beL4DxfsKZ4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=ti.com smtp.mailfrom=phytec.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=phytec.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipUmui8TJzzr8XggvtlSs6nZP/vI0PIg2RgYY7dISp0=;
 b=XWz7x2VHaRpHdSvXNEiN3bsQ18yXgeXoN/4m11KEpdXe/5baWYWwisu/+oBEiPkCodbIZouGUpNpEPNbaTR1nW5HlBFYtcswGyO9owD4GOnpm+evY5k+wHphkB99upohsXvRAedlrtqvAuY37gz+mR9krbrxA0o71p9ag6MRn/PSE+2+pTXyDwdNB3tcaLtXdM+GpfNMfJDzZTBzRzwkdBU8fANEQUG1KjoZAvkU8SEcrc2avJhRyxvZfyc7Bl6oEuTvGX/RSeYkRlnAnWSQQRS/nEEFqPM+Xb+xQgpSoSI6FpwUI9h6KcQjVBN/kYYaTa7fU/tJsv8rPvuNA8eMUQ==
Received: from AS4P189CA0056.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:659::26)
 by AS1P195MB1595.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 17:31:48 +0000
Received: from AM4PEPF00025F9B.EURPRD83.prod.outlook.com
 (2603:10a6:20b:659:cafe::73) by AS4P189CA0056.outlook.office365.com
 (2603:10a6:20b:659::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 17:31:48 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=phytec.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.com discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM4PEPF00025F9B.mail.protection.outlook.com (10.167.16.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.202.0 via Frontend Transport; Tue, 30 Jun 2026 17:31:48 +0000
Received: from phytec.com (172.25.39.17) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 30 Jun
 2026 19:31:45 +0200
From: Nathan Morrisson <nmorrisson@phytec.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <afd@ti.com>, <sashiko-reviews@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <upstream@lists.phytec.de>,
	<w.egorov@phytec.de>
Subject: [PATCH v4 1/2] dt-bindings: arm: ti: Add bindings for PHYTEC AM67x based hardware
Date: Tue, 30 Jun 2026 10:31:30 -0700
Message-ID: <20260630173131.3000303-1-nmorrisson@phytec.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.39.17]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F9B:EE_|AS1P195MB1595:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e0dbc5-6074-41aa-a68b-08ded6cd76c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|7416014|82310400026|36860700016|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: LmUcD39Mb+ZehA63vc2fVHMNcFTavVdjiLrwe+ek6CLIkkxGzl+oQGTqzYpNwrGNezL7LluHSyEeDc7dVzjybb1e4BYCXSQfMWS1KpcADgbvhTJ48HnIi7f3vDumiLPjkhp+gxMMZYwUpyem2DOX64UypqizYSNyXT0NrnhjVacF0lZiu5pA0kFOxNbPcWUqxMdGpFO4FHbQcpZTlhsXhjBNM7TKqE80ELa6i+KzkRtfyPtd4UH8crBrF1ktOkTkziIqt53eHOIf5T8GMA7ibzda1397zGQYgRTOZXkSK0OQ0MpjzmqZjJo6HIHK6GKdPl7x/TO2bNhk0/sInLuJPYthF0JbPrY6pOUibkeqxPnG0Z+wY+B1Ymva4U2CIXfsNjL8Ds18n5+WtZjHbAOvHybfxwmBYoEwO9gbZEe+BKFhrm+wwWdiGOEJng23JM3Pg6GJG/2KWaV5rww0UYAo0xBzaJHucLIPDxqL/lpZjOXtNpx9EutcSrw7RmB+qSl+MzcsYIt8llHRb1BBDQkW5eMmWSYouvG+cpF+OjgsOMJenXAJbczxLDIywp8+92qrhbVYWjzx2UYhn7EQZWc0sYeYw7n/IQEHR38N31UJYQCCMJWLwy63etRlhFuVbXKkPzxWwb/PSZBwyTeA+KDiuluMgqMbSlYUFQGtyYt4TImhs9jGaPXcQakSPXlTHTRlktJRenar4Z0nd50mcx80Pg==
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(82310400026)(36860700016)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: cbbebBilNuFSy67hMYSvKavwDQ6PeRPiUEZC0GzD8hg2L5Afj9n+ecRhZlGAdbtd7jptFe2QrQMASfnFjE/17rKc4AZLPCVQqsLP0rQ7RAtyD/6kpoxhEojixuY0lP7mlDHH9S+tDMZiK5peSIHwZYxmHwN6iEQizCcm5dS5TXUa6xI0W3NyU31Dn0R/B+llc7bAdcT03GhSvMMXsxU0Aby+WChd4kbsD+/Pb7CDrykvlFpmo7hP/RG5ssi0pLSjlAoYCNFj4BKsZSbFIORD9D1dhgexSol0ed1mdjk2crYi+1M+I5NcD0n9AylAQaMhEoXLoBhQd+vPHLoB5nVe2Y3dAjz7S2H5KbGPgz1us1NhfoVzTM40rxB0W5mX4l+Ox7O/blJxnt5hC+GpP0a+ZoPKAfVYATnBrA82ubjrsono7I2J5SBocrdPHMKdVZJD
X-OriginatorOrg: phytec.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:31:48.1946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e0dbc5-6074-41aa-a68b-08ded6cd76c3
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9B.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P195MB1595
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_103202_638122_C6DBC6EA 
X-CRM114-Status: UNSURE (   7.51  )
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

Add device tree bindings for the AM67x based phyCORE-AM67x SoM and
phyBOARD-Rigel.

Signed-off-by: Nathan Morrisson <nmorrisson@phytec.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
No changes in v4

 Documentation/devicetree/bindings/arm/ti/k3.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index 69b5441cbf1a..ae47190d1f82 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -222,6 +222,13 @@ properties:
               - ti,j722s-evm
           - const: ti,j722s
 
+      - description: K3 AM67 SoC PHYTEC phyBOARD-Rigel
+        items:
+          - enum:
+              - phytec,am6754-phyboard-rigel
+          - const: phytec,am67-phycore-som
+          - const: ti,j722s
+
       - description: K3 J742S2 SoC
         items:
           - enum:
-- 
2.43.0


