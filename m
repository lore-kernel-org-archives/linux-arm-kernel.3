Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32559D6ACD4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 09:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNDKIT19U7im61Ds5Sf8dIF7S9+iLxQfPhCOOV6d52g=; b=G8EDkGRR1n1lOLf+zTUmtP09A0
	InVAnqoMsIXvoWou4UzVoG4jIygn05FCiFVjA4KEr3A4HCYIe+Fm1Yc65c+KWKP6Rfc2COtOr/OoC
	qw+PbBTcU8D+XuEZyaANS35r/nNDLIzdOzDLSOblQdlQK8/k8gTznFPj5Z/DRb8vJYbku66CzJZEu
	BAKxtv9iye5NmwnNvXr0SxOLdZFz/nlAIHJ0nM6c5zyqes8QPCTmH75KgN+DUvxXTRG5m+64qlRxa
	6yv2wksDW0SlGwy8VVRvOFhZh8lDXxOuW/sD8Xkv32PVXR1w3j0SPU2PJ4sc4MIZwNPuhIiTORf/M
	ftvau5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAMv-000000089P6-3fkE;
	Thu, 18 Dec 2025 09:32:21 +0000
Received: from mail-swedencentralazon11013052.outbound.protection.outlook.com ([52.101.83.52] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWAMp-000000089OE-3142
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 09:32:19 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KaUowve87wd1cn5AVNOBfbGNqcpggBWU50SPHRtn8ui6ljXp2cU2m9rDRdjbmHkysWTg+4b6UwZ/8OyMIESNJ5ro59+f5v3UPZX+B5Yf/MepxD2euwZrn7HCjQGBt+rGR+3CdkYiWFq2X4cHQbfcNI23RODbXEhOFBISDYITlX2o41GelLRwG/59OKxI4/eecV3iw4/o2xSrSuJ/3oB/WUJe489eAtg/ngFcQlf/xPlxbRV5xTJRScUw5dPxYURFL3fPqcsf9Rrq5TkgvgfyPTlQKEJlOBURBQ73fvQyIWVvtgcLiMa/X6+40QBDsNb7oOlVYOSu608agxZBDyJi8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNDKIT19U7im61Ds5Sf8dIF7S9+iLxQfPhCOOV6d52g=;
 b=n1ebwwIK2e/Cch62lVdGX9T5xJIDAmYWVl+HbWjw3QpS0f4kXofz20CBRaGJCskSOGFwSr0H/imzkpGTYxX6mcjt/59n7+Y9qWXo1hbYQJvY+LW94Geyz8sISjgiPkgh+wIum2DZG3+1yUwTWgYheG+m63sJuD1Pod9e+A21qzjIq5kcMJFTDns3rQe5a0Ofn6E8eqnqF+YK/E0UcpcPzunRO63GGieCobpSDekp6PycweYqxyFTogCMi4i3RG0sR25RHq9UHk8YINMcWE+5hW2MI1L//043TqNekP3n0PAE97y7l3mYJ3Vp09nJr9wPhIteA8U/qtcojMmZn6N0Lw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNDKIT19U7im61Ds5Sf8dIF7S9+iLxQfPhCOOV6d52g=;
 b=KHxxgWdwhYFed8RL45Fs957QZOgWL0IHLgxyolJu7rcy56f/7E/NeJWmlKNZ3Z7s8bZJk9p5RDdpabEdqeiDJWI9gB4L9MN5wMEllFtZW4UCNZOTG52/BaA+gKOSemC86qjA04zaPi1+oxmuw1TyHCpace0OoxncpzHolkPuKz4=
Received: from DU7P195CA0009.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::10)
 by FRZPR08MB11047.eurprd08.prod.outlook.com (2603:10a6:d10:13b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 09:32:08 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::81) by DU7P195CA0009.outlook.office365.com
 (2603:10a6:10:54d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 09:32:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Thu, 18 Dec 2025 09:32:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ig7oPD/jefkJLyETjb0CBSsF7qETI44wRTXrz4KQTT2xMc5NsUVk67C/ZLnUUag3ZFAmbptNc/cl965sB2DtFvKXAd31WiKCooJugpiiGD3NIkEGxj9JtVTYFS/fAQ0uvEuV8/jb8XXaPjLhNo3BxQGCxz4RIvJ9+2ljcWLRE+pTdY4uv/lBdwCp6r5lKgk5a9ai8txUP+MuVX/Of3m/Uo/kLKF+tREPzeoZWwSNAV/a0lrjnn59V7XW7h3fj7widwKJwWIrccqhHkKHfujdxBnyD72s9bDNxQX5eGC9s4LsEIGrvmKrOHMYgv3LLWtQ0Hh8UcXyPKXU7y4+qSqZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNDKIT19U7im61Ds5Sf8dIF7S9+iLxQfPhCOOV6d52g=;
 b=wo3ASK0SN7nvps4gxRhMg8xHdNcywMOYkZ7xaIvzwGQ3nMTDz4vAZMQa6o+JUtUsWz1w0tx+PfuSWUAGOgTRqLL5gr5XtSgxjVWVOHvIx/wqIC1eK35qqrIrtMYFg9LCyzSnnnhzjXA7Xs680yQwohbEYT/QPS2edFT4hszj/fJD6sd0VgByhJmYJ6kpy1wDPDtLaUVbQUvOxzcm2n67e8qSBFC1hsN8f2js9Z7rVPQe0QxhwQXtNOryfBhZJysQiLiam+tFz7awibovZ2XMdvgFj2A6OA4iUYaV4ecJIlh7RyPx8263o7oGoVUpVLhns/Q9QwHcrzgxefLgwCDECw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNDKIT19U7im61Ds5Sf8dIF7S9+iLxQfPhCOOV6d52g=;
 b=KHxxgWdwhYFed8RL45Fs957QZOgWL0IHLgxyolJu7rcy56f/7E/NeJWmlKNZ3Z7s8bZJk9p5RDdpabEdqeiDJWI9gB4L9MN5wMEllFtZW4UCNZOTG52/BaA+gKOSemC86qjA04zaPi1+oxmuw1TyHCpace0OoxncpzHolkPuKz4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by GVXPR08MB11351.eurprd08.prod.outlook.com
 (2603:10a6:150:2c4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 09:31:03 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%3]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 09:31:03 +0000
Date: Thu, 18 Dec 2025 09:31:00 +0000
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, akpm@linux-foundation.org, kevin.brodsky@arm.com,
	quic_zhenhuah@quicinc.com, dev.jain@arm.com,
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
	bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
	lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
	vbabka@suse.cz, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2 2/2] arm64: mmu: avoid allocating pages while
 installing ng-mapping for KPTI
