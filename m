Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F2BD2504D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FjTe8wUqECmpFYLQqoeO1OFiZl4CueVHr9JbU7ALhiE=; b=Mu+dBHoRSFHhE/Q6DW4WtH5Bpg
	dTyk9BSoqSoQmhyggLbq/lncnbJtXun1pOhGFqzX2cvMyATa182g7KsV7xeCGI/fgjLHUqXuxPA13
	JMBF8IOcVAuPygXdM3Z9kK9QicbA/mnO4w4SqqpkYZ86Wix72rXN5cF0yYR+sEXmgroDDQMiWXZVL
	vf1Cr2oDWJhSj7lqlPjSlj/CzCGeTxxuNhfRTO8zWU6HrgdJq69CH2AZKrA35wy4ukAbFDQDTvGrA
	0J+ziIWWHfNJbyNl90x8litWTYt/7XNR+7tM9Ul8pyWuskWOUJQ1jPdd/DGW+45OQowiSwj/Z3pZb
	C9Njuenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDex-000000051T2-2GHo;
	Mon, 12 Jan 2026 08:52:23 +0000
Received: from mail-westus3azon11011070.outbound.protection.outlook.com ([40.107.208.70] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDeu-000000051SV-2w9R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 08:52:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eiUJdoTvWybXaS4vnv/KOKII390g/2oTKncPO5XPkudjDZHdei+U5xdNzo87esKXaIzu6HTHdc0Dqi+qmk8y9gAZrm3i0cDtZUGDEAhHyF6OSUakm1b8Mydi6ZDke8jL8ekgmC3rZxPffGHLlF8KnH2U0OKA3ZNaYEW3zeOd5pq/VRE+Jj6seku4dqvZgmKYk7ophd4443WUEXgXw8RksTjjCRATpUeDZS0Dw70RJGkfsA0Kf4tWfQX29vXoz+pUNj+WWBbdMR0YOtqTXaY8L5JUJvDxs4d53aBCQd80wphLrOAu9rdB2S9ggN6dHpk/w6Qr9cIXl/4fCcyWhR38IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjTe8wUqECmpFYLQqoeO1OFiZl4CueVHr9JbU7ALhiE=;
 b=iI9ObMAfVAr60a7olf566A0QPF92HBT4ZK5dG5sGGNdRSLZm7hIaNjExuf3IMAKrXk3AsdMCQmeDqO4UsjjQeon7ZnySld/8fLBYEkzr1HBuKNibip98OwPdrJdWQOnZZSBybyac1zkKBIAbjmIMeXAXgyzPTu64eUJYdDAH+16aMZUWS61Sp76IU2DWpv1Sak6BQ40JBhFmg1Y1QhF6djUDQk1eqRuGN3d9LwPCzNnKBnkqGTav61bVVh+tF933Rh/JqT+PAesWvJY6GjRNEConS52rPZZhpSt9r0dXxNNieAXRmxlKQHF4PAXMgDJ85DYrVlxIjowiCDkpKNepOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FjTe8wUqECmpFYLQqoeO1OFiZl4CueVHr9JbU7ALhiE=;
 b=XZN7v3pd8t0smLuJcPt6RHY1IyJ0oeCgCV91NZpraaJQxnG6aF12tK0yDgtUCn9LAKSXm7CpZ6tAG1wYZg1GoKRi2F4NAYzuC3/XwA6NY9MYCCp+Bc3gcEswqwHK65/vqGbuXecQsZuwg3yWwV0ohYk1MTYutsGe3iP9XZ5O2Ls=
Received: from BY3PR10CA0015.namprd10.prod.outlook.com (2603:10b6:a03:255::20)
 by PH7PR10MB6355.namprd10.prod.outlook.com (2603:10b6:510:1b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:52:15 +0000
Received: from SJ1PEPF00002327.namprd03.prod.outlook.com
 (2603:10b6:a03:255:cafe::c2) by BY3PR10CA0015.outlook.office365.com
 (2603:10b6:a03:255::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Mon,
 12 Jan 2026 08:52:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002327.mail.protection.outlook.com (10.167.242.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Mon, 12 Jan 2026 08:52:13 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:51:57 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 12 Jan
 2026 02:51:57 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 12 Jan 2026 02:51:57 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60C8pqh8090613;
	Mon, 12 Jan 2026 02:51:53 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: [PATCH v4 0/2] Refactor watchdog instances for j784s4 and j742s2
Date: Mon, 12 Jan 2026 14:21:11 +0530
Message-ID: <20260112085113.3476193-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002327:EE_|PH7PR10MB6355:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e116380-b2d5-4cc2-8556-08de51b7e16a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|34020700016|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5aJIPO6E7buOWvX8IfVgmo2tEn9xOi3JHI3zK7RR3m0d1AK7z9cBgId5gXuK?=
 =?us-ascii?Q?w3gLkb80Z4RCw6VxPFPzi4seVXUWJcgQa0kgy8sg2ImMWdad3x6Duunu3pgU?=
 =?us-ascii?Q?RFeFJSao7bbuHK8Q1sPVNh1uDr2KK8lStoo+0/QnGiYtg1Mg9//D53Ei0d4I?=
 =?us-ascii?Q?RFVpQd5ai9cxlbsvU8RaHty4JoFIu+Mwgnm5qbZXmVKU2Vr1PYobXhiLaDDI?=
 =?us-ascii?Q?H1Anbst1pI/wHkikNPpTw2+LGTF/unFVVo6/ID5NQRftycskNXzGIczICwQd?=
 =?us-ascii?Q?o7T/OcA46hCcRF9eacv3GbxesVfbuzbOAwklPT0FQFITU7qX/Uwnr/hX3jK1?=
 =?us-ascii?Q?3mlc8q+z62dzfnFcWxY23v+WUlf2VZGsBKcTPSadWtg1AzwnS1UqwVKeKKZd?=
 =?us-ascii?Q?h9w3c7bazo7dqLAhYl4Q1xi/KJpkRgzs9axYxK3cj4MNdzNb6sy1oBiY8UCk?=
 =?us-ascii?Q?D9G2XcB1gv3tk3vcnPNn44iJ9FTAQBEc0pzW4+j4yaYHPodqr6x5QGMC40yv?=
 =?us-ascii?Q?XD4d5zpbQTiwM9KdFcr9RqBjc7ekuzcARfsI4QqPncyXz9pV7ylk0BAXcPdL?=
 =?us-ascii?Q?RgiGnz51bdwyhdktLeh99wBeowfI+2drJ6VItx634pdmKOT3+dYJ6hyXhO9k?=
 =?us-ascii?Q?ZBWDAKlRWqTSBTftPrzNUGDE/YoVbxZX62p1uWlhItk5dneozWyBpv3pM5XQ?=
 =?us-ascii?Q?YUF34SWIKXBvx5o2a/lbea07D7Yt+JO1uhcx14Rmss1rYooLiDEzB6+MoCpd?=
 =?us-ascii?Q?4lTz3bsmYgOY8xZUUO48puvmMN4aZ1I5NggYdrxip5qnr9OEbasjygVBc8g1?=
 =?us-ascii?Q?sC9GMOCSLKC438Pfa9OXQDqbtiPgHNegzseV/m8PSmf8qxjRWBTS1BwLmX/0?=
 =?us-ascii?Q?17CVyD0ziEWwf+bPGaGyVndeKzwZ9zSeGyrbAZMXKMvwUA42bHuTAKSIDZFY?=
 =?us-ascii?Q?ALc6C79cHoalbdqIDONIRCa1hjFcc41cZiiJBQrQBq5zrvXMdUfhRO7I6MO6?=
 =?us-ascii?Q?Kcc7dLLl6sSIEtnv5AyjkOvhr5dG6d0fMeBn8rKf2g9MYaOxuF5g4Qa3SFsb?=
 =?us-ascii?Q?3Fm8vj4M+lrMn5RclzoahkKx768IdYvOkUs9jpSJp0iJU5odI4y6N0RaVQ/s?=
 =?us-ascii?Q?5uLA2AfcCBmxjYsdynMXdWnnrR4kmPYCyIKD3TDTQN8KwkBNrSMNQmdlmIma?=
 =?us-ascii?Q?wmkiHb+KyL/1ofBTzwB7I2ro6Ns5CXNHht2R+VqHNw/Sg2v0RuHpyryWPxrE?=
 =?us-ascii?Q?2n16aYYBMgZQsKPPrcA6n/9Eepmaes8R/uvxN2sMpbRRgg9I2fzL7qOq4yHn?=
 =?us-ascii?Q?jBdIyM68IIROKBo7ckPL7JhOV7h9QKYiJzpXQyD2Pv2yhbNgRCv8hx3fp8yY?=
 =?us-ascii?Q?riaae8U1tAOGEU/UAU6zSc8Ipnp62RsmjhaqIGn4spb7m+IxmUYlRc9++kQN?=
 =?us-ascii?Q?TBLvMQcZKHka6f3xsRSp0YBnV2YhAx+/PwyNbevEQK4b4VSBpT+o1tIfKMyQ?=
 =?us-ascii?Q?DGUvaVGesRqA09zHrGnUspkmCGM7a9gXN2YmU0N4IstEhJjbl/Eo96ASKTqh?=
 =?us-ascii?Q?jHJ9PMT3S0g4xWtmXcLpXHHdT4bU+0Zh0ST8uFOl?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(34020700016)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:52:13.4652
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e116380-b2d5-4cc2-8556-08de51b7e16a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002327.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6355
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_005220_739401_576239B6 
X-CRM114-Status: GOOD (  11.36  )
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

Hi,

This series performs some refactoring around watchdogs for the j784s4
and j742s2 socs. We have one watchdog per A72 core, hence the number of
watchdog instances should match the number of A72 cores.

Move out the extra watchdog instances from the common file and put them
only in the soc specific file.

Additionally, perform cleanup to fix the ordering of device tree nodes in
the k3-j784s4-main.dtsi file.

Thanks,
Abhash

Changes in v4:
- Add a cleanup patch to fix the order of the DT nodes in k3-j784s4-main.dtsi file
- Improve the commit description and subject.
- Link to v3: https://lore.kernel.org/all/20260108085347.1416637-1-a-kumar2@ti.com/

Changes in v3:
- Improve the commit description and subject.
- Link to v2: https://lore.kernel.org/all/20260105050557.3459321-1-a-kumar2@ti.com/

Changes in v2:
- Added fixes tag in the commit message.
- Link to v1: https://lore.kernel.org/all/20251224055410.208516-1-a-kumar2@ti.com/T/#u

Abhash Kumar Jha (2):
  arm64: dts: ti: k3-j784s4-main.dtsi: Sort the nodes in appropriate
    order
  arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog
    instances for j784s4

 .../dts/ti/k3-j784s4-j742s2-main-common.dtsi  | 36 ------------
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi    | 58 +++++++++++++++----
 2 files changed, 47 insertions(+), 47 deletions(-)

-- 
2.34.1


