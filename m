Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A3BE9A05F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ecuPlXiFq1EoofzvRGpQlMDrz+pl33rx8PlqKlxoBc=; b=iYbcO2CqfBQM3VYriGZb4Zle6A
	F4fjqIzVRE3JaiZebEGmC20UwIzzYSF2nSbcatWpKhrgsbDfEl2CWcQ3h5faJygYuT6DZ6Ub/9MQu
	CFb7Px/bMr6e9XfJSSb0mD4T6IAmwlkZAsdTkHWkFTrwdVeE3k7BWeS4njmWfMC7vrde2U+NSUMWy
	GDM/MIsg9VQdemAR+jgQpbZH/Qayg3URUmK4GJwdNb/aXT1y4Cyi9hBW1pPq1B6KpL9eEJSKlj4X+
	KO0atdnDGc4tO+HDb+14g4XkDedjwaLpiYHlTS4wuqP/jydqaFHCLdAqVj4e3rGJsQev4S1t5WtFt
	QWEuBIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9wC-0000000BsHp-3Pj0;
	Thu, 19 Feb 2026 19:43:48 +0000
Received: from mail-westusazlp170120002.outbound.protection.outlook.com ([2a01:111:f403:c001::2] helo=SJ2PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9w2-0000000BsAm-3UDO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 19:43:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHrBhsSpvOKCiy/gZLOuV4lykYqG0isjjbRB2D4EReZSSmo21l7B8DKlG3kvsdNgYkLJgnc6AJvp7cWk2HxzBJBalN8SwZaTaZS5p5KglHcfJzTI3tdOpeYkKiVTNDKQUODcYpvgoBVsQ2DyKrMcT3mA48ToUQUqRBR/6SQu5IEousdmdaPNZe/p3d+OSsmtMJ8LGwykraZ4vp4wW6PLLSmAzMBfR3Fwn1o5LKA8UAWZV4hKUnTVHHeBY1jLB41lsRjoD9YecRCUM0AEqSo/I0MxMunAOC3eqDYgXznDxO1ynLnouhG7F1KCNAJmmVSkcbvpKSYHvPG5NwY7LwrhAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ecuPlXiFq1EoofzvRGpQlMDrz+pl33rx8PlqKlxoBc=;
 b=eYdAuxdAcA/KHUf67V3wjy5fpMxGM1bxW0Cfnt3dBVHEB9l7qmEwC+Q0LKC65tSVjg8IPX7fppWM0jG2fLgARQXxj0HJJcmP6NGo4fWG9sM/SswaGMc6OkCbkd2w5UTyOr2sGurAVpslLeWTck5SUIeg5hmXPI1ki4cBbxxw3V0Yknv5yhRYAK9VLyogku2mAmv8J/PADX/oWpz9cVrlk9xCqZMkPUFOJ9fGTrPOjGMIDMpfN8C2PEG6RlYcNWSbSnBm97W80f2YPvkYbdsTE1F5FmHewxQjFcBAxOMwkhgSEIXPbcqN8oWNWLaoLUDAfmMpRnLMvtbnS3fggP7xMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ecuPlXiFq1EoofzvRGpQlMDrz+pl33rx8PlqKlxoBc=;
 b=COQiXQrLQ5UkAouLWt9Dd+YtDyT5U0Vziho3oDRq0kTff/3V6Me5YOqaHNXGwQoRUdAOrRJd2DXLzl/AaxzLHiawieNZG3klZdyQRVt/ScclCG+Xmc2+I8gimvI443v19y3Y4nOqxqNj/G2h4UZreFYLai46FEee7AWtJpf8yTY=
Received: from BL1PR13CA0203.namprd13.prod.outlook.com (2603:10b6:208:2be::28)
 by PH7PR10MB7849.namprd10.prod.outlook.com (2603:10b6:510:308::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 19:43:35 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::79) by BL1PR13CA0203.outlook.office365.com
 (2603:10b6:208:2be::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.16 via Frontend Transport; Thu,
 19 Feb 2026 19:43:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Thu, 19 Feb 2026 19:43:33 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Feb
 2026 13:43:21 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Feb 2026 13:43:21 -0600
Received: from [127.0.1.1] (uda0506412.dhcp.ti.com [128.247.81.19])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61JJhLBa2638942;
	Thu, 19 Feb 2026 13:43:21 -0600
From: Kendall Willis <k-willis@ti.com>
Date: Thu, 19 Feb 2026 13:43:17 -0600
Subject: [PATCH v4 2/4] arm64: boot: dts: ti: k3-am62l-wakeup: create label
 for wkup_uart0 target-module
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260219-v6-19-wkup-uart-wakeup-v4-2-eda09dce5623@ti.com>
References: <20260219-v6-19-wkup-uart-wakeup-v4-0-eda09dce5623@ti.com>
In-Reply-To: <20260219-v6-19-wkup-uart-wakeup-v4-0-eda09dce5623@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, "Tero
 Kristo" <kristo@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Dhruva
 Gole" <d-gole@ti.com>, Bryan Brattlof <bb@ti.com>
CC: <vishalm@ti.com>, <sebin.francis@ti.com>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Kendall Willis <k-willis@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771530201; l=950;
 i=k-willis@ti.com; s=20251230; h=from:subject:message-id;
 bh=1ZxMc9ncBbzDhwxAXDWLN7NxMjak+QSxosiKsC5wBqY=;
 b=e5fo+/9BaTw4pCYCEOrqVr0kupNVeUnnD1iJ0i16B/l3I6aXtF6cKv3Lw55zN7h+5LxvsNwJ3
 gXvnCjfaW7MCiwk1a14+wsmw8dJwE3yFvKXx0JYR6FT5amRlhOiAmU2
X-Developer-Key: i=k-willis@ti.com; a=ed25519;
 pk=fQiPVFwmogfDAKdaAKq163RWSfgHZVE/MrsDzp0Xo1k=
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|PH7PR10MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf5b21b-c3f3-4f42-0659-08de6fef2a83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1hBWXExSDFzaTdtQVVOM05oRUkycC9JQWt0WVFjZWZtbmRMOHEvSlcwMlFz?=
 =?utf-8?B?VE5KZkRySnJGMUNBTWEza0FuR1lRbU9aczZGbWFCT2hVaXYreXd4c013WTFz?=
 =?utf-8?B?aU5kN29MdEhGN0MyK3lXaVVsdzlEbFMzbkk3d2dEdkkyQzI2YUszeHVvelJw?=
 =?utf-8?B?TzdKMkZJejdocVFmaU0rSlIyUHNJOU9XdjVRc0pibGY1NklHNzBTM3VmcW5y?=
 =?utf-8?B?dmR6M2pUWHhhb2JuUml5bDBqaEU1dVpxUzZ1RmVjTFA1ekEvQUpkd0Fjczdk?=
 =?utf-8?B?d2xuY3Q1ZHVqTzMwZkRiR3N6akcvQyttZ2RJOWF5VGlMSURSU0RPcTlPdkN6?=
 =?utf-8?B?UXVzdVF2RlpOL3pFMGxqbmtNWHQvQTMzOHp5bnVpNmNhZExHeERsMXBNVzN1?=
 =?utf-8?B?NVVpY3hVWFcvQXZjanR5ZmxHa3lRYmhNeVJpSnM5TldiaVRyTjNLQ0huSW9Y?=
 =?utf-8?B?RVU2S1UrU0orUEt3NVhURjM2Ym5tRDBtUS90ZHBXQ0Eza0tGdHRXbS9KNlpP?=
 =?utf-8?B?WFFsbFNiblR2aFFDSDVGUlFlaHNxbzdUSnZWdVFVWnByVWo2eUxKSDEzS0Qx?=
 =?utf-8?B?cjBNQmF0UzNjeDV5bTROSkp6aTd6VVEybE1ueFhHRjVDeWQxMFUvaFc2WWV1?=
 =?utf-8?B?SEJXby82d0NXTnJkWG9yNVV4RitlMmNJNE9mcUdjcXFlYUhHRXlDVUg0UThr?=
 =?utf-8?B?djZDRUZxcFQ3Vkg3TGtaT2x1N2pWZ2EyWmpkbmlWOFZ4YnRXN2FsTU1NYXFo?=
 =?utf-8?B?UUZ1K3lqMnlRbkx1eGUzZFhONldScTR5aGFBMG1yVzVZMi9QN1J5RnJRTnFm?=
 =?utf-8?B?bXFlOWRDcUVVZWdxTEovNVJnckM0WVZLZElJdDVTaVhlQnJSOUlISFV2NDY2?=
 =?utf-8?B?WklidHJ4MDhkcHpXaGFpRG5ZRUpidy9uZTBsT3g0ZjlwZnNLczI1UjA3RWVa?=
 =?utf-8?B?N2NOdG0zeXdjaUovenBVR2xCa1BFeGxjSE0waEJteFBDNlBpaHNQZzRDd1hD?=
 =?utf-8?B?eittd3JIV092dTZuWEtwdytVeFpvUW9PcngvYWh3V1VVR1hlcmJEWENwWTJV?=
 =?utf-8?B?SldSa1AzYTRmVWYyOWJGTy9LM2dpUnpzdU1DMHZqR0oxMGRzZHR3clMrVmNr?=
 =?utf-8?B?dXlFVnQ1VkpVeXgzT3poaEhDTXJqaVR1dDVuY1ppWVlwOStJbGU1WnhOanZD?=
 =?utf-8?B?VFMzeXA5Y1pYY1F5cUNNZ3dyVTQzSm5Hd3lIOVF6aXpjZVFmVERISDAwVnR4?=
 =?utf-8?B?cHFKUHI0OTREZ3pQVDZpb2V5SDBoRHRtWnV3YzZIVzRLamNVZUFWQm9QZXJU?=
 =?utf-8?B?U0pwZ2QxL1NGVU9LWHQwaGlXUzJGQ2pBL09Rbnp4SHYyaCtnWmxuNFJEdkdn?=
 =?utf-8?B?ZzZjVmg5NzVJZmJ0eGFkY3ZPVXNKY0NDRHBxN1JFRVl5VGVGUmxYWi9CN2E0?=
 =?utf-8?B?eG9HR29iL2cxKytncHhTOEt6d2RUL1BpbWVYVjlGVXk0R2Y1YTVBSkxSWmts?=
 =?utf-8?B?M3dmRUZTeloxMmFEY0dxRHk0OVN1amwzQ1l6T3JKMGRYM3Q4dkZlS25DRkpr?=
 =?utf-8?B?WVFRUTFCOFpaM0NFNERJSk83Wlp2di91MFZnWXlPQXdoY1FubHRFVy9oZlBS?=
 =?utf-8?B?b2JNejNoQ0xPQ1NiTS9FRjNBSlh1YnZnQlVpTm9rQlkxa1kxRU5JVEdQWGJ4?=
 =?utf-8?B?QUpLanlraTc0NmM5dlQxK09QS29Ma1dPZkxzekRZV2swWHhlc2FMaGpmTUpT?=
 =?utf-8?B?N3VVN000azlzbjh3LzBnYS9wbXJhUFpoVDRweE95dy9FM1ZVd3JMQkVTYWNT?=
 =?utf-8?B?VnpyemxZOVlnK2RkNWxOTjNHcFdrU2JMSGo5QUFOU00rS29lWkJVVTJoYVk2?=
 =?utf-8?B?N3llN1JTRnVTSVAzQ3VaZlYzNWt1aGVJd1V4MEFabUlnRmU0TVFtLytwOEtw?=
 =?utf-8?B?bUlsMGE5WXhtOGgwc2lSU0luNGdqanlCc2FCc0x3T3JBM3FtMlVNSVBOaU5v?=
 =?utf-8?B?elR3SEwxc1RIR2JQU3ppSUtWR2lYUC8wL3JveXZaVTMyZTVxYW8vbmVsY0ls?=
 =?utf-8?B?cGNqbjdwVXR3bDNncmtEYkpGMVVRaXV2cjJldEtuUEUybzhFY1h6MERSOWpD?=
 =?utf-8?B?c2ZreFNzdXpxaU5yajhEdFkwbGpvZTkyR0FQYnoxV2gveWhCUGZidFFocHdB?=
 =?utf-8?B?YTlOZ2tXa2lQclF6c2dIL29ERnFkTHRLM21QRmZxdDYzRkhhakIralEyN0tM?=
 =?utf-8?B?MEF2a0RmT2xxNEZpT1hOU0V2Ykl3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: hoDCi+EVXN4ewAk8U+Xin5t23sLKtHrbBLH7XYnRGxly94XDt8L99CG71/PWj5vk46B3mybM/LTq5CpKviOzTRMTF2QlW7imn8jZKoGC2oIBMp3GWyPHk4oogG9Iau/nnPCHa+z9GsDavlhe4z7JnaZor/YVEzIMv/LsXK1a1H0rixybF0nOBpTFnjqs/vgMYHEPl5umcnJaaC9Qt1xksiZFW9DgWDLfaXZrxwQEF7yXmsKAHbI3RcRjMaa0lne+4Kpt5WyNgPhORKkUWXafQzajiVW7Hs+vLzrsoQMPNnBpYGG1GasH7Z9Cyo1jkL2Q3pTO95F1qTOVULQCW1TFL+KhN1AqA30jwzirtkzVyb7I08ApEKerpkZ33J+Y/qWy0L75/u1lbrVW+NNy8yrXJL9wUi2ZeQkMJaqksv81Mx2lgqTmqLI0d+6xcm2pd9xS
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:43:33.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf5b21b-c3f3-4f42-0659-08de6fef2a83
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7849
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_114338_917767_E28F72C5 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Add label to the target-module node so that it can easily be referenced.
The node specifically configures the SYSCONFIG related registers for WKUP
UART.

Reviewed-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Kendall Willis <k-willis@ti.com>
---
 arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
index 61bfcdcfc66ea8d802a36ed43cd01fbbf3decc70..6e87c3297404f1e2925141d747fcced3cee86564 100644
--- a/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62l-wakeup.dtsi
@@ -81,7 +81,7 @@ wkup_i2c0: i2c@2b200000 {
 		status = "disabled";
 	};
 
-	target-module@2b300050 {
+	wkup_uart0_target: target-module@2b300050 {
 		compatible = "ti,sysc-omap2", "ti,sysc";
 		reg = <0x00 0x2b300050 0x00 0x4>,
 		      <0x00 0x2b300054 0x00 0x4>,

-- 
2.34.1


