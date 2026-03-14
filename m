Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEAE10706CD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 12:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLnzT/qo6dJcFMGg/AdxGPbHDGVTnvEix5U+QM9YuZA=; b=G5j0+MbO312tbUxhtEmC/BMAK9
	qL5wqNQNpT2NwLslhMd5zO4HN0jiyjDIkZkma0A1T/nHXGt9mh7UMfjhRElK/5X0tIhYmYfnvEqfJ
	PBb/AqA4ZG+J8B0lW64+aH7DqyEFXfLYUIReq7kujlCjuasdSbpCxSPzJWrXxLiX5JuxRMROfhUFH
	JB/dnMbdLr9InwhsnU264iCI7NOO/dLqHIEH6w6A0YrZgX6AGmOFdg2ztZW5jDYyhOlcM9imOr0H+
	TMfAI6CwMpXo28iIfCqcpPhCaS0veCeq8fNrd9zrJCwG06JoSb1MfYGbeVCsJSXVmIyEUe6dBbLDm
	N65uuEUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NnN-00000001owh-1Hma;
	Sat, 14 Mar 2026 12:08:41 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1NnJ-00000001ow6-3Ukp
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 12:08:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QaKwRUs3VtK1fTTIeH8HB6R9nrDfBYPFIJbEW2HG8P9EXmg1sWONqV2O03fpp+l6EOCTfB7Svsvpc3hij6SHdhtaeF/R69YlC8OFdi9wCRFOQjGI6+9enjAp8SU7DRrsV/8ijQSViKjynvCeIpKJF8Hcjl97KKYWHp1SOKeUIGWA0sinYqpCKHP9ib768hbqkLPFwBdT7go0fNFMo+kWwWR6OSWZE9xg3RCfGoPn0SjWoX+5FAbw2szw77cjuJinRimjjJP8dCgjrSyn4AmfgEM7XI6YZRB3P6T4CRHSwlpvSNEMmM7GH9uX3L9gTX3obZ2V7A0krGsH7o9UtzWN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GLnzT/qo6dJcFMGg/AdxGPbHDGVTnvEix5U+QM9YuZA=;
 b=TtsH3cm7/+nqmirAHzrzcFJ/PLY/o0NEVaiAaqtyUrn2t7dlILLnXfX/Ta/sOarvYUH7y6JX+Y6xtT/clCN1fg0WYl8WPOm3OwiXXaAkNPO95I8NMDMAvf5leTGovirmElhbAnUt9dCnMz7wu1+gf07GCtQepBBtWoRtjOeku4oAwbL/ldCBfbrbo4+OhlilefV6l91UDojoehiH2F7ZxzTileFpJH0j+44tC+YJf4IV958cldIqB84aGdIfE+mIo94kkc5f1M2aDOuixEsAUp8DgwB1B2h53PpVtYOVQwAYiCrHM4uU5GvGNNnAzPt6hI64eQOezlHEFfcmI/DIMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GLnzT/qo6dJcFMGg/AdxGPbHDGVTnvEix5U+QM9YuZA=;
 b=Gg6QVsJJLeEOHdUWqhWxH3MLBI30GrRZG2KS/WfZoBT9WIsX0b6XLNnpyxMn9BF+mlsLA/R4X5VXbV+UL5qnNBjk6UKEFVin9UGyPMSUet+KJeyqFffiFeunR1z60fu0UKDnQkfsD1Dp01/Hd8k6MvLkwUs9SbP56/M3zkULOEE=
