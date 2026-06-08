Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5762CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3TwgCOHrX/CCMefhBQdSIdz3tGvrM94cLGXsrtRbHkw=; b=z4LNOx2p9MKc2yOkIUfQxLPyDt
	BjvNWwf8cDtCVFzGKqkJvdswOgX8P16wE2pxe+/QMgJ2zvBIACL+N/7ceadWHh54SXWlERgTvNyJO
	+WZwloXb4zoLkMgJTSXtLEgNvfkUWLYDTUsNgr0gXScevn16IBHEx8oIAHJ2QtV52rkRAzS6yy5rW
	blma9DloQkdiOzRlj6h1zG1e90KZKPAMabAfq8LB8DjJ+UW/a9IMSoofjpogS3sgIf2ExSzkmQyJV
	I4q5S4LttMefbeNM4Ljap/GPpRLwgz/N5VvygRJg1WfIaA4pqXOFYAICOGyoUdwDvzHIlNeFqKyDC
	X5QtKvOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvY-00000003Hk8-1E3P;
	Mon, 08 Jun 2026 10:09:52 +0000
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvT-00000003Hb2-35H1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+2BYBWFI89dPvSCsNc/Ef4eu7PYVI6DkR7XNxkeoZeMYABr4TiCf7UwFvRkuePzVHrOzBwv0d59Kah8yoFQzDvo8S3VZFiWWt8AV7kT2tOOMr+54FyoxEn1AaKmi44xeitNXPqCqMrnkp7+XQkS2K/JKhJkuaobHQ0MCrKTLwfKVFpOZC8L/UsM7CYJ+ykL4xI8+3UnhMBlr/edQHiWBswIrxQQ0WSSqxSzG6SSd7KbSF8dmKonjU6KneYaJ0RJmTOZRcCl3lubERo7rvvv6jPa3+Y8/5f6YY58HndA/TStrWXRjO9oFvS7CGgzypOz1XnyBrBc2sf74gvSslUFdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TwgCOHrX/CCMefhBQdSIdz3tGvrM94cLGXsrtRbHkw=;
 b=RROqTAf+YDWsJ4oK+l3waxDu3PPwstY6QKrE9vcfkAJ0wHEuwZOrU5+x7tZ59aq4P3U0gODQC/+tZNeTOTScpKpCTmaZc0JIQkBskkVAyEu5IeStIhd62ec5BltMDN6Sr/tDmkmORNXAAv4cLYjd5bOfo2K7Gqjx4w7zCGdncE1k6Q9hjLfyL2mxKeFLZABZMc0tqRMdTMlHAmFndYevSuN2yzK3ULVUjXCXSNZwSn4PdOwgmEY/ulbUpHalSUbfsf0QMpvOjAd0b4yq82L5ThVGiBz34sJnDQPlg75hFvchEAINiLqA8x20nFWIbB1Hmtnbj0DRGzxEmd2SpTB+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=davemloft.net smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TwgCOHrX/CCMefhBQdSIdz3tGvrM94cLGXsrtRbHkw=;
 b=Ubk2aPQRBQRfZnq0uwEkR9Kk39WHuoXCmiRhMpugyf0roGvQJB8lheSXiI7C48S9hufoHUz2jMfmIcNrLAyn8eT+QDfF/nkutLRqo3UEKSYi19cuEZ09LaY/ovbhnZLDFNR1lq0ngMWUHK6xBOGvPk0OlrKvRLi2y1GhvKgmJEg=
