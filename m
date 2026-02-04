Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738B2EA7946
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 21:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pt1t1C4PBNDVYercjzNOwp3rSTmOnj3kdmQ1UOGoMfg=; b=P1YQyXuTi7deUX8ZioR9HimjOL
	ShehF0UztfSE6PQ7ODc+zzcJdIa6mOztxRptSfiNInCTWa9ucozwmJAFbDT9r1ny9DtCau0DtFJ9/
	BldZIZ5eUVaVq6+SpQmb5kEtbR23vNOviKtjIeJG5xKlnwrqlav4QTVE0jtL555NhWg+8M9UKtHAk
	orUpTAGXeyenlpYttb1DeEWcgaJx7y2l1MXR9no9fgvuy7Xq5N2N48osI6tNXBzHukqb26+H/dcpt
	Z07s07HWO4clvAXYknEb14JoNj06wjP78gDbJrFLwYvsULy23aoyjYLC83TJV1QAIEeuXr3GiBSsP
	HVwQAFuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkq1-000000097Ew-45Xr;
	Wed, 04 Feb 2026 21:55:06 +0000
Received: from mail-eastusazon11012044.outbound.protection.outlook.com ([52.101.53.44] helo=BL0PR03CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnkpz-000000097Ea-10U9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 21:55:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dimqL4Uu5WWN8kjbCio8bVEE0g5xKIHmG4n8DOXS9M+Nj67RSOGeU78kiJlvJMghQhh61dLZPCw2J3EFhDgSTaKWLAr9EMVPegSrSGqBVqBGcRV6EhyWIn7PzA9w+ZhgvKRU0SdbEufjkr436j74iLqLSe27x3uK86ik6nfw/0kC7eYP4WXhAN45Y1re9+2vDyoQ4w2betGLltum58iMVgWnzvCasVsEv7J+DHJ7sSLaMD5TUOjvjrWmdpf3k5Ln2269t8ac6064rv53XKSdgZsxChPVp6PGqwV8ZEK3+3JN7whH3O+gPBAKbtZcQ4q+CZ/+N/5gV7O+4CF/wRKXsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pt1t1C4PBNDVYercjzNOwp3rSTmOnj3kdmQ1UOGoMfg=;
 b=mqSe/NdAuwq/hv1Bn0z820kOmB1nx6lp09NHqvFOOHLTLv+vQCzHPBPyjSZDwE90E01yD8Vj2da7geMUT+IQLN3+LHanOt40/hf408GP3iRCg+R/vX1yy+Pu773deYdQojMzpm3DSrjkUSW08rHlvbA/0KXE3jeyfiBznW9ottSayM8FGLTFLtCGpvss3ZJ5BnP9l15VZihqwIUFQp/wlcB6mmuRz8R6jj1MjviSp4qOhDyLo4hx7hq8eweH7ZtDdjEaWHm9ULyKsP6QoZ9xCaXUyaIYHZl8ll1gPhO2TS5UvUxvSEgInUE3BZbJd9lMUr6yYE7eGuXdiw2McZ3eNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pt1t1C4PBNDVYercjzNOwp3rSTmOnj3kdmQ1UOGoMfg=;
 b=rRTqPvFcxuZFGuR/HRv5/CKl+cY9js7XfElFnUjNLL7Ro/Y0y8kWmAcrRt62yt8vvU/8nHRKiiJGnL5D1s0/cOu2llkiFZrDeGlEfVcbGqfAIi6iPJ6y0qisGmALe/3PjHWxX17uA3kMjtBfIscd95U4sLCUtwAGc8mBZiQsycQ=
Received: from DS7PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:3b5::32)
 by SJ5PPFE654FA166.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7da) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Wed, 4 Feb
 2026 21:54:57 +0000
