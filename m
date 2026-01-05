Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CCC8C79FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UxLR0Z9I/PhJmw4jCJraG1aJPLwl0AccsVAmZNQFB0=; b=kINeS7PSqWkoxhcB58BjAX2BtN
	VuUIZf5lVLnOxErYu4sDUhM/X4y/0BpU+c7dsvXhxi3Um9QHTj63uXs2LPHPI71hpBSrIxfvSXsHG
	fePeQwnYjDtTwuIwFFf3YQKMZqNmlq338PJIFCm7f0T4VfMXtLPaAGjfskdjlMQ7PND6kwanG7ZmF
	w8byOQPx8E3Wi8Dvi9qS8pBcKxBQOoJvGmGrxNVnj4WVrC9h9BUFFlt4ZFqC73k+6IQe1MN6135/+
	NEsrYx22iZQqPB+XqXZ/efDrH9JzIXiv+oN/v5JSZ+odYakVU4PqsJuhEv/0JeL0ejRr4aNH1Ot4m
	aEuVqsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpjQ-0000000BwTs-496N;
	Mon, 05 Jan 2026 18:55:08 +0000
Received: from mail-westus3azon11011043.outbound.protection.outlook.com ([40.107.208.43] helo=PH0PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcpjN-0000000BwTA-0TBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:55:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoUf21CRyFh8r2Rm8KmROEDkR6brmegkI4fhXhINB1OMd+YgA7b9Oi//PvZm6co5zxaAeEdELZvHGJ6lLblekREJfirsHVC2s/WL8DvVUe1m1AbkoBxnVH+aHPBr138qbPLSFukCR+a+erYxYAaSGXQld8EcBsNeeQao3mOWMGxyzqccQ6bo6HZbLpW60nZbfjiU3MaCtNIm28jhgFkvGWjkcfOb8cS688IPOFm9bNLcXycfwlS5Vueugd7SGcnmp7JrBcK6ia4jpKnvv9OMgkm/0LAW7v1lxn7RrLIYdMPc+s41TpVMU6Ed9wwcXslwXNP//kX1Vwl4NgNgkoV21g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/UxLR0Z9I/PhJmw4jCJraG1aJPLwl0AccsVAmZNQFB0=;
 b=YYDhqZ0p+1/dRefL97PoZj1hlL4BhXUNlUgOere9CKuhVKgcUOnyOZRlo/VWUuI5yT9ZKnCGOTjHcyTL+Cy89xTPgihksb96GP1o2kuHj3JOXKcm4ewnAvZVttSAeAOlgZzpB2v88ZE8YUXJ1Fz6lDTY4b6P+Uwu8jzBxW5cVlM0eXkzeegYpGEMZiu5kIykgMk2Y8bN6jZtSY9lnkJavNEp9kGJ6AuH5bAUTBERkAyUgqEO5T7CKATwP6eW5wvZPlm8uHju8Gi3cb62wLi61H2INILpIDCbrs+a5mxyKMSOAB8fqxwyqSyxlRrUmCi6bS14APgjMwxPzFjKm96KGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/UxLR0Z9I/PhJmw4jCJraG1aJPLwl0AccsVAmZNQFB0=;
 b=Gmunugw5XPsB2zIMwN6sbFPvd1DGaWuUtYJOVgWpKREagNh13KCdLiKhCKP8RNj6WDvdgjcDKdyGJRX8JKqmvWOs4Qm2F749XMVlphsWKLZ+0pAICkx42mwo5CYlr6hVcEj17FE+C1pReGppisJlJ/0yRn2C9GkTMWaSBh+2O3U=
Received: from SJ0PR05CA0135.namprd05.prod.outlook.com (2603:10b6:a03:33d::20)
 by MW4PR10MB6509.namprd10.prod.outlook.com (2603:10b6:303:21b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 18:55:01 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:a03:33d:cafe::8d) by SJ0PR05CA0135.outlook.office365.com
 (2603:10b6:a03:33d::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1 via Frontend Transport; Mon, 5
 Jan 2026 18:55:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 18:55:00 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 12:54:57 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 12:54:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 12:54:57 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605Isvih1749564;
	Mon, 5 Jan 2026 12:54:57 -0600
From: Nishanth Menon <nm@ti.com>
To: Santosh Shilimkar <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@oss.qualcomm.com>
CC: Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 1/5] soc: ti: knav_qmss: Remove ENOMEM printks
Date: Mon, 5 Jan 2026 12:54:55 -0600
Message-ID: <176763927032.634424.5157280582639095947.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124729.63964-6-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|MW4PR10MB6509:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fbc127c-819f-4a3f-e5a7-08de4c8beda8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajU3S0JQeWQyUDg0MVYrN0doWHZTNkZWRXhvYkMrcVJzMGlGVW9odmFvMzV1?=
 =?utf-8?B?TUdkYkEzUmdJRWRXcTBRZHR3VkdkU3oyS2VJRHVpYnNVQnMyNWRleTdnRWhn?=
 =?utf-8?B?ajJBN3RFUGhFWG82WDFDN1Y1anBTRXdJQmJscFphQWV4OTI4R2Yza0VYd1I2?=
 =?utf-8?B?SjlwWWpzRVR2eUtsdmhMS2RYUGlnUkxodFVJVmt1MVlmNy92aDV2TjNGS2Nv?=
 =?utf-8?B?eGcvdU03K1U1dEVpR0IzbUQvUzZUWEFvS2lDQy9zbXR5blBFTlllM1ZJbkp1?=
 =?utf-8?B?RlZoTHdhU1RZY0lTZlR0cUd5dmQwNHVxVk5ySUlkQ3NxZVdneHMrMmp1UmxI?=
 =?utf-8?B?ekRKaGsyZzQ3MkxnQnlJa3FWQVRMMjVtcWp2VXdEeThyUXpIVUxjMzdIZWhL?=
 =?utf-8?B?WHU2YkE3WnZmME5qaU5BSGluMXBUM0NHOHBvVUV4UlduaXMxbCtQdU54ZWEz?=
 =?utf-8?B?Q0dIU0RmUDdmdUp3NmlOM1Bya043aU8ydmhFQXorRjBDYUpFR1dHaTlsZXNj?=
 =?utf-8?B?YUFBbE9XRTF3c1RnK1BYeWo1TUhhU09yczZSRzVwanQ5eGpQZWZNdWhSV2xD?=
 =?utf-8?B?aitscjJyakwxVTlRL1plK1hqLzY2OWVlTmxjbjE0d282RGF1Mm5BYmMrTk92?=
 =?utf-8?B?Q3pRQzVYVmFqZGlrYXZKcDdLT2ZZK2Zic3M3T1hycE41K2RqQURWTTVMS0RL?=
 =?utf-8?B?QlJiUVNldU5HYjRDTURwZEwwenZxNXdCdlJac0JuTzNtVEFCNUVrRXByYldr?=
 =?utf-8?B?cmJqcm12N2VrN1JnMk9LdjRKblNiNjRmOCtjWnY2eTNrbklZVmw3R1Mzek9U?=
 =?utf-8?B?cFhiUmpVQm1xN0RWdURnOGVPOThxcXE1QTF2RkFRK3loNjBENC9OeFUwamhi?=
 =?utf-8?B?dU9zRnpTdzZrZGZTQW5lMTFzYzdJMURjMGxCRXgvZUNXY1dMQ0l2YVhpVW1j?=
 =?utf-8?B?K1ROdSsxM09TTWE0QWkyYmFKMlNHUTV6WEtjWWNuK2hrSEJLRnNBYWJubXVj?=
 =?utf-8?B?OGh6anRKTllheDlUMHlqcWh0b0JvNE1KRUQxbStma1dLZFk1VkdVZmM0OGdE?=
 =?utf-8?B?L0luUUtNeXRaZWZkNHRIYnM2TlpVTzlzeEpHNGhyS3B5S1JSaWE3dlR3U3pM?=
 =?utf-8?B?TmZXbEthNXBRNUMrY2RBazEzN0V1bUFxM01zSzRpMzRWWDR4T0pmdEZnbm83?=
 =?utf-8?B?emV4S0lSTDB3S1YvMWtQTVlsY3F6RUxOM01mYzRSUmNVbWRDZjdRVU9wekVK?=
 =?utf-8?B?bWlXbGtmUVlRaTlNNDY0VmhnNVVCejRIbGc0eDNZWEMrUFdQWWVwRnc1RnNT?=
 =?utf-8?B?TzZCNmlpZXFmODZCSHo4RUkzOGdYaHIxdDVSa3BxOHQzVXd0ZWZQQ2ZmL1Bz?=
 =?utf-8?B?a3ZJbDBoY01tSTUwS3ViN0IrSU1JdG81T1dibkIwUkdjY0ttY0RKYzdQSUpU?=
 =?utf-8?B?MVBwTm1kUzJtaEFSZ3RvR25YdWZUVDdONXVKSnVWNmpPcEhwWnM3Q0JTbkgv?=
 =?utf-8?B?YkFFOVFoZ3hLbUZoTUhmeEpiTlE1cHpWcE9UaDJxcnYybko0ZmFZU3F4eUZQ?=
 =?utf-8?B?THBkdW9XMHpXajVIbGJ3Nm1vOW5pZ1VoOEV1c3RRb0IxNjJ6WFY1RGxodXdQ?=
 =?utf-8?B?bzhkTUdHa3JJa1FPNWVDMjNOOHpKMHBBRU5xMTNIdUhJSXltVFJpdklsaEYz?=
 =?utf-8?B?dFUvU2lmT25OS1FvTFJWQ2NZWVI0bi9tZ3hHb2Rhd2VFQXd3OUV1aklpS0kz?=
 =?utf-8?B?WjVoQW13dXZ3REtrMjhyZzBiYnNoc1Zadm5WZEtrRkJPdFNSTEdlU29lUjJa?=
 =?utf-8?B?K0ZId1orWmtZTlhHdllVaHZ1UCtQejcweURtTmQxTVZVeHd0Q2VLWVBnWE9o?=
 =?utf-8?B?VVdMRUkramlUVkY4YTBRUmRKSS9jeTJyNHlkbzZwdTF1eTZEVzQ3QU5PZnNG?=
 =?utf-8?B?VmQ4N2tJcWh0OFpiVjNJdHlZQTZjT0FuT04vTE1xRzJWQnZCYW5DT01IeWxQ?=
 =?utf-8?B?OEs0dXI2akNMQVBPdXorNGV5L3FOeTRQSlB0V0JlaUxNdU5iazBuZ3A0RjQx?=
 =?utf-8?B?b1VhdGNzQy9qZXk0RzBtTks3Zk9Tc0p5eUQ0WXNJWmhDOERNcjFWek9lSzVw?=
 =?utf-8?Q?h2lc=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 18:55:00.3377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fbc127c-819f-4a3f-e5a7-08de4c8beda8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6509
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_105505_367685_D2F93C1F 
X-CRM114-Status: GOOD (  11.55  )
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

Hi Krzysztof Kozlowski,

On Fri, 02 Jan 2026 13:47:30 +0100, Krzysztof Kozlowski wrote:
> Printing messages on ENOMEM errors is redundant and discouraged, because
> core already prints detailed report.  Simplify the code by dropping
> such dev_err().
> 
> 

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/5] soc: ti: knav_qmss: Remove ENOMEM printks
      commit: 168d2fb7805510aba3b0871414ec93c2364f9e23
[2/5] soc: ti: knav_dma: Remove ENOMEM printks
      commit: c076d74383f1ce2c8db4c83c40c714c8751d5d01
[3/5] soc: ti: knav_dma: Simplify error messages in probe
      commit: 9a97b2154ef51dd079bbaf247289e6d82210c03b
[4/5] soc: ti: knav: Simplify with scoped for each OF child loop
      commit: 6b222f28999c481a6531c7b5fbbf95f877875d23
[5/5] soc: ti: knav_dma: Simplify with scoped for each OF child loop
      commit: 126f61528d34658d80ec827f981c540c1230fdc4

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


