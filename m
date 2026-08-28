Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EF0C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 06:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7vAngprU3L4H01wFqx0Qe/le8MQbYlT4Gmn4HY2jeE=; b=Hj3w4qcIm/lA9c7I/33oxYoT2K
	UEr2IVYvrrUkdLpaw7iJus48LWNlDtph2Z0vycdhf0KD6fxxAMBk/5L0o3M3gqdduNc1LfPsYnY08
	6rmfbmue6aRIZqDmJyL/t7SxrGpfkjRjtKx/t0kuK8f8kEDzQabnbJEgjew1jdYB5dGxD7M6EVSfJ
	I+EY6a9XSakVfdTsS99dGSx+GdpjLmrzEEBOJWAgi5iE8C2iySzAXvfRj1A+otIIktIa5Dgj2RxDr
	qhvz/hRTeECm0lqPPpTXJXI2gL0PZsp+8nOFy3/fZM+jPS+2PrMs2MpgkXzDrgVTGaW1y8iWEcbtY
	OAJpQiOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqAV-00000005Cpr-39Ra;
	Fri, 28 Aug 2026 06:34:27 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzqAS-00000005CpE-1j6o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 06:34:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4iaJJiERI5/FvETJlwmB936EVtldwA/gJEbpxLTlXl5XPPrZgBrONsZ0TQH/K0JD6+FuTTpzFjgfcWUAH/uZLjvhjvNQAtu+tUcNszs6njBbzjUVbIaDqfCiNHGonexIvAoDgtfEzUBj2pAik6GIo7NfHGc3YuPaz3rLMImFqj80/mLe6U6q74nLwsokZfuu0/7QS3PLG5Wtrvdn+aVVGAEmsVJBUrlfoqfRm7kl6tCLtDd8v5e6jeuLrTjEKixC0mPHaAE6V0EIR3mVmj1U1GPq6S0C7lsjBGn2NlR4JuRjVJ85bMQ6zoZnkewXC8CWA5DB0UMnZix/AzvG4ik4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7vAngprU3L4H01wFqx0Qe/le8MQbYlT4Gmn4HY2jeE=;
 b=zJ7Cb9/+O1MVJbruXaoej2guTcGjt3iYl97+FiwjHYTbjk7HNnWUSKFnxz3tJ0AjIUMNpNLG+JmDjI4oz8jfeiO0QluQHG+jSJusuzJMr+aOTriHVZ1UMZjKsFtgDO7cTlxkQKhwLm7FU6Qar0HWOsYKpnkCHIL9cpgFck1FFk6mkMjFMZdJwX4LlBd5up+jpzfw2RehAMYSexSss9Dejy+TfmN+wk1p8Xl+By2MnLRc9GCg1hzN+QXtXMtyc8ZtW6SnY0tNC6t3vCXYz4NKR8wR1BNJTH/TJichWTaQDlnF34RSeGZ/J02EF4RZCJfvyoN1IdAsNLKBRSHO5vHzew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7vAngprU3L4H01wFqx0Qe/le8MQbYlT4Gmn4HY2jeE=;
 b=fn+pOvb6IAvT5BMqIFZ35+HJqE/47ntrtIE7HYJ4rNuDMAhh5xS3w1VYwlP19fJBbMsSxd1e3jnRhDjyRFk0cAnuXLclcD73NuQQCbA1IYxJeUnB7biZmPTIb3QdMsH+G6F5mXWMzFXnKdmvJ9y2lFW/0WBb6X0XMvViONioWL0=