Message-ID: <aUPJ1N99LEVZ77co@e129823.arm.com>
References: <20251217182007.2345700-1-yeoreum.yun@arm.com>
 <20251217182007.2345700-3-yeoreum.yun@arm.com>
 <731e3f48-e0a3-4c89-a13a-65ef37faa443@arm.com>
 <aUL/zJlJFRz2/Ybt@e129823.arm.com>
 <72aaa252-6ee6-4353-84ee-b6e10e9920c6@arm.com>
 <aUO9M/oN+nx3nfW+@e129823.arm.com>
 <201d0fa3-2ebe-4df2-926c-9e11607a6f07@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201d0fa3-2ebe-4df2-926c-9e11607a6f07@kernel.org>
X-ClientProxiedBy: LO4P302CA0003.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c2::10) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|GVXPR08MB11351:EE_|DB5PEPF00014B8A:EE_|FRZPR08MB11047:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eea9896-67f3-4125-7c3b-08de3e184fa8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?1MTLsiWkWKkuzBrfH+uk8EXGEj/KEWlna4w2otYO4jKdiMwzoQbVXZ5+zX++?=
 =?us-ascii?Q?zOKnKn1kPOZFlQk5MiC1sfjgpXMWV7TQ/PI5DHLRbayG9NO0lEWxAP0K1jqW?=
 =?us-ascii?Q?bt5KZQ1DBOz2ae/STLB/0+RrAjxZAUom81M3LVGYTSCl4owrZtpyIs8zfcsK?=
 =?us-ascii?Q?94C+EtCU8d3W8Ujuwlbeof+SFc3QugYZUzYUTo7qAMvMSW2Pz+BjVUX6dXvH?=
 =?us-ascii?Q?f9XLSIl7+lHNy3i1cdRisvoHkR1TmzHI8Q34VQGZOuyHEhb++F8Npfr9mAqv?=
 =?us-ascii?Q?B6WG3jxavloPf/WiPlkIH2+oD/TAmyvEATtxdnEkHy8YXieD2C7TtalL3xC3?=
 =?us-ascii?Q?7xWWQXKvTnryylAesgYmRNiYIkinNKgXZouSqpKQGgJZ3NX7SEidDCYtm019?=
 =?us-ascii?Q?94lmPWAkZ7IP64iMELYDqg2lEH1iE3aa8bpmoh/GNFjM8RgEfEBpDaxrBX+M?=
 =?us-ascii?Q?j81nhyPowikDszCvVhfxPvvj2Es/+0h7JRDr6B1kUS8CKkujPC25+NnS32Rg?=
 =?us-ascii?Q?2LZw+BYabBajU9TId8RsI86YEydgGfSo/eDeHY+i7hz3e3o1BuBE9EOy32L5?=
 =?us-ascii?Q?5Az/bZCjjwnPTnqZiMmLrBaH1HCg64YxPvASim3wcawpdiJqVnAax8cPaWTo?=
 =?us-ascii?Q?Va+D5qErg9Y5aU9xVCAeJd2IY9Jexg1XojBmo0OXZjsz5j+YC0aIDhrG2+uw?=
 =?us-ascii?Q?W+PQF4WBMHSO2gJYw5Li/VKPg914Djal53fbTWroXkHLh1uOhn2XdMmzcv/K?=
 =?us-ascii?Q?MN0bIYCzKBVsm2QcHP61MxQeMslv7R9ii1eAr4248InM1YZZxjA0a2OtgUDg?=
 =?us-ascii?Q?HivkmvrghHGh9GDZtB3LmtSo4gQuwonkPi6Y2GXjFQVdPI6HPJCSUznXDzvt?=
 =?us-ascii?Q?zNaqssu1w1taoWDzUmFeAk34VTqVagPhB0QmdmAHPu7aPFgVLhM3tOHixt43?=
 =?us-ascii?Q?n8sriJcVx3AtDRqSZDgxVbWIE5vuLmNlzZRWY6ZXEIYzncWyKGIC9bteCuDc?=
 =?us-ascii?Q?5InlZgHNPkUTNQLCbPKw1mdImp8OscqOStRMkofa9ZrXeiAuz+n6wUzzdmNG?=
 =?us-ascii?Q?KgknxUGoRUxnST3XZX23LagPAmwAp4W7d3kn2OtUlwMzI7w5O/KnLdmfYUzP?=
 =?us-ascii?Q?P7ujIOKmdLYY1kXUk+boo9/KXIXQmURgC/+O+FjHu9IXIUCisNdYelvGNDx/?=
 =?us-ascii?Q?UFPex5ZN/5pemOPor792zsMBAk25gqKRHDz7J9KKJExUivQsjwnS/vG1Nmjo?=
 =?us-ascii?Q?lCLsSNnRRBM9h6xQXi+Npw8fiZ6+ACHXOSEca+zOQqY+9Ik5fSKjpMZKCwpQ?=
 =?us-ascii?Q?eyIjKT1bSapxEVLPUri5g/RW2YkvE3Vd79sRhqAaQn3dHMnCYvz7DHOLmxrM?=
 =?us-ascii?Q?Hn8ec2AhbOBzVhDcS5lbNR6E4nCfb61Qqk6YWESOzQOji0UPaw3D7RVCzhSQ?=
 =?us-ascii?Q?xmM8aOJsRYg1rrNo/meqJI0MhNlmla7A?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11351
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5c5352e4-7081-42f4-6879-08de3e1829e1
X-Microsoft-Antispam: BCL:0;ARA:13230040|35042699022|14060799003|82310400026|36860700013|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3UdjNCV/MIMGs0lE5sN0W+Qsvj+hzQWy53ASL4G3jSDMyPuP78Asx8JANcwu?=
 =?us-ascii?Q?4UWBxXfW8mQDplBDE4BN4ZfQUyaRzBJ6XPz/R0jBoi86LBgNw8O5mIzTIVvq?=
 =?us-ascii?Q?w3F9IFzCR8SIZvRHW2Ic0mLb8RO2DjWFE8KAhrI/HFfbyjNUYZFixNJSXA5W?=
 =?us-ascii?Q?dx1qzIiSNvZuEGr7RGSJIaoRVbdqwGURf6jOf42D//lyVNexzqUy+joJSErI?=
 =?us-ascii?Q?pkgqd9dG5mlidBE5ZR8m2mckR3iFs7p33VRjRx6fmXMAbVXmKSsAOjsoJxf+?=
 =?us-ascii?Q?3LG8sOuF2xOWF5IS2XmllI23RYs/xWc6mTUGDUK07D1xD2Dbe8Uas4FA+GbP?=
 =?us-ascii?Q?WjxqADYL6DXoKB2vdkeQfIuNfniUZ9Q4qMAISpKDVN0F4YsUnLLv/wSVN8uQ?=
 =?us-ascii?Q?kKLDsmp6tbxQZWpPuBGfNt1xDUJEt94cBrt8REzcsYLwF8xwJ4rTYjt6pA5j?=
 =?us-ascii?Q?/fBOEoW3HhmSJBxBeGJpNTlPHwQHJ2gFeKvCo0M0NbhhGd8oMlJ4uSOA5Hzd?=
 =?us-ascii?Q?0K0XmCzae3qkJH9MTJIQ0t4QdX55A39BXoSqp9pxTgRmr8472+3GiKRialUn?=
 =?us-ascii?Q?bOiyU0kdvl6m17QTmE7YMU6z1uk5pD9TvcrXpbxwlPQxvMlHuys0raD3OcYE?=
 =?us-ascii?Q?8Q48Ao9m6lWc3uwt2OOoQrWVxaY9DYM/oaByXJnkIj0BHJIaNz4jwStNi8hv?=
 =?us-ascii?Q?AR8liXzDwtbHIhTl8sap4mlSGUO4ccY/kDqcPSyJBaA+KAY2y4XBy3nj5pVU?=
 =?us-ascii?Q?XxUpnX6qV+7ODFlXjcNL7zMvPl7AZxXTfPHbjiY7lBGL0k7XUzZ/ftTuEkf4?=
 =?us-ascii?Q?/24IgexZjF6PauzZzuaqTdx3gIdQxe/YgwH9C7Pr77VJgKgFZIJteIQ4Awaj?=
 =?us-ascii?Q?aGKXwv7QxLrFoPEtLheZT9J82JCvAqyar//7H9eBHHZ6U1pL0rx4VZ9kfcpl?=
 =?us-ascii?Q?n8TVG+Qggzh77QDJ94WCf/KecLGIePsQYLckKhn11ixkqvuyRUacduenaS2m?=
 =?us-ascii?Q?SBgbD7E9GCIvrnNGfgPNALgoNVIPpskLieTl9jX/DPD/ShzRmP+9aKCZzq87?=
 =?us-ascii?Q?LSH3p1OJp64vBZYb2LwMEhdTspyRqwxSV4yAwIZtAH4p7m5YC+fnVyygB7c0?=
 =?us-ascii?Q?OalywZMcSd1j27bBrTw1ESTC9mTNGYJIsnT3hpf4Q+nIqRsVCvLhnVdpbq7R?=
 =?us-ascii?Q?da8jJIYtlfpGfuh6sSqjBg0x+o/j5bLvlkh9fnU64wDeNtAhXgMvf9Nu/1HB?=
 =?us-ascii?Q?ibfPLQlBPiDFNiQBQyTf+XNpr7UD0aN3td3UnA+vJFX5DoaS+j5HqfivL57l?=
 =?us-ascii?Q?7IfUCC83eW9O246Ay6EDW5Q2T72IOmvogYK0zWs1hZ5BGOC1K85NN43mml5p?=
 =?us-ascii?Q?q2u/0Yn7Uwj+dID/PWOniMAWGSpYdbhRhLTCC5PkRh+200hga0v7FyW8grfd?=
 =?us-ascii?Q?EIm2Zg+6Td4q0UwghZkPCG9efU+knBvmbH9sPY171M6VcNYok20ZbZNFKL8G?=
 =?us-ascii?Q?0BMpc+7KsHpzgXmALZJ/gMHyZjQwiDdnJDFDBZ3MmxcxYzl0ozcDq6NKjK5U?=
 =?us-ascii?Q?5AVppxEZpzSfs5Tw0zs=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(82310400026)(36860700013)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 09:32:06.8769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eea9896-67f3-4125-7c3b-08de3e184fa8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_013216_217962_196F3BBE 
