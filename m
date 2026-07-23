Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB60C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fTOcu42UHW/tzjChPP5Y5xWXBE76kyS+Nt5sireQSms=; b=xZo09XwBzV0D8COQNc+KwNmqg3
	fDpNMvXUp2DKp8+jplX1W5rCmagEQMjkbxqer4BzXr1fjcsPy48dQ0O+IV5/RUzQ0uLREnbqT3+3o
	U43tMlrX6A3vSMoiLsRTDfw7DrYLiPwiBueOLKLt4+MVwd2q3gwELq77DVazoxWRIRJAbpzkEexKp
	3EQ2tYXphMpM3ActXkZyTKbllCIa8PjHm8bBi7rznIFTPfQuTMU6Dyz1DjdQs/Il5nTxb7WOGrNxm
	Ew8ZfXTNwRQU5ID/NC0SI8h7zcB+38c8SqviFbJFh5OI4lecJ2EyvBCN1sOGqW5c/InBmLYBoIq5r
	zAJQ+abQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssi-0000000EGso-1R9u;
	Thu, 23 Jul 2026 12:50:32 +0000
Received: from mail-westusazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c000::1] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmssg-0000000EGsG-0Uza
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:50:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZFi6lyWng8Qjr+CxlPj2txipZE+4F/uOqiuZ6RWoY/aKDj5zsdatz4lg80+6LPt6Malm7QLLU9SP9llqqLJLuIqVefarB/Chun90sIooOAlK3iyFXid+wcDMOx8kQIiRw7qdDTfZWVe5KbUCI69FcrCGDIbT+pf2K3rf0C82QJUsvBBLt1yGg+oJoVSlrPJntAPyf1HGz57Qv0aD4yJIdfqa3DHIavACFDr6hRQS7WhIilMqGf42fzdQXb/H8FJ4jWX+i/z0OUKT+usImbxYyDr69NGNzF9fWXh508C8bzgYCMfNKCaq0KNtwG+jvMrxF/FjAtGqsNBEH3oyF5x12g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTOcu42UHW/tzjChPP5Y5xWXBE76kyS+Nt5sireQSms=;
 b=qlxWrnAX7T+LVUUf/JPb4lv0oBN/SiyByRgXbL0HbrGUSYBTQOg5lwyyXMieigw2Y+ZlYNaH/kQMqtGSK80cB90FS9wvaNEvCwnGq2b8Q86ce4+mNLBxvRKnvg/+ZP+AjE8sg5D0qsCcCP9CuzF7w/lIkMYnaUOPfgpUhg0liIB4XLMW8UKRfD98ZtP8pyEesQQKW/I34bMI0vHQYTTQx+vpZsgxwHP/XujODhR5iYm9kHrJCeDd3cp2R6zOQaa+ty6hcdGvUT3WKyUvCnAqEUqpUM7UGahDGQ/+7BfG5e39qRkcnx5wtVTBHTAJjpRW6XgT0HGKHgAbslDa70AGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTOcu42UHW/tzjChPP5Y5xWXBE76kyS+Nt5sireQSms=;
 b=mlQON8sKYe5NjpWLZ/v40zgPN9tBZnNk5jjGgKQvHtUfNubsjhM7qYm3z7rjpK0A3ep4oC1tTxHYV+CacJlVOx5aL82pPdkURgpikoVTpjEFkuy2WvLdUNAkQ4CSIS/1C4yI/r4XelnG/AeSkVnWj/Y3y6GzzYNXs6DiW8MFEtQ=
