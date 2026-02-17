Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A905BE8384C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 05:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQualhvtE6361UvCQ45Z5JQsNkMieK3ZZD1bRswjmS8=; b=jmGOb3QG12nLV7pIi2nTbXZXRt
	sUPqiL6XRFMPZDTn8pS2Ghy7yStJ6MGUr8NQPgIU2mzrmuZQz2r3ddJ7iYUHqO54f04d4xcaeVMCf
	bZhopEXZmlVh1KzMiBinKuKJFudUncT3oirVdLq1+ujyT5bbo6rjnxLxuTVT1xVWV+ou3ticZN5kd
	6pyKp7FhQrVAV7hORki0wmeIF8Rf+Z8om94uJLWCpJ7ePe0rFHC2zzXRHAM3+XvxUv8TXaxBRoKVr
	py4K8UnYMYE420G/gS4N74Gbpd88eZYHDfDmUBU5nqYzzMBtXw2yhcHdALhkmFDzOmTkhnS9B6wAv
	kJTmNFuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsE3f-00000007fdO-0gBM;
	Tue, 17 Feb 2026 05:55:39 +0000
Received: from mail-westusazon11012023.outbound.protection.outlook.com ([52.101.43.23] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsE3c-00000007fcv-1XGk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 05:55:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3MIi/HR9bfQBTRtpI9bnZEUO1gN88z+U+LJH6VNv3i0Oz48K5+4WIbw70oSskFByr3hY5XN2OAtK5wTdmPjOt1MPTIWr1QRX6eNhKWyBjxbEhcMbQTo3YXtU+ULA9prl7smEmcg9OZOa3nbJc7uw2r6A3no3lKLkGsuETs3iBe5lVvDn3sJvJ3xxIMQ0hBYvc7uzRJLsh7jjgKjxu/HQqm166L3vicL+gwNUAyzPtHKt9cmPGoto0zYI8D+Bqnc5CkF5GLxWUI7uUdl6O9XiAJ+9QP5GnbImIEmxe5KW9qKSonrcG7ih44XOy9t/0R1pk+qOHsOduDssdZBJO1h2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GQualhvtE6361UvCQ45Z5JQsNkMieK3ZZD1bRswjmS8=;
 b=PVgkrUvUNkV76+vYj/eUPBTe8lG62snJu3ropYMzdq3xVaK4cnQEQcJ63IF/5DRIPANzLuZL1MsnhRB/drJquiX3Oq4eZ075dTmesP0QWHGBsjuaeswC31h34t/ozf22D/+NgvP8eQOKCnbQ38IovvH46JsofVCqnTP/wt6XQ2sPRIiIAfGhzCTiY6Y1x0BGm6b2r0QEa5qszlLH4lvxJzsfGg+ysqs8Jy8r/FB729hz36SfIOcmc4zih2tulb9mDCQ80azySUv04foUafm2fG4T8po8YvvxfSfsDi+U5T3mVHDEYSl3im7aw89KUWNQIKIYi4SNEuit5z3UoBRGNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQualhvtE6361UvCQ45Z5JQsNkMieK3ZZD1bRswjmS8=;
 b=JsFdanciAb0l/fNdwJIufA1omJ5Z/C9Kil6GdUwpawtVicL0IIV6ZKLkbcD/TA7V+0n/rtVBu+i+J21hEVCHhacJ1pZNvmvnLihRgHgVqmr2cqP/O0wGnhObrSZjKknAOGx2WEeXUJqMyo621gm9k6Vo5wR9P2t3uYr0MmF37IK71yAZ0mksNjloQD33cTqcfDtd6+UVO8bn9j6VP5oOvBgP8gjRC3cSG79ihE82n5b0ICmX5hyVfqPhgvPphzzbf0ZzCFWApRHYAVLx75JHgCUvlDGeIEk468SWJAyKFAjTFXzd4G88hjJPpGTvrU9tLx5zIlAtKbYsA+94CQPCFg==
Received: from DM6PR08CA0060.namprd08.prod.outlook.com (2603:10b6:5:1e0::34)
 by DM3PR12MB9286.namprd12.prod.outlook.com (2603:10b6:8:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 05:55:26 +0000
Received: from DS3PEPF0000C381.namprd04.prod.outlook.com
 (2603:10b6:5:1e0:cafe::27) by DM6PR08CA0060.outlook.office365.com
 (2603:10b6:5:1e0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 05:55:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF0000C381.mail.protection.outlook.com (10.167.23.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 05:55:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 16 Feb
 2026 21:55:13 -0800
Received: from mmaddireddy-ubuntu.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 16 Feb 2026 21:55:07 -0800
From: Manikanta Maddireddy <mmaddireddy@nvidia.com>
To: Niklas Cassel <cassel@kernel.org>, Vidya Sagar <vidyas@nvidia.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>, Rob Herring <robh@kernel.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
CC: Manikanta Maddireddy <mmaddireddy@nvidia.com>,
	<linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 0/4] PCI: endpoint: Add BAR_DISABLED support to PCI endpoint framework
Date: Tue, 17 Feb 2026 11:24:40 +0530
Message-ID: <20260217-master-v1-0-727e26cdfaf5@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20260217-master-27db95eb02bd
X-Mailer: b4 0.14.3
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C381:EE_|DM3PR12MB9286:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ef24ce-60c5-445d-2082-08de6de925e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUxzOWxZNzl6ZzJiQXNqdTRSZ3RmcWl3VVpVZmFtZk01WnZpM3puTEhjdGV5?=
 =?utf-8?B?ODhyRmt6bXNzYUxMUExOWG9jYWp0MCsrNTgxd1JZSHVRd3daOTR3c0xoSUZU?=
 =?utf-8?B?cTRRZm5QVXlBWEV4dldhT0p0NXo0dTVhNWdxMURmNDFrZVYxLzErajdlS2Nl?=
 =?utf-8?B?N3JTNS80dmdRM2Izak1aMHUzNG5lN2tlUVp3clNzV3pFWlB4SCtOZytJQk9L?=
 =?utf-8?B?K0wrK3lFK3hoKzdqVXU3N3RNZ0hNSExKYWNNOG9ObGhReDMweWZ2TUVaZ3lT?=
 =?utf-8?B?UkpkZUhDOXJmS3RiMTFMQVlIMEMra3kyODhoSFdPN1VzdTExVGJ1U09QbU5u?=
 =?utf-8?B?bCt1VVRoRXF2NWdueG5iem5Za3NlVy9hUW9HaVF6V3RIZ3k0WG5ZQnhabGFn?=
 =?utf-8?B?MUt0bFVycEVpcmkwWFY4c3c3SUcraHFoYkpGRVVYaXZodmtEL09GOENJMXFa?=
 =?utf-8?B?L3ZNdjNXRVlUd0E5eVExTjJHbWY2N00vdC9DaW14RlNORTE5dkpSTEJJM0tW?=
 =?utf-8?B?T3Vsd0NpRTFTT0Z0SzF0T2lKWEVFYnEwOHYxZU5PMUFFOGFBWTdzZzlkbDFG?=
 =?utf-8?B?ZWFCWFE1b0ZNVGZmbElqM043Z2YwbW5MOGt6c2drS1l6RjZ2R3kvMU5ZMDgy?=
 =?utf-8?B?NWt6SWJ0WUR3MGZPc3NZOS91RnVkcFZtRlR2UFR2ZnRsNjludy9WbDhIeEU5?=
 =?utf-8?B?YVVudFhOem1MTlRoNW9iZGszSE1sZWdrVXYxMkw1T1J2ZklQNy80cGhhQm1y?=
 =?utf-8?B?eTlveSsvTE03SE9ncVhiUy9aVkRwVm96ZlNoeHRaRVMrOFVKa3hNMUFNSzJh?=
 =?utf-8?B?MEZMT2pPalB3b0IwRGE4TGZ0dXFFdEN5blNBekNXYmxFQWdNeEIxUVJzcEJX?=
 =?utf-8?B?ek1vZkdwa2U1bzdNVithUUZ4US9rUys2TnhCM3cyM0QwQkZJdkpVd2dra3h3?=
 =?utf-8?B?eFBHZytNdFltMG1tNmpGVWc1bjUwVUxCRHZpRnNVYmVBdldneHRSTW1JdjR0?=
 =?utf-8?B?NDVvVyszclFoK1FmMEZXR0hMUTFSTS8yV1BqTXk4MlMwYkEyUVplNHNRdlZQ?=
 =?utf-8?B?ZUR6bWJLZUZLWkNvaGN0dFVQNzJLOFR2VmoyQzNLb0doK2FpU3hWYmdzaG9x?=
 =?utf-8?B?QVdQNjRGUFhCVVBWWlVwNFRhdmpyM2o3YnIrY3UrR3RNSmxCTHR1ZVY2eUtB?=
 =?utf-8?B?K1c0bG1Md1NqTWhXTkhwa3g4dC95U3NEaXhhZmZxcnlhS1BOVWI1aWVyNHlj?=
 =?utf-8?B?V0V1YmQ2MmZQQ1RWYjBPQnhVU0hyTURXc3BVT0ZyMWsvZGFWMG5VOVZnL3k5?=
 =?utf-8?B?L3ZoVkRlY3ZlN3l3K3JWVTVldTJ2VjZUamtDdEFpQnFCMW1ad1FVdFRGYXJS?=
 =?utf-8?B?cDhLWmEyLzBVeisvS3JSbmkzOHRRTHpyS294VnpOaE5ESGNSTE1uT0dTdGsr?=
 =?utf-8?B?NFQ0MUdIY1p2WmlDUEZKM2Z5NFhWOGVyZWNPcXl6Um5wRzduSGJUSnh2bDlu?=
 =?utf-8?B?dFVhanlCWHJ4SEEyZXJzWjZRdG9QR1NLRjdacWltUmZDU3kzU2ZYdkdDcEFX?=
 =?utf-8?B?dWU5djhBajNUNXR2TjB0ZFdkUDRhTHlORDBHWTNzNnVUcDczZlF6b3B0S0Zk?=
 =?utf-8?B?TTBxKzdXQ1M0Wlpnd0pubDlQS0wyVnFtd0tGUjM2Wmp2SzN1NzZHNHc0eXhG?=
 =?utf-8?B?MUdiZXIvemxqaC8rU3h4NGtqSnRTaFYyc1ZINnlFKzVuZk5Kd3hyUmZ4b3ow?=
 =?utf-8?B?ekhxQXZuT3p2YlNueWVzTWdNemE3ZFZOZWw2dlcxK09hZUk2RE95TGJFYlJy?=
 =?utf-8?B?YS9FSGMvRUc1YjBHVnNKUWQzVVo0QXR6dWJ1SklTNDg0dy91Zk5xTnV6Z293?=
 =?utf-8?B?dTFQL1hjY0JadWp0R2FFRzhheUtJaWlvN1gwalVSK3VCUGM5aXdpaWxjMTJG?=
 =?utf-8?B?eFlQSHRsSHNnSGpzL3RyZWw4NjJjVGc0MW1aaUlBNXB5MENtNEI3UGhobk1T?=
 =?utf-8?B?aERIRkhBK05xSU5Vc2wzWXd6ZGZLYTFpdkNhNXJyNkpyWTZjSDZZTU9VM0dF?=
 =?utf-8?B?UmhMb3ZnYjRYNzkzNFo5ZnJ4TXdtY3hYbTFzOGVMSlUzamJWMmYzTTZlaDhG?=
 =?utf-8?B?SGhHV2xNcDYyNG9kYy81ODFOQnJkbWk1QXNYL2NJYXJUNlRSczZXTzJyQTg0?=
 =?utf-8?B?UExDSUF2eUg5cDlJVW5qQ0hPcGxSaFkzKzA5NTFyRnN2SVNydUEvb1FqZG9N?=
 =?utf-8?B?SUYwOHBTOEZNYVlYbHZaMjFDbjFBPT0=?=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3nD791PGhNSs1srywJYmQcw5LmHRg4F3hPWJLTXM9L2XwkmkbYM7sxHMr0+yMDUF//pSuuhvZt5acO8ymj4tdia5AR4SJLzkGNP50gU0uR6NrYXu0X7ZHSBMNSWQ8Gxx9xgOFk2+bJRZW/NI890Bo7hoyO3/ZR2EKGPwJtlCicvgfqunjxFhkBsKK6aBGXoERME3B/YPNlMaM09zAqQot/1BhpOk6RLM2IqcWvU8Q90WEpIPGgi/Zi52AIMiCIHSRgV/pIwLmYRfSp0cGYZquBiDNzgqzz1hBMASFHyvB44IEIiktN3NeJEMcDSgztWkFisyKck0H/MZL2ZTOAit4nFJrvn0uYjfT2hQ/9sssEaAP/7iV6s2rE5uhty7TSbFIc4Jzywc9RI33RsTXjwxAHLSUzf9Uf6v9NN2VDCBNMmDSIGu5IcYR/KQ1IfgqEBV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 05:55:26.2571
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ef24ce-60c5-445d-2082-08de6de925e8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C381.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9286
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_215536_444471_4F4A3A0C 
X-CRM114-Status: GOOD (  11.24  )
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

When Tegra194 runs in PCIe endpoint mode, BAR1–BAR5 are marked BAR_RESERVED so the
EPF does not allocate backing memory. The host-side pci_endpoint_test driver
still ioremaps all enabled BARs and runs BAR read/write tests on them. Writing to
BAR2 (MSI-X table) or BAR4 (DMA registers) corrupts controller state and breaks
CONSECUTIVE_BAR_TEST. A prior fix reset all BARs in the EPC .init(), so only
BAR0 was visible to the host—tests passed but 64-bit BAR 2 and BAR 4 were no
longer available for real use (e.g. host DMA via BAR4).

This series addresses that by:

1) Adding BAR_DISABLED and clarifying BAR_RESERVED in the PCI endpoint core.
   BAR_RESERVED is used for (a) HW-backed BARs (MSI-X, DMA) that the EPC may
   leave enabled, and (b) the second register of a 64-bit BAR. BAR_DISABLED is
   for unused BARs that the EPC must disable in .init() and the EPF must not
   use. pci_epc_get_next_free_bar() treats both as not free.

2) Updating Tegra194 endpoint to use three 64-bit BARs at indices 0, 2, and 4:
   BAR0+BAR1 for EPF test/data, BAR2+BAR3 for MSI-X table, BAR4+BAR5 for DMA.
   Only BAR0 and BAR1 are reset in .init(); BAR2/BAR3 and BAR4/BAR5 stay
   enabled so the host can use MSI-X and DMA.

3) Adding a BAR skip mask to pci_endpoint_test so endpoints can skip the
   destructive BAR test on HW-backed BARs. Tegra EP test data skips BAR1–BAR5
   (test only BAR0). Adding NVIDIA Tegra194 EP (0x1AD4) and Tegra234 EP (0x229B)
   to the pci_endpoint_test_tbl so the host driver can bind and run tests
   without corrupting MSI-X or DMA registers.

