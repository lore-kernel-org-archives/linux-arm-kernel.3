Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC8EFC5922
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcmxFEFAmIFAw5UbuXrmG81Aqnt9Am9FBldjx37idqo=; b=omTdjpPH19lqHpsy1NUtzv0HYG
	7s097E5c0gkL02778FsZ9qTw/QCsraO3aHJjr0hFmIXGbqngn7QnkfUAdZnB2qzZMZGD5WtANyKDA
	hLIWRzrhFWQk2NUvdm/EGrPaoLKlfekV3CsEAOuAKKt53h9Rd0uzFfCcC1QrpsyPmoyFv32nQx66y
	ZiT5kIEAa+07ju+A9aNW1NZF2fEcTHQ4yR8in7Mw6djIX/823rLhuKL2QJMRHuYEbVGb5FhAAtVZs
	ey2f4e36JJ3Z1B3eFLonE8mJuA8bXJ5/sfDTQ6UkkzWufAYV7JCduT6zRdABo1isNXNoUT3kotPYy
	WaHUE9JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYe7-00000005ut0-1IM0;
	Thu, 26 Feb 2026 10:31:03 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYe2-00000005uqf-38CD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:31:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyfmq36lcHGHprLpu5HmdJOjGuSiR72QStsHFyv3DSYOJh5esVIU876XAkcO9Wk4FbHCh0ZM8DTEQW9kNnccmfhk/hFNqkhbYVMrdelhCkWvSwtaYv2oB9BEoANNiOp7+IrDLdWOjLiq+T+CJqYzMya4miQwL82sW6wYxgSwL27d9bRlQyChuUBqutVxWho/ObQdrnCTr3baDsqUTgQ3nrr6r7oUsN2yi6u1YRMGwRvZ/1jfUW2vJHQBxkWW8VXOWkcNY1d3M3wyaYaj1oknGWNLHk8ouETLH8OYFx2ttGmV7KkgvGSRT/6078+2QmYozvMwprIsVDYX7Z5osHsyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TcmxFEFAmIFAw5UbuXrmG81Aqnt9Am9FBldjx37idqo=;
 b=x9k2tVDC19m1+CaJwbdbetDrJ8QVIqmDGPRwx1Qyeqk1FXpRpFFE1onnP3qIWPg2nDuF0J5OaJ7mdS3Fbch0eOCpYcm80JZG4JTcIHFefoxOKS3HcCvEuhesnGwrTIBwXebEK57AnHtaf2qvL+VyBe3kbqKTtu0AI7THXz5njasYvpJeX58OO2RecPCqZlN0C/HeTYe0x9z1dZgFzREr2AjwJkLN2q5T8CRQ+EUBMHfiHUFP6X1JB/tkIAXoRircaal2QWNaeTdNofYElz9cQmGH2VGFn2BaOxFH5YjEvz+n7fMY2A/MQcH4sGVEJ2yaP91y0FQvhDwo0pKptH6+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TcmxFEFAmIFAw5UbuXrmG81Aqnt9Am9FBldjx37idqo=;
 b=k1N+7nNLGP9Aed3TBcTWb3Ce2va2u8rxoTy7c+CXWhosrfoolF7E3QD8nW7R7WYAEyCIQztNDhRVz1N3yH5G/u4ofnUULDMfecXs8OqW2/4cPNzDw17vMgo11+UVKmRUyyeh48DMJ6QJ0eNE6grEyOK+Uh5MwGgf3RBk24oj/nF7v+09/MIK/LDoXzVwI16Wzvbo6UcPzj5UtrL7cloXTaxj5O3WApRE6mT0ydBksNGUJM0nuS2mmQJXqgHtp81QNhd8+7HBVTz8Y0uuqYJY4xGdOPFe2pKVJxqN7sJSV4z1a9lEN4d4/tbdzsoWUuV1tSle7/alnDuETr5OJ9ki3w==
