Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F15DFF41986
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 10:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ORMkIirTVyqhAbhva6OfdO9FUeMUmniBJil9afulF/I=; b=IiwZYHRQYo/F5K092M183S16xA
	I3rR65k5UZlUMEkIqudKotqRFmPsuo1G5eHfLrbkz8Knrmn8gDf1lNWpZPGo80ZLyHsXFo52PnbL6
	9T/eTSkkR2jfyyKTJe5/DSxlsihmu5o5XPDQTccRFnrfzi94IANBknOLP8jPi8xvEXZcZWCBgJmr8
	/zM4W6wigWc6rzSCrJKSuqEutlg/zDvhSMtg5vnp+28IsA5qXsXqXY25L3YlV51Sdfo6rzzQiQO/t
	6L/xV4vzOfVkd9Gry6ECVD7TIDeOEftAvrPmprtmRlaYb8XFXsFS01JXxvpQjjKlVt9K9xfLGUiXl
	Rh0NCAsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvN-00000000zyl-0M92;
	Wed, 15 Apr 2026 10:56:49 +0000
Received: from mail-westcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c112::7] helo=CY3PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCxvJ-00000000zyA-3rSC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 10:56:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j5ir10i0ENcCcxpGot+fZcRZ6KV/4Ye7hERB3cvqVvmNXv+vseIUKkdPONhtjLSM3IJNg4gTn9AdJ1DVjbo1GRCGygEznAEKwbgQxT8QTLNWHiLkegW5RMPU3mwkIzmpFWBSOKiI8JtbMPc7vy1HsEeMHbUkS/eJ4Eh2JTHo+D+4Pd264yIobCEkxj+zJJ9eCC3Y2JRcEQo99nFeLia94HQGcVqJY48P2Ln9Ni2cCqkrN0seOTGijCs9CqWlKmTxQqrcng9J5bA/5+OMSaHBbEpvig0/eiBK+3j8sCcUWgiuxEcZxyyQ9+EAwp+GjOFi2qCuQsIsRJ83fJj02nLMMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORMkIirTVyqhAbhva6OfdO9FUeMUmniBJil9afulF/I=;
 b=GmmI9gHQaBKYCyD9W6r07CejRy2OSfO44OjzKVs8hdUIlpy/Jwf2jUyrAL1cOsjqunfkmmBo61j7LrSlwZPWUlaSzhWJG51yRzLAvWA0Ax2hA6/7U52W8rfKZnHzCRMOwrrKcd27YrKRgD60A5+wt7baFExamWRAU3QfXMZ4s/IzUDFnAtEqhBc4EF21P7bsxuQ5wjFfys0TarGVVl63Z/rUEKDNHGcx7fY6yq0dZQpNCLgodJAaltDyNqQNQxIpyRMY2PHw76GC8GxnEpd/MpNt/iKsoruort6VuoC6+MXJZlL5Wv5wWHOZ8OzMV4zdgfX885vjhjOvWqxxctoQFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORMkIirTVyqhAbhva6OfdO9FUeMUmniBJil9afulF/I=;
 b=kYRhflMn7THtqu3fvMmykj75kg5F1A2lvpuzNkSubo7xHgAQpRMoFRGb7FuZTqEOL3/y2ur/ITz8vy00XJho8yH+ez1yo9CCpRLiqye4i6S0Xm7/BYwfoCKNQ/aSnBkie3jVfkAWXym0CwiR+xiamrni2RVNneoNMLteB+EgYJY=
Received: from SA0PR11CA0003.namprd11.prod.outlook.com (2603:10b6:806:d3::8)
 by BY5PR12MB4225.namprd12.prod.outlook.com (2603:10b6:a03:211::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.32; Wed, 15 Apr
 2026 10:56:38 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::28) by SA0PR11CA0003.outlook.office365.com
 (2603:10b6:806:d3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Wed,
 15 Apr 2026 10:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 15 Apr 2026 10:56:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 15 Apr
 2026 05:56:37 -0500
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 15 Apr 2026 05:56:34 -0500
From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To: <linux-kernel@vger.kernel.org>
CC: <git@amd.com>, <shubhrajyoti.datta@gmail.com>, Shubhrajyoti Datta
	<shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>,
	"Michal Simek" <michal.simek@amd.com>, Linus Walleij <linusw@kernel.org>,
	"Bartosz Golaszewski" <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/3] gpio: Add EIO GPIO support
