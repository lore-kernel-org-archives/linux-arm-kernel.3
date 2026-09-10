Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E1AC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1F4VfStuzo/lxEbxGwaDE+InojdfG6VF7fQ5N6ZrpSg=; b=N0PkBJzvNBXVZw
	IoYVjnSX/VoWi37ejb1Gf4Hc/4ZLL6pdZfpgnyGa5x66i0sTujjR86jo/43LfZvwDEZvZjpMykiof
	Mx2DoWX1ry5vOAt6KvwKFhxs+P62u9sZMBRVUdBvZrQR4tEvjaov/aVQpga5PMnrsRBOtFLfDa3Hf
	aH4ofjjZM45yFrYqmw14fPlw4zervEEgxNN5MBOYqAsvZf6evIsuQlbZ6MihW+9jqreMnxDrRjy0T
	daWJE0V1IfmPy+mD3Gmm1eZp9VFG1kaRcKZzL5+gU85mMH4xNoRMHRRa+xABvt2xUd5GXj53nBv4J
	+Q23ZWOnOQaIEPUFkWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fVL-0000000Eakh-3hlV;
	Thu, 10 Sep 2026 14:11:57 +0000
Received: from mail-westeuropeazon11013005.outbound.protection.outlook.com ([52.101.72.5] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4fVD-0000000Eafr-0xbI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJpMASfCnSHLCnK+aMlld0zYf6iooemzrkZULm2nUpzyopkpkvK7pix1YtxmtL9Tg2zMEr9XHyPT7SN/JmnAKimQu0myoJ8Shxj0QoynklNxND6vykQZW7DizJwFSLNTcX/J60CBKSr9sJ6KTmt+8q7MlTGK60ntptwUDkzFEgimSDkn7zyYYiW+RyglLi2a6xxPbR9+K0I4/zmxpPL+YzFp1z5UwWJ5qYyvrRFSLCSku8ijIbNdfjnc9i3fCg8W8GYMe62IKuGq1ghvmTmXWxheRfxJRfZ68Mn236p6Zeihl/gBEXJAZTDdhWaXNxjd499DgHqGHxBaKJ4PG+wUKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1F4VfStuzo/lxEbxGwaDE+InojdfG6VF7fQ5N6ZrpSg=;
 b=UcCxlA93Yg9wqdBhobtBtAnTkqVbBdboNAHZsYda6JsG1+wJ97qDXYZeN6hyWM2ek0ijyIOvA3zOOGCue4+szI9OmxbXYDl0/ftAHlYUVORRaacfoKyL6HJcfe/l2C76oYuNNP0tCpenksmYZab4IOhR+6oHqrr4de4ejK55ngcC8KOUwiXTZOdE5b5FiIM6j5vV4vUSJ5tNX/UXUBV3DAPX8E0ZPT8sESpMZDoJrkSTe9YKUFQ+C7/lGQC/ONsOH+E1bof250NKJMP1W5Ah2PUQs9lVjcccFcH6QLgdkh0oCj/bcvnnN07pKTW+fMr2YFPXEwBe42CIEAbpMnf8hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F4VfStuzo/lxEbxGwaDE+InojdfG6VF7fQ5N6ZrpSg=;
 b=cULaa+bVINVPFEQgycgtuSpZeuqMo0QIdgO1fbjUjoWZgHxS91VsEHOu8dRkou0LSOo9f9xPgVXVNLgf9hy07LqvOujZZjF3ek2tsTV0EgZc00AeEPhHIxNeApX13en2HMklFy1m061DWdVqSlgNhDPNmPMCkFGYbon+/k7acdpVouOnqkbAfxYHzpw3XvPV0EGPeZYTu4+8/dPdsjDCcqUR5FWb0s+VqD7vsj7MCxgQDqy2UK1Q4wjV+EQJ6QZra6sCQC/1mGYPim3A6yawMCrdwLZoy8ZRppSkWiAXbjjTotonK/jxG7ImAj5iH/yxtLNzC+QTS6AdlR9Qh+Gzqw==
Received: from DB9PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:10:1da::18)
 by DB9PR10MB7196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:451::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 14:11:36 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::6b) by DB9PR05CA0013.outlook.office365.com
 (2603:10a6:10:1da::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 14:11:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 10 Sep 2026 14:11:36 +0000
Received: from STKDAG1NODE1.st.com (10.75.128.132) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:17:03 +0200
Received: from localhost (10.48.87.93) by STKDAG1NODE1.st.com (10.75.128.132)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 10 Sep
 2026 16:11:35 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Subject: [PATCH 0/3] Add STM32 TAMP nvram driver support
Date: Thu, 10 Sep 2026 16:11:21 +0200
Message-ID: <20260910-upstream_nvram_reworked-v1-0-521c16175cef@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIm6omoC/yXM3QqCQBDF8VeRuW5hNfGjV4mIdT3WFK0yoxaI7
 96qNwd+F+e/kEIYSpdkIcHMyn2ISE8J+acLDxhuoymzWWFrW5tp0FHgPvcwS1zBt5c3WtNVucu
 bc1mlpaf4HgQd//by9XZYp+YFP245Wtc/s3vwtXsAAAA=
X-Change-ID: 20260909-upstream_nvram_reworked-f84a4b37817c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christophe Roullier <christophe.roullier@foss.st.com>, Srinivas Kandagatla
	<srini@kernel.org>
CC: Simeon Marijon <simeon.marijon@foss.st.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>, Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.16.0
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE1.st.com
 (10.75.128.132)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|DB9PR10MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: c73da866-a332-49f0-e3a2-08df0f456ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: sPE6FGfG/ZACLWGc7IHCOznxj9Y1EpAG9P84go/PjWEMLJPiegFxi45wIXW02MCRwMDT037xs2i10wH2fbHhnCG70uTLr1Epk7jlK/IPGb1d8KeCgXjKzA0XJThP+tP0aQ5YOkjmszS8IfTp8cMjgmfYW1npYvBzHgc4vY2rId2t9rOLOw6IgxFDe+6OOW+RlHkUEdWgv5tyatVrVb5lQcjJm81DhkHF0OxB5SwCGfKawWIWsY0if2rFxR5MK8ztXwiWu8R9cIeQkDA6oQwGOz70zpY7e+1ktNMKyegleNtHEzGpY/IJ6O7iZpZVW1gLtG0Fk3kI1iDC51CqkLuZDzwVB2iDO/ncFgaOApVMR8DEfSRTudUWfUZfgSL0RNUY5UQI8E+fBnN2z1Wi/h4+k0Vksn33Lwj3DfIEPU8KbQqju7BZoHoRAXysaBu6IrP9E8NXQbSZVvgsM06AZJN875d55OgLDjDCQTg7Unphb7hgV2ryCHgOkKG9uctJ8J2jUU/MaMqUxblE1LkHEQ7Jc7L8G570l0EK2UgIX7ybSTFcwQT5YO4bjq5NBh6FFTdz5edP9J/HJpz0HhIZcxe6rA0NG/wNB3P4Nbu5WoqM5QzPjghOOHMHp+ZPvceue6vGtw8udEa7OaVJ6IXZan90wRdKuGZuaHmkyo/T3+Z7Z1GcXY2+FV04i7ll4ncBfydQisPR9h43BibafEpqzUm+EQ==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rWSIiJYF5OKlGm+5vsvxf+fWMDCwD5Cem7w2jdqUQ9IDkSSLWpqYce3jJ/RWJHk5Y6dV00JQbGQHcLKmK5ZLDpI84O4Qj/kyTZGMOB8OMmgIhbxb+kLzesNQVRZEbq6eSNZ145dIWyhGXEuEuMLWSrPMQA2vpgtWyKGf3MSxVSC9Q2qHDNFjITJnptOs7hEahYat/dXjXLb2MMWEw1js7L/iVyUDMX4K1kecGB6xhjWiTfu3mvUicAThc6i6b6yJKeE/zMgTHhg8fXNlBeEi2gxeMJkLCBOk7WUwfcUHgZ8w9JbhuxIQr1+b7XLGgzNudnD/PxtG63dw2jqr+Fq2bVNCEU9e5QXNDUbd+3ar3n0UNc8Z5ijW/sLtyOFkrmrAcTGQUqFpKo2Z6arhGLtgrcr1CUj7RK0+Ln6R0hXzsjN4IYxTfduVMa0tdhIwuPZ9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:11:36.3032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c73da866-a332-49f0-e3a2-08df0f456ce7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_071147_270097_65E57715 
X-CRM114-Status: UNSURE (   6.34  )
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

Propose bindings and driver to enable TAMP nvram driver
support for STM32MP SoC's family.
It allows to expose TAMP backup registers as nvmem cells.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
Patrice Chotard (1):
      dt-bindings: arm: stm32: allow TAMP nvram child node for syscon

Simeon Marijon (2):
      dt-bindings: nvmem: add binding for STM32MPX TAMP backup registers
      nvmem: stm32: add TAMP nvmem driver

 .../bindings/arm/stm32/st,stm32-syscon.yaml        |  28 +
 .../bindings/nvmem/st,stm32-tamp-nvram.yaml        |  57 ++
 MAINTAINERS                                        |   8 +
 drivers/nvmem/Kconfig                              |  10 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/stm32-tamp-nvram.c                   | 729 +++++++++++++++++++++
 6 files changed, 834 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260909-upstream_nvram_reworked-f84a4b37817c

Best regards,
--  
Patrice Chotard <patrice.chotard@foss.st.com>


