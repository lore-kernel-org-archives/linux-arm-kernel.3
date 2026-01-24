Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E50D77898
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Jan 2026 00:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oh9AfwfPogxoVqa5n0P3hPsUYysQN2lJsTzrAo+SMtw=; b=nBPXk+H44+2MibX9lMapsxy6x7
	YJkrMxOs5QkOgIfXbfbMnxKYsiSdxIl7hsgHpF71HAz9tdFh/LHieVf07meyVUzazLTTWFyg0H9le
	8sn1GqvgokQhmSilSB/KjOomjq5oTINVF2VdwvVFncaDGLjZuj6Y8KzD6aBVE+Db3Ma58xdsm43r/
	krqO62ZPc3gcBr5KXqHbkUGi9MWHZCZq0V6Z7/XIslKuCt27OI591iypF0xP0vII9ESqKVMt4vnY8
	KFcyUyVrwmAYeNHKcgfJZ5rL8esFsBUrGm3Jib0Z0c1y0hIGJ19I6pbNnW3urGMt52Qz3hj1guGZf
	XlwhMCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRao-00000009dYM-1jzi;
	Sat, 24 Jan 2026 00:33:34 +0000
Received: from mail-japaneastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c405::7] helo=TYDPR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjRam-00000009dXw-1aDb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Jan 2026 00:33:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAiPskt6LsYFZNv1p3gBoYaytveZIzLJ1/SfUbKKdI9jZCUmPYatqIiJcsMv96X8iRs1xKvgzXrjBtRCf1XxDSs3y6B8uDyrjQvVHz0552sgSQ07C6sx8Jg9Gv8m4VPLS5UJHyeor8G4uVc1eQ2AKFuHHxhBQPt54I5nfprsKEOyiyLT8xeevMMYXX0Dj9Mc3vQ4D83uNHYp8L/oo7O+0VtthYBWbgw+uhjKfNy/1pQA71xIOE+3YadNvQy+epOzYo1GP1ZfF6GmlT1rV7gDh9XvEEkGfwX9NpKNuvGj6rD/tpEM4VHnS1hutc1g9aFrm5/1Vhq69GzWVmmrEnyM1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oh9AfwfPogxoVqa5n0P3hPsUYysQN2lJsTzrAo+SMtw=;
 b=DOU5Y61ewcsN2zWvf4wiFNh15Gg9K32nA9jGZesHW70x5k20wJCvFPQFB9hKMz6xnqSv/Tgs3Rb+rLy0Nm9QtJbOv6hXM/Ge7OriUPTq5+XlqRCnr/LVXgV/9BHFiv5xTweZQ7tYh26x1W43yArKkbpJOsZze22y/JwcetgkFl+cTfrVQJq2lqGofDr5LUhxCfAliGmnmpqyeW8VReg/za65Abj1/RX5V3KJ/tZkQUkxLRcnTWAMZ2Df6DdyD6L9IKl+2LrJIVkoXeNNxWo9oV+svbTI5YSBTG6quFg8pvnjrsCKMk3HKy33ZWMueQUq4FsQztRQQ1Q87CWGiQutVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR06CA0010.apcprd06.prod.outlook.com (2603:1096:4:186::6) by
 TYZPR06MB7169.apcprd06.prod.outlook.com (2603:1096:405:b7::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.11; Sat, 24 Jan 2026 00:33:24 +0000
Received: from SG2PEPF000B66CA.apcprd03.prod.outlook.com
 (2603:1096:4:186:cafe::f4) by SI2PR06CA0010.outlook.office365.com
 (2603:1096:4:186::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.12 via Frontend Transport; Sat,
 24 Jan 2026 00:33:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CA.mail.protection.outlook.com (10.167.240.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Sat, 24 Jan 2026 00:33:23 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id BE2954350700;
	Sat, 24 Jan 2026 08:33:22 +0800 (CST)
Date: Sat, 24 Jan 2026 08:33:21 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL 2/2] CIX dt-bindings change for v6.20-rc1
Message-ID: <aXQTUSoTPg816bfB@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CA:EE_|TYZPR06MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: a1bbc136-21dd-43e5-c867-08de5ae02eb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OX5LlE1J1vd+1uW/TONzCnKYQJL0g8ohRZr88S3B0ZGNwX2OzmMmKkLClk15?=
 =?us-ascii?Q?vjIScCopjBRDRZ+rK7CE9OvznAFNBBUNfBCAcyRgg02guhFhIcbTDyBRYeKU?=
 =?us-ascii?Q?Pja38ra5m/0G3j0/jB09QF8wwbkCCuEFi7iKhMfKqDPTyNiRLeFmPG0zwloK?=
 =?us-ascii?Q?pUHCaJUcss2hiCJAAXbH+M2L7+LwHFhVEVlHj+TfEagdjEv7X9TlT/wAtUVe?=
 =?us-ascii?Q?epeuyknpCYjNFHhXDbTURn0YrtPDMCwsWZZqLnRizqITreqyyK8icV6f4bHo?=
 =?us-ascii?Q?4E8vhj6FzL6/1JXeLW95X9iXiIWCnzrDUsjJToEmFxIoPNojZ2oYAGx1xCSk?=
 =?us-ascii?Q?Jvu8pRNw3oCGwUHNmtREoD0FbU3eLT5q9RNxTH9XABFkHUvkzbiupB0JofCz?=
 =?us-ascii?Q?HlBCrdMDJCDjhTSqS0clkjKFtVKWc+Z5t3fI4E74/M4171iNj9np01K7mFxG?=
 =?us-ascii?Q?XVrw/fELrOnNRGEdgxAyEHTr3fs38Q5I7VgxvnU7HowVN4E1BXTSeDLcfn70?=
 =?us-ascii?Q?j6b0s6oeA8+OAJdVZ7o7PXVfSyCZCZMmMCoWCjfPUyYs5eKbIXHBjFSZeN3e?=
 =?us-ascii?Q?2IMwlDHg7vyCvDkJ3NdWZsHsilJFgHvRVN7Iv+95aL825Z3lqOXHB2F/XBxV?=
 =?us-ascii?Q?nnIDrKqUMHIU1mZ3VSyqOmhwnx/Mm6wJvOZi+TZeTaVT8m6ItV0/iK93g0yI?=
 =?us-ascii?Q?dJpxVtW0OE+S5eeJtkJFgalZEQ+B2Owj/+sx7svn5TPvpbc5DTRUJRg8bd3Y?=
 =?us-ascii?Q?TD7QoAL+4WrMJM36k/nl6N1ycNLDX3bkpwLeYDa4eWv+UK9Kthw1Y2O9eulg?=
 =?us-ascii?Q?+LfplW5dd2lvrCZ+Jq/fgEuIoQmHTBAX//sfnYSTKJCz2USEFEKcfZLf+Fbd?=
 =?us-ascii?Q?4setR9J6g0NaCLdsyOw0Ob8WfiQmAy9ex04pKo3X8aV36zdp2QTB6UpasDly?=
 =?us-ascii?Q?eOhHNgnaBhoYoUw+Gt4Af4DwHW6JZxd8Ea2njzCSJumH+PKbSVZe8JKHt2NB?=
 =?us-ascii?Q?1XJMhsi8tvA8jZl7nJHx7+J1vLjDNhvH8e83vgyypkS34jb6QtPCnAlGdUjl?=
 =?us-ascii?Q?iCBwt4gOVIoakYNuBE7TrwQwhfkWUroXEuQLImv/U50yp32TcgyN6jHqF1oy?=
 =?us-ascii?Q?PB+4aVd29FN1NhXelDI4FjzFNsUa+fxZSvzpf2D3UnFloQ1FMqgIuq/w92Ea?=
 =?us-ascii?Q?/rKb3pxrLEiultXQj494saQeiQfMeLYUqTHg0cstGTc/tKSa5euIXvYC32Or?=
 =?us-ascii?Q?yGmC8q9luyWEXUOVr1jbKuSj9Qhlvzt9G7kxhgDhpjmRuO0Mwqq1pHjCH3kJ?=
 =?us-ascii?Q?uh12tz55Mt2bP+DPg0I4hIGEOmHMkI2ydYdUZZn1AnyUZu6pcJa8cG5PF639?=
 =?us-ascii?Q?QhPge/QJHe2Jta8AS2L/kmn1A1URaPgiRqMPT/y89xI4QuaxLZV34ypD32Sp?=
 =?us-ascii?Q?mSWVHZqr8OCwBBrQvFmIxSa90CT5KZdtnqMjT1ZPGRbFSb1EbSl6DKP1LQdO?=
 =?us-ascii?Q?a44yvXLyivSdxmnnF/cGgxTA5Ie9PtXyS5SE6I0EdhR+feu8nmmocIO9zbxi?=
 =?us-ascii?Q?esszoX4g6JHUsEoRJhxGE2gzrweSrPlcWwEpt2q8I9Fh+avcwiX/a6/m2uI4?=
 =?us-ascii?Q?yniNaH9TrT6Lg8b1bAdIPfTKep1EdQbdkT0BYWUe6MwqxUfzJTqS6U5pgpoE?=
 =?us-ascii?Q?dKdmyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2026 00:33:23.4212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bbc136-21dd-43e5-c867-08de5ae02eb2
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2PEPF000B66CA.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_163332_415129_DC1EC07D 
X-CRM114-Status: UNSURE (   7.26  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-dt-binding-v6.20-rc1

for you to fetch changes up to 01a08fd967301e75b2a9350b28a3f09fa2c3b838:

  dt-bindings: arm: cix: add OrangePi 6 Plus board (2026-01-12 09:08:12 +0800)

----------------------------------------------------------------
- Add OrangePi 6 Plus board

----------------------------------------------------------------
Gary Yang (1):
      dt-bindings: arm: cix: add OrangePi 6 Plus board

 Documentation/devicetree/bindings/arm/cix.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 

Best regards,
Peter