Date: Wed, 15 Apr 2026 16:26:25 +0530
Message-ID: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|BY5PR12MB4225:EE_
X-MS-Office365-Filtering-Correlation-Id: c755bf1f-6314-4c7b-1f43-08de9addab4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|1800799024|7416014|376014|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: mg9AcbgcY/WBKznRiMtAxjREuuCVFgxiBknnO1mhc/haSjtmb7f7mM0Z0LEkJHvbx9Urqbcsc2qjyZU91y1MlCegYF1X6eKku3yojTL2DM03b5sbZ1FHYXmJu96oJgZyk4ieyg0Y3fUM9RlgvCTdV0eTi8AmFTlry5N//xuGeyAYuZWudevkANgHDr2MxYcUjIfkd+2J+jGXEiSLLkDmMgI477iFSdRBcKrVrb8LyCdNrW1mb/K1DP/SLN5WAjUuMPplaHu88zTJq6znA7xJ8x/9zS7hQyiv8vlAycQVqyFbe9pukiU+/4g+bXR9RXDvgokX//cgI4vJ2nwJ+2whVM+8iRn8ZtyKaECMZI3Qr9yTqiME7ZenmaUa6husVnRU3bmrtgV2yUq1JQuenx5L0SWv843a1cCEc9BkK1qycACvv8/xa37TozwFYBXHVsZzF4kjpX32T2y+NS5PAVrKreh6DhiD4DRAjvB7V9+5CCqxLcK7KxCVCSPZv9WSirR4wjqMh7wh4AJBGLDmFMgTGEuElDo4JIOohMd4QWyVxQZ7Z9xpm+FvapAyjdvZ8k5mKAWpTdf8VMcwJyoUKSmVq1wBAdnssfGLQ1mxrZyzhi5Vsb42jyo8YcuPDOU5WmHVdKqfBfzxVocR9lbpzqykd029RKnTyxAG93y5uJS+dVbrEoVyqRLCynBtwqQTjcsB2TLp4rcxEF+PEfJqGulewAL24F+lN7CC0zASBv8rCiDhwE+364LS1OMA6JUnIIr/Gh01DiJss2Yz7zgpdLxRRA==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(7416014)(376014)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Rus2fJN7XsQhXw4iQTLnaf/uEWwWO9jNcaNzEoQekmJLcZG6Qm6tt6ULfNkc6AKwRvoxB8B614SzqTOaQi4NLSaqvH/g0HU3D8PJb0QDcXquxiVJAI2FoaRdU/cpcRhRCJbtqG7MlV2kDPHsBEO2KzhRAVS6smWrdQF9aG0apTPUWTlmVooX5AKv5kDyfuP2Vdy6sN2/h0COIf6+HqpKcziofpPdTAe65bHFjN9Cer2FCBD3gkKN1ZLsFTjwgHExUAQhg0mOI0m62E797zGql1fnF72V6gHhBB2eut7OSXhpJf4qZdsuWv6HSnLLAECt33WC1KQKxfFb/FFuDkjIxcM0Ia+7j/ITVxoSfo0wVEkvtB3yq7udmyBPMdXVaYPwScS5vukdqe2cze9OzPqIhCwbfSzeo5mnkiIVJ/lQrfLceSY56DHZT79XYAgwegBi
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 10:56:38.4880
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c755bf1f-6314-4c7b-1f43-08de9addab4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4225
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_035645_997746_67B6363F 
X-CRM114-Status: GOOD (  10.25  )
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

Add the EIO GPIO support.
Add the dt description and the compatible to the driver.

Changes in v2:
- Add new patch to sort the compatible strings alphabetically
- Add description of EIO block in the dt-bindings patch

Shubhrajyoti Datta (3):
  dt-bindings: gpio: zynq: Sort compatible strings alphabetically
  dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
  gpio: zynq: Add eio gpio support

 .../devicetree/bindings/gpio/gpio-zynq.yaml    | 18 +++++++++++++++---
 drivers/gpio/gpio-zynq.c                       | 12 ++++++++++++
 2 files changed, 27 insertions(+), 3 deletions(-)

-- 
2.34.1


