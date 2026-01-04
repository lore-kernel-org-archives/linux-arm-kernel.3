Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EC2C2A074
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 11:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eDEEfVyrneSJGX9ps/eV+02i8qm1HoSROWXI9TyjG/w=; b=k7IqC3EkUHJUIITJgb2AjkXl6V
	PzD7q2UU9vWGTvCl0a0wOvS0T6suX+taxls5ZrQjUkT37ME1rVShGv0O/G17TtaLbxR9qpddgUlmk
	lFvPQYnMgz0AuOwg5fmE/LtqVR+ltJZj8O0i67AsC0CCz/yKTNevvqZtlFmzIPLFVSYZm1oAn5peE
	HlsQOS6TVd4cieO8Ver05EWvkazdiCyHb/dMBMcWo21ZsS8xD437kvv9Em1fwO6YpIz4CxQM90NtA
	O1mFryODUqvyk7Pu3juirawIEH0rqP0TWqivIlcAwQoErzUvWYQrGQyrrIjQWOZ4f7x4BwQ66ZBEd
	UQ9+7sww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWN-0000000AC9c-0gAw;
	Sun, 04 Jan 2026 11:43:43 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcMWJ-0000000AC8z-1WVD;
	Sun, 04 Jan 2026 11:43:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3ciSIWOd9/4oPp8UC+w7QCutYquejrSjdz66pd1RoJHYfYvYKhQfEGPfKhpZt1PDOhv2hUd17DbY4F+e42cc/Xtcam17UfkvnLHBabv2I+lBH0FFNxDbj3+SOdcp7w16W9G1CWf+A8S03WzCFZ86NS0ptss1q69l/MOSh48RgTtG3xH6sgbfzI5Il+kBvbk0GRe8d4c+CS0lOOy3PLLrvFn2xF8zar1Ys34KbuMsfsVTlWYIxq5Thk68QhBsvHqaWzWDbFgnZ/Ue63xhfKUwKsrWU56fKoxe6wulJ1DGJdWlqTBuYUdIp6WkZg1u0QCtZYUElpNGccMR7mtO58iUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDEEfVyrneSJGX9ps/eV+02i8qm1HoSROWXI9TyjG/w=;
 b=Z8KqygNnDC+Bo578goXRz4NX7lrj45WknFM4e9GfrKDHb7CBEzdPQiWSognEiRunl6QXm4yXB7ePBSMi32fOHKWI9slAQdSPyc4b2JluBzGMqMt/rWyOAAvkf9jTe6oC7FBmpeos2GPNashtY8r3JFceGW5NjnpYewoO7WKe3E0YymkFKw+v7aaHnVspfQJ6LYKAlu9j3WJFdDX5MDRRr9xjhRfIb9uZ0f2SmsFhLoHZBdH+iy/j80q3RAyCq7LAEToUHIVxEuXzPblh2oRAD0iJi2f+ygE9MJujlS7DCztCVrt1jxq6fGxFC+wBzPjUALPPnJg6gZ1nb7JaweAjfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDEEfVyrneSJGX9ps/eV+02i8qm1HoSROWXI9TyjG/w=;
 b=wXnObmgcf5/d69YAHyggwR9i5q7+wpQgT+iMvcw7KxmlBM1wW7W4nlr1nszjUqwhHIBsy424WwYZTQJvVO9dhRQKFIqy7dBGpZdLQyevPh7RZ/ADZnvDCla8gy64j+uoLjmnL4C216CGTw1cvorr07K7O/BQ6xj/g3T9OCypRE8=
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by CO6PR10MB5617.namprd10.prod.outlook.com (2603:10b6:303:148::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 11:43:34 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:338:cafe::34) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sun, 4
 Jan 2026 11:43:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sun, 4 Jan 2026 11:43:33 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:33 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sun, 4 Jan
 2026 05:43:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sun, 4 Jan 2026 05:43:33 -0600
