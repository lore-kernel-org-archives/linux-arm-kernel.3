Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E15BDCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 17:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fEPIPapwiWmQTP+hFwhjhmvdlYv9/glLLK7fn8olog=; b=vp4R+6li2QRNNI2QgPkrUWgW9S
	/BMplXSvnOVpVblW5AYBru3ye5MmibcslWftZp86XicyIRiJVNyl/89kAwVk3BqctCi6jYqu7yl6q
	XDDQslZAmXThrXuqfYx1JEe6KptqmVt9MZvO55XnEM7qAsgHbdhbdfGtvTbWgyWEnCiddiORSf6Li
	3dmSq7U2faEY6eu9c+GxY1/0NXeOEfg6YFhU/vG6g4MTBCPPcoIZHo/rkzclbfwPIfUGiV1xfiKeb
	vb/ZI2/BNlUbB1P+VOnXzm540y24zjz7hfWRIlrGv7iYVQrb1OmXJmQxq6EE1rLJ+OZL9nOTfT/EC
	nxN12oUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOnJ-000000076Ok-2JwF;
	Fri, 08 May 2026 17:15:21 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLOnF-000000076OD-2wgo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 17:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KSpYjSMb/ERPu8+JBfpuJWvJryHpBfYQNa/hd9eIQjK4w1bRsOwuBZOqp0cJVHutF/f4kXocHNCxsag62rGcJp60Eq2iMjCXMbrkel9H9mXKo1zj3hDT6lGBfhTEFQECp3Q0IHVaaLtRfDTSl1donZRRiouc88MjlCH7T7Seb88lXKsi9R+rKWsIg8nytkKNSm89Cqgjggz90DMpxI/pdOn/wW8NWjWF7x9cfRL8y/K3d5/zKDwqCpb7W1wAKPVGhiumm0MEHge1oeoMauoxs7Qphy8cVCVZcYEB+g3p2w5gcz8lrEE57TVdSo5NX2JvQmMBURU5iAEG2klyoIYJ9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/fEPIPapwiWmQTP+hFwhjhmvdlYv9/glLLK7fn8olog=;
 b=I7k/b+roKhJT+QGAPL4cT0uENIBEiLoO8ehvrNmyoET5E+BtpBvmbZy4VNqZBS2UOr30j7rqL0X7bYaGPVnm8T2zvkt8kyBMqaSq59Hw/a9t1SvXo5vFjZP85FsTbIY8PYxnxtyh9MsO6ENeUtv7s3CwTp1WmGmrmoEGf2n6dArA3V9DB9feMMDsrgZks9vjqz8ohkLcFhtGBvueKysi8p04j+FXV9pG8LtHSgp9sAH2yO1pwZR6N8XeB0XlNSUWOod7MXG4+Ws5G8vSsRCyGdFOWY0/ipvrDTGJbCrD/wfhihiAqUidrKiHmPxZqat5yOBZ7WHRV4v25oXkAz2z2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/fEPIPapwiWmQTP+hFwhjhmvdlYv9/glLLK7fn8olog=;
 b=TUa5dDyX7EWf2MM/PSJ616Rt+NsSIeAdxY+JR5LW9gNjrkTjm2Pmbe9a72n7kwbsK0hn3sL9cvLTX90DONfd9DmIfKHdt0KZB64IDrsSkXvd6RXFaOnZV3O3m3QJJOWKu96aAl93zcbzVMyBFWBWg/+60TQSWPlgzvs35Hu579M=
Received: from CH2PR14CA0054.namprd14.prod.outlook.com (2603:10b6:610:56::34)
 by BY5PR10MB4161.namprd10.prod.outlook.com (2603:10b6:a03:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Fri, 8 May
 2026 17:15:11 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:56:cafe::6d) by CH2PR14CA0054.outlook.office365.com
 (2603:10b6:610:56::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 17:15:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.8 via Frontend Transport; Fri, 8 May 2026 17:15:11 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:15:06 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 8 May
 2026 12:15:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 8 May 2026 12:15:06 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 648HF65l1822239;
	Fri, 8 May 2026 12:15:06 -0500
Date: Fri, 8 May 2026 12:15:06 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Justin Stitt <justinstitt@google.com>, Bill Wendling <morbo@google.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Nathan Chancellor
	<nathan@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 03/11] soc: ti: knav_qmss: Inline lockdep condition in
 for_each_handle_rcu
