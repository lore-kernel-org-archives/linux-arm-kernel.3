Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6FACCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 01:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=; b=Y/d3udTda+0gnzm1ZqKZqMb2KH
	eFO5pPow5dGa3k+aUV31xy/or97hm/31B5jCI5uKC9bx6OLsZhcLhVp7QtyGlrwOkW7N3Oxh2+LXA
	/odXyZVeR/0YJEfXgpZCDaCoy6cDijFb3PPDHsj1ru6F/YsDvJkd9pAbJQATLYUhJqqBTkYNEorUL
	d62L81wJHPj8+8jZjzNoo7EsTgmuKcAxVLrhGMvJF3DlIdmgUsX3OP7vdjGa41RkbXnHYQPfyZ6UG
	GE5gjRImukuRz5X5rR1a/3fcJ2KiIYrHn9uyzSjJnhKRRWWRB7fdc2SrHmxZtNPWkGLj4jCW9ff5t
	uPKZnfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJiGz-0000000C6br-2VlB;
	Mon, 04 May 2026 01:39:01 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJiGu-0000000C6Y9-0GcO;
	Mon, 04 May 2026 01:38:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=czNWp6huhV4fq0VWfi7ZCmnBVyl+NYBVP66t4cPVqLURp94EjD9eJHRWU+Jrkezok+uABb5rMwNWmjnefdKwtvZEmXEhpTh8VKFFni7En/pa4fPgyiOf296Wl3lDhsOhH2ugRXV5vco/VgdAnZBAh5A73CZdWPN0URLEC46pHS26/c75gxVXHQJkqV9HgQQRZDRWr6Qa85bQM5NaeHeut4tatFPyrGCiWaKOL1ZtdpWHIEf8h6Bjsoq9efKrQ6RfegEDMqOin+1Bh5Jvehdas2tfknddQCsArn+ePUPUwFc8YDxn2uCsBux+X+owb4mID1fNhlf8CLg+aie1MbvhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=MmaLlgXhfNcur7+5LNGuyl69wF4385kCgFKscekEUsjwAzo7o4odquCOlLTfH140xiqrGfnEAK8sW12/+gfVttD61ot12jtLBXr6mBwO5XocqhH7oZVwKcqZ4QSbgh6EECryddSLOGo1LkLRFG+C4VbGVr1W1RGkKLj5hDOP2ZyqvnNd1Aa8J3yWnRhGzOzc7kEsx+wph+5fG/tzfBSQk7gntG4+eoYywkmyEiZA6b+RmzfQ7rUbI41tsgzcNH2hOQqmlRhLAG2JSm/GspX0bjO5YdURP7FOEfXMnqxejczC8gqmi88GjPPgRDY96I6Y9DmlwVzosXcN9CCmeGGJ0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=axiado.com smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=icU09Ylr2KD8jDaQLMVoxNtMKihmqYjkbmjl8x7/O0I=;
 b=MwiREO9HkGIdXzCr4aMsLL+MXy13W7fgZhyI/l+Bg094tuZadJjxM3zpY8xZY3Fyk23SLw/iO6w54vaOiwK+0ddMdj6MYwhJ5eD7d6FYTTgtYbfHFd45DSD7rl1qf80Axgljt3NKlAOo9Ch/YwMBF55c2hnrjvNjSmhaUqb6iuUC8TZt5pTfnfehlEf4hidiZ0BEXOrY69ZSYMhcklFUyKnhJ7kgh4J7ZstpVjjqB/VhFn6cytHKMCcibbcEaJ+aSTd08ND8ZB9TtQPSzqIJyhE67cWUWI9ZYx3aLVu2BEeRdtodIRRB8Qa2askYVYRfQ3g9TOnsbgB9fQsSBBcDaA==
