Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F08FD5E133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qOPwfEDjVsPseSCSkJbfwKZalnAn7R7vW6j0LiiAF84=; b=OmfW7iOfC7jHEIz30BORd7GnyN
	1MuQr6mHkiz4HnGjZ9DoFZ6+4PjeNG3a0a046F46ZWEkFORXbLDG9Teg1TK8E31RypEYS42VSN0uq
	l+u7HGEFSdy1iAzywQOzfn6eJhwQ6zCD/ajuzVCkG8dVoyPcPloYUhDJNV2oySWWuqSdhL/EianaX
	0Q9+KKw9Eg+CpPulZQYJvCJNbaxC4uHKpBDHew1SWntWbXec9O606CusNd2ppLm9uqW6GwE49GC8v
	2kV8u7aDlg8n66RLqCXmNIhEozcp6nxNKDV9aUJL9+onPvaX/fuwQr9mKiOMP3lt5YgDqbae3dSyE
	nhH8v2Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTCp-000000057uL-0EQs;
	Tue, 16 Dec 2025 11:27:03 +0000
Received: from mail-southcentralusazlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c10d::1] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVTCl-000000057t1-42rL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 11:27:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1D+4Qtu/yET+IrdB045ekkkBZ+vrwGAfiZBKky835RW6YOKyjSX63DhpRVihAFgZC+XVULcLsInEOn0UYivtyFHt+FOeF5QMXyWr+DVsUj9ZtP0M2Pql3W773FqoS/4seHJvn65SFjjDjVrqVnB8gM4RvMKd8ZKHVfC6axJRgA11yC3tqX6ehgDLQAp1mcbFx9FPgt8eGuezuGrP1wBCwGGvqdbp2HdfmYUv46u6ThR+cznqXGdcIkrp90siCI6IoJaBfdTm+KHOYZ++mu5bGn+iE9ZGNlPj8uvkk9yqvsla044rCW4ghj0WBUWNhtluz8H4ma7SzP3xwfQScWgpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qOPwfEDjVsPseSCSkJbfwKZalnAn7R7vW6j0LiiAF84=;
 b=cFElLE9rRK/C5PDnC9uvzrxSnRjr3vMKSfGPWTLKJRudq5fzbUc140ZshFVMj2r36bFJtwbFuCMXgkkYTr6Avw4yxJoWOx1lexVSPZytQJHMRR2vRXP319LJQQKi+4SeaUot5eyW5j74oIOfoORImyOTb2S0WATuISs7x3WLWc/CyK3Lz/ae/r0PyWBeQfCwEyqIyDxYwdnc0T8yUE/Zi4DEQsgzXysgYDAqxxxvsfbV8xxVBoUsNPw4LDPRk1b1XRt4iuqyRD+o8LQ9CaJQvQODKux4DlaX4u+Q3lxtvi1PLJ9CrxZ+WPK2S4L7zFK+U+9tf47SEuGyZcNHqdzOuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.phytec.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qOPwfEDjVsPseSCSkJbfwKZalnAn7R7vW6j0LiiAF84=;
 b=OBisqO1eD8KiEnQ+KcRA43OWq3Feb+I8OYPm1YUH6ohsskSNZqHBbzGbcE5NE7SssbzO3I48v+UJbcEbaxUzSwVJCuGAPCpZzRjXKEAKRgvyovC79fqkDP2KZC4QdsRG7slk3tgFrhv+Gm5f7cEjcbI2njZ6kvxCYsflXr/qU64=
