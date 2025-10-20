Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D68CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdtxNwtnhjEWNLFTc/6MntNZ8EpjqAbD5G8CgmoBwEQ=; b=di+s7fAGMfE9TbH9Eb121Jm8Jo
	FR0JHWut0A3i8YrxAwvQvpk/1zbRctPX10kLWht3mjO6bT49Fpt8GJcOVCoc1jhmqJhq+HMYLokHK
	hINUl0Syk2+VU8TRbl7HXSizH3lVAlAL13jaHwtNAblS6gH8GnOhGwFnp1kfkynRIxZaoB9iFsnr7
	hBh8KMrSIn48W+Eerb6/ap7BF0ARkiWpLsDKHDtwi7f3Jp9C0shy9gg6sYXQkOkfgZagpv9Uplnrv
	eIIKKNF2ScpJrCsAjiHF/hP2MBSnocZqE2qv0sXxEOht2cH5RTRclTNSZW3J36eH51c+nwm5izhSz
	Wfe6b3jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApKa-0000000Dd7f-2Rja;
	Mon, 20 Oct 2025 12:49:44 +0000
Received: from mail-francesouthazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c207::3] helo=MRWPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApKV-0000000Dd1s-0XQO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:49:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrTHXT1m4B/VcgW8tBnmAbXKUMfhZipZggaMIo9IL9ED7r+0Jev/9q36HZGux6u4QMxWdJdFmjonE1fFW6bv81A6YvkHBcM/k2D+euep9BuJnrKnOYDqctPOIOJmL7HxnFUDPmPqUiOrEbMFvsA4JuYY0+dz0fmZG/TKTBeFryYIgtWd1ucre1nTHpeePhxhN3fBzlqgHK4eiyF+GAz3fBZaDP8K7t9XtlIX7i2tkdWH50pXGV+bJaKOg0EuWNXkZAzF8JMV1eegXuIuC8Xx2qzmTebohGMP9yZ9KVxE2L17ydaDY+7UJehP47sBUUa3fSWPj7EfPgGAyf5/kO0A7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdtxNwtnhjEWNLFTc/6MntNZ8EpjqAbD5G8CgmoBwEQ=;
 b=g6jf7b1MtuMqXCnEa5eTNOPe6xQpl+Ss7wdnLPL0EBjvtYy5KX46bXIYCkRJUEPuvD3eHBuucwQ6WltKt9XQTEkOAQLI0NEsYSSb1ESmvumQq0pfrBu+6SwOiuGYUYtyBKtBBDhv14WIf+J8ZjxOPQvvNqKh2c4ZONccqrqiidLJiLtGpiDSEwRAG9GFEjmuCFB+6sEbOSeAFXnYec5/oYIISIanCVoVHJLosPlHyR9rpDFTSqTzEFjYuYhu8mwbbSeJ3lZx+BTnIsbf4YemOcS+QYSjVJ+CzUT9LicgcfobJVnJK32NjqqA6lHW4uPMblHq3TPSCd2Z5a58/1jLRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=phytec.de;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=phytec.de; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XdtxNwtnhjEWNLFTc/6MntNZ8EpjqAbD5G8CgmoBwEQ=;
 b=F00GFpjgOzeSmExFf9FGAYlaOrRo5vSsc7lyEl/44/zFOHiZcxfXG315kEmWWm1TWS97v/RvSI4X/LYogWe1FzTVxICBTPs7kidt+v9dhGudihCV+6TvW8GCk1hhS9NGK+5quLhqvsh6tNpcpe9aEeO198iUoDvcCI7yczg7MROFJpe+FBN8UJrAsKxZCEgXEd32+s0cwlexNzmzODtN4PjXAoBrfw+84D6x7j4873bAKjto/RHqTXYcve35EokeFduHu0qVHSoftp0rbszrsGYyx0x4ZnqmC7hdyUaQM3W2nATnNGLgrr8WQAjPD25EA2NwEBVaJPiwg/3bUB556Q==
