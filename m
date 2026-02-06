Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C594EE6B4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB7NCegdPAVE7LASscEv3nMY2MkDpDQK5Y2G/g89nnU=; b=rp3xNtqegaE/57wkrAueBe+dsA
	aIuqoMFzgGQteYaLmrdsPk7h23lX+Pwxf1rtYPqtsWM3H+UmXA+mUrNz03XTPQSl1GAn4/6SuIwse
	a3j6qNj7YfX95rfTd5SE8jSjHxfV7aDENkANYoLEBWIgCdnl2oRiYpKk3nFqzgGuCQwZ6LObsSm38
	6R2DgWiKd7Cs+jTtMy85VETgrEMfeThQEq+aBnrC+8R7wttgpc7bnPcU3CBM8ty/KwtkgIZANa4yQ
	zN8zBr4MsEB9jEsnj1kujsXAYyYOpZxCgnnWSSslJaaj75RxmBarM5UyZRpUmliNG1B/gooHDTGwn
	bElqQLuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSLV-0000000Bn8W-3FF9;
	Fri, 06 Feb 2026 20:22:29 +0000
Received: from mail-southcentralusazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c10d::3] helo=SN4PR0501CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSLS-0000000Bn89-0FgD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:22:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/cuT4K749IoCGK2DXsUTk+H8z/Aib//P5ztX0rtOhp5ya4/j5NsQbUEqI4mwkWNQtUlU4BMG7tp09j7AHVviY6PRcyyKVZLX6qq5UM0HWuaeiMRG+jMPcnA7SPXq7rkb4giSL9Eq3YdDUh/lZqEjN3Bdc1qe6KjyUCz/BLuC+h7BEoDkJIoKuZXPFLFV5CsjMNU+V5juzA48LenD3gfe1M6tra580nulp4JpfN4X6pqZOPydqT+LMy+rAIINuMQFB36yF9e/dJP9WFnWptxZ2fUbr8JnP54I0z552FipssAx/x1N7wLMoDr1vJnDdg//h9kzpgd2iCZWqjmUzumCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zB7NCegdPAVE7LASscEv3nMY2MkDpDQK5Y2G/g89nnU=;
 b=jgZq64MutkEgEtduFKpOj8LZDdN1b7an0/FGMdRAlJcy6zTRg8sPfV1lxcrQtGDw8l0wL7zK+RmFTwIZ10EptBFTvV8AQJSkzgm15yZqufiQ9r38DIfRKAYfcUmIEYdJUT+7nsNPH/yALB+7gUPeYRaIGOpXIbVimSDBQe/I9DSD76Hdr1045waza4ax76v4WDILrTBvkr/tB+CscVf1dEODfmqtXBCij3N5/jb1+HZ5UaUR94H8wExEGJJK8zf7MAlrAn7BMZqiUl+fd3KsULhkA9rImbjGUkakJ0GuYd51i8lUA2mEJAdBk7Pg8ot/9JgC/ARfgmKhnUZiGkmG5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zB7NCegdPAVE7LASscEv3nMY2MkDpDQK5Y2G/g89nnU=;
 b=SKTTyVsiJC/zioIvLZmdFryub6FyVBasfYMQs+gJJUucKt1d5Mnhf9PIaeE2SOdiQQHF2MCMiUkw7QbO4NKqyy7PXLAYOPKwRc5TzZLQjkN0Ehftag0rwyQNjLPhzpIDQACZKux3Z8b75E3nNUn05xvqKM/QJDRigcJizxzY16A=