Received: from toolbox.dhcp.ti.com (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 604BhTlB3538389;
	Sun, 4 Jan 2026 05:43:29 -0600
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: <vkoul@kernel.org>, <neil.armstrong@linaro.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <sjakhade@cadence.com>,
	<rogerq@kernel.org>
CC: <krzk@kernel.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, <s-vadapalli@ti.com>
Subject: [PATCH v2 0/2] Cadence: Torrent: Enable PCIe + XAUI multilink configuration
Date: Sun, 4 Jan 2026 17:14:16 +0530
Message-ID: <20260104114422.2868321-1-s-vadapalli@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|CO6PR10MB5617:EE_
X-MS-Office365-Filtering-Correlation-Id: a71d864b-992c-4418-1a49-08de4b867da2
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|82310400026|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VDzBUmTTh68hl4iHL/OkQ/CYxJgDT6FVQrMqdl7lSHloK95x2zeDa9ONWhnl?=
 =?us-ascii?Q?vHfW56U4ImN5uhhPCbGLpNdl+6Oxy86Ofa6i3hl6RPrsyKWl8oqnIbOGBtr6?=
 =?us-ascii?Q?uUTdPD8cHILwWwPWrMK76jjPFhgqtnOSlU+g+btRBZnFV1y5Jou3lrIjhROC?=
 =?us-ascii?Q?ys4u3EK6a8+opGyz9oQaGXUQuHuA18o5QZvvPi6DX2gokP63l8cV34NwSbP8?=
 =?us-ascii?Q?h2jZ/+Wd96GesYAuMbnkNgaFXCOSbbWXXB/D1BFbOfu4G94dSL4t0yAd6+ut?=
 =?us-ascii?Q?sS26isRLbLvvwIluyJvSmr7LJ1vDBZSAg/35w/gGEc6sIoHtemCGfugzO2oB?=
 =?us-ascii?Q?EnOxLzuNg4vBkX5HscXnDKmnObru6iniKYLjT1bBBif7SC4jhxUaq3Y/Pbet?=
 =?us-ascii?Q?Cw6DLGWzdgkESJs0lNlUrDzJoPNR8XlthUF/JUg3Sd5ifDlyMVOFr9LbhIa0?=
 =?us-ascii?Q?Pi1YBYPfNbYCjrkBwcgmkzK9lR1h6N0/sE0ExByXD1bfZUr+lRuEbbnDpvYR?=
 =?us-ascii?Q?XMzdfP1kbfV6a2Un2X7bPAOTqAuSlyw+hoqNX/NlruZeSZopBfN0vTry2nh8?=
 =?us-ascii?Q?BfSe/IMHfC3nZy1sALYWw3obLneU89ueCzKDWvRCbvE+KHjtpeTjtktaIQSA?=
 =?us-ascii?Q?iiu2kjzPr+H8jSUxj7MoiqSL7HQ5XfH7MAAPPFLWFgTkuv8raeORwBi5f27D?=
 =?us-ascii?Q?59Pqo+0xkI5C6ZRi/cwHap67QkGwh0YLtR0yteJb6xrsKZOKbYHQvC5uOHZo?=
 =?us-ascii?Q?61SuAHovRcN8dRL2SdH2koj3OLjO5p8egp5pEzYhO12SODM7/cJijg2KNNDt?=
 =?us-ascii?Q?Rz+40443Wmu0pTnlfdNLMXgSNsI7tkHC7jx0t30TbZmIKeyUNls5KRSlIsV6?=
 =?us-ascii?Q?Ml/cJ0m1XZ/ZPUeeRPmIpA5Fu9VbWh1VmSfurC1elbIVSjalviZhpCtfYkCY?=
 =?us-ascii?Q?tKOGb4BYT25v8oTR61ufdZ//bz8fdV2KJbhjl2QlSF5RHDRy2NdEydrd5mCj?=
 =?us-ascii?Q?qn/OUdDNqpG/YiYJlbYC4uxLUbWcJ1Kib4IkyoWs+Yi+fbRvtB3s1ERc4OUC?=
 =?us-ascii?Q?bjiNrcPP00gOkuW98TPO10d0BsC2SOE1rVIxdE3HDOe1ayeNeqgwAESXXt7F?=
 =?us-ascii?Q?kWqRo/oOieReutpFvKU0Q6axaqxTydibfy+imYXsbNmJsspu9UlJ8U2MYIFh?=
 =?us-ascii?Q?XjJqYL9I6DTcDfiHW3G2rqMo04QPLvMGW3wE9RRAhV0xESjQp91Lla2LzAvS?=
 =?us-ascii?Q?XUgBi5QScTpzDL7F+gh0rowslvfx11PHA1bANp2BPLnunoafcTXACW9TeqNc?=
 =?us-ascii?Q?t0KvSzn9JaG2YcXNR+G10NmSn6j2mm1kfOEeYlQ9OYBMnw58pnDYl0IZg5OC?=
 =?us-ascii?Q?YQxeAyYtyh2+5H5BFuW4RVgbntBE8wjCWY4cahQUTRmcJhxSWaplxTbII1ic?=
 =?us-ascii?Q?aRIGDaoz43SLZKFQg3NmPPWLV76RapQrn9IIFREaKieSXyDY+8IpPqpSeNpe?=
 =?us-ascii?Q?UieADHwhmdezUtjPFRZpXZNnHiwOkHAcuV1/fWtDpqmXl3YKesqmUmAkrNLs?=
 =?us-ascii?Q?j0wwZ1+gnRhlyh8gkMmpJK8E96jbcAfY7QyLHcjR?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 11:43:33.7856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a71d864b-992c-4418-1a49-08de4b867da2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5617
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_034339_620102_2449EB4D 
X-CRM114-Status: GOOD (  10.71  )
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

Hello,

This patch series adds the dt-binding for PHY_TYPE_XAUI and adds the
driver support for enabling PCIe + XAUI multilink configuration.

Patch series is based on linux-next tagged next-20251219 and it also
applies cleanly on the latest Mainline Linux commit
aacb0a6d604a Merge tag 'pmdomain-v6.19-rc3' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm

v1 of this patch series is at:
https://lore.kernel.org/r/20251224054905.763399-1-s-vadapalli@ti.com/
Changes since v1:
- The commit message in the first patch has been updated to provide a
  detailed description of XAUI based on feedback from Krzysztof at:
  https://lore.kernel.org/r/20251227-airborne-energetic-kingfisher-adc4fb@quoll/

Regards,
Siddharth.

Swapnil Jakhade (2):
  dt-bindings: phy: Add PHY_TYPE_XAUI definition
  phy: cadence-torrent: Add PCIe + XAUI multilink configuration for
    100MHz refclk

 drivers/phy/cadence/phy-cadence-torrent.c | 143 ++++++++++++++++++++--
 include/dt-bindings/phy/phy.h             |   1 +
 2 files changed, 137 insertions(+), 7 deletions(-)

-- 
2.51.1


