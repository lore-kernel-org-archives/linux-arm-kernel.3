Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D4CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iyb9gV6TSSoLXEENono0dNwYbe5xU3fB4a+uW12Lp30=; b=vH8YCrN25laQe43C86CmSDIBOG
	Nz6v4lgnp9PE1iCEiWI1PTd2UdKNlbE7rsuRzgcpxyQ2u+Ac0kf+MAURMfgPfT4K2zsAC9RmZMHpQ
	mVwkOWKAKslGUs0pxFVtjzrzASrwDjhA/HBCTM/TOxCxxOxByluGrPCUYcOhJFo2GQcIuW3vr81xU
	/sPFFDBdKCw9xNIHZjp9m0TnsE24+vF9hoLkR3h6qvQG79icODfHeeoUukkYS51sFRrfu6Ohu/V/b
	7Bqy7RC/ABa7Fg8Dr3LEmkCUrNj6KRwrIsndsryCdqt1g41HWwU1xMBT1XKQyqMDQUJbCQYiiHp9t
	JdlrC8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsuJ-00000008U6t-3s8s;
	Fri, 15 May 2026 13:48:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsuI-00000008U6A-24kO
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 13:48:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Iyb9gV6TSSoLXEENono0dNwYbe5xU3fB4a+uW12Lp30=; b=pDIT7HyM6mIb9mrlN8fTnf4sbT
	//lVvE6NUKGd9WNd2+QV9NuhzhJ5Z6TdyMVxs6h0i9mZQ/xfseKMmgrQp12qhTeTI3tAAMdXBm/y/
	F7/t5f9ziRX3sx4B5xoynD/slO8BC67IARdVNITZikCb8rlC8QqcS3K0PVMn8Zxr6RdTQW5grRPF1
	TCUGCvdpPDYi+Naukw9+EAyIlW5zHWkm+BeqURkZWC5RqN46NY1k0/9hBlM59cTC5Ygw3k9MU1wBE
	SzCcaOL1/bNYYNdPvp/cJvC068fgfhZIzHjdRj5V+RM8O3o6smequMAhE5bXb5QDYgrrrfwfAt+0x
	Hb6uL2fg==;
Received: from mail-northcentralusazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c105::7] helo=CH4PR04CU002.outbound.protection.outlook.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsuE-00000005Lac-2UGz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:48:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o5SUDhgDnpIXAqHRwbJkkmZPv+bXkvTEEmRUPfJ4XBxfBvVXAUZwejiuB281ntzRpifJcCazeZgqaMXi73/2QvThoc/jCLUDa1DNx8VrSnoxzPZJJe4fVrh8qGl340HlIUPUYAfJWyHXYD1StEuFH2EvR3xuZqSgMIubexSluJ5fKYDRBNDTEC9mFR3lCd8EV4N7V/MwsMkPfl+dygD/gWT9pSbGAF8sRZ5zUQkbv828cYjFCdAoaMCEanEAcR6q9tWPA4F5gFM+Z0nzQyeFJOx0aQBqMtZM9ktPnRz+6ozX4Dd17ceCr/bpc70aCUPlZqEe3+giulqXHfFKTUz+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Iyb9gV6TSSoLXEENono0dNwYbe5xU3fB4a+uW12Lp30=;
 b=TgLdUmX1RBV3oWQXnlFicrCB0sIsqhr9XeoeJ3xOofSA8Wju60jZYI4isdFad88/UX9BL5gDsTFkyT0Pggg7lL5N/dKXaSt7hq6tRvpph0FeUOMTtsP/7+2z0hKMwwn15dUaLN1SsBcHyP0yqtUW1djPy8yPRhgeKfuHu7FKJfqjtAQVX7JxPM/M3ApskKTqTELHqu7emosGQl0IzYXV3BTs94Br3vGNwoo7/yhmxaspXCtnOS/ApRFUeRSMyL9tOL5QvM2zUNttxeJN3tM+YRP6lUK+j5rR3xiFRPVdNStZpxtZop+tzGPkpk5lCbqSEZHvNwU1Vi4n5F1p3SaOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=gmail.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Iyb9gV6TSSoLXEENono0dNwYbe5xU3fB4a+uW12Lp30=;
 b=io8YIYD5mzz3PIqksZS1usYXuc9io6RozHs9Ogh24Hjk1Glj8dfTt7WsoftsPZVSdWAt+c6PB5e+P4B1VXlDDQHu8eWoovQ5obGspyMUA/j9RJv6j17/w//ziGCZC2FZnTdaTNSs0me810jPqE7LmMrv+GDN/nC64LUybWF2+ic=
