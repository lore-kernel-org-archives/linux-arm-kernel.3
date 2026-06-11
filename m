Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5B2CD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 09:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JG9GkbmZWeHeIenYh+zVZ413zV3V+oqy0gR1VcVBX1A=; b=p0M1h6VsTRwDvHuQzyowM4gbRl
	pt+fkRXhIYlGh3uGD8xGBUz7sBrikdnvgMcfKe5LnUclCKMeViE2g0+d5LqFDBupUVfaD5I5hegQ1
	LcROQFKhqc7nULJw+3y9VckTTPjHN4Sw6vAY2O32xS6JcqrCjGVNyR05fVzX35BFOG9Rk5yL3Qt28
	U4b7yDXyOf0mNEz8xBBBmS/QjWjc7LpIH2XpPCT+nEWVFaomak3JKy9mExrMFjzneh6P+GR+jE5gl
	IJJbPcTbVo0n+OJiJ7cD7J50jR2T5TNTk5PqkJhBIGpRDxiJvi+pSDjeRdi3djHCcPm4IUYpnfedL
	uu6MSF1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc5D-00000009Amx-3075;
	Thu, 11 Jun 2026 09:52:19 +0000
Received: from mail-westus2azon11010030.outbound.protection.outlook.com ([52.101.46.30] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXc5A-00000009Alu-2eQZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 09:52:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvZxCl9cJ8A+Xa0S1aVYO0ZONrYXnNMreweqJeDRq/YWGSmzrAu9bSahmZjhFq2Evr4fMziECwKHchYumabLX1vQemnJL2Q04xMFEidYTfMfyvlH6I8tgtpeDJ9a7cqBcNl6mSu6Kj1drbXeFkXGnq7v1DlxWe0McsRsc+UV4NAfV/Cdxx66OWuhiDlA4pSjjWJ3J00GY5HbSnAzpFpt25HrS1Ez/xxVr3n+0UvIYll71GymR+6oviJS1PaX/ImJWBi1pfwsMX8N+cI9KKaeOs1vgm3QewOivlqgz/LRvyi/0k9vERRvJkj/M5HWMmcHYmCODys92SgUYAqATlnRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JG9GkbmZWeHeIenYh+zVZ413zV3V+oqy0gR1VcVBX1A=;
 b=oqxVCj48Wr5dmxTYrqZg1cfml3zenW1qPuoZsQHnSwtiq/vqC7jzLERAsx+JcS+8yNIMC2d93+iqwopBm+JXrPbOrdTmuajme2Z4k7WlNvT+NYbw9riB8WziE6tk4ol17+I6Ckq4xlmlJ4zVvX+VDL+2hwO5ethFJ4y2+J+gY89IJnkOJP1cIRaEZaXk+cp9YggRwgxPZvWcaPqePgnY5i3R7Oby8Z5pQYtfdqXhOhGr6vrpwqkx960pRMrQzKm2bZjets04GOubTsrE501/B07F/+wniaZlVfQrjHdRZWrnAFME7zkZUJbgJ7hlN6aS3J1gn/Q/Og5I0ouER2dlaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=linux.dev smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JG9GkbmZWeHeIenYh+zVZ413zV3V+oqy0gR1VcVBX1A=;
 b=xYV1EY0DBC/ZaA0jLntmUn2q6IKn5H+fgYGPZCS359iiQa+Z0vXx9PdRWunm0QIGLv7+IgiIODXhaEljv3jlT54iDliUOzrRyfociIAlR6eHmH+z3/HMj+DCUnRPq2Tn18ggiH5/6GSY+9Saug9iNgRM/xR3EycgONTgF9llmRo=
Received: from BN9PR03CA0437.namprd03.prod.outlook.com (2603:10b6:408:113::22)
 by DS0PR10MB6079.namprd10.prod.outlook.com (2603:10b6:8:c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Thu, 11 Jun
 2026 09:52:08 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:113:cafe::1c) by BN9PR03CA0437.outlook.office365.com
 (2603:10b6:408:113::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Thu,
 11 Jun 2026 09:52:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 09:52:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 04:52:07 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 11 Jun
 2026 04:52:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 11 Jun 2026 04:52:03 -0500
Received: from [172.24.231.152] (danish-tpc.dhcp.ti.com [172.24.231.152])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65B9puqs1627783;
	Thu, 11 Jun 2026 04:51:57 -0500
Message-ID: <6367ffa0-5faf-4deb-8a4b-18b53ef53c56@ti.com>
Date: Thu, 11 Jun 2026 15:21:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 0/3] Add standard stats for HSR/PRP
To: Simon Horman <horms@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
	<skhan@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
	<andrew+netdev@lunn.ch>, Jacob Keller <jacob.e.keller@intel.com>, "Meghana
 Malladi" <m-malladi@ti.com>, David Carlier <devnexen@gmail.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
	Himanshu Mittal <h-mittal1@ti.com>, Hangbin Liu <liuhangbin@gmail.com>,
	Markus Elfring <elfring@users.sourceforge.net>, Fernando Fernandez Mancera
	<fmancera@suse.de>, Jan Vaclav <jvaclav@redhat.com>,
	<netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Felix Maurer" <fmaurer@redhat.com>, Luka Gejak <luka.gejak@linux.dev>
References: <20260608100930.210149-1-danishanwar@ti.com>
 <20260610184737.GO3920875@horms.kernel.org>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20260610184737.GO3920875@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DS0PR10MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 197ada4a-04d3-4bd7-7eed-08dec79f1a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|36860700016|376014|1800799024|23010399003|82310400026|4143699003|56012099006|5023799004|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: xCx0xotw808SdLy7DgzzQJJcweyZh2tuN1htQTIw6vBGVQBZq3Oe9Ve7l3lXiqxbXhVIl1LU8jCMVTmxH1k7hfHOU/b3q1qQN7lFtRiR+uiBGozYZoQE7SecOSjLJZXVBc0aBVghTLHA6ej/CkYbYd6AIJOXLMTUbm1E4lxK4OUzk6AJVi5kUI5xuci2WOtW+8w8sYLvheNUamhqGHiH9bNkj7cnzZ7JePvJ0Ao0DAXNuvCWLLPtuJwsMZseBMHLVdhp2VanAf0CjK4aPtD8M+A2KMw+SLcXpGv3BRZ2bHwUHpxofGq5hFNT3Wzp9+Vd0mZVRBLQ2ONWQHfO9sydcszIGIHwNY2zkiBloluXGLmBBqLKkHsVRLQxV5UkcHUUu7AON0N6+8eCePuP5dFKtL3jbHfRTH8cJfaGAad1BJYmzpZ6r3UVifGvLSvYIWEROGAlyCcbw28IAsyfdEFmeRS2gP3aK8AY+feQUK4WVgFjNVDIsm86BXPILHxDlqNQZOhoUGCm15z2csqCY+ufLzbJ1vAeDdy7DYYdbuKcN1vW3o83TAyMFCd/ZWXIXmXhrP7YJR+5iMdYdntR5WwqcFqkSu+dqm6ueiRfJ9IF68GCGfAu+6p0BqnfsrPtNdpiizhIbdiUycGOGu1WMyLyF96kvDiyKIy+VTiXCsI5lcnEkSeGlttXbDjJ88FU51MS
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(376014)(1800799024)(23010399003)(82310400026)(4143699003)(56012099006)(5023799004)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4DiNlO7ygQZDrVs8Qo58TcdL2FHUhfrHAVlpfUprD/4ma3RS9OB8OaTAZz0QbtjmbEFPBjuBvd6aHg7TgxmaB7gx+65uhMApFdMCWpiXeu+I6jhqfqCN1QJRa9yg4z9WjJc0cVW4ysVpVL/DRfP1D5lkpUuyHzdoFdib12qzf9gZBjA4lWBvdQgo+nQXrZy+p9wbzRT6ud2i4jVe/fa8mHF+VYWuC5DrFiUhWl7nwSBPOSccRpq3CIbab4F3iEhTzsKOmd883glCg2MX0t3fB9Wtc0IE604uNLFQVhAV5FW0Q/3J8TqmQzZo6yw6/MUc+7GzcJHdExJ5ITJFkrDHwyE3mXoVBjhiyzfhn5JFhGp8dmTNTXHMNvVDqS4/Cmrh5+/RKtr2X9R9IJWdwkMk1f3yqNMvSwaOy1BHQJGzILet7ty/z28PJTzq9Jyolkw+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 09:52:08.2605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197ada4a-04d3-4bd7-7eed-08dec79f1a0b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_025216_677643_EDF79056 
X-CRM114-Status: GOOD (  14.28  )
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

Hi Simon,

On 11/06/26 12:17 am, Simon Horman wrote:
> On Mon, Jun 08, 2026 at 03:39:27PM +0530, MD Danish Anwar wrote:
>> Add standard stats for HSR / PRP. This series was initially adding HSR/PRP
>> related stats for ICSSG driver. Based on maintainers' comments on v2 I am
>> now adding support to dump standard stats for HSR/PRP.
>>
>> The drivers which support offload can populate these standard stats.
>>
>> This series only implements offloaded stats. For software-only interfaces
>> Felix Maurer had said he will do it later [1]
>>
>> v2 https://lore.kernel.org/all/20260514075605.850674-1-danishanwar@ti.com/
>> [1] https://lore.kernel.org/all/ag87pBZfOyccPZTc@thinkpad/
>>
>> Cc: Jakub Kicinski <kuba@kernel.org>
>> Cc: Felix Maurer <fmaurer@redhat.com>
>> Cc: Luka Gejak <luka.gejak@linux.dev>
> 
> Hi MD,
> 
> There is AI-generated review of this patch-set available on both
> https://sashiko.dev and https://netdev-ai.bots.linux.dev/sashiko/
> I would appreciate it if you could look over that with a view
> to addressing any issues that directly affect this patch-set.

I did look at the AI-generated reviews. The review on Patch 1/3 and 3/3
seems like a real issue to me which I have fixed. The reviews on patch
2/2 is not related to the series.

I have posted v4 with this fix
https://lore.kernel.org/all/20260611095035.852370-1-danishanwar@ti.com/

-- 
Thanks and Regards,
Danish


