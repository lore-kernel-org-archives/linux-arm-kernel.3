Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070FB106FD9A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jrrfbt+aPwTJl3S2dXdhP/gYSXsX/+vnfO3dsa7ZwkI=; b=zfLlaQSGmI5mY7EG4bwkwMKnA+
	AhzyvtlPv13+Mzt6D06lAnHJQFN/jDw04L1MIOK9KzClBO/7qFYzz6PYch0mGD7bhxBAbJD1sXMyD
	iK8+zz7eFn8w3eXqGYL4ckBhsp3dwY22mO4UfV71ln2kyqdEMHBASd4l9l9XM3QWsKjU1zHmLZ/Fs
	b32RM1jQO/uH6/jhlLggYNMaI2R0nyX3IcRE3svT4eBL70kgGJTHSkwxebf28E5u+RpnWGMOMxs1A
	Wjbf1R6mLsm6oYVruVz5aksc0LIb7AHCLeJbJYNZhKBrADkWIwOymB3EfXoStT3t8ndbk9xM3ofSQ
	3a0votxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xDu-0000000H6M5-02hw;
	Fri, 13 Mar 2026 07:46:18 +0000
Received: from mail-westus2azon11010003.outbound.protection.outlook.com ([52.101.46.3] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0xDq-0000000H6LD-1rsu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 07:46:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEXcQ+BJsPCadkp9CwNBmO7r0BoMaXINp6xGhzxqZDq6MLQEIdD2NgvOx3oV/12RC5vqfwGmZhf4B2DhNqd57MJH7/yN31Zbt1SW/0w6+gulVVew8XB4pzEgnGADWIYHPH/Jv6k/4MJV122Bk9RdoirSkmIm+o05bhfLP1o3b8yiXxpG7UYhHoKWddsd6hpit8qNNgccW8FfZDFvnB75g5mir0nhTdg+2bJhuJLcwE+am0eSkQFjLL56etEEFRfiQXN6rByQyrDmxGsDpvcpC9Z2MIqLtbBRgeXjC89SIJE+HzL2E70mWxeCVBTBYxKDhh6a3duEUPbacgG5sMQ8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrrfbt+aPwTJl3S2dXdhP/gYSXsX/+vnfO3dsa7ZwkI=;
 b=oTRwmd/7nD2qk8UiqNH0vR3GVtvEbdpe0WD+EmXdhcHYrPVdDuTMrWrvpgsOJIGrq83awFsPsqSnbN/K2w+9bnF10+Mg4+68spuJz9De9cO72kaRYOF90KFp1Hk+2yzFvpGohseTHh93W5ebtAO3s8HVgnrzbiwjGUNc4D2rQoAct/LuZrvBfn6jaqLdzaFA5XeYTNO3nIlYpZutK7+SbktgJ8iExG0KyCiDnOVfaeR/0Ke+IJILf05abGO+GPYuKiyJcs2EmhVGrI0sUkTynoPH+dEKxgOreEdHk6/uNwUGSTt/omQuMZnLk2FTmeTwjwNdKBbR1tFYFzoZgUO/4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrrfbt+aPwTJl3S2dXdhP/gYSXsX/+vnfO3dsa7ZwkI=;
 b=u0lGuAPah5y4BYAkRwviLdGyT/aGfiWf+HuK/qltgcSf/O399gz8jJEKViNXPKiyCl/A0TWPLnd0JD4hyP8FI+UCDolIKYBKB/SQO9Qf4xz9HqAZ1hJCiyjbSSN63xZcME+ppzA7g7+lHII7XmqAiXodkx/Dw9FtngcvO5RX/VM=
Received: from SJ0PR05CA0049.namprd05.prod.outlook.com (2603:10b6:a03:33f::24)
 by CO6PR10MB5570.namprd10.prod.outlook.com (2603:10b6:303:145::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 07:46:11 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:a03:33f:cafe::f2) by SJ0PR05CA0049.outlook.office365.com
 (2603:10b6:a03:33f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.15 via Frontend Transport; Fri,
 13 Mar 2026 07:46:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Fri, 13 Mar 2026 07:46:10 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:46:00 -0500
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 02:45:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 02:45:59 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62D7juws160197;
	Fri, 13 Mar 2026 02:45:57 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, Anurag Dutta <a-dutta@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <u-kumar1@ti.com>,
	<gehariprasath@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partition details
Date: Fri, 13 Mar 2026 13:15:54 +0530
Message-ID: <177338196938.240421.6053639326285418768.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260226091730.2735587-1-a-dutta@ti.com>
References: <20260226091730.2735587-1-a-dutta@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|CO6PR10MB5570:EE_
X-MS-Office365-Filtering-Correlation-Id: 9895ec8f-cbeb-4e62-3b4b-08de80d497d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: g0xb+MgUWsgabQlJs5ViSqCEWBd6Eq72tI7o36JNbF9z1zc/FznAf6lwEcv9vJKj9MIrhCuq3bow22M/LcyMzc/SzDtHvtLA+TVgBX/YfvHyKdAey/BxyBRCeA03u4jyD8/mJno1h6cmprrj1Gt7n6QG9acxRvDYFGXnYdw3078YjWY+qc6Hjq1KGKAdVteB0Z2MWNXC5XccXDntn0O/J/Ws5huaeKr3RrukskZFwIPA6vBAsWF2kT0Y2EmaLS59Dpt7cm5pV+61fs5UpXXKBTKwxIgl4ntlTpKJKGNDjwodHCza8pmBXDBMFLURdXQUy7AV5a4vvQJgTC00qCzjj6HpBMf7debbxWaaJwC0rZ7uRMKYgTl9CNTEFpUc84LzMEw9NLX6cmIGJuuRn8tEX6QucP/8yVd+dioyhOQUGwe+SzhyxSGZH2HQNvyr0iO/F9ZRlWvIdxU+Pv7ZAVsHuCwBtvFe2IjGjSXkfpUjjtM94xK/uLVW5hgzSqjK4OxKManMsbp1qGAVSsuM7nSijLbZ7lQ/E8NOzK2KldK42qbxAXS0wSvHtuIwNwY1hkgCwH1j8gxQxeFnsG+EJWbFM7G8NbBpkFEJC8mhNHkM5xXYmeHhGO/+dezIn55Onr10TCuSVibYlfEryfdvFPsE8xWzLlcfJcMVKqJMlW1fDVMmj/ngjhJHqPI900P1zWsfDQMIirnakVVHy4TIxT/VjWp86+0IKwod4csuJz/Vv9U=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ibiQfLfR8CgEHRAcxA5Njk2srcNaQLc7PdHo+AlA6+Lxncp0FdNvUz3t8rQ4vQq0ukA7g4vHLRLnjrxSVr8MRxBcmkm4eErXCpGMU79mW4+4ZKV6QyEI1lPcwA8J61eTa4TdGGSGn9rrCUqfNdhLRkrrVne0MIgk7aUX1x61Cpt2Hz9nxZFoxJw88w9uprCCKAoz4PqcdHWg29BpzMi0LpqBMf2VC5EBPf1hVhUotofRMRfd2ggGIvz59Ji7+wn128Oh3KCf4xKtNMvl3X/mx5Sxq1/oBzp31NiyCLEMjgJtQ35BuedcJl2umJokOlJJbbkyj6h4K4Nif97/DUJAzGr9zlS7/1YhQpvdOMiGb8V1RLPQPu6tyBHgZTPBEVl801Ah44t145NJ+uDH+kbhWZAQNnt2T69+fkQWQ36+fk0iCBFFNVtTTy3D7ivPui6c
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:46:10.0847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9895ec8f-cbeb-4e62-3b4b-08de80d497d9
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5570
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_004614_890930_8C536C9C 
X-CRM114-Status: UNSURE (   9.81  )
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

Hi Anurag Dutta,

On Thu, 26 Feb 2026 14:47:30 +0530, Anurag Dutta wrote:
> J721S2 EVM has MT25QU512AB 64 MiB Quad SPI NOR flash connected
> to OSPI1. Add the partition information as per bootloader.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721s2-common-proc-board: Add QSPI flash partition details
      commit: 0625c6af7f91d4739a2508bc9fa5f1a48fd98a8a

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


