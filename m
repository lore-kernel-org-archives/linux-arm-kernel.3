Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:
	Content-Type:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kupJBdF3bRQvq/tea6rBHGJdi0zjK/xa2PLS2INWzNI=; b=Q1tfHJqP/nriQVsJCEnm0L+INN
	eDGvv4wV+lAvKJJ4pRATl6Av7VG7q2ppytSqihqv33hZM81QMHJpws9rI3omH136v163PIOjR3L4q
	AmGVw1k6z1IwqTwD5+8C+n8JATiDFGNwQfiCwBSxgGyDs7TsOzOnQuPPBUWFFzPcds506CmK0MFrg
	GrgQroZe3FviQnaeCnRbIxqaz+Ba3zhtUZRY4cChR04VOg1eUpNmlmGkbgB1sQywwTnOm61SQ40wZ
	hQsZuuME53Q4DBge0dC4VK3LJT9DzcoqZscWuvBNu9y7qzyLIdHaoiw+yaztZhztijRG9B/1dLff4
	cAZocIOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnoP-0000000EFp7-3ztj;
	Thu, 12 Jun 2025 19:42:10 +0000
Received: from mail-norwayeastazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20f::7] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhwd-0000000DRxr-3tlM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:26:17 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=QA9vChC0ZhpDJJJM5fkMihDPJt0CM8Jatpt0KQMalcQxqHmw2ioMUw7EdMP6umvz0i60+XVtt7mfYk4NzndjIGHY3r4n/cw5YjTcQcehl9tvsOIiWc883w7UdC/Ow25AnAGcrMF1k/aX53FyO7J31S7wMrSBUGSOkhV5HmJyPElkg2Lt7B+LW7Pwi4v+2KaJShGBSf9GO35sqXGSVtqmBn8ZNmyE7BKj4YC6WDG8sIu6OjodvECMqd0OCrfkdc+dFXl2c7EyyzP+8fJnT+lxqStWReogz+LsD2FxqkHif7QKgcMjxXK6ceAdm1RRWSa4UHUsts3hll/ktsgKH5ikYw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kupJBdF3bRQvq/tea6rBHGJdi0zjK/xa2PLS2INWzNI=;
 b=vY0ZZoYFoGHSVuBoqnGJH2jXjeDbKccbB5wGefF3Im5cJ32JFCblEnNaiN1ZzMJeDNA00Z0RYus+snaxOczlGyynp9sEccndxWD70R7BRvgeKoHyDwUwUnBsurAEKKtzUQD3erJbs0Kn77o0L+dCe9zIgWBYBrrSoRbxA3vkRRmyTcGg8Ky8+XSSONAWgxO7TRsBsZ2Q8pbQXDujGMLhrbvLhr4IGlJgGS5PSsgtbWCBsO1G8j2QWtHCveRmobRs33ax0NQvAcXveLRbVcaOS0a/xPRfAN02MOz/0zAgk40oKU+KPjX66OmvJqvC/Z6TFjEMwRokC/kwM1lIpygg8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kupJBdF3bRQvq/tea6rBHGJdi0zjK/xa2PLS2INWzNI=;
 b=UX0OdO3RI/jDCVZQ2n9gwz9i8aVRaJfLN18yXJkPb4U0iY7dRM5EOf064VbM9wqVKfDO/JaW1nSBC+7RiUTD8gX25Ev1MYjpP0xMBtQkgr3lprGyN/aU3RhbYmxyDeORr08w4eXijHwEjyJqCudXHM2jrdt4tG9oNn7SJhWCci0=
