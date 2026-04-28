Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C326FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 12:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UOrOlfjyVKCMtb/ajycqxE9MXc6DG1VOCdBbm3f+So=; b=KmnkEADjgeEo3wneZwjR20yD1y
	LuJ7p8GYNputB2ubQRj70ULwnjU56nScwACTlSxEEHvC5KKB0uWLSrooLHzjcx8ypSDBuf0xR32qa
	EcKgVTTmAlYd9wn89M7pPs69c1HzTfcLlHwtdPuCzh/CiGntkht+Ef0NPS3xAtPPMm00ZQzNrwfCU
	mQCLQYHT4FfTOo9Y0Svh0mInLVgXtTyrl1TgSSTtm741FC6PcPECGN94++wOufMYwqfkpIlW/BEEX
	SyXTw8BaF1c7x9VvjLtUz4lkcUP9K9jgP2TalsDHGp1BS+4tr4gtvyoblO4jOrDRIW0bhVnl1Py2K
	8wML1KFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi0T-00000001Tks-2Asv;
	Tue, 28 Apr 2026 12:57:41 +0000
Received: from mail-westusazon11010011.outbound.protection.outlook.com ([52.101.85.11] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHi0Q-00000001Tk9-0qc0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 12:57:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVw3X1pq+2MyGy6iMOVqiuIqi16kxp3CC0o2KOB+xTvTZKwxZeQaxUdidqr0oPogXkrrrgBeOWOEOmqOCj4wE9RpemgyksODdjeu94gy84W2/p+3cZsck3MoXoIfPj2pvyo6V8ZEyCnpTjr7ts1MKpL00RAXl0Cl4NGuDA+llIMV1YCDjI7avhNPCyU2Z6VBVeQ10ib3kE6lYQjjvki0mKEUDWQKcVKVK0QIb0Kxq7Ty83Auiv/JrUbQf7aPHKAZoDSX4B+S8BNias2oqTwJDUnC8OkN39FYMRmW9qKD88qsUXO9Jcyk7ZdO3+aBxTlaWiIMcNVXKoNQSvrMVGRCSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UOrOlfjyVKCMtb/ajycqxE9MXc6DG1VOCdBbm3f+So=;
 b=tAsIzKftif2soa8S8gm4op3wci/Za6F75SaTF44+mgumtVPgBwczoqU03kCvRawrM1YckAnG7QCQCYkn9lUuP5YcIRkSiIhJ9U9WszrBSnfVAJIOf0SDkX6a/qbgTB+X4JGd0MQnCg/2KcoQeQMlVOuX+YV2wwSGBBanciedFXe+UmxLyqfFBzFQ00EYzm1WkWQ49gzcL5OiX2dYn8mZNWtJFD2beZUYblS7JFOMzHURl81hJ9iNhov0syQ+HpG3kiS99ZDiwZExTaOm/vdjIs+7JEybjI3sDz7VXHpxCU6vNuL3SB+TbryUW1QoCThCA9JEqplYNaThtQVlwiDylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UOrOlfjyVKCMtb/ajycqxE9MXc6DG1VOCdBbm3f+So=;
 b=VwZWTBubWNgfhu7fWQoqzPTkG5lufDPFsbkF7tGfiERhHVXM2ZayoxrKCcw2/YDdMFgWc+CtLtowyJRsnedNAN1ph0dtUGfMezeHEceEnwT8fQM3ioJkCYreFkV6PTl6yog4UzboQ1Wm/FyxaOrNGqVUaq2ygW8UGV7ILahPtoQ=
Received: from SN7PR04CA0181.namprd04.prod.outlook.com (2603:10b6:806:126::6)
 by DS4PPFBD26857F8.namprd10.prod.outlook.com (2603:10b6:f:fc00::d44) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 12:57:34 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::e5) by SN7PR04CA0181.outlook.office365.com
 (2603:10b6:806:126::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 12:57:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.48 via Frontend Transport; Tue, 28 Apr 2026 12:57:32 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 07:57:31 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 07:57:31 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 07:57:31 -0500
Received: from [10.249.134.231] ([10.249.134.231])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SCvRhk1213541;
	Tue, 28 Apr 2026 07:57:27 -0500
Message-ID: <69fb51b6-e5df-4971-813f-a48a7a54accf@ti.com>
Date: Tue, 28 Apr 2026 18:27:26 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: ti: k3-j721s2-som-p0: add bootph-pre-ram
 property to pmic@4c
To: Thomas Richard <thomas.richard@bootlin.com>, Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <gregory.clement@bootlin.com>,
	<richard.genoud@bootlin.com>, <a-kumar2@ti.com>
References: <20260428-k3-j721s2-som-bootph-pre-ram-pmic-4c-v1-1-e8202ce955a0@bootlin.com>
 <6aa8fd45-ec3d-4bd7-9b13-6c00e4fd4efc@ti.com>
 <3a78ff9c-e70e-47c2-b356-2bf9d75bc372@bootlin.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <3a78ff9c-e70e-47c2-b356-2bf9d75bc372@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|DS4PPFBD26857F8:EE_
X-MS-Office365-Filtering-Correlation-Id: 8581584d-9d09-40cd-46a3-08dea525b628
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ArXxU/eUq9XFLA2FyT737YbyW3yM9kHr5sLQdB1RLvLqCMwDe7XZykgDAq+J/2Kf4TmaFcOmDs8FF/dcT1/eJhxm9lFcLqHhrOSZil3lxergjP1fkNoLz5K8PATAND9NkrHm3mqSJeSYXWML+ZMo22Kh2CEQKNtzmfhot3p10xOnRuNqXJLLzavoCOMWvrdnA9DMy6NtsNaDr3nZyUzZm+7rd+u5nd14ZxCVJtndyHtruW+DT+wICDJRMHbm+qXG3yQf3I4d9hYnr6aVm2zVIQ3fVud8GyC8cq07Y3Lj5VzA/00zazPYmZ8Jd+affGsls/kKo72Rpwaksxy8FQG5Bu653ntgaAYRnugWh0Px+cHBd2EKIrNtU5U+2Az/KigRGpR7aq+QMHQ4TKX5dLODbBAIb+YPAfGrd7y/KQo39bLAxwehlUUyTJCKAZyVW/GkT5s0B82SBwyQ5IrA6g9PSFYBVOoz3l/jxbJMaW084ENc94boMxPcrFJ/tznwe/i9wZHvG2p1fcq8Ni6YqULnVknR4Io5NjZ4IvP8slpt3gIZhPKK2ILLBse2JisiWkwNYwOg/S0wf4TxEzzW19rzxlCScE9XotA3KBQs+zpg2JQunwhzqHPJ0bk3Bc90txXuk/wvE6FQ3TETj7wuR2Dvw9ax7Z3xHQRpQ8a46SvJSAUZjycQTTapd7jYEMUUgjMY36HMyUQQkkuROGCQcT4rtqqPPSHsg0XOHR2wCP1CBv3FYt5TdZIwY6KR1ETl6f3kqI/docqUgrOh7VR1oWxWGw==
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: RvYy8tyYCgjGJfKjlrVZOhYRfsl2DNZLM7gJKmgiXgTC9oqANdYp3U+5kO25nyU9Qc86BCtkb0xxLnpaeg1nNynesI9+Ad5vpISRxh4YxcwRKLhPogKb2nEP7vZmyjGSPMDiyPSPTzihQyOrjvGB8kkMRHvTt9RyzkGOMGEznTkFXA1QiUPSYXP9uZSn34cJIw4adNlEd9zFomroe3ilzSDqHJ5GZ5qCy11RHDeBPdqVfxUCfHGAFNpD+ieEF26jfouW+inFgLEx0/SQSMXxeSC4WBTK6LBnY7QoixKSm5cfdYNgsFc+cEFj9gBPMDGMjHvqZy33b199S2c3kaOcTjqy4lx2cPNbd3BUHXCewYsUt+Dr6Kdh3n1g/HrJ8ze7FfCguotXV9WJqnO62hzCUBjYzecBmd4T8Xmyhg9jttLfIEXkH8ewACuyruXtwhHW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 12:57:32.0918
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8581584d-9d09-40cd-46a3-08dea525b628
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFBD26857F8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_055738_346489_919E10D0 
X-CRM114-Status: UNSURE (   7.29  )
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



On 4/28/2026 5:36 PM, Thomas Richard wrote:
> On 4/28/26 12:15 PM, Kumar, Udit wrote:
>>
>>
>> On 4/28/2026 2:23 PM, Thomas Richard (TI) wrote:
>>> On j721s2, pmic@4c is needed to exit the DDR from retention after
>>
>> pmic@4c to PMIC-A to align with schematic, please
> 
> You mean PMIC-B.
> 

Yes,

> Best Regards,
> Thomas