Received: from DS7PR03CA0218.namprd03.prod.outlook.com (2603:10b6:5:3ba::13)
 by SJ2PR10MB7082.namprd10.prod.outlook.com (2603:10b6:a03:4ca::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.14; Fri, 15 May
 2026 13:48:40 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:5:3ba:cafe::ff) by DS7PR03CA0218.outlook.office365.com
 (2603:10b6:5:3ba::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.14 via Frontend Transport; Fri,
 15 May 2026 13:48:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Fri, 15 May 2026 13:48:39 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:48:38 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 15 May
 2026 08:48:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 15 May 2026 08:48:38 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64FDmc29350802;
	Fri, 15 May 2026 08:48:38 -0500
From: Nishanth Menon <nm@ti.com>
To: <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Md Shofiqul Islam <shofiqtest@gmail.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH v2] soc: ti: knav_qmss_queue: Implement resource cleanup in remove()
Date: Fri, 15 May 2026 08:48:36 -0500
Message-ID: <177885289469.150770.9505505052785242246.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260506154114.2288-1-shofiqtest@gmail.com>
References: <20260506154114.2288-1-shofiqtest@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|SJ2PR10MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 52608136-de5d-4121-3cfb-08deb288abc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 4kZ8UfU1KuNrP9hu1NKl99FLGo6tY27kT97i9r4vqbrTFHkbFkaTSIwKt4ZQqipzdajE+5aZeBh2+KEbf9bBIEzh+7gD7rcCAnUFVARXCtXv39dwYcyLcGDgUMEFhSjS/szOLZlN1lM3YeyE/Em2/Vs8nn09rf3N4KnvFSe+j4I2C/UI+g/mq+ThMsXrmfkAAZivmpeBmIfYHsl/U+6B+tlTj9/Ix1rIIvsYp0ixxYIy1LXmjN/WZOfj7qfdwlXmSFDWzCxb0EiaSAbX7bUPu4k99e/HHUSp7nNqzTnYF5Kv+befCtOurQZga/0G4lHFQOdoo+YFxOw8vTCJ7yIB2ekEeT3SX9wwgUxg2i9vgh2snJ40i6VNVolnZ2syz3Qgxgh65G4xQdNWN8UDtYy5QxDyKSz/1nSr7bivre+X09dLknv+ymAJmTgVPXy/056xMj17BN2hHue4gr6+BiRHYg23/EupW/5T3nm9zS2RLMrKRnw2d1ZeSkrGj65be4akqOxe6BrIaLY2cdfHdC4IkWPmU1Kz6Ld0A7Paf7ZEGLt/qHsgaYRU0mbd8BJ8wkEQnBy9bWdwI/N0iZZbGp5l+lqucTfnk4upW8AwVUiwSYLt/lMCQ2mM6kj40KPDQVSuvnruIyidePBBvYYg2F6TykL/0RsnNQsLlWe7W5MQqpLlk5QAJIz7OiXpAk77CF/1esw3fHKiWs83bU8XzUPoEDaHhgdYV9i9JqD9w6X08Ys=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: qhDGv0AdE9P/0giuRSfGd7cUAr4qb4oTl8tKjhBeduyx7328Awd22s7y3uJ4YezpFDtJop+TzDxMrRmK7mTl5F1vXjpIpuhiH3QOFH2NC+LCNfPsU2HIFaeQ/efSQjcFWCcG9gEUk+jQWiTUyTbJO9fi3pgY4p9CfJvmYeG01646TZWRkjcskNiiCeqkdXsEbXbSPGCZR3pOJ6UDIwChFEMO3a7nLot9yFHpxV2Ve3Vb5kZOStH+HpDPeykw5sYYm+CPcptJGVkN3qOI6Yriz7fyKwGl0UINGFvkF01Tt/jaIQotnvh1XL02sLnDriWj1hplTwYA7D2G3GpaKrWGINAPGUHlDJR91AiH8mwuaj/sU/l34gBkLaEwLTcxeKlTSve51TON0z3V0vrgyKE7K/xqG32h1Pk2gW6Wf1mXMQ/uNWHC4VuxWzjv5y/qtPgh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 13:48:39.9187
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52608136-de5d-4121-3cfb-08deb288abc4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_144847_047360_B57AF7C6 
X-CRM114-Status: GOOD (  11.90  )
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

Hi Md Shofiqul Islam,

On Wed, 06 May 2026 18:41:14 +0300, Md Shofiqul Islam wrote:
> Implement the TODO in knav_queue_remove() by stopping PDSPs and
> freeing queue regions and queue ranges before disabling runtime PM,
> mirroring the cleanup performed in the probe error path.
> 
> Set device_ready to false before cleanup to prevent any further
> use of the device during teardown.
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].

Thank you!

[1/1] soc: ti: knav_qmss_queue: Implement resource cleanup in remove()
      commit: 10a1969353b20caa50c320717e054601631c0d3e

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


