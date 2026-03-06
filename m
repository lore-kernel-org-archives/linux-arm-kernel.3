Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7583AF01816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7rS24h4QB918GzpxTWAa+f1Sqx202ROJHuuPNhsCtp0=; b=WKM3Vfe5ZCjuVd8MYO3shclJPl
	m546M7tdXq63RQCIr7DaKKGXXMmfWNx4L3pbd4qYMukUT4OlLVWEZc4ounOlzgJgduG9nPIODgYlJ
	VCwbtDygsiEFHO2WTR6396iQ+p1Xfm2mrSp56zoMaX9X8pDoVCVdYrx4L+jn77NXSkPe1VGwtKSyn
	3M+mrIWYjixd+B3ceyx9E6zADVSjdsWjUAitRM83LJa6CJY/hv4nhrSBKWg7ab0IGlB/dloflVjx+
	EVBVD9N900kd6VgNwsLZ6RSFW5zKY0j6Jtroj1B15b/XaY+u8wiGqP1d2zSYKgUSuHN/TerwBdFeE
	Jp+xv9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRYE-00000003M8l-0Mqr;
	Fri, 06 Mar 2026 09:32:54 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyRY8-00000003M8G-3Oiw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 09:32:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfMWM8gm1/aWs1wDTMy7Vw/RSAeNIjoBCO8K/6cWGEl79UMbfie2H1KECj3H1Yx5UuQj9taFYSrVW0rGJwzXhXj2SiRLpf75M4jPKqz/tuTCsyTIWSv47Qmcrr9qnJuyiKQlFb6U1R4PBnrMwQ4+SEUod2LPc/ImEEo7EcPZAyCeNy9bpiKjg+UEvl4VO7j2sN06kgu5HZgANVmucQ7rxxsr5ATf2F7j75WMHGMeHnWE5zeHoUG6Nf3vlq4N91TwuWEXs7FNAQ4hQmj8yQbtuyWyie4byj7+VWEwFSHdeK+UDVulX3wqy1IGJMIeyE37pfPxrD3brH9XgnoG2bfosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rS24h4QB918GzpxTWAa+f1Sqx202ROJHuuPNhsCtp0=;
 b=Gi8vw8BPlQtv4DEpQ6oG1PPyXvl4rV04VJH9syK0IANvDBdpB0znCREsGx8VaiPf6EnDl5zPB+L8mvmJy3GkzB7Efvds+lWU8Bhn39FJaMXpSY/+DbRG22iR0Y9LwBV+7pdEo6wnTERRmPJUkCqe1j1UlsK79e92uBfkmQd+j8Cygf7MfgKzEH0Ox65q2j+zTW6iY4SM9+VTPd+ZiZ7VsTY4i05KUP5QyWdj2g+3w8EzbiTJNbvYAQAPvUlPrNHeMzO9hLEgG5ZewS7B6KLQkMfnOljf0XRS2XtXbnqZrPH9DEZ9VKpPsorrIRveOA+B8VZOihPpW+obGgxaIs2EAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cadence.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2PR02CA0128.apcprd02.prod.outlook.com (2603:1096:4:188::20)
 by TYZPR06MB7120.apcprd06.prod.outlook.com (2603:1096:405:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:32:40 +0000
Received: from SG2PEPF000B66C9.apcprd03.prod.outlook.com
 (2603:1096:4:188:cafe::c8) by SG2PR02CA0128.outlook.office365.com
 (2603:1096:4:188::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.18 via Frontend Transport; Fri,
 6 Mar 2026 09:32:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66C9.mail.protection.outlook.com (10.167.240.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 6 Mar 2026 09:32:39 +0000
Received: from ZicharPC.. (unknown [172.16.64.205])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 04A7541604E0;
	Fri,  6 Mar 2026 17:32:39 +0800 (CST)
From: Zichar Zhang <zichar.zhang@cixtech.com>
To: linusw@kernel.org,
	brgl@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	peter.chen@cixtech.com,
	fugang.duan@cixtech.com,
	jank@cadence.com
Cc: cix-kernel-upstream@cixtech.com,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Zichar.Zhang" <zichar.zhang@cixtech.com>
Subject: [PATCH 1/2] dt-bindings: gpio: cdns: add clock-names property
Date: Fri,  6 Mar 2026 17:32:37 +0800
Message-Id: <20260306093238.2715269-1-zichar.zhang@cixtech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66C9:EE_|TYZPR06MB7120:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 43c93e35-f6a3-4d0f-1efb-08de7b634f7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700016;
X-Microsoft-Antispam-Message-Info: 2Uhv6sMKyeUebJ5r99QjQUXOSzkS+8PQq78fNIb9n8sMUmDiw+8Y9UbIzJYdHx2zs/1umLv2NHbJVmYK2O8hnchaOkGECDLwX8btpSBHMD2HcpwHDcfd7zex+H/8zGkCWqszpOCyMpp77P1hxIFPJiYnsju2VNF6jafz8l6kK7iUPVM/zaaZmqMDpZikC0iS9cdK4hnXm7UMyQGxFzkxPTIjsziDUxZDwssuaIYhLugvPrPEIMAwdbQ9eve9/jnf8zF7wIW9dAF0q1oW3s4jtev5NDR0xF3jT7scYx6OmIkn92WmwOoSQI+bFQCY6QXju25EZYO6IKd6gVcNaS1OJcD8PvSuDBuDYM1MIwSoKxwyD4omOcMaE8DUBvf+eNyTpQZj7vjca7FkWwClR0FGGZJY2hkl5xAoJ4lqNQ/ghaoDI3jHGHL5lslEQmBMUjZuAFUFIaWINXK8DMFP8skKEgHkj5EqsfcQik/slHG0pt0zhFXJZluBV6GgjOEzS7T0bTf18yRjzmXN06/AxWwidpsKowbcS6ppf0ULY6DrJNvvVrr3XzsA1atfx28dE8X/Dme4DG0CYMxfGN2vmV4b7722VLwMGuzW6iT3gWirz4WrVebF383XMLKzO8x4HIDf0PIBCQIlRwsOwIDho5+r9Gg6Z3VASesVSDkKC4af+ES0wGJtge5P3zRg9kH9CfjnVHMwOwOdcz45VwHnZLnQet1W5Bd1NPRM6N4GQR5S8tTty9IP5lBOW8uSGS3ZYevgMCObJuxAvjnIL4AxcVeHKQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5ZmG6w4HogLtCZ5XKLJo1cbWP4IhdHBHxVXfozLWSkxLStY7ZPzFpBQOVFmgd5UtH4i/A96Q40WYn1aisnsiDpYhFXUNKK7v7WwF5AGPjfsvVgO5A23I9x7aENVbjghNlwj3q0O1oBPSrG/Wj8ghzsbNyKTA2uaPDpBwlY4I50ORkZapWXQWICgLrCcNwin55pMZ4NAO7wRUMZlr9RDFcDhgFOPBS9PYDijKBu2dWgNNLSovIgrKHB5cwy9iUp41zRFgZBI8jgfCTD7rQQecfKO67chGTLe6kLF7LRp1K83W8alHOlxtsbq/fRCucVd4cwmC+Yig6PiV1Law4aghfahdN/qS6UBL1/U7LRajNz1U13f1k3QZUXt9mV2/K4rCD0lbwVb8igl2F4+p7TdOLQcKXwMtI7Z6F75IXsCb0BLJiyVUfNPa+Y3b3YF9aQ5/
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:32:39.6810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43c93e35-f6a3-4d0f-1efb-08de7b634f7d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66C9.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_013248_875007_5273E0B1 
X-CRM114-Status: UNSURE (   6.58  )
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

From: "Zichar.Zhang" <zichar.zhang@cixtech.com>

Add the optional 'clock-names' property to specify the name of the GPIO
controller's input clock, aligning with standard clock binding conventions.
This complements the existing 'clocks' property and ensures proper clock
handling in device tree descriptions.

Signed-off-by: Zichar Zhang <zichar.zhang@cixtech.com>
---
 Documentation/devicetree/bindings/gpio/cdns,gpio.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
index a84d60b39459..c242b31edcbf 100644
--- a/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/cdns,gpio.yaml
@@ -24,6 +24,12 @@ properties:
   clocks:
     maxItems: 1
 
+  clock-names:
+    description:
+      Optional name for the GPIO controller input clock.
+    minItems: 1
+    maxItems: 1
+
   ngpios:
     minimum: 1
     maximum: 32
-- 
2.34.1


