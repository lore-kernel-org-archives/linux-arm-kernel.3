Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6A8CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiVUUG53v5owb+IvoGi1anZofUOSRdEsdktvuEF9lFk=; b=GQl8hSdidtpfnt6MAErQeZaHZV
	2B6UhpS4EDwz0Ozkx6ScORln+M/dPysryr8kalReJartieAgPklg3cKutsjcCmxBHNTUbRJ+Xn+Lh
	ACbZcNtXKiTPi1PG2y6rnjfM6qUjBgZzZWfMXRTCPwk5t9eC8DbrsVxMDTHvaHrr5pTr3RTnFP+G3
	3KPq6ZF0lpDUhdO97ino0yEVAEK7S/qpG+DfRW1B1x8Yo3IZIwa7ltZ8w9zBtpHcMU47rs+XUGXRS
	Tv/xTUasVNJFfQK5HMinXDVcMpYzNDtQUOoEe18p4Xwxj+YzMkop0mrWsJFeRcmFljFhY/wIf1/D2
	0m9eZxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGC2-0000000Bn54-33S8;
	Tue, 04 Nov 2025 12:31:22 +0000
Received: from mail-westcentralusazon11010045.outbound.protection.outlook.com ([40.93.198.45] helo=CY7PR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGBz-0000000Bn3N-3K1j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:31:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qNFq9PQ8JnJmSDTC0r7vr2o77594EODH8u7d3JDcPdcwRMgHoFoBP15LGBHRlcoP+ns1m6Tuc+6xDKQUrsPBj5hGD2Tf5UlZOCS0F0SZzSIiz2CfGE3wO2SE2yGejNrW1uk3yNAn2tStA0OSd+puvwXTOQUhroGRyEWIlZo34l+up0/+FgHJwWOG7gfMkHDWD5xmr5QFtfHJUs7rVpgOCntfn3MVsBv5Kociezd8JhLh3m57VWvy+3dzPThdqBgp9P2DWT/vEY0IQd7hZCEwCwzsHt19CMkr0+2xBabzPf+A3rZgI7+1pyCPE5LLeb0cKliGMYlDLsH4LRjitUpyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WiVUUG53v5owb+IvoGi1anZofUOSRdEsdktvuEF9lFk=;
 b=G8TPzj5DRJbb+Lw2OHH8/BTmX7Rd8skIEfsQjDYXV3xu559/DW9RAk87K+tO0iVHEx9hbEX8VlNErN7lFmQqDHgutxWu6aNlGCSRWHqgIhl3yJu57GqBW7e7m1KQ68ExHAaYHdRVz58UJQjOzc3EeBeYRpwo9yRu96WcjsE2mbGYNkk1x2XyyH0FoJmXDFvEGUu5gbdPPW9mlueiLSwadMmeGDS9eMfLNBdY7ncaQqC6a13IZ4rgklF30xMn2SYWpskDUAxb/1FLRVqL3IJXkjCM1Epe9Fpb1eQLcTghvvPAnp4sTNGuYtMirpzxVTpWOtHJD1hQaR/aKDM+BSqxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WiVUUG53v5owb+IvoGi1anZofUOSRdEsdktvuEF9lFk=;
 b=bBkgrlBlT9xxjnrM0W1SFp1vGcP6CnPzn0cz89vpbqAq5yH8ME97J5aNFFHf4LID9l/xE4pjRF6DBEkFAtW2COLpp3rzMZQzB7kdSOVdHqT56Goc0GyaC7sEHSWsrvlscLKTlX+ZHvrw8iICigSGh9goWz+GlL+lUd5ueAz+JUw=
Received: from SJ0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:a03:33b::32)
 by MW4PR10MB6486.namprd10.prod.outlook.com (2603:10b6:303:213::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 12:31:14 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:33b:cafe::b2) by SJ0PR05CA0027.outlook.office365.com
 (2603:10b6:a03:33b::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.7 via Frontend Transport; Tue, 4
 Nov 2025 12:31:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 12:31:12 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 06:31:03 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 4 Nov
 2025 06:31:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 4 Nov 2025 06:31:03 -0600
Received: from [172.24.233.14] (shark.dhcp.ti.com [172.24.233.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5A4CUwni1903997;
	Tue, 4 Nov 2025 06:30:59 -0600
Message-ID: <6de227bc-af06-491a-97f2-800b7523ea42@ti.com>
Date: Tue, 4 Nov 2025 18:00:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
To: Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Sudeep
 Holla" <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>,
	Brian Masney <bmasney@redhat.com>, Vignesh R <vigneshr@ti.com>
CC: Dan Carpenter <dan.carpenter@linaro.org>, Geert Uytterhoeven
	<geert@linux-m68k.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20251009-clk-ssc-v5-1-v5-0-d6447d76171e@nxp.com>
 <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
Content-Language: en-US
From: Sebin Francis <sebin.francis@ti.com>
In-Reply-To: <20251009-clk-ssc-v5-1-v5-6-d6447d76171e@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MW4PR10MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 38c19717-11c4-4be0-de74-08de1b9e0a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|36860700013|34020700016|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cWlHMVpabVhIWnR0Umw5bjlRNkxoalBaTi92clZMQVYrakRIZXRvZzBTc1cv?=
 =?utf-8?B?S2REOEtEZHc2a05WQkFVZ01GOG9lL3htWUlZUHZ4RUh5RU5RSzQ1ZzVIR29N?=
 =?utf-8?B?Nmt3V1p1VS9mRW5hUXV5Q1hWbVdYQmZBRkdjMEh6d1pHcVhTYTVLaklWKzhB?=
 =?utf-8?B?WndBbGhZWXdsUHVITEtYZ3J1VldyMktzMnQyMGFrdktKbGFuUWVsMmFpTzk2?=
 =?utf-8?B?b2Jna1dmbnlzSlJZRUJ4RE5MTFBIQWw5WUhVa0w3WjBjQ3ZaWkZOcTVqSy93?=
 =?utf-8?B?K09tVk1ESmlJemZ5QkNVWWRrL2pVa3gyU0VBZzYvMEpVNjN3ZGk4ckdmTUlr?=
 =?utf-8?B?Si9JcTBkTDh0QmI4cm9FNUVtYVIvUHM1LzFicHdRYU94bnRJelFxQ0ZVUG9D?=
 =?utf-8?B?a0lNQTBRS21ncW9XK2haSFJnM3hnWGZWdzNYWEdkNkdVVklWaXJrZ05xd0hl?=
 =?utf-8?B?aG5Cb2drM0l0K0RmemtxdjJRalFJTG9XSzEwZzgyalp3Rm1HOE5raHRpaWdB?=
 =?utf-8?B?QlpLaFFpbG1ua0RmbmZESHdOOEsxc0gvbUdlY3huT0JFbTNzMlo1ZldKMjg0?=
 =?utf-8?B?cHVSdU50bWdsalZRRWdielBjUHcrWU9UM2ZoRXB3eFpYUTlCc0VxR2Y2RkRH?=
 =?utf-8?B?dVZwajBkQ3RMblRVa3d3SjJENTRJOWZ6ZTlENjBRdjVJdFl1SzhIL0tTUk1t?=
 =?utf-8?B?K1RtbGdmOGkrRTNEVlVpM0lzbUpKYURyd0pBNGprYXhBMmRzN3l3bk5hZkRz?=
 =?utf-8?B?K3dBbWYvSThoUFl3UlNIZFRycHFzUlQyZ2IrU3Zmb0l1VmlCR2h1T0JJSE80?=
 =?utf-8?B?KytCeWlXVjlRTllMcHlWVXZLaXVGWXFBVGdwS2U1bUNGVndVMTFYbkJWbUJy?=
 =?utf-8?B?WGo3Q1BBUUhGayszZUxRQmQ3NXVYWmFobytNQXNZOUVlVzVPNVFOTDIrd1dr?=
 =?utf-8?B?OFlOaklSL1VXdDZZd0tkNmRYdHYwZ0lFOWFsRGRxY3BDMitDVnY3Z2NEQ3RL?=
 =?utf-8?B?dTVLTTNCTEYzRDZiRDZBR3BodENyTUpVckxtY05OSm83OVVKQ2RXUjhPay80?=
 =?utf-8?B?TVhQNGcxckRYSHAvcVFTWE9TMW1JMEViTDhRMmMrUnkrRHpybGxBZmhlUTFY?=
 =?utf-8?B?bGJoMDIxdEhLYmVpQ0dQTXM5dnZRK2dVSllCMkJtUkhDWm1rMWJpUVI1MDh0?=
 =?utf-8?B?R3JRTEV1RjFxZ3ZOYUhQUkgrR3RicjBSWmxRditDbEJhQ0NkZlRkeVl5RWlV?=
 =?utf-8?B?WkZRZFRpRjkwb3lkakxxSXhaSDRjMnF6S1VJYnNkbzYxRDE0cmNENXhmeTdL?=
 =?utf-8?B?RkN0cWpjS2dSL3RHaWJLOWtIRWtWRWk4ai9hQ2NIdEh5TzdQMTFCM2tEcHc2?=
 =?utf-8?B?eitPSzA0K1NlUXRXMGhEWmt4Nkc0d0hsN3JOTUIwMVFTZ1JIaXBla0dwbEJC?=
 =?utf-8?B?UGNEYWtnOStZRG1hS1RUb3RzOTlQOG0rbDlPVGl5d1ZldDhTZjhOSkFtdzBH?=
 =?utf-8?B?K213UGZ6d3QzRzdkUWFVQXlKMG93VXN3dFI2SkVtQ05mK1RvNG9yQ3Rha2dL?=
 =?utf-8?B?MGkwbUJmRGtvWFlIS0wzcXB5NklmTDQ4VTREazZYQVV5WElGNjZEZTY0OS9t?=
 =?utf-8?B?WURRY1BXNTduZTNHaW4xMnNNcnFtdlk2bElWWG9PSXJoQlIrbzUvV0VyeHE4?=
 =?utf-8?B?QnNVQW13RUViYm50b0RlM2NucVNma2xrNUZtaVZROHJHZThPUXNYRmY3OHRs?=
 =?utf-8?B?SVFkWXlBN3JjYlFhT0t4aUZhZ0cyODE2RHU3N084VW9TSWc0cGlBd3oxL0Vh?=
 =?utf-8?B?SmpIOURGeEhaRFhGbDJxSnpiTkRGTTdwYy9hV1BOSXdtMHNYclNqOGw2SStW?=
 =?utf-8?B?ZFV1T0txZCs5M2dWRmVweTlKS2JLR2dWQS9tbUtQMDczRDhrMVR5OGNvSHky?=
 =?utf-8?B?eVpjOHhXTVljakxReUJtODdTWlZMK1JNVzFYUVlkeWNseVRIUHpON3RKTUds?=
 =?utf-8?B?bW5RRTVuUm9xZzBPcXpKV1F2RVdoNGJVMDhpNm5oVC9DWjY1dEpOcWZBN2Q4?=
 =?utf-8?B?SUJxcnowd1QzNWVhamlVSG9JdC96b2hnZ3g5QSsvTHhwZnVoV09QNEpOekZz?=
 =?utf-8?Q?yPnTdPYk7UI4yniJlIN2Gfll/?=
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(34020700016)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 12:31:12.6883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38c19717-11c4-4be0-de74-08de1b9e0a7a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6486
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_043120_023776_5730CC5E 
X-CRM114-Status: GOOD (  17.48  )
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

Hi Peng,

On 09/10/25 09:18, Peng Fan wrote:
>   - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
>     for the SCMI clock driver, allows clean integration of vendor-specific
>     features without impacting the core SCMI clock driver logic.
>   - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related declarations.
>   - Initialize OEM extensions via 'scmi_clk_oem_init()'.
>   - Support querying OEM-specific features and setting spread spectrum.
>   - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for the patch. I only have a minor comment, otherwise the patch 
looks good.

[...]

> +
> +int scmi_clk_oem_init(struct scmi_device *sdev)
> +{
> +	const struct scmi_handle *handle = sdev->handle;
> +	int i, size = ARRAY_SIZE(info);
> +
> +	for (i = 0; i < size; i++) {
> +		if (strcmp(handle->version->vendor_id, SCMI_IMX_VENDOR) ||
> +		    strcmp(handle->version->sub_vendor_id, SCMI_IMX_SUBVENDOR))
> +			continue;
> +		if (info[i].compatible &&
> +		    !of_machine_is_compatible(info[i].compatible))
> +			continue;
> +
> +		break;
> +	}
> +
> +	if (i < size)
> +		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
> +
> +	return 0;
> +}

This above logic is tailor made for IMX is it possible to make it generic?

> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -14,6 +14,8 @@
>   #include <linux/scmi_protocol.h>
>   #include <asm/div64.h>
>   
> +#include "clk-scmi.h"

[...]


Thanks
Sebin

