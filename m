Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A45EFD23D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:CC:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YoH/Yu91vex/khOgoGDudirquVRrHWQbT1nk0hLUvgI=; b=0EGdzAYoaTw9CAZQj5bv6y6N7X
	tiFb36oibLejDrSwW9WxIu5rGI/3aZog96nHKt22JTbf7xW2aO+uuhkoLMCLmgTXdfDZ97UtFG7Pk
	vjwMPAG6FTdRsLXKIhs3KNuAQ62E9cGmg3rn6uAzVt16Ujq/HTv3stujFxEdKTUgpNsvI6nH7jbLX
	0hzQE4vSfmm+Md/R4bx4SNghm8lzjHT8tmxONtjwnmJFuEh+fajAqTd5Ms5Wr0XC3oOGDjxc/gKKj
	bYVaukbTEC3r8Hj3pCeBw2zsRHs4z6HZ/BgDIrhEqeBO2JQNS+eTUdVmCMn1KSHa5Px1g68+wyt1w
	jrYGeygQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBif-00000003jd6-3SzW;
	Wed, 25 Feb 2026 10:02:13 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvBic-00000003jcZ-110h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:02:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=guEPVwKNNZM3UuTePSSppxjPMVitASeLiajCVywxdn6dHT3eLIRfdN4dbh4vzhQdG3iZc1uKrTtmv9RfzIgdI7e+L9pcoOway1npvodhChtiDGx0biUU/d7JuoZXIG4ukMtb7AnxoYJpaBklMwa945K2fuyhXvEwj6fOngfWq4tMRUlVcmd/KhUy9b13TnS/xqQgvyVgkhVDg3Lqh9B+gATmln/Lr1agLoVcbx0NaDPo/znDsjcwd+gO4fL4QVl5ET9c0P4bnQ+DFQnPMCV3rtT+TEJwQ8YJB300yYQ8HkCaqEKNA+1San1NH68db1ePeM8tB+4joX5VTIS8vBxLnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoH/Yu91vex/khOgoGDudirquVRrHWQbT1nk0hLUvgI=;
 b=JihTSItDD+Qz2niKYqLaHgC8rx1bLMaQsvYgcQvSqjCVy+c0+XQDnl/2Md8Tbvzw4tmT1yV7lDPQsOsm2fb6u1zIqaNCbgrrBUM+KBPxR5IuMgRzVI+4JhxGhIADb31Qf6jQtYtRJhqjPVg76XJLy8oIPJJybXqb4OcxD1NRwFb23QjEnBNPLpjmoBrtU83AIfcMsKcNdSluXibV7sZjyh/Bntwn4wqgQvQUfE6EpxpMBkuN5L9xT2/Vje1ianInWtcXHY72voxLebggD5MYw9HasDDts23WrI9e94DekIgGXIBri2RpwY/d9Ovz4wpV/6UnhQFfidHF7b/GYIX10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YoH/Yu91vex/khOgoGDudirquVRrHWQbT1nk0hLUvgI=;
 b=SmyuIE+ZgYM91mqC+fkwZD4MKKxEa+S7u5ctvMPmzPOzPjbHIoyAvHYqh5epnSzDQhBonQLNQw3iqYx33ZRY9NY5SH3M55RIwmIdlbtqnN8onWWjTZX+Exf8oRZgO3JPJjIOJWwkf80YgZJfeMuycS90NLSve/NCLB/biFX52n4=
