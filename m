Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DA2CD6E6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZkLny3c8lG0NHpQ9QLnewkOtgOyTX6LzNdoiDnbRtQU=; b=irhh3VLYEXac1k2CbdHNvht9+I
	Ux/oQ/MoIJ23tsWnf9QgQdCNb5aij0XmO56ETrWjGgLqICkIXhzv1lH49SrAyWO7eDsemBZe2baSK
	JBw0te12/gZmWYUH+DxNNEa/WAvv4bCjftz/8fiAU6oOcZ+kY6s1GQrD3zviwtbc89XdFyuWVbxlz
	b7kzlySAdmZBIoPAQEmtxq1EMwGXK+WAf/JYKVJ93zzbIGcJaVd4VBRfv4sheYBzH90bOGtLyphvy
	Zi0obe1dnCKiGA/ozDgHMsko2YLnOgZNoyhKru1X86pKPvGels74sKV4wsTuFSTNDTiupqGIwVzQ2
	P9eZ56ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8Ig-0000000GoNa-0ZDG;
	Thu, 04 Jun 2026 13:39:58 +0000
Received: from mail-eastusazlp17011000f.outbound.protection.outlook.com ([2a01:111:f403:c100::f] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8Ic-0000000GoMz-080x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:39:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oc8WpnnjuohM9neMbS1CPeGkbDR3gN5uAmkMb0O/WfgeKYkXl6axwpDAVDoox2mbPze1QGo0j7YoHh51LSdFddJn9kTz315tUqKxSypKS24YK/uf4vsWUkp58xM2qPgtRKaWUsdu/rXLO0iF3HAeK5A4Wf4QXvmqRWBStr3zhIiHKFtxMDMSGwY1IDlvihsYbm1puWk7b2HOGJhu4sGnlfKWLmZFkcxvSARvD6LFZbQTXTv960HOzyM01/T/u4LPXdkYAQq+NcbxMYNoiZT4bxpS8G6ptmUqWAkjbsMYmCbLSU0RiHAn+tonvqq3m0M3FWS8uhpbIVEOZepilwwgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkLny3c8lG0NHpQ9QLnewkOtgOyTX6LzNdoiDnbRtQU=;
 b=GXzPKU2F8IDt+KO+HKhiBKnqGXUAK2YfuuvT1/HyAjvcLXazpnyv+jRMKC5Tcl2juGENHqgIbMZpBmv+w9hklNyrZ1BuywkpdC090QYruoellAff7eoXiGRl/jsHPz1ThZ7dGJOQIUKGmsL4e+NbHZGotiQu95/ADnD7ZHBoFkwQNa3DaTXSBZEmr+X0kJM0pwxWkofOl3KMvareAJ4YjTxI/y9Jbpy5BTi2TOEhj40rFbcsVqc0Z7tVgvV+JMe2o94BkFC1Rq9Hc5TbMR6j4Iuo4DXKCl4AJa0oEHYlI09vSAcjSDzE6joC8vzJLR1HRSdvahjlZ9QxYRvHljgNGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkLny3c8lG0NHpQ9QLnewkOtgOyTX6LzNdoiDnbRtQU=;
 b=liS2kETxNQ6xMyhfpxnjImt7GTp+8qcNehEdhUOhZ2NkDlyc5nNGW0W4fcCNiVn/rySDh8hHFSm9tRpYhlQnxxWgz7RaFKk7IMQcMPG0H4Fjws8xA+5RQv8xlpmB9eBdAsAQfPpWdCr/+0D1294O46MR9vY3xTDJAqvPqrBUaG4=
Received: from SJ0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:a03:33e::22)
 by PH7PR10MB5745.namprd10.prod.outlook.com (2603:10b6:510:125::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 13:39:49 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::23) by SJ0PR03CA0047.outlook.office365.com
 (2603:10b6:a03:33e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 13:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 13:39:49 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 08:39:48 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 08:39:48 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 08:39:48 -0500
Received: from [172.24.231.93] (ti.dhcp.ti.com [172.24.231.93])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654DdgMH4007609;
	Thu, 4 Jun 2026 08:39:42 -0500
Message-ID: <86d2c8b6-4240-4ac7-aca1-915d330cddf4@ti.com>
Date: Thu, 4 Jun 2026 19:09:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 0/2] Add Frame Preemption MAC Merge support
 for ICSSG
To: Simon Horman <horms@kernel.org>
CC: <liuhangbin@gmail.com>, <haokexin@gmail.com>, <vadim.fedorenko@linux.dev>,
	<devnexen@gmail.com>, <jacob.e.keller@intel.com>, <arnd@arndb.de>,
	<afd@ti.com>, <basharath@couthit.com>, <parvathi@couthit.com>,
	<vladimir.oltean@nxp.com>, <rogerq@kernel.org>, <danishanwar@ti.com>,
	<pabeni@redhat.com>, <kuba@kernel.org>, <edumazet@google.com>,
	<davem@davemloft.net>, <andrew+netdev@lunn.ch>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <srk@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>
References: <20260525182700.3135858-1-m-malladi@ti.com>
 <20260527115755.GK2256768@horms.kernel.org>