Received: from SJ0PR03CA0036.namprd03.prod.outlook.com (2603:10b6:a03:33e::11)
 by BLAPR10MB5041.namprd10.prod.outlook.com (2603:10b6:208:30e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:08:33 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::31) by SJ0PR03CA0036.outlook.office365.com
 (2603:10b6:a03:33e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.19 via Frontend Transport; Sat,
 14 Mar 2026 12:08:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Sat, 14 Mar 2026 12:08:32 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:08:31 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 14 Mar
 2026 07:08:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 14 Mar 2026 07:08:31 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62EC8RlK2215902;
	Sat, 14 Mar 2026 07:08:28 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
	<linusw@kernel.org>, Drew Fustini <fustini@kernel.org>, Nishanth Menon
	<nm@ti.com>, Tero Kristo <kristo@kernel.org>, Francesco Dolcini
	<francesco@dolcini.it>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: Enable configurations for Toradex Aquila AM69
Date: Sat, 14 Mar 2026 17:38:20 +0530
Message-ID: <177348989759.916879.2071922532139475734.b4-ty@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260306153130.102972-1-francesco@dolcini.it>
References: <20260306153130.102972-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|BLAPR10MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: 67590699-6c3f-4630-d828-08de81c26957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|36860700016|82310400026|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: uqKYJw5uZ9P1ExkYh4JtELpP83DOEWGkb80G+g/8dSUhvC7F5rXWD16X2ZNpIo9ih2nCOqrEZawDRr8N3vRaObPI5RaJ8Jff2lEGi08tZzaQL5k5Rnsa6of3aaHQeCzXy0NjJPv1nLizaSpPIyrAsY1ghQqrqyGN3EOTC5BKCTqm2HOYNfAzyKkl+D7kT6XHkJ+3itlUIKBw76oVA2eeQvfZesDKWDhBCdC2ZSUVvajc87cdDu0OarAFDVUOp9II2nBx5l9Nc0Uf2/Mqh9VL94eieBg748yPLAE12QV+mCdE7fceka5Haq9Nqiear3kvEy5nfCim+l2dIWvxI2EYzv5mzbbNNSWq9a43A7PbqE8kpOWCEfgIXi9cT3MAqaj232w6Akd0pTWwozYhNq6BD6jX9M0TYtTzxk/o0mpEGirTp6EPzhspsmXjtMkIVeYSnYlFb+sVBjagSPJhOE1D2UCBKarv2GqzXZqSt+olPHGtm5sLTakye9A9jfHlRZIirM0U7D/pnDz9NYidF1Jxr7siD0RHLue/XrN3IAtNdNddZAPxar0amblhS2u8XMcO2kzhRhb8ThrctdiOJojIVSrwY067ubJ+Od8jGfqVLFHXr53OeV/Du5YPWLWpKcIypn4eqnbRAW7Z5Ui3X+pttAmgPhPAvIih4Vw/BHqIF+c9nxwNI84F+k6+DBX+F6omJnWkyoEuDOrqi+xFKVsdM8/G4QK4L0/ibE9APgLN6aw=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700016)(82310400026)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HdTFvB9Q6eiA7yvcAM3x2dt7wGIjQ1/7eW/VkXauluC/KWuKpetP1rPjEWSHY7ys4ssSyaUDOBQVfS2/1167DIa0GjljDJ8Y8qo8ElSyLnAlRMGTJ1DB4r9R8dHMj51sq5DO5ioI73WidtOzAVIZcVv2IpRcqH157GDJ7KkkLno2iQ7QlkX/H9ifOQs93Q9NQC+OWvV/uV7K2s5U1oSy17LHParRASCFbRFUd/GD9l9731xXkp0z4SE0UMIXbsZYMjbWs1tX++Jq9Qyq8j0CeznCLe0QEDhh2wg7aOlwOO9qaAG9xDg6l0mlStU1Z+oBpe0WBtvuAuBNkpm3QWyC2dvrU1Nncm+egu/k95AurBvKCZXEbzPqHbaRyjbuvV983ZxSnrHGY5z3rXRqwN7zw8vtH1n7/b6ZWFeWPWQ2vdHWG2yHPXAk8bt9W7PChosc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:08:32.2947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67590699-6c3f-4630-d828-08de81c26957
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_050837_874737_5F08CBC3 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Francesco Dolcini,

On Fri, 06 Mar 2026 16:31:17 +0100, Francesco Dolcini wrote:
> Enable the configurations needed for Aquila AM69 SoM and compatible
> carrier boards.
> 
>  - CONFIG_SENSORS_AMC6821, needed for the fan controller on the clover
>    and dev carrier board (as module).
>  - CONFIG_POWER_RESET_GPIO and CONFIG_POWER_RESET_GPIO_RESTART needed
>    for poweroff and restart functionalities (as built-in, it's not
>    possible to set them as 'm').
> 
> [...]

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable configurations for Toradex Aquila AM69
      commit: d3908631838329746d093dc24a1d4935c36c753c

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


