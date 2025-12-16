Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016ABD5E12E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZYR1XGBpiuqXVqMcFiKeb/jsk2IwNZr/lanJCRvPT64=; b=cTC8Xv8higtmsgQTEStBwMci7h
	SXrovT6C4L4NkujY7876nAdVIMO+TP3/0hsFp4O/U1nxIpl5GG6EalFWLJT7JFS0PkXFakttHwOAH
	gKMK1+hqswWnfVSwqOrJZv5pVD45k/pSP1wsHa/WooDsaY7Jf+l+8s/FsB+7Hv4VWPCnp+aOHIgc5
	TqcWrOeCytdnCXUTiqaZ3+VSmgGf4wQ81czOfUt35dbJbu6cuZ6dQDIVrouqR1COR5FjWS9v6BlTM
	w2VWCpL0bJprfd3WgGRseOhrYBABzfQ8xjjBw6XIKsgeFIrrrstP/8LjHOAQMJAMsIPC8EyX2ML4M
	LtoH1Mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTD2-0000000580i-0tR2;
	Tue, 16 Dec 2025 11:27:16 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTCz-000000057ye-1hu6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:27:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIb7U71MKD/ad+Jr28RY104E/aStDbg6GLRb9eSxjmCCK0Lr1+01UXF+P45LFJEpU1C7WJamZPhc8T35gduMRffVZ0twM2DyD63OJMju+LPvAYmUWxpfwuFrQ32glYv8GcrRnSMAgdLCySKYVZENgov53kAjIHygCi6pqDeRpl537TuS2JZKWOfD9fDTNCxumWoGHszJZKE7QVWp8/I3xGsXvbG3wVWdFh8BEQYs0IkxScqZ0h0iincsbUBrxKuUfUeoHuKIufkHbbjayH0NfcQyixlR4Tb0h3L7HkwQrujpOUoOVgs8IiO4Yv97bUdTWieQWZ2waElLTHPquCZ8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYR1XGBpiuqXVqMcFiKeb/jsk2IwNZr/lanJCRvPT64=;
 b=UcqV5XjoAPnxGHjala3sENt/NFbJFYdY3YvS+hs1akAQfH9JUkGb2Dt9VJRNgofeNqmwAgnAjqTJ+eGqJztYXIoLFOB5rOhXdfxc9v8x7kjnJAKesO//5XRAiA6gXGrnmRZx6VaPdsBtcFwtBp45GuSF787+2ogPh9fCaiHmq23xzZbPF32Xrt1lxZ5CbSEqEDWFZHqIgtwonqE65FKrAblzHFHA4hvsSf0JZFuppOePnRwJvO118HBr5LmEdxWa/+5idrTPqN3AdqhVXVMYiFlO/iRZftDlxVga/ez5WkFbq+LCUWt1/t0b+bCvbWHESONBbS9c4Sm/WWs3WlHmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYR1XGBpiuqXVqMcFiKeb/jsk2IwNZr/lanJCRvPT64=;
 b=mJiyP+Wrtjh3R6xlQpiQYOiNKfwF+2l2flY3ilIyQOYhAu1qmFmz2ILiN9QRAMt3Xe0Yi+T+Ncf/i9Oz0JDTusE+TyKlOwE4LrG7RTYTGBDyoX97OUzJ2rKPQJi1EIgafodMUDT8JOrR7DpjYUqGKTOX2ov/UCGmCim1Ai9MfLs=
Received: from CH0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::18)
 by SN7PR10MB6331.namprd10.prod.outlook.com (2603:10b6:806:271::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 11:27:09 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::a8) by CH0P223CA0014.outlook.office365.com
 (2603:10b6:610:116::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 11:27:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Tue, 16 Dec 2025 11:27:08 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 05:27:08 -0600
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 05:27:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 05:27:07 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGBR78G3966627;
	Tue, 16 Dec 2025 05:27:07 -0600
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>, Francesco Dolcini
	<francesco.dolcini@toradex.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 0/2] arm64: dts: ti: k3-am69-aquila: Fix USB-C Sink PDO
