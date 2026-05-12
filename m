Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35CDCD484E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 06:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IFrnVx2vClI03GqvL0LNJR40dpFSDsq4E2xv5pSAFaM=; b=j4EI57Ef+ZYjcls62CMvHNEivY
	gesCZXFqu6jaHdoyYZBo6i5wMX8wlIKqhW6LJk6qey7+xgdr7THcPZpiwmS91ET47I/dRpMutS5gD
	A7gNZz3zzElmjwWEGQ4x0emW0liVU5pem14FHRoD/gzTszpkei3kK2lShUb0QYLjPW8e9svoAIqb7
	mL9y2lT52FY3opvom3yqTh4Gie3ZImZMzFgkfhMx0T/rwgL6vAq3nos61ABZYB59Mxf0mCFlqjw5Q
	4WahznCNmKSi3L1DuNcagJ7wTCZIlPK30EDZYbq34PevhxGquQWmQY0VfjUMEzsWvxktX1NPD2chw
	YkEufaHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgGS-0000000Fj7F-2jhT;
	Tue, 12 May 2026 06:06:44 +0000
Received: from mail-westcentralusazlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c112::5] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgGP-0000000Fj6P-0OhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 06:06:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vYrpiSAp4Ofuy0mpg1Gtxy1CoIZ4P74q/9UvGXq+IRJR0MuLeHQwGB2yf7S0/b9tYxxC93wAI11NPoN9KsH+XHs2lSa0brToW4gLvCg5VAzM/4kJdJdSKy8kOHXeE2VjyhDs1Pv/lxF+UOnSe/msr+KilaR9HyOKjQINePcG2U/2Bi9JAU1fngETzZj13qeeOAPZzzdppiDTAGk5Cz7WL4Jwg8aWwoomo29uEc0z3DOGLFlhiqphmBCa8DaXWUl7HXcb0HiJaUhYk8r0ynn/X7ZP8BR8pbul42JTDONT/ceGGBxWHqk3HNWIea0sw2+KzjdKDmdb8L2WsMRMZ4gcPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFrnVx2vClI03GqvL0LNJR40dpFSDsq4E2xv5pSAFaM=;
 b=S3ak8oL7WOiHKo2+0FM+S2WbX/8r5XYZt7MwsBh1bL7RmqigQgvBXcjTLWhTzhbGqOizcarfnCLoXqNerDmtYHt2//r1Mv84WN5uhBkXzdPFtGaYaSfNM6MJdRXuqNTVkACpFmnUmy5p1EO+nT0TZ5sVgXoUrXWgdyGwZfNom9OAorkyziKO2NkZlp7IKbm/aR8Jt0s5pKUMQUTSUfXXJIsm8ddbvRJ2PlEOKyUDaS8H5xwBJLSVM/ZFtxHWS4t2yreY3sIVWD2FEA4RU43eqz7QwAfl6yu92HgFvsOarl9U7er/uC6HyPpEiwJO9eCyjFNR4A9sWyoqrO8RusdTSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=davemloft.net smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFrnVx2vClI03GqvL0LNJR40dpFSDsq4E2xv5pSAFaM=;
 b=luX6EUsIkG4+LYFhersOWU8xJGYKVElu1aG8dJ6N3OVCA31KAZJacvl9oIbGzt/vqCsiqDiq0gL6tVE3uEFmEbSK9wdtCeHKZTZUiQHOr6hh5jD22ChzmLM5U0sUqcDd4r1HTfWKUxJVmxGDZP3V6cBdOgEfouMusbHQtSEClQk=
Received: from MW4PR04CA0188.namprd04.prod.outlook.com (2603:10b6:303:86::13)
 by LV3PR10MB7915.namprd10.prod.outlook.com (2603:10b6:408:21a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 06:06:36 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::9) by MW4PR04CA0188.outlook.office365.com
 (2603:10b6:303:86::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 06:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 06:06:34 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 01:06:31 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 12 May
 2026 01:06:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 12 May 2026 01:06:31 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64C66VmN1179435;
	Tue, 12 May 2026 01:06:31 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 64C66TPO031898;
	Tue, 12 May 2026 01:06:30 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, MD Danish Anwar
	<danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>, "Meghana
 Malladi" <m-malladi@ti.com>, David Carlier <devnexen@gmail.com>, Kevin Hao
	<haokexin@gmail.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH net-next 0/2] Add ICSSG firmware stats related to HSR 