4) Converting unused BAR_RESERVED to BAR_DISABLED in the Uniphier Pro5 endpoint
   (BAR4 and BAR5); BAR1 and BAR3 remain BAR_RESERVED as the high halves of
   64-bit BAR0 and BAR2.

With this, CONSECUTIVE_BAR_TEST and DMA tests pass while Tegra194 keeps 64-bit
BAR 2 (MSI-X) and BAR 4 (DMA) enabled for host use.

pci_endpoint_test results on Tegra234 SoC,

$ ./pci_endpoint_test -f pci_ep_bar -f pci_ep_basic -v memcpy -T COPY_TEST -V dma
TAP version 13
1..13
 Starting 13 tests from 8 test cases.
  RUN           pci_ep_bar.BAR0.BAR_TEST ...
            OK  pci_ep_bar.BAR0.BAR_TEST
ok 1 pci_ep_bar.BAR0.BAR_TEST
  RUN           pci_ep_bar.BAR1.BAR_TEST ...
            OK  pci_ep_bar.BAR1.BAR_TEST
ok 2 pci_ep_bar.BAR1.BAR_TEST
  RUN           pci_ep_bar.BAR2.BAR_TEST ...
            OK  pci_ep_bar.BAR2.BAR_TEST
ok 3 pci_ep_bar.BAR2.BAR_TEST
  RUN           pci_ep_bar.BAR3.BAR_TEST ...
            OK  pci_ep_bar.BAR3.BAR_TEST
