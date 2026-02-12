Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC21EE36B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kFQ2DST7yO5dNCHNEPPqS1ytyt1N7u9tH3sXmKZb4l0=; b=ns3hMl1Gq+Xkaj0Q15aoRNypTL
	0Nq7Ozqw56KC3Uv1fuF50mBUNbVo/42tw2ggG1/2COMht79IaUgBhWwIehO8sTLUisg4FIBtEk61P
	s7Ccquzd69iH1fd8X+hQwf4kx/8Z2QzhnPKCQeksDRptd0avw0RdadnWnR7slau93jq0t+IccuyHU
	q0FwsdEYOzojXJl6mJ1fsP2jWAGJzQFDErK0bYcPGRHNN9LMRi6eOR/dP+e76VYX293WC+uP9sl/U
	maWob67tUZmI6FbWZhHD87Ts3IWEwSSBo9eJjjrmh0nLJGmB7FEW4LmMJT73+a1gwDbWF36pybNV+
	2ZcQrMvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTe-00000002RYf-01oZ;
	Thu, 12 Feb 2026 17:27:42 +0000
Received: from mail-northcentralusazon11010068.outbound.protection.outlook.com ([52.101.193.68] helo=CH1PR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTZ-00000002RVl-19J0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY3P/0OE13Nodg3kNZWXTkLDc8Clq1+wTFRBKOQ3C84zPlbgOBwreWm83SvO3GfBF1ugsNFtNTb2nWGHu/QxbRW3shcQbY+ptadlcxcpv8rMnqyfLoDcBdAWYAPqVs2+u2bttrc0ZBfKuVOgHRj7mNZliR+WMLqUx5tpG9HgVid7TDK8hln1NA56SzPjbF4dHCX2UXI4+Bvqb4kpGTHzTkfd6eYtTW7MFZwH6CVmSoaVHL0zO79NDKH6g82gISn8S4mXDmTtTodubWAG1H8vGONYH2kRkXDIYxRwWOVXvoLuA095Q6RHW4wWNZ7rPav749lw4MZ/7L/LeICxYZQ3mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFQ2DST7yO5dNCHNEPPqS1ytyt1N7u9tH3sXmKZb4l0=;
 b=i6aafIany68YiH4nVQe4YS+esbBep5l7DvZ7anLU2O7XolBLZGNLtTTnQGbEZUz3Y8x3CIFeHxU6thwdaYQ+g1Tjs4g24unyWSFhYjnjrfvDiQLEyYrwuNNlGcQSh2aM2zspxIPtHvNVI6kdxD/a2hFs4q3ycgSZpSYk8XYUvQ60a2kq6KQUb0DtpFrLQYg4M2Hrio9LbESCCi/R1dreV/Urql/YcMBlAaVy6nRyEFJegasbzGXYBPb8Czkr2KhrnDcPcRhQfmVmBqX6yvv6G+S0jLpG9lHNyRXIokXvv1XRwIiEjBXka4ZfPC20qxyPBFk89v6jSqc+7rE6+lwJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFQ2DST7yO5dNCHNEPPqS1ytyt1N7u9tH3sXmKZb4l0=;
 b=AuJ7PBZ7A3AS36PUtCRx4n5QSgi0r6m9i/QwqtklBsuQg2SsX5+PkqQk8V5+wfypRUR6JlU0qnYD4y66BhlHzGtBsoxWPVp6I6ADMUKDJ3+h+4sPmhjk/60xkB9H8cPlIE0SPu77ouMsoPh52T5qf/ryT2axFtw9C2o9bkRvuag=
Received: from SA0PR11CA0103.namprd11.prod.outlook.com (2603:10b6:806:d1::18)
 by DS0PR10MB7954.namprd10.prod.outlook.com (2603:10b6:8:192::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Thu, 12 Feb
 2026 17:27:32 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:d1:cafe::e2) by SA0PR11CA0103.outlook.office365.com
 (2603:10b6:806:d1::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 17:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 17:27:31 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:29 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 11:27:28 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CHRSI43458792;
	Thu, 12 Feb 2026 11:27:28 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 11:27:22 -0600
Subject: [PATCH v5 3/5] arm64: dts: ti: k3-am62p5-sk: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-b4-uart-daisy-chain-dts-v5-3-26c7f534e567@ti.com>
References: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
In-Reply-To: <20260212-b4-uart-daisy-chain-dts-v5-0-26c7f534e567@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: <k-willis@ti.com>, <vishalm@ti.com>, <sebin.francis@ti.com>,
	<khilman@baylibre.com>, <d-gole@ti.com>, <msp@baylibre.com>, <a-kaur@ti.com>,
	<s-kochidanadu@ti.com>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770917248; l=1953;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=EtV0LzpZ6/EDw+J01y0jRuNIUnfnr5PioAePZGqaGDw=;
 b=ttULQo91ZmZcHUvU5HV4TsTt7Bv0TifzqLTtHsmwJ2GDHDqnpSuMCpsiq9QbvAxHD0fXqfu2t
 lCVOTTTqNe9C1+WqObTTVXKko0w2gdf+EPprmmmEhoAjmpC4g560gfa
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|DS0PR10MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: a066752a-50d1-48db-46fc-08de6a5c00bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c29QQVg4LzhvUndsMHAzSS9EZTluQ3hvOGs5OUd0a1hPK1lHbmpSN04wY2tj?=
 =?utf-8?B?TDBoSzE4NGhmTFVwS3Z2M01ncXRhOGFranljczgwRDdHbVYyRVRpTEpmVE1r?=
 =?utf-8?B?b05Pa2Vjc2JHL2d4bDQ4MUdRUlY0YlhjQk5paThnNm5kMWw2bGFTcUQ5UmlE?=
 =?utf-8?B?QzdMNXhjTzBKUHVvUmlteWlIeWFDY3gzSEpVbU15OFA2bTEzbWwxTUcrQUox?=
 =?utf-8?B?elBhNEZpRCtGMVNvdjBWK1JjaVMwbjhjYy9VUk1xQ0V4RU1FY0lsTXRzalFX?=
 =?utf-8?B?Umh1RVFhdXRkUkxLWUU1Skp6ejNTb3E5MmR2ZUpFUTZZZ29ZTnhVb3IrQmJP?=
 =?utf-8?B?aEQrSzZ3UFhqcnJFcktGV2NmMm1xd1FDRjBOelM1S2wyUnJyUm4xZkM3L1hn?=
 =?utf-8?B?Zno2TzNKa0NTZi9SbEhHMlNRZnZtK1cyd1Y1K1NIUStjc0M4YkIzK2Y2YnFH?=
 =?utf-8?B?QUQ4Z0dMMGR4S1dRZUxKVHNzMW9UVmJOeDMzZFE1TkJWRVErbDNZTm1VOFdi?=
 =?utf-8?B?NUMzendJQzdINysxYXhuSCtaR252ZUVoMlVXT1VGTVBHbjdwdkdZYVlwQ2Fi?=
 =?utf-8?B?eG9zS1J1ZjVzMkhLVTVkMkNkVmlxSEs0R0lRYzRITW1IdXJ5WXJYSk93L2NX?=
 =?utf-8?B?aUUyTWJtUDBFRGZ4SThjQWJlY1RBZUgxQmVscWZnL1hZdXhMNFZnYWJOdmxu?=
 =?utf-8?B?cHV5bXBCSDJyLzFHWjMrZFdmS241bXZ0bXZEV3ZGMG50NEZaS2J4VmhGc3Vz?=
 =?utf-8?B?eTJ4RVJHY0hlUnNlcEpVZUtQc3RxUm5ITTVUWlh4VE95LzFSZU42c01yMzdn?=
 =?utf-8?B?QUt2aGRRcnRlSlhldmRZZUw0YzBHL1FZUE9YWG1lRlYraGdzS3lEMzBkMjlG?=
 =?utf-8?B?ZGN3cEg5aWt2NjE5anZmMEJiY2x2bFpNWXhZNm12QjhRZUpjamM2YnR1WUxO?=
 =?utf-8?B?enhRYlB4WERjTUNRSk5qT2pwMVp6L0p0STlreW8wKzJtWnNxVEdYcVFLVnlR?=
 =?utf-8?B?VjhsSmVKZGlBQ2ViYWJqNkEyeVdiOEtBWDBMNDQxZk1POEVSUXh6RDh4bGhL?=
 =?utf-8?B?VUhzOUxjUHJnYWYyZyswTVhNU3BpVDVJUVRoOXUyZFh3Vm1uWXlTMjdFdnJk?=
 =?utf-8?B?V3cxaFFlMGs1RmczbjA2WFB4N0RLWGg0M3VCVkNLZmkzV1MyVTA3YmNiNG1o?=
 =?utf-8?B?cVF2WFQ5L294MXExR1MzbFYzT1RCK1NId3lSa2xLbGF5YTltTk1KeHd5TUdu?=
 =?utf-8?B?NWFkQldaQXVBeUxuWmVxZG16Z2tPbnNLc0l0allDdUo4bzUrQjBTbzFmWG1Z?=
 =?utf-8?B?ZG0zdUo0OW1xeEJvQ0xMZm9URC8yK3hYamFkcWcwaU12czdCR050c0hhMmtT?=
 =?utf-8?B?cEoxMzM5Q0xsNnV3NmR6cThPYlppdUFqb0NtdVpNcUc1Szl2ZlA3enR1UWkr?=
 =?utf-8?B?Q0p0ZU9rdG14U1dRdXhrUk51WVdNNnBwUkFEdXFCampMWlR2a040VExrQy9W?=
 =?utf-8?B?QUJlR0RBYktveDlYRmVXdWhRVVBhNHdBUXk3dkg2MUs4TzZYcERkVzBNYW1X?=
 =?utf-8?B?TGRWSlp1MHdLRTRNN0ZSbnJ0Nk1FVlpJUHcyVm9iMHEwQXZHcnhHbmtSNlF2?=
 =?utf-8?B?V3dBdHVoeEx3bmI4UmlrTG5oSkFGV3Q0d3ZLV1JGVEg2QXNTVXAyRmZWMUZJ?=
 =?utf-8?B?ckE2SFVMT0Y1NmtGMitpOC8zSlNqRjJ0b2JFWC93M0EzTGJ1djAwcTNNZHFY?=
 =?utf-8?B?Wi9IZkJ1dkJOMjJrMkplR2ZPRkUxa2hkQ3JOUmNwcjBZOWxCUituZDRmN2Zi?=
 =?utf-8?B?bXhJTmdwdWNjblB4Q01GT09pTExlQjg4RkxDeUM2cUZ3VGdLREZaMzdaQXZX?=
 =?utf-8?B?THJYalUyUlFqdFhnTnZSZlVsRXVsK21YbEpXM2xVZGRTS0NHNFVkNGZBREtP?=
 =?utf-8?B?aUo5VW1IeXV3T3JWMUVzMVRwV0x1ZVF5NFRkaVVUS29tMGg3QzVtekxqemN4?=
 =?utf-8?B?YUt0V0REOXBHVS90VjlSNklPV0h1SDhKSmJQYXJpMXd0NUxiUjZWOUkyNlVI?=
 =?utf-8?B?b0dKKzlPT0kvc2FVNjVDd3l2NXhnVmI0U01LUUlXcU44eG1TdUJ3amhwWjNV?=
 =?utf-8?B?YWIwd2ZVb3FIb1k0MmgyRDFYY1RyTUpzSlhrZktOZmNLUlp6ZFgxTUhvSHNv?=
 =?utf-8?B?Z3Y0VXVOU0hiNUdsNDBKbU82V0FKQ09RY2ZGbmRwQlV5aG9EemhKb2MxS1Fm?=
 =?utf-8?B?UW5EVDVzL0lobXJUOXQ5NmI1SGFnPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: v+V3+gnYro14QYf6XlocdpDb4wynTIkqWg+JJpJ1QmKR/rmBwo79j4+1yVX/hNBJqfR/64wUZagnS1MbossySoNBT1XYn2ADy6aCCkuEEUmEZozXGcvlTTUS91qpjd4AiZfvpKUzVv4eq+jabQMHfls01X1HyOPLxu1Dx9s+SfKb79mvDL57kKiidfnmsRc0nimoSklZyPbMsbAsBhqDoqzrMngvCetHcaOIMWFURhBrm1syN0J+mmqUDh1Y4PPL74tOYyEPrEQOLNwYB9bKSbs4h05lM09ke42uHO3GMS1UGOJd0Jk9+Y0nYvBxXrI/23OMloKsJUMhyA0aSBTLH0r2Ks51o5hjqO8OGOGix8j89HTAaxtN6tDpa8gn9DqDDI70gwZBS0oLurDB1OSwsWL7oBbVK51wDSKYneWSh2TTiLu9jxM0nhn98OWuAR6F
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:27:31.4393
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a066752a-50d1-48db-46fc-08de6a5c00bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7954
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092737_316309_56FCDC28 
X-CRM114-Status: GOOD (  11.56  )
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>
Reviewed-by: Dhruva Gole <d-gole@ti.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef94a140edcef595ad8f6cc4b4113..fd323a64880970e17007ab130161dae56efd09d7 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -336,6 +336,13 @@ AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
 		bootph-all;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x1c8, PIN_INPUT | PIN_WKUP_EN, 0)	/* (A22) UART0_RXD */
+			AM62PX_IOPAD(0x1cc, PIN_OUTPUT, 0)	/* (B22) UART0_TXD */
+		>;
+	};
+
 	main_uart1_pins_default: main-uart1-default-pins {
 		pinctrl-single,pins = <
 			AM62PX_IOPAD(0x0194, PIN_INPUT, 2) /* (D25) MCASP0_AXR3.UART1_CTSn */
@@ -692,8 +699,12 @@ partition@3fc0000 {
 };
 
 &main_uart0 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1