Received: from DS1PEPF00017097.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::7d) by DS7PR03CA0057.outlook.office365.com
 (2603:10b6:5:3b5::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.12 via Frontend Transport; Wed,
 4 Feb 2026 21:54:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017097.mail.protection.outlook.com (10.167.18.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 21:54:55 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 15:54:52 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 15:54:51 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 15:54:51 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614Lsp2w2249958;
	Wed, 4 Feb 2026 15:54:51 -0600
Message-ID: <25ced9af-b103-4cd3-9b31-42b188fcad60@ti.com>
Date: Wed, 4 Feb 2026 15:54:51 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] soc: ti: k3-socinfo: Add support for AM62P variants
 via NVMEM
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260204213746.2589028-1-jm@ti.com>
 <20260204213746.2589028-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260204213746.2589028-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017097:EE_|SJ5PPFE654FA166:EE_
X-MS-Office365-Filtering-Correlation-Id: 50a960b4-2e1c-40ad-5632-08de6438087c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlR4YnRJS0E0ZjYycXJodGphL1NZSXZKOVc1Y3R0VXgwZTJEcTNia29HUG1R?=
 =?utf-8?B?SjdYclpkaHVVb3FvekMvN2Z3YjRhc1p2OW51bmwyT2NEUFFZUmhhdlFGdW5M?=
 =?utf-8?B?bnh2RnQrUkVxNVdhNk4yWmRmaWZQOFRVc2E3eDVzWHNPT1V1UXVZRlp6M1Rz?=
 =?utf-8?B?Yy9kS3RxV3FQcjNoQmg5VC9XdmlUSWZhdElwK3RUbzFEem10YnhiYnJnOHZE?=
 =?utf-8?B?Q1JMVTBGdDJHc3dtV0VJemR4MThuTFRoVmhWcGRkekdvbW5QSkVydTJIUHJR?=
 =?utf-8?B?YVdJSkhMdXU1NmYvRGxhK1htaTJ5emxqbkdacWE4RER3cHFncEFkS0cyNXpO?=
 =?utf-8?B?NDlCdkdlVkRPNXdEU3lDUzRZZGV2Z21RZkUyUktiMWZadmhkRmNZMitXS0Uv?=
 =?utf-8?B?V1M0ZEk5UlYrVEFzUTNyUTlSTVRCOVY2MDYwNS9rdDZRalZZMGR1VXVkcDcv?=
 =?utf-8?B?RFF5SElhTGxyYWcrYldJdXp0Y0hVOFBKSnpaLzVYRHhWYVpCZlg1OG51UDkr?=
 =?utf-8?B?ZW1HQWc3UkFZVUFlcjdTTHphR21Nbk1nSGx2cGdKdDdmNC9pak1hblZhb0Q5?=
 =?utf-8?B?eS9aM2U5N0VGNzJsbHBNM2VnSmdUd1FBSzczdDhGM2lNcGw2ZjY0a1MweGRU?=
 =?utf-8?B?T1dWNmxwaTZzbkkrZllWQ0NhMFB2YW5iK1N1SHhVSGRuWWFwYTRtZm01TVpE?=
 =?utf-8?B?ODFFRWw2TFR3NWUwQnFHWWJCRlpXQXB0TmZldE9ReWJ2bzZ5VWVvUjV3RVR6?=
 =?utf-8?B?SUVXNmVnTk9oNWVVTjJoZk9CcmJldFhtV0YvbXRhek1waDFJWkFxSTd2dEpx?=
 =?utf-8?B?ZkpTNS8xRHA4Zkk3Nk5ZQ3MvQktnenlwQTVCbGkwNStCcGdhQ24zMkR2TVNo?=
 =?utf-8?B?MFF5QXpWOHlEYldWS2NoeHVqZmk2VEFGZXphdkJlNG9DQ0ZZbHJEQnp4V2ZJ?=
 =?utf-8?B?OHFtaXlSajJYbDFOSVdLNlpwSlhIeW1lZExmMWUxWUJveDVCL05BeHdzVC81?=
 =?utf-8?B?VHF6cGRnbWdZQ0ZETlU4WTlkQi9oL1ZBVFBTb3dVTXRIY25IV24xanMrY2xo?=
 =?utf-8?B?b3diVGF0aEZuU1Jqb3pmVFdZUUhnNlVTWG9ONHZhK0w1UmZIQkhRQmk1REha?=
 =?utf-8?B?TEVoUGVBL0kxYkZ2OVZKbU1BSVMrb2FsUVhxOUo0aGhLVzdtV1NGQzRWUkUv?=
 =?utf-8?B?TXlKWDIzTnpBNWo1bWZWZ2hVVTk2YS9vRjZsb0JCdWxmSTVhUi9adGV5dGp5?=
 =?utf-8?B?SVd2c1pXY3ArM0J6VEt5dlFja1ZJWjEzUEc4Qlp3d0wwTWcxQjhPRGRSZnow?=
 =?utf-8?B?U1RLNVpkZmNqT0s1SC83b1hUb2lqWFd6T3F2eCsvZStEbWJlL2F0SzBmMTNU?=
 =?utf-8?B?UkwxVVo3RHFXK1U4QUdLOFBTTWhaeGNld0w1ZTJzSzRyV2xKWVU3cjRZU3BS?=
 =?utf-8?B?WHJCaWhEVDZ6TkM5UW5jSDRvbVI0UXU5VGg4ZkNla1JtMG5uOU0xa2kxd2sz?=
 =?utf-8?B?eC9VM0J5b2s2NUN0RjNrQktxOGxhMzZmVlltUmVxVUt6bzZQL0Ivai9BaTFW?=
 =?utf-8?B?Wk5vMFRYeFYwVisyRGthMURyN3hKVjdnZThzOHorRTY0SXFVMTNldVdKSlBR?=
 =?utf-8?B?YytGZ2I2T2JncFY5enNLV094OW9Ka3J4c2hTUHBKQXUyS0hKU1MwcmFFd2Qz?=
 =?utf-8?B?amd2T3VZdXpZUUlyYTJLNVpNbEZ1ZXpBbzgyeDFNZm1CL2dPeVpSemhyZ1RJ?=
 =?utf-8?B?d2NFV25FZU1XbGR5ZHFJQlNOR3JLNG8rdjJYb3YrQXBHZy95NDlraUJPQ3Mz?=
 =?utf-8?B?NHJGSDlnQVFlT1A2MlBzVWRITkFvbXpMMjdWT0pwQ0FBQWtCYjJhVTRLU1du?=
 =?utf-8?B?MDNEU0E2Zm84MThtektlayt4aVhtR2NOR0xrcmJFU00yS3plajBxS3JPazVy?=
 =?utf-8?B?dFAyQXN1WWpvS01JcVZlSlBkT3VFcm15Q3JqMGUyajlOYjNIUm5hUEFyeW1j?=
 =?utf-8?B?aFp6cHI4RFhYd2xCTGVCRE9DQVJIb2Y4R3NPUElMRjN3dFkySkZXdWxlQVJ6?=
 =?utf-8?B?WkZVbFkrTG82eElYVXVwekI5d2JmVlFJejVFVWxwY0IxYVZ2TnBDQVpDRDB5?=
 =?utf-8?B?NjNtODk4SmQ2SWhPR1ZtU3RuZkdMVjY0TUcwR1VYTThkM0wwUXhkQ0lNWGdB?=
 =?utf-8?Q?gxWlC9VZOyywZytn2zpCmZYOSTJjDN/LJ6jqmfjTmCGT?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tcvwNLVEzaFHQCB6jjm9k2OSRvtE9V6Si9VJoFUDJflHogGOeKvUy1QJbFeQoRYAGxa7t4GfhM93KWVQBie23p9fioRMAkkcDSjPEvF1iAN88gho2GwOAan64RM0BOK9hYZxKRZJ7tbmyiY7SRYekLkSXQ/pU8PHz/iHQZY5ee5pK47QO+nEsZpKfLR/kod7GhYBINhOabttyTa1HWyILDh1D0chUEnSlmo3HW/AheEBoaJrTgQWY5QRKL9uVS11izv5oTRmW1b4jDi7o+EX3ES7lCL9bycYybDkcA7Xev/+V+uROACe4fQcfg8x2JsOE2j6i6o+4aYsJiAIr6HpL6Gh6MXoqTdIZwsOLBUzDh6yWPM9KnKtQn4m5xWuZvmdue9J0W5brg7/8YctugQNFaVcRw32rYOdmBxKpfPiwjq5VTQYm/CrzKXWM7mSlnaw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 21:54:55.5436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50a960b4-2e1c-40ad-5632-08de6438087c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017097.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE654FA166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_135503_289415_40E3F4C9 
X-CRM114-Status: GOOD (  24.50  )
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

On 2/4/26 3:37 PM, Judith Mendez wrote:
> Add support for detecting AM62P silicon revisions.
> 
> On AM62P, silicon revision is discovered with GP_SW1 register instead
> of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
> gpsw-efuse nvmem provider to determine SoC revision.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
>   drivers/soc/ti/k3-socinfo.c | 48 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 45 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 42275cb5ba1c8..4b6947a9ceb4d 100644
> --- a/drivers/soc/ti/k3-socinfo.c
> +++ b/drivers/soc/ti/k3-socinfo.c
> @@ -6,6 +6,7 @@
>    */
>   
>   #include <linux/mfd/syscon.h>
> +#include <linux/nvmem-consumer.h>
>   #include <linux/of.h>
>   #include <linux/of_address.h>
>   #include <linux/regmap.h>
> @@ -25,6 +26,9 @@
>   #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT	(28)
>   #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK	GENMASK(31, 28)
>   
> +#define GP_SW1_VALID_BIT			BIT(4)
> +#define GP_SW1_ADR_MASK			GENMASK(3, 0)
> +
>   #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT	(12)
>   #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK		GENMASK(27, 12)
>   
> @@ -70,6 +74,29 @@ static const char * const am62lx_rev_string_map[] = {
>   	"1.0", "1.1",
>   };
>   
> +static const char * const am62p_gpsw_rev_string_map[] = {
> +	"1.0", "1.1", "1.2",
> +};
> +
> +static int
> +k3_chipinfo_get_gpsw_variant(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 gpsw_val, adr_val = 0;
> +	int ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
> +	if (ret)
> +		return ret;
> +
> +	if (!(gpsw_val & GP_SW1_VALID_BIT))
> +		return 0;

Return -1 here so you will get the warning message about setting default SR1.0.

> +
> +	adr_val = gpsw_val & GP_SW1_ADR_MASK;
> +
> +	return adr_val;

Merge the above two lines,

return gpsw_val & GP_SW1_ADR_MASK;

Or maybe try using FIELD_GET() or similar if you are feeling fancy.

> +}
> +
>   static int
>   k3_chipinfo_partno_to_names(unsigned int partno,
>   			    struct soc_device_attribute *soc_dev_attr)
> @@ -86,9 +113,11 @@ k3_chipinfo_partno_to_names(unsigned int partno,
>   }
>   
>   static int
> -k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
> -			  struct soc_device_attribute *soc_dev_attr)
> +k3_chipinfo_variant_to_sr(struct platform_device *pdev, unsigned int partno,

You pass in the platform_device struct pointer, but only ever use the
->dev member, just pass in the "dev" device pointer.

Otherwise LGTM

Andrew

> +			  unsigned int variant, struct soc_device_attribute *soc_dev_attr)
>   {
> +	int gpsw_variant = 0;
> +
>   	switch (partno) {
>   	case JTAG_ID_PARTNO_J721E:
>   		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
> @@ -102,6 +131,19 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
>   						   am62lx_rev_string_map[variant]);
>   		break;
> +	case JTAG_ID_PARTNO_AM62PX:
> +		/* Check GP_SW1 for silicon revision */
> +		gpsw_variant = k3_chipinfo_get_gpsw_variant(pdev);
> +		if (gpsw_variant == -EPROBE_DEFER)
> +			return gpsw_variant;
> +		if (gpsw_variant < 0 || gpsw_variant >= ARRAY_SIZE(am62p_gpsw_rev_string_map)) {
> +			dev_warn(&pdev->dev, "Failed to get silicon variant (%d), set SR1.0\n",
> +				 gpsw_variant);
> +			gpsw_variant = 0;
> +		}
> +		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
> +						   am62p_gpsw_rev_string_map[gpsw_variant]);
> +		break;
>   	default:
>   		variant++;
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%x.0",
> @@ -173,7 +215,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> -	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
> +	ret = k3_chipinfo_variant_to_sr(pdev, partno_id, variant, soc_dev_attr);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
>   		goto err;


