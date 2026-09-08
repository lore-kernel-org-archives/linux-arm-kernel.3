Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147B7C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqocBG66pw+C3BB537q2kog9u96UgJG9Hw3ww4pAc+s=; b=Q1JmsxxgAs4MaKxVjAaCNN9HAl
	AG3EcMGGSUg41t6Zf3Hc4T0mcQ+WXu3e/PpmLSFabp9Cxs0nTFCRw1Zx4YNuhMPnnnf53kfuPgc3h
	ndBKMMxm/chJT2BOaah3TwHZfjaWRUR4fGkqwH2dMplwKK82qPqQwhD87vArAWn4ChDWuGZ16haG4
	+gBnL4w++CvO6oy13IZaal7Rq/d4u7zvXKqz0k1mxa9aCZgazFch85ltPQePVksF/WvodYFl0koQM
	kbpdlt7h4jk3rfZrqchlmT1IjeLdpJHJUJCsxDxauxvoEjSPTLoXUsnTv0ZGPMBSJpCuksUi9tf/G
	Qgk4Jv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41gt-0000000A5hG-3xed;
	Tue, 08 Sep 2026 19:41:11 +0000
Received: from mail-eastus2azlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c110::3] helo=BN8PR05CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41gp-0000000A5g8-2N32
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:41:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqYy98Ds2jrxUjGqpZGNyf0CspFtN8QrNpJx/flSLLY3O4emzNK4AOe+3A0UiW1AFXHdjln9dGhAsJa0aUeMpq0qZ9xYDBzT0iY/jl0zPwCN2SjBk598FsrGf2nuludK1xp7j8kzdchDqZ/NRpJaFkSKu07mmwjFPb+4QWbULob/AcyR91+1qOvxkawS4T+ovkRSDWLk1xU3w4m1DtOCwXkkWb+HmsLQry5eRYxvc98zXNvN8ZAKInjPAIvJRLdIweV7n68ZT2GYbdWPSVElzGofmxQluqFzIAKrB4ZNANvphNxjekfxjl9tQSobSr0l8iQ8Q1nHIA54zXbS6eMQ8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NqocBG66pw+C3BB537q2kog9u96UgJG9Hw3ww4pAc+s=;
 b=wzxvTDidefu1nIqvtKwj1WOtZeDXqMfi31ZatAX1oycWxbHgLCF2/ktyjzaVAQY03k/8hCa53GP5UwpPInqm2grtXnjlLjv9XbCFDaoWYl3q0vuL0Rq8OiLAzeSMRsfhvuTOn+uCmfS0tIHH3uIpCuXhIgfTVRBFg+64W5t1FhG8hxbbN1NYTuLxUHL09Lst2oL1F0oFxpks2YRtIL8T7iOYr5w8z70trgtme82o/gskAxXoxAbm3cmzv0f1BsLNt652xO9UmxP2PKTZf8ps7FFWYGuLPKr4HtsvHATbPCiCrHlgF4t3qXP5niWY8EDF8NfP0p93iQHXhtFJPvaQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NqocBG66pw+C3BB537q2kog9u96UgJG9Hw3ww4pAc+s=;
 b=bMDmacw3/V7l+rgpe8/gUpgD/iZ9DMzTA2Gz8/BTQkWnaz6rfNum/InajQKUHbLWPO7y+9yl+N1Jx/PmrPCd+fp8+7sRFF6EAYvOhkam/DYebl9fZ+2FE6+JHPbxcfpYzyI+5Vb4gCVKMBqHpea8oXY6FX2OVcAk54QITdRUecg=