Date: Tue, 12 May 2026 11:36:25 +0530
Message-ID: <20260512060627.3781329-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|LV3PR10MB7915:EE_
X-MS-Office365-Filtering-Correlation-Id: ce920ca5-4fe9-44f8-da89-08deafec9ed6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info: n0A5p7bnDy2zmZGUlF+wpiIzTknbmhPpXcmQoxxPvDLwfushtetwKnsVXFYBpMsR8BzhPwqg1TIoycjzP151V/7Dq+YXVJuENV9aqif79I1cybWOXxa8YytYpCkszZV4b6RyJnv+uwV82YqYVt6Lrcau6uP+dnlL8IX2EwF3gpzp3+dY2V/iGn0m1ar1e3+Jovmn9h0EVJD31dPv5tngiLcrNIyYUvhgJ/ZlfkGCb71bDS0oIXRevWFuqOhQD1xc8yzMErFGQqsw38HRC/ZR37orNftiNgHlEwOZjyXJ0kaniLnFhT1m+otFhwI+MxMj1jdmLIdqUp855UUxkoJ5v46ZKvtEjTtVtrwhNw1oqL3dTtitBksIF5ELSJVSh8Ufje3c94YEZFH5ckAn21AwGKlZgQaifmvPCaUSzvl/Uz6v7LpRY0P58AhL6JkYqVm1oOLdB2QSGvggzDwZfTnvdW9MsR6LyeCANblA39j1kzyCPFPbGmnBl/mcJvJ5qhby5J1Lun3G/qbx4wOx7XAsXpXAyjOBDFDK7e3NPk0U90t8m5arNu2/2AdSx6OwYEEX1ZuNe8ryYlD/PkkMrefbTZkHVpou+rWwqgTwPtP9yb5++4PDwh5YhJt0SitBiZvB4a3N4SdW2tFl+BadpFBJ1NxI2RjA7OyWfwu8N1JPESyrIC2v0Tft9pDWJ89am6NUzTK3BuAx4TU61o3+YD+vqYcnUDoqHs5KjbyfgsNH21RgtdiCVhLnhzlZwH32/WXmpCQQaRI7IPCDYpL6GhFHiQ==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CblPtD5brRD/WUK1xZZt6v5sDvUDVsey5bJaDNhDan59eMPXVOJ2qwcNhBy1fZzncGJoL04Q+hsGjnl6Y7BLa4svduD0I7pMLCFYzv7xLAFlDOQieUqi7t1KryGljwZTTjDn/sNg9TBwwG6kLcoNDhIv61khr3B/uN+JPNLNzheTK/badYpVOV3jUu6JukqNOlx1UHsCXXVSmMgwumQecTA3K+DP8W/lUL5KTE6CJGtnr0DhwMYhRq0u8OAKRdYal5ySV3kvOpnj6OGcfiHEROYGi0j1wB4XFDynZ2W0maYj7KdjKIJshomcPkzQJywqZaEESzMtdoJy/RJeGkxAYN87wYJJjsfJYtIPg/gjcQHj81lEN7VYmHpfU/1jGJ4E5sjqKKtetS0TZlcpihbfsQ4CokmEcZ9CP+GWYBpRUgtbEG/Qed0a7RH19z6MbcKV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 06:06:34.3828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce920ca5-4fe9-44f8-da89-08deafec9ed6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7915
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_230641_239225_276EDF2A 
X-CRM114-Status: UNSURE (   8.73  )
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

This series has two pacthes,
Patch 1/2 Updates Stats counter to use ARRAY_SIZE instead of hardcoded length.
Patch 2/2 Adds new stats related to HSR / PRP maintained by ICSSG firmware.

MD Danish Anwar (2):
  net: ti: icssg: Derive stats array lengths from ARRAY_SIZE
  net: ti: icssg: Add HSR and LRE PA statistics

 .../device_drivers/ethernet/ti/icssg_prueth.rst | 10 ++++++++++
 drivers/net/ethernet/ti/icssg/icssg_common.c    |  7 +++++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.h    |  3 +--
 drivers/net/ethernet/ti/icssg/icssg_stats.h     | 17 ++++++++++++++++-
 .../net/ethernet/ti/icssg/icssg_switch_map.h    | 10 ++++++++++
 5 files changed, 42 insertions(+), 5 deletions(-)


base-commit: 63751099502d10f0aa6bb35273e56c5800cc4e3a
-- 
2.34.1


