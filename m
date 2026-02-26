Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B691AFC5922
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPYHo42I5Cx+p4zZTdV6vBQIrF4fRMIhvjoaSAoU9oI=; b=AwDSFnmDVvoena+G+1LqJ+vv+A
	SJk7fR7ckyeoCxjCHTEc86hy5k5LmDn7raWGg0ehCQL1YacvPTmxYWfM/wiWvP2mOumVzdIspETPd
	OgU9hL0GBBFbZGKXGstyeRRHSlYLMJyVe9NJXWFOx5qVgPOb0Jvfjs27zlrPVYQrOQcG3KbsNxAGZ
	rOUtpcU+aN+lVtVt1jDBpu5MhzcebZUEe0pv5E+SzfBTEeOvd3v7SZ2otasRSvtEL1LaqKAbjumlv
	9CVTNqx8VFkkpfPgFWGHN3BKo+LHeRew4sZDPG6DKm9BfUvloltib+XvVsCsCtR/0Ca45AUwE8mfb
	h5FHX6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYfK-00000005vWX-2qMm;
	Thu, 26 Feb 2026 10:32:18 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYfH-00000005vU0-1t5Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:32:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xghBo0y2EfMCszG++c6GcXR+kEa7We9JfY64k1QbX77sBonTizGv0GgpYj+AgW/nEzGAOEcwZTsr6W02Oz7kngR6DEBlT1Br14WTCVHhbI/SlqkEFdYw73O23JbJIqOiH1gepP6uLQBu5Qn/Jt7xJIyQdJFS1iegsa60PWcBtwZRgJOp6sCGk/7m7B/lrC/6wE43XEEplKS7LcfClJWEsTqifga6WgDZCc37eN76z15JDng2+M33ZetLku1uxhi9Wcxf/P5zQtTdAnOxO5nk4mM4qMVmUeNgtYgrXxumX73oex7PDIi7Aeg/zCViZQlwsZROUNN1ry7mZDVm6CFDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nPYHo42I5Cx+p4zZTdV6vBQIrF4fRMIhvjoaSAoU9oI=;
 b=SHyrlPNqUIJed5ebuZD9WI/LZIyLJHZrirbAJD/pVlByqLtpPMQTpH6N4GhD78Hx2JbiYczY+8vR1rn85KbUsm8aJuMWquJDH+hT5pWORk9ZG1wpc2JbuQ5yBuHMDYeADmBD/tZ9/Q3KONfFUq3Z5BsUAJMvSsF54BJOIEalj5r5j4Hcl3x+jdhZdb8A9XheKBd9RqHCEG8vMAZzHBbApwQWD0y0+8szlRL7LaPbhPKccAluxJz0t9vr4I7CKxIXUo1o8B3Pf9vZQ7KT0YCVOtYsJJDVVZ5mKgIKmpDe+5XO04iQCnj3nDIgpbK08o956CBaRywN7VgaXP+QnVq9cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nPYHo42I5Cx+p4zZTdV6vBQIrF4fRMIhvjoaSAoU9oI=;
 b=m36gm73NLrdZ76qLcviZvwPMS2YDrcZHDTi7ojvHQkMAP5XoZrkEARlWcxYVthB7b7lTfZG0aGy+Gm40qVubLhNfEv0WQYhVgSTFTbVFYb/SyeYcEpm4KXjI5mjQHMEU4rnau39sl+C7JTSlMVjBvei+EqFPmZ9uzsJ+JCcjBb+mwzv/MMX9+d37Jxx8TfT+u0oB0YqSOG0QJRcRV+2nyDccWv9/B5K3Acvg0Y9ald1k5DqtDqAeebwhPmsi1uC0k23U0EnIHWdDKwX30fyGPj38p79BDRHBV2luDyKVyEbLZvDoplq3zlMM79SZibLsUExjYPwuQ1e3GzDGXnlt+Q==