Received: from PH8P222CA0005.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:2d7::23)
 by CH3PR10MB7836.namprd10.prod.outlook.com (2603:10b6:610:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 11:26:54 +0000
Received: from CO1PEPF000044F8.namprd21.prod.outlook.com
 (2603:10b6:510:2d7:cafe::5c) by PH8P222CA0005.outlook.office365.com
 (2603:10b6:510:2d7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Tue,
 16 Dec 2025 11:26:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF000044F8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Tue, 16 Dec 2025 11:26:53 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 05:26:49 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 16 Dec
 2025 05:26:48 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 16 Dec 2025 05:26:48 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BGBQmsu4027760;
	Tue, 16 Dec 2025 05:26:48 -0600
From: Nishanth Menon <nm@ti.com>
To: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, Wadim Egorov
	<w.egorov@phytec.de>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<upstream@lists.phytec.de>
Subject: Re: [PATCH] arm64: dts: ti: k3-am62(a)-phycore-som: Mark phy_gmii_sel with bootph-all
Date: Tue, 16 Dec 2025 05:26:47 -0600
Message-ID: <176588438533.55896.15879666642426331708.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251124160548.2273931-1-w.egorov@phytec.de>
References: <20251124160548.2273931-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F8:EE_|CH3PR10MB7836:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f3ba14-2e06-4eb9-3a2f-08de3c960348
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXBpTk5uM1ZVdURBZjZoVFF4dVJaZ2h4S0N4SmlRZnRreEUxMkdWNlhOK1BW?=
 =?utf-8?B?OTVVOUlLM3M0cGdaaVBUaFB0SDA1TCs5aWVDVHZUVUZVRGYzeVhQSThwOVFv?=
 =?utf-8?B?M1BYZE56N1FPVnB1OWhGSzFMb1AyRFArQnFENGlSU3BLcUxlY3dJNVNXN0hu?=
 =?utf-8?B?OUZWNStubXdSWmVaMGc3N3JUYnlBUWgwRVAxc1VYOUUrRnFWU256TkRZVWhh?=
 =?utf-8?B?UHRuRGU5eGdNYVhPL2V5YWowclVKUFlDbGRiZFdjQW9KdHJHRHF4ei9vWWpT?=
 =?utf-8?B?S09DSDRoelpJVTNIR2hFZ3FpemZCTW9DYVN5VGtUbkRRYU5pRVh6ZEZNa0VE?=
 =?utf-8?B?OHhoRDA3a0VZSGk5bWxUWmlLMGJiWWtYQThOUHZrNFFOYnQyeVJFSkx0Tzdi?=
 =?utf-8?B?WGZFdDBhS01GbVgyeEhSSWMzYkpRVU1hb0dUWk5aR3N3MGFGZ1VJeEtJbUdN?=
 =?utf-8?B?R2l4MlFJMWM3NDFNWWlVQkVaWU90Y3V3S1VkNWNXaHhETmFrV3czZUtZcThw?=
 =?utf-8?B?RkZMalMzU3I4cjYrUTlsWUt3SzlURUJ4NnJ5bW5HUnRPT040eW54L1pzbUpk?=
 =?utf-8?B?M1plRnRCWm5EamxXMXRtdTR4Y1huZld0VG9UUG1zNUkwMGZqaW1yNFJJOHNz?=
 =?utf-8?B?a25iN3ZHT2xMN0t6VTVObVZyRnJCQ1FXMm16S043bGUzb1hwR3MzL3pGaCtv?=
 =?utf-8?B?WDl0UFFLSzdTRk93V0psK2F6azNabW9NYk1RQWRoUUl2SWl3Q2MrVFJ0OFUw?=
 =?utf-8?B?Y1BhcGcvSXVJVDZKWm5ocG1QYjRqcTNDRmlUY2ZLdzl5VlFMQmh3MWh5SEIx?=
 =?utf-8?B?c3kxOGw5Lzg2OUsyR2tsd3ZmVG5JYUdXRlJsRzVMdUYyRHNpKzZaUC9XT1hM?=
 =?utf-8?B?TmJjUTlPS0ZpRGZuSUNEbGt1Vnd2MnlyamNJTmMySitEUjZyTFk3ZnZZNG9C?=
 =?utf-8?B?Z3VyOVljWFI2amkzS1hsVGlhT3R6RlJLblg5OG9vazVlL3dkUXc4TnFRV3Vl?=
 =?utf-8?B?Z0t1Ym00dDdjNHRXUHpub1RBNXI2RlZkUi8wNENEbTJIV3lJUmJ1WW9JQTMz?=
 =?utf-8?B?SEpIOFJMamluRUhwSHd0S1N2bWNKTFNGQmJkOXBmZFRZaEhZeGhQUmNYd3NO?=
 =?utf-8?B?bnNNdElZVng3VE9paWxtaGNQUFkxL0M5UGMwdGtUQVdxWjYzbGpKYjZuR0JD?=
 =?utf-8?B?VWl4bzN5UGpUMC9MRlBINlBScUJHYXNwNDJJY3Y2TE5zRGJQb1h2aHAyNjF4?=
 =?utf-8?B?UmRHVGR2RTRwYXVPblFYUmpGSFhFQjV5NnlOSU1STGV3VzZHUGpBc0ZyeGhx?=
 =?utf-8?B?QWo1dmRoaThJMXF4WEJvNjgwMDJmRjMrVXhQTWM1K3FuN2ZMWVlmTlM0bHRr?=
 =?utf-8?B?cnpTb25VbFNIMldOSG9RM1ZNTGEvb3RSZHhGL2sxQklINGVEVGhXbGN2U3My?=
 =?utf-8?B?eVFJSnNLNEMyMld3aldGSmxtbUxreE1KdHZmMFErVFV1eldpZTlkamRTYlRB?=
 =?utf-8?B?Wms0dk8rYjYvOVdNNlZWMnNDamowZVFGbWlZaGxwN0VPWVE4OERVS01JUFZo?=
 =?utf-8?B?YXRpNnJRNVBkLzBqcFNqbTlXNGdqUmVYT3RyREFVVW5SZ1lVb2tSWlhFcXVl?=
 =?utf-8?B?dVJuTjFiVy9RTS95Mk1xTnRnSmhyaWs3d2dLaCsvcGNZT29EUDB6Z1Jkc3Vi?=
 =?utf-8?B?M1RUMVNwK09xcCtka0xOSFZnQjhDM016U1N0VmgrdnF6bCtvY0JHWTMvTmR0?=
 =?utf-8?B?MmVWZGhsSVZTclFBa0F2YjZQclc5NTVtTFkzVis5UnI1eVVuWnpzaFdabW5q?=
 =?utf-8?B?OGErZVlSc2gwRkc3c3lIUWpQTGtRTHFCUElPWEV1bmNKS0tCZkZuaHlOaUFp?=
 =?utf-8?B?cFlzTDMvckRmVlY0d08yalhVSFh4YldUc2I0VEVFSGJOM0g5VmxFT29KRU5M?=
 =?utf-8?B?ekhlNVllOUcxMGpuYnpPK2VhNGxETWVzMU1QdlR5MXpXOUlDbXNsbWU5eXJW?=
 =?utf-8?B?ZFNPQTQ2em1VN3hXM1VLaEovbkI5bVZNZHJTenRmSCtCelJGVzIvR1hrSldO?=
 =?utf-8?B?aWhvUUs5M2tIUnBRa3dySmxDY255UFVWWGNwWnV6ajE5OCtHQ214eGMzMGY4?=
 =?utf-8?Q?wiug=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 11:26:53.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f3ba14-2e06-4eb9-3a2f-08de3c960348
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7836
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_032700_003656_9EFDCD50 
X-CRM114-Status: GOOD (  11.88  )
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

Hi Wadim Egorov,

On Mon, 24 Nov 2025 17:05:48 +0100, Wadim Egorov wrote:
> Add the bootph-all property to the phy_gmii_sel node to ensure it is
> available during all boot phases. This is required when the bootloader
> is getting booted via network.
> 
> 

I have applied the following to branch ti-k3-dts-next on [1] with minor
cosmetic fixups. Thank you!

[1/1] arm64: dts: ti: k3-am62(a)-phycore-som: Mark phy_gmii_sel with bootph-all
      commit: e05f6566bc778bc1215283e667e18692d16b25f5

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


