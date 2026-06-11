Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 442D6CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6dqEHlphPiaQwMTpf9caERxy+1f8O+MoqKEeqQkjb34=; b=ISm1E3ltMJsJI2
	x5yA18QsFf6NhB5xBRZenLBuUfxoVTS4WOjSthL9uDU/2TnW3Yr5iqVPwzz/NgHrhWirOas5YG9Hp
	0ScHqNoMA9saLqLMPgsEb3/LYcdxnyTq4Fd8T0mOym4W+C/pawMRLziFctw4sr3lcogPsdswBoUIr
	ARMszFFez1IBlQKwdejTAveLK1UZH2axKSBU+hrSUNXbtDzaqFFhkrO0T7oMia39M1Ubxv+YNZLAZ
	+X96c8mV9yTETIZVRDA6ntysgQpdOqplB7BdajXk9vGvWPKjudU15xeuY6xmInfRfBwQTjoVCsxTc
	MjX2Eb0NkaMfn9E3+cHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbF7-000000094Kv-2PCx;
	Thu, 11 Jun 2026 08:58:29 +0000
Received: from mail-northeuropeazon11011023.outbound.protection.outlook.com ([52.101.65.23] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXbF4-000000094JH-1shi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:58:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFIxQ5Ga1Ix6Lx2YM9ucHlG8EzGd9Q/DQ2ERBlPXqZI+wtC7bX23QXGmYvJE/VYCu1qK0d3v19WKM8/4Fco/pXS8bBXzfq180IdDLY5uFfVGx96kKud+bGXszRvw5y70WvZaLsz9jTITEk1W30DY7hshnAKYrhEFFgI+EofnBqLA0uj0h84406e5phvGc8Bl3pa+9TLtRSa/PtObdz05CyRkhiO3B/Ddzn6agIEBxYhXkPGWgd4dlMx7dsK7hTRaacJ8bRFWclQOXBTXuIKrFzGZrtMkLEOWtUdnVFj5MY2qwyDer30NTypjjMrwAmhGfjm7KmV3n3+eHhzwFwLXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6dqEHlphPiaQwMTpf9caERxy+1f8O+MoqKEeqQkjb34=;
 b=u7bgrRm7cVW8r08upgdveKjHb3p7qHuk0mFmeNHeeMbp6SkQN4Upr4bR/p9odX2oTuMaoVQEr7qlzta+nLlwF9IxV7IbTeqOvEhUHzClnB3dCvyorkwe6SIQQD3efWI73gFrtHCracb7YZqSC4TCgDtbEhJmVakvuCiB6tqo8iB4pzVMXH3JWcwI2VDkZS0SUS5ND3t9bNqZUt+HZr1nZHzonkOCVRqpMqIagx8Mkm/wsEUPR3iIouebDdEtqnkPhrCMii2tWPI4Lb6KDdoHAvvH3o3o/I76FObHNT28mHiikOUddH40iSD+YPp7NTj4Bp2v/GyQ1nDesUa3QFkTLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6dqEHlphPiaQwMTpf9caERxy+1f8O+MoqKEeqQkjb34=;
 b=WwFxlWsc3vRTBRnrn/SBB17LJMUJ9uUxRNDXuYUPAkfPFXZJ/FliPy3oPns7qD+n/GRXjpRBjCiC5qfloAdfdown2Qpv7PIW6+BnCq5IkDCVerqmAiI1eX72cZmN5s+8yj05bxa4heb2Cs+rkKDU+d4XZuGuKRlnYPB2JvHF+lBlpP2GQpbw3Licbv0f0L62weYENUl69vWE+HxMdzZfYp8KX+VX/M//e+/rsW7Q5ULW2/E9VzlhXACZZ3rzPUefg5G4OnHYffSJrwY85s4/4gosKHttycU9FnM/sZYk6OqcYFnteN7DAJY/p5AQHOkB4dnpD17HyapXByLRWKqoYQ==
Received: from DUZPR01CA0300.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::24) by VE1PR10MB3856.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:16d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.17; Thu, 11 Jun
 2026 08:58:19 +0000
