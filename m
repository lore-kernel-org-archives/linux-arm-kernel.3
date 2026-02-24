Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6276AEFB818
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8S5X/HWDo2+he06agu2qBUv7fUv5LqhtaWOEaIwYA7o=; b=KIlBmcxyA0i4m8WzhRtnYl2Zdd
	vw+BU1iysyweWvt2ZOu/VB0TI7SA2Wa5DvGPA5GMz1Oi1UQeunCxKFtfesIf2Jm3Rcm/lFzGqm0Zb
	K1M7y53XBVn+/hdT+ZpaFZLigDjtlVyexdPXp1X7BWtgsN8Z3IdQ7bpuY/ekvX34XV6d6thP41DA/
	FKe3o06drQDiv2Kl08mW7ZPUdRD8GsDGZt7/x1bvKqGrrMqyfiHYTny2MhMofjAvJ9hc0vf/4z5Uf
	naWMEKXEcFxK5KyqDjM6BTLHzq6hYGPJ+b5qmFn/pmo2JABy26cDDa2hUiPfHzebItLbVJDg4F/cu
	M2YT7MMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoNh-00000001iDE-3Lpi;
	Tue, 24 Feb 2026 09:07:01 +0000
Received: from mail-westeuropeazon11013046.outbound.protection.outlook.com ([52.101.72.46] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoNf-00000001iCY-0zn1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQJDCH89C0yyKwkHoYgDUhGvU7t+D5PS0VsH5FgUkZMljv8CwxfvEqbXxvswcQvj5KT9OJc0zN2HV8FkB5YvUA/i67GU0mVjUORzVykV7VUMiVhbMrACbOPamMq6Yl9zHdbKH2R5aoJe5VmG9iYLbaqEnkdAvx8NNl3fnsvkzluPB89O91tAwghhcil0xOPm+Vpe3WT0DTevS0Z6dykw6pLmhGqm8VKvNXfU8EBgAqoIb/vYL38YmQ0a2GGTEksAgZLcC8rBchgsswkYh97KOBfwN8C+NgCqAQ2k0D/HceKCEYmBBF2sDSN1nO5ir1dRIUUtZ394VH9D5PiM+5An5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S5X/HWDo2+he06agu2qBUv7fUv5LqhtaWOEaIwYA7o=;
 b=SsnjmtEUxjTt6sfp60a/aI0MFDBhdVJA1Ec8TJx4LKZaztvstffzVOLhoT+eQqrzB745RZKJM3uWt24eI2QL0c9X+l2xXJzIEqAg1nV9GRY9G5XhCequAs50bHeQVAaZnCrRRqhRR0BXTCF/unTh8cXM1WFM8YqxQnckETvp2r3N0TqVHPZ9iyrrq/8BF/VWaVe81d6uguY+GLZsLepI2PL+hIpVlZd1K2p7Jjdjb4/j1hiFK0JFr4bcbNhR23RvxWqm+OTKB3L295BwZjA6s9NljivRFl0UnleAg074+AJBE23X8LF6jp2umVpzuioES5EGXQatLkqfoDB90mXQhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=linux.dev smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S5X/HWDo2+he06agu2qBUv7fUv5LqhtaWOEaIwYA7o=;
 b=ESO7V7J7ngJMWsrRE45vI09yCTvP7I4UsAKSmjVwvXtgh0t3w+Fl2bSDf+t63U4YZoWynwxiNJZPZCQx53Zxsul7Qkad0pf/UgbgM6nP98xWJDaGoga+oSOTk2aREiAYUh04FoAGlLSKM+5i/tRkM3VCV+oGmmPMEpZ0nfexGhrK8nDucZ5i4CM1viq+UZDuivrO7f5BTNPTh88YtM83Baq5nPj0+55lQasgLmoY52TfshNknkCW3IuOyyVsDQmKEsHun9wUltoytYfOqffkl350IiPBD0l8Mb6IEVQU71k4sqZl2LyOh/dluJ/NrZSWPWfvC08wuBtJ0WDyP3zMvQ==
Received: from AS9PR06CA0278.eurprd06.prod.outlook.com (2603:10a6:20b:45a::18)
 by DU0PR10MB5653.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 09:06:49 +0000
Received: from AM3PEPF0000A799.eurprd04.prod.outlook.com
 (2603:10a6:20b:45a:cafe::7a) by AS9PR06CA0278.outlook.office365.com
 (2603:10a6:20b:45a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 09:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM3PEPF0000A799.mail.protection.outlook.com (10.167.16.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 09:06:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:08:55 +0100
Received: from [10.48.86.212] (10.48.86.212) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 24 Feb
 2026 10:06:48 +0100
Message-ID: <17e2aa14-f74c-479c-b471-ed677c302608@foss.st.com>
Date: Tue, 24 Feb 2026 10:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: rifsc: Replace snprintf("%s") with strscpy
To: Thorsten Blum <thorsten.blum@linux.dev>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260223211212.344855-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>
In-Reply-To: <20260223211212.344855-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.212]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A799:EE_|DU0PR10MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a655fe-832a-4fa5-bd64-08de73840b16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUgyR0E0RExYclYvQU51TlVMMC9uajJPU2hobHJVOWhDeWdwUmdYKzdnc3lu?=
 =?utf-8?B?eE16MHcrOFJzVDRvdTNDTm93N2xhaCtsajYyRFVzaVJCRDJtR0xJTFovMFd6?=
 =?utf-8?B?RU1pT0pBeGVxTkRIK1JxeHZ4eFhyWWREZi8zSGh2SnVWMXRxcHVpbWtKTWVC?=
 =?utf-8?B?RjJXdkhoa3haWnZrUE5HR2RrWUFaaDNXVDV5K2JPbGFwSnoyeEQrRE4xVGpq?=
 =?utf-8?B?SWdSeWhKbC9MNVJlK2FzdVcza0hQTm9CeGwxblE2N293N0dBNzUrSklPV0pQ?=
 =?utf-8?B?RW02Nlk4NmJ5VzhrMEZyY3JzdW5Yc0NUMi80OEZVYzlpcVJOODVnQng1aEk5?=
 =?utf-8?B?cjh0cXZxTll1RlBlWm9WR2ZNT0RPTDlwKytqeCs4ZjlGQ1V3dmdaS1p6WHNK?=
 =?utf-8?B?YlltYXp4aDhJRStQVDM4SkNUK3JCWElwd0pabjFQcEI0TmVYdVlpRmkzUjg4?=
 =?utf-8?B?QTU4ZXJETGp6eWIwRzcreCtQWEFoMjMwcXVGNkdKSlh4TlVuMTFSUFNsNmsx?=
 =?utf-8?B?N0V6ZVNBTVNtVlZsYzlPSkdRVkoxVUFLMFFMWHEybkFhSXlzMCszVzBuVEg4?=
 =?utf-8?B?eXFwdTRrRXFDa251TllnTnZHZkFPSFgyQ01vdVZGK20wMTlJc2g2bWNEOXJF?=
 =?utf-8?B?UDlHbFlNQUpLTWlJOUt2R1VLSytiaU42QjdCNWdGTHNOcUpXaDN1aWhvUHBE?=
 =?utf-8?B?dFF0Z0I0UWZTalFvWWVQaXE4K3J5T1hublVCYjVqZmhXTDg2U0Q0NU5CS2Zq?=
 =?utf-8?B?QjJzN1FqZDQ0ZGVVQnErRVAwYmNBckpmM01UUFAyOUJyNHl6anpqOXhQaHdW?=
 =?utf-8?B?dlU1N05Bb0xRK1F6b05Udi9MNmhKd1QzZnk5ZVpvUFpBOEhuSU9WUXpMeldN?=
 =?utf-8?B?cEU1bHQzTUZ0TUFGVVdyOWcvbzBvRmsxL3hmVG5NeFNzMlQ2QllJZnBWRytJ?=
 =?utf-8?B?ZDdKcmlPODVqU2oxdCt2eVJGd1lPaTEvekE5VnExc2t5UG1KR09oeCtlb3F6?=
 =?utf-8?B?M1N0eTQwcG10MVJvQlBrL3RjZFJ3bnNQcWVoZVZjZjEwSndwMkt4VXlpSDk3?=
 =?utf-8?B?U0ZGTzZCK2dWd1RoWUx1ZlhWaDRLdEVlSTFrNFZIVEZIeGZwdzNEOVdnSFJD?=
 =?utf-8?B?dFM4SVpSa1MyZWNRa1hhSEVlMmExZVk0cUdZZmg0dk5PY3o4TFJkd1pvRk8w?=
 =?utf-8?B?dFRYdUhpMVJIakVyVWE0RCtZTnFNdERJNGFQVkNqS3B4NzhJRWdPN084TjAr?=
 =?utf-8?B?cHNtb29KRUdNRExrVFhpZWZ5U1JQOGpyQXNyWEVqSVVQdDgxZDM0MHFyekEr?=
 =?utf-8?B?Y0xnZWRUTFM1Z1NJMk1NMkF2TUhzbkpnUUFXWDFxTk01ZkdOWHFGamRLRmo2?=
 =?utf-8?B?V0tZVjdEcGFXU3NDZjBxSXdPT3MzaDMwNnZDUUQ2VjNmS213cXNJdHZsNTRV?=
 =?utf-8?B?K2tRUnlsVXlvZWpyR2M0NFEvaCtDRlNUamczSUt6dkdTSGFXU2RtMVZSQlgw?=
 =?utf-8?B?WFdjaURwWCtkcU1KdDZGbDgyR09oODNiZEg0Ukl0Z0IrQzRMY1I0U2tuZWM3?=
 =?utf-8?B?cTBPRENObEdtZXVyWk0zb3RNYlNWb0xUeUIzbkRlWUg2aThNQ2JoK0MvYVNq?=
 =?utf-8?B?b2JxUlJUY1U5eGEwdGExNHYzenl0ekhxWVZUYUUvc0hmZkFKQWNlY2xKM29n?=
 =?utf-8?B?L3ZSM0FyMmNNUCtXMThnM0ZjUEhHc3FlaGJ6WmszbmFKODgxRjYvMVFwR0xL?=
 =?utf-8?B?RmVQc0xuL3QyeDVPRUgvMzRFc3dIdWc0U0kvNVNnMlBwMDRBZnNsdzkvZ3BC?=
 =?utf-8?B?R1dNRGwwOHk4VXppR3p6ME1Rb0RFNkQ1MWlmcUxiTHlqVHJ4UThIYXlZOGhN?=
 =?utf-8?B?ODUrSEhIeTlSRFE1OWNLR0M3cWZXazkvQ0VFWFdXU3pCTGZPdzFJUVNRSkdx?=
 =?utf-8?B?akU2d0pZcmJnQ21sY28zNU14NjlYckJ5SzJhNzU1eStnUTFuRzRuQlZFOFpI?=
 =?utf-8?B?Tkk1K1RUcVBGVFpYdXREU1hyVmQwamdjRHpPRnY4UThZeHZvdGpKT1BQQ0Rv?=
 =?utf-8?B?bmxUWmFnbmpmei9GZGNVUzFOS0UzNThoVElyMEM0akJKUVFiZlRMQjhFNkkv?=
 =?utf-8?B?NkRGTW1mdTFvSXZva2dabDB3Nm1tdHpicm1WZjZlcS9HVm05QnJRK0tPczZB?=
 =?utf-8?B?WVRtQW5mSDYxWFNTMFZiVVBlbzRDQ3FvMzdVMmEwTUZzQzcyYzJ3M2pYNFNU?=
 =?utf-8?B?WENGWGtPMjZqOUJxV0oxeUtxUWF3PT0=?=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Pu4bZ84ECkG0QtBPNETbItwBR4lUfI8vzW244R6mxAsT9NqSTU3v5YXLRRd/+CXUXip+/77sqUAdDA5nKcEJ+h7WdFYEh9+d5l2M/jpEs15Xs47VLOq6bKjPVYFKjtj4igWNnY9Oe7pKrlWEruJ42gJmWJqe7iJ0pbI8yTbbNH+3gguleaYCt3NtR4WAts9HYbHP7PUBcOFDmSBSmZbYN/ntmq+QNEUMiTMxg58AGLBrMXC9adEo3B4r96z1ZojoMbgMfGk+Hwub9og2Y2C4VN2+43qAlbr6YKBpulXuCcq5BH5fsK/JO7Vaik3ItFw1R0O/XI+qeL5zHmjBNJF721DnCz9qbsR4uzv9coYFcwbMtly0bGGF8TLlmCYlxiBZm2+mXfbBXpVuQTnze5fOvBcgiVbwQE8xAlx9TVdBOIUuCo0Zh11qGdrD8G5YIZ2D
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:06:49.1273
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a655fe-832a-4fa5-bd64-08de73840b16
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5653
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_010659_418109_B909642F 
X-CRM114-Status: GOOD (  11.79  )
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



On 2/23/26 22:12, Thorsten Blum wrote:
> Replace snprintf("%s", ...) with the faster and more direct strscpy().
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   drivers/bus/stm32_rifsc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/stm32_rifsc.c b/drivers/bus/stm32_rifsc.c
> index debeaf8ea1bd..ba65ad21434b 100644
> --- a/drivers/bus/stm32_rifsc.c
> +++ b/drivers/bus/stm32_rifsc.c
> @@ -15,6 +15,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/string.h>
>   #include <linux/types.h>
>   
>   #include "stm32_firewall.h"
> @@ -450,7 +451,7 @@ static void stm32_rifsc_fill_rimu_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	const struct stm32_rifsc_resources_names *dbg_names = rifsc->res_names;
>   	u32 rimc_attr = readl_relaxed(rifsc->mmio + RIFSC_RIMC_ATTR0 + 0x4 * i);
>   
> -	snprintf(dbg_entry->m_name, sizeof(dbg_entry->m_name), "%s", dbg_names->initiator_names[i]);
> +	strscpy(dbg_entry->m_name, dbg_names->initiator_names[i]);

Hello,

I was expecting a third argument but looking at string.h I
now see it's optional if dst is an array. So:

Acked-by: Gatien Chevallier <gatien.chevallier@foss.st.com>

Thanks,
Gatien

>   	dbg_entry->m_cid = FIELD_GET(RIFSC_RIMC_MCID_MASK, rimc_attr);
>   	dbg_entry->cidsel = rimc_attr & RIFSC_RIMC_CIDSEL;
>   	dbg_entry->m_sec = rimc_attr & RIFSC_RIMC_MSEC;
> @@ -469,8 +470,7 @@ static void stm32_rifsc_fill_dev_dbg_entry(struct rifsc_dbg_private *rifsc,
>   	sec_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_SECCFGR0 + 0x4 * reg_id);
>   	priv_cfgr = readl_relaxed(rifsc->mmio + RIFSC_RISC_PRIVCFGR0 + 0x4 * reg_id);
>   
> -	snprintf(dbg_entry->dev_name, sizeof(dbg_entry->dev_name), "%s",
> -		 dbg_names->device_names[i]);
> +	strscpy(dbg_entry->dev_name, dbg_names->device_names[i]);
>   	dbg_entry->dev_id = i;
>   	dbg_entry->dev_cid_filt_en = cid_cfgr & CIDCFGR_CFEN;
>   	dbg_entry->dev_sem_en = cid_cfgr & CIDCFGR_SEMEN;