Received: from BYAPR21CA0010.namprd21.prod.outlook.com (2603:10b6:a03:114::20)
 by IA0PR12MB7676.namprd12.prod.outlook.com (2603:10b6:208:432::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 12:50:16 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::1) by BYAPR21CA0010.outlook.office365.com
 (2603:10b6:a03:114::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 12:50:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Thu, 23 Jul 2026 12:50:15 +0000
Received: from xsjarunbala50.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 23 Jul
 2026 07:50:12 -0500
From: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
To: <michal.simek@amd.com>, <git@amd.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Jay Buddhabhatti <jay.buddhabhatti@amd.com>
Subject: [PATCH 0/4] firmware: xilinx: Clean up firmware and TF-A state on kexec
Date: Thu, 23 Jul 2026 05:48:37 -0700
Message-ID: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|IA0PR12MB7676:EE_
X-MS-Office365-Filtering-Correlation-Id: 387b5b54-37af-4c09-e183-08dee8b8f14d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|6133799003|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 4ivW0tJFOj7wIzOUaFrrnQHE+mmAKBYssb/mQ3pkE9fMbniDCgZrxZRZFmni7/J8BmUHMycZ07U51xuXcv9KAynwtZY3/NI0QFbWVf2NQwy9yKLydMmIhSOsnuHEW5Ml4JKa9vFV8u9GlcV3xQHAim6M7A6oi9644E0K3J9Aq0RdJlrzVyKpJQyjAWHueHzeCocw3sh59JWarh0F+ylGLvn46pSL+nlxk8ls+3zA0DCECgsI46CrLbxUlYNON4RW2TYE3qLnu9y5Y4ky7cMrMJOT6aBmBjUiZ23E2hc5xCU22CNzT/vCZfsvwl+960EpCfCiZYgfCDVFCByqzdxHpBDseIO67Q17w48fPwRLr42s7E66VKJvAwiRoEY8CpUjr5zJj3dCk2ime721QgUpu33FJLE9PTTMyWkLp96WpnRAFM9MjXDxjlURn9ydDIzCOYu6/o/Sl41nzW0N50TvsQOroo7u9mvR0F0Ff7n/d/2WVgiP1acVdd14SiWgxHLE3I9LysptOrjik/VAO6fXfGJ98kobIfI1cvZgi/O6yYHOqF4zhML7WEIpK980BGlI2aIRr+rNCwOt/mrq/4xDzUX4wZkNxvsDuoSpiqSfvQPOgHk+lSP0G372khEpvnEO7B3CHI3yElAFHseOkoG8AQAtH4MtxyDLXdJs1fWplDt86vLUDBZykRBgC7X4ebD8Mnu1h16zAeI93UjXOEbKyw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JDiUDvnNCGE4e5QDT6DoRovn0tzqIl2SB85WEcn0kqi7w0oXak09ngtRXb5p1NKuVqX/FdIylEoUkjJ656NOlB3QOlxXHQQAAZUYM7t8ruWfat0OlzH56TZaYStsWkypFQ0cffGOvRU2cMZnXbrct/T3lqaUbMMJimWz566WNB+wJJ7gWGxygcVp6rC5qY+cpj4MPmNa4m/63PGxsVdOmuRNdduTyVzdSNfrNh11ePmpUE7+6axa6j5T3uMxnNDeIX6SRKpEIPMrVfSKgLJ1EhRYTPjD1Qwq5XiGV5KHe4PBhq+PJ1fnCxaobCOFCwEgRISn7PDkMqeBtkIVuuPJ8p2/B/31y3x2w3WsUJaeV71BgGGbV2FGcaJ4q1cXANQqxU/6Y/4CcLl21TUPg/gu8SODQjpwkiYKvUj8Zr8VvBwyn813wwnmBj+fQpBO0pE1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 12:50:15.1953
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 387b5b54-37af-4c09-e183-08dee8b8f14d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7676
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055030_159476_6640A246 
X-CRM114-Status: GOOD (  11.57  )
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

During a kexec restart, only the kernel is reloaded while the state held
in TF-A and the platform firmware persists. This leaves the freshly
booted kernel out of sync with the firmware for things like the SGI
number, shutdown scope, allocated peripheral devices and registered
notifier callbacks, which can lead to unexpected behaviour after a
kexec.

Introduce a mechanism to clear the stale firmware/TF-A state so the
reloaded kernel starts from a clean baseline:

  - Add TF_A_CLEAR_PM_STATE to clear TF-A specific PM state.
  - Add PM_DEV_ALL_PERIPH to release all peripheral devices in one call.
  - Add PM_ALL_NOTIFIERS to unregister all notifier callbacks in one call.

On a graceful kexec reboot the cleanup is performed from
zynqmp_firmware_shutdown(); on a crash (kdump) restart it is performed
from zynqmp_firmware_probe() of the reloaded kernel. Each cleanup step
is guarded by a feature check so it degrades gracefully on firmware/TF-A
versions that do not implement the new APIs.

Also rework the feature-check logic so TF-A specific APIs are validated
through PM_API_FEATURES (the dedicated TF-A mechanism) instead of
PM_FEATURE_CHECK, falling back to the legacy PM_FEATURE_CHECK for
backward compatibility.

Jay Buddhabhatti (4):
  firmware: xilinx: Add support to clear TF-A PM state
  firmware: xilinx: Release all peripheral devices from firmware
  firmware: xilinx: Clear firmware notifiers across kexec transitions
  firmware: xilinx: Use TF-A feature check for TF-A specific APIs

 drivers/firmware/xilinx/zynqmp.c     | 106 +++++++++++++++++++++++----
 include/linux/firmware/xlnx-zynqmp.h |  10 ++-
 2 files changed, 100 insertions(+), 16 deletions(-)

-- 
2.34.1

