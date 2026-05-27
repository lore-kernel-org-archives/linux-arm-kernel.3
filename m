Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2613CD5BD2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 01:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IXDTuPsSINrcQnku9IVJsAiLTfbSa7SV47f9hf4DaJU=; b=vCcxkS0c2S8ao9C08zo0L+/ONP
	woQfdsW3fNtT53DjPRRIk6rP2090M47VOzGLbz/XXBdwySEQ4ITlUvs12czoAGDYHFskoo/Q6HQqF
	2rDDb6FsMqMpNndOkDJo0U04qobTHPFnCbWK/JJv4YrpwWEdk1cVVxzc0OoozcCfrbykDLAdJgN/w
	tZYzvFuEqfxzeCT7Oo317u3Hp4hky9J+bImRY3XrTq+XAqB9pjPgJzBAFlj0Teg9RRmK/gxmUUwh4
	Kk/GZVvxysxivnVKS2EADW3rtEZNMCX46KSLo+sb01q67U456a8GZ5H7rK2yecG/H12HPdjyTpZ6I
	K+2pXNtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS34i-000000037hE-0uL7;
	Wed, 27 May 2026 01:28:48 +0000
Received: from mail-centralusazlp170110009.outbound.protection.outlook.com ([2a01:111:f403:c111::9] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS34f-000000037gj-3wQN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 01:28:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d9Ui80U6N+wSCxv26tNVtVFude49s8rJqjHRP2sMou98395JSReBPTsz2ml33mIOkRcxkmRm5kX5wBDG79OXMjQbbV+iRDLtHSfkFTMPNZG2NLBwf5VM9kJlSGCB2dJk8YGqExsXCAO13fqIeCuaz54QChncHb7jK3pMMK/qfgjmP4WYg9KP1MW/TMYNVCWp1DxE/My83Vn2Izr1XSasqdp+j8Nkbex+26qjJ60epdc7LR0h5mj8rjllY0S+9g5RGfxhbwYyvwNQ6ni74eqVFS7MfFGmExKj1Egs1xvYk0Z7IFLz0yF+bla+l0QXURvtjnjJQ9X9cR9XvNh/p//ZmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IXDTuPsSINrcQnku9IVJsAiLTfbSa7SV47f9hf4DaJU=;
 b=v8MgU+MbZr8aoZvZq5wrltERl774xpwRa/BdE6KNwG1QNPwKvNrpxtyhzLeUtSspTAIL9k9R7ZvuCA0htyzEWWr3bw0DVMFd+83+r1DQCwtwmUF+NOSlAhcoBL7cVMKUvDAtm0am76EYuxhfdgTGOg4Iby6ocgJy/n2Tcx/Gf5ZuyG9AKQ6q+Dpa470ng7xjExOP50pCEjSyavTWThFbaXfF/OOrr6vd5pid7z52OOq+Z7JHusenbhhR9e3MINACVZOb9pCFF4tEnme4VWnAhCrITl7cvrxoiFu8yTLMD9yNlvb1WF00mxSYDOgVz9fDZJjaT0xHBGYFg1Nt9aukRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IXDTuPsSINrcQnku9IVJsAiLTfbSa7SV47f9hf4DaJU=;
 b=A4k4Qw6/IqjnBlvU2mlKvuf5AYNjGF+DgH55PKYPPUwTWMzZE2ENp2HGZZ6MpY0ZQU8MB0zPAdeV4GFWOyzjnM7LnLGY07jVVM88NdCiRoyTDITZbtKzW9LOPczV5YrcVpCrNGbBxCYVHzlzHub2WwFFhDJqDmWMeB/qTSgs3DVScctfal/UwdQOxA3bFUg/vaEiN/Nyts04LU+IOpJCm5RK40ejXWAPffoNt+SxEUcrCvl98OEJwPIjOeddxYtRHAJGxIHIMXhPgm/s34butOuGfzbtmVTZKsFgF4ugK0cfg4ndAHOhEFnsJt+ieEAL3VuxRpCkuYv/lnHvk8Y5wQ==
Received: from SA1P222CA0121.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::9)
 by PH7PR12MB6564.namprd12.prod.outlook.com (2603:10b6:510:210::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 01:28:38 +0000
Received: from SA2PEPF00003AE7.namprd02.prod.outlook.com
 (2603:10b6:806:3c5:cafe::48) by SA1P222CA0121.outlook.office365.com
 (2603:10b6:806:3c5::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.12 via Frontend Transport; Wed, 27
 May 2026 01:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE7.mail.protection.outlook.com (10.167.248.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Wed, 27 May 2026 01:28:36 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 18:28:15 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 26 May
 2026 18:28:14 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 26 May 2026 18:28:13 -0700
Date: Tue, 26 May 2026 18:28:12 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Qinxin Xia <xiaqinxin@huawei.com>
CC: <robin.murphy@arm.com>, <will@kernel.org>, <jpb@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
	<wangzhou1@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <jonathan.cameron@huawei.com>,
	<wuyifan50@huawei.com>, <linuxarm@huawei.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/5] iommu/arm-smmu-v3: Add register display to debugfs
Message-ID: <ahZIrG4qtm+nid18@Asurada-Nvidia>
References: <20260328101706.3448655-1-xiaqinxin@huawei.com>
 <20260520063714.2440584-2-xiaqinxin@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260520063714.2440584-2-xiaqinxin@huawei.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE7:EE_|PH7PR12MB6564:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a8ada84-a0b5-4230-ccf5-08debb8f45f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|36860700016|376014|1800799024|56012099006|6133799003|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: qATAaalvJwoaRITr7sDn76cWPxueNzcU0ub0R0QBlHDmpeFYt/9WAhLCjBlZue0KI+C5HNehPHT+pcnw6bKYtC1f3VKxt5AX+Xw9OF+Phjg/E/jRB4fdPKzK8bCwX5gL9IQ4l782egnYi3FVPoWIINHA5lPgFlB+750h/CzugfQN25t0NxHhYMQja0tKDOqDLk13+okDUjIXboO+1sHbjdDvu71br6K3FDJSrOhCkfrOadCFKH1KgFJl4mpceh3LFD9zLMVwgJrCACqT5/Hh8S4FU0z7o1cii4fJYTGiL6EgdoHhr0hgXssEP8LI22fS9yG0KB6sgyPFFf7NMgc+6ZFIL+9TRH29xVCoAx7YkA14oeQ8jTtNIX7JZeRIYJ8XXNl5fzbjeU9eRYcTnfhBxT3rzcNMDOV+jWYItz/yIr39gPfMpU9udVr3snpzK6g0REUA5cUIlm7WnTItv93sJF3iXpQBpo6sNwTSFlblqqEpyhLmkWIQud+n4468/9MDkb+YuW7b7AwZZ/C2Dee9NFNskhIPKT81GyLMAEN+4UssBhtke815l67CILVA5+CCat+dyZLASX5DAqjtnkpkHqHFP9bNyPHhSV3nYJ00t1UOsfKTJPIsUlkkLuGjKkWz3o/Cop3SN9GHNAU5dhwCvQ0hh45g7AS1D6foqqnp5P6R0X8HiU4P/O75neLnjFRWIb3zgCY3TDpEsWa+eIsW8lVGTBa+ZdClxC+P25jFxzU=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(36860700016)(376014)(1800799024)(56012099006)(6133799003)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vhS57KBxp10iJVc5swgk0C0Vkdrt+OSkbiJjuMdPXxjBvXRCMr2f1P+1XzzNcZ2rUuIUk6FQkH54HFJ+gSnZbUhZxDPfjBYGvFedba4FCVHeXDZrvthkvDfgkq8ZfuIDTx7cBOhSj+6tKn4sXLIZutaIJ+QSVWLTeE7mv6mIVpc23beEsVC7OzF8flOY+oHv85mJFHDMx4CPsVksH4wr+PJKlHmYTaFK4ztXC7xcDQb3eUWK7/WH5sWYbBncdrh4exQzxfH7j40lq9/zmfQLMZ71w0T8pGMXMQ4DKKW4yzayLED11co929tynhnhfJzksA4KVtt9OMQk1e+Rb/XTeWUHGz6/CPVjxNOePlh7bSnVTpXeYkg8U5OKwyqO3fGOM42tRWN8s8/TTRhMZSpj3ROu5YUdjsv6oNo9s2jb1W6gHwV5Zjfw8CLjojHhKS4C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 01:28:36.0330
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a8ada84-a0b5-4230-ccf5-08debb8f45f7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6564
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_182845_988835_5DDC8987 
X-CRM114-Status: GOOD (  12.56  )
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

On Wed, May 20, 2026 at 02:37:08PM +0800, Qinxin Xia wrote:
> +static int smmu_debugfs_registers_open(struct inode *inode, struct file *file)
> +{
> +	struct arm_smmu_device *smmu = inode->i_private;
> +	int ret;
> +
> +	if (!smmu || !get_device(smmu->dev))
> +		return -ENODEV;
> +
> +	ret = single_open(file, smmu_debugfs_registers_show, smmu);
> +	if (ret)
> +		put_device(smmu->dev);
> +
> +	return ret;
> +}
> +
> +static int smmu_debugfs_registers_release(struct inode *inode, struct file *file)
> +{
> +	struct seq_file *seq = file->private_data;
> +	struct arm_smmu_device *smmu = seq->private;
> +
> +	single_release(inode, file);
> +	if (smmu)
> +		put_device(smmu->dev);
> +
> +	return 0;
> +}
> +
> +static const struct file_operations smmu_debugfs_registers_fops = {
> +	.owner   = THIS_MODULE,
> +	.open    = smmu_debugfs_registers_open,
> +	.read    = seq_read,
> +	.llseek  = seq_lseek,
> +	.release = smmu_debugfs_registers_release,
> +};

These seem a bit redundant; only names and show functions are
different from the cap's fops/open/release?

If so, maybe we can mimic how drivers/usb/host/xhci-debugfs.c
unify things (refer to w_context_files).

Nicolin