Message-ID: <20260508171506.7m7ejuyrp2r5zphn@little>
References: <20260508153211.3688277-1-nm@ti.com>
 <20260508153211.3688277-4-nm@ti.com>
 <a994a69d-2482-4e96-8d18-70a09146ce36@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <a994a69d-2482-4e96-8d18-70a09146ce36@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|BY5PR10MB4161:EE_
X-MS-Office365-Filtering-Correlation-Id: 126df4aa-c8ff-4a74-2cbc-08dead255c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: IO7B0xJYdoyvKn13aUZL92aXxFkbmjXyOO6aSsQmkzZa5eCC7Rk6VCYRXpWMan5rt3ZDvOjOnboj50nz5VHq/s8z1L/x/Xkj04/MNqWyiNU7Lcp1Xp1w7KcNMEsp0xQEgZmlgW0BDVnoJEzBbWKoN2fHf9KNCLKfRQVA+xZjJ8w1ETbYTTYz7vuUbLyIF5RIUwABmPrm93ptOg/YoTj49QEMRs8WmPGb0hZhSK1VbQ40A3znjsAgHVQ8Jp6mjZT7FKV3ux9CRkoXRdqYg2a0ZfMMvwJsvuQ0afQHLL/n3frDcnzzkcD/bjI8zROS4j3jDTxgHT/tyGMt5cqlOhjTNoVUIClmVB9VrUNxbR139MOC5EsDymfMht5wwRGC/dcNL3RzaJB3ii9OZIergOmDBfEM3AY8+HBAFJKzkt0oEJDx6zLLLgPp6Wor7GQXl7RkrUpz6IVSDITmj4yu22KxuA8wBNbLc7zXPSytNYEUIS5ZrGqo1srhJkPIncaHWZ10VW1RBcde2NzQyLVQr69HpLPp3gyQpquRo5AZFjOzgLWNY0hQ5NPBc+40Rl5rSR5CsHkncZOjsnu7Asr5tzHbQewTGzg3UVGe6JPKB0W2fpU7Vy+j2AakPg2iLL74MwQaN1a/EG8aB5cjzDmuw+u0PxlTCKLziZcesx+/JfhroMQ3ggTzGdN4lkBU2zVW/UMLK+f2tGTnMW6ixSVJ7v5bkKnrtdlsD8tENny8fTRnM/o=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VfKytgGlX3MIiQ8I2tK5qmcrZhLV6VNUw7zhMyiQz5HKDVjFsYQrEweBTv5mvKf8wim+OYaRyD9A6csirMKaPPRfCfqRvWHyq9plUEslugFkPoRhzpqmz7EXDQHiYUhw1F9qMnlusdyuL6/e9FexisinyuMBMDwmoX6lZoOtfk79Pzg3apGSL0cYYcBZofBSu3VTP/9UO7WBe4+XXc8imv2yKihxrE/dhq5Y3eWkZZjr8FJRwlLpLLkc/kE9+XOR5vo/XT+mW0AS0JinvZodnogxrKvD2Uu1FBOKsTu07Pl6CY73GejokJluxbiG6Lj2swMxGgufG3vgJP06BVyoLjXWLzXpn/KXVu3BKnV1ZhHXIPxBtd8UXTCUmr61SEtz0KLe4RsyzxT1xcp0WiT1BJaYPGndjWc6jCE5NDCyZo4yUt16qnh/lWXgN7RMlxxe
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 17:15:11.0506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 126df4aa-c8ff-4a74-2cbc-08dead255c90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_101517_747031_20F306F3 
X-CRM114-Status: GOOD (  11.67  )
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

On 12:05-20260508, Andrew Davis wrote:
> On 5/8/26 10:32 AM, Nishanth Menon wrote:
> > knav_dev_lock_held() is a single-use wrapper around
> > lockdep_is_held(&knav_dev_lock), used only as the lockdep condition
> > in for_each_handle_rcu. When CONFIG_LOCKDEP is disabled,
> 
> Is it when CONFIG_LOCKDEP is disabled, or is it when CONFIG_PROVE_RCU_LIST
> is disabled the condition argument is ignored?

Gaah, you are right.. CONFIG_PROVE_RCU_LIST..  will respin with the fix
once all other patches have had a chance to cook in the list.

Thanks for catching, I miss took things there.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