Received: from BN9P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::26)
 by PH7PR10MB5878.namprd10.prod.outlook.com (2603:10b6:510:127::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 10:02:05 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::6b) by BN9P220CA0021.outlook.office365.com
 (2603:10b6:408:13e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Wed,
 25 Feb 2026 10:02:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 10:02:04 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:01:43 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 25 Feb
 2026 04:01:43 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 25 Feb 2026 04:01:43 -0600
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61PA1emK249595;
	Wed, 25 Feb 2026 04:01:41 -0600
Message-ID: <6b1e747a-fa42-4f1f-8d57-41f9d7b574c7@ti.com>
Date: Wed, 25 Feb 2026 15:33:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: <nm@ti.com>, <vigneshr@ti.com>, <u-kumar1@ti.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v2] soc: ti: k3-ringacc: include platform_device header
To: Vinod Koul <vkoul@kernel.org>
References: <20260220070242.470060-1-s-vadapalli@ti.com>
 <aZ6pQMGJn99ZLWyb@vaman>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <aZ6pQMGJn99ZLWyb@vaman>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|PH7PR10MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 092677ab-c392-494d-a3ce-08de7454edb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|34070700014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: cTLUwy+D6HBVH4X/iufRfVJQHT3CNe75+dpB2bBeXW3q972NbCMfynAHQOJ4hFPYIEKd+ahAmvplUfwiK1mZflLnGNutRfGWS1T2fz1WtkNeTPNKXt5J3YtgPRE5bdu7LsFoNZnJqSAl27XvUkdVtysW9de5xR2m7OZ8f1quH9h754zoFY1KSrkDqrvRkIrJ8LKnFFn2kdneJRGdTy1lU+YHkOV74oAmxVrw/4yLHSEU+Kcypi703X0ilDhgS+qduVYTQRObLfbAChkI/I2Rfwr+kPZrSVvIP1EuTsPskGZpgQcH0dqUjJkVthKUxEzm2/gp08OKlKAZ5RWKGUm9jj0B2u0n+PLmlZkMjba8DmVLFJ6W9F5YHT2qsjXFxxioTURqEQsqelKluxe6JxQsRcjWwlD1/DfRQua2Lajun9nHKhD8TcgM5EN5kjgiAs+L/ksp51l20XouXkSk5oMlwaYg74QxZ82O0qJcqlPzneeMYIOy0hlICz+9yf1fmD+xver/JAhJ0n4ynKPblQtxQgitPq7+LGBMuUkNXOMOOxHkmNMg6UtV3yK2FsfOOk6zyhX09nNv8yeilawR+Al6UjnGssW/QzXNyOJiyXX9g9yMCH6b9wKBJP95F1Y3LJQfjZFBRmvaomomx1bd/l95lB/4tdF0/eNV1a72qtZM4rzPMoHYR2XmV5SLrwV2VyqHRpLNyRhfRHJqIxv7kdQwjnuvbxKLaXoa0qk+OfSNLwluX7Whth1N3CG9GkWCFgTakyASZQ4XkEAQXGAXcDGtmnhUUe3SiWnyVM+P1qvkNMjGePpMpo9NX1nEhD/TeYgyqJTH0O7Y9IkXywqYu3u+sw==
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34070700014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: vjWiMmhxe2cAzMFHJz2okKBOvnXjNUysr+ZVEOwu15dKpvrilvncK6gzIVgLymbnWgiDCSdJZdJhPKK2XRWk1pwNWTeCx502yVfpxq8CIAG1lGpPILMcyrpDETrGT5GD9uAEd1oTrV1PhLp2PdZ5mguS5DoMwXC+TYMt1hw2mXqBSJi7hgirxKLRzheM3zKMALtQrGK/bh9hsKJs1TNo6JsiW/hT1+vKgZodptaYjX5vmMWlrK9NaLMd6U8OcG1+vUtHTbdKXsrkC6uYE5K1ntFvD2nKMqM62MrQMA4iv2ETXUiZKVc4yJ/jpSm/pt93HDSRvlqxUhlL0uVQioXEAtLtmpPbYKutdOfZuzM8iIQUQrH4j2NsIHhhYh/qEIlZMW05/f7WzXPbwS6quVquX8uH4jkwHCr5GmcE7LvUGLy32A/m8eisheOGG8mtttYT
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 10:02:04.5984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 092677ab-c392-494d-a3ce-08de7454edb3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_020210_704179_0F2E2092 
X-CRM114-Status: UNSURE (   8.69  )
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

On 25/02/26 13:18, Vinod Koul wrote:
> On 20-02-26, 12:32, Siddharth Vadapalli wrote:
>> Users of "k3-ringacc" APIs may not necessarily be platform devices. Such
>> users therefore will not include "platform_device.h", resulting in
>> compilation warnings for the APIs declared in "k3-ringacc.h" which assume
>> inclusion of "platform_device.h" by its users.
>>
>> Fix the compilation warnings by including the "platform_device" header
>> file, which should ideally have been included since commit under Fixes.
> 
> Which tree is this intended to get picked by?
> 

I assume it is the SoC tree since 'get_maintainer.pl' doesn't output a 
mailing list apart from 'linux-kernel@vger.kernel.org'.

Regards,
Siddharth.