Received: from CH0PR03CA0357.namprd03.prod.outlook.com (2603:10b6:610:11a::6)
 by SN7PR12MB7810.namprd12.prod.outlook.com (2603:10b6:806:34c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 19:41:00 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:610:11a:cafe::34) by CH0PR03CA0357.outlook.office365.com
 (2603:10b6:610:11a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 19:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 19:41:00 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 14:41:00 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 14:40:55 -0500
Message-ID: <ce287aa0-0079-4cfd-b330-6b7617f49e8a@amd.com>
Date: Wed, 9 Sep 2026 01:10:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sched/fair: Honor asymmetric SMT priority in idle
 selection
To: Andrea Righi <arighi@nvidia.com>, Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent
 Guittot <vincent.guittot@linaro.org>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
CC: Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
	<rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman
	<mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, Mark Rutland
	<mark.rutland@arm.com>, Christian Loehle <christian.loehle@arm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>, Phil Auld <pauld@redhat.com>, Breno
 Leitao <leitao@debian.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <20260908082345.103087-1-arighi@nvidia.com>
 <20260908082345.103087-3-arighi@nvidia.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260908082345.103087-3-arighi@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SN7PR12MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: da63638c-4683-46e8-4636-08df0de11c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: vxIq0tnrGMNN9nfWsPqfLp+pvZm2VxKPYJp5DCsFmEzd7VQ/jXSvrZS3ONsUAsxS33o6BJWgw1BuzEwl1guNEmLVwV2j8NTtbQRI4c0SOlBg+eZ4a0qYdv+MdOEXsCHQDeA2gnmuJPT2BMphq8r6PlBskUs3BaG1ULY6vbInXn1B5yJGYL1o6Bqs3kD+Oc82xzjGubwdrzjIupVfD6iAgCjJBOAz87qzzv0lglu7FTAfKdLqKWmllYN5VNdkQ5+JJbNgJxWRlU5H1jAB6D+rOZ5EsciK7D3dnIsk5QoBLylcgTGcxiinNxCzxZ3o1O/mm1eTncyLdUe916emjaRn81L54wjpnfP02rmMNLONDSUd5E/BIBrX7B9/668NwfkSa8Y6aWh0HJ+mzb3upK3YwGafi9d00J6PerViA8sX8PFzgY28GIYgpuQ22Kou6SpqOTTGISrau9ztIRUaCTQXeG1/fLCkV2Wrs6lQx992kUf9wzA1+WIuCh5fr9AnS3PhWGqvSbJ3dVe2+CMqhrnCF0yZFdhJ4Rm6tBeupiXQ7r8cepNQi314CI00ezCqcyjHtsuZCCvpD7J9jqG7oJRjeChKkhuUYql2ZcJ82UErixx2FCcG1RvRspKd4gIRVfVb35Pwx0TXR9RFJL6/YE4VcalBwhjxl8p8Zq3AgE60nKxTABvEc97Odkq6XCxcfcf91wLdGPFlRTimDU4RM3y5Vw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: FCKUwsDLXbyPEl5gZA/0HhM4mpEMbT7SeC6cx5PgRYf7DlVEHx2YFAGqn15pG4pDu+gdEIVKF3mSqfa5pUwFuvbWnIsCVnVXzEg/hAIYItSTR6rlFWopDS0iaA1Oom+Mj3YKY4RKpkkUF7J6EAi5ekiZL95/fizNYqXsybe4ec8S++7QodW3TXmhKLUFUpPN/eVvyvL6ozUxIFtYicKc8y2pQuZgnjqOXqhuPh+MTHehCsUFkkjfQmllCwf2PpyVTJB2q7TfUDjkcx9Tz4XPN8lNw5eZ98KbJEeSaWAxb7+UpzpFBoZJ/IGcYKqog1Um673ozhojB4SMPmuiOlF8PLQbgRaZTSdtDlUiDK67OwSsKRrZCE3J83+zYFWWnfS6G8DjE04+ox4/HlwUbKmTzmueuFiJ7pNr3KQSpi6hsUvK3oML6zoOb4JdY3wr4Jh7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 19:41:00.5977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da63638c-4683-46e8-4636-08df0de11c79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7810
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_124107_608773_98026191 
X-CRM114-Status: GOOD (  15.47  )
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

Hello Andrea,

On 9/8/2026 1:53 PM, Andrea Righi wrote:
> @@ -9747,8 +9796,10 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
>  	}
>  
>  	/* Slow path */
> -	if (unlikely(sd))
> -		return sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +	if (unlikely(sd)) {
> +		new_cpu = sched_balance_find_dst_cpu(sd, p, cpu, prev_cpu, sd_flag);
> +		return select_idle_smt_cpu(p, new_cpu);

nit. I personally feel this can be better integrated into the
sched_balance_find_dst_cpu(). Something like the following:

  (Only build tested)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index b8bd308c2d5b..1012dfb33f08 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12353,6 +12353,17 @@ static inline void update_sg_wakeup_stats(struct sched_domain *sd,
 
 	}
 
+	/*
+	 * If we are on a SD_SHARE_CPUCAPACITY | SD_ASYM_PACKING
+	 * domain, use the group_asym_packing classification to
+	 * decide placement based on rankings of idle siblings.
+	 */
+	if (unlikely(sched_smt_asym_active() &&
+		     (sd->flags & SD_SHARE_CPUCAPACITY) &&
+		     (sd->flags & SD_ASYM_PACKING) &&
+		     sgs->idle_cpus))
+		sgs->group_asym_packing = 1;
+
 	sgs->group_capacity = group->sgc->capacity;
 
 	sgs->group_weight = group->group_weight;
@@ -12393,9 +12404,15 @@ static bool update_pick_idlest(struct sched_group *idlest,
 			return false;
 		break;
 
+	case group_asym_packing:
+		/*
+		 * Only possible for sched_smt_asym_active().
+		 * Select the idle SMT that is more preferred.
+		 */
+		return sched_asym_prefer(idlest->asym_prefer_cpu,
+					 group->asym_prefer_cpu);
 	case group_llc_balance:
 	case group_imbalanced:
-	case group_asym_packing:
 	case group_smt_balance:
 		/* Those types are not used in the slow wakeup path */
 		return false;
---

It leads to slightly more branches but they are super predictable when
iterating at a particular sched_domain level so the overhead should be
negligible.

I don't have any strong feelings either ways. Thoughts?

-- 
Thanks and Regards,
Prateek


