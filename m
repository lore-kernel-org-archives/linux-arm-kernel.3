Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AC10E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23xOGiDXy6NYcLE529NavOt7dzjIrFu9Sh/1RY3aUZA=; b=z0fA4z+fJt/h2Ve9a7OVYwT0ke
	dwGSUWi9MK3YpdZRVUCl2kNhOV2R+/J5sVW/i4OqL/AY3hCbRJAMwyqRyZ1xcRQs188GWBdOcDV08
	dnWEgJPKbzYYvuRCVDS65tgbDHc2hitn4721IjGJ2footVUVJtZGzzmkRvpzoeRs8yOF55w240jn3
	YdacRBvtjiQVoeGZepfYztZPHjL9xcg+xojciQ8o9hyNjoqfhHFgAbECgvnRSjP5iwjWnvZTlijPp
	FBfNHd+GMNC5gXBik+HT+SPfvvb3BI7JC+nJJzQm7/t4GBKXMtDzL5DRaIlCQT8nNjVKWEjNhzaN5
	wlf90S1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKj3Z-00000008z6f-1t27;
	Mon, 09 Dec 2024 19:04:33 +0000
Received: from mail-dm6nam10on20621.outbound.protection.outlook.com ([2a01:111:f403:2413::621] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKj2U-00000008ykA-3lVr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:03:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ogUGQ9VtCbaC4yMi+rlJSoT8BVI1TX7k1odJIwHhLz5PyoVIs+4YCM0M5k1nIRGAq7mSu+jTX7mbU8XfheGIBbo1eeZHLwcphgw9tchv3hwkH771iy9ozwK2AxEieMqqgGuF2ROwlltAP8RTRW4XAky3uVaqV0HWClM0+Yxlg7H0mZ+HOohydmqgxcbXoJTkGc3SAaniQjqHhQk1NnPht0B2pB+ksTwqg7sZWhPr9IQEGpdBPEjN2/JDohMCu1yo0skPTMTsuWLCfelC0QSv4JgvArQCropSp/haspiPLMAzgujMsELAgwLAEsjmYbvo1KoSZ6ed6CiCjFlLuqRZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=23xOGiDXy6NYcLE529NavOt7dzjIrFu9Sh/1RY3aUZA=;
 b=yqRZmqSeP10NeeoH79GDKwbaPZiews6w8yy2Dvj22d/rw72Lx9xzhIScjRP9YchTOlRNIUb6zbDgw9M1ZrflROiOPea9dFMfh/T5CYelBP76d9MBZL1GpY7LKhSBu4O/QzaYBh8ED0LBneU5iWuPEu4lOcMEZAWYr7FMeiASzHLIhRxyADTseqvNBLMhptYX57FsYRXtCFm7sM5SBGPvAVpJP33PWV1i16ahrTPSrF7RuTS+EshTP6fKo/bWdOExMhGTArl7pa9HcgW+uRiFWkwDoH1S40hx/U2V2uwwtqEMiOn1qssnRD2FetTd6hUSFGNJXOKDV+7niGQD4ENwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23xOGiDXy6NYcLE529NavOt7dzjIrFu9Sh/1RY3aUZA=;
 b=HEPNurPeXzKmutiubwjAjjwthunpCLFEM0WGc3CgBlyCKl1k0P80cViwjOYkKCOgzUSILax8vaSpcuLkbf0ebagfw5vS+azkPLQnsur2rVBXPixeG0WyLQMi8k0FvRcviNycikzZ5sl1BrinaXLFQHIyur4sx3oKvYaqeMoR5bjsx7ZBXG3K+WmoKf+qB9tcxNQL8vXrWAB34CYvObsZMKr7Zj8+Mlb8kntMVanqacdXAVsBJnWdKrZVbvR+7t0zHHRqpVsUu4vbYCwu6RFsQsgN6bYRJe8P0Vm7lRXHlvfnHm0J+UJAIJNFJqU0hShmp6PI7ml7vSHm6qz+nQrP3g==
Received: from MW4PR04CA0209.namprd04.prod.outlook.com (2603:10b6:303:86::34)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.24; Mon, 9 Dec
 2024 19:03:19 +0000
Received: from SJ5PEPF000001F2.namprd05.prod.outlook.com
 (2603:10b6:303:86:cafe::d2) by MW4PR04CA0209.outlook.office365.com
 (2603:10b6:303:86::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.13 via Frontend Transport; Mon,
 9 Dec 2024 19:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001F2.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 19:03:18 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 11:03:03 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 11:03:03 -0800
Received: from Asurada-Nvidia (10.127.8.11) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 11:03:02 -0800
Date: Mon, 9 Dec 2024 11:03:01 -0800
From: Nicolin Chen <nicolinc@nvidia.com>
To: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
CC: Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy
	<vdumpa@nvidia.com>, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Jonathan Hunter
	<jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<iommu@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-tegra@vger.kernel.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
	<linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH v2] iommu/tegra241-cmdqv: do not use smp_processor_id in
 preemptible context
Message-ID: <Z1c+5dI7fibEZZ/h@Asurada-Nvidia>
References: <Z1L1mja3nXzsJ0Pk@uudg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Z1L1mja3nXzsJ0Pk@uudg.org>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F2:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e0dc13d-8373-47f6-5e44-08dd188424a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|82310400026|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o6LKtvGDr6448uq8sOsVuQF6SebQb9+7w7BXa2GSvu2g0XvLny+Fa4m0onaH?=
 =?us-ascii?Q?gB4KgIc3Fb0GT3a9WzOp89CMaaJUGlZ0lNgyD2BJRGqAppRpTE/SilAcGuaM?=
 =?us-ascii?Q?b2uT15/LNsJOQLxtJr4sWYJoDLUKD/8VzccGfwdQgIGtIEny6tNTqttXk3Mv?=
 =?us-ascii?Q?MS6FYbYAfKEJx99sNSB4TUzVHrEN216Clsx1eVsc4OvVEfgxH5dIkGaTAb/F?=
 =?us-ascii?Q?EaKEQz1aLrGM0Q/LXLREX4TP9I/hwsqMJzqW304aiZ/EH8YRbOXfXgbcUq7O?=
 =?us-ascii?Q?ClzF7Qp0XdMubS1ntqHEea+JlwyPH21t/SehBsg3dPVqzj5V3k70+AKUJ+Jv?=
 =?us-ascii?Q?8YGiYzUSu6L6zqdvZoZio/gBmB38ZkhurRz66MA0oO5QxrbMp6IJYmQtmDhk?=
 =?us-ascii?Q?Et7ji9avW15BcyaafcX5xGTO9FA0ZEohILTlWlemzzHUvs/U6tdG0LlNdU6v?=
 =?us-ascii?Q?X06/hq2ca+QZxVdTmin5MMyS6432WINW9RzK4lgBTj71LF6PqqDcZx/vQbZ0?=
 =?us-ascii?Q?i3jZ5yINhjUzOAdFe0vHQHrTl8V4PhHQH6vx0AulGuvHQOVGXIPDkV4HgQ7T?=
 =?us-ascii?Q?2tOtLoeXu9K/Wx8O10bIhNbqh2nyP4+xxcj8tBwNoIQErcHpbdtEa0lJZT5d?=
 =?us-ascii?Q?3shmtCzGNJYGmOgn0TaVCL3wpuTr4aInAJ6BZ8Vq5nCE+ZqV0/Z6fodF/OMg?=
 =?us-ascii?Q?CHMU4oJGrwe1Bx8W/L8tOpzV3M7uQOZiRTp1NywGAPtgujFpI2cI+0Hyjdw5?=
 =?us-ascii?Q?0hm8YbHMPtMxtowXAsKuUN3SRPhxekmKOHAqWTCi9sT9mTZzZs3Jqy9RZZOt?=
 =?us-ascii?Q?BhyK4WRw7sSmJZUHEvE/U6ERWuVchIM7cUJ8683qsI8p6XxoHgpTSwn+yL3s?=
 =?us-ascii?Q?d0pIVk6kpwWuJ055ia28/rVLMknuljtKdDcruiZCqm0qihoxSiajWPLYaTvV?=
 =?us-ascii?Q?nlJQ1Bdl8HyOlcXeY5w5vC6ZUGA59/s/yrOspSel8YO3jpodYK17+k9rFREI?=
 =?us-ascii?Q?Pi1xfZCdg1MBtsnaIaX5wMXiPJgYp+8djL0psh16gYH0TMW06rea94SNia2w?=
 =?us-ascii?Q?lCkRHZNCm3VWlT7g5QspJ+9LHXSP38upsqwQSiGn8yz2VeBfQKW0RK6tArWl?=
 =?us-ascii?Q?jB2HU/22IGu8RwGqNiSbNdo8vYD/7EmDYVrmy4dr2Va0vaVTIc2BK8XnRz4O?=
 =?us-ascii?Q?Gb34fGjy4tGGTYs8v6kpiSBITwV7e+If6RAYBHXz+q49Ggy7AvUwUTPcBu3g?=
 =?us-ascii?Q?O1V+F6e+jpTE59RcrvfFQfcZvt1pUQSelwKYnjR7PvX2l6KVb/pE5Gm0qgOo?=
 =?us-ascii?Q?+zx62pSWqFnBiWqvfaAsKtM5YpgQwzSbe6AEuQWbA9RWhM/YyT76DrJ1QF8J?=
 =?us-ascii?Q?iGgUFP17ZD0RJcrqSAsfxDCPI07mIpJz7RyaoN9sDQ+yHlzD74Se71CITk9G?=
 =?us-ascii?Q?hoLgF6u8dRyT+8vGwcpLP4DtjLlat4bt?=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 19:03:18.4729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e0dc13d-8373-47f6-5e44-08dd188424a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_110326_935821_3EF45CB6 
X-CRM114-Status: GOOD (  11.88  )
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

On Fri, Dec 06, 2024 at 10:01:14AM -0300, Luis Claudio R. Goncalves wrote:
> During boot some of the calls to tegra241_cmdqv_get_cmdq() will happen
> in preemptible context. As this function calls smp_processor_id(), if
> CONFIG_DEBUG_PREEMPT is enabled, these calls will trigger a series of
> "BUG: using smp_processor_id() in preemptible" backtraces.

Confirmed the BUG prints. Should we CC stable tree?

> As tegra241_cmdqv_get_cmdq() only calls smp_processor_id() to use the
> CPU number as a factor to balance out traffic on cmdq usage, it is safe
> to use raw_smp_processor_id() here.
> 
> v2: Sebastian helped identify that the problem was not exclusive to kernels
>     with PREEMPT_RT enabled. The delta between v1 and v2 is the description.
> 
> Signed-off-by: Luis Claudio R. Goncalves <lgoncalv@redhat.com>

Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
Tested-by: Nicolin Chen <nicolinc@nvidia.com>

Thanks
Nicolin