Received: from AS8P189CA0051.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:458::34)
 by VE1PR08MB5567.eurprd08.prod.outlook.com (2603:10a6:800:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Thu, 12 Jun
 2025 13:26:09 +0000
Received: from AMS0EPF0000019C.eurprd05.prod.outlook.com
 (2603:10a6:20b:458:cafe::b8) by AS8P189CA0051.outlook.office365.com
 (2603:10a6:20b:458::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.20 via Frontend Transport; Thu,
 12 Jun 2025 13:26:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000019C.mail.protection.outlook.com (10.167.16.248) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Thu, 12 Jun 2025 13:26:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6C01EKFYWsvpmxkc276xVDtjQhz0+BEVPfar7gw9w8rG+t3Z1sukC0B+iSKCoew80/uIoCCTXotenVcGTufaEct0Mwo9UYapVWoTahhhTGQz3vTWCI2NnE+geQ++jsMzAP8TzoowfXEDPWhguJ3fDnYnR1DuUhh9Sl+QNP5EYBalAKlXg97NKlj7DzJWU/MZILySHuX09ByQi3l17rWmIQ+d+DKkzDdPBFwk6UanuQ55Poe8Y01m6Pc4bHoItd2G6+vqDcSH5m1ubjss8XABK1Fyykm6sVGLd1wn2ph/d0fLLcZ72ZXq+5Tus+6CTlIkECFw9+dvFsU/E7m0nUhuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kupJBdF3bRQvq/tea6rBHGJdi0zjK/xa2PLS2INWzNI=;
 b=ieONOGR4R4Wc3rFhKj0IPM6D1GpeaM/+87B89uWnT4iXFHnh0Sm9IHNqmensURwc14JWeOFO3EuORApenGLBd0nCKk3Il2GpTnzjP6BbzuJx8bsqSxir7DJUp+ACf1UsQrLIiDhXpn6NONzftB1gcgif2cMrrIejPkg/5SZ68U10xT4uqds6d/Oqx9+OcxNhhbgnwq2dS2RIsk2B7HO2GVDEl26DijxLF3p27Xw/2dWBIVbC9DnZB+gjmL+3Fvj+RmoZeuE2PVzi089j0PpVIXIIEWZCjU0odrfc5FSMSLboS1zWzTS/QfVvdfZd5xlkkNfu8um+OKRbF0HsdBEJAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kupJBdF3bRQvq/tea6rBHGJdi0zjK/xa2PLS2INWzNI=;
 b=UX0OdO3RI/jDCVZQ2n9gwz9i8aVRaJfLN18yXJkPb4U0iY7dRM5EOf064VbM9wqVKfDO/JaW1nSBC+7RiUTD8gX25Ev1MYjpP0xMBtQkgr3lprGyN/aU3RhbYmxyDeORr08w4eXijHwEjyJqCudXHM2jrdt4tG9oNn7SJhWCci0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20) by PAXPR08MB7334.eurprd08.prod.outlook.com
 (2603:10a6:102:231::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Thu, 12 Jun
 2025 13:25:34 +0000
Received: from GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739]) by GV1PR08MB10521.eurprd08.prod.outlook.com
 ([fe80::d430:4ef9:b30b:c739%7]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 13:25:33 +0000
Date: Thu, 12 Jun 2025 14:25:31 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v2 0/2] fix failure of integration IMA with tpm_crb_ffa
Message-ID: <aErVS4XVZHknlC2L@e129823.arm.com>
References: <20250610060334.2149041-1-yeoreum.yun@arm.com>
 <aEgmhwu1RP27yBpw@kernel.org>
 <aEgwpXXftXW6JNRy@e129823.arm.com>
 <aEg6Bgh8TqzK5nSu@kernel.org>
 <aEhDY4VlkIPYAjPE@e129823.arm.com>
 <aEhIPC95FisptBO5@kernel.org>
 <aEhNnAxlToRMteA2@e129823.arm.com>
 <aEmxaJQNfYJwSCd0@kernel.org>
 <aEm+gqyp0aa4ULYa@e129823.arm.com>
 <aEqsX0hBKb7ZC1qZ@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aEqsX0hBKb7ZC1qZ@kernel.org>
X-ClientProxiedBy: LO4P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::7) To GV1PR08MB10521.eurprd08.prod.outlook.com
 (2603:10a6:150:163::20)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GV1PR08MB10521:EE_|PAXPR08MB7334:EE_|AMS0EPF0000019C:EE_|VE1PR08MB5567:EE_
