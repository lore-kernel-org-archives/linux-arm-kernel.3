Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2FBEE3698
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 17:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sKE6UJt7dxGlmQbPeltY8HwcpqbxnLHd0fgOITMd5kU=; b=j886B7f7ER0hjUD7eFCG4X9pQD
	qqERT+miRM1NWXl56Sa7FDcpgTw0vanpiDrEIJ2WtzpUntokg48rReSOPU35/YKtmEdK13ASm19HG
	3zYDCBnsddRNTCux5o6UPN05Pxkvn49tjIoG0EAk15IIJTiyKh0BbpeHIvkddPbH8SfrkgNLz2ZmF
	p5Rr6eHM254S2NdA4yQ9FeI956zptHpoAvjAuzz3add0Eiw8k29VfK/05+YmKNemMv/hGx1+CA8XC
	/GwpPGj36/Cm5wQZedMAoFOGadgyTSa9Gyghu46eYf8PD1Bz1XDGysRUGVtozbKjFUeOJjs7GteL2
	q1YsfMrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTe-00000002RZE-1Psu;
	Thu, 12 Feb 2026 17:27:42 +0000
Received: from mail-westus2azon11010030.outbound.protection.outlook.com ([52.101.46.30] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqaTZ-00000002RVn-1RDJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Feb 2026 17:27:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EytanFKM8v/wli3AfaAwCNHADE+RLeZVsj267wQ2Oijv537X6/1FpsMwC1IDXBOiYuZo3v6V+Biqpiok8AqvQfsZgv1pimUhqM40iPT597VVwGXb0FQlNu17whVHLchtG3X0LSFxcTGIOe8/Y5HpRRsrRuUXPrOJ0TheVvlWtpN5CCw8i8OYyGEMNhaaB6EoDCdVa1SlWLTgW3W6nkG0Zr+rX9prqflGl7uRI9ut+ah1/BOZSSN+7pqSGBgiIJ2Fl2uJt0Lyte65YNj0VQFCClfn4oG1iPoBzCDykaw0s0xiL6lmUWLEB5q1y0udIS4Wxyi2xUyKMgH97YOQsWZ3BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKE6UJt7dxGlmQbPeltY8HwcpqbxnLHd0fgOITMd5kU=;
 b=J7XFjHw6Dt1b4TAXEwgbiwoA+XTeCWUZfRYaYWuL+tNxb117/8qLE4pDN53z7G6V6YMRvCQ26YYdj6Tqti2IMgib8gVNj+edEWBIT1l9OVFfIXCTSunWzxYCvtsgcCOejSZPHYZ/xotySrAnVB30O8qiH+F9ioZKYBgwhVTaYnQwlVJZOjjLArm6g7rhMKHLoXIbvxMUd5rqDfVlEr3TmHhfL2EMDDIDRY2VRrSM1USVywwHcgmg51n+Pxz9JfA8SLokxscEJZH1pvqwFzoBUyZiQxjUxlgjozljMtZRByi6LYWsEawibr+bvHsoUTJpEEHax+50q0eEc0a0VJwH7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKE6UJt7dxGlmQbPeltY8HwcpqbxnLHd0fgOITMd5kU=;
 b=ro3x/9NCdaQOFGVf+E9FUTYnZV/Ok1Lf9lkzddjGsGNRgFwEVS0e4VupB+/0UrPp2H0ftWll73+D/BeI2WLy9MutZHT/1En2VD8872jUN3WBMdrqDVNOtJqd0v5LIh83ggXS8dYallJxwADR010JIWPvLfUQrWaLgZaKsDYFn3s=
Received: from BN1PR13CA0021.namprd13.prod.outlook.com (2603:10b6:408:e2::26)
 by LV3PR10MB7723.namprd10.prod.outlook.com (2603:10b6:408:1b0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 17:27:31 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:e2:cafe::bc) by BN1PR13CA0021.outlook.office365.com
 (2603:10b6:408:e2::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 17:27:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Thu, 12 Feb 2026 17:27:30 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:29 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Feb
 2026 11:27:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Feb 2026 11:27:28 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61CHRSI63458792;
	Thu, 12 Feb 2026 11:27:28 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 12 Feb 2026 11:27:24 -0600
Subject: [PATCH v5 5/5] arm64: dts: ti: k3-am62d2-evm: Enable Main UART
 wakeup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260212-b4-uart-daisy-chain-dts-v5-5-26c7f534e567@ti.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770917248; l=1799;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=z7XocER7EnWq4UF7qv2/WuOqbhhWozI+vycWySytOBA=;
 b=hu3BzmNe+bQVF+5fG9b77Ha1J5Oc3vppiULp72y2+NZAOGgSOPkwnQOyxeoxb8X/AmYCYOQrd
 Xy/vR7BOJgNCqdiWScLnGSaaccUbRNsuwcoRa/bFk/UPMzXaEa55ZVq
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|LV3PR10MB7723:EE_
X-MS-Office365-Filtering-Correlation-Id: bf09b3b9-88b9-4999-3460-08de6a5c0057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MjExWWlIWWRMb3RCY3hZTWtLS2VYVU10ZmNqUkl1SjBsZHNDT0JSQzhBN01T?=
 =?utf-8?B?ZC9TWFhGVEZ2K21IY0Z2Ty9tdkdtYmJjMC9VMzN4QjlCTTZwVm55RW5FMFY5?=
 =?utf-8?B?bWdzckh6TmlHVXp4VjdmSW50c0gza0NMV3BtUVEyWllIdFdldTlJN0hkQ0Nz?=
 =?utf-8?B?bWx6MkVzMzN5Y3BRZkpzNUpkRDRUTlFSSDFsRWFscERYWUJJSENjemE5aTdB?=
 =?utf-8?B?TWVqQmFnSURQdU40aFltVERCMll4d053NDYrSXpsTVJoaFhnM2hUb0p5Y2xH?=
 =?utf-8?B?RldEd21oNTJxVkQ2cmlGeHRWNndZaTdHTGJwNVlkRkJXdXJrSDlaS05haEls?=
 =?utf-8?B?aUdrOWNLMk1VanRaTFd0WnFvNXhScFVxMk83STh1MEFRSmE2MTlvZktFR3RG?=
 =?utf-8?B?NEtCaFBQaWNtTGJBS2xYV2FsTmIxYkk0ckRqOEhyWXdHQVcwWHNqZzFHYWh3?=
 =?utf-8?B?OG9acGRzNGhnOHB1Mkp3NDRVUGlhd1AzclNZWTY1aTZRc1IzV3FBUjI3UHdH?=
 =?utf-8?B?WTJiRzNndFZidjBUbEpNalFMREw4RHp3N2I1cDZIQ3B5Y3M5dmxNQnlSRVFQ?=
 =?utf-8?B?amI3OUtYb2xORjg3dXh3Ujhua3V3THI4OUR3OUE2T25uTHJTemF4M3ZDaXY4?=
 =?utf-8?B?WTZIUmxaUjV0RDlxallWM3JhT2NiZFlZdGJnejcxOVE1Qkh6QmQzOGJSdUpD?=
 =?utf-8?B?TnFmcHJCcDM5Y2FiU2E1T0g4TnV1SFl5YUdCcGxxWEYvUDg2L3J2RWw0YTAz?=
 =?utf-8?B?SnQ0a0FJNnBjSWhxWlBualBueTROMTNwbjQrNnkvMHFWY3ozSFpidzZBc2NI?=
 =?utf-8?B?bVd1cmhFeW5GTm0zYUx5YzI0bTlrSGZiZEpUTEMyTU9wazdBQ2MwVjRvWHlm?=
 =?utf-8?B?R2pLWmhQT0JuaEtJZXZXZXF1bnI1WUdPSlZXejV4Y1Z2eGU1dkEvcWxBT3Uz?=
 =?utf-8?B?MXJ5TkFoUUhVa0xuRysrdURhWityYVFaVCtDYVZocWpGTFB5NUcwRFJYUzJS?=
 =?utf-8?B?VnY0T1o0UERlOHdSeU9WSVBaOWh1VURwZlZWdXVVRHMvcmFmRXdacGE0ekhH?=
 =?utf-8?B?UVY4a0EvdFdHR05zcENmdFllcGloTFB2V3VsZ3gwYnBuNUNSaTZKQ3lCMll2?=
 =?utf-8?B?UUNkUnVRRjMxSHNwOFhUaEdUREwzSmoxanpnMHFCWU9EeWE5L3dXZHZpbVFW?=
 =?utf-8?B?d1ZXWjFQL3R2cW1mbnMvWDE4ZlU1NXc2L1NPR0ZoNm81aWNOdjhDWlFFREVY?=
 =?utf-8?B?MVl6K3AzNHpmS2g3ckhqR1EwclBud3lrNkd4dldDdFhOc29iYlNwZVlSRVNT?=
 =?utf-8?B?eitJNnZoOGxZY3REL0h0bGJKTXJ4U2gvcFVKU295UVBSRXZlYXh5MkM5SnZk?=
 =?utf-8?B?K3U2Q1pvOVBQSDVjcTlTVVQvcTY4SmFuNlFJSTAyaTRsTHZmL1UrWC9iYUpm?=
 =?utf-8?B?b1BQVEhNRUluUms4UFdSbkQ0bzRRR1JVNHRmVTBRdktxc0N0V3IwSjdVN040?=
 =?utf-8?B?Z3VqR2ZYU25GL1UxZjYzVlBNTUMvVGFUbW52MHNJWUprUnJwb3JVNFlOVVha?=
 =?utf-8?B?dStselZ3cjMwOFhZL0NPQit3WldiR2MrS0JtMmNmUCtlSDI5VndGMzgrc3Vl?=
 =?utf-8?B?MlkvdUFUVFkxdkc4VVJyZzZyejUvVHRLakcxWHl3VmgyRnJET1dTeDNOSy82?=
 =?utf-8?B?Mk1udTJmUHdldnE2dFI2bnNmdmFuNWxaUnNLVkZrZ2k0YjgzSUdjMjgwSk82?=
 =?utf-8?B?TW9lTWowSkVCK1ZOUkIrU0dTRk45d2FTM3lBRHM2ckg0ektiTGtVbXRLNFV4?=
 =?utf-8?B?UGxLUi9pKzRjdzZlZkJzK0RKblRzZ0JFQXhNSnVyVmR3aTFSeW9vWXNHaUVH?=
 =?utf-8?B?YVkzU0FZY3RBOUpiWE93TGdNV0gya2FqNldwcHZmMjlWMUhOWFZjaE9lYmdk?=
 =?utf-8?B?SWZjSXQxMkY5WEV2bkI1SHNWbDBsMzduTXJ6d1U0NFphSzJ0akVmUExnUVJO?=
 =?utf-8?B?NlE5aWgxYm5SUmFvUjZ3a0xleE1GYnlWS3NqYVo3bHg5QnZreHVPaEljMzlK?=
 =?utf-8?B?L3BQWlVodTFKR2NuMHlvbHFhQlpPOHdDeHF4bU1SQ3lZZXVac3Z3M0tudk1r?=
 =?utf-8?B?cUhpaGtHaXJ5VndMRXpzQkNhTWhlc1JFZHdjM05MdmVEOHVGY0JSeFRyYSth?=
 =?utf-8?B?MnEyZmVQS0RvZS9zOU9wMUdpcXpwR0haY1cxYU9tclJlVXdpZFhSZ00xZHJk?=
 =?utf-8?B?cHNZTUhCNlRDSVdtRU9FRHNoaFZBPT0=?=
X-Forefront-Antispam-Report: CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: W4bLAkqsX1QP8HfT7UptwTYZsoVDly+Tpn09cuO83rVWPc+joCgb4C9jRgLSnvyFFdM8JUbboQhJdw4MJle4iQskJrg9VNo2SXapFf4CpFL393By2+IP86y83j1D0ZIYPQd06/sv4Gg9srhi7c4aeYMeSmEGEmx7ZtBL7T0SoHklzHAQDZvtFrpto9oD48mMKlrFSeQKZQ3eiNHOtxTtUIt0zsoHsqk5Cjb4dD2MlX8/xWjf1vXc6V8WGgBT7/qK+wkRRzTc7hQD8omO6fcj3QKBr1BjgESkeJFx4OPj+5/MVFhV9U8i48usKysfU3Da5cBNTUV/RfBLYYiUeXIkn773ZzqJMTfmYEU0+vdw8MQENwQahvq5BaA26TNt5Npku4rXlCnorBTrT+1NNsLL8UMAlMt/MqJu0ZM488XfTJumXRc4EGTfx/gkSW/Ueh0L
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 17:27:30.7243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bf09b3b9-88b9-4999-3460-08de6a5c0057
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7723
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_092737_395468_4072C8EE 
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

The Main UART can resume from suspend to RAM states when PIN_WKUP_EN
is enabled. Add the necessary pins needed to wakeup the system. Add the
system idle states that the Main UART can wakeup the system from.

The UART driver uses the "default" pinctrl state when the system is
active. In the suspend hook, if the UART is wakeup enabled, the "wakeup"
pinctrl state is selected by the UART driver in order to allow wakeup.
Upon resume, the default pinctrl state is selected again.

Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62d2-evm.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
index a5d5dc0a7bec8c3a5dfa63e984ae398af3ede7c0..768aeeec0e8d6c1f6f1dcca442dae15450ce6c2f 100644
--- a/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62d2-evm.dts
@@ -241,6 +241,13 @@ AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
 		bootph-all;
 	};
 
+	main_uart0_pins_wakeup: main-uart0-wakeup-pins {
+		pinctrl-single,pins = <
+			AM62DX_IOPAD(0x01c8, PIN_INPUT | PIN_WKUP_EN, 0) /* (E14) UART0_RXD */
+			AM62DX_IOPAD(0x01cc, PIN_OUTPUT, 0) /* (D15) UART0_TXD */
+		>;
+	};
+
 	main_i2c0_pins_default: main-i2c0-default-pins {
 		pinctrl-single,pins = <
 			AM62DX_IOPAD(0x01e0, PIN_INPUT_PULLUP, 0) /* (D17) I2C0_SCL */
@@ -587,8 +594,12 @@ &main_gpio_intr {
 };
 
 &main_uart0 {
-	pinctrl-names = "default";
+	pinctrl-names = "default", "wakeup";
 	pinctrl-0 = <&main_uart0_pins_default>;
+	pinctrl-1 = <&main_uart0_pins_wakeup>;
+	wakeup-source = <&system_deep_sleep>,
+			<&system_mcu_only>,
+			<&system_standby>;
 	bootph-all;
 	status = "okay";
 };

-- 
2.34.1