X-CRM114-Status: GOOD (  22.84  )
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

Hi David,

> On 12/18/25 09:37, Yeoreum Yun wrote:
> > [...]
> > > > I think it would be better to use only __GFP_HIGH in here since
> > > > when kpti_install_ng_mappings() is called, "kswpd" doesn't created yet.
> > > > and to allocate page with assurance, It would be good to use
> > > > min_reserved to.
> > > >
> > > > Am I missing something?
> > >
> > > Personally I think we should just use "GFP_KERNEL | __GFP_ZERO". Anything else
> > > would make this allocation look special, which it is not. If we fail to allocate
> > > at this point in boot, we have bigger problems.
> >
> > But I'm not sure *HOW effective* to use GFP_KERNEL in here.
> > Since it's before the any filesystem inited.
> > IOW, in this context, almost there would be no *page cache*
> > and I think it seems meaningless to use "GFP_KERNEL" and "direct
> > reclaim"
> >
> > So to get success for allocation, __GFP_HIGH | _GFP_ZERO seems much
> > better.
>
> Unless there is a real reason to confuse readers why this is very special,
> just go with "GFP_KERNEL | __GFP_ZERO", really.
>
> In particular if it doesn't matter in practice? Or does it and we are not
> getting your point?

My worries was
    - kpti_install_ng_mappings() is called while in "smp_init()" which is
      before creating the kswapd thread via module_init().
      Just wondered whether it allows to call wakeup_kswapd() before
      kswapd is created.

    - Similar reason kcompactd too.

    - Just wonder how much direct reclaim is effecitve since
      when kpti_install_ng_mappings() called before each
      filesystem initialised where not much of page cache in usage.

TBH (1) and (2) seems fine since each wakeup function checks
the waitqueue. but because of (3),
I think not GFP_KERNEL but __GFP_HIGH | __GFP_DIRECT_RECLAIM | __GFP_ZERO (?)

Am I missing?

--
Sincerely,
Yeoreum Yun

