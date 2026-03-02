Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715E4D58E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 06:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w79wJ539UYqY33b9NPFqPaczASsn25ss7nSm38YbuyA=; b=xL/SUzeKzLkxBRxdBWesOqS4Zk
	03hoiHj33Y5mgVOAP817KNKMibD0mGCxiEvoGzxxZyhIJmJ+c6LMEGX4Nlr+a4Hys6b6u94hXq5sf
	l11hVR+BwcW4O2h5RxA8tTo3hjVhYTqLo4SbhTKoCueHLko3oSOpLp1bGNUu8f98d5kqz+KSBKQ+5
	hVyKTW9dkYTo96vVHMiKPnSExYGXv0pKvXC8O+Yw1EQbIp/4DBGSCPcWAudbFE1Um4Sm/9PlvFVis
	t+tBR3YrRQ207g8fi8kAmI4RTaqJ00yxHQ3fmePrOGjRslgYut1aej8rYJj8W/5geRFJWKXDZyFbb
	ehyo8lpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0v-0000000CLrv-3VzY;
	Mon, 02 Mar 2026 06:44:21 +0000
Received: from mail-japanwestazon11022105.outbound.protection.outlook.com ([40.107.75.105] helo=OS8PR02CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwx0s-0000000CLqD-1FOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 06:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L/wWwpzRrGZylFe9m73Gy3xtCarfPhfrvayYICHVbtE0EZaiyUTFZIUIVtCzoLewKQV31Z7mwXW24BDTMI9uuTQy2GIlP9dgD9o0o0N26cJdk9xY7kqvsDomda7+qQNN1bbV0leOVrRKQyzSNyxJ2VKnYppmDXOLKL/di12hKTne9DTq2E4/93ILqza9FVhZWcfjjdi9DXsyJWUMkrZyoq/ttnjlMwtZkNOe4QfucLyLF6jjdXJfKlsgQ4ghIwsxFr6bUiNE0fpRBsjXDwY06MB1kfZwiZREvgM8IaVx48kCVQs+ERSgj0JpYwGVsnJN4nn4hqoRSen4hJ8suolOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w79wJ539UYqY33b9NPFqPaczASsn25ss7nSm38YbuyA=;
 b=P9AfynXWOXoiaC65M2WUxjO5RSbmwwznjxdqnrwQ9iJrwUllu1R7zPoZ5GsRs/9tTwkYOVMo/JnWe4KSssGgZXtgQi3F278SetTbo0T11bbLXmb5zX7qgcnAAqt/BYZ73jQl8h1DhK2nOXpzXGXB/1AQwQC/4frRd5ZPvUKRzIaDthT2zci94GisDFF+wkFjhhdxZl/1EnIcVUTJdLxdYMppS0itibtwdHgW7IMgTk7qqqAKAKW0LL6aK7jMB00lZ6iCjX/Ssgx260JaR0i8xzPillcgBBkiQGf+87tED3VPkH/LLprBxw5xBxaRVt8naq8puNVmS7OPHzhyfWzNzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) by TY0PR06MB5150.apcprd06.prod.outlook.com
 (2603:1096:400:1b1::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.19; Mon, 2 Mar
 2026 06:44:10 +0000
Received: from OSA0EPF000000C9.apcprd02.prod.outlook.com
 (2603:1096:4:193:cafe::10) by SI2PR01CA0043.outlook.office365.com
 (2603:1096:4:193::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.20 via Frontend Transport; Mon,
 2 Mar 2026 06:44:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C9.mail.protection.outlook.com (10.167.240.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 06:44:09 +0000
Received: from localhost.localdomain (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 288A841604E2;
	Mon,  2 Mar 2026 14:44:08 +0800 (CST)
From: Gary Yang <gary.yang@cixtech.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	peter.chen@cixtech.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com,
	Gary Yang <gary.yang@cixtech.com>
Subject: [PATCH v10 0/3] Add support for Cix Sky1 resets
Date: Mon,  2 Mar 2026 14:44:04 +0800
Message-ID: <20260302064407.1914014-1-gary.yang@cixtech.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C9:EE_|TY0PR06MB5150:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a9baddc-2979-4355-2df7-08de78271bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: irf2CNC+G+Ot9siUBpfly4BSKxmOQUupSsUgpTrrUY8QA7sIxvG03C/ebfGPbxgI2jfsP4tZcEZOpPd4lFAYWHzMcQhoye06q5gcy/DfrNpzES9wqrbWPA06MFnhnbn7BjZkFY+/2sEcCZ6cGZxh0oy2jwOvfkvXmc0yWGAxkAEOtGuyJJzBHhkY+f+LvakKoCGB1iWT+D4x5/m48ajao1g/H7GpCk8v0raqxvLTHwAyR0zUHt+zkEp/t3sQCe+nomnY1QutC7vbmZjxUkioSOFjaQ/AJnjEWVWa/YgD2S8/6n528bWVKUkDsX+VZwC3CLKGj6oASYiTswP0CNLcK3J7we71hmk5rSleyn5WJKLbKxxxDiLrA9d+GJrQYABotpKEOXDdI9mNzmRA2zJMhC7p+Pwa0RK00AI7zhRET/KPQr0kH+aIdC1N4Fw3+mv5wtGNtB4JoLOQnuHk80dfMI03tFxabj1+1jEhXRWDoXI10JY0Op6BE3gODeJFqVT8jdf0JxM29/5LDIUx06GY0gb8wfhKkLl0/edPhhxyRUDy87IP++hD/f5/qyHAskV5gcM4g76OcqSxl+myXb65svSgAg2YrG4CwgNW8yRqRDw/fFh3zx7WoccEuZLL92vaUVX+stcj6IpMkvPgGl+q6frkf+OWfpF6gQ6LH8vH3pIkd+jG+Z4s5BIDJTjXqOYw7b5VGSKeNDgt/82mA7sgw1OFIJypMBY37HHOhS9OQqU/zOERhVMcRn7pBx7czUW1egvUMz6dTxSD0uopQS4pM3fB48eBdSOPGOhMMIVhbj5WChOVCsxfmpVeFWE4f+Fa4FiH5fYZb2lZeeKJa5incQ==
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: o82of1ZFyYK95LIsxYvGgw7Nd8dhvDNLJ4oLpLO0UHT5mbm6IoxUPix7+GnhIMowzSxP7w2ppL7Z+SiNGDN9C20W7lBBv30AA9+Kqu13qDczLJi4OkqBF0AiAmKQRBVgeiMlenTMAFhSD6YJufIfypl6CwVo2Z5XQK1w8CSrBro/kAx/9Y/acHRXF48r+mPuzHDC/u4DNkmZVbeFG6wGps0OqaAgjOQkuIoVFliEJXP8OfojEoR3ID+N29cWYPtbnHlAt/mOvv+6GuYLPfaIRjiWf5Gk1WqBcIH5XqXcdDTYlPooQvQIMVWO+ojnRkIAeCl/1EtUxSLF/GNc66jo6U8qlEkbI57jQcBKWp8XQnSkaIumDEVP1KIVmSdUud3SsA30oDYYcmxeADUtEptF2HDhPX1k+WA4jtRV0SuYw3OcN9au9NfSRSPXRhoAnbMt
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 06:44:09.9191
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a9baddc-2979-4355-2df7-08de78271bf5
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C9.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_224418_341937_CFA755F4 
X-CRM114-Status: UNSURE (   9.76  )
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

Patch 1: Add yaml file for Cix Sky1 resets
Patch 2: Add driver codes for Cix Sky1 resets
Patch 3: Add dts nodes for Cix Sky1 resets

v10 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- rename dt-bindings header file

v9 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver

v8 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- remove "simple-mfd" strings

v7 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- fix build warning

v6 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-control.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- fix dt-bindings style

v5 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-system-controller.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- refine reset driver
- fix dt-bindings style

v4 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- add syscon
- refine reset driver
- fix dt-bindings style

v3 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- remove syscon

v2 changes:
- Pass dts build check with below commands:
make O=$OUTKNL dt_binding_check
make O=$OUTKNL dt_binding_check DT_SCHEMA_FILES=cix,sky1-rst.yaml
make O=$OUTKNL CHECK_DTBS=y W=1 cix/sky1-orion-o6.dtb
scripts/checkpatch.pl 000*.patch
- fix dt-bindings style
- refine reset driver

Gary Yang (3):
  dt-bindings: soc: cix: document the syscon on Sky1 SoC
  reset: add Sky1 soc reset support
  arm64: dts: cix: add support for cix sky1 resets

 .../soc/cix/cix,sky1-system-control.yaml      |  42 ++
 arch/arm64/boot/dts/cix/sky1.dtsi             |  12 +
 drivers/reset/Kconfig                         |   7 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-sky1.c                    | 367 ++++++++++++++++++
 .../reset/cix,sky1-s5-system-control.h        | 163 ++++++++
 .../reset/cix,sky1-system-control.h           |  41 ++
 7 files changed, 633 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
 create mode 100644 drivers/reset/reset-sky1.c
 create mode 100644 include/dt-bindings/reset/cix,sky1-s5-system-control.h
 create mode 100644 include/dt-bindings/reset/cix,sky1-system-control.h

-- 
2.49.0