Received: from MW4PR04CA0047.namprd04.prod.outlook.com (2603:10b6:303:6a::22)
 by DM4PR12MB6446.namprd12.prod.outlook.com (2603:10b6:8:be::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.10; Fri, 28 Aug 2026 06:34:10 +0000
Received: from CO1PEPF00012E7E.namprd03.prod.outlook.com
 (2603:10b6:303:6a:cafe::6b) by MW4PR04CA0047.outlook.office365.com
 (2603:10b6:303:6a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.10 via Frontend Transport; Fri,
 28 Aug 2026 06:34:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF00012E7E.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 28 Aug 2026 06:34:10 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 28 Aug
 2026 01:34:05 -0500
Received: from [10.136.43.157] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 28 Aug 2026 01:33:56 -0500
Message-ID: <5e2b4e46-8142-4f51-8d52-66910946ff0a@amd.com>
Date: Fri, 28 Aug 2026 12:03:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/10] Set PF_RECLAIMABLE_STACK in various places
To: David Stevens <stevensd@google.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner
	<tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>,
	Dave Chinner <david@fromorbit.com>, Qi Zheng <qi.zheng@linux.dev>, Roman
 Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, David Hildenbrand
	<david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett"
	<liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport
	<rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
	<mhocko@suse.com>, Kees Cook <kees@kernel.org>, Sebastian Andrzej Siewior
	<bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>,
	<suleiman@google.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linux-rt-devel@lists.linux.dev>
References: <20260827232948.2520558-1-stevensd@google.com>
 <20260827232948.2520558-9-stevensd@google.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260827232948.2520558-9-stevensd@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E7E:EE_|DM4PR12MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: ff09e39e-49d5-4443-5c3b-08df04ce5e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|36860700016|23010399003|921020|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 5pvdfohkjpkcsCKBcU3fuDs2+IF+KZxhiYohosNSogwRaqEkjoS0CymhpSuF5C+RfJWxiaWRH3LAXn/rkiz57dodSn60lhYcvyp868n5/iJfslci8zBoF73OSoltQge4JYBH+TzvYBpYs6ywNGA3uI2JwTbF1hLPzuxXUVDEMVH7fLWXIZLl3uai27zzxMqzSx8S7mxn4UOLxgxJLK+14S9wpee4lTK9n9IQiX10yt4Ne3A4igshxXpgwCus+SGKxNwqOCJ/ao1aFVQDhI/2c9ngtQBigFmKUP+uJHKpmVs5DpTXRbdC800trCJ4VOfHE+n7WR4/zpF+cuSYNYENTPFTyg6ctH0ZhcESJEzG42N5gt+O8E1ElTf4XSPUADkESaSPeyGSo9v5hcrzFuVl4mpNvQT/LjBA0f5gOgz1snbCSI24Xk0fpsss+Sn/AG4dubquB2PWgiHf8yc3M47hoTKvEsV1ds4i3BXkYHVpjqnJS11N/Px7vnktI2wrM59OC2I1JW+lX+TD6X2Fok+i6ZuAtxbLFr5UtIzLziIpEUZhUG/6URavk2b/eNzqHv3qPSzNVP9YRKj/hK7Hi0Zm3ONKr4BTWH9F7w2FAd6++GwznM3lmDhLH4kQDZN2I0vL34jbWFvXvZC8FvqaCfi/VlDe3YTevKlKuUhAe4ESwNy+D++N08StCbEWRMFyGLC/gbSyoG/r4lilmRN+t1DX34Dl+D9Fvou7Pll7928zoxtCSYUj4G445OjjA38hcPNO
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(921020)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /bzQXGIkGDqcDuPC1G2P1h9VV7iiEZiesIogpH3lLIWj9QabAa1h8O1pxrHTg1WjUAx32pWkcCUXkcbYvY5nQ4N7Wmo3yYuPKdO6YL/6p0/RfexFDv1TEifdhW2xrwMXxGtnE4ZBTmlVDSfKwagwpPVFwesJ5IP+2gQ17jUp1pLDrgseTbtDnvQGXb2jBySPbIllIDZf9ov/FaqpMaT1ra8Wx/Qs97ZGQbkPr4yDlmopi14KrlpCgaxrskYaC3GAyBKG6Zrd3wXuthzIZYSi5DEhEohP95ebdTj/PrcRYz+4Ttlfr/ZQpAVQ+IGUE1djtsLHeMzyAnUPN8M9L4bJ784yTebEFKqxNuP1MbYZc2LPse7/3I1Xk+36cfZ6p4W1r5sNoSx/6dSNjU7BJySNN5pKv2JnuQRkS/mUEIJfKquRneDzWSg3M9i0wvyuaplg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 06:34:10.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff09e39e-49d5-4443-5c3b-08df04ce5e55
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF00012E7E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6446
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_233424_456527_09232D5D 
X-CRM114-Status: GOOD (  17.06  )
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

Hello David,

On 8/28/2026 4:59 AM, David Stevens wrote:
> @@ -469,16 +470,23 @@ anon_pipe_read(struct kiocb *iocb, struct iov_iter *to)
>                         break;
>                 }
>                 mutex_unlock(&pipe->mutex);
> -               /*
> -                * We only get here if we didn't actually read anything.
> -                *
> -                * But because we didn't read anything, at this point we can
> -                * just return directly with -ERESTARTSYS if we're interrupted,
> -                * since we've done any required wakeups and there's no need
> -                * to mark anything accessed. And we've dropped the lock.
> -                */
> -               if (wait_event_interruptible_exclusive(pipe->rd_wait, pipe_readable(pipe)) < 0)
> -                       return -ERESTARTSYS;
> +
> +               {
> +                       guard(allow_stack_reclaim)();

nit. You can just use a

    scoped_guard(allow_stack_reclaim) {
        if (wait_event_interruptible_exclusive(...))
            return -ERESTARTSYS;
    }

here.

Same comment for rest of the thread where a scoped_guard() can be used
instead of this pattern.

> +                       /*
> +                        * We only get here if we didn't actually read
> +                        * anything.
> +                        *
> +                        * But because we didn't read anything, at this point
> +                        * we can just return directly with -ERESTARTSYS if
> +                        * we're interrupted, since we've done any required
> +                        * wakeups and there's no need to mark anything
> +                        * accessed. And we've dropped the lock.
> +                        */
> +                       if (wait_event_interruptible_exclusive(pipe->rd_wait,
> +                                                              pipe_readable(pipe)) < 0)
> +                               return -ERESTARTSYS;
> +               }

-- 
Thanks and Regards,
Prateek