Received: from DM6PR05CA0042.namprd05.prod.outlook.com (2603:10b6:5:335::11)
 by MN6PR18MB5414.namprd18.prod.outlook.com (2603:10b6:208:46d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 01:38:47 +0000
Received: from DS2PEPF000061C2.namprd02.prod.outlook.com
 (2603:10b6:5:335:cafe::a2) by DM6PR05CA0042.outlook.office365.com
 (2603:10b6:5:335::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.13 via Frontend Transport; Mon,
 4 May 2026 01:38:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 64.62.143.114)
 smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 DS2PEPF000061C2.mail.protection.outlook.com (10.167.23.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.9
 via Frontend Transport; Mon, 4 May 2026 01:38:47 +0000
Received: from axz-uw1-build-vm02.corp.axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id C75EA4186B5A;
	Sun,  3 May 2026 18:36:50 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
Date: Mon, 04 May 2026 09:38:32 +0800
Subject: [PATCH RESEND v3 1/4] dt-bindings: phy: axiado,ax3000-emmc-phy:
 add Axiado eMMC PHY
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-1-3ab7eb45b0c5@axiado.com>
References: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
In-Reply-To: <20260504-axiado-ax3000-add-emmc-phy-driver-support-v3-0-3ab7eb45b0c5@axiado.com>
To: SriNavmani A <srinavmani@axiado.com>, 
 Prasad Bolisetty <pbolisetty@axiado.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Tzu-Hao Wei <twei@axiado.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1544; i=twei@axiado.com;
 h=from:subject:message-id; bh=dmL4+JZi1AdhbhPqTCa4lhbBe/FaZIli85fBevKnbj8=;
 b=owEB7QES/pANAwAKAXgQMF3EWvHXAcsmYgBp9/im9Wrx9UeqGCRfwftarPZD6by/Al/aA96pi
 0WJfICw5zeJAbMEAAEKAB0WIQSZyWINOowtFmDvdYF4EDBdxFrx1wUCaff4pgAKCRB4EDBdxFrx
 122IC/9kgOzz0YXHcyKfGktfavJwnP65VSxCDVcrj6bnmc1hxkW4IHdZa3E66t5QW6xvm1ZMUIt
 2/hsKL4gn5q0ZWgoNMHrx8l52ChUjXXStkYdi8LJzJdKA34h2GyjjUU/zTB/RnWG+sZhef2krz0
 27dMxh/QV5jmzYaBHh9TU/clfMwJky0v0hXNPnQP0aFidPB3clErF8GHj4XV0dK1PZRsQCN4tw9
 PjpO3RMlH4wwrulHo9ENTlzhUsTnhi4sAzNgRFxxdtdvu16BZyLiEzAs+HPKWx28IaTn2MXm/vo
 PCnHPvK8JYLwOt+dI6n/3lwfSueOSS2aebh6icxkMGBfwF5plmvIboThrwx5XSRjGqHDm4mqQ7H
 H/KGa1WoCHDLW5IiUVQ2s3OHe+egIx+01UN9n7ADK+8LK44UjRT3O3Y72qOPR+cAlwlia/p9gml
 IgbzwuHjN7feU+j+al9+N85wuupG2mUX2EX26kOtEeELdE3Bwm31yrGoLOk2rf2Y9UCmc=
X-Developer-Key: i=twei@axiado.com; a=openpgp;
 fpr=99C9620D3A8C2D1660EF75817810305DC45AF1D7
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C2:EE_|MN6PR18MB5414:EE_
X-MS-Office365-Filtering-Correlation-Id: 426a5973-cd8d-42a0-9586-08dea97de2a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700016|82310400026|34020700016|42112799006|7416014|1800799024|13003099007|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: lyruVdsb5GpMel7hkSDTVUo++cliTQn+lXhFKX/N77FI3/W2trn8zcsaDf/wNHpQksSp8lzsoeLmMMQaFrkCVhM3TI3UQvuQ+mXU1OLGQ2Fnjq9+ihTSFFno7oudiWhenQtenYA+zpeu2QRaBiBxNnYynzWkgsZX9KDuuHLE6/MAbpWJLq+29u92ubL/vJrRaEucqZCQ1h/PGeQPMCkTJfTrWq8s5gQnAmyQ6gI3OlFwvHflXGPmkMmuA/rNERM09lYYfYEDGxy0SnICOYgVF45YAuSELEPNZ+ctlMXQHKaZsMADlz/RO01qyIGfVFkFsh16RQcPYRu+Y3dywcUbvxJwkhs9gNSCh2DQ2+w0Sf6h6gsC2AttlwSNu3eJ1503kOv1DSvn9f3oBOFlbnDnY3btt15tYWcZTk2HeBeH7JgeMAy2Yfgct/yqMf4k9HFdJpnnrw+LJY/sMy3wljJpneKVMuC7tx+a/ydvyYNppVvP8Eo4KowF2Z1KAJMLUeII+/RVvrKkEMZNcaJRi9pq5n61pIu84S9sj3nqxwr4qXgcLsCbA2FVJDWOHbbYhvAYQuHfND7fKfFKns2720pZViJmnGsRbN88uQRZrEE6g8KhVwOEBviX3ZiJoXR/EahHMOE/Yjm6Re7c+H2yNp8SkFgPlrBZqGhrXIhDQBzHzF1G/DlDcjlUAES9N0rmLwca
X-Forefront-Antispam-Report: CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(34020700016)(42112799006)(7416014)(1800799024)(13003099007)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nSx+F7PDV3cddlZQvFVuHxxEZOfOWu+DLtcEOHmp8FdWyl91nW8OaThmbpoUs35lJCwCf6i48/cFJU84TWXACJ446/rmu1GigJ8sJsKzSD2Ew29YWDjOJZXxs0P00O7OjajaQRcQ8Z4BLKqpwMCRPlzmntbI4xyIMshvzkIVIy09g4FFzKhtfRyCUjO3iIlfsLOM9Bq0HPoiOSGdLlYO8dqzDQQHZ2WwXQbfNxgB6TZYTBhVebpaBiCO5jgrA0w0sSeprPk+P7rLuVN9M23bLcajAIOmAWTNeqsVlDDRAwfkUnqgDJZCw9oIyX9TO2tv4YQDvB+9QFlYYjBfJ8ucn2t5lCL3eQC8eYokjwYj1i+C1nBT+1VsJn8TgXVyh27cjw3XPfytZJesxZNF+tzDy/EMHoEHNjFtGZ7qcd5wKrcKkNJYgW/VJQ9bCz7jcvMV
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 01:38:47.0225
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 426a5973-cd8d-42a0-9586-08dea97de2a2
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR18MB5414
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_183856_109587_B05273B3 
X-CRM114-Status: GOOD (  10.26  )
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

From: SriNavmani A <srinavmani@axiado.com>

Axiado AX3000 SoC contains Arasan PHY which provides the interface to the
HS200 eMMC host controller.

Signed-off-by: SriNavmani A <srinavmani@axiado.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tzu-Hao Wei <twei@axiado.com>
---
 .../bindings/phy/axiado,ax3000-emmc-phy.yaml       | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..61700b80e93f7185e16ca9eab0922fe6bb29fe86
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/axiado,ax3000-emmc-phy.yaml
@@ -0,0 +1,37 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/axiado,ax3000-emmc-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Axiado AX3000 Arasan eMMC PHY
+
+maintainers:
+  - SriNavmani A <srinavmani@axiado.com>
+  - Tzu-Hao Wei <twei@axiado.com>
+  - Prasad Bolisetty <pbolisetty@axiado.com>
+
+properties:
+  compatible:
+    const: axiado,ax3000-emmc-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    phy@80801c00 {
+        compatible = "axiado,ax3000-emmc-phy";
+        reg = <0x80801c00 0x1000>;
+        #phy-cells = <0>;
+    };

-- 
2.34.1


