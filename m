Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A370D26D7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8N8ENd+EeriATEsOWykr0vUQ9Cm4TVZflNMNQZO2H+0=; b=nQz+TTy35HsMD8Vqwl/+SkyBlT
	VHBrPxt5vZhJfw+NtpyJQ1wDZWvORM2qESWxSZ8KJGQg1nM8+jxU462Y25967N7uE1roQXwKRIwye
	d8kEzIrHqtjPx4Brj2K8qUx8lPsPZJ+bCiVNud5VrqaZpQHoTwT5slXQ5HldDSv9buj9ty8+FTrZT
	94WG9wKBlirAc9sJ6IbdnGW71nbmNqFMWuWJSBf0pLOaDzJQo8NyN3+avZsGTJF4rtCfOUwrqb4Ov
	/kpNHYE8DpyHcV4IWVGtwzXAZ0mJQSBgUB85OnbEtsKMFz6Dhvwpl2ervKYkP0JHnJHlR84RzGXGg
	ngpWKNsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFw9-00000002iNX-005S;
	Fri, 09 Jan 2026 17:06:09 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veFvy-00000002i3p-08px
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:06:00 +0000
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FIuKj2A1YYPzprz+Xiz8EO+Rcnf6BBv9M0EdkBCM9XQZUykrZ+Q3wEnoGVKV1i7tRYBV8tVp9qYSwh+jye4GFQvKEWqsfhCqGtDG0M5zjfoP+IN3fxEu1Nd9tepp4+9ASH4aKuwvOgnwBaPJpa9xj8krzYi3/uk9GdpIYsgWChP/ZDYWrmZCUwCihS/A5oMSRgn1vkz+q0ge/LeM8Nc1Wf6JwrfiBnMtF+pOgMEjanzMOeDhq0UjBH40ulLS9rYQrl/DDS4q5P7Yy6PIPWmYxc3gTj1BL6UQG0G9YEoPFjKH1d7cmLnyrLG2H11r8i2B+t4tBZPg6nzuTWmURudNpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N8ENd+EeriATEsOWykr0vUQ9Cm4TVZflNMNQZO2H+0=;
 b=rp42jcD2PSQF4/BMdSjv9g3MtGGMFzYA1wQ/t4caK09l/pZpxkw1mKFx0zLb6Fq6uQ6zbcIAxehOss2QettfJOIiTb04pYIyWQdOvgz0WC54I6w2zuH6ZHSayryHbWuAf36/f0kvreC/3rmyRhkwM20Sq61hJ4hwdsCmTObCyASgwm1DW3CvbbK6F+HX+N2l4GY4gZKfN0V1bGNGuboeQ8lrHv+CiN9hnQdqnTrdWWTHmZXNtnBebLLQf3MOaDklrr9i3UYw8pJcYyVT8ztSUg/B+SkaUL1MMAa8vFXr9TDAcINsvJg9QyzbuWH45AyV1X6XKp5x4Ny5qaErYosyOQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N8ENd+EeriATEsOWykr0vUQ9Cm4TVZflNMNQZO2H+0=;
 b=BsJs1xsYTrBLBf3HqKvtUesEne7VAwF0dOkZmuQzx2jWfcYHtSX4/+d3CqQKn5dCOxtLzriAywZmgCGMOucnIbm3oOWHecy4wvrgUVMNihW4Ldya3+jL27LDIKHJCap3hw5UJ0dr2zeRHeoBqz8EoSkD3tapqEshhDPDiW3K4Fk=
