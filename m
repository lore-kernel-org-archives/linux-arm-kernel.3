Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358D3CCF9EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 08:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T3WLfTD3rqnChpCh7TTk0mWwaFu1LOJ50AuuKCkc3eU=; b=x6HIHXUDxsmC4/yhtIVQw/4/Qa
	gHopf3N+OHu6PfjN16Rneag9eiqTs0MZzPJnfJqq5fq5/6dHDjbrT0W+Py7x1mxQlhijE8+cWZt/0
	q8yM3mucG8bueImyIG1k98vtItFN0/Hc/uSzARPJGYJzEFrngT173YOknGQ2/ifYVrhr63sv1c35y
	+eNbkLkvnU8W/lazvMKrFOCdF/qNBr8m1qneExR/o4FM8sqgeUhvQ+sfWhcRJcoGtWtDmb7X193eK
	YfqPW6FBjuXSE5iislwR3GE+ilcaB0aVaqbWZz2EH3fDrw0Sm0wSThcwe6oC2NnnV8/eUhaKrF660
	AVsdtz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIul-0000000DRwe-4B5P;
	Mon, 27 Oct 2025 08:49:20 +0000
Received: from mail-swedencentralazon11013009.outbound.protection.outlook.com ([52.101.83.9] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIuh-0000000DRu9-0CkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 08:49:18 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Dmho47IqlwmaLpqCxVlICEOisyxpya/1QpKBAN2Hb/4AtIWcq9ic4DBb5gB/B4D6QvWSrOr7AOSCYOhu44UAqxvpmOyhkHytvbpRVuKenBM+2rXFj+HXjNu33UTGqzbph1NR5WFKJlPHtS5mlDky/nwv4M29Ujl/QRZn9R/rz6RavuKAEVLY7pCk31cprOrGBiyRDNkwE/YBKfQgijSzAsIng5tKocwT1G/s8QSRYuWGuLBpykm/wyoFgLMDT5gx4LY5+gZDXV/Oh0hDcxhNb3jv+0vdGBUoOfdRzyh7wmKbdn8/jiApN7ISq0qLMSt5m7rBOJUs7+pW8q6a8cPVRw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3WLfTD3rqnChpCh7TTk0mWwaFu1LOJ50AuuKCkc3eU=;
 b=LhH6FiL3UPuiqHNqsM6omxOM+MRVOOyW1sYQm5TpdiRzWIJTpQODq5b7EaGNW8MrOOjpE6HSx4ZIG4scMP3eTDoE37rOWRD+R+zG9UuTJ68Y07s3FCjluoB3Ek2hLzpg7xoY3vcnMoIVmFJHCjTPh4KHGNh6hUsCrCdLUiwDpch8AoX3U8NG063b1BuzbIVTJdqfbEgm2vTYI2pIk3+8M68Yc+r310+GmPoYb1i+zQzII2kg/6QN5qk1kr0GhE+mzugAa5/mrz8bmkIg7JtR2/zBgvNglmR6pSEWOHX9zaHcp6r2hMqTh/vicibpvN6j1By4d0f0DIEnhfLLZXq5rQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linaro.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3WLfTD3rqnChpCh7TTk0mWwaFu1LOJ50AuuKCkc3eU=;
 b=oGWSl8kZidSJXMwe9X0z1YlG1xlmxOtkUF+0sVQKHN8xlphuRRbPMOsOOUDOMa4OHWlKv7QHKYJPGqHdw9bdoaQG9/1opMYGD2am6CIObIItR2Vz0Z+qcKvjmky/LNu2cSRnBZk1oZtcgKMocVPGYvWlIPyCseOhtI4nNJMw1nA=
Received: from DU2PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:10:232::8)
 by DU0PR08MB9582.eurprd08.prod.outlook.com (2603:10a6:10:44a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:49:10 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::9a) by DU2PR04CA0063.outlook.office365.com
 (2603:10a6:10:232::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 08:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10
 via Frontend Transport; Mon, 27 Oct 2025 08:49:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Apn8PzNS3tlAOiQUEpPpyyLa9OGXtpecPilYpLPcrllNlZaxH1wCF6c7FQIVv23YiApRvkEqjsx47xeuUaHUF/PYP5sNbI+QiVjeZkwl9GS56beWPHZG75KyJ1DRYzEywaNGdPQcYr2B1K/NRatRNpPqx6A+ym7W2R9NslkaJAlyKMm/pOijBfj7ubTqkqTLTWM4moeY6MQhKny0PyLTr6ag0oRNHTShjoYjvwNTPBDbIRfbKRrf6sMPfBOXqXZRE4parAhgFcK9WPCRbVLSxqjMiWhxyPF5EDenOeuxS76BKVxarP+K4vZRSP6y+btMMBnmjy3HPRJmQQNObN/svQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T3WLfTD3rqnChpCh7TTk0mWwaFu1LOJ50AuuKCkc3eU=;
 b=QGmAQ/BWemMqDTBj6kHzU/mBoxB02QIeqO8Tk2hLPvpaYbTfmdsh22xVzj6u3mPBmn1C+GMVDJtGIeb5O8ELM3YCijbKVxwpVu98zj5u0Eo6bYKB5CsSLZkPaVSWl+VqgbHD1e5Z0xge9NLA21W3adcmWQYp/GY4htJ49Z9MN5kbYiVQf09khNLJz78HuKimab5MG7+plFjLEH/dpRzL2kuIa3yK9sw66Vu/ffTYMkWkImIiNMw7cq2EFp5W2yGKA9m18eWf/gSvnecvVHlmecJm8kNMIucL9eP6rZIFp2H0+Rv4qmejVhf253RnxpVSg5/vkmUej2miHWRTTiz72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T3WLfTD3rqnChpCh7TTk0mWwaFu1LOJ50AuuKCkc3eU=;
 b=oGWSl8kZidSJXMwe9X0z1YlG1xlmxOtkUF+0sVQKHN8xlphuRRbPMOsOOUDOMa4OHWlKv7QHKYJPGqHdw9bdoaQG9/1opMYGD2am6CIObIItR2Vz0Z+qcKvjmky/LNu2cSRnBZk1oZtcgKMocVPGYvWlIPyCseOhtI4nNJMw1nA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by AS4PR08MB7505.eurprd08.prod.outlook.com
 (2603:10a6:20b:4f7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 08:48:37 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 08:48:37 +0000
Date: Mon, 27 Oct 2025 08:48:34 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 07/11] coresight: etm4x: Properly control filter in
 CPU idle with FEAT_TRF
Message-ID: <aP8x4h4ptjRKFIw0@e129823.arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
 <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-7-690e69ae6977@arm.com>
X-ClientProxiedBy: LO4P123CA0688.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::17) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|AS4PR08MB7505:EE_|DB3PEPF0000885F:EE_|DU0PR08MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: cd2c4120-e417-4f65-c535-08de1535b269
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?lTpxOjaBE6FuK9MSwpgoX0Kt5838KqsPgypY9LhFXAKcHwMdbYJcO9B27eQV?=
 =?us-ascii?Q?rwzMIKx86gwoHdulB8wvJnpk1FE9aq1CjaaRh1ChN6S1GeGCih260/SoQkeu?=
 =?us-ascii?Q?NYe92MRF4A+bg1b6f/20TidlN/Ik8/pLA+seEltBjGelAwZFVmVKd0Cx91sY?=
 =?us-ascii?Q?7T1QrMhuoybW6nJ72n3TgFfec26/oRjT32LiJElRXMVGMXGDBqCuvgum19Ar?=
 =?us-ascii?Q?481iEebgaN/n9xTu7DheQboY6CaMJoNSb0FqFVCI12i+e9WvJrGqG29V+hym?=
 =?us-ascii?Q?y5itcW6HPI3ZQF5JZvvpC82bbCjPxzNT/gfQxsXPiXHfYDrxoYrNySzMwFn+?=
 =?us-ascii?Q?NE80okLrWvq1F/pvF+J/B/4LRn5hg2Wgnmsvb719iyNXOUB5oqXdIxDMV+LH?=
 =?us-ascii?Q?qLndsaPjdNPRnM8nConrcEVE1XTIrNvr1OthiVxujPaMx0GfmTJ/15xHf57x?=
 =?us-ascii?Q?aYzYpjHCPlm75lJZSBhmSDf4IzVLGKaBPn+6RV4OlBjjMj2bRXD+bmII00sJ?=
 =?us-ascii?Q?103Sc8KiKbyTSps++O87V8ySWFholo/FOt/y+8EtNIG5+fMelhZMWdKqu3qi?=
 =?us-ascii?Q?n9UN+tSIUWkxDmDzYF5uxphTdntNwJ9UudGlTecyTFLx+L8eOhOsZUvoq1OO?=
 =?us-ascii?Q?+kObAIwf6tT4Jk4XEb9D2zMsQVqaku8yF6ZeBxv7+ltKwRT6237x/KpTzxcJ?=
 =?us-ascii?Q?Sg5VbRUPfKA76wdp1kOPVbkcg55qVpn6svrHzH/Kld/HoNAZjrqM9zjWElOL?=
 =?us-ascii?Q?DE2bzZsDGA0LGRqgmAoXQP3ZURMLjAiQqEb38vkKwHS0y0CRD+pL067C+qac?=
 =?us-ascii?Q?PebNSpehxvSk19APD7ebTW/jbYlNctyClR8GTTJPUlnS7VDcR4AQ22bH9bXp?=
 =?us-ascii?Q?l2xOoJtHLYfwHM5aA2+b6xIobGWkGtznXTeJT2gInloLX0+/D+HpXmGVNmnc?=
 =?us-ascii?Q?FHoYhZ1RmLdJopDCH53WhZFZcRcxst+jZwd8hIvbmJttjpgPDnJZVqSOI/8+?=
 =?us-ascii?Q?JgMZq9FNEY3x2ZMl/twUMK28kWhvxcPlOgaIh6R0Zqy5KglH+9RO0CtwtY/8?=
 =?us-ascii?Q?az8Uy1+3PqFF+5EmpuoLzZdTzHswxYev6hp22e8ujvuuQ10lOBETLUlBLSx2?=
 =?us-ascii?Q?WVjsk9S1gFnf0a1mg8UUa0SIHZ7EFEQa5t6qSEHo0UDYLJTpgOSwUwh8kr0k?=
 =?us-ascii?Q?e5+7HPX3vt0ke60+BkDO+2ebj1PvtxB/A2d8FMlsD+8FnNY6mEeEqqDXfeAj?=
 =?us-ascii?Q?xDmsD4UCifuiPMO9JXtMAyyvolFsP1HnrJ0fPN75WUl3B3klxyqocTCx1tuN?=
 =?us-ascii?Q?2Cb0zc31ZEMwqt82m/ebVEU/E0+oT4S+N3IswXvsEa7s75wABUiec5Ua3sLa?=
 =?us-ascii?Q?kSXBHijD9qOc6LMP+vYNrqD6Og2mlkLNWCGJn1GgKulmYkM9BQH1wR/YnAo8?=
 =?us-ascii?Q?rgAGfNWYEvEKtokYDiS8MTVRNRg6LK85?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7505
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 4c7b4137-85d0-4e9f-4cf5-08de15359eb3
X-Microsoft-Antispam: BCL:0;ARA:13230040|14060799003|376014|82310400026|1800799024|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f5F/7Eor9Mf8c0MaJCx8pXJghOeBI6ZQ/Yzbp+mYqdAE0k8/9uYRs4UAVrhP?=
 =?us-ascii?Q?p6C6J1ajWZAka07879hfVU7jVYgExUTjNtlNCa6o5wiE3PTGxqUc0BWtzWZX?=
 =?us-ascii?Q?ZIloXKcP21bm46CcASkyhSCyT72E0ag0TpvTdVp30h9SexFpNRnrwgt9o/fG?=
 =?us-ascii?Q?aQwKEzhQi58UTnJScgEtzmhUKMdvgVKzFNk5fOqsLzoJyDfkxIo365Olbm4S?=
 =?us-ascii?Q?PHaKLbHOTywMs+W6n7llb7dubHknDlR5QJb0fNJkT92+rKZ16dpYGH9WZdbk?=
 =?us-ascii?Q?mSnUJE1IB0ypA+svr+IkEHK60Eu8KmK8jwdGM1LL3UY5pzlyVmzYmPIfQ1ov?=
 =?us-ascii?Q?8mQNvSPcAeggHz4aMzvRbK1feFA2A1AikyF+cbI0oZ0eDLq60c3ypHuR/3Oj?=
 =?us-ascii?Q?SruYKCCx88uRNLZ1kni0ABEqh9UKRNTQwUCNss0SKsh6yJDr0aKV9taMP5LM?=
 =?us-ascii?Q?+c7qgh2VbDIPYEEcZzb4M0X3AoOSQL0xFUYMOQye6eju9+ry5L5IvY0l5d+X?=
 =?us-ascii?Q?C+Y25wwZX0yHv6ikgJxPCzcGuMAaGsUm6RBWZxR2EXSRFa25aei8l0UBOe4b?=
 =?us-ascii?Q?zQUUCqVIXj2Ew+0E27+cxxH4Ug4rbaQqwhoUEbXUstwcifww5+k/dRFAUWc1?=
 =?us-ascii?Q?CVUrmkH3F9WCkr/y9sx8C+UG++wPGvuSf38JSKXGcqBi1Gq4A4VQytQB3Qs+?=
 =?us-ascii?Q?28cZyi0Y6pJgr52BSW6q0doI5XFLXiJhWvikDJWGQwz7xrY2OMHFrEPV+HgS?=
 =?us-ascii?Q?+caXBEetgfk7TJmLD4FQSDc62baisBCNaHJHjVpiUnXnLT9AmQizLH1ZZLyp?=
 =?us-ascii?Q?h+IEKqP56Eza5xLor+m1R1sooo2olFJjdGgTLyUjU4MvtyRjaE3uheQGO+5v?=
 =?us-ascii?Q?escqRnfJ91IZ8P5XNIiTDTQyiYP+Vc0NRCTchtW8KOBiWCJ47CJpGv9SofzN?=
 =?us-ascii?Q?uHxNQoYTtYOz/bYzMEmp/Fz+cMblCQnVTkBn1UssWZgpQ5U4jARNuWIqhfks?=
 =?us-ascii?Q?94NTgIaP4VN9Hj2pBP1E7aH58t1g76NGgZWprChYrI/mqyyV4rtBHNYeEGb6?=
 =?us-ascii?Q?Q7JBExMurh4tPlqC9YKWzODDbUR6TN51+yhtPGh6qU61Tuk4XikzUmGicRZr?=
 =?us-ascii?Q?vf/Kh/5WZHglcGmCs/0nVbqNmiPKosUCfoXGazHQIczGPPoCe930VY7aenB1?=
 =?us-ascii?Q?RfjHsLCb5r2cFK8h5ixzXRlz977/DgfaCmv5L+JSvPQsQ0dv+Xaibyu7woDp?=
 =?us-ascii?Q?k/y8WeHuFvh4HpOnlRbihCLx5v7+HeuFzglxBJfmeIIXYii145EHeLaPAG4I?=
 =?us-ascii?Q?v4xa/c5P5EYUKKiUxOrYOSIeNf8FSJqnOJjcOynyVcKXSTwP9C9jepPGTNUW?=
 =?us-ascii?Q?3rydahjau0xbnlfkRpgk+Eb1isRKMqmNOzgcbsTh47sa9d/SVOWoZJslAj1E?=
 =?us-ascii?Q?64SQecQtR864LfMl/qve1UtZ7lEDUZzhLnxqMNnCa3yGcYUnAsFmARcJkoyE?=
 =?us-ascii?Q?l5pD9b+XfYFwmpzTXrQjjNOUgtW/jjPfJLZyqoqlXcHRmc6CetGTSV6pU25B?=
 =?us-ascii?Q?JyE9JOuRFu5ZDOYVk5U=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(376014)(82310400026)(1800799024)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 08:49:10.2737
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd2c4120-e417-4f65-c535-08de1535b269
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9582
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014915_302071_D12A185B 
X-CRM114-Status: GOOD (  22.59  )
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

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
On Fri, Oct 24, 2025 at 05:45:55PM +0100, Leo Yan wrote:
> If a CPU supports FEAT_TRF, as described in the section K5.5 "Context
> switching", Arm ARM (ARM DDI 0487 L.a), it defines a flow to prohibit
> program-flow trace, execute a TSB CSYNC instruction for flushing,
> followed by clearing TRCPRGCTLR.EN bit.
>
> To restore the state, the reverse sequence is required.
>
> This differs from the procedure described in the section 3.4.1 "The
> procedure when powering down the PE" of ARM IHI0064H.b, which involves
> the OS Lock to prevent external debugger accesses and implicitly
> disables trace.
>
> To be compatible with different ETM versions, explicitly control trace
> unit using etm4_disable_trace_unit() and etm4_enable_trace_unit()
> during CPU idle to comply with FEAT_TRF.
>
> As a result, the save states for TRFCR_ELx and trcprgctlr are redundant,
> remove them.
>
> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Tested-by: James Clark <james.clark@linaro.org>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>  drivers/hwtracing/coresight/coresight-etm4x-core.c | 28 ++++++++++++++++------
>  drivers/hwtracing/coresight/coresight-etm4x.h      |  3 ---
>  2 files changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index 7eb30e85bf03d1eda8212faa3c831338b70f86c3..df3260f2dfa72456c60fba4a8fa655fb6b48b95b 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1882,9 +1882,18 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  		goto out;
>  	}
>
> +	if (!drvdata->paused)
> +		etm4_disable_trace_unit(drvdata);
> +
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
> +
>  	state = drvdata->save_state;
>
> -	state->trcprgctlr = etm4x_read32(csa, TRCPRGCTLR);
>  	if (drvdata->nr_pe)
>  		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>  	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
> @@ -1994,9 +2003,6 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>  	int ret = 0;
>
> -	/* Save the TRFCR irrespective of whether the ETM is ON */
> -	if (drvdata->trfcr)
> -		drvdata->save_trfcr = read_trfcr();
>  	/*
>  	 * Save and restore the ETM Trace registers only if
>  	 * the ETM is active.
> @@ -2018,7 +2024,6 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  	etm4_cs_unlock(drvdata, csa);
>  	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>
> -	etm4x_relaxed_write32(csa, state->trcprgctlr, TRCPRGCTLR);
>  	if (drvdata->nr_pe)
>  		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>  	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
> @@ -2103,13 +2108,22 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>
>  	/* Unlock the OS lock to re-enable trace and external debug access */
>  	etm4_os_unlock(drvdata);
> +
> +	if (!drvdata->paused)
> +		etm4_enable_trace_unit(drvdata);
> +
> +	/*
> +	 * As recommended by section 4.3.7 (Synchronization of register updates)
> +	 * of ARM IHI 0064H.b, the self-hosted trace analyzer always executes an
> +	 * ISB instruction after programming the trace unit registers.
> +	 */
> +	isb();
> +
>  	etm4_cs_lock(drvdata, csa);
>  }
>
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> -	if (drvdata->trfcr)
> -		write_trfcr(drvdata->save_trfcr);
>  	if (drvdata->state_needs_restore)
>  		__etm4_cpu_restore(drvdata);
>  }
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
> index 13ec9ecef46f5b60a38c464e8ebde3ef72e7d50b..b8796b4271025f6aba79fe3cd6e4d17d0b56952d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.h
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.h
> @@ -866,7 +866,6 @@ struct etmv4_config {
>   * struct etm4_save_state - state to be preserved when ETM is without power
>   */
>  struct etmv4_save_state {
> -	u32	trcprgctlr;
>  	u32	trcprocselr;
>  	u32	trcconfigr;
>  	u32	trcauxctlr;
> @@ -980,7 +979,6 @@ struct etmv4_save_state {
>   *		at runtime, due to the additional setting of TRFCR_CX when
>   *		in EL2. Otherwise, 0.
>   * @config:	structure holding configuration parameters.
> - * @save_trfcr:	Saved TRFCR_EL1 register during a CPU PM event.
>   * @save_state:	State to be preserved across power loss
>   * @state_needs_restore: True when there is context to restore after PM exit
>   * @skip_power_up: Indicates if an implementation can skip powering up
> @@ -1037,7 +1035,6 @@ struct etmv4_drvdata {
>  	bool				lpoverride;
>  	u64				trfcr;
>  	struct etmv4_config		config;
> -	u64				save_trfcr;
>  	struct etmv4_save_state		*save_state;
>  	bool				state_needs_restore;
>  	bool				skip_power_up;
>
> --
> 2.34.1
>

--
Sincerely,
Yeoreum Yun

