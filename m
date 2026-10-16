Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4739BCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 16:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLtGLtNKyXZHh8JGumqYyiz0x9M03j7wwKoQnuxR0jU=; b=F5AE80fP8yiKFK
	k6oOdV9LuV20g9diPm407aU12ZT5lSShrJOxQ2vyhLaniOhbaUHMbA8Js92VIVlHvZ4EhIC3B2oZX
	cDYUkGyJFGSVPs7kRzCAA3L5HIiN18dGiBoM03M9V+CIIb7V2JHp+p4c0FKTfQ9uU2zrmzgF6vEFJ
	QdBVVXr/5aKThsaDTBN01w7pFnAnjoPAX/fzqxVHPRlT1Kr7pR/GBeiEpLEOEBN0ScnlHQ1XZ5X5l
	Ssx+DQZ4KhuB+tptlgQxqUatnBmfKyMnjMebBYYYy5jlA039RPuGcjrdSgGO0+gfVYw1fnL5W5tAZ
	TKopOITK8m18MqWFfjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl2g-00000003Rft-3jlc;
	Fri, 16 Oct 2026 16:44:26 +0000
Received: from mail-westus3azlp170100009.outbound.protection.outlook.com ([2a01:111:f403:c107::9] helo=PH7PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHl2e-00000003RfX-07L8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 16:44:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvff6/Apeee7XkKWyNGXreox7ofHiTWM4Uk8SrsNXKyzPS/zkmkGK3QEmLFP727NBXvajRFkJTlq1MrRxqxvHBvhh4xQrzhI7K9xximNBfbHReiX3iDZqhoVhXJzEo9ZF0V/xdC3TkLpQgvVUZoelDcjy1hW0A88tLLaJUhu5uR3+bGIvdOBlxphWmk6L59Qe0KGDkMSowhhlnonDp27o1sY1bDAvvLrPPxkfqxRqEbASpua9wmsF3IjmhBL8g5pWcq2zbrO78CbGBMfydp4zaBKEHle+wdcG8ErlRgVZyJD0nhx1k98cT5ITZX7jG4NLV5rQh0y8tFdEoAY8c2nzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLtGLtNKyXZHh8JGumqYyiz0x9M03j7wwKoQnuxR0jU=;
 b=wWkyy3aZrtJxO3xO3ssF8DszN9duTCb8T1hEAUUNstfZKaf1WBrxE1OfTLlhVf5X+/qyjIks/59xmbkLRPa92vguZktayhiHtTyIoOGE/Dhb/eqoXl/bhpKQVyHk5DirLP7HoCobLxCH/gZbaCJ1Xmc/GKajN4gQMiyL2ST+56JpE/h5XeStJkeoooe+Wwhqcx7+76Rgaoae6pM6hu6dC0vcc7NlbrdveC1YF6EvRyEJo8FgBls2TX6Qu7XXNAUJVDzqrXN7NN7rrtpgKDjE/bsvVi4mmlc9gf2lWmyBnUkaY3jDrUTnDe92rPvKT9zzMqKDujXy/kMcEkGwIcwiBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linutronix.de smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLtGLtNKyXZHh8JGumqYyiz0x9M03j7wwKoQnuxR0jU=;
 b=bMMdeudyd8gtv0GdzwjerRj+jgeg78xnhQGXRJCt3JisOWeY49VYkO1NxFEk/KkUYNU3oqodslkltONOPsJoywJf33PPI+RoAasRWRZc4ASa50oft2AGjH9WCZFShR5flRoGZTvEGOftyVtrfpFfyaUrw8191Zb8EHtxnB2WDYw=
Received: from BN8PR04CA0063.namprd04.prod.outlook.com (2603:10b6:408:d4::37)
 by DS0PR12MB8443.namprd12.prod.outlook.com (2603:10b6:8:126::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 16:44:16 +0000
Received: from BN1PEPF00006003.namprd05.prod.outlook.com
 (2603:10b6:408:d4:cafe::7) by BN8PR04CA0063.outlook.office365.com
 (2603:10b6:408:d4::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 16:44:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006003.mail.protection.outlook.com (10.167.243.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 16:44:15 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:44:08 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 16 Oct
 2026 11:44:08 -0500
Received: from [192.168.1.205] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 16 Oct 2026 11:44:07 -0500
Message-ID: <4c9b533f-251a-4569-bc78-fd7af664c831@amd.com>
Date: Fri, 16 Oct 2026 11:44:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Q] zynqmp-ipi-mailbox and SGI interrupts
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, <tanmay.shah@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Michal Simek <michal.simek@amd.com>,
	Harini T <harini.t@amd.com>, Saeed Nowshadi <saeed.nowshadi@amd.com>
References: <20261015083937.8SDbdK8P@linutronix.de>
 <1ee3f542-e0b2-41d4-bf6a-b103dabf50cd@amd.com>
 <20261016162356.m2X9jbCa@linutronix.de>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20261016162356.m2X9jbCa@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006003:EE_|DS0PR12MB8443:EE_
X-MS-Office365-Filtering-Correlation-Id: a1ef21bd-5232-42df-e139-08df2ba4b6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|6133799003|22082099003|18002099003|10067099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 4KJVx8gnk70oRAdA5DK0qACG4tyjjk6jAYMwz2cyPCenB+xEgRmDud3o+8daCHd0HH9MsZJ5GD6qOtGsDEb9pS+Ce1LutT6wYmivD3se9beV/khBPOR9AG8b6hQUzEkzI4n0R7m+54qcnpacUT+yoT5zRMxJOwLKf/42BBUf2wAQCcXX8jLHzadju9/ZOs2q07uuyc99AeA+gahdHbLz/4ow/DUjEVnryzo9UIiG06B5sEVrFz/P/ojQLyK/LshNmkR6A4zaHkwYdiCkTjeVCQjHtoyhWzElkFvjqJj/eOQVbIFFwyyqc5LjcHBsrPt9b4Mti3XHinG027wbVr1mrAt9XDP0ZCnku5FUnNJ8yOcggI/hSwDcjA1uxrvwQgQr4G/cVjhs9IlwlX2NiElJEOsNlcxM0xsmz1Ctacjyb4IpWd6mvln+vNokqYIxxhlCAxUaQBsl8UtvCaG2mWmr0WzxZu+hT3ssBn+Pe7MGzKbMDlgf+ru8/4VGiQazwXHMlNJpqKdFyhpK8p28aTRIbZdkYRHTpMxceOA1h9CYZ7PsKRxHaY4oyKyZ+oA8IP5AUr2WgoBBrwkRqLGQSD7/ESv1iIbF2b6AJ6iTTTL6AUmssv4mmWQKHUSBBulrO19GcAswdziyKE02AP00ioDLOo39sqKxkmrTq02Cd0LlDY+MDMRGxhpUZrY70RvmMdV9JeBZhUBJPQbtInRQJdADnw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: pG8l0HiM/3dUMKVuTI7pvEQ2gR6wS2nGQ4fqCNyx7kijnClfuQZzylckkPyKBa0e0LeOK1UcUc/2dpsy1zCGMB4OfwxISzyYRZHU5pLYsi6OmUN/WxkcMTyT6B+PgLBHiRyp5d7hmTKU3uLQXFhugHBbw0PvPDikPxSOQc/LRvui75Q0rDavidKyDTWSZ/vmMj+SZSDzdpP3NrrVvyTsiifn6Nd0a5CfynUqHIQdjUA8QshHgOS0mF2J/bJZq9BW4L7C7/CKBXUBbI+MqaO3wumtHJuyP0uO3Z5NN3FJ1DsBhc31Ss6svgMAP4cD2nH/sdajndXWoTMtjOshsENcqxpp4YVX8n6OBQmglEuyQBE9HTgG+JOa8skL3G6vdkirLvV+U5ypkQhEyOrLDXx1cgMz+g1Vpvhm/OnDQRkRUmS+NPATMFylAeHYbrQ5MDX5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:44:15.0895
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1ef21bd-5232-42df-e139-08df2ba4b6cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006003.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8443
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_094424_096091_7103EF38 
X-CRM114-Status: GOOD (  16.43  )
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
Reply-To: tanmay.shah@amd.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 10/16/2026 11:23 AM, Sebastian Andrzej Siewior wrote:
> On 2026-10-16 11:10:29 [-0500], Shah, Tanmay wrote:
>> Hello,
> Hello,
> 
>> Thank you for your email, please find my response below:
> 
> Thank you for your email, too.
> 
>>> So is this SGI-IPI a thing or not?
>>>
>>
>> Yes it is. Ideally, TF-A and Linux can share the IPI. If the IPI
>> interrupt is used by the TF-A and the expectation is that Linux mailbox
>> work on the same IPI (because all other IPIs are busy) then the work
>> around is, TF-A will generate SGI for the linux mbox driver, and the
>> mbox driver will use that SGI via device-tree.
>>
>> It is a vendor specific use case. So the dt-node for this use case, may
>> not be available in the usptream kernel, but can be enabled if correct
>> SGI is configured via the device-tree.
> 
> And it has to be a per-CPU interrupt? It can't become a regular
> interrupt which is not per-CPU? Does the driver at some point access
> per-CPU registers?
> 

As per my understanding, it has to be a per-CPU interrupt.

Driver access those registers via percpu APIs, for example:
xlnx_mbox_cpuhp_start() uses enable_percpu_irq(). It is called for each CPU.

>> Thank you,
>> Tanmay
>>
> Sebastian