Received: from DU7PR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::7) by GVXPR10MB5910.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 10:30:45 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::4c) by DU7PR01CA0007.outlook.office365.com
 (2603:10a6:10:50f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.26 via Frontend Transport; Thu,
 26 Feb 2026 10:30:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 26 Feb 2026 10:30:43 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:33:01 +0100
Received: from localhost (10.48.86.212) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 26 Feb
 2026 11:30:42 +0100
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Date: Thu, 26 Feb 2026 11:30:17 +0100
Subject: [PATCH v6 02/12] dt-bindings: pinctrl: document access-controllers
 property for stm32 HDP
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260226-debug_bus-v6-2-5d794697798d@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E3:EE_|GVXPR10MB5910:EE_
X-MS-Office365-Filtering-Correlation-Id: 186bd62d-14dd-4df6-d873-08de752218cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|921020;
X-Microsoft-Antispam-Message-Info: tOUqQmLBEjRn18Ey+CDsubuHJ95AV6OSI0rloYTFPm50kkimaN3oxRPpxTGK3OhGJKtH/vT8yk4wFEauDF+RlOR8QlEfbzBhrE7Hr6B4wnpFrMx5Bqe2XNnC47u5tyeRgAHx0QQtXZ2eKTTyZns2+fBiAZdJOzq24UP77iynwxfcVmf6uIC1XNeqNvq/p6AOu66qkI8VLH9IJ40aRti3IextCnnM3nzcTBkDk205x/0/NGVTDf21xBvEsELitl/3VtT139ZL01GuYetkxNxhxBw4tDyfbPuH2ClF4X/Qx2G9gpNNybl3ryggnQU2JBgB/6VSA4uZM2+PGhkGMpfBPQXdt2keekMASkNewa3JZQU+zAE/wM1qmZ+ZVuQp2/X2ES7kkfRBZsbprFusviLpC1JcK8hrkddUeO0LInEqyni2FEjl+rMdhfjAHzGBfu0SiGE44O7+hkVeXvA0hp6yxopZ+lco21FEG5ktRDtnNp1uOn1XhttZI1nlvnaZFqY0+PqbwEtQsMR0BslBVw3EashJke8vj23LUrCnOrJ3YdoAPLJBA8jEXFzioprwsiNYgbEkybY9n1WbwW1NiNHuS5Eqx8Yy+6Ke15yUZVWk7OTOAdMmo5928fHH4OYGVL1Q825urpfKf3UoH5wZ/H9FYHa5k6YUxeMmut04KsNnKwGGKDXqKaeyjh1WMixDE8yt4ORGjjTTCnKRrAIbwlgTBfSS/U0NJ0dzqYUgDOHyllUUlkCmcq76xWao2onu57DOD+IcxvqU3ssYZuETDTKFSamQJUEYqUU4dszKNQ4cuMUCbuczYHkRbunosNAy+DYnN8IyBXZoudLQS6GkF2t7rc/elukX8Y5G8nBCSOZQqNk=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6saD+RoR3y7SO7vCjnb2baCIjMbpm4wnmp0w5D/wfes3UXgKcCgnWA+rC9Xi7mKMyXJne4DfJ1SPXMfLyxS/jEfbGjobxS3XVCdSzkKizPjyZk8uLeBfHKY3P09RgtVSCjstb+DhwGpN4eWuTvWzklfKu6quwAEg1m6803k6n6rxyGv8v/mCYQZ7KhszcHgXfX64DqNh4ZGgMqB7HkdryYdK/rkKKQMTR7KpxFo3g8P61Uw7QW7VdbpxdMHQHHQLZ1q/AnZ1+uWynTo5IfbpVMOqSran1SMTPCtDtvpWKtgHOfp6kj+8XG+s6uz0CAfmxrV0uwy8N6IPekE4tdVWdhieBRno5u2qwSrpTsGr1C+ddmA1/IcO9ZF5n2Ix1EGdjuVjPEO9L8mTNzSZW31ecex3JTomBnlcS9pF0srVXlL2qiaVW4qmv+C1cWmSaTxq
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 10:30:43.7520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 186bd62d-14dd-4df6-d873-08de752218cd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB5910
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_023058_787169_0FB3C248 
X-CRM114-Status: UNSURE (   7.56  )
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

HDP being functional depends on the debug configuration on the platform
that can be checked using the access-controllers property, document it.

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Acked-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
index 845b6b7b7552..8f8b4b68aaa3 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-hdp.yaml
@@ -27,6 +27,12 @@ properties:
   clocks:
     maxItems: 1
 
+  access-controllers:
+    minItems: 1
+    items:
+      - description: debug configuration access controller
+      - description: access controller that manages the HDP as a peripheral
+
 patternProperties:
   "^hdp[0-7]-pins$":
     type: object

-- 
2.43.0


