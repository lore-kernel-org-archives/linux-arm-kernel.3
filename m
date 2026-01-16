Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC9FD47CC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 10:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GymNNVAqX2Ws33VJDzyHzYTATEMD0LqRSJQ7iuX45fA=; b=1PqVODhSY0PfEC
	4WB1XQTwyvT0klKv85Uy1FRjuM5pq+qll2vFKniBbxfXx0soPFDjGgmCSgbstpCOrccZ7A18dMQ53
	c5xTyDY2vekry/0K+JKaEp6AsjKCxSKzBHTUeSoermSvT+qTqKYAMOf0xZn9dcNOAu7oI4zHKoR6P
	zmNTYXbSGVuZT9j+SIxl5vAR4XF2fuBSC8Tkr9+ra2nS2lCHtAJ/C5Hgkt0szYfhQp/0I7iCcrGdz
	4jlCO+BIbkSuBWA23nDyyWeJjnexK1eMAMFychKUWjuBLq6D4VMctxIETlZZokbMyBDz3I+viV3la
	4HLk6Yt0iCNgaMtkMIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggsJ-0000000DvHd-3b4T;
	Fri, 16 Jan 2026 10:16:15 +0000
Received: from mail-southcentralusazon11012070.outbound.protection.outlook.com ([40.93.195.70] helo=SN4PR2101CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggsF-0000000DvFM-19B0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 10:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SiGhrsp0+PjkU6VyGmnujqBTuab2YaYCdV40gS1N+XCwjfWocjF3KTM3KPsAFBFTOQ5LyXOCv5ZziPN5K7mEFF4K6uuHZKXBxKPqHYJqXSylq5bdgi0F1gVvqPBO0DZ4NGlqy0EpqhnsRZAW25IiwyCjm5yFj1C+HhYHFtkg29V1vI2uyWWpahPZkMb3nKp2OAuQB9UKqWPltsl/iMf0lmukGSvkRLHHY6mtJt5XXVewJdqiB5TZltRBQav1OD22bNaZc1CMcqcSdJzDXWeRJb2DgHb/Rwn8BqXxuACKQ6E51Tal+/rirEqLtD9EzAKtr9TgSjNkeTDtmn5fyWwqZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GymNNVAqX2Ws33VJDzyHzYTATEMD0LqRSJQ7iuX45fA=;
 b=HCsGnPzS/vqu15GqCwEm1yDpG29oYu0z3mq9a6/7tNW0PGuYizJl+CDz2mmBGf+Dqxnn61aRJCeqfpcLg7WvyyTnQN63hWfW7+CBftDeiU6fegZHZDonnYs+y4KYGbYPGtmKwrQ4JZCEbr5C5O7DGw1+b0PE1XH40GASCCeaIUZ7dkK5jeBkhKj9AP+zRbyl1bx3bzBEo9pq5b2PdPzr4sDJn75B3PY12pqp1yAjaSZ2PTo1Ua2TGc5upPg9GHGTw05uQX4jCHTHW+wKta03v8ufDMva97YBh5X3qVqsTpoPM3TcLgvqW1sHpajH+FGZccvd1ylyKcZEMhpdbrIaDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GymNNVAqX2Ws33VJDzyHzYTATEMD0LqRSJQ7iuX45fA=;
 b=gb5+xs5ioycDVPeiom68rFtGv4jJnN/2Eg2+zFWwd3gj9kVJBk9juj2neXRZYXN5e/Qq3wrFvF/1R+wgKkcsDYCLlD9LWMbzU9q/UaxaFbY5EZLpw8f7TkgohpsNPJIiB4uAn5AnoQnycUpO83IeXnf4snGxA3Onx7754gE7Cek=
Received: from IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::11)
 by DM4PR10MB6232.namprd10.prod.outlook.com (2603:10b6:8:8f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Fri, 16 Jan
 2026 10:16:04 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::78) by IA1P220CA0022.outlook.office365.com
 (2603:10b6:208:464::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.8 via Frontend Transport; Fri,
 16 Jan 2026 10:16:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Fri, 16 Jan 2026 10:16:02 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:16:00 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 16 Jan
 2026 04:15:59 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 16 Jan 2026 04:15:59 -0600
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60GAFwkT2986188;
	Fri, 16 Jan 2026 04:15:59 -0600
From: Anshul Dalal <anshuld@ti.com>
Subject: [PATCH v9 0/2] dt-bindings: arm: keystone: ti,sci: add entries for
 boot mboxes
Date: Fri, 16 Jan 2026 15:45:49 +0530
Message-ID: <20260116-k3_syscon_add_boot_mailboxes-v9-0-6358cd1f2b1f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANUPamkC/5XSyW7DIBAG4FeJOJfKM+w59T2qygIDDWpjKmNZi
 SK/e3HUxb7U6vHn8DHbjZQwpFDI8XAjQ5hSSbmvwTwcSHey/WugyddMsEEB0Aj6xtpyLV3uW+t
 963Ie27NN7y5fQqGaC3TeG20kkkp8DCGmy51/fqn5lMqYh+v9twmW1y8Y4G94AgpUoLGoIkKj5
 NOYHrt8Jos64VrCHQlpQ21wHQSuHDOwkdh/JFZrkhKEsByZ9N1G4r8S7o1t4lXSAUFGp7Xh25r
 ESoI9SSxzsjoGIVX0bCvJlYR73ckqOcOstyaC52ojqW9JNnUbO5KqkjfKGs5iYwVuJL2SgO1Ie
 pE4M6LemXLC/0jzPH8C3l0xscsCAAA=
X-Change-ID: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh
 Shilimkar" <ssantosh@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Andrew
 Davis" <afd@ti.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
	"Dhruva Gole" <d-gole@ti.com>, Manorit Chawdhry <m-chawdhry@ti.com>, Anshul
 Dalal <anshuld@ti.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768558558; l=2976;
 i=anshuld@ti.com; s=20251022; h=from:subject:message-id;
 bh=Uixck3pGuJhl0um7V6R5lF3+tNuaQStFqAMqRi34lQQ=;
 b=i4zf9o+KsRvXuMyk6Twh2ZA44qRmlNlZbgJTEipVicJ79lS2+R5WJhWl9tWBPJ1F+REdPXYGW
 lzuV/+AGZL2BGD57mQqdHc5bnTQ1z1jJHJSL5XJVHTbXnBUmcZfxhBO
X-Developer-Key: i=anshuld@ti.com; a=ed25519;
 pk=Kv8FlQElcrR6efyEHmjtE83y8e0HKvqPyvVY+PJ4UFw=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|DM4PR10MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c79e0b-d380-4db2-4752-08de54e840c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|36860700013|34020700016|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clJQbVNlOVRRTW5lNk9BZUViQ25BcXhHSUVkZzA0WUdzRFp1aVdMajQzNDVC?=
 =?utf-8?B?VEZmb3krcHZHRVhxU01heFV3am91Y0FFY29rLzlZV2IzOUUvZkpLRC9NdnMw?=
 =?utf-8?B?U1dINWN1ZmhLN1FrN3F4dTVvY2JEOVhlODhxYTFaV25ka2pTT1VjUW5wTWxL?=
 =?utf-8?B?VWhacVRWQmJ1Q1h6MEI0UzVFSVQ2YVNmZ3pITkxod2RBWEwzRFQwWktlbnNH?=
 =?utf-8?B?RjBMVCthOWN4YlVramNZMG91OTJuNXdMWUFLZHlpcE5ja0ZRMjVRYWZVTlgv?=
 =?utf-8?B?S3QySUZYRU56RWFBZ0hTVjNPTmhsb2hQNVNxU0ZVQll3V3o5Qi91VWhUTVdH?=
 =?utf-8?B?aGY4K3BYcnNZaWhGcmxNK2dFNC9FWW9JekRHcGN0OFBQeWpuZWY0UDN5V2Z6?=
 =?utf-8?B?b0YyelJQQ0RDaHEzd3NtNWU5QisrRzlleG03VGVzR3g2dWpuSjl2eEdrNkdm?=
 =?utf-8?B?amVMRnJEbjZNOFhhL1pHVHBGZGFOUk8zemUzU0VnUEkyQXZjNk9WTFMwd3du?=
 =?utf-8?B?bTdRNXQ4NVdZMGpUYTFqWEFtQ3pMLzJJa0J6UDRBeTkzanFmZldicGx6QTRV?=
 =?utf-8?B?Z0d5SFdQS04xMXR2RUthUTcyTkdNQU1zR2lqRzQwMHhJNUp2SG5YbnVYUC94?=
 =?utf-8?B?YXhjc21rZTJ1bVVUa21qMnBmb0huRmlFM3hyNGVra08yUzVxelJOd24zYjJO?=
 =?utf-8?B?OWhIQzVLTkVMdkJzZjFvM0lzYjcyRjFXMUF4KzNhb0FWL0FCZFFkY1FxR1NR?=
 =?utf-8?B?UnFWeStoaThNVDlMTzlOUytsWXV1YkFNcE4rbG5TYTFSaEFDUE9YaXR3MTl2?=
 =?utf-8?B?YlJjRGxPMzREY25JV3RPaC9ITGRSMHpIRWcvcVhpN1NxbG92K3cwbzJHRU9D?=
 =?utf-8?B?bmhkRE1RLytqbG1OWW1PZlVJQWFYU3BacGxkVTlhS2s2VytPWGFLcU5IZHdk?=
 =?utf-8?B?eDFBUjJ4R01SeW1EaC83emRpRHJydjV1THptTGhPdEt0c2hYS25RVWZrWXdz?=
 =?utf-8?B?UDkxZ3dTRGFQSGxvM1g2bFFTVTVrNnUxQUlPcHlhNkdQMEhsaERWWGNHS3Fh?=
 =?utf-8?B?bFI5TzBudHR0b3FnRFp3RjFZTWd2OW1OSGluR01iZE9XdEEvY0hhSnQ4RE91?=
 =?utf-8?B?dmF6bjJIemFndVEwWnQwenRPZHVZeTJsZDY2NTdvd1hSVEF3TEVzM0dmSzNK?=
 =?utf-8?B?eHR2WmgrTWZUN3NWS0d2a0xJMHZQK1B3T0hhSDVJTzY4eHB0bmFoNjlNenhM?=
 =?utf-8?B?dkVVbWJwcGkrcndqUXlVdVhxeGVQQTR5MVpMb01saldjZXp1aWR6S2V4RTVN?=
 =?utf-8?B?OWphMGVDV3ZuRGg1eGZDUWZ5eVVBakwvRmw5dGZISmYzMkMrY0pNQUhRKzJ3?=
 =?utf-8?B?QUhOam9NekNwdFVkZ20xNVdjTXNzR2xTSGIzMXBQeEs4OGdQR2xGRnRjZ2tK?=
 =?utf-8?B?ZmdnWVNEYXhRSXplREVNMVNxQjY5L29ManZMMjZDRlk4R2NBU1k1NnJTUWoy?=
 =?utf-8?B?Skl4LyttaThKM1FXSjAwQm0rKzR3Z0RoY21GR0dCTVBDaWFscEdlMjU3Z1dG?=
 =?utf-8?B?eWF5em1CaFZoKzRYSGpJQUNIMis3elhFMDdBSnpaNFc3aFpzbkI5eHp0SDNZ?=
 =?utf-8?B?bmlRbU02WWsxMTc3OG1oTWNBK2hTQy9xNnZUbkhpMzJ6NlQ1OEk2YW13VlBL?=
 =?utf-8?B?eGxHaVdQRHJqS0EvQVVYMnJOQmhPcU5aTlViOHZGRTdnVHlzSWNROVBRZEFI?=
 =?utf-8?B?SFJId09HalZaWVFhTU82YkJtc2hOUjhVaEVrUndOSzZ0dnNoN1BLN0NDYnJC?=
 =?utf-8?B?LzVROG5SUXNYZy9MRERSWnZVT2ZqYWE2UlpDWlJVYmxDemFxZG5VY0VVekIr?=
 =?utf-8?B?dUpZNXFnUzVDTVppQkNjcEx4aG51TUFscXZJaFZCOHdzTGtYcnlXckM0SXE0?=
 =?utf-8?B?RWlxbDgvb0N6VFA4d3QyWkIvbmhTbnRXTDlMNXJrVWNpYjY2QmkwV1NHREJW?=
 =?utf-8?B?U0o4SUxqUnZjTDJJWkk0VlozVTlCODBsK0cxcC9mK09xcnBJNVYzaWgxVjIv?=
 =?utf-8?B?TXh6THRoanl2L3FRb1ZNSEMwNnRlK1hRMFVGV09wM0hZbVY5cFRuZUJwcGt2?=
 =?utf-8?B?blZQWjM0R3ZHcWV3YWhvVEhqQndsU2hGNEJhMXFDbHY0eFFCSHlLZDh6Qm4y?=
 =?utf-8?B?bitwejZiYnVmQXRTdkpTaXFLM0ErcUpkZWZ3dmdMMlNMTStkc3RqWFVZQ3Ux?=
 =?utf-8?B?NGNpZUNDSkpxMDhHOENQV2V1ZmFBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(34020700016)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 10:16:02.7907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c79e0b-d380-4db2-4752-08de54e840c6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6232
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_021611_341596_6798B767 
X-CRM114-Status: GOOD (  10.30  )
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

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v9:
- Pick up R-by tag from Rob Herring
- Add DTS changes as in [1/2] patch
- Link to v8: https://lore.kernel.org/r/20260113-k3_syscon_add_boot_mailboxes-v8-1-d43954527b5d@ti.com

Changes in v8:
- Refactored the patch to a simplified diff
- Link to v7: https://lore.kernel.org/r/20260107-k3_syscon_add_boot_mailboxes-v7-1-d97a943f0a52@ti.com

Changes in v7:
- Removed ti,am642-sci compatible
- Keep examples unchanged
- Modify ti,am654-sci ordering to ensure compliance with SoCs without a notify channel
- Link to v6: https://lore.kernel.org/r/20251222-k3_syscon_add_boot_mailboxes-v6-1-b93ada9f1d47@ti.com

Changes in v6:
- Added ti,am642-sci compatible to represent SoCs without a "notify" channel
- Added new examples instead of editing existing ones
- Link to v5: https://lore.kernel.org/r/20251215-k3_syscon_add_boot_mailboxes-v5-1-5a8fe567fd31@ti.com

Changes in v5:
- Added commit description for the optional mailboxes
- Link to v4: https://lore.kernel.org/r/20251205-k3_syscon_add_boot_mailboxes-v4-1-8e216fb88941@ti.com

Changes in v4:
- Make new boot_* mboxes conditional on ti,am654-sci compatible
- Link to v3: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v3-1-66155a4236dc@ti.com

Changes in v3:
- Drop [1/2] of the last patch series
- Update existing example with boot_* mailboxes instead of adding a new one
- Link to v2: https://lore.kernel.org/r/20251112-k3_syscon_add_boot_mailboxes-v2-0-aebc1e47b391@ti.com

Changes in v2:
- Remove maxItems entry
- Remove RFC tag from patch (added by mistake in v1)
- Document the new mailboxes in mboxes instead of mbox-names
- Provide example with all the mailboxes set
- Update commit title to have "ti,sci"
- Split into two patches
- Link to v1: https://lore.kernel.org/r/20251111-k3_syscon_add_boot_mailboxes-v1-1-529a27f21076@ti.com

---
Anshul Dalal (2):
      dt-bindings: arm: keystone: add boot_* mboxes to ti,sci
      arm64: dts: ti: update compatible to ti,am654-sci

 .../devicetree/bindings/arm/keystone/ti,sci.yaml   | 24 ++++++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi           |  9 +++++---
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi          |  9 +++++---
 .../boot/dts/ti/k3-am62p-j722s-common-main.dtsi    |  8 +++++---
 arch/arm64/boot/dts/ti/k3-am64-main.dtsi           |  8 +++++---
 arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi         |  6 ++++--
 arch/arm64/boot/dts/ti/k3-j7200-mcu-wakeup.dtsi    |  8 +++++---
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi    |  9 ++++----
 arch/arm64/boot/dts/ti/k3-j721s2-mcu-wakeup.dtsi   |  9 +++++---
 .../dts/ti/k3-j784s4-j742s2-mcu-wakeup-common.dtsi |  9 +++++---
 10 files changed, 72 insertions(+), 27 deletions(-)
---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20251105-k3_syscon_add_boot_mailboxes-8452bdd98962

Best regards,
-- 
Anshul Dalal <anshuld@ti.com>