Received: from BLAP220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::23)
 by MW4PR10MB5776.namprd10.prod.outlook.com (2603:10b6:303:180::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 10:09:41 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:32c:cafe::a8) by BLAP220CA0018.outlook.office365.com
 (2603:10b6:208:32c::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 10:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Mon, 8 Jun 2026 10:09:40 +0000
Received: from DLEE202.ent.ti.com (157.170.170.77) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 05:09:39 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 8 Jun
 2026 05:09:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 8 Jun 2026 05:09:33 -0500
Received: from lelv0854.itg.ti.com (lelv0854.itg.ti.com [10.181.64.140])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 658A9XFd3995669;
	Mon, 8 Jun 2026 05:09:33 -0500
Received: from localhost (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelv0854.itg.ti.com (8.14.7/8.14.7) with ESMTP id 658A9WJI015180;
	Mon, 8 Jun 2026 05:09:33 -0500
From: MD Danish Anwar <danishanwar@ti.com>
To: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, MD Danish Anwar
	<danishanwar@ti.com>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>, "Meghana
 Malladi" <m-malladi@ti.com>, David Carlier <devnexen@gmail.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
	Himanshu Mittal <h-mittal1@ti.com>, Hangbin Liu <liuhangbin@gmail.com>,
	Markus Elfring <elfring@users.sourceforge.net>, Fernando Fernandez Mancera
	<fmancera@suse.de>, Jan Vaclav <jvaclav@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Felix Maurer" <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH net-next v3 0/3] Add standard stats for HSR/PRP
Date: Mon, 8 Jun 2026 15:39:27 +0530
Message-ID: <20260608100930.210149-1-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|MW4PR10MB5776:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2f091d-bb3b-4f64-6d9e-08dec5460e09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016|6133799003|18002099003|921020|56012099006;
X-Microsoft-Antispam-Message-Info: 0u15VUqRykb3hM3vpDLu3aHaxP427kwji1WDHu9qH5Ys9LG5V5Jp0RMFFzvRaNe7E9CpmpDhlbnQZrkaO08uSBZHf5pAhXQH5CD/+rRj2AHWivrXkaeaqcM4j/bZJjyNxMYGvMiksaPW6VsSs0wmiPLaTKPAgeEU/fjkYeaExziMFftmPToJjuHArgxOFtcmUgHIZLuaRkXp1/4xpVSblKrqCJMFilejmvRy4Hq2WOtJzWDRokmRxV1HOGsZ/BbDDhSFw1tQ37+u8c5zyQvgQOE4r8uMGg9NE1lXnNPZhgAucvpaqmreGnqqBqJPGsbOh88oXPKhHenHzHRvaOTZKlWdRyTcAcgQFSZjuQMJbvhqWKtRrpN1Gg126aGVZ9dClIooaebdbL3JvbFDZcfoaKn4Dy6dbVCtfUX8ZpiO2Fd3BtniDK+pr/jG5XpVgYVh9o0XRWQdRwSxodv5bRWhwJJU+w+CY3NLLd5/yIkvU5o1e1z6Qt2QWMgJftGbb5dvcW2eeaYyQzSwkKDsUnUnBZg790hSvivX0PQtEFyY9lqaaoWAwdmPeMmbIFaUgBXEZOScMWZaQOjjQHFummWpzdnBdG0hhXxoO307a9tlRN1AQGVUvXaICz/b+WGJqn7v7jYxkvPTiwqMx/YTWlKhJ5U4YN+VFebBC6s/pDrLgEi3jy23qVCDUkvEL9gApseLktHv/QABbhsfHL0TNoRVvDwgRzOgFULHkVCFY9Y6i9Q8w6oT5vsjJrE4IvurVKHYF4CdX/Gx+SxZaobaCtdoFg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016)(6133799003)(18002099003)(921020)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UBsRBujq+OttRz97z+v1knsgg+t+asVcea6buufXhivCScWe+W/IW0/1+utDoc1yXu9E2fil2sAQKTyMR+fx/rwHrj38lI2m3O8krgRywGfvZTPtOFVqHO8SR2dX6LxufsM4lmWWl/ghHT/2mWKNgTmv2P2/U5g8lm4IJyek/Wxg8ydt8ED6vXW6drKD8yt7F07E/W9w+HKgtf3U35yH0z/lvwVeEQtZtG/JJBW9HeNTdZn1eTbP5+goUjFG2R8OIjCi85LFWjwwqnT7EKZrmQOqt13RfVf20Pu8yM6K0OToO8/H9nGYx7vhd3BtQmiYV4tf2CAEf3kf9LqR+lzK57PCU99o/b2oeZCAMUUrwXw5SWqPs9ryAWORFJ/0cJQ32tM5d59tI+PUb8U45tWhO9Z2VwnEVNXqpy4hXHGmKM1cnZEY/7IVYIx7pJFbTf0i
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:09:40.5896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2f091d-bb3b-4f64-6d9e-08dec5460e09
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5776
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030947_888945_C23F37F1 
X-CRM114-Status: UNSURE (   9.42  )
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

Add standard stats for HSR / PRP. This series was initially adding HSR/PRP
related stats for ICSSG driver. Based on maintainers' comments on v2 I am
now adding support to dump standard stats for HSR/PRP.

The drivers which support offload can populate these standard stats.

This series only implements offloaded stats. For software-only interfaces
Felix Maurer had said he will do it later [1]

v2 https://lore.kernel.org/all/20260514075605.850674-1-danishanwar@ti.com/
[1] https://lore.kernel.org/all/ag87pBZfOyccPZTc@thinkpad/

Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Felix Maurer <fmaurer@redhat.com>
Cc: Luka Gejak <luka.gejak@linux.dev>

MD Danish Anwar (3):
  net: hsr: Add standard LRE stats via RTM_GETSTATS /
    IFLA_STATS_LINK_XSTATS
  net: ti: icssg: Add static_assert to guard stat array counts
  net: ti: icssg: Add HSR offload statistics support

 .../ethernet/ti/icssg_prueth.rst              |  19 +++
 drivers/net/ethernet/ti/icssg/icssg_common.c  |   7 +-
 drivers/net/ethernet/ti/icssg/icssg_ethtool.c |  10 +-
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  91 ++++++++++++
 drivers/net/ethernet/ti/icssg/icssg_prueth.h  |  10 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.c   |   6 +-
 drivers/net/ethernet/ti/icssg/icssg_stats.h   |  89 +++++++-----
 .../net/ethernet/ti/icssg/icssg_switch_map.h  |  10 ++
 include/linux/if_hsr.h                        |  48 +++++++
 include/uapi/linux/hsr_netlink.h              |  56 ++++++++
 include/uapi/linux/if_link.h                  |   1 +
 net/hsr/hsr_netlink.c                         | 132 ++++++++++++++++--
 tools/include/uapi/linux/if_link.h            |   1 +
 13 files changed, 426 insertions(+), 54 deletions(-)


base-commit: 4aacf509e537a711fa71bca9f234e5eb6968850e
-- 
2.34.1