X-MS-Office365-Filtering-Correlation-Id: 989ffef8-00bf-4a95-4b60-08dda9b4b0a6
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?+m3QGVWHIqwBfPh91lBRG1UyhP0sq6/vNfe28wDSZ7C8QZRlE32+Vd0ezhWt?=
 =?us-ascii?Q?VEc1HczVAXuRnq3qOrjmLM/l+S8HkM453Fqgll0qG+kfbEHp9qiEKPFLE2v2?=
 =?us-ascii?Q?rwVJJvxETv9S9Fl9ODxUTS1xQhaxIiBEfIv24pUD+1CcOkrgULEFADP0qhe/?=
 =?us-ascii?Q?u9MyhOAh0B2WeS8cDr/evHU6KAOMr/7KJ6XzeD2EC/2V7lr92LctEXHwokyM?=
 =?us-ascii?Q?GQOe5Z4JkmB5MFdVDCPpJ6it6zPWljXeKVaIN6T4xlOKVW2EPPrMqaac8Uh2?=
 =?us-ascii?Q?+ImOZGVP//YgKZ26NGyxrxmI11IAslX5B9qm1NMiAF5c7x/m4wpJ9EgZ+RH/?=
 =?us-ascii?Q?qcD47uKJtiMisw4whlVPjtd0OSDD7IsQWX0e9g4uVWfLeqRFIhHzWWtRxtZh?=
 =?us-ascii?Q?cXCpGCCFi0Dpf5B0W8Xu7r5hs52tQ3wuz6KdZ61omGfSQBBkT1Vfq8EPkZS9?=
 =?us-ascii?Q?CDUOj3BZdkmI2EXEzSaidgRwp519dXctXg01/5sI9rvWpY7HM/oikFYrgXPQ?=
 =?us-ascii?Q?jXrji51QN2cmLA5azogXlUXVzw9ka7knW5IMYkeVuQkSXN1+JbsNoDQCtoHR?=
 =?us-ascii?Q?fhw9ktOadbf3KQQyw1WD8V9lADi1TYxyr9eroOq82p2O0Jeo+rzEmJTYR7Dj?=
 =?us-ascii?Q?wRKI8dTGaZlR4KslDrd/a/foHd540Ew1H8P+IIMDDsCEej3zb/9o5AIfX/GE?=
 =?us-ascii?Q?XI51xVz6Sob3MUdl3zDLVyLw+4sRcfQeGj6HjCBbqur4gsMAprckZgW9AWI2?=
 =?us-ascii?Q?xdb5oytN6HOUi/LpT+gIPtHLiWX506CPE/0DdVfdiFqIFJ3Bnua41omvTLTs?=
 =?us-ascii?Q?YoPj5KRvlty7oSKYG18anYtN5fIVVbuFK8I7WsxrS1Hv7oMRHNktm9PhEKRo?=
 =?us-ascii?Q?6qTjAU/1RuA5z5rEa0/IIKnrWkpBRJswDeDTWgfmVYsNjVyU+XzuMOCIxDGg?=
 =?us-ascii?Q?hK1eKqKdeFgyLRNJnHWeqywUdFrdXkpJI48j+cX/lz0VuxweXE7MbjtFBvAa?=
 =?us-ascii?Q?rbaXsT/cuA5M5nI2N8Dh4IvLVSD0yp/hoxoZxp05H2YDHKRpYb0BSTulyaie?=
 =?us-ascii?Q?T1qCxepJ+0Uf31/39tp/ZsSK6L1vDwEPVWgmXRH+58HV9BV/HScUXB/JQqSy?=
 =?us-ascii?Q?FtYPPQUwISCzQCUM5kygIskzZDIz2fenv3eQ7GXE56t+cIOoiBnsr3EY772S?=
 =?us-ascii?Q?e4sK8P7yDHeq8Nf0YVtaJU9PCv5i8P6+Tk+8c/ExZLkZhqPttR7JL+mwi/E6?=
 =?us-ascii?Q?FbvcMRR1ypTg6aB9VnKMlUKUfYWou9E8MQikRPivkrXslcEXfEzVp4R8PkrQ?=
 =?us-ascii?Q?kpScMoNlfH+AIpLViaWu0MmUOkkzvo5DBcgfAN5ExOkXlbkx0zjP2KwwOMf9?=
 =?us-ascii?Q?RkfItA90EelSyKJbJSZzhmEgWu7W6WAI6bgwxA/KHXOz8qc0FSEkgoIhNwBH?=
 =?us-ascii?Q?oA3vgP62OVM=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10521.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7334
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24a502dc-0461-44c5-59c9-08dda9b49c0c
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|35042699022|1800799024|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CjLuBOwckGWiYz06uWX9sK70Uc8FLewL+Xibt4tzmMMmCW4A/PSmM8+ftoQc?=
 =?us-ascii?Q?ibXzUVL+KsbwbLPSEd3DOzM5fJ5cfvZCcasJHSQ3p/QLXvraQWwjwacm5e/r?=
 =?us-ascii?Q?kWhEfPzEuU34v6bThbj1iHFkNhpD4MM32rjVYE0k5SB1in7MQLSzytg02Ecm?=
 =?us-ascii?Q?lt1gm/yy0HVqkjhDOsVGsZEcAbxSQik5uax1EArNuSMpZD2emfzsxP6fQ0RV?=
 =?us-ascii?Q?rlAQ4QAk8B5FkHrlJi4pRx5tYeoGuVCHZzBTa4BLESBQll/iia5nZtF3igrU?=
 =?us-ascii?Q?YwHQm456OIan5/JiWDb6HrJhzKW0/NEUFqNrogocdNSYs1+tmGnav+cUylGb?=
 =?us-ascii?Q?RUeVKuCgttJkjoPRZV+RcrQ7NvSzNyhAlqO4raVOJMSgKZ3gUlRLexHtve4a?=
 =?us-ascii?Q?LRL7D6TjGDRirSARIjci4oIMQnRJNUNFmyhPEKXMB0S3HAAmIVVg7qf1m7+e?=
 =?us-ascii?Q?h6JXXPxlWedTz1rqYGFwcA4w01Vf/mVwJUCQQAFckSfywT3hkQC2nmyOoGIC?=
 =?us-ascii?Q?UpEQIQyHRShc5ZF/wAgtTa5K31auyYuR+jw1pq2Jop9uhSu3a1dK2oXmxgjJ?=
 =?us-ascii?Q?s0LdRqRmeO9wghoo8YJ29mFcjB+SAhhbz5fhXr01AECVVFmNch0Prp0Vm4Nb?=
 =?us-ascii?Q?xbdj/yhkLFewYiQYO+/8K4z/yEx+sw9VxCA5iZbTVOCaubU0YCzqrW2t9uXX?=
 =?us-ascii?Q?VpeWSGieqJpE623NDPVH0yS7+2pIwFB6iFpo7JfcJIbMAa5ChPGaorP2f5nW?=
 =?us-ascii?Q?jM6IpTZh8KTHHcUS/ZJ2YZ9hOBXVICyIIrRK3EXM7SFHmi56872cHoPfqIVg?=
 =?us-ascii?Q?XkA/Bi1VbYudKkMfksMgP821KzEVPtpFtTNff/P7b/O18OSB9mpm5KJCCgLC?=
 =?us-ascii?Q?nnbCI7SA9cn6ksi/lZr8aCtCH7GvvFeQuZ2F2hrDoOTzqIxtTTo8ulV77D9x?=
 =?us-ascii?Q?VsNLI0XKk0nScvWxjUt4tY3Vlt7WpgRYLI2noJSKeAIEDwUHgaXfvUE7bBEP?=
 =?us-ascii?Q?vZ9KRRrXIio0TsiBVD5Mb0DMKC3sVz3zVP/y89/ea6E1Tn0sPgWLoziTA+Zd?=
 =?us-ascii?Q?4MwLjnT6hlkcg2NZsVQn8gq4WdgBHQhV7axy6yVW+CYlqjTLEa+z2Hg87zQS?=
 =?us-ascii?Q?qpjVt3FK+P5UnEBjecnd+X6M0/U4nUm+wlkBe8AdO1204flBvbEyIojuU2jS?=
 =?us-ascii?Q?FpWZUCOv9UH6DyJe3T9dq1I+/pWeECNlEIwlkNy2xvtU0oyibma+s1ZwpLX0?=
 =?us-ascii?Q?JDecZsU3YG7pPz9ZutnYiDWcYrHkjD0UCAoySEpOEc5M4l7gGYm3Efzondja?=
 =?us-ascii?Q?QKykqeIJbInjI82FF/sivb/n6Tc2qx8FAB1HkNkpn6IMCvfdE2+wmbNB6aHi?=
 =?us-ascii?Q?T33rOsMqR54rRfLr3jt5+Ib0Lb96/hjWqQlgv6CJHBycXFfEuDjBgvJFHt2+?=
 =?us-ascii?Q?kkkLp6kQ4Tq+SNFcLK4AggtoE2LZ0HB8tS/UatM276lLmgoWAvSgYOwm0Nm4?=
 =?us-ascii?Q?sdX3P4MvN/Q2bphdSU3H6NtiC31P7kfxw0Rt?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(35042699022)(1800799024)(82310400026)(36860700013)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 13:26:07.8536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 989ffef8-00bf-4a95-4b60-08dda9b4b0a6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF0000019C.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5567
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062616_063646_F45FC516 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Jarkko,

[...]
> Yep, and you sort it out by not compiling it as a module.
>
> +	ret = ffa_register(&tpm_crb_ffa_driver);
> +	BUG_ON(!ret && !tpm_crb_ffa);
>
> These lines struck me in your patch. The commit message has nothing
> about ffa_register().


Sorry. I think I miss the description for this detail.

This is core of this patch.
So, in patch #1, by chaning the ffa_init() to rootfs_initcall,
it ensures the generation of "tpm_crb_ffa device" is created before
crb_acpi_driver_init() but "tpm_crb_ffa device" isn't probe yet since
the "tpm_crb_ffa driver" isn't yet registered which is registered by
"tpm_crb_ffa_init()".

Therefore, this patch does that when crb_acpi_driver_init() is called first,
tpm_crb_init() registers "tpm_crb_ffa driver" via "ffa_register()"
to trigger probing of "tpm_crb_ffa device" to initalize
the TPM device using CRB over FF-A.

>
> Also, please remove BUG_ON(). That said, I don't think 2/2 is needed.

Okay. I'll replace it with error message.

Thanks.

--
Sincerely,
Yeoreum Yun