Received: from DU2PR04CA0329.eurprd04.prod.outlook.com (2603:10a6:10:2b5::34)
 by DU0PR08MB7690.eurprd08.prod.outlook.com (2603:10a6:10:3a6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Fri, 9 Jan
 2026 17:05:51 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::55) by DU2PR04CA0329.outlook.office365.com
 (2603:10a6:10:2b5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 17:05:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Fri, 9 Jan 2026 17:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3HEt6x12LRNNOGVdkunTf5eW5K5BXWcEax/2vtuh/ImgQKAgKKwZfuyjOzj486HHJTjMvcelGXYIMbneioNJFzKjzXnLfqgWbW+2yKK+B0ZrsggbAmHe//Xlrh8cmfA4sa251WF6+TVBNIQOEH9zqVvGtCksWzp9rIKak49XgvTdNGMXSavz8VKdto7zjlp8dua0o8mlUuRwoBhZLPleHCefEF2XYwHhLpAeYP3kKFKPBJHxs+DnX2hIXvmUpfXg53QwTvbJ1hwqCm8KdZtUqr7a611jFVy3cWvSA07jdrGBI2aHcu4uuSJlGirt0Cj/I/ZHoZ/yaSUE2Knn82D7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8N8ENd+EeriATEsOWykr0vUQ9Cm4TVZflNMNQZO2H+0=;
 b=FFOhjn33DhyXq7VcaSj/DgiZ0ngmEDLluv9t3oO676k/2IzdYvUztQt/Xy1BY4jYDvMTITBxNncTulouGxY/xIMGFJ2M94K5F+s/yFyaGJQKzepnaxTdYHD24ZTysAr67IIXCoQJGyeLmKaBYtZtapyRdU3KrJvTziqpj987fDUrWUHvc0PiyKRwiXXc4d/DaOYqnMCVm60MEVd68UATuze4HOcJLENPosssaLKciTDR9kXq8RbjZDu3GzvW8wZq5O7Mg+RhjnFJtqO46BSrpnXl1qyy6KQK7zWAus+7L0KnBnoC/IPTBBwZYrv6gE2FbcRmQVNzVnDRPRrL+z2jog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8N8ENd+EeriATEsOWykr0vUQ9Cm4TVZflNMNQZO2H+0=;
 b=BsJs1xsYTrBLBf3HqKvtUesEne7VAwF0dOkZmuQzx2jWfcYHtSX4/+d3CqQKn5dCOxtLzriAywZmgCGMOucnIbm3oOWHecy4wvrgUVMNihW4Ldya3+jL27LDIKHJCap3hw5UJ0dr2zeRHeoBqz8EoSkD3tapqEshhDPDiW3K4Fk=
Received: from AS8PR08MB6744.eurprd08.prod.outlook.com (2603:10a6:20b:397::10)
 by PA4PR08MB7386.eurprd08.prod.outlook.com (2603:10a6:102:2a1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 17:04:48 +0000
Received: from AS8PR08MB6744.eurprd08.prod.outlook.com
 ([fe80::c07d:23d6:efa7:7ddb]) by AS8PR08MB6744.eurprd08.prod.outlook.com
 ([fe80::c07d:23d6:efa7:7ddb%6]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 17:04:48 +0000
From: Sascha Bischoff <Sascha.Bischoff@arm.com>
To: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev"
	<kvmarm@lists.linux.dev>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>
CC: nd <nd@arm.com>, "maz@kernel.org" <maz@kernel.org>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, Joey Gouly
	<Joey.Gouly@arm.com>, Suzuki Poulose <Suzuki.Poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
	Timothy Hayes <Timothy.Hayes@arm.com>, "jonathan.cameron@huawei.com"
	<jonathan.cameron@huawei.com>
Subject: [PATCH v3 23/36] KVM: arm64: gic-v5: Support GICv5 interrupts with
 KVM_IRQ_LINE
Thread-Topic: [PATCH v3 23/36] KVM: arm64: gic-v5: Support GICv5 interrupts
 with KVM_IRQ_LINE
Thread-Index: AQHcgYoOAs7rSNWAJkmjMpVvMHTcxQ==
Date: Fri, 9 Jan 2026 17:04:46 +0000
Message-ID: <20260109170400.1585048-24-sascha.bischoff@arm.com>
References: <20260109170400.1585048-1-sascha.bischoff@arm.com>
In-Reply-To: <20260109170400.1585048-1-sascha.bischoff@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.34.1
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: AS8PR08MB6744:EE_|PA4PR08MB7386:EE_|DU2PEPF00028D05:EE_|DU0PR08MB7690:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0b91c6-f381-4431-7ecd-08de4fa1577b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original: =?iso-8859-1?Q?jVkmVmyT8SVZZKyo/Nxk7AAxJUkn+GSgI9ipM1f92s8bogtTFN/07TbKIZ?=
 =?iso-8859-1?Q?zKPzVQHPUuEEdnhX6zI66Y9QOCgofc+7GVgEs6X22ElFFM5e8MLP5nvr3X?=
 =?iso-8859-1?Q?b5UmnQaOwxcjO7XmpK5BVZyREPOUfGKfjQ1wIbTLBdww6GwPF9wrxmjKGq?=
 =?iso-8859-1?Q?Mn1ccaUiM4IFoTgsVWNSkVBtk3JykQ+Lb+AvKQ6gbIPO4eYacss9bt7xDd?=
 =?iso-8859-1?Q?Eya5HuzTI/Kh46eZI4V4SwG02mYD9EDBUAwK+LHk98ZJyUPHgz3oxLIl5O?=
 =?iso-8859-1?Q?OgLzTTu72ZC3J9tA54azT5kQmnhk0JCLX0+N+7EOsvuFNLQF6nZ0qGjOGE?=
 =?iso-8859-1?Q?bV/iw6xoxPVzkIKR7pWkXv03SNEb+n/diR1guqmoSeMvi+Iqs6sNIIMK87?=
 =?iso-8859-1?Q?m6KdoPr1ydqVJrRipyzmjOSavnj0paaScG+jl3OqZ6l+ZOA8qe5K1Rf2hX?=
 =?iso-8859-1?Q?uG5YsAiFKfNRtwfQa8jwKmNDY9ny+XAHsajwe6jf5GsJSbbwJM+ZJiDD9T?=
 =?iso-8859-1?Q?8QVJXklO4zYKRVWDWBiEePYnIeDJ/2APe8GrozTk7upLS6YrSHz+niyprw?=
 =?iso-8859-1?Q?UX1o8LFpzq0KPPh3r3v0lFnL38SKSHtQI0wzzuSQkPfZBzW7ObJqXP1rS6?=
 =?iso-8859-1?Q?uea8fOHk0nZF0hW7U5zw+KydyzLnpXy9cQj4bZg6MUrC8BWhRKrtoqFQmJ?=
 =?iso-8859-1?Q?g7Z/yb9n7sFYq1iV+siZpgg5NtdQQOi7wB4tw9RBfnZYLGnGMj1RZLazn4?=
 =?iso-8859-1?Q?pFhyjZF6KgFf8CtGpAXoAePmEF8fFRDv+/QdHPAEjTkALdDGSOkr2YKuSY?=
 =?iso-8859-1?Q?VQW9PfTA7J/FzTNkPFdf6IEksTLP+Khah1IK/R+ZB+49Qy6bl0COa7O1JG?=
 =?iso-8859-1?Q?VT+EhNuAPcYZ9ZwaoyaWx68WsFT03eRhdc3evpMo5/gRxCTlshLUOyWo4f?=
 =?iso-8859-1?Q?pUbTv6GX99AgEGNXrwq0M1AgKsMff6KZ3t+R8OEc0BE6/QtjHXfYwsTIh1?=
 =?iso-8859-1?Q?CUl+H8yyKGKSKNHY6OpBXEff+DmC/1zlj/RM+R26r568CIw7sc2Qs5n7J1?=
 =?iso-8859-1?Q?XhWKs5ou1PFuJxRGjJmNl58McslqfES+V4gVOH0fl7Hgs5lgyumD19MPU/?=
 =?iso-8859-1?Q?sMc0PzCEdtpMCGNjRycOnVYLJlRNs+TNgwETktsgTdfaBxGM2wkc2OvGao?=
 =?iso-8859-1?Q?rEiTTivymcXy1QPMifd66EOrq7ssoQFiG52K01CrxQmHXLFgyYzyRFgomL?=
 =?iso-8859-1?Q?4/O/ofRm4w6R2YCJxCaR1pffOh+sWz8HKJH6SzGIelLzGMG1wJx3UkDdFH?=
 =?iso-8859-1?Q?cX4pxVIHXxx6Rz4U83iydYgDtH1TXIkpuEQSTCEc8mPUSq9aRCe/TDwn1q?=
 =?iso-8859-1?Q?C0/NcPyKjQZvxK8d/VNvT1fhlWeu9XM4AI0LqQ+ysu5cL2ktJyXnGrMzv6?=
 =?iso-8859-1?Q?Zc3nSu03DbOH87yLePgegfQ9OyQXS5Upkgs8VMMjCMgTL9ja7qpIOj1wTn?=
 =?iso-8859-1?Q?s6Ec5pX0dKStyczXs2ThuYlo0aCXpixH1fPHaaAlxpLf83hLMX+d6kF5nW?=
 =?iso-8859-1?Q?SsMjOXZXbgUu0BSuF6VrWHAFwUyF?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6744.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7386
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e79f1d05-d472-4f09-2251-08de4fa13206
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|35042699022|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?e1WW3LIam7kNvxAIYxXU/U69QK/sqTYfyBrzrOqToS011qokVm5UnzU7w/?=
 =?iso-8859-1?Q?rvDiM28aK+wTtyyhtjlP0wa3/0bt027jXBeAbhxBCLCdwkpdbsSueUfE4h?=
 =?iso-8859-1?Q?QOLXQN6oloDVTO/VSxVYQliIZEpuqZFU1709XZsgbRwgv3N+pMaDRg+4+t?=
 =?iso-8859-1?Q?wup7N+DIkHbsN/tLsIWdm9rynF9J2o8VdKbpxKRrB9GgMd/eEY6sLkXaWG?=
 =?iso-8859-1?Q?Ph0SVatEqS8dbhCnOA25x0XHO3XrN2/CbwgU1E3y1npOeZk4/5Ci+TGbGB?=
 =?iso-8859-1?Q?M7Ef52pgvhouDWS+6XZf4qNGeKKOyoWZDBXgHSYMWnDrMWDsF9inYIoUUY?=
 =?iso-8859-1?Q?agjlC+wWUJrZg1AVF34gbKqzULOJ45YvbCs3/Q/D2QI7KWjAt8+1bdSnlB?=
 =?iso-8859-1?Q?mkheUEN8dIEFTUhsGg+aod3SvSqti+jIi9Firc7qLBYR1G2WzPw6J31qfa?=
 =?iso-8859-1?Q?vh1+xH1sLk9dsmYWwiNU2TblECDg/bGhEi191ypkor3tDu3hajHcDEzhYX?=
 =?iso-8859-1?Q?4PCxDHMW13uUcnfqyy4wRi0jadXdMA4RWeb95uDNLmhUHca6yq3JjSLrEC?=
 =?iso-8859-1?Q?WjEYlN1q+zHjRDCfbk0e7ICvO/VwfUnKBrz/lHumzWenWnFxQ6Bhhrw/Rq?=
 =?iso-8859-1?Q?o1hRwDhhHcltqoRrYkDH9r7bV+NnExpLT2Ia7KtFFQ4CVkCOPN2BKzFk7G?=
 =?iso-8859-1?Q?Ltul3N7//OxJaMfpn9f7n94tqDez0z+mSw43J3aIkTgFoSaaRegvkvkuFI?=
 =?iso-8859-1?Q?C2h2oKkxcydZg/WJaiOIEJrvZ38BLDSUrA31vEPp2+MtzLaeDsHQEWQkt6?=
 =?iso-8859-1?Q?ZFfDCxHAVROL7uFD4aPNKx+aJ6k4caPZeVtOmCCMkmPH5XmFZAcNDCSDx7?=
 =?iso-8859-1?Q?Y9Sh2MFh96GchGFEts2oiyU8UEF7A1Um6XMf91wsXN9oEd/UiNj0EM4ByV?=
 =?iso-8859-1?Q?VxNg5kfl2U3n2LXnlnTXoKFm/afvPog1ftfXch4YxsFmToksd6zENYlTTo?=
 =?iso-8859-1?Q?ZUs9DA6UhJ0RLnr7Fho9Nt49+ZnS3WSzt8ppZmmxrBFOHQouNg1gzB2Jxl?=
 =?iso-8859-1?Q?v14U00/FoCS0YxJ748aDhySsXUR22vH8lDENoteuuA/ckwHzg345s5gsph?=
 =?iso-8859-1?Q?LhaRrc58pfXeztGv2Kg6ZMP+EUbkz6EcktzUXJ+ZjiPMM9gIzurkqcJSPz?=
 =?iso-8859-1?Q?uqzAXSwo9v4bjzXxtYjuXWf4CD/r+yu/aXq3BmECOpyNkh9mKf1Y6a1c7U?=
 =?iso-8859-1?Q?CZMOEVWcIPWqaeccyeRjwylo63ug1HKajt3XtTY2l72eTaL4P0Zj8/lR4q?=
 =?iso-8859-1?Q?iS0AC/WDlgb1ovYwWErCdSPeRQ0M3SlV8gjZ8SO7K/H08Kid7l9hXNO6f9?=
 =?iso-8859-1?Q?cTZK37PEosPb4b36GLypx8TpN51YRbhNjMHyhY2ScepG0pM6KCM2IrbXsj?=
 =?iso-8859-1?Q?HYNtdn7JXydmVwlzkTDPcxRWP4iPBhJKIAKH+pxC5Dv6wEvldCZQ+WJ/b0?=
 =?iso-8859-1?Q?lndZdoC5awndaTmx3JnCaqGz3BTTgTR0njKP6sB977cqMbEW3SzhBIMN/v?=
 =?iso-8859-1?Q?txVuKcR7kiJmeH2tM0UvjRzH11M/i/6qqYN5J23KXzOtik3/q3ahy+bMKU?=
 =?iso-8859-1?Q?2ehocAmVKaMik=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(35042699022)(36860700013)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 17:05:50.8076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0b91c6-f381-4431-7ecd-08de4fa1577b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7690
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_090558_258726_F6931114 
X-CRM114-Status: GOOD (  13.91  )
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

Interrupts under GICv5 look quite different to those from older Arm
GICs. Specifically, the type is encoded in the top bits of the
interrupt ID.

Extend KVM_IRQ_LINE to cope with GICv5 PPIs and SPIs. The requires
subtly changing the KVM_IRQ_LINE API for GICv5 guests. For older Arm
GICs, PPIs had to be in the range of 16-31, and SPIs had to be
32-1019, but this no longer holds true for GICv5. Instead, for a GICv5
guest support PPIs in the range of 0-127, and SPIs in the range
0-65535. The documentation is updated accordingly.

The SPI range doesn't cover the full SPI range that a GICv5 system can
potentially cope with (GICv5 provides up to 24-bits of SPI ID space,
and we only have 16 bits to work with in KVM_IRQ_LINE). However, 65k
SPIs is more than would be reasonably expected on systems for years to
come.

In order to use vgic_is_v5(), the kvm/arm_vgic.h header is added to
kvm/arm.c.

Note: As the GICv5 KVM implementation currently doesn't support
injecting SPIs attempts to do so will fail. This restriction will by
lifted as the GICv5 KVM support evolves.

Co-authored-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Timothy Hayes <timothy.hayes@arm.com>
Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 Documentation/virt/kvm/api.rst |  6 ++++--
 arch/arm64/kvm/arm.c           | 22 +++++++++++++++++++---
 arch/arm64/kvm/vgic/vgic.c     |  4 ++++
 3 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rs=
t
index 01a3abef8abb9..460a5511ebcec 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -907,10 +907,12 @@ The irq_type field has the following values:
 - KVM_ARM_IRQ_TYPE_CPU:
 	       out-of-kernel GIC: irq_id 0 is IRQ, irq_id 1 is FIQ
 - KVM_ARM_IRQ_TYPE_SPI:
-	       in-kernel GIC: SPI, irq_id between 32 and 1019 (incl.)
+	       in-kernel GICv2/GICv3: SPI, irq_id between 32 and 1019 (incl.)
                (the vcpu_index field is ignored)
+	       in-kernel GICv5: SPI, irq_id between 0 and 65535 (incl.)
 - KVM_ARM_IRQ_TYPE_PPI:
-	       in-kernel GIC: PPI, irq_id between 16 and 31 (incl.)
+	       in-kernel GICv2/GICv3: PPI, irq_id between 16 and 31 (incl.)
+	       in-kernel GICv5: PPI, irq_id between 0 and 127 (incl.)
=20
 (The irq_id field thus corresponds nicely to the IRQ ID in the ARM GIC spe=
cs)
=20
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 94f8d13ab3b58..ecb7a87cca15b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -44,6 +44,9 @@
 #include <kvm/arm_hypercalls.h>
 #include <kvm/arm_pmu.h>
 #include <kvm/arm_psci.h>
+#include <kvm/arm_vgic.h>
+
+#include <linux/irqchip/arm-gic-v5.h>
=20
 #include "sys_regs.h"
=20
@@ -1430,16 +1433,29 @@ int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct k=
vm_irq_level *irq_level,
 		if (!vcpu)
 			return -EINVAL;
=20
-		if (irq_num < VGIC_NR_SGIS || irq_num >=3D VGIC_NR_PRIVATE_IRQS)
+		if (vgic_is_v5(kvm)) {
+			if (irq_num >=3D VGIC_V5_NR_PRIVATE_IRQS)
+				return -EINVAL;
+
+			/* Build a GICv5-style IntID here */
+			irq_num |=3D FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_PPI);
+		} else if (irq_num < VGIC_NR_SGIS ||
+			   irq_num >=3D VGIC_NR_PRIVATE_IRQS) {
 			return -EINVAL;
+		}
=20
 		return kvm_vgic_inject_irq(kvm, vcpu, irq_num, level, NULL);
 	case KVM_ARM_IRQ_TYPE_SPI:
 		if (!irqchip_in_kernel(kvm))
 			return -ENXIO;
=20
-		if (irq_num < VGIC_NR_PRIVATE_IRQS)
-			return -EINVAL;
+		if (vgic_is_v5(kvm)) {
+			/* Build a GICv5-style IntID here */
+			irq_num |=3D FIELD_PREP(GICV5_HWIRQ_TYPE, GICV5_HWIRQ_TYPE_SPI);
+		} else {
+			if (irq_num < VGIC_NR_PRIVATE_IRQS)
+				return -EINVAL;
+		}
=20
 		return kvm_vgic_inject_irq(kvm, NULL, irq_num, level, NULL);
 	}
diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
index 8f2782ad31f74..1b910e22993c7 100644
--- a/arch/arm64/kvm/vgic/vgic.c
+++ b/arch/arm64/kvm/vgic/vgic.c
@@ -86,6 +86,10 @@ static struct vgic_irq *vgic_get_lpi(struct kvm *kvm, u3=
2 intid)
  */
 struct vgic_irq *vgic_get_irq(struct kvm *kvm, u32 intid)
 {
+	/* Non-private IRQs are not yet implemented for GICv5 */
+	if (vgic_is_v5(kvm))
+		return NULL;
+
 	/* SPIs */
 	if (intid >=3D VGIC_NR_PRIVATE_IRQS &&
 	    intid < (kvm->arch.vgic.nr_spis + VGIC_NR_PRIVATE_IRQS)) {
--=20
2.34.1

