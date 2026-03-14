Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5732D10706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SECcWuLqnPn6TNT2F7Dwyfgo5Q6uvK19KUcxl5aXJlc=; b=XSWvFq8Pz6z98WZvJSe3dj2H4U
	dBcmn9ZiVcWK0t31MuBqtClPdekNodZg/fNEv8W5xE0aNv19MI62xsXjlRXacv5DbT/UnsWNeONgo
	BWyi50QH1IApg2VJC4BEJtOy1y/k4kSG6i7g1cFZUeL/Djml5xNtpGdhUXNS4VfPJeEv4Obp+yvAr
	O6i0wGPa+mL/x/V+prN8ldtncnmfgVzWYsVQn6bBXzoxhZtKYSCqHYvUpZ1P76QX6U3rIhPUwHE85
	Dm8ro2YHqFq0SrQOJehroIsqbtVKB9SCExT3N7rSUL778D4v29fH8KFs8j4HF5SsGWLYoLsC+Vp0F
	3yqc5Twg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nmi-00000001oq5-1dMU;
	Sat, 14 Mar 2026 12:08:00 +0000
Received: from mail-northcentralusazlp170120005.outbound.protection.outlook.com ([2a01:111:f403:c105::5] helo=CH5PR02CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Nmf-00000001ope-174R
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:07:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOCT3508SUWwDdWuTa1vOiQp03d67F4FiTg27lD/gm1w/U/fbuGQ5xZ0cxMR3sAqIgzjs/isoWQXktp34X81XDv03yXbryHxNtm8ysFMjGsHY5xZAMV1hWcMBq2wJyxGqdSKTDufTWAr4IhKCob8f/qrxIDy22Mh0qoJL3CziUgrUtN4hqJ7oyc1EGSd1sNtDQmV3RKH50Uj53qlwYBRJAgLJo6aDiN32DrfAvchMyW5SMLhk3NGU6plIat0sBls/zk3zrIeHxrDP1PdtnGOWEuhSqU5nGkrjCm0m+LtTLmcr+lBjS9/fVy5c5gO3UMtkDfHKKLkTMEmSb7egVXSeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SECcWuLqnPn6TNT2F7Dwyfgo5Q6uvK19KUcxl5aXJlc=;
 b=onNwD8wdg1g6SuXBcnyXOuaCLXszYX7xaqFBM5Ol4arjZeSKLL4kEVO5BQvSisIBs9+Whs8s25nB+/By54RgfWAnmGpP5+24r7Nvy5nhd/irXCTXWC7yE63O3g07gzgcIm+JonG0mC9u4hV2iSIerODJzExkgzKPqOTvGwAVZdgF76Iqz+E/FUlMZ/hjANpcreklhx+MJLC97Fml2zRaYx2ZBb24JHD2vfX5Sj2V+OfdrcNa4MKkfaT7p4ulAmDhNjiBsfa0rQeoo2iMkbGNgUtkDTgoNEL2jeA3kx0HLlNLCDM0VJaY6PrBqsmiAwCyH46ULvxokj8pkaENrT4ReA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SECcWuLqnPn6TNT2F7Dwyfgo5Q6uvK19KUcxl5aXJlc=;
 b=J0pppp6ShUWL0VxLMXG/JtqXAP6+Bp4GGA8EgY8zI3gltRT11Y/U4t1498/0LQFeZv6ejodFWoxKi2hmSatAz/w5zVxsRzWv4FKoQJyCUqhsW8iUNbquQcqQZjaZ68NUBWfntBnLW8IAk6943tL3kbcoNhDEhHALqGrLi+wmuGE=
Received: from SJ0PR13CA0237.namprd13.prod.outlook.com (2603:10b6:a03:2c1::32)
 by SA2PR10MB4428.namprd10.prod.outlook.com (2603:10b6:806:fa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:07:51 +0000
Received: from MWH0EPF000C6192.namprd02.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::18) by SJ0PR13CA0237.outlook.office365.com
 (2603:10b6:a03:2c1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Sat,
 14 Mar 2026 12:07:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6192.mail.protection.outlook.com (10.167.249.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 12:07:48 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:07:48 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:07:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 07:07:48 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62EC7jOR2215184;
	Sat, 14 Mar 2026 07:07:45 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Walle
	<mwalle@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] Remove the Kontron SMARC-sAM67 board
Date: Sat, 14 Mar 2026 17:37:38 +0530
Message-ID: <177348989757.916879.1399344766670334109.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260302122540.1377444-1-mwalle@kernel.org>
References: <20260302122540.1377444-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6192:EE_|SA2PR10MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: a82ddc22-db1a-416b-8db3-08de81c24f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: NMVvI/AYaS1ZMGnXuU7G5qH3hPyUAyRKAySE7yXn5LqUfKBz/OH2RHybXP/WpVTrx6NsdVSeo1EQL8OhWrDNoh2/zs2QVC+GHnNU3EJUDrU1+KxyQWMIZGOcrxne0dego7fJoXMnxuTZhD3GpvvqDYeM3sd9gbCapXEWHx6WuldzvwMhrNsA2+RPVRym706FvC7yjW2s0Q5O9vgQgmshRflquysSKthFC8TbDrN8b0Sk5MpdyTpMHyagVl7FLaYxyU9FYfT30p4LY9VbO/8AuCR715q3foJHJtGQO6Jvz88XDRNLsigRlb2rHgP08CAqsBCqIxYWzrSE7Vwi9/CGMnPPXn+FSzoDEhs/5z+Jw2u5M76LhUUiwvSHLA3J69OVaDA/QU1FMU3silGLtJOX9cJwE1MQJmRalWUrJg7vIk0aIjYClW1pr4Z8ktnevZwBcoKE5PbLNYdvSxnnlpLIB39Cov0qccTpoWlOUcRyiKUjDUyQtyi0iFyCOYcgejaU0/v6yR979XJOxJkMGK9NjvYQofEgL1Ml6nckoS9n7hjFLcS3teHyaJZ7re8j1cp6/mAUWJG08PWx6/Gqj6q9TdkINy/CBYoiOCkFBNx9MVYOb0BwUiaRNS3nynCwml5YeFj8eQ6lPcacCJsWBYSJFgO7KfUXXRakqP1B8kK0/zTrWbgYL6vWB5ylnR0ROQi6RQ4hCVanlB9slDH+su1v09QueBzYIRYcPpcN8l/u4BU=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: KktZIxsH9CNAiNDHjNB6s6gAYTeG8AeUt4nrJA8cyS3dqsN39U1PlAu9GsFWpsVCpYr+cm759POxbTF54VDc43fxqxF5Zx+zJ4RevOOeKZl4Z4gjxhPgPfpSKJQlEAATium9zNCmAVl3U4qcn7udfKpEYFxd5P5at5D5aCLGC66iNHwQsXzpzEtPQ3bvYifKZFz7e3EUXFQhI1JxszkN8DTp6bACWgcbnBi8kFkmy8fl7IqV7JE1/nQWDETICqF0KpYApRyyhvKeH3fIts6EMLboPg4sBRPZwSW0p2OiY/D4qZOUgyJXNV2P9EDKLMSdBI3WIyQwpdQw6WBihcQBE7uKYGK1YdTu/7wT2u6c4BGNtFR3ogwSckMdoHmK/V+EXfSATbHBl694yu0HyyOHrN6SZOtxXWrV/XgoSckEFrhukAe1TJarAXfIPp9Y96vz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:07:48.9199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82ddc22-db1a-416b-8db3-08de81c24f7f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6192.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4428
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050757_403638_62088E3F 
X-CRM114-Status: GOOD (  15.18  )
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

Hi Michael Walle,

On Mon, 02 Mar 2026 13:24:45 +0100, Michael Walle wrote:
> I was informed two weeks ago that this product is discontinued
> (without being ever released to the market). Unfortunately, this
> collided with the merge window and I had to wait two more weeks.
> 
> Pull the plug and let's not waste any more maintainers time.
> 
> On the bright side, the board upstreaming brought some driver fixes,
> too. I'm really sorry for any wasted time.
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[2/7] arm64: defconfig: remove SENSORS_SA67MCU
      commit: b632eb8cd72268f5fbc982442e5210dda41b0340

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


