Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD4BD1A632
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ss3BqGs8NT8r2YvWVcNWbvuegyBKD9tcMNu4DJckfyQ=; b=T4wPuCTyypMocpV1YezDit/bc8
	bRMxlpkGEdUA/Kl7au4u5aA/CErFlwJKltF6jNRmMBNKKvfCwkbzoVVTw/YKhvj7B8VDrMmEBppWr
	jtgg6dughZdCiCNyGBnbOh1BjBgceDon2mH9R0JrmpDOW7INXVLaDnON+Pckvst1ZMBJuzlOINslr
	/i8Oa2LxwnjyerUkuAXOYB6yXNJ55712Aj4Z7Rp5KSOrsDvh3PupHiQbWKPFgAAvitWWmz3Or8Mpj
	5E1Pdn+bTCyowSPc+Bx2BztnJJipkvYLtBuIHDK88mcEt2lkqgDLd2IdJfj+L7Err02CU7L6HI71b
	qN3t9i9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDco-00000002Q6B-04Hy;
	Fri, 09 Jan 2026 14:38:02 +0000
Received: from mail-westus2azon11010016.outbound.protection.outlook.com ([52.101.46.16] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veDck-00000002Q5S-3w6E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 14:38:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY5zQWDFmIPfwD5cpZuqM4SXyWml+/9SX6vhLAlwhVoxp12RsbIG1/0Ge5w9hymPXDqMpTg52wMkRDzquG/YqKZ9RhHD42e4mz1KsNOvnlX70vQvVLjENWlUukk2bkZNrdIltyyGMJ+Y3I2b4bdErkkIv+WFCiC3pvF9ZVKX2FDlptRSX2oqDwMJ6+Mtx5cadXhRg05oqsRSS7Oubevmm5wl9JDoBLInQLbfblyTE/IaLMjwPpo7wI/t/0CTD4Mhe2Oy6GWUh1IbHTULWvy5ytT7xDKSqc/XqsBEDf7C6WcYAkIu6Gm33g6YPi71gIepAPRKB8EMeBUHs8a3wBx8GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ss3BqGs8NT8r2YvWVcNWbvuegyBKD9tcMNu4DJckfyQ=;
 b=e/qP6sCxXnCgMzbo8/K7Kxj+Q4Rd/cxbll9TtMZgU1v4n7xZMNdevTuSwYlO+hY0bGzx44Nfvrve8hw1Y5s2X03gDaPvruS8P8Z7v2q/FOE8YTWkFdqytxH30v3GkpvbkN7Fw8w3U5lV34kPm9/4atu/P/tYTYlxrDsdzIlHMDE832J2va5uasxYBg7slpNLTyKidDyboGnNG0CutB9UruChLB2f+J3fN1fFzTq9hJtnJppwWG8eCQjErqFTWqsQqwV90LqhwJ5SW59rBVhXomlESFuUivPXNby22kfBDShKGzMB9EpbcLOH7KLzYNzDYXKE1+YdfD41K8I2AvpW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ss3BqGs8NT8r2YvWVcNWbvuegyBKD9tcMNu4DJckfyQ=;
 b=YT6xjdZ7jIE1IUPVzLXDumzcau+5qKV92VGfB8OBk0+uVqlRoUEKbTKJJ2a0rEyT1kLcJuEN94HJbrrO1IZgX+Is+Plds5U4crglXdzEcZdsZrZqhpzFQsxi3x6Tf85WV9qDwDi1uYoF15Zrw0ZVC0m8Vvmur0kzg4p5lxao6y4=
Received: from CH2PR03CA0018.namprd03.prod.outlook.com (2603:10b6:610:59::28)
 by BY5PR10MB4273.namprd10.prod.outlook.com (2603:10b6:a03:205::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 14:37:54 +0000
Received: from CH3PEPF0000000A.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::ef) by CH2PR03CA0018.outlook.office365.com
 (2603:10b6:610:59::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.5 via Frontend Transport; Fri, 9
 Jan 2026 14:37:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF0000000A.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 14:37:53 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 08:37:28 -0600
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 08:37:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 08:37:28 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 609EbSDN195014;
	Fri, 9 Jan 2026 08:37:28 -0600
Date: Fri, 9 Jan 2026 08:37:28 -0600
From: Nishanth Menon <nm@ti.com>
To: Abhash Kumar Jha <a-kumar2@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<conor+dt@kernel.org>, <krzk+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <u-kumar1@ti.com>, <p-mantena@ti.com>,
	<m-chawdhry@ti.com>
Subject: Re: [PATCH v3] arm64: dts: ti: Fix the number of common watchdog
 instances between J784S4 and J742S2
Message-ID: <20260109143728.pt6vqt25sylmm4zs@frown>
References: <20260108085347.1416637-1-a-kumar2@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260108085347.1416637-1-a-kumar2@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000A:EE_|BY5PR10MB4273:EE_
X-MS-Office365-Filtering-Correlation-Id: 893260d9-b1da-494d-345a-08de4f8cac12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013|34020700016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TLhoFlRJmdJZbZ8pcfVoHltDW5f5p2vQ4xhSDRee4hYaUMOaiEhA+PQYTiDm?=
 =?us-ascii?Q?QOshHVgLhWqM8CPsKBpycild/bCdpiOFNi93nZ32VDt3+uvuiZSms/98DApw?=
 =?us-ascii?Q?4VoYEF6L3DyArvOamLtY7yZRR4UNRSqI4vAlM4MOWSoh50lHUnmGeID/7N2f?=
 =?us-ascii?Q?l4dk/V/QcroxdwvhBaGX4QVrAh7+Iy0kaAx1N5ElDeGYItOVYOfYYsSfSaqv?=
 =?us-ascii?Q?1k9C1jfVTE+Nkdfy+uJybzw/RMsnk7L6Q58e9RwEu6YT7rtbmGezZ/stDzcB?=
 =?us-ascii?Q?iMlE+kJwefAc2cr6qFNj8CYVwKHjFBe4tF6kgvUSYuddUmwWpkv64jK4D/t8?=
 =?us-ascii?Q?KfXeu1mmCXhVujpPV3t0nXWFOs4sVGOGiq1a7QO1CJogyH09lI7DSuwvNiS3?=
 =?us-ascii?Q?oDotgfq1pplUSlibOFrKei2Is5hKrVTRgjsn4mKkJwFaixP8rDHB2MXvKqlt?=
 =?us-ascii?Q?t04F8oLCwaBmDf6y0If2yg5v3rPeScdCmeMP2rIY3OBchyiXLKiaDo3/ta01?=
 =?us-ascii?Q?/rXBx3kvHn0g1rpZUGOWR/h3Hdoiu1r3dUVWR342cUmup84Y99i6HyrcnqkL?=
 =?us-ascii?Q?0LLS21POLNcHYq+y7pOJrtc8EKH1t7Q11FZujQ9x4JMP6v4kA1iE3HuUAumA?=
 =?us-ascii?Q?hu7oeBC4IG5MKM1BhrcMqZjENtlN7uI0CJpxPYGiKpmRSfBkIsAt8pzqNiun?=
 =?us-ascii?Q?gUVLQOUPnbGYdjhPBItRhbLsdKiValRAiOzqTwjrY5XAGYs1gqTqPj51U80K?=
 =?us-ascii?Q?mVbQAGpKXDz78tEO21EaHmc99ufoFBLa2nCAW2raFXBXWtcRwdvm5nbwhkhf?=
 =?us-ascii?Q?pkd66Hk/RQOaylkf0VWdtNjNfqVj/umI1qKTC07s7VSQEjEnu6XM+6OKImw0?=
 =?us-ascii?Q?2oP/LqALc3+2jvhPxG/Y+FvKEvFmgluolYooLRt/c/XCy39tT/dh1kn8ucx+?=
 =?us-ascii?Q?VW9vr1F+HpSOcw9rdESxhO8F+EoRZXJ3DW2G53lQqp07iR4+V0a3v3U7zmyI?=
 =?us-ascii?Q?GhNqOyRJdFR3SjfnlFUFY3XpHWFfBChvkd78dRn/vEoc2UF2p5JLooOK6ZA/?=
 =?us-ascii?Q?1TTcH63OiXy+Kd2Ah7zwaRzbfLw1nyxlcPcu/ePVDMHlNjEeHS+qpJGCjCaM?=
 =?us-ascii?Q?Sfnu9NDKalMSx1p+2BrqALcgC7Y3UD7B6kROcSu7gZAdueVfbr0pLg/E/q0c?=
 =?us-ascii?Q?O3OwMrizzZsNcJ4zeCh/QQgu2nkp6ZnLLzXv1+mKtlKg7jXjkJVASbjiu/mo?=
 =?us-ascii?Q?rJQwlHcNHf/LVNqecxEj6PjdbqTr5BvCRMRDMoCjr8aXcNsyeUB3eNGvuiVU?=
 =?us-ascii?Q?QJBq+0nNubdlGeXkfyjQtLJRwSZlcz6KM6/11pFX5WuF5a5mqGkUidgIjaO0?=
 =?us-ascii?Q?24yu3Ra/Us3iVwUKntOdZtgPj4ptoOEMyNwi9SxgylsDBLosFc86u+KUojqE?=
 =?us-ascii?Q?3eOAZcXuZWDiw6qyVJe9OGhQ8ok5u5HmajUwYgwFaK03j8bWVWZGL3yz5j3t?=
 =?us-ascii?Q?aRp8NKNC8AKbV6igHeep92NNZ4vJtHpT7XkC5EIomwpDtsxzvpK0DsPn/MOb?=
 =?us-ascii?Q?1NCQ1NQe9jBDm+9uxI4=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(34020700016);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 14:37:53.3130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 893260d9-b1da-494d-345a-08de4f8cac12
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4273
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_063759_063734_3398F7B7 
X-CRM114-Status: GOOD (  10.83  )
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

Few suggestions:

$subject
arm64: dts: ti: k3-j784s4-j742s2-main-common.dtsi: Refactor watchdog instances for j784s4

On 14:23-20260108, Abhash Kumar Jha wrote:
> Each A72 core has one watchdog instance associated with it. Since J742S2
> has 4 A72 cores, it is incorrect to have 8 watchdog instances in the
> j742s2-j784s4 common file.

Each A72 core has one watchdog instance associated with it. Since J742S2
has 4 A72 cores, the common file should not define 8 watchdog instances.

> 
> Remove the last 4 extra watchdogs from the common file and add them only
> for J784S4 which has 8 A72 cores and thus 8 watchdog instances
> associated with them.

Refactor the last 4 watchdogs from the common file to J784S4-specific
file, as J784S4 has 8 A72 cores and thus hardware definition requires
8 watchdog instances.

Additionally, if there is user-visible breakage seen on j742s2, will be good to
mention that as well.

> 
> Fixes: 9cc161a4509c ("arm64: dts: ti: Refactor J784s4 SoC files to a common file")
> Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
> ---

[...]

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

