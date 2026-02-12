Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB18EE36AF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wst6jaUMLcys3w3vigaLZ8iYjGd+/KLfpMfRpEJ/WY=; b=MRaKpZ6fV0bcneOFRm8OraLTGP
	zvf0OJXjO31JWiHJddEkTDYSWUIXwtOEXr0Z67AZ3ZP2EO2HSj1YxqEtdoZWHW9Q2eL6kbtrlii4R
	9zZFIitfURUrCsCNZOsYfAvjuzwKJml+moY+NBnzOf9wOwoUYtsuoXuW8pR6QS2LBn9psl56WHq5P
	b0UaN3t6fdndI1Jattyrlcjj8K0TzTZdRb91ocLD64Vd8JSFLomAtGa7TcB+Yr2YzCIj/YjdomRtO
	SFUEKHApFrtdH8isUM4oAV1c+UudelLXe3a67i8Lk+FiSNNU2Lpy8J8S/qvwmKARzKIW/YltEKMfj
	9jq8zqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTc-00000002RXV-1WyY;
	Thu, 12 Feb 2026 17:27:40 +0000
Received: from mail-eastusazon11011056.outbound.protection.outlook.com ([52.101.52.56] helo=BL2PR02CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTX-00000002RUA-0E7N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:27:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kPowQYmnaNs8Vkd3qAcuQsMCsfQSN9u++CytY1hi7sxme3BI6tCYfDRydNQxJxsa518ZG1V4fgNoeoCmn0uCH5DBu/wdg1uVXNBfJmBIVR+GY16R7Nofb5YUJz3ZOtNPrgdMcsjvxeFVcCCXOm3mnBtV5DaDIgnzX2fDmFqcUkPSip/EwkRxoulIKj3wxu/EHnDMWDMRy5irmMs1mfoz1iIy7x3bMCBYAaJLtSWi35oVWyaIpjjQyCv5eY8NyLyS8JhwwG4GIgWv7pn4EU6nnIJnDMWY7S3vP93/MoM0V6HkIGq8Kw+HPKLAUWm2Rf0g731V/xGJit8fnZbsOVSPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wst6jaUMLcys3w3vigaLZ8iYjGd+/KLfpMfRpEJ/WY=;
 b=EmU6C58XSAxRor0xRKtSLvXV2YGCo6SCyGXDvNAClag9vK6R4lSn5Y9gNhpgxAHObrCLqBwfMQBgJE8GZRYg5xcsEYt/Zd69BvZtlqy8u2dlI4UHupLhrxvKbkjHPw7SOh03W/fyoaC0C61Ln+gimdDjWNkIukON74+Wq2B09mFxCTtnJ/y+lxsPoKslyQB2eEr18OR5yEx2p5N64d9kr+1KPnCE8p3iKgUbbLcsSBo24LCWiG1GSizalqP6JZZxKDuIAZc/wElj4l2ZWEGyj/hnyEXg9srhIdz2y/ogVi9/8Ln7znTse8CosLk/hy9tFcSsAzAo7N3BILwDQJs1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wst6jaUMLcys3w3vigaLZ8iYjGd+/KLfpMfRpEJ/WY=;
 b=ZG/BqGGJvZpX6etdojGAq1nbGl0l5Uk7il2+sMmzMqXX3e/MaBLVMy0G310P+Uz91DGG00YR5sqAqyRfDXdZa9j1Bbf+JWxy4CsGSDXtrAN+mZ7XqdGW75zcqVfUkGkMYcsaf03gbR4F8AFpGf1H9RPAQKVG9ZtfOjsnmhh3Bzs=
Received: from CH0PR03CA0039.namprd03.prod.outlook.com (2603:10b6:610:b3::14)
 by BLAPR10MB4834.namprd10.prod.outlook.com (2603:10b6:208:307::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 17:27:31 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::1e) by CH0PR03CA0039.outlook.office365.com
 (2603:10b6:610:b3::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.18 via Frontend Transport; Thu,
 12 Feb 2026 17:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 17:27:29 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:29 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 11:27:28 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CHRSI53458792;
	Thu, 12 Feb 2026 11:27:28 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 11:27:23 -0600
Subject: [PATCH v5 4/5] arm64: dts: ti: k3-am62l3-evm: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-b4-uart-daisy-chain-dts-v5-4-26c7f534e567@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770917248; l=1863;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=KWWGKQsGGWTZW09V5WyFrSIIT9vqChQzlbn5mCQqaOg=;
 b=/YxgT7Qjsf1IKbciLh7nBAuSkOrOndKINNPqj9j2rXyovUtKltrKjO9XaGGwceJ9IVJ8fyxTu
 G9VZV8wfbZ0CChP5Mj4xTAQmtRnbYblChhrNm+uxZQfkk4fKzCEGRuP
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|BLAPR10MB4834:EE_
X-MS-Office365-Filtering-Correlation-Id: 623b8536-7946-42bd-122b-08de6a5bff90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFdGY1JUcFJCZHNMZE9Lc2lqNndWeWR3U294dy91c0lDVXhXMm5HNFpWREVo?=
 =?utf-8?B?ZmtCbXU1MzNPNGdXYTBDTmlOODlxeHk3QllqaG9qNnBscThJOHRlbW1PdDUz?=
 =?utf-8?B?UVo2ci8zSHVEZ0NlK1dFTGlNTG5xQnlYUnVvZlhoMjhseFZEaGRsM1VZbHo2?=
 =?utf-8?B?ZURUYm9ndXRHV2VXMHNLb2sxQm1VVy9kY0pIaFpyeWZsMHJSR01pNUFiRW9l?=
 =?utf-8?B?UjlROEs1bzhWc0czT1RKMGR0bms0Y3dhWFd3ZzNsUmw5d0pKSmdrVmRjblJB?=
 =?utf-8?B?ZjdlQjlsVmwvQlJzQmdWV1ZNMVIvVjFraXNRNVJNYVhna3VwWXZnMWRxbi9G?=
 =?utf-8?B?cStwRURINnREVS9wYU5jYktVNWQwbFZEdEVnREF0Qy9hRlM1Y2gya2FtQlpw?=
 =?utf-8?B?bWk1QUN3aWlHV0g4MUcraExjK2tQUjZ3UjFKeWR5dWRidEhsRCtLaDJ3anAy?=
 =?utf-8?B?ay8rYUk5d1ZsQXlXZVB2MEdmZm8yMkIzSWxGZ2JHV1hOQm9nY0lta0RscGRX?=
 =?utf-8?B?bHl2ODRHTmdHSUVRdTZlM3BwWlV3cDdGU0J0Q1lVUHpVb2h6RUVmRGQ1WTFs?=
 =?utf-8?B?YmNJZHNidm9ZUXFEeU9qeEZNb0dPRHl6V1V6M3p4VkVSUFBldWJFRXB6UVVa?=
 =?utf-8?B?ODZpMEQ3NkxRdEZ3YVZPNUprL2ZYQ1R0akV3aTBya0JmY2kvbVNYS0VWcUl4?=
 =?utf-8?B?OGJhT3hsNzNyREZLejE0S21uSjZLNDlKSDhUOG9CYXRMci83TXFBSUUreWRE?=
 =?utf-8?B?L3Q1dVJmMWxIeDJWcWVNM21CWVhCS0FSdkd1YThtMHBlNlFSbUJCWDZNOG5r?=
 =?utf-8?B?aVRGS3d0QVZoZ1hTL1p5SzNpbWhzbHNBb2Nxc0ZnYXNYdDN5SzA5UFV3SUR1?=
 =?utf-8?B?ZFhlcXVLd0dYajN0YmxhS2Npbm1FZG5jeW5zODdPQSszd2pSRzBrSVBOS0M5?=
 =?utf-8?B?MXc3VWRHTStOQ1FvZFZwMWJjdEJ2ZnV1RlgxQ05LOFk4Nm9tWG9YSlFCVk1C?=
 =?utf-8?B?QVo0ektGcDZ0WlBZWUNrOUNZa3oxNGxoTldNWThzek11S1FKdEt2UEpseE1i?=
 =?utf-8?B?SGZxUUowTkFnRmo3RXZJQitaaDRtb0oyRGZJMEh5UHRTWE51Unptcys1Qm10?=
 =?utf-8?B?UE9FbUpUQmZ6bS80WE1HcG5TT3E3ZzdmZUFDR3VZMzlFdmxmeXpUQTYwcmRI?=
 =?utf-8?B?TFlmRVdsYVJ1VUhILzRLOFV6Tmc3VG94KzE0MVVhRDVoY0kxWkdjTWlrbS93?=
 =?utf-8?B?WXBYVEVlandybzNPYUxNWjl4eUU3MEUvbkMweVl0VU1xbkV5STZwdWZ2bFU2?=
 =?utf-8?B?czJJS05HaE5sTEt5MitkMkEzQ3pQdWdGVlhDSDVLM01HMlJsVWtZbStKZDVq?=
 =?utf-8?B?dC9WdUlVZGs1K2crTWxkNGszaDFoOXZ1aVo3STBQSWsyRXhwQjYvY0N0c1V2?=
 =?utf-8?B?UWxSZElhd3FDSTRvUUdtVWYyRFZBWjBsNE9KN0pWb1loSHdiWjR1RmdvaUpq?=
 =?utf-8?B?SSt6c0lBaUlrMlQrbjJ5RlJITG5OOXB4S3NqZ2lvUmVwQVo2bEdYODlBR0dO?=
 =?utf-8?B?QW4xWHlyNmFadksxTHdyTVhtMlJUUlVFUXhhcTBOOWswTWQ3TEpMMzBlY2VT?=
 =?utf-8?B?ZDJYbVlsSGpDQU9uUTdqbHRVTDJ4cS9BT2YxS0xmTzRiRlZsQU5jS01XR1lq?=
 =?utf-8?B?QWJ1V0FsU1I0MU9aa1FaRklXMFB2d3dpOFNhd2xZck94RFB6VHJUYktrZlEw?=
 =?utf-8?B?VGUwdGMwYVFYalBpWFptNW84K1VVa3NVSjltRm13cmNpTjU2aVFwelhDTFBF?=
 =?utf-8?B?bnlkRjBqM1dqUGgrdlJlZXdxUDU0ZHF1eHpqbHJRbWxjQ3llbmtnR3d1aHVK?=
 =?utf-8?B?cGRQd1E2c2Y3TVhqV0tUWWVjSjJYemxnVWdtbjBUZE0xM1ZBVGVhTWxNaWFn?=
 =?utf-8?B?VmRDZlZCUHVBMGdMenh4anVuVUxycGRCdHVUZlVhWmVYUkVrT2NtWkIrZmxm?=
 =?utf-8?B?clVzNGI0YkZoSWF6bHJFNG5IL3M0bHZseGE0aTFiM2doVWpDNHlYSW15TnBl?=
 =?utf-8?B?SEdBemFZaDNKNlBDUXBHRUQxRXpHK0pZbHl1WG9VWXdHV1AwT3NRWFRxMktp?=
 =?utf-8?B?ZWVlbW9PNDVLQnRKMFhIK0R5UU9uWEJhSGhWTTJtOE45QWl3QVl3Yll3Z3FW?=
 =?utf-8?B?dTBQcm9iUHhmbXYwbjlrQm9FYkV1a0hEMkNmVm5wam44ZkhKQ3BsL1hUOEd5?=
 =?utf-8?B?enB3MDVLaW9uT01pV3lJUkJmTE1nPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: h7UbhqWojsbuLiACBhQoLZuJqwzpoIqrKSispBOUvbUwNWpFYpXlMhb1oXsv0DLdAlyBV1yv26EvyQDMg+lqAAO/dU0iXOpA8myp9rgsR6QgqXXpXROfrQTnCDfJeIM0r/8PpHEJmLdPQqKqnqaAZE0FI4v+fhdE33aX95tFksaJiJIW8xfnL/ioRwSPXtV+Qi32eeJSJvzUoJdsuT6t4vqRGeCFaubbCMoTjczNXQijNUZ7g+z9NiD33TQRAxU/DAJdvumu2iW+s3Ng6x7FMq4HaiN2aa+2lnIEd4G/p4UWpo0fGDQgXtHJZEytiOKafjChT9MYlZm0w/26HwEBWVBxVRZHg5stTsizLmUvjbc4u7EvJvQ5NgVx7k0vRjkQKEPJOhWTrwRE0ph4YUUUPSYm9xy6BBMQMDUmsuA0TGihjjUty+PK1wtT0n/MeEiU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:27:29.4365
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 623b8536-7946-42bd-122b-08de6a5bff90
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4834
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092735_096423_72CA841C 
X-CRM114-Status: GOOD (  11.48  )
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
 arch/arm64/boot/dts/ti/k3-am62l3-evm.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
index cae04cce337366b50928d39b0c888550b14e43d3..943a5b9408b119eb09426fabaa798de4879fd03b 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm.dts
@@ -288,6 +288,13 @@ AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
 		bootph-all;
 	};
 
+	uart0_pins_wakeup: uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62LX_IOPAD(0x01b4, PIN_INPUT | PIN_WKUP_EN, 0) /* (D13) UART0_RXD */
+			AM62LX_IOPAD(0x01b8, PIN_OUTPUT, 0) /* (C13) UART0_TXD */
+		>;
+	};
+
 	usb1_default_pins: usb1-default-pins {
 		pinctrl-single,pins = <
 			AM62LX_IOPAD(0x0248, PIN_INPUT | PIN_DS_PULLUD_ENABLE | PIN_DS_PULL_UP, 0) /* (A5) USB1_DRVVBUS */
@@ -329,7 +336,9 @@ &sdhci1 {
 
 &uart0 {
 	pinctrl-0 = <&uart0_pins_default>;
-	pinctrl-names = "default";
+	pinctrl-1 = <&uart0_pins_wakeup>;
+	pinctrl-names = "default", "wakeup";
+	wakeup-source;
 	status = "okay";
 	bootph-all;
 };

-- 
2.34.1


