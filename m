Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3D8D5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL/e8BrkYvgiAq3B/jAItJb+0FOG4ra71Dz0je4BavM=; b=mv4MqUfxNsK9fnsGMlpogdZqok
	imTlZYpeq5ozeVyA4KaYcToN4lXkILNccAMiZAmvbLCqNUgPotzecbarO3wb90YfwbByYMM6PPG0T
	pqZWYOeda4J9CMPcyIvb8vDQx9rlZz70UtkHhzujK6qWh1oSTYZS+lBjC2OICWCPKqYL12A5zYyRJ
	ooB/tmfldLXCxjOsNsu3eytz3oo1hm13CIj15c5PY9ECN58L03RN9T/ubqAeLTahIV1kOjH2sacCa
	ffMPaaAOYi/i3eK1Bz/lXM3kpOM8oeiRFsIrOmmN6I8gHQVT15qWstBuz38UHDvWs4savhS2gIFxQ
	HeDq4IHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8XH-00000003gQg-45av;
	Mon, 15 Dec 2025 13:22:47 +0000
Received: from mail-eastusazlp170120007.outbound.protection.outlook.com ([2a01:111:f403:c101::7] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8XF-00000003gQI-0yHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:22:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYm+nCSsXNbR82VbTdUv4NuIG9pBa8Fvg0ikeVmcci1npYZsX0VzxzXQHOFWlEbQQFG1QZ/H8awz1hO1ON9crOdQ5cXQAdX+kUmQRz+yldMDPLnn1G9fB2COilJoXPuHRz/PNzBjRXXgU2uENMNnx6TyXUh0FanCzxITMDKEopBY+Q142Ve1DUzLKSWXCl/K0iktmB56pe+QItZb/r0Fa8EBYgQO/M/TxGNUkNzWvu4TmzzkMumbKZpWGoKS/nf2fiqJmFhXgz8QAO8G+U+CrUUA+0vsz2cDL/Nns1z/01rSVI1ufwg7IGvdKeMCqSg7XBiZGuAi2whUL/LnXBoGhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wL/e8BrkYvgiAq3B/jAItJb+0FOG4ra71Dz0je4BavM=;
 b=LbsLOz1spNlLQjqIogpxfgAKfL8JD9EuFPwTZSMR0NiHPdC/I4+KI7iVFeSmgmvyFY6tNSAniaRXXaaYelnKjUTM3Kv/ukQqfOkx43081tLe40Q9OCYFbeNqCT6ogJmdmVJ2s8tFkq0oMw6U2qeZ/PFxYvOWuEV4D0Qq/CBEMvuREjo/hWsPkCDXPbj+BC0JmA54/06iGqIikdEaZCslakZaAT53y5FC1J7zD/2NNi9aLOi8/U6LKcVtu3OgdHLRu/RujCV9bADvitm7HzOg/YUi/qs/aA/ia5pciLgoMLQUfxVmDcY2q+p2+NXU0iH0Ib0QdhtUMEASyvnnJuF2Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wL/e8BrkYvgiAq3B/jAItJb+0FOG4ra71Dz0je4BavM=;
 b=Fs2XmQ4Yg6yMXgeGxFzVcU3gOqd06O6qOV2Y/2LQA87e3aDjm9iaf9fHu3vrKWmhJnGtVWKOhbtiEj05V0QaE/C3PQ9b+KR2mfMUB34/SrZpfyIuj3LQmk59/nK9xBV3SSX4kIzCd7KwcIWd3ZNi1czwfxGj62BcnRR8JZbFu/E=
Received: from CH5PR02CA0023.namprd02.prod.outlook.com (2603:10b6:610:1ed::24)
 by PH3PPF5FDE66ECB.namprd10.prod.outlook.com (2603:10b6:518:1::7a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 13:22:25 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::c3) by CH5PR02CA0023.outlook.office365.com
 (2603:10b6:610:1ed::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 13:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 13:22:23 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:22:22 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 07:22:22 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 07:22:22 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BFDMM2Y2480792;
	Mon, 15 Dec 2025 07:22:22 -0600
From: Nishanth Menon <nm@ti.com>
To: <linux-kernel@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>
CC: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] firmware: ti_sci.h: fix all kernel-doc warnings
Date: Mon, 15 Dec 2025 07:22:20 -0600
Message-ID: <176580492714.1684742.10297688269442872704.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20251128055731.812460-1-rdunlap@infradead.org>
References: <20251128055731.812460-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH3PPF5FDE66ECB:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1d7ae3-2914-4461-a146-08de3bdcfba5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW9WM0U5VlpCMjJVdmVHUnJ3bkprYU0zSDVWbTc4cW1jRFhMcFBldFBYSkR2?=
 =?utf-8?B?ZURONGxqTnFJbCtuQkFHZWlQV3FIQWtDZXhnY04wTEVnVlp5bzg4dmwzZWE5?=
 =?utf-8?B?bHVabHBENzc0YjZPM1BFWFJxMFlVU20yMmJFZU5Qb2dYV2J3OGRvaWFTa1hF?=
 =?utf-8?B?NWd1OWZEYVBRbDNUK2FtK0RGZXYrVzZQS2RRZ3JwcFp4dG9TOHo4dlM1UldS?=
 =?utf-8?B?WCtGejBSTFFJaksrR1h3UTBQcUZMQ3Ntb0RoaEpNZFhjNlVLcXVkaWEyVGVa?=
 =?utf-8?B?bzcycnkwV1I3N1c2S1Fjc3kzV2JGTEFUVnREajJjQkYwUkZ1K2NlaldUaTdu?=
 =?utf-8?B?UHJUNkFFT1JkQUM3WHJqc3l6amNuWTZwSTEyOGhmUURTcG0zY0RDamJGZ2c5?=
 =?utf-8?B?dFFGWXpiVXNaMkhoc2RKYldVM0NsNHQrM2NWTzJUWWd3ZUwxVUxUaE5xZU5B?=
 =?utf-8?B?OEJEeUhXWDZQc1ZObVIvUkR2bHIzM1RycnFrK3BLV3BCa1duSXNDeUtBbjVD?=
 =?utf-8?B?bnZ4SHdTdHJjbXcwd1JCQm5vV2hYd29PYXJ2OTREaytJYlUvdm5KUU5GbzBk?=
 =?utf-8?B?d3ErbnBqYytiSWllUWlSNXVCNElJajJHUHovQVl4RkQ2ZFd5MlYxQzIybTZ5?=
 =?utf-8?B?aXNqUEN5aVNORHQ5MXdXaVRUT3k5T3RRZmtuWWppRzFTb09oQXpHMzVjTlh2?=
 =?utf-8?B?anM1Z1ZTTmh1ZUIxQVNxZmMvZmFDWVN4QVlubVpYOVlXZVNlUjF1TllwaTJz?=
 =?utf-8?B?a1RjeFZBUHMzWE44K05mUC9iRDVWTWxnbzBwcU9SZVJKMDh3Z3ZJM2VPZDBO?=
 =?utf-8?B?YnhGcUw3Y0ZVWFhSVTQ2dUZxUXFtWExtUnVLQ1dHMUo2RmtVSzltZExzYy91?=
 =?utf-8?B?OERGMS9yOGV5MGZrV1djMXRwbHBSd0plT052RjNaOGcvOER5eCtjcjVwUHlQ?=
 =?utf-8?B?MHp5WElXQkpCV2xnWXYvZjROUlpOVUxVYS9PZWRJU21Pbkw4YzZHOVNpc1lu?=
 =?utf-8?B?eDUvNkRDN0lkSi93d2FidUIwOUh1OEJTeHZ2eVkxWEVVdnIvaVp3c3hEcVNo?=
 =?utf-8?B?QzNISmFhRGNoQlVra1RSUHBHL0c1UnlRYzhuNEJtSnNFcTJMb3ExUlRuRVBH?=
 =?utf-8?B?aFFNYVltVDluZ1NjcHo4UUdvWUkvaXoxYnp2SEhkTWhnOUxJdlZ4Qmg5SE5U?=
 =?utf-8?B?VmZEV3NvVGVDVjcvREdRQjNWK2JmQU1KTUdYVENJTW5WeSs2NTRIN0JKWDRB?=
 =?utf-8?B?dXlSdm1CSGlvd2UzUVFEbWVWQ2pNTWxCZ1ovaXZ2VmtwYlVYTGErUTN3Szlz?=
 =?utf-8?B?Tm9kaXhFLzI1VFR2WjNFNW5YcDhHQ1FwMmV3Ym1QRUF6dmZwK3NobTh6T3I0?=
 =?utf-8?B?Szh6RmxjMzZxaE9Xa3cyODMrcTluMjJSeTFMekNVaDRHS1g2SnBkenJlU3cz?=
 =?utf-8?B?YmVzazZXSzhSNjFFc0ZzTlBhdHBUQWNFby9LUmRNTWROanpZM29Td21ETEIz?=
 =?utf-8?B?TkhrRHdFQmJZNE5DQm40RGQ0WncybVJvelBqQ0h4bEk2YWo1OTREOEhQNVJC?=
 =?utf-8?B?VXdHQTAwcGJaWFd1UkFrOFNaNjJxd3lXYS9oU3pScGl1TTBKTEh2L0M2MG42?=
 =?utf-8?B?TzlvUlV0eHRlSEVFdjUzK2JqRnVFU3Q3WTdVeWt5Q1NuWEZoNWlqRHNaMnlh?=
 =?utf-8?B?L0F6QklVcnlYTVE4Z0p2a1l2SGE2MTdmM2UzWmJLRWhjbXYxRDBtK1dqb1c4?=
 =?utf-8?B?Z3RHaUNraXZTR2tWbkFFNEtaTU96eW5kcURPbkl6NUR5UjNoclFhSnBJZXV3?=
 =?utf-8?B?eGl4VUI3VGQyMUkxOU1IWGROU2lsYWdKVndQREpqSndwODZiN3JuNitodTBy?=
 =?utf-8?B?SHA1dDJOWXh4ZXJkK29QOG1tdGlSbTN5QkJ4eUFhRFlLSmNRcFJBb3kvQkRC?=
 =?utf-8?B?TjcxU2hUcFd0eVFKbGJvSlA2aHJsMlF6MVllc3htc1BEOWxGV1ZwS2JtSGlW?=
 =?utf-8?B?N3ZIT3l1V0ovd0h6UUpOblFvZHpneXNhdldKcmgzbDdibVhGcC9aZDR2SFc3?=
 =?utf-8?B?ZDJMQ0JlYy9lN0hRZ3JreXJaUnpXRHVTK0RZT2NvdHkwR1Q3bWNDaHdXM3lE?=
 =?utf-8?Q?zG68=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 13:22:23.3248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1d7ae3-2914-4461-a146-08de3bdcfba5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5FDE66ECB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_052245_300206_8193A42C 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Randy Dunlap,

On Thu, 27 Nov 2025 21:57:31 -0800, Randy Dunlap wrote:
> Modify kernel-doc comments in ti_sci.h to eliminate all kernel-doc
> warnings:
> 
> * use correct/matching struct names in kdoc comments
> * use correct struct member names in kdoc comments
> * add a ':' after struct member names where needed
> * change a blank kdoc line to " *"
> * convert 3 structs to kernel-doc comments:
>   struct ti_sci_msg_rm_udmap_tx_ch_cfg_req
>   struct ti_sci_msg_rm_udmap_rx_ch_cfg_req
>   struct ti_sci_msg_rm_udmap_flow_cfg_req
> 
> [...]

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci.h: fix all kernel-doc warnings
      commit: fdce161afe29b40e84853ec821cbd7bbd727bf58

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


