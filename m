Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A57F89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MQjSFOtTJNrYdGDQ7ird32XsXrO19nnw8Bic4tgbNUU=; b=eMXnpIyOazijLvjpT7P27moSmD
	ag/kppVtH79hoKtIfCB70+9QiUQWKpBIYDeyWd2l33KwzTRnen+WJ15PjCh8m3KNVPvqVKOR98rTf
	0bdVFRvq+co2lVkILU6SYmgY5cA0Jwcx/gAkSkYY1NOy6zSAYMs9KjJDYZgrMkS1Gw5FbKgCyAxoF
	3TPNLnzK5qU4ero7A6R3lipd12I187RIbLeCox9qyvabvFV7lwSmKqitKVNo4e2Xva/Pn8LeCcK/V
	KPTn8Ah8RfYzKDeQ/zZlsux7oQaVd07uOUe1GePoNe9ElR//WGW8buLloXwvAxRp+EtcwZn6B+Crl
	6jiR+TvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ak-00000008SRq-28Ad;
	Tue, 21 Apr 2026 10:44:30 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8ae-00000008SQL-2DKf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jY/R0CAnR0VAPFMiWwaC6MoiiJFFfA3tYtNKIlqns/8uU9aHtSjYQPZ/3MNYMXkh8xfSHqHKhKOTYFZUriCac9Vx6kyXEIPrX/tS1TMi0MxS7368w2DpwXsy29tFBai4Lry3VVta9Dxg6JfwzSILkMRBEOUgKtDzHwzSs7q8YDrvaISnaTvpPPeAKTtnOGoVjyLyyp1bZTx6GARQy7VhwyWz79MoatD58iVGz8qv1SiwXQ3O4/7qSb4cJYduo1M+qFEnOw5HpalKv5ohLUDBScvmJbtxCX//V30kBgLfDqgUHhAvFMs3fQA+TXOkXKsFb57S9x/LzpyKYjAMgoyx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQjSFOtTJNrYdGDQ7ird32XsXrO19nnw8Bic4tgbNUU=;
 b=ODMHEI7wtDkc/4jklIcQlywATWWryghng1nG/+sMn8Wz6b18MzjlMdqnOs7h4+ebUEu8S4KXfAbdVDwCKsSEQzLdAHceH+W5TFmb5sJD5WAA0e7LOPXFxG5QwHuP2fhuOxKFGb+sKwuSmaW5IeYVKBIsxNSWv5RU2sv9SU8j9VanWa79mWV42m/Yw7p3szLfsD+47tognRq0XjH5L+NDwqOTyph8LO0N3Xxivq7wwU5IAE6E2r+Ve05xMxHE225yZX7cgBzqho9+YvYiB1q75DpeRk5b4qMhqPJ4mgjbHpSTmmQwfcS9K84jRvMvxfd6xkBXDoAhW3KYkpVB4UrrUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQjSFOtTJNrYdGDQ7ird32XsXrO19nnw8Bic4tgbNUU=;
 b=QSdvTkZFqj9pYzA+uxbXlhEd2BUcRWwr1Q5lK1C8ffrkbRswJuIrad7WPfiCki5zNW46aPfBeIoyW4P2Ul6wyLYetFMHAWOdbCZP+QNTO2zN1lrVBctfqYQPxekMyj8Yffxuw12VRYZUSL8Azt/1zSCZLOTbAYfKe0RgZcsSvgE=
Received: from SJ0PR13CA0055.namprd13.prod.outlook.com (2603:10b6:a03:2c2::30)
 by IA1PR12MB8540.namprd12.prod.outlook.com (2603:10b6:208:454::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 10:44:18 +0000
Received: from CO1PEPF00012E82.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::4c) by SJ0PR13CA0055.outlook.office365.com
 (2603:10b6:a03:2c2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Tue,
 21 Apr 2026 10:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E82.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 21 Apr 2026 10:44:18 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 21 Apr
 2026 05:44:06 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 21 Apr 2026 05:44:03 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, Michal
 Simek <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>, Bartosz
 Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	<linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/3] dt-bindings: gpio: zynq: Sort compatible strings alphabetically