Received: from SJ2PR07CA0015.namprd07.prod.outlook.com (2603:10b6:a03:505::28)
 by IA0PR10MB6699.namprd10.prod.outlook.com (2603:10b6:208:441::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 20:22:22 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:a03:505:cafe::83) by SJ2PR07CA0015.outlook.office365.com
 (2603:10b6:a03:505::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 20:22:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 20:22:20 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 14:22:03 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 6 Feb
 2026 14:22:03 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 6 Feb 2026 14:22:03 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 616KM2Ot1904659;
	Fri, 6 Feb 2026 14:22:02 -0600
Message-ID: <a40bf556-0a4d-4acc-9ce8-421628218b0a@ti.com>
Date: Fri, 6 Feb 2026 14:22:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: ti: k3-socinfo: Add support for AM62P
 variants via NVMEM
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20260206191914.52878-1-jm@ti.com>
 <20260206191914.52878-3-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260206191914.52878-3-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|IA0PR10MB6699:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3832f5-6273-4948-0b5e-08de65bd6e73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkpiRmhQakFZN0ZHYk1pdThTKzlvV1orVlpObm1rendyL0JrVzFDZElReitq?=
 =?utf-8?B?Zk04SnpwY3ZPVEJLVkZ0cnZweHhTd2tzVWVQYUhKUmZidzZYc3I0WVlFRjdY?=
 =?utf-8?B?VG9lSm1LN1M5bTJ1aTZpaktoU2FqSHhBZTVxMG9SUFJPWmEwM0RjMnBpVHJu?=
 =?utf-8?B?WTRmUGdxUUpWdEZHdEV0R1VsejEzK0FKUjdOUGpzbjVpVUxVRFdFcUI1Q0dw?=
 =?utf-8?B?Mk00NEF4eHhqang5aDZIdko3Ti9HQTh2bkdGYkZzZjNSQTZuVjRTdXB0M2g5?=
 =?utf-8?B?WFBZakFjRjV4NlZwMkxneXJqTUoxM1BaWThkSlhvaGlmdE4wWVhiVWFPaFVK?=
 =?utf-8?B?VGRTSXMwa29OalZ2KzJtRWFRcHZuYkZQY1lta09GZXhFTVZVcDhidXZiTlIz?=
 =?utf-8?B?bGIzcnJEUUxweDk4cHovSGFBOTFqNDRnT3JwOG13cnhrT1JVQ0hNaDl1dmk5?=
 =?utf-8?B?aTZLK2RMTVhpOHJvRWNtK29LNzM3bzZYZk5rNGErU3pkTm0wSVdLaC9TZk5w?=
 =?utf-8?B?aDlWYWVhQUsycHdmZFRNSmdOeER6NkRyYTl1QnFiVVJ1dGhwUVcrOW91eVAx?=
 =?utf-8?B?YlVxN010TTFKa0kwSk5LdGF4NUJOZ2ZkNWdOVEpkdHFURVh4TWVFQ1c2RGNC?=
 =?utf-8?B?ektTV2psUjhOY0tLQ1gvYSt1UHFwdHdCVGs0WXhXREV0azk5S3VzTDVhYXA2?=
 =?utf-8?B?c21RMWtYMU5XMy92NUtmeERTN2IxUjg3RndzQ04zbDd3bm5iVE1DSUliV29Y?=
 =?utf-8?B?MXJJNXNLSDF0bUZ6VnZaVmJuWGNSR29kUWQyY2RxUVRIcXNITDUrZWFYUkJa?=
 =?utf-8?B?ZVNYSlJwQ3c0STJEb1k2am1hNnJJNHpZMVZIalFzMGdSVGxpT1duVFZZbnRz?=
 =?utf-8?B?Q3dRemJNNHpoRXRpV3dFOVZpMlVlSmhSdm1BOFVyVnJ0WTFLcjJMQ2E5VUFM?=
 =?utf-8?B?SFJJdStadFBNbG91VURvZW5rcGdLbXJWdjAzRlJmOUNsNGZBeFFsSVR3ZlQz?=
 =?utf-8?B?WWR3M3FpdHhNam9hU1Npcm1PRWx0alBkOEFxbVZHK09IRXNoL1E4YjZZS2F4?=
 =?utf-8?B?Y2N1Qjcxb3g0cWU3ZUtpbkJpT2xHK2RXaHIwdGdKQWhTSEJHZDhjZFZyeU4v?=
 =?utf-8?B?bFA1STAyb0hpbFpVVi9QblB1QVdGVksvcFA4eXZzU2ZQVU5qRDZRakdtUnBZ?=
 =?utf-8?B?YWVVdEkzNGRoRzhoTm5ycnZaa0dVOGVtOW5KaENNNXJMSEZRUmhJYTVBQUZv?=
 =?utf-8?B?Z2JWUlpWZVRHelA1eDZvV3ZmYVBnTVJ3M1hhc3YrZDBXczhkRnI2L05NaUZD?=
 =?utf-8?B?TXZmalhJSGdpTzVzT29sZUpnOU5EVUdIOHgzeE1hU1JTdERlZzF6QzUrN3Uy?=
 =?utf-8?B?Q1JBUHdzR1BvNzEvclY1SktaSDgzTHAyWkQ1NU5weWRyUkk2bjFuRldyVWY5?=
 =?utf-8?B?Y3ZUdzdRbitUQ0t1ZVdGaDNDNzZwcDh2ejlOcmlSaHpaTUJVUThVakk2Yk5n?=
 =?utf-8?B?Yk1MRUNHa3kwYUNMSXpVMDdhY3FIVWpnUTRtT1BPVmd3clpQcFlhdnpPby82?=
 =?utf-8?B?Zy9QVGo4MWVKWE43RTZxYXhWYzdER054emRDdXcxSlhuQ1gxWnJjZ21oTGli?=
 =?utf-8?B?cW9Tc3M1Y0RuUjBsKzNKSGgwQmZOQkdac2dMUnc1RkF1enAyVXUzdStBckov?=
 =?utf-8?B?c3V6cWFpNzZ1ZkJNQ1pBR05JQjBZU0FtR3RVVjBVTmpZZ1U3eDhsZmpyTysx?=
 =?utf-8?B?b1I0T1grc1RWSytMdkNFS25lWXBBYmpwM0E0NnhrR2pjWGlxUDErbG50U0FH?=
 =?utf-8?B?ZGZWQjRmdjNtSWNKb0tYRHZqYjkzaHpzMlNYZTRnUU5CamhDdnJYMmN1a0o4?=
 =?utf-8?B?Qk43dTIxUndMYTZtZE1YZjZXZXlHeTVZVkk3aDMvM0I4a1FxR0dTZG9VaVRG?=
 =?utf-8?B?T3BaQUhReVE3VExPcGQwMDM1NzFuSCtmSzJ3cG1vdUErWmUrQWN3UVdHN0Y2?=
 =?utf-8?B?VmhmblB4U2xvdFdzZHhwVm0vTkgrMk9YbXVGbWZKa21LenF0UXMveEV3MGYv?=
 =?utf-8?B?bnljbGlXaWpZZHZnR21yYW9XOFVHeDdyQU44OFMxR2VZNTdQemZla2ZPaS9N?=
 =?utf-8?B?MkppQlZDdVhTV0IzZWRvQ3ViZC9hdzl4eWtMY1Nlcnp5aUhVMUJuUGo5TFRV?=
 =?utf-8?B?cndzckZaVDBoeUFONjgwZWdhamtENmlWa0FHamNKSW5Qdzh0SnVPU0NiZHFK?=
 =?utf-8?B?TkhWYk5Gam53a2VlMEJBd2hDbmZ3PT0=?=
X-Forefront-Antispam-Report: CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 6ZIQt3pprdE7LqIJdeWKXkAtV/y1WPJcgEjUARnzl9UhI/dUPCtXHNpyHPjvdB6F4lGCGwQ0z/nkik/QZoknhxU0pjk0a5k8O8bSHYq5a7N474Gr/NfjCk2EkqdVW2tr3cIgW/lLc3Leyp9TYFrBgr9iQb+EyogD8Txiud+KfOJXszncETM3B7p9jHvQR7XVJ70QEYqfToTspIdVesMa+uUQpKi8p5N7ANppbnAWm6nfkLjJdNWVa2AMvk+lWpNTuIxtoYn18MpudTnvN4LLEZLxD9R/Wm6n5LiqriDZN7zbtJNHc+oaYM8SFXDhPL5vrwBDtyA3ugI07nSmAl2AxE5CDrz4jWr416knJmsyEF2e670Md3BQ6o/+BWTbLIwzAOCD8yNTWJnmQk4EydDUbPYazWyD2KcBIAJy3iFSZ5eNX1rXN95K1VBVUax9GCHr
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 20:22:20.8046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3832f5-6273-4948-0b5e-08de65bd6e73
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6699
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_122226_284757_81D9FF70 
X-CRM114-Status: GOOD (  21.80  )
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

On 2/6/26 1:19 PM, Judith Mendez wrote:
> Add support for detecting AM62P silicon revisions.
> 
> On AM62P, silicon revision is discovered with GP_SW1 register instead
> of JTAGID register. Use the NVMEM framework to read GP_SW1 from the
> gpsw-efuse nvmem provider to determine SoC revision.
> 
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---
> Changes since v1:
> - Drop valid bit check, and determine all silicon revisions from ADR
>    register bits
> - In k3_chipinfo_get_gpsw_variant, merge detection of final return value
>    and return action
> - k3_chipinfo_get_gpsw_variant parameter: switch pdev to dev

My comment was on `k3_chipinfo_variant_to_sr()`, you should switch
pdev to dev for that function also. Otherwise LGTM,

Reviewed-by: Andrew Davis <afd@ti.com>

> ---
>   drivers/soc/ti/k3-socinfo.c | 41 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 38 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/ti/k3-socinfo.c b/drivers/soc/ti/k3-socinfo.c
> index 42275cb5ba1c8..d8fbc243945f4 100644
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
> @@ -25,6 +26,8 @@
>   #define CTRLMMR_WKUP_JTAGID_VARIANT_SHIFT	(28)
>   #define CTRLMMR_WKUP_JTAGID_VARIANT_MASK	GENMASK(31, 28)
>   
> +#define GP_SW1_ADR_MASK			GENMASK(3, 0)
> +
>   #define CTRLMMR_WKUP_JTAGID_PARTNO_SHIFT	(12)
>   #define CTRLMMR_WKUP_JTAGID_PARTNO_MASK		GENMASK(27, 12)
>   
> @@ -70,6 +73,23 @@ static const char * const am62lx_rev_string_map[] = {
>   	"1.0", "1.1",
>   };
>   
> +static const char * const am62p_gpsw_rev_string_map[] = {
> +	"1.0", "1.1", "1.2",
> +};
> +
> +static int
> +k3_chipinfo_get_gpsw_variant(struct device *dev)
> +{
> +	u32 gpsw_val = 0;
> +	int ret;
> +
> +	ret = nvmem_cell_read_u32(dev, "gpsw1", &gpsw_val);
> +	if (ret)
> +		return ret;
> +
> +	return gpsw_val & GP_SW1_ADR_MASK;
> +}
> +
>   static int
>   k3_chipinfo_partno_to_names(unsigned int partno,
>   			    struct soc_device_attribute *soc_dev_attr)
> @@ -86,9 +106,11 @@ k3_chipinfo_partno_to_names(unsigned int partno,
>   }
>   
>   static int
> -k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
> -			  struct soc_device_attribute *soc_dev_attr)
> +k3_chipinfo_variant_to_sr(struct platform_device *pdev, unsigned int partno,
> +			  unsigned int variant, struct soc_device_attribute *soc_dev_attr)
>   {
> +	int gpsw_variant = 0;
> +
>   	switch (partno) {
>   	case JTAG_ID_PARTNO_J721E:
>   		if (variant >= ARRAY_SIZE(j721e_rev_string_map))
> @@ -102,6 +124,19 @@ k3_chipinfo_variant_to_sr(unsigned int partno, unsigned int variant,
>   		soc_dev_attr->revision = kasprintf(GFP_KERNEL, "SR%s",
>   						   am62lx_rev_string_map[variant]);
>   		break;
> +	case JTAG_ID_PARTNO_AM62PX:
> +		/* Check GP_SW1 for silicon revision */
> +		gpsw_variant = k3_chipinfo_get_gpsw_variant(&pdev->dev);
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
> @@ -173,7 +208,7 @@ static int k3_chipinfo_probe(struct platform_device *pdev)
>   		goto err;
>   	}
>   
> -	ret = k3_chipinfo_variant_to_sr(partno_id, variant, soc_dev_attr);
> +	ret = k3_chipinfo_variant_to_sr(pdev, partno_id, variant, soc_dev_attr);
>   	if (ret) {
>   		dev_err(dev, "Unknown SoC SR[0x%08X]: %d\n", jtag_id, ret);
>   		goto err;


