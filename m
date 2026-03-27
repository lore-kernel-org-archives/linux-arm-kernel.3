Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2393810BA426
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 04:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1jGZditnARQ58t5V3szCJyzEbRxtMstnTcuTSs/Jyk=; b=KC9eYkM6vt5VJCq5efD860c9Qi
	vtBOYbFVlbiSganOAGfkLfZhfOH3y5Pykf5kznGnvkQmOXs0IMNEdAzJi8G4mkzI9clCiLMMGr4CN
	xrfiU9Xht2YPDXYMqJWRjWcBE6Qaz7sC9ohnVcR3daYTON8uWj4nZPymy9pSFQXq/y0p2c7LQi5KH
	wM1tBxSGiHRubJTOLJPibtiX8u3tJtuBceGDgUmqDjqfV36nsYiOTdnwlxhW1k7k6Ft41xV5qOrtB
	FUmjy8FRFFkb+7MevxrReSKH01MD8tjqLNAka6wHzByRHqe9TcmPBD95QfQrMDl3t3jAxV/m3XrbQ
	ru/Dabmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z0v-00000006fQg-20IA;
	Fri, 27 Mar 2026 04:41:41 +0000
Received: from mail-centralusazon11011056.outbound.protection.outlook.com ([52.101.62.56] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5z0s-00000006fPd-30ir
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 04:41:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFZyTVtU9yw9Zycs1hBuv8mF3jIKiuFkRChwyyIrimL7Z49Y0CC2RM7+crYrUp11o8c1AZBS72AFFBgUe55YpRZYyYt6ALLjLvagIg1uH3Z0ZpXqwasv4soo/xspDwjG3MFN7WWOywCSlwTWKSnPtAY9w7y8XmZx9ewRF7EJn84hLJ8FPuScrYqMV240Rymm+nBcHpFeKAV92ZsairuWEKWhQ7qbCY3UDmSvY7SeZEBsLaUwBHlreZChfyrQmhwRajRMCt5QsnS483sylseTHEAcVWyNyGR8RlpGe7GlqSM8nXcnQnLx8ZWWg7itWLbVbQgtTwXAw+XiRP/PPefWkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1jGZditnARQ58t5V3szCJyzEbRxtMstnTcuTSs/Jyk=;
 b=L3X5ssfrxoSdHy3B4/VrK7W2HET9W105Z0a/mhSneV64oEPClP2NH8J3RvchcExDPydPPq1MMuHuKF752KJWJKx+E7H+y9YxqKMfVv+j/BG5XHKB0YKJzYf0T2PGV4/PBvMXgr9AOk7BmCHu+QqeN2d7d9cO8vv8kefmIwtg02A6i1ApIL3Kj+QOyy3uHZFfuvLvaP2/iUvcmWZTpil0IjdYQVVaDILKaCdsj1HzRlUHJGTJwDmzmBylWfzO+vMkH32RGAqhPB4HWNVvdaCp9T0qlMlEFJS9jax6yt718898SfeSfaZwOEJx/PYy3IHsVlgEuhWwQ9jRNfTSZO0trQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1jGZditnARQ58t5V3szCJyzEbRxtMstnTcuTSs/Jyk=;
 b=xE4Q53//DmLvPuhfxqGMNK0HfNuTUFNLHvsItTtOLJVhC+5wCU0hJRGS/StzQ8HEgmbVkYY79nQR8xwgWafR0Yk6RbCNp/IVf3zgJ+iN9ksgoNjVwK9BQQjWqSIcIBSQIUfOMPdK/rOFqsVe6DLfC2OgtKSHryNCQmdk8CHzFXw=
Received: from CH0PR08CA0015.namprd08.prod.outlook.com (2603:10b6:610:33::20)
 by LV8PR10MB7944.namprd10.prod.outlook.com (2603:10b6:408:208::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Fri, 27 Mar
 2026 04:41:34 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:33:cafe::1e) by CH0PR08CA0015.outlook.office365.com
 (2603:10b6:610:33::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.33 via Frontend Transport; Fri,
 27 Mar 2026 04:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Fri, 27 Mar 2026 04:41:33 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:33 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 23:41:32 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 23:41:32 -0500
Received: from [127.0.1.1] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62R4fSk52869376;
	Thu, 26 Mar 2026 23:41:29 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "Thomas Richard (TI)" <thomas.richard@bootlin.com>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory CLEMENT
	<gregory.clement@bootlin.com>, <richard.genoud@bootlin.com>, Udit Kumar
	<u-kumar1@ti.com>, Abhash Kumar <a-kumar2@ti.com>, Prasanth Mantena
	<p-mantena@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <20260313-j721s2-s2r-pinctrl-v1-1-a6f80c641037@bootlin.com>
References: <20260313-j721s2-s2r-pinctrl-v1-1-a6f80c641037@bootlin.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf
 compatible
Message-ID: <177458648664.423823.3002227693403091634.b4-ty@b4>
Date: Fri, 27 Mar 2026 10:11:26 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=vigneshr@ti.com;
 h=from:subject:message-id; bh=kA/ml3InisdHhsbIAzs3mw/w41vjQ0Ne7WsR9SlhblE=;
 b=owGbwMvMwCHG7GTPG/5e9jrjabUkhsxjXBU3p+yQenil05+5p8dk2gf3QOHwsIw5507MKxXM1
 l0aqPC1o5SFQYyDQVZMkSWAbdcsqxSLxxEViVth5rAygQxh4OIUgInkHmVk+MrXG/lyBcuEF7t/
 zXux58gqi+Zzaz4cLE8vi49W1HAy6GBkuFkTd799p/bqXPvZCpozb8kks7JeuxGw55BOwsywN5a
 qDAA=
X-Developer-Key: i=vigneshr@ti.com; a=openpgp;
 fpr=4A5A711E8E7E44F9F12F2CFAF903332F551A78E9
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|LV8PR10MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: bba42492-62ad-4e75-08dc-08de8bbb1f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: IlpjNTKhZg06B3NgXj0kOYexCltyGTfzSf7H2LfJGZtCcQlyzLELBtsqoW5uzdvgXFR0fC+GfUDkRyvbo41Z6Yb+OxFajWCuQ+IHpTEDHeOkpe7M5WQZDlQ5NG5ysO+4JEjYc2CLMmvNFhk8TD9QsVSZ33BnX2OM1tbTyYgnXWyQZbHk9hXOtnG8qy6T+YgrtjWUv50Fmy8PUmNztw8kC+b8NNt7+GIFETFQKDWa1A+gn8bfam+oOZ8mCiUfvQE1DWDCbsWjTxA2Ioh7CKIEt6KR1w58l+BSbGuHzvp46IKlmcKQJLY9phJiNRyJVCLwXBSx+xYLlnq72Nwwn6mNfOgzxv3BvKTY5nQTL7GlHGUFJcEceokgFQDki02pVvntB7020bLXzhEiEACFFkPYxb7RNBHSAEUUvzq4BlBmHRXyg1M50Cnd0ZpofwIksTZBs0DqM/h3mKxeJoeKg2ygrwlycRkTch/riZajDfNcl43474OOVDTKYwAtCmu0vNuRk0HvacTgxCZrUg3fcPOom5IjHj97FKAlT8w0Opz0iErjWDLBlZIEU8bhd8A2zmwESl3gUueVJxCEAE/YcyFgfnQPwUoZoOaCRhFQAM4vBTYE5Fl+CZUAI3yLtoRpkSadZ4pEH/FkOo68FTK3GAcqzpG5ATEEe7O1oCY5LXolohTiIKQxLjxLvExHfZWq2CwlwkDsnqDE6tBkjH0OlJjlAV3qL1aDmbLX+E/bmJSDeNLs0f1fiHziIlu+IWOUKXvX48cAOAEqfs8HUcNUh2OgCA==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UwInGAeCpgjmuapCMwkWprLpj3S7l23FOLO4JXhivZrtBujg7gGaslnBmJGYQYh1sch2eSiKpd0ZdLu7nU0AUC9OUk57hIk+HekpjpC95tBNBZiZps7fE9UfyPYp2yreqyeQ+3OKFm0Udn97Qyv9ZVgQ85dWbV4lkdP3j21TueX3ojF0NsJnvmRZBsGFhRHBYFRVh224sglcOiS56Zgt0uutfsc9ZElGqmH2KbUbW08juE/bDREtwxWUK5zUeOM7syTC/xeZPJXkEG9fS+OSUmFrz7dUfNTrM+pCp9JpZsNIdNq7k4mFQ9T0avgiLrJARZd6gccN1JWNq/Q8dhRTKm0vljdMp7QEZnr13P/v77md6AFj6zb2LzbnMBnsPsGH6vLeGXIzBHJ0sKx9uHMXbyROuCc0ap898QA+EP/MqHEmOy5t4yPbg8A2cUab1e6Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 04:41:33.7655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bba42492-62ad-4e75-08dc-08de8bbb1f9b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR10MB7944
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_214138_764547_4231D9FD 
X-CRM114-Status: UNSURE (   9.05  )
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

Hi Thomas Richard (TI),

On Fri, 13 Mar 2026 19:18:54 +0100, Thomas Richard (TI) wrote:
> arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-j721s2: Use ti,j7200-padconf compatible
      commit: 5c86ef2055900ebe5e5a195a7d67b14ff665b60e

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