Date: Tue, 21 Apr 2026 16:13:56 +0530
Message-ID: <20260421104358.2496125-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
References: <20260421104358.2496125-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E82:EE_|IA1PR12MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b91f433-3f19-4219-7be6-08de9f92f0a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: fvBNT5E9Fd7GA7x7AgpGjkz+ZvxWk1RzD+In67C1tk+ZnDqtw7s0445hOiazUb/j2f6foP/QzyEW59ysTBQXZAbyNUiPDt7d2zwqs6YuvvKbAkxNBK1wflxjpF07lSIVUzyC+SvMHl01Pm/G90YJxNKEVDPhlOB33hiniMQDC9UcqqxsfcENIkyNqAF5tk+3r+/Y4nJjypmLB3rHMgqqLjsMylXBPddQjQ48lpSvCJAPVxdKWg/7OpiGM6T6QikEuIACYruOhCVQ3a8jRmRWX88DnzFN4jrEBzkzIYcMimdZtDfXM/yKafT2P4HgpC0Dzbzfg9CHSTv6Vqbeeie9+Npga4AEWmpq8/Q1DJ1lGediFBupyK7PgpIyhVJgXzKG4+aeO3sI6MaGRu6LkQeLF0L3pUjg3qAydBoEpGEQa/Zw+snHgB+UkNH+OgehoRi5C91sl1lEac7y5i4/XUAkK4kmFMFyjADHSpUHvlVBty8BVcUKtaqVA24S84BHSv+vWB8gtCoE9WF+Bc15EoFEgv+jtgj2asDRkEzl3iHxEik1VahjzSXSozLOH3E2M53YG8phkPBusufgvYr6gQ3b+oNAOMAiQcNdUKtK7IHA6WnpfozzvR4qa17d6dE3NZrzO3P25Got8r+RsaxJqTzxFi/QjPIw0Zs2GfDhnj8+lMgDKDqY6ubrd+t4m9jAVEz380Kr5vmgRKwjkljI4fV0w+1Lc5tC1g3NXhk+YrUov+x7rzwI1JXu35ThLLFTXITLraB+qpbQ9bcGymrE+K+oCQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6lcfuv6XA9JERGrnIbvRQxvHKCwHfZzxu6YwGg+6IxBnutUjklYjHAxzzvm1Em1tcjEGLBucYJUnlfd05o62TKusK8742I/5oB8nSmXZnHZqi7BmBQk9inrMe+ghX/U0O4DdZW6uGSEaGRTKEraZuzm1keu39023D4F4hbPLtKGh717ISo55U09FBHj+O4ZY5eEVjAg3nhpak56n6162Tp5Z0J5BzZy03RYWoy0h3grpdvxOs7QnV4jUJp6q7Z3gt4mS0E2FGvxekwTqgPQkX58fHEJA+RnJVYGEXZejLaRYXQPFw+USxY6gp5l7NR14W18EOIy0+9K2dfmaK2Fg88Wk7xz1BJLP5NL5Pyos1638+D6m+oWq5Y4+iI5I+ozsuZWqT6VnpJTY1a93fL+OyxEVcZuaiS4TOY9W5Lv0rjIdLnIcvReTCE19Sv3vB6Sr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 10:44:18.3713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b91f433-3f19-4219-7be6-08de9f92f0a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E82.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8540
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_034424_585409_61821AB4 
X-CRM114-Status: GOOD (  11.41  )
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

Sort the compatible string alphabetically.

Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---

(no changes since v2)

Changes in v2:
- Add new patch to sort the compatible strings alphabetically

 Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
index 5e2496379a3c..30a7f836c341 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
@@ -12,10 +12,10 @@ maintainers:
 properties:
   compatible:
     enum:
+      - xlnx,pmc-gpio-1.0
+      - xlnx,versal-gpio-1.0
       - xlnx,zynq-gpio-1.0
       - xlnx,zynqmp-gpio-1.0
-      - xlnx,versal-gpio-1.0
-      - xlnx,pmc-gpio-1.0
 
   reg:
     maxItems: 1
-- 
2.34.1


