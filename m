Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA76FC9EC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 00:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YzRtkAQPwqXMDZ5UjTIfIVlRBorv50+ohKl44Jb7Cm4=; b=G7PCv/1j6i92rALmZOpUhYlii1
	TLeYLuHpkBjvhhmm1sIGGMkn6gChzdlZ2GdDMumFuDYWfKEokpefB1+gvQdQX+IgcfvMzrc1f/UjC
	NjHwai6glH7KHlBDm/+YA7UrVisBCfqAB/b5xnOpNCGvuP/ovmAETezWqrFJ0/3OOuRRu3N5+CNg1
	GgoOBSC0QfKjgTEWenZQJ13dUhzD/UOd2VE2n1qCz+AFtlK52yUbzNLERMsP/FcKwDubwMJ6Kd9Ab
	m2bQaeF4aLIwv4R8k2wconuk82KFyjiLNnFrDb3LsQMwuHE2epZ3PpieMQhyLXjUfrEdkU3ky638v
	khcKh9yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfQa-00000004hnu-0FOp;
	Sat, 07 Mar 2026 00:21:56 +0000
Received: from mail-southcentralusazlp170130001.outbound.protection.outlook.com ([2a01:111:f403:c10c::1] helo=SA9PR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyfQX-00000004hnY-2WCN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 00:21:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u/PtUVzmxySFie1lfFy71CF6RWB9vb+YYc+Ah192NmRJsbD+wl7WPRR4Ry3uTuX/j5GWnudI2o/dWIvM0Lj0Df2H0q80rtuDYussDD3xXTb4wy0LKfTAzrA1lLLpopXm4Y8hC64ipj+OQ//Xh1DyDKw8xfVQCdiYQ1CKpEDq+POv/uhoYJDBj64wup1IsK12RfzFAjETgDqGcgruEOEjS0C7Kw+MJ0JRSrhikRhXvHpqbfDoIXJRSdfvzMCe1Gq0Z1WEtc6vT8CBwT9KP87QInXXqXCTkIaJuNlQJpTM4yYmSe39G23id7164AwaWvGvo1koNFADwyEQiYt70LYPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YzRtkAQPwqXMDZ5UjTIfIVlRBorv50+ohKl44Jb7Cm4=;
 b=pysAhh4Uj4HjNzWw2Ad1t9KKj5wgPXQ8yJX/6DyEvf0OtkpZaef0DLaZMcQl7pPQN1mnkHHfkTa58zXepT4BI3WYSXtWz4BUOHRCfpuUnOQwZ5ZX+T15M35f6gyufMAG9gW5TNrZWVY3EtkcRY6pYf2vKLHqE7WERStHLvLdpVpBNzDLVUtFat3K9ujs6ZKKWOAuWq9i3I9ug4jmvk8dPK3NugX+GOHBh/4VTEcmAzeBnsmbc7/zbjZpA+NtGwrErDdT2/DOZmWBJeZmJuCG26TFsV/wNmgimrShzd47MXgD+Pmj7yKREDwSpFhoCva2odPuBGk9n/xSUCX4LMR6vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YzRtkAQPwqXMDZ5UjTIfIVlRBorv50+ohKl44Jb7Cm4=;
 b=ZkmODoD8tNMEkQ/Rsvxd8XmhkmBrWALItROP7xq4DkEO7ucppgZ/GAztJmLbD1jkZPKwPqnsqhP4wrAtlVANqk6HcJuogg8rihOuj03Kyo6HX1wPgBOjRd+TmW8/xcSoR/2qBUzWpTmNQYxIeqNFja/WQVVF4ozQHLKZFYD1eTg=
Received: from BN9PR03CA0145.namprd03.prod.outlook.com (2603:10b6:408:fe::30)
 by SJ0PR10MB4559.namprd10.prod.outlook.com (2603:10b6:a03:2d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.19; Sat, 7 Mar
 2026 00:21:48 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::b9) by BN9PR03CA0145.outlook.office365.com
 (2603:10b6:408:fe::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.19 via Frontend Transport; Sat,
 7 Mar 2026 00:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Sat, 7 Mar 2026 00:21:48 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 18:21:47 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Mar
 2026 18:21:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Mar 2026 18:21:47 -0600
Received: from [128.247.77.204] (a0500327ws.dhcp.ti.com [128.247.77.204])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6270Ll8K526879;
	Fri, 6 Mar 2026 18:21:47 -0600
Message-ID: <996246e4-b902-40f2-8ce6-c0fefe64d693@ti.com>
Date: Fri, 6 Mar 2026 18:21:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] Add ICSSG0 dual EMAC support for AM642 EVM
To: Krzysztof Kozlowski <krzk@kernel.org>, Meghana Malladi <m-malladi@ti.com>,
	<nm@ti.com>, <vigneshr@ti.com>
CC: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
	<kristo@kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
	<danishanwar@ti.com>
References: <20260228113203.498839-1-m-malladi@ti.com>
 <811312d5-a48a-4ce9-80a2-7c04d0b34a67@ti.com>
 <e787a907-f8cc-4f31-9019-c07f5f1d4fdd@kernel.org>
Content-Language: en-US
From: Daolin Qiu <d-qiu@ti.com>
In-Reply-To: <e787a907-f8cc-4f31-9019-c07f5f1d4fdd@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ0PR10MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: 43288b2d-7e7b-445b-6d96-08de7bdf85ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700016;
X-Microsoft-Antispam-Message-Info: Sih2KHDwwatY47fB4EQsT0gQAmPdxwW33hkVSaEBn/cB+VpbnNfJVxGjYjohkRPlnDSWLgYW8Ksrsd1xzb5T58fJMfkq/Hqp8UyTxQHibJTR0/Indfi+Cngs9eud6xU+JGemWcX2/46uv0KT+FJ/OluK111teG/1BAm6cF0FuId6Bg6FANKvXgrY2zbdcIT/+rWJysfkY1dhjna+5t3CPP/IUJaj9ju1bN53Z0j776QMVJX7vgTZv59w7gasNQcHaCTMMGoWtCxBXJEgYf6wKPrkiN4mN5Dd3wzBLOorKZIrrTUH9Dq0aZtM1Ta08VZ7yyTXTkGheizuZYJnAq18p0JgCZLfFc49UEIW4urGtPDS1IGesozmvtD5inhISqLIVkWrLWjaYoeGFImU2kVImhZ+JPC0M9F1HmtOO521bHpASS94QvWrWbtgCduBKWjU+TA+TqUUCGdJ6I4k6uok1TvFnAvY6KgAc41fsOAqL0DCCSX/Hvg129TYtvGMZx1E7JEHFytoKxLtxSAf3ta+S1Q7NEugbJZwSeXkQjz4A4GzvnN5AtKQFECeVlsW7z3kBXiFOWqnyUI9W1jBL6PmpPGkQz3mN6VYATty4Ks/qFtV+S1haZsyXdL71tqXriNyDX+GBwkPHOYJtqFYGRSp5nAVrSJV0S9eBy720JGUd7z8achAKW0+9Q6yotjlYrs/n4v44gvlkwyu/Ma8cVarFgfrZDORHJYgoTo7QNOMr38=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: I3YAfTvCJ1vtycf4CN5odnOJtfaOfXJHUm/2rc8mgMbshhkEhEDCe3juVBBZwmmVhlk0kXVz6w5bPtj4cY7FU7VPLKiGH5F5SFLUYm2bDoV7TFte25KYpa+jecfZWBP/WtnxVa8/yVKr8KrkwqWQsft7Km2k32U9UeNrwjJxx7eK3C+7hGgDQwF0yla+Fv+qjNdvaYJJbdYqVffFyTjzSb0YA5mMTlwkmx42f8BeIlgdYq0gU5lK/vqxD4yJQ+KpAehz1awdcPwse5E98uRr7VKjl+zfKR/c8+zYX14hNk+6ocG39PRLgx+DqjLMGz1jpMI5ipKZ9ZXP9sKYs0HBKbXrUjcHTk0xpKAREx76q0EkrYJ3+/jUNT8oUSE3uZmUKRTkmY0lrNPjKudpwrJIRNlVgKZV3CGYy6S6cP/3ALjittGlP+h5KCdrlDAA+oZb
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2026 00:21:48.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43288b2d-7e7b-445b-6d96-08de7bdf85ac
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4559
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_162153_734826_03ACF29B 
X-CRM114-Status: GOOD (  13.60  )
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


On 3/4/26 09:44, Krzysztof Kozlowski wrote:
> On 04/03/2026 16:32, Daolin Qiu wrote:
>> On 2/28/26 05:32, Meghana Malladi wrote:
>>> This series adds device tree overlay support for enabling ICSSG0 dual EMAC
>>> on the AM642 EVM, along with the necessary PHY driver configuration.
>>>
>>> The overlay enables both ICSSG0 Ethernet interfaces (port0 and port1) in
>>> dual EMAC mode and can be combined with the existing ICSSG1 overlay to
>>> enable all four ICSSG interfaces if needed.
>>>
>>> The series also enables the DP83TG720 PHY driver required for the
>>> DP83TG720-IND-SPE-EVM daughter card used with the ICSSG0 interface.
>>>
>>> Meghana Malladi (2):
>>>     arm64: dts: ti: k3-am642-evm: Add ICSSG0 overlay for dual EMAC support
>>>     arm64: defconfig: Enable DP83TG720 PHY driver
>>>
>>>    arch/arm64/boot/dts/ti/Makefile               |   4 +
>>>    .../boot/dts/ti/k3-am642-evm-icssg0.dtso      | 203 ++++++++++++++++++
>>>    arch/arm64/configs/defconfig                  |   1 +
>>>    3 files changed, 208 insertions(+)
>>>    create mode 100644 arch/arm64/boot/dts/ti/k3-am642-evm-icssg0.dtso
>>>
>>>
>>> base-commit: 4916f2e2f3fc9aef289fcd07949301e5c29094c2
>> Tested both ipv6 and ipv4 ping to be functional with the following
>> topology.
>>
>> DUT 1 eth3 <---> eth2 DUT2
>>
>> DUT1 log: https://gist.github.com/dao-qiu/f261147110b6b05d1fb989ee74e1d694
>>
>> DUT2 log: https://gist.github.com/dao-qiu/3add536e2370d6afe36145f46df784e6
>>
>> Tested-by: Daolin Qiu <d-qiu@ti.com>
>>
> You cannot test defconfig, so please don't post it to cover letter. Same
> effort for you - one Tb tag - but now you require maintainers to handle
> it specially when applying.

Apologies for this, I was not aware the problem with testing defconfig. 
I will keep this in mind when I add the Tb tag in any future patches.

>
> Best regards,
> Krzysztof

