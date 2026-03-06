Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08650F01821
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 10:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIDMk5sYIxM9jDjgEtc6H1BIuvRMY37EOJ0pNtPs2r0=; b=HGYbKr8pBoIZeVVVe6D2WHeooa
	jC+70ZHVfYQzlYEf8DvR71DDHNUFawB9UiGApNuAVxEpSsfhn+p4cpRf32jeYSO0fDahpK/7w2Un4
	XdFtbcPEf9B7AEBJjqEvo4bkzHFxJhftm2696pfh9osoe5oGvzuimISDZTKdT0gMRXBAO9w7NsBHt
	hc1Q1FNnTeTZLf6xewphY6vK5GfeOqCQ1y6pPVUz0aUDWnqtjQxlBLDLB8+5+e2nvg8iQTdLrOjab
	j9ikNHQlpauu/TkaOcpKKAHzRhUs2rm8tTaZW1Fm1XeQOg8VFgCs/fNSHdaHd0HqRKVs1dSamNiow
	Do5BZ8sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySVS-00000003Tr8-1CO4;
	Fri, 06 Mar 2026 10:34:06 +0000
Received: from mail-norwayeastazon11013027.outbound.protection.outlook.com ([40.107.159.27] helo=OSPPR02CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vySVP-00000003Tqg-1ttZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 10:34:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fSbQdIY45kyc4Sl0HLQ8jNCtWj5G5hI3PO2AThZUH7wCQIM3v+AeG58KjUceABtv0iLnyo9IUotfrFoIx203V7sdZjMvfHaQVHT8JUyBNcqg8aR4T/V4bOMp1isLSEJA9ztVc7kWzpA3zZttyJIc/rC/8BuiPR0O0t/YLSpsAiFWhQN9SdlqUz7hSRls183sReSr/mqptChpaS5mFsDIDeNNf1iSSwXJGgxkbQmHMAze1aE4FsqlANLJfQWKtlqsZEbQgSyznNGCSU0+IX5UH4wZjb0wxdIbBxc3kD85M95tLmsBXRhNUNKwCutTsyqhh1Lt1gNnlG3wMhQtF/B5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EIDMk5sYIxM9jDjgEtc6H1BIuvRMY37EOJ0pNtPs2r0=;
 b=VhAhQSn9MD8hQo+pGKofPsYE71LlsUQ0WNFvDvwT37h4U5zkrsoiynAc7bDkkHottMpUD9HbkK7SOUPScyDjMACc6K1aAc7isLeML4IMQDi5bxBzXheuU38rJPNUfSWnq3SbIx5ijx6XGshYzkgeLyrNK7477YvBr1dOfmfakAzoXVPxEpq2MN9TlogCytTBBjK8B6W6TTbkxBd1pGGNeEescfTK2eEs9BvY81LqbOKJ7bkNY9xYm8tVmWCrXlIfqLn5ESe+2kkx2fqzpYS+OJiK3rOTkuUnkuus/8n2itGdJnr6pFL4zd2OSkJU2i4yDtAaGFprrgWIVpJZvF5beA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arm.com smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EIDMk5sYIxM9jDjgEtc6H1BIuvRMY37EOJ0pNtPs2r0=;
 b=oQEe+1/kOZNo2W9T7vK3lmZAOHcyL2E0WJJqtBSkPyOqLiLmfSBqpOFS1yLmG3hp9Qwx0hqHgCCW6EYxgtrspP9hU5y364yIYg3NEsNKrC8csOvkOaMUTf4T82s1bctRxuw8oCD3USPavnTo4NAGANzMFHX+5hyUs+3g2Nv8qrqVV9JE1Yv/qCI5C0MWRrV3SDHBOtSnhzyAIMj+TucFkjpqGHG2Jtxffb6ekLKWg4mJS9ndCUq/kz4mOYLedddbuqnncGGS5FRoFHmBDnvLSndB5ku5x4QF2KjfuDt+dUBeqElXgiaz6v1m6RbMDOFshV1ipKBtGRQHkjQ8KkUGiw==
Received: from DU2PR04CA0173.eurprd04.prod.outlook.com (2603:10a6:10:2b0::28)
 by VI1PR10MB3327.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 10:33:56 +0000
Received: from DU2PEPF0001E9C4.eurprd03.prod.outlook.com
 (2603:10a6:10:2b0:cafe::1f) by DU2PR04CA0173.outlook.office365.com
 (2603:10a6:10:2b0::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Fri,
 6 Mar 2026 10:33:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF0001E9C4.mail.protection.outlook.com (10.167.8.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Fri, 6 Mar 2026 10:33:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 11:36:19 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 6 Mar
 2026 11:33:53 +0100
Message-ID: <00ca27b8-e1ae-475f-8082-92c8fd3da08a@foss.st.com>
Date: Fri, 6 Mar 2026 11:33:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] bus: add stm32 debug bus and coresight support
 for stm32mp1x platforms
To: Gatien Chevallier <gatien.chevallier@foss.st.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, James Clark
	<james.clark@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	<cristian.marussi@arm.com>, <jens.wiklander@linaro.org>,
	<etienne.carriere@foss.st.com>, Sudeep Holla <sudeep.holla@kernel.org>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF0001E9C4:EE_|VI1PR10MB3327:EE_
X-MS-Office365-Filtering-Correlation-Id: 599d778c-1f38-42c1-1183-08de7b6bdebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|36860700016|376014|7416014|82310400026|921020|13003099007;
X-Microsoft-Antispam-Message-Info: OKyi5QyjofA+aNQzBjI5hcImYdWMkhboK/5S99Ro2Qz9eKTtpp6qDfDGlRZMepXkXHrb9ECGqe0WxLw0BumFydz8wXOQt8MAhqL1Hj0nUn79qR9uq87vqfsV7gTBNkUcDc/GPJfL5rd2wG9RSg3wtubQu/BpgkXDi0wY5wI4SxycyE+AllNl3TtLziEY/QHSVrqsT3xxfh5xey774SI4SUD9wqa/8/y56/XgVwGYXNv7MVT3qRgpfFvszMmNpae0gJlLJtAM6xN3fs3Z0NfuBPM6Se8UPZrtiLjdTJF4ZP7TrXtj6QJzUuupxhyclHZFmAygfqMg/yJKt9xu60shPHuwZSQ8Q0guP5Cf8vxOm5iMptgcwNQm/uzUxjVK30KLU1RZ+xEVwvSq1MWcxjxiWkKPa3ncReL+FjAQChW6CSnRLDiTw+RZeUhppc7PdDydfdbX1q0UnmpAIWhIN3DRdmW8I0iq03KzyMKQxSY/Ky+LZ4eygmzU/TznOvtYGC8iDw/bMMZ+3vhYcxUD4taXt+iRlDtgby34SNMqRRa8PkuT10mOv3jQpLaivh0jgeqBLjOXPjOenVmseIR4nHZmtihItIEPAas6LEp0Z7ZD6dbBkAkNqLmoTfHg89tjmm+Axl9/gu0RU6PHcEkYvbEZgU+ztN8tV6Aus4TWBSsLPXiCFhvy5YNi8iqPa0tcPBvzQ7lxR4jUqh9AOs8200LWqvlsZz5Tr+xMsjajZN1TDA+e1noD4LbQDFH8PvLDtOTTlwCfpnV5AEOEDacZovIB2v0Bz+e/459IwhPlaB1l+1U8aYRz+T2V/IiVZauTlyy80U/6sDx+B7AgGHSIYBk1kQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(7416014)(82310400026)(921020)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f+WdFzAXdXaW9R4ZQSF2rPAF+L/e1yMvJjWu1vQER1JQT87ahnyal+jME9Zz5EwAMp5dWQADAO/7JNCOXOzVkSqVBvOy9h5maqhT66uW8+RGJENumXXSYW2c4kE4plXUMdEE3o1IELNFm9+ZG4x/AIzu6JBiGEI3MUWqPks8ZSUMQG1dy/1EXYEjtD2yhnMAFdwF8RyHoqoUt/I7z1ajXfEMStc3CzB5y6sPgtUIkWW6nbTIPgbjs9CvX7CA2XvjCpBF4yd5DHPvpSLaZIhhQoFk7NLvYFF0z/uFK513eft0SdctKV0M7sLnl3gS7lxSb3EfuyV6Yu2G15I/yGqauHXXSmO5mlZwzOXL8fARVFIpVBVPMU41x3CNQz7IsfBbSl80zPzTPFyx5mxcn4iLvQzZG4xgdLKL365JfYuBDlVCJx6azRw6YtzgfD08s2WJ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 10:33:56.0673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 599d778c-1f38-42c1-1183-08de7b6bdebd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C4.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3327
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_023403_742571_C61E5809 
X-CRM114-Status: GOOD (  21.10  )
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

Hi Linus

On 2/26/26 11:30, Gatien Chevallier wrote:
> Stm32 SoCs embed debug peripherals such as Coresight. These peripherals
> can monitor the activity of the cores. Because of that, they can be
> used only if some features in the debug configuration are enabled.
> Else, errors or firewall exceptions can be observed. Similarly to
> the ETZPC(on stm32mp1x platforms) or the RIFSC(on stm32mp2x platforms),
> debug-related peripherals access can be assessed at bus level to
> prevent these issues from happening.
> 
> The debug configuration can only be accessed by the secure world.
> That means that a service must be implemented in the secure world for
> the kernel to check the firewall configuration. On OpenSTLinux, it is
> done through a Debug access PTA in OP-TEE [1].
> To represent the debug peripherals present on a dedicated debug bus,
> create a debug bus node in the device tree and the associated driver
> that will interact with this PTA.
> 
> [1]: https://github.com/OP-TEE/optee_os/pull/7673
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
> Changes in v6:
> - Fix use of platform_driver_register() in probe of the stm32 debug bus
>    (unusable since dc23806a7c47 ("driver core: enforce device_lock for driver_match_device()"))
> - Added all review tags
> - Link to v5: https://lore.kernel.org/r/20260123-debug_bus-v5-0-90b670844241@foss.st.com
> 
> Changes in v5:
> - Take into account Rob's comments for the debug bus documentation
> - Link to v4: https://lore.kernel.org/r/20260122-debug_bus-v4-0-28f0f2a25f2c@foss.st.com
> 
> Changes in v4:
> - Remove reg property from the debug bus and use ranges.
> - Link to v3: https://lore.kernel.org/r/20260121-debug_bus-v3-0-4d32451180d0@foss.st.com
> 
> Changes in v3:
> - Collect Rob's review tags
> - Add stm32_firewall_get_grant_all_access() API and use it in the HDP
>    driver.
> - Link to v2: https://lore.kernel.org/r/20260114-debug_bus-v2-0-5475c7841569@foss.st.com
> 
> Changes in v2:
> - Fix kernel robot error by documenting the access-controllers property
>    in the missing coresight peripheral binding files.
> - List the access controller items for HDP
> - Various minor fixes in the debug bus binding file.
> - Remove clock documentation and its presence in the DT node and driver.
>    Bus clock will be handled by the child nodes' drivers.
> - stm32 debug bus driver:
> 	- Depopulate the bus when .remove() is called
> 	- Remove trace when error on devm_kzalloc() as the trace
> 	function does nothing in case of ENOMEM.
> 	- Remove use of of_match_ptr()
> 	- Use tee bus callbacks
> - Link to v1: https://lore.kernel.org/r/20260109-debug_bus-v1-0-8f2142b5a738@foss.st.com
> 
> ---
> Gatien Chevallier (12):
>        dt-bindings: document access-controllers property for coresight peripherals
>        dt-bindings: pinctrl: document access-controllers property for stm32 HDP
>        dt-bindings: bus: document the stm32 debug bus
>        bus: stm32_firewall: allow check on different firewall controllers
>        bus: stm32_firewall: add stm32_firewall_get_grant_all_access() API
>        drivers: bus: add the stm32 debug bus driver
>        arm: dts: stm32: introduce the debug bus for stm32mp1x platforms
>        arm: dts: stm32: enable the debug bus on stm32mp1x boards
>        arm: dts: stm32: enable CoreSight on stm32mp15xx-dkx boards
>        arm: dts: stm32: enable CoreSight on the stm32mp157c-ev1 board
>        arm: dts: stm32: enable CoreSight on the stm32mp135f-dk board
>        pinctrl: stm32: add firewall checks before probing the HDP driver
> 

I plan to take DT & bus driver patches in my tree. Do you plan to take 
pinctrl one or would you prefer I take it also ?

regards
Alex