Received: from DB1PEPF000509F2.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::2d) by DUZPR01CA0300.outlook.office365.com
 (2603:10a6:10:4b7::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:58:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509F2.mail.protection.outlook.com (10.167.242.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:58:18 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 11:02:32 +0200
Received: from localhost (10.48.87.71) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 11 Jun
 2026 10:58:17 +0200
From: Amelie Delaunay <amelie.delaunay@foss.st.com>
Subject: [PATCH 0/5] ARM/arm64: dts: st: fix node ordering in ST board
 device trees
Date: Thu, 11 Jun 2026 10:58:14 +0200
Message-ID: <20260611-node_reordering-v1-0-7e519f2cb456@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKZ4KmoC/x3MQQqAIBBA0avErBPUwqirRETmaLPRGCEC8e5Jy
 794v0BGJsywdAUYH8qUYgvVd3BeRwwoyLUGLbWRRikRk8OdMbFrMAYx2tmqQVspJw9N3Yye3v+
 4brV+emnEfWEAAAA=
X-Change-ID: 20260611-node_reordering-4b9b132b007f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Amelie Delaunay <amelie.delaunay@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.48.87.71]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F2:EE_|VE1PR10MB3856:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c7bd977-a99a-4008-0fb6-08dec79794ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8ZRnrT2eG+3UZQerEi1qu2OWviQcwNh0oU0zTPalTr13aJrLUwe8BgMFuQv47JHc6WBENKjf64qyw8C15uLVXi0EMdA6r1s7CPfo+IPNjhyPYv+BcSomb3Mw+MrEIgmu1ILwqhhjAvadIgDS7MGisTMVf2mpBokUCWo43L7TLvs/tB4lOUNUp9bu0x/xzXcTLdOl8ocPSSa25KtUoStWpM1GaV9afA0aC/RgAQ3R1Q+AAwzMrU1tZkZX1lvn3V4aeewesaw5Swn2VDcUnVOxp/Z2wsttZ7dLEXKL8ibd1i5KT79Hk6QYhFJ00do2Yv/qsDJ8HBa2tBJ5hUE06CbQfrx+RCFqLC3ONy5g80g4PRWZ858MXjvvAP2I02IZ9kxDbAN6SxmdmStc5cJdyDwjIfUrC4yBg70Ao4Ppj4HbnAv0y92spADhAbDdqOQwkVWU76kpXyq5UFqwhsbqdJliF8uNPBFgiwqKP5zqGFqgL1g7BgJbxROzSN7r4Be2Mp44/m44GnMnVdzk2m9eCNnxxdUlvkmXWNaWJ9CLFrK3nEf2Q02Zpq3QawXeKoGJu37ZDDC+T6dUWaLHAtBoZOYZLeinSxMnZEzo7Mj9Sp9rLm2ngSj7vS59Mvoq4hBkSgcjtIHlbvLQRCnforfdaDxbPk4aN044ty21VHkozybZ0FWFlD3rWNkVJbxXfocsvLNyELOebE1tuwqe3+QHRcXy51wL278i6vL8i1YkjTRFqUE=
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nqUNcAB17chJANI3cwn6dQqAygqPxJd953jtjWBrZeYQ9HDAeqfcDz6BfGlCIevR+SwLW29xP8PgAM3Vxq2BtMLAs2tdyJC8ubAQkl62y4pSPdIvhZ1C0DQnxrI8PdGavsNNbWnVpC6C7nRyT66ZMG4Pun4SdG49zNDJ9brFHKWpyAGXo3pcor3EArgjVSCLm8fhiDGrbW6xNKGyq3KWJgWljAPxX+4zbJhET3RpVudSJU8wwbzmPUd/4vL+5idmTG/yMTfJmnnd1cs324tvXXGuR8SNlERnE08hw6gPz8+ONH1x09aakynGAs2QNh7UXW6uVGGnxPnonHa3EKJPtaJ5RRXaRE2/xaIcIy/eGZ5pDmmwYpyLQ6NlvdL9VdL6ohM0mDu8jbo71FdYPuOKrEN/IWTaIMONH2RZO0ZuEEv6tWp9eD6PBtVVtBwgL4vf
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:58:18.5707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c7bd977-a99a-4008-0fb6-08dec79794ff
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509F2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3856
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_015826_914264_8D622CD3 
X-CRM114-Status: UNSURE (   6.73  )
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

In the ST board DTS files, &label entries must be ordered
alphanumerically.
Over time, several nodes ended up out of order as a side effect of
adding new features or refactoring existing ones.
This series restores the correct alphanumeric ordering across
all ST board DTS files, with no functional change.

Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
---
Amelie Delaunay (5):
      arm64: dts: st: reorder ommanager node in stm32mp257f-ev1.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp135f-dk.dts
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp15xx-dkx.dtsi
      ARM: dts: stm32: reorder cs_cti_trace node in stm32mp157c-ev1.dts
      ARM: dts: stm32: reorder mdma1 node in stm32mp15*-scmi.dts

 arch/arm/boot/dts/st/stm32mp135f-dk.dts       |  4 +-
 arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dts |  8 ++--
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts      |  6 +--
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi     |  6 +--
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts    | 56 +++++++++++++--------------
 8 files changed, 52 insertions(+), 52 deletions(-)
---
base-commit: fba4a31a7f3b6b29b01c83180f83e7ed4c398738
change-id: 20260611-node_reordering-4b9b132b007f

Best regards,
-- 
Amelie Delaunay <amelie.delaunay@foss.st.com>


