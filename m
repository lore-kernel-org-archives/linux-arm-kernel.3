Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3CBCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfddU0xqBhGCcitmOI41eLoJRm/FPHnR4VowBcpLhPA=; b=4Run7Hf5bWqwj7AWd1oAxSqavC
	SA4IWCHbAUX83f91qdNslGOq7L8B5hHrpYSdfJ9peahfosICo0UoJBEWaVunhlYk8X4sOoWOzFWJW
	gjBiNunCgaCa8va/C/rJtt7t5B5AksdApi2Disblzr6xZrnWVjwAoEErVCJj7qTX8kTOAwGJS+jqF
	EZ1DM/eb+g2e740rNYuIchVZsG7ptV8YEdMPZmjyZFV9o4OVazyf9QYmDWR0M1dqmxwZkuCNfovDE
	TDhAKh+rQWLlmvrleyx9ZmH4h5oY87J2dnJ9HZkwvQ4HZyq+oWZLJMW9bT8rkLeH1bYKQxipL4vwC
	4TN44Qjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGKP-0000000GPlK-3Zoe;
	Tue, 05 May 2026 14:00:49 +0000
Received: from mail-eastus2azon11011005.outbound.protection.outlook.com ([52.101.57.5] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGKM-0000000GPkK-3anv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:00:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BcEe5PbzK0f5r97W9PyQiYO3oJR8z5qDw+9MpGJTSJ6Xr28kK0M5J/nQNYoLAPHK1vY/GXKmUVlVhu3oFZdE/+vRuB0XSgu51RGi/ML5idwsAdZsOHp6BaUiyotvwHBGVphTGWT1Z3Zc6TtrDJcDYy7x42SxBaJoiwCzEZRIhJ1yMbur/0FHS345BwgIZhVytz7152y3Gm9WFFLQA5S1iMRG/aHQ37IrFPvI8FIZMT+NUSGB1a6HBb2ttKllIOz73LwqBKAQ4M4gvZPjJY1zQssSHu1mI/gsatLk4Z+UvBZiM7NBm9Foq3vIeeeYrLewDHzxI9AX1PdYIg//Zbum4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfddU0xqBhGCcitmOI41eLoJRm/FPHnR4VowBcpLhPA=;
 b=QR0lZtU8IBWlGr5nklh7pz3pcWA76Ke56boWI9xBERo/9IChh5IgdnP+PWNf7G4refb33keRac4eI0zvW/MXpQ1qwf9lxmcbGezS7Zdxrjyk7QLcGQwGRHCq9Nq+qd1U3q4O/vS8cXzRklhd/T5rdOfUDnYdLyCeOibmbowkHjSlwd4kmeS28ikpvQZiJrQaeTjAl66JRhOeDCIFdpnU3cd5LaNsL4I5STyyut4GkWrw/2HqrVKmJIZHLsRUfWIvl69ZWFw4uu8hjqkpcJMLM9/B7fOeuTMM0l3DR9cpaX20qBmVIYAhMATqT13Ozf11XsWmIcgHbnxCQ/gEXyRgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfddU0xqBhGCcitmOI41eLoJRm/FPHnR4VowBcpLhPA=;
 b=o592IMt2F8A31HYNB1uCv5dTguaJ2QW05ow7oPNCRVYkTF39MexDqGBbJx5QFT3VoE/cFkc3Ok+BFERB22rVYwkzUru2tYfY+FvPRsP+XRLXHEJGleo04vHFL7ws0JFXmcNpQrsG0V+sTTddU0aBOcm/KLTX4GX/WDkNjaAHCA8=
Received: from BY5PR17CA0065.namprd17.prod.outlook.com (2603:10b6:a03:167::42)
 by DM6PR10MB4364.namprd10.prod.outlook.com (2603:10b6:5:223::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 14:00:40 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:167:cafe::fc) by BY5PR17CA0065.outlook.office365.com
 (2603:10b6:a03:167::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 14:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 14:00:38 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:00:24 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 09:00:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 09:00:23 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 645E0NwM3104080;
	Tue, 5 May 2026 09:00:23 -0500
From: Nishanth Menon <nm@ti.com>
To: <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
CC: Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
	Sandeep Nair <sandeep_n@ti.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: knav_dma: fix all kernel-doc warnings in knav_dma.h
Date: Tue, 5 May 2026 09:00:22 -0500
Message-ID: <177798960669.336482.14419001190034269586.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260301011228.3064940-1-rdunlap@infradead.org>
References: <20260301011228.3064940-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|DM6PR10MB4364:EE_
X-MS-Office365-Filtering-Correlation-Id: f56e2cd3-87e9-44e1-da86-08deaaaeb031
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: X2GTBPnz3QatunYFOi8Ok85V8iPp5HIi/WTo6AXkgtJqWHGDnf3o3MjBl+8HCsHvEXVVidV73hkEDeZdlu13eysDxQAEeviCZRvHivTqoDJDzZj4iduXScx6y65zx9bH0PwBgBOrAsrMaSv7kFEBUqVRm6B4Gw7sXIEp33a8E31Vua3ZQczI4X/vnF3Ku8tJDFxLf6UORImgi0Nxm/dsSSs7d/9uji0ItYe8i+A85BElQZYBxJ/eNriDXiBMftjqC0VE2BkszZZqvrRiDCy+d7UxZiaFGNxlhnDTPsy159PDx53w5Ddqt50INWSzQmALStLmjGOMS2jGtB9uKSoVDVtI0On8S7m3SjkBipKl1J5uR2lKJRrHDxJLS+c55qJd7ClRlPacZmW3wjyj/0pBm0pdQh31ZD7755doTSyVObzs1EL1YwSTIKTUjxFhTbndaXYsbFrXYICd7rTMj8NCTXO2nzwDmPgE2000+RypI3mKaL1CqkqHO8LvtkqOQrlFBgRG9J5styLn+yzBkDcjBwSUUSqVOQ+vbltvJNBTSWgk3KBBg2SLv1fy8ijFWfgPU7cDWM9f3/Fs7+Ntwwq+MAKGI1Dn1AgJ4G2mDHek2K9ZUOjkq8XD3iHTAp5y4syfZLQmpfoyxn8O0qsj/M3oG/03OTW8caOWf5mhMQxXj0pKy7x3X72LBp+p9LFGIPcoOtNrVJrAxDmvHCWcM/cmV3tu89kpYqcPTuNkeBVgxWU=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vNJOdlhFEpjQmpFstO8FpqTAdWjYNRsmbQ973HN3dZArsOuiYqE1bIRY3OiKUOlqqtQ2w80c5zZJK/8LhTzWTElDRE1USsvypu9UtsRs95/WrUFyXpWBwkFcg1wEYWAJ7OEfZ10HCGFRygdM6r3iqYi7gBLTr3cMmUCDnruXsbhJgilaaBiXFK/Qakvk34wi2lQy7v26+i+RRAX7+3ysiFlt45odbHx2w2NHt7+/rzEgbj6k+gOM1ImBZLWU/xIV4At1WAXoUpd2e3KylHZo6fcJVk3WawhACU1P5ZIfao6Kie9Z+AXzdWXrZZKEjuPb0iaNcsVsApK2Ag5bX8bk70Gh71uvmoCHFAsT1syy+JWrArVgXX4QdFbkJ8Pg6eG0WNCIC5t1jP93M2nyxOvxuI+ywXQhoyPNvqThsEvbAy2dHLAwTHSNxbaqjirR+kjs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 14:00:38.8975
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f56e2cd3-87e9-44e1-da86-08deaaaeb031
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4364
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070046_897578_77C9533C 
X-CRM114-Status: GOOD (  10.96  )
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

Hi Randy Dunlap,

On Sat, 28 Feb 2026 17:12:28 -0800, Randy Dunlap wrote:
> Use correct struct member names and formats to avoid kernel-doc
> warnings:
> 
> Warning: include/linux/soc/ti/knav_dma.h:83 struct member 'priority' not
>  described in 'knav_dma_tx_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'err_mode' not
>  described in 'knav_dma_rx_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'desc_type' not
>  described in 'knav_dma_rx_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:113 struct member 'fdq' not
>  described in 'knav_dma_rx_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'direction' not
>  described in 'knav_dma_cfg'
> Warning: include/linux/soc/ti/knav_dma.h:127 struct member 'u' not
>  described in 'knav_dma_cfg'
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] soc: ti: knav_dma: fix all kernel-doc warnings in knav_dma.h
      commit: af76cdcf02b7be9277af999f0e316943d94d7fd4

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


