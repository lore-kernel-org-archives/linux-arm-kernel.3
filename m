Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F4BC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR40h/AG03DKumgJ8iw1gSdyiRK+YlTO9SZkKRwrUyM=; b=cjFQJXhb5oVctJ8BjR6pvwf6I8
	FVTRSSW5ZpTUDFO1i/yxmrCjbJ6tI699CIHgufDVO+zzK5kOAx0sTog0p3FrNYF/y+Y4U6r7Ukp0g
	cHx0g+ZRSJwzWQ66nfbX/J4U35itG930XfJ7/VzgIT/nYpWIQ/ooroJJ9JMwHTOMlfpOdjaVPvkJ4
	wCL0tZ4DZhKdWvpcilsJrW2qqo4pD3zvBzgKKV0wHT0+f0VNS+DREnymvPjBuMfX3nPbmq7YruIfE
	55Sz4mQPRvD/qQMi64hk/Ix4ukSScyQAQqwu0B0jA5aqmAoc0J2l6knXUAFY+YpTPGL0il0EdXP5q
	UliF/TSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u033S-00000006x4r-3KTI;
	Wed, 02 Apr 2025 18:43:14 +0000
Received: from mail-dm6nam04on20611.outbound.protection.outlook.com ([2a01:111:f403:2409::611] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u030s-00000006whM-0Nux;
	Wed, 02 Apr 2025 18:40:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vyd4Ibd1XlKDxUtFqmW6iLY1ikolfQ0p1rF7p+8JH4jMPPkBD7D4pBkOxAjPPbiyJBJ6UCDHE2/PHjW4yY3aZevnmksNkL6CcQ/YyCU8oAwXRJ7bBK0d9CQG1yrlLfvpfpcBt9rZNF0Z71guOnl9tDx46VZTAM7oPsz0CeVHcIVQSp15jzK1fMAh3ibvXm8zt1naai5VJdFu0ARCJYfwGmLrlR1NUV5hSuXTFj+Pms3wWauDTui0wyVyf1wATiS6BXajgX793QgMbt7FpNTSi1s6DZNZ8IxEc43a60lkA7Msp3RB0HAsH69RdUrYGjRFfk3KzreSSCWrl6Ha8RDdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZR40h/AG03DKumgJ8iw1gSdyiRK+YlTO9SZkKRwrUyM=;
 b=VzrLkuG+dU1c/+MXBnKU9QlK98Ku0gkJbhjAA4Ss358o4w5ZJqJ7gC5bTf4NUZhF5N6xmx0A0KvrsQYA5Y9NKYLwH1vBlUP4+K7PhFppiAzAXrrDvaL4Jq1OwQnaumBZMsaSpfhqPVCGdpbza8kYn/DOroL7Oc4anXKc9fn7ym2C7DXQzxWgedHlYKJkRLKy/B6o2R2fV3mGKOUB+hQqlw0jUbRP5jTWQAdc0V+SUgE/36SDsEdoZfNnBqS5kw1iCvnLxCDIrXoZ8eZ1J832sND6FISN/iJlq8jujaNh5TsYO77sI/fQWv+K3Ef2a6VAmlG7vfCH6asHV3kOK2mCIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZR40h/AG03DKumgJ8iw1gSdyiRK+YlTO9SZkKRwrUyM=;
 b=DPZQkoa/5PtFuVhO1Htnh3euI3CB1Pmjl2wtCykCm7AyTsBfbb9BSVzKYeVlgxWUPrPZ8d1CJ53qY6q3fmLcCnHddkCnD7xXSYpEnUJIHGpYcTvEqeTy9CGMmLIxxwzeph7DA8yj/q2MAJ7ryYjlDnbaAvUjKRMs/whRkEuHGcM=
Received: from CH2PR14CA0008.namprd14.prod.outlook.com (2603:10b6:610:60::18)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.47; Wed, 2 Apr
 2025 18:40:29 +0000
Received: from CH2PEPF00000142.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::2) by CH2PR14CA0008.outlook.office365.com
 (2603:10b6:610:60::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Wed,
 2 Apr 2025 18:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000142.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 2 Apr 2025 18:40:29 +0000
Received: from [172.31.188.187] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Apr
 2025 13:40:23 -0500
Message-ID: <145ddb99-025b-4ed0-bee6-e1e2c70ff0bf@amd.com>
Date: Thu, 3 Apr 2025 00:10:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
To: Sean Christopherson <seanjc@google.com>
CC: <kvm@vger.kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Oliver Upton <oliver.upton@linux.dev>, Marc
 Zyngier <maz@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra
	<peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-riscv@lists.infradead.org>, David Matlack
	<dmatlack@google.com>, Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Vincent Guittot <vincent.guittot@linaro.org>
References: <20250401204425.904001-1-seanjc@google.com>
 <20250401204425.904001-7-seanjc@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20250401204425.904001-7-seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000142:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 68190e15-3f13-4718-c0c6-08dd7215d777
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700013|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTk5SjR1YWtFUzRMZ0NSb1pyNWRUUG56QlZPT3c4Qkk3T0xSRS9BR2NuRElG?=
 =?utf-8?B?ejZvNlVRR3ZWblBoNExrNGJ1OGh5K2pWbG40Yy9KR3RuRW1weGNRamp2dUxH?=
 =?utf-8?B?c3J1UWZPaHNvdms4M0YwRWp4anE4bnNPMFZ3YzFEZnRYOC9vbGpScVVabGFU?=
 =?utf-8?B?ejVSZ21jTTdhMHEwcDVxeTJkQ1BNejNXTi85bFNwQWExc3VWV0tzZENReUdP?=
 =?utf-8?B?LzRtOWNPZ1c1dEdMWmJCWUlyOUZSUk1nTjFDekQ3U1NGdjlMR2tjbTZjZ2pP?=
 =?utf-8?B?ZTZzUXcvNWIvTnVEd2hMSG1BeU96MENHb3crRWFERE11OUdaUDZ1SEt4dFhD?=
 =?utf-8?B?RXh3dGcyeFVxZnh5d1ZGUlVXaTQ1M2syUGF2ZkZSdnNVbUJlSmwrSnpON04y?=
 =?utf-8?B?blNEektHWWZjZ3FCQXNNYWRVb1doR2hLYU5zVzh3cmdxbzNRaWt0S2VHZTl1?=
 =?utf-8?B?T3cyZ1h1ODlCemhaUno2VWhhb1ZXVWpMaEhTWVNIUldYTEYxMWtiSTk3T2tq?=
 =?utf-8?B?aGhpTlFHZ0tNaGZ0cllMZC9SK3IwQ3dKbU5wNThYSzVpcU5VOUVTdVRtNG05?=
 =?utf-8?B?Z0tQWDB2MnMvNjMyYVRSSVFPWEIvejB2aDhCblRsVGhhUUV6Mkk3WVFhYk44?=
 =?utf-8?B?UDVGVU9YYThhR3hIYTdid21ZeFV5QzZXc0RZZVZESy83SUFlMjFmVmZHTlhx?=
 =?utf-8?B?Rndza0xmam5pTDJDbS9XNnlUWDIvK2JyYUVTbnVZdzdOSEFBZ3Jsc1JEamRC?=
 =?utf-8?B?cUhNN3JuSGMvNENyYTM5WXhWNWIva3UrbVhYODBteEdSYTdsazFmK1hzQnZx?=
 =?utf-8?B?U285WXZVT3hHTC9RUUtCRm15a3hpbDNjRFBSd1BXckVTYm9aS01ibDVVcEht?=
 =?utf-8?B?RXZZeFVFK3BrdlovMG8vOEh4d1VrZ3V4YkFiUXA2ZHhpVlc0TWJvd2ZoOUdz?=
 =?utf-8?B?dWV5bWNMb0NzZ0NQQU9NOTZ6L1ZLZi9EaHhwL0dnNkl0RGd6RzVIdVkydVRW?=
 =?utf-8?B?NGN3eEYwbFFRY1JXOEpXZFhiaUxqN1FHekxHeVJORU83V2JmRUs5M1pIQmJm?=
 =?utf-8?B?dVFDOG9GS0tKRm1KcDY2YjdHbmx5ektzMHEvK0JsR0VFTHJObExkWjkzTjZQ?=
 =?utf-8?B?VndKRG56THUzaThZclgxMmgrOWczZG1qSGIxK1NSOGIxeWl2eThabk4zVnZW?=
 =?utf-8?B?NS9kbnBJdmxIUjUyWGVpaGpiRzJLNExEWXNXTkZKTCtZK3g0NW1IUmoydi81?=
 =?utf-8?B?Y2NOcnFkVC9qUDk3dVBZRDV5ejRDSFg2VXFNR2hRM3djalNKYkwvdHRCazNz?=
 =?utf-8?B?SVBSaHhiWG1CTTdoZlVhNTAvaGVLc1BwYmN5ZDd0ejlJOER6ZDc5d0FLMm5G?=
 =?utf-8?B?QlBBdGVqeHBFMzJpSmIxc2Jmc3pHZzRnYnZvRDZYSVNvSnJuWnlYVTc5VHBC?=
 =?utf-8?B?aG9HZFlUa0J0RXVRQ1NqNUpzbzF0cU90SmdVRXkvVGU0RjBpZkVXZnVlNVlV?=
 =?utf-8?B?MHpRcTRaZUg1TW11ZUNpUUUzcVdoUmpLdWRUUW5wQzZud1ZNekNGUkVnZHRB?=
 =?utf-8?B?ZTc4K2x6aXF4ck9OaDdSUkFTVHV5YmxHVlJtNU5KbytwcWFqejZmcTNTSzZI?=
 =?utf-8?B?dGVXNEJvZjJvMThuUDAyQTZiK0lBTGxiT1RxVmRGK3l4Q1NxZXlLSmZvNVhC?=
 =?utf-8?B?aWpxcHlHaEtVcW53WXhJUWpxZm1ReHBxV3B2WGUyeE9iYnpJSDVFVW04VGlu?=
 =?utf-8?B?Z1lkQ1pOcnJ0VjVHTElqRHNHZkgyNEZSaUErN3hMQ2tDN1pRMkQvQVBLS0pW?=
 =?utf-8?B?ak9hRzFIeUtlZjNVZnZMMjZKUkFmZXpqYlFsNkZXaThJNDA2RDFvU3NMc0pJ?=
 =?utf-8?B?Mm9ZNHJrSURFbGtLb0ZlOEtXc2hCOFJZTENwc3ZXaWpTamhpVVlKZ3M5L1hP?=
 =?utf-8?B?ZmJmNnYvdjF6TkRJWXl1T0plb0VlUzJDZ0wwT1RqVkJYWlQ0Wk1USEREVGRE?=
 =?utf-8?B?TVZZc0krV0NBOVU2ZFJJNjJTWWd4aFRUU09XcXdyYWZEUHBlWWF4REEvRlgz?=
 =?utf-8?Q?gPRRki?=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 18:40:29.0526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68190e15-3f13-4718-c0c6-08dd7215d777
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000142.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_114034_135179_FB04A903 
X-CRM114-Status: GOOD (  14.16  )
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

Hello Sean,

On 4/2/2025 2:14 AM, Sean Christopherson wrote:
[..snip..]
> diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
> index 51e38f5f4701..80d90d1dc24d 100644
> --- a/kernel/sched/wait.c
> +++ b/kernel/sched/wait.c
> @@ -47,6 +47,26 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
>   }
>   EXPORT_SYMBOL_GPL(add_wait_queue_priority);
>   
> +int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
> +				      struct wait_queue_entry *wq_entry)
> +{
> +	struct list_head *head = &wq_head->head;
> +	unsigned long flags;
> +	int r = 0;
> +
> +	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
> +	spin_lock_irqsave(&wq_head->lock, flags);

nit.

Using "guard(spinlock_irqsave)(&wq_head->lock)" can help you get rid of
both "flags" and "r".

> +	if (!list_empty(head) &&
> +	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
> +		r = -EBUSY;
> +	else
> +		list_add(&wq_entry->entry, head);
> +	spin_unlock_irqrestore(&wq_head->lock, flags);
> +
> +	return r;
> +}
> +EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
> +
>   void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
>   {
>   	unsigned long flags;

-- 
Thanks and Regards,
Prateek