Content-Language: en-US
From: Meghana Malladi <m-malladi@ti.com>
In-Reply-To: <20260527115755.GK2256768@horms.kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|PH7PR10MB5745:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1ad85a-450e-4b68-7ccf-08dec23ebfc6
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700016|1800799024|82310400026|3023799007|18002099003|22082099003|5023799004|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: xIcDT3b2sHdyS8tvsZgaxpY896FgT8xOfu6pizj1ElIKzyvVOch4tYAGE/vC2UhscKj8kvp1lK7uW2N0IwPtbLVxwFlpjqoQIuYRtzke+ZivKxC4iEaz6+JoMSePJpZp9a8Y+25oRipZo+Zq7EKdpMcXTMgC8z1nilIcGa6+GtOU0SRVb1x5HLGI8zgTPgGjORMhniWpixkh8m17tqd4U/9LVFDp8Erxkij/W27CFaHAo0LPNLLg/jGkaGGQl4qhJSyr7s9ehNbI2pKYSqzRh0thIAGDW1LgMKDOZJfndypCwipoh4cvLH+lnRKOJ/6F2hfUamAj6aEqMYK73tQIxAJvhinDA6isWwEnBICc67JbKi03Dx4v27qBjtUNGcwSwQrBLGtGSWzpAFvVYN8fwPO2RD4FEJ8lKJN6Tc+aLXEYilZ0XDcgCcQ+oTgwNlknA0rFKWMMT2Hglp/ZRuEKSXxNEMLXk5SE9VfIycVJoOY6FlC0Y71N3QFOhg2Ibswp+LzHwZOGn7F0KxL0gGf6R9bYGYgI5B19xT61ydvHe4Dc7IiuAuZeYEpdXiUA+sw/p+WwFYGbMbPF6MJ/Kaa0JFlODhBVW1mgyhy72OHSV29RYyW9THbUxQFjBGeuC4YIrQFzfnda5vBG83KbepJi4m7wBmhDXk8IBXoGvMGJ4Zo9JuA8EwNowV02AYI058sf
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(1800799024)(82310400026)(3023799007)(18002099003)(22082099003)(5023799004)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: bxGV3sBmy5Gq9DEC9sbTaHWM0xEnWsbzXQubDaSxYD1HcGpIMsxUqgkXQ5SGjoVLrUd2/O4ombHcWZ4bABGUlK5D6am+y74yr21kZimHXUrSorJ5faworBo3PSllvqRb4S2gWi0QwD+/n5ZVv/CVdrY1Bb6HUVsv/8lFVQ7OFifTRQmqsSMcBu9awM8Pp6W/QZO+vrze/aWsCcX2bn7JVIFYJgCGvKUFV87SRc4q+OMqBQKZ4X3KPCOYGbjQ8okqcP+cA+FCxaJHLSHnFNxuOlWQM2DTtY50+GNVZ3MKXyvOFgslG6GXxhaP1Hl4TCCS0hPlIXSVxVH2f4FUQerYLBB7jYFuVRjp+Hr58LEsHVcT1dtuBEdNanAgoOVrjbP2JEuQWy3fyV8n1sT0/CBAuP6aYRVuFCRpXV8QvADSXTALHWQdmC7wVAPiMmdZjFhV
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 13:39:49.2727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1ad85a-450e-4b68-7ccf-08dec23ebfc6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5745
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_063954_079650_05F74BEE 
X-CRM114-Status: GOOD (  17.60  )
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

On 5/27/26 17:27, Simon Horman wrote:
> On Mon, May 25, 2026 at 11:56:58PM +0530, Meghana Malladi wrote:
>> This patch series adds QoS support to the ICSSG PRUETH driver.
>> The first patch implements mqprio qdisc handling and TC offload hooks
>> so userspace can request TC mappings and queue counts.
>>
>> It also integrates a driver-side mechanism to program the firmware
>> with the IET/FPE preemption mask and to kick the firmware verify state
>> machine when frame preemption is enabled. The second patch adds ethtool
>> perations for the MAC Merge (Frame Preemption) sublayer, exposing .get_mm,
>> .set_mm and .get_mm_stats so admins can view and change MAC Merge
>> parameters and retrieve preemption statistics.
>>
>> v5: https://lore.kernel.org/all/20260430111723.497113-1-m-malladi@ti.com/
>>
>> MD Danish Anwar (2):
>>    net: ti: icssg-prueth: Add Frame Preemption MAC Merge support
>>    net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
> 
> Hi Meghana and MD,
> 
> There is another round of AI-generated reviews for this patch-set available at
> https://netdev-ai.bots.linux.dev/ and https://sashiko.dev/
> 
> I would appreciate it if you could look over them and address any
> issues that are either introduced by this patch-set, or directly
> impact it.
> 

Yeah I am working on it, though some of them seem to be false positives, 
some actually made sense. Hopefully I will fix all of them without 
introducing anything new in my next version.

> I would not suggest expanding this patchset to address any other
> pre-existing issues, but rather address them separately as appropriate.