Received: from AS4P250CA0029.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:5e3::19)
 by AS2PR10MB7604.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:547::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 10:32:09 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e3:cafe::e8) by AS4P250CA0029.outlook.office365.com
 (2603:10a6:20b:5e3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:32:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:32:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:34:16 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:32:08 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:25 +0100
Subject: [PATCH v6 10/12] arm: dts: stm32: enable CoreSight on the
 stm32mp157c-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-10-5d794697798d@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan
	<leo.yan@linux.dev>, =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<legoffic.clement@gmail.com>, Linus Walleij <linusw@kernel.org>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <cristian.marussi@arm.com>,
	<jens.wiklander@linaro.org>, <etienne.carriere@foss.st.com>, Sudeep Holla
	<sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|AS2PR10MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db8a769-6124-4882-2da3-08de75224bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|36860700013|82310400026|921020;
X-Microsoft-Antispam-Message-Info: xjT4bSWugsX3wYaW5Nthn/u+s5eU464oCzRb3caFulbdekmwOfKFfiEoJH1dgalCJe4LeEHlEeK7+nVqT9QC5TZZCVnHBkJs2ptLnkOvziXNuLs+x2AnE72Zk2hKw0KI6wZ8Ut2HbbqxgPkqo7iHwE50PaIGfRbEezDPAIoVFpGQdXGOfSXiN/JMK/wVq3tVMUuwxwoZxfGRaqv764arjOZ+WjDv/4ZJp78/K1wiRL8EEJ/KhCaqjpbEQz1c7eyJ+iA3sIWMX7oGiI9DPn5pLtuQ+R+ByAR7anVkzbQduTikEL6QU8OEVRP79notSxVNUVEPS4RB0UzNynvnxtkzUPE+SKjBtzvChCz7NzQSZLQ1HYKOWwvVij92NP2ZWhH+Tioqa0S+YePU2YpfS31qo3zdASmK7ulV5i+iKpG7xOIZNThWUZRCrCdQRVNwFiigcJD3y4VeGug++I6EMPF05RctKnRERkgWuRF8X2g+ldDq9G+Flm89DDK21HEKbN6I0e1QFA1s9x4L4Xm379b9fcROIZm2dkHCIXiwT8H7IJkItj7xjbS+eIPriMWdSqN36iV3wuuWgINWS8IUaSDWugOyf3dJc9BOWuAAHX9HAkwdIseT5T+5KldYl4XSBzP40fBR3u9d79biJdTjU1/BGWXGyoH0INmtz8S+yPDZux3hFarLMzJe24ORnVUx/Ol7UnfurAeT9zVvv8OLsdkHjRFV4M8GQBNWIMKDjKeUsI9v+I0hvkSSW0kx1Ok/M6AJQMSy9nHRDONOMHW1/N5n0eDka0eOGKBbBEGkivqzbAem1txUIBbcYauI3yox4I4poPdQcxn1892Zba1Yp4B9qeM7zTFQDnMHPmgMQsN/acY=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(36860700013)(82310400026)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: snpP/VnsMQQIsAAno3AHkprcBCxAYV06OEZdiDUbrjXP62Z7oY+j16osw2dfNsGpbMPSYEL4bPAQzVW5NQ0tuI0IIBHWg+FxHFHdJsSY+vbAjaPKpBpmRKQn/+BRlYPM7rxJUIH1oWvEUhKPf+BUnP2UGsyhMFe8CZKPMLtoRN+66g34zou2ivsdU9X8CF0++P38DSwqzkXjoL6D2tMSfu//4zD88fiowptn3ec29hE+pezmW5ff3f7kM5sk2Jn98+b7kMD82KnTyRw4W+r/opWuaLRBZ7p9lsjrYwPhvOnMRVM/9bqku9oofxexUvKq36Uf+nCdfSMXF0swP4qDPwTz+YSuH3YIXaEyftOVjeEZQjtE//ajPqOAbtkQnwySgfoJHPOXMM5CLDp8dcSLOYe0iU8SiGKR+DCcXNNyCU0ODHmz2Za8qPqp67mMjbip
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:32:09.3784
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db8a769-6124-4882-2da3-08de75224bd3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7604
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023215_493343_9C13F035 
X-CRM114-Status: UNSURE (   7.23  )
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

Enable CoreSight peripherals on the stm32mp157c-ev1 board.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index d91b4ba79527..1f277c42344e 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -81,6 +81,42 @@ &cec {
 	status = "okay";
 };
 
+&cs_cti_trace {
+	status = "okay";
+};
+
+&cs_cti_cpu0 {
+	status = "okay";
+};
+
+&cs_cti_cpu1 {
+	status = "okay";
+};
+
+&cs_etf {
+	status = "okay";
+};
+
+&cs_etm0 {
+	status = "okay";
+};
+
+&cs_etm1 {
+	status = "okay";
+};
+
+&cs_funnel {
+	status = "okay";
+};
+
+&cs_stm {
+	status = "okay";
+};
+
+&cs_tpiu {
+	status = "okay";
+};
+
 &dbg_bus {
 	status = "okay";
 };

-- 
2.43.0