Date: Tue, 16 Dec 2025 05:27:06 -0600
Message-ID: <176588441712.56134.6319284931357178936.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251204134220.129304-1-francesco@dolcini.it>
References: <20251204134220.129304-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|SN7PR10MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: d5eaae21-795f-4b69-a1e7-08de3c960ca3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTNrcThRdU9SSTQxZFN1MjhsRmEwaDNvMzB6NHI2VnJYTVJlTzJLU3lWbStO?=
 =?utf-8?B?c1c5S2NHcWp4d2MyTndjK2kwUEdHQUUraVg5Zk1oS0JnUlNPb0FHSU42TW5a?=
 =?utf-8?B?MUc1UDk5dlVaWm5vR3hma2tyQVhMSWlvUmZIQWR5bkIyeCsrdEw3d0FDNlBi?=
 =?utf-8?B?dU1uME45eWVBRHZ5Z1kvN2NtYTUzMVBTTUZOMjZHNzk4V3o2Sm5Sb1BHU1No?=
 =?utf-8?B?QnpmT0REK0cvblVFZ29qNmRQU2MrZWx2MzE4ZkRDNUxqaUxmR2o1U04vandK?=
 =?utf-8?B?S3krakZhZlZzTTc1ZEdXdGNMR0pRbjRSdk9yakhvZDJISWhVRFgvb2NVbEt5?=
 =?utf-8?B?Y0ZGMXR6eGZxY3BkWU02QmpKV3pHM3JPNStYL1F0RlV0Qjl0VGQ2T2FZRzZp?=
 =?utf-8?B?U0ZJNStiZTMrZG8xcTFhOE5IK1A0aVlwamFvLzlTd2xuU29rQVpkKzEzQ2t5?=
 =?utf-8?B?SGVXeDJsYi9GMjFMNG5vbE0wVTVpR0lUK2NnVUNOTlVQU1VTSWEzRWxDRkJn?=
 =?utf-8?B?WEg4b0FRSHcyZmoxYU5aZ2tERUFYeUlJSHJJR0FySmlZejFiN1dzTGdreDJX?=
 =?utf-8?B?b3FaMUNiZEFnR1MwMS9mZVc2c2VIcCtOZFhZM3VKSkZUeW05UjVnWFlIN1lL?=
 =?utf-8?B?NnBKMFRYVlB2eWdCYTBFejR4ZnYwM01wd2hUNEEvMGova1M3SU16RlpSSWI3?=
 =?utf-8?B?dE9HZHNhSk9reUg5ektUdG5TRUI5ZUM5NnYyNzY0eWJpdVZ2d0c5bFgyS0dG?=
 =?utf-8?B?dHZ3V2JRL3hUWHZ3MVpZc010U1lnTjY3NWtRZkw2UjEzNXRkSTA3MW5uZkRv?=
 =?utf-8?B?YlMyQXd4QU9oZGkrdUR5MGxwTWVkaUNqZzdZU1NSRTlpUVluL3V2TkZWZGQy?=
 =?utf-8?B?Ty9saHRXeC94NTB0YUFDQjRkWHlueTVKa2NvY2NPa3Y2RVdRdGFLbW1EaHhk?=
 =?utf-8?B?RkczQ1JpZ2F5T0pZaXlONzhKcmM2T0dqNnkxU3lSL1p1UDBUQUkyMUJ6cmlk?=
 =?utf-8?B?K1FKcVZQM0RvQTZPSHFEUUpDTXhoczRqc2VsZ2hFVm4vUVFFKzJQdS9nYW80?=
 =?utf-8?B?SFBESERDVmRhYkF4WHJvS2pOWVAxWW53VDZ2SytZL0ZPeHlxTHNkVnJvdW1S?=
 =?utf-8?B?Y0xRV2ppNlI3eDd1ZlA1SzNSNFMrTVJQaHhTNEVQU1ByYmVEZ0UzVWExTVNp?=
 =?utf-8?B?cTNZbmg3ZDdKcUIvZ1JmOHZHQ3FreTJrVVl2dnNGM2FFNU1vcjduKzQvdVNU?=
 =?utf-8?B?T3kvQ0k0NWUvK2RGWWtGWjdUTG5RWmtTOEFYdzJGcG5ZSHZIYjd4U2g3TFpD?=
 =?utf-8?B?MmRqNEVrS25uZVBXNDQ1S29YMCttR2hZSnRtZnlkUWF0MUFSM2xiV0RPRStn?=
 =?utf-8?B?SVdxcGdCaE5ERitpY3hJWUR5UHAzMUxnd0pnNHMrZkYxYm5xK0ozaUo3Y3U5?=
 =?utf-8?B?aCtyUjFvQVZGSWc3T0huQXJjL05SbitxZk5yb0MrTVhMUGVUSTJCaGQ5a0hw?=
 =?utf-8?B?LzRVNnNocWlOUDU0Z0Q0Q3U2SHBIRUdwSzh6aXA1cGlsK2lMYUlmQ0tHR09R?=
 =?utf-8?B?c3kvSHIyOU00VTRVQ01MM1NyS2lyeHlxQ2pkWUtvVmRVVDRDWllWRDZvc053?=
 =?utf-8?B?NE1VMVNIK2dhVWtacjhYNkI5c05MLzNaTXhDbE5ZclcyQTBKaFlpekdjY1J2?=
 =?utf-8?B?QkVEMVZpaW5uQUZYQm8xZEh2OFhRRHQyQ2lZaEtHeFhsa1JQdFR6V05iWFIz?=
 =?utf-8?B?YWNLL3Y0bjQ0UGFLMXJzL05iQTNxcitENE1tMmhuT21QZzJFLzF6WVdXMTRy?=
 =?utf-8?B?dXFQWUhwL1R4d21WMnE2UkkwVGw0b1p5RkUzWElReVMrZWJTc3lOQU9oRUxM?=
 =?utf-8?B?MG9wbW01Z2t0NHZCN0pHY2NvaFJTcmErZW1Yb3ZSUGl1Tk5GREw3UzczYnZX?=
 =?utf-8?B?b3A4cFpYWHVwRUs5MStlREF2NFRpTFRoYXVPS0RuOTBmc3RsR3JYYmxxd2k5?=
 =?utf-8?B?c0dtZVU5dGJPaHVPWGw1SGtJSzlNMWhBZk1ubEdIcmVuUUFvdkNkVXBmb2to?=
 =?utf-8?B?cmJMbHdCUTJUT25zOVE0aWl1SFFWbkdBODRvTWVZVG5Zckl3YXlVVzhZaXVC?=
 =?utf-8?Q?KtaI=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 11:27:08.7293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5eaae21-795f-4b69-a1e7-08de3c960ca3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6331
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032713_454245_1D4AC4F1 
X-CRM114-Status: GOOD (  11.49  )
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

Hi Francesco Dolcini,

On Thu, 04 Dec 2025 14:42:17 +0100, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Change USB-C Sink PDO and the amount of power that the device can sink to
> zero to maximize compatibility with other USB peers (the Aquila Clover and
> Development Boards are not sinking any current, they are self powered).
> 
> Francesco Dolcini (2):
>   arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
>   arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] arm64: dts: ti: k3-am69-aquila-dev: Fix USB-C Sink PDO
      commit: 36ee9f8b1ae07fe82885a7a3553a5be347d3f978
[2/2] arm64: dts: ti: k3-am69-aquila-clover: Fix USB-C Sink PDO
      commit: b548f3949937b55ee19ab418343f05700fdf7009

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource


