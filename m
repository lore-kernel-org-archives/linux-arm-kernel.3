Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0FCC43602
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 23:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FfWNsPy7EpJlUreYI/8DDlbygBjKrfRuhttfKeg2He8=; b=X4r2jQ1txDTSFD6J7xHXCxkxSA
	9VtOqDhkDYzulP1ylK64ivTMlbB1q2sG1yPv1uvlnNYIKSvTW2/IypJuehkCUdtKAEnsiUlPjiTb8
	uSLGuZtbOFaoHEBDYU0sQVZcor8DvObYka5py42bBHAR3ECujGUMIKbB48+fFJ63o2Fa9zaohoI6M
	mONfOKSVPBMHD6kkFcZyUW52gUBsSU28TJEqB1IM66bTQJj+H022qgHaZJwiLZgFdOzixZJ4LVDGY
	OniAqY881r5XuqX6Bn0o+VnD8HuQLgvj5b83St9+X9AiISNhBK25th67Knjd4X1PX3fvY4dm93Ck/
	BkeGRY4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whFAh-0000000G0uG-3jVY;
	Tue, 07 Jul 2026 23:25:48 +0000
Received: from mail-westus3azon11011063.outbound.protection.outlook.com ([40.107.208.63] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whFAd-0000000G0tQ-2BoL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 23:25:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTYnJtacax3QiKfLg3C1ELGOD5mYILNdc9StjSkJBOU3L+QQ/jZEzyIY3h/irEoBQxY7+GhYrmB55ewMSZyVXp4UZ3FdYz5JdghF90gynOuigXsczMteO7rnBbdRKnLsE5KaiJx73hbMK88NToUFI9ddc/3+m+6yGzlRZEKlIBMXBd0Sw/xYOqRS1j9Sj/7qLYvWjTuxeC3mCom2gh3Jnrrr14zYsUD/MgIcEfw6scp/hbTI18JJbUwnbXnWj0Pknm9MPZklhTdzmWtqX5Q2dUFwZuzKBglcgrpUUCrVZ8id5tUv516vT9BJlhK2rztPg0BHXM1DMIY1zrDfUHagDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FfWNsPy7EpJlUreYI/8DDlbygBjKrfRuhttfKeg2He8=;
 b=aA/Zm3UypGazcFPw7DZXVpsz89OnygbX5CkouO8X5bQ5ct5shI5aNzb3w7YHkxPf1hmmo0d7DzxbODOihgAU3W5+1h7Ut2IUwrJ6ZhwRNDIwP2gPjyLe4S1rwI74EsbhRCep4jWB8/oB4AWC6nXJDDbaT3Y42sxVJD7C6MZ8mcx63A/Pg845xdrr0Y28wX7Swgw7AJQNyJzKWAjCb6yeY402WQ9ZltwBcKyP6BZwelo91Myuj5c9eRW26waULv4kYaVmBNsQesAfNVMFwMhHaD1dO5rWN2O942yEquETPdmI1R2Yn4GNHS1gWX5BrDZop9eIX7/MqbFe1dmkOVFWQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FfWNsPy7EpJlUreYI/8DDlbygBjKrfRuhttfKeg2He8=;
 b=ZJ6wa67rmRIAGCOuQe3chFxEyoB2mfdvrjqzJciYsFg3CbVYrAY0Wff6uWIheY4z2OD5mLnpkZN5+KKMJujxq17yF7cwysJQMFaO2kF0+ig265ssrqliyY6jwXDplDzI4sA+OqbkDsTeN4kETRd5Hcmest1llTU6XHtNTeORlDdU1Fa7tCqf9uPx2qVJ7hzjDMdrmjL7JyOZCf50kMTHzlBwN4KKJSM6iOW4diTqdiB3aLUzSaNEw6GVQ91F/2KIgEhuqyrJV6lepzyCwZGt+IkgqO3OsHUlO7usYLh6EuCxc+6tZAeZ6wS8YSLG7PhAVNIW6zrt3Nq6dcYqUXCxQQ==
Received: from DS7PR03CA0344.namprd03.prod.outlook.com (2603:10b6:8:55::28) by
 CH8PR12MB9768.namprd12.prod.outlook.com (2603:10b6:610:260::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.10; Tue, 7 Jul 2026 23:25:34 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:55:cafe::2e) by DS7PR03CA0344.outlook.office365.com
 (2603:10b6:8:55::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Tue, 7
 Jul 2026 23:25:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 7 Jul 2026 23:25:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 16:25:17 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 7 Jul
 2026 16:25:16 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 7 Jul 2026 16:25:16 -0700
Date: Tue, 7 Jul 2026 16:25:14 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Ashish Mhetre <amhetre@nvidia.com>
CC: <will@kernel.org>, <robin.murphy@arm.com>, <joro@8bytes.org>,
	<jgg@ziepe.ca>, <linux-arm-kernel@lists.infradead.org>,
	<iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] iommu/arm-smmu-v3: Detect Tegra264 erratum
Message-ID: <ak2K2vhIQSTNAPto@Asurada-Nvidia>
References: <20260609073204.1760077-1-amhetre@nvidia.com>
 <20260609073204.1760077-3-amhetre@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260609073204.1760077-3-amhetre@nvidia.com>
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|CH8PR12MB9768:EE_
X-MS-Office365-Filtering-Correlation-Id: 022f7aa6-937e-446f-01f1-08dedc7f0b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|18002099003|22082099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 6SCz2GcrtDYrFqs1W2WALGAi4sRgd2ZYHuamlsBixOH9atcE//jbtYvmgwJ6qZJkbE3mxUwcFj5KE+6Hq7n6LbgEg2O2+HI07Vf2TzlDAT/uYdZULXfM+k0QnRpN6J+bPirPMEiTxwMOB7zniAHtcF3+z9jZUJN1I6cAVhP20gqj8TuoPDzpQwLZ5eXStenU5LswLlg+XF6BQOOPn5oOP5oWAb+ykxA7PcclB5aC57fkgHsf3DgpdGzrlVza4srsAtitXcU7IwxsgNCoaf/rECHwD0mjArJCy4BrrPBtHNDuki1whQSRvygIwfDcsNuHUvnX2KcnaSf6SmQBtv8/dwYvk8PVv8EixpY+TbAAFflmUXW8vgK8opnB72m+9YfIJgTjxiGfifN0CZMaP2KAozJA515Nff2E/b3ebJdxZbE4Qzeach/bcpjSK6wqVFd77vMSjF3KyoBIqb24Exk6J8Z8nnpO3F/gFMhI158a4DFHkrFQr48qoLYx4rt6EpgsvR0iw1BjCengbKQFZ5RQVdTvVaq8pCOO+YWau8XvTjW47kNqsfLdyCCoCUvYcSXR+pldqFfoUIJZPeFNywIM4CpyqfBwIE0AwQ9kP7WWSozQd1igACUi3ouyQ8reRCsp3A7i1rRyBCU+ICi16hShlZzeekHEeqNcuvicgzNvTKXac9Hf5hMGKdub6p0jvWsWc+kSORPUdt7kbfcYfT30KQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(18002099003)(22082099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rcxWi+TXTG6+gPmOktpoWkkxED+pz1WBQYQq3Fza7Cgu0y3UqCqf0APtpL+Q3gtG8Re+JuloPsui39wMJxl0xsh37rxVMPZsHoeeXhD4C2JELICUtae8NLTDSShdkzzAI24rfV78GDkPcTJL+kxN29L/VmQ8gjdF0LwptORJJLsbtba/TXqHWbXel2qGbu6Kwv8/P+RD4wMegLI4jSlx+C38K4oz3t79s6ZmJ6ogtBA7e8DlcO3uzE/Q569Bo+u3+Fa48HDJtGK8fWQ58K2JVjQIyZyI6Hcfe7f45JA3g2lUiAzuB57NZUa5fWU7SXakmldUkBe7ERQRAT6z2wN3rIKZO+WFJ1KtciU/sY0xfTheWLJ/Wp2WsWOBPsAdep7wiIfxsHU+f33rZAnIbHM/4gzh7Uu5OYw5b3OTQSD6vWx06PaXvX9KMZtnPQuN0c9+
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 23:25:33.8099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 022f7aa6-937e-446f-01f1-08dedc7f0b2b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9768
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_162545_647978_B1F6977A 
X-CRM114-Status: UNSURE (   8.56  )
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

On Tue, Jun 09, 2026 at 07:32:03AM +0000, Ashish Mhetre wrote:
> +arm_smmu_erratum_cmd_needs_repeating(struct arm_smmu_device *smmu,
> +				     struct arm_smmu_cmd *cmd)
> +{
[...]
> +	if (!static_branch_unlikely(&arm_smmu_erratum_repeat_tlbi_cfgi_key))
> +		return false;
> +	if (!(smmu->options & ARM_SMMU_OPT_REPEAT_TLBI_CFGI))
> +		return false;

Are they redundant?

Nicolin