ok 4 pci_ep_bar.BAR3.BAR_TEST
  RUN           pci_ep_bar.BAR4.BAR_TEST ...
            OK  pci_ep_bar.BAR4.BAR_TEST
ok 5 pci_ep_bar.BAR4.BAR_TEST
  RUN           pci_ep_bar.BAR5.BAR_TEST ...
            OK  pci_ep_bar.BAR5.BAR_TEST
ok 6 pci_ep_bar.BAR5.BAR_TEST
  RUN           pci_ep_basic.CONSECUTIVE_BAR_TEST ...
            OK  pci_ep_basic.CONSECUTIVE_BAR_TEST
ok 7 pci_ep_basic.CONSECUTIVE_BAR_TEST
  RUN           pci_ep_basic.LEGACY_IRQ_TEST ...
            OK  pci_ep_basic.LEGACY_IRQ_TEST
ok 8 pci_ep_basic.LEGACY_IRQ_TEST
  RUN           pci_ep_basic.MSI_TEST ...
      SKIP      MSI17 is disabled
            OK  pci_ep_basic.MSI_TEST
ok 9 pci_ep_basic.MSI_TEST # SKIP MSI17 is disabled
  RUN           pci_ep_basic.MSIX_TEST ...
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X1
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X2
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X3
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X4
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X5
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X6
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X7
 pci_endpoint_test.c:144:MSIX_TEST:Expected 0 (0) == ret (-5)
 pci_endpoint_test.c:144:MSIX_TEST:Test failed for MSI-X8
      SKIP      MSI-X9 is disabled
            OK  pci_ep_basic.MSIX_TEST