Received: from AM6P195CA0025.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::38)
 by VI0P195MB2875.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:2b5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.15; Mon, 20 Oct
 2025 12:49:29 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:209:81:cafe::2) by AM6P195CA0025.outlook.office365.com
 (2603:10a6:209:81::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 12:49:28 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 20 Oct 2025 12:49:29 +0000
Received: from [127.0.1.1] (172.25.39.168) by Postix.phytec.de (172.25.0.11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 20 Oct
 2025 14:49:28 +0200
From: Yannic Moog <y.moog@phytec.de>
Date: Mon, 20 Oct 2025 14:49:24 +0200
Subject: [PATCH v6 1/4] arm64: dts: im8mp-phy{board,core}: update license
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251020-imx8mp-pollux-display-overlays-v6-1-c65ceac56c53@phytec.de>
References: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
In-Reply-To: <20251020-imx8mp-pollux-display-overlays-v6-0-c65ceac56c53@phytec.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>, Teresa Remmet <t.remmet@phytec.de>, Yannic Moog
	<y.moog@phytec.de>
X-Mailer: b4 0.14.2
X-Originating-IP: [172.25.39.168]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|VI0P195MB2875:EE_
X-MS-Office365-Filtering-Correlation-Id: ee1be9da-8a66-4ccb-7808-08de0fd71bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFNtQXJ4RzUzOTlTREJYbWdxdDN5OElYOGl6enRJTFZDamw2S3NTRU5YZWNs?=
 =?utf-8?B?QlBVN09UbDBCMGJMaE82MXFqNU5zSHpOWmYxa2VtVEQ3K3NLTzN5dWR0aEs2?=
 =?utf-8?B?Zlk2VktmVUw2blNvMUFsOXBvVmVGR1JqSkYxUkZCNzBzc3RlREllUVh5a0wy?=
 =?utf-8?B?Y2VjdE01eTZmNmZxYjFzek5iVjhxckdRVHhJN2NrME9EWmVJbHlGTEZ4ZFFP?=
 =?utf-8?B?NUMxbDJGRnVaMGNZRXRibkcydnd0Tnkva0ZlaXk5S3c4Z3J6a3hONWVQVHpH?=
 =?utf-8?B?cEk1U3pPcDkya25sTG1rWHlOeWdNbjdkY2NlbkRzQXNmTElJTWpUckxLallu?=
 =?utf-8?B?WVlTa1FjemgrbTVuVFNlYWdZamN5ZVlSVmhXcFZjcTIxUjVZcTh6TXFmNjVS?=
 =?utf-8?B?U0dXTEkzWENMRDE0QWpoUVB2MjcxNkIwS0E4Y3F1cWR4SWxZeGxSaDBxeTcy?=
 =?utf-8?B?QWRPVkpiN0NFN3ovd3laeHIrWTYrK2hIaU8xR0Fnbm54K3Q2ZlNNaVM0UElq?=
 =?utf-8?B?emMrdmZ0cC80UmJSZGM0SmJxeFdPSStxeW9XMVZnQkdyZlhOU2NYUlR6Qnhj?=
 =?utf-8?B?ajAvUExyVGlVS0ZTV1RyYmxad3V5R2o4Q3hzemtndURncW1IL1MrU1htZUdL?=
 =?utf-8?B?Y1QxUDFhSFQ1Tk94MjhWSFhBSlFPQ3NGbTRjdFI4U1AwVUZQMEVrczEvbmow?=
 =?utf-8?B?aEd4cXpTSmN2SlY3cGJmc3BZd0xxc2JrMVBGbDgzS2VvdW9hbWZpZVZBZVJQ?=
 =?utf-8?B?TlllUGVTbi9ab3BWaXN5UDkvMUpSaytwVlNhcW5VdFB1NmhGNHFDbjdvd1NP?=
 =?utf-8?B?d1ByWWx4cGc0OXlRTm5DQmtPWC9LcURwRWdDZDR5LzgraGxXbVhXU3JmMGxR?=
 =?utf-8?B?RXNoaFNLRlYrR1MyV0RqRURIbHlZTm1IY3JQY3p4K3BPbWRqbDBpMUdxSmFh?=
 =?utf-8?B?V1d2ZTRIMmhycGFYQWxKTC9sRFVkTzFHSFYyRWJDcTB2bHdIL1BCdERqZDhh?=
 =?utf-8?B?dWxDUmNmNlM1QWlWUkZkVmgxV0VzY0FGZmN3endJbGFsNWNtb01ZY21SZzZk?=
 =?utf-8?B?aEdycVpMUE8rSEVqbkM2Y1lOem5tcXcrRHgxVkRzYjBUOGczRWduR253dnJ2?=
 =?utf-8?B?MDY4dXBHeFFQRHRydHBpSk41L09VNk1kRXhYUFZLNGJNNkMyeU53dUtSbHE3?=
 =?utf-8?B?Tzh5SE1TNEZSUjNQMjdFOVVyZS85SWdHbDI1UTRNa1hzM25oWE9SOGZnN0pU?=
 =?utf-8?B?ekhaSkpqUC9lbkJtRmZkTVNrdDVaaWQ2d1U2MHpqK3hBY2ttQmlVMjgzc3Vv?=
 =?utf-8?B?bzZyVkw4MkJsekkvd0wySERKSldzRTVqbGV4QlpmYy9LZzhteXdqMkJrQmhG?=
 =?utf-8?B?Qk41b0V1OVU4REhBekRVOHFFaFA1OHY0a09EZjZCcktiOEk3U0wrbk1nS3NR?=
 =?utf-8?B?L0J1ZGdpQ3hBaUtOcVB2RGhsR1h3NjZMVTllVkhDbEdPVkxBQWZlT20rcmN1?=
 =?utf-8?B?bmM4UVNLWkNoZUx4SEJFSnJrTVcwWXFYUG56R0tsb3ZDa1J5ZzNPbEtuWTRZ?=
 =?utf-8?B?TXBRUHQwMFVtYlR5MXQ0NkNxWnlCNWhVaFl1RGZKNjlDbElkMkJLaTNJRDRQ?=
 =?utf-8?B?LzdlWWdqUGd3amtBVkdZc1hXY0RjTFZRdGxhQWFsdkFaOXg1WnJrb1ByZXZH?=
 =?utf-8?B?WEduOUczazVITlpEUm01MWhwaVhGSVNjNXRqcnR5NSsvS3Fsem83dDMwMU9u?=
 =?utf-8?B?SXpQNmpPSzFBOGJEMnpIZzJ2Uyt2SktFYjJ3QkoxT1FBL0tMTTB2b3lyZ2Zx?=
 =?utf-8?B?Z1l2elN5NjJwbVZERUJMSVJIcTFIRVVWYm1CcngzcjJOTEgvcjJobHNPdzNl?=
 =?utf-8?B?UVhsM21CaVZiV2UyTnFDaGF3aU85YzZGL0I3cURPMTJWSVZ2ZUYrS1hRemo1?=
 =?utf-8?B?ck5jenBmMW1VU3NvWG80YzNibjJrWTJESkdEMjMyNHJXKy9jL05yeC9YWmlT?=
 =?utf-8?B?Y0tpMjUwZUE1QktBakxJNnZvSjUvZUt1bHgxalRDYkFlTjE5ZGRpYVBFTGRC?=
 =?utf-8?B?UnBmWk42QWh1dkhaOXpMRHlzN1FSbE95dFlMTW5ia0t2WC9NUUZ3VGVVYzk3?=
 =?utf-8?Q?Nreg=3D?=
X-Forefront-Antispam-Report: CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 12:49:29.4004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee1be9da-8a66-4ccb-7808-08de0fd71bf2
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0P195MB2875
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_054939_175671_DB99EA77 
X-CRM114-Status: UNSURE (   8.96  )
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

Change license from GPL-2.0 to GPL-2.0-or-later OR MIT.
Use syntax as defined in the SPDX standard. Also remove individual
authorship.

Acked-by: Teresa Remmet <t.remmet@phytec.de>
Signed-off-by: Yannic Moog <y.moog@phytec.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts | 3 +--
 arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi        | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
index 436152308642270c320e3ae3b21b9e46b923c043..e97d1d7c629b7fc4b52931868e35cb2d98434513 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
  * Copyright (C) 2020 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 /dts-v1/;
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
index 04f724c6ec210bc2f382e6b9e2b13fe85d3926de..88831c0fbb7be3db18910385e4e15691b1c74ef2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-som.dtsi
@@ -1,7 +1,6 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
 /*
  * Copyright (C) 2020 PHYTEC Messtechnik GmbH
- * Author: Teresa Remmet <t.remmet@phytec.de>
  */
 
 #include <dt-bindings/net/ti-dp83867.h>

-- 
2.51.0