ok 10 pci_ep_basic.MSIX_TEST # SKIP MSI-X9 is disabled
  RUN           pci_ep_data_transfer.memcpy.READ_TEST ...
            OK  pci_ep_data_transfer.memcpy.READ_TEST
ok 11 pci_ep_data_transfer.memcpy.READ_TEST
  RUN           pci_ep_data_transfer.memcpy.WRITE_TEST ...
            OK  pci_ep_data_transfer.memcpy.WRITE_TEST
ok 12 pci_ep_data_transfer.memcpy.WRITE_TEST
  RUN           pci_ep_data_transfer.memcpy.COPY_TEST ...
            OK  pci_ep_data_transfer.memcpy.COPY_TEST
ok 13 pci_ep_data_transfer.memcpy.COPY_TEST
 PASSED: 13 / 13 tests passed.
 2 skipped test(s) detected. Consider enabling relevant config options to improve coverage.
 Totals: pass:11 fail:0 xfail:0 xpass:0 skip:2 error:0

Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
---
Manikanta Maddireddy (4):
      PCI: endpoint: Add BAR_DISABLED and document BAR_RESERVED semantics
      PCI: tegra194: Use 64-bit BAR layout and reset only first BAR in EP mode
      misc: pci_endpoint_test: Add BAR skip mask and NVIDIA Tegra EP device IDs
      PCI: uniphier-ep: Convert unused BAR_RESERVED to BAR_DISABLED for Pro5

 drivers/misc/pci_endpoint_test.c              | 34 ++++++++++++++++++++++++---
 drivers/pci/controller/dwc/pcie-tegra194.c    | 26 +++++++++++---------
 drivers/pci/controller/dwc/pcie-uniphier-ep.c |  8 +++----
 drivers/pci/endpoint/pci-epc-core.c           |  5 ++--
 include/linux/pci-epc.h                       | 13 ++++++++--
 5 files changed, 64 insertions(+), 22 deletions(-)
---
base-commit: 6f54fb70124423ec417b5efe81f8ced5b9891d62
change-id: 20260217-master-27db95eb02bd

Best regards,
-- 
Manikanta Maddireddy <mmaddireddy@nvidia.com>


