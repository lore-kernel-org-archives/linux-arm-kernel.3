Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB52CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDwqwe4w4b1vh/KIrXzbS/hev+xsYZGVcTHXwi0FFII=; b=K9UXrM57yRpCbCFllqzZ8l2y8a
	bhhJGdjlXeeI3cgpOi/F4FgpXYZPpYPb8Hv34bsJVTkMJUibYimcILKM4u9BVl/B300ZwKg3DK/HK
	aYN8QGxYd/uOTd+VvBc+G3StCq/TrTgm5PV/GUzHT3zFoqZmg4k7xDKXtg4izhWV3dfQ7X41QpuDW
	YXyNyc3/uWCQmWYbtx5iFIJTowYp+y37LzOS/HB3G9cXHnpnuTJqZHYkNmB7/m9IXUhfDQyfSlKMo
	c+spdj2B/D4I3cUjrx8DAbpjKluhJ+aJO16ChQUWS39NJ5CQTP4X57/urMzWW2NHMiKFZSfMBtsb8
	3yQ3oc1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD64-00000008Mvq-2wRd;
	Thu, 01 Oct 2026 09:29:00 +0000
Received: from mail-westeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c201::3] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCD62-00000008MvJ-4AgD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:29:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFPHwb4GoiUH0+GUxNL1Pxuf7nGv4x11Xn858b5UWjDALXhKry8kyCCMDxNkEIcyLUUA9dRek8jsTngWB940DF0/iHFl7eTsSqxyW10egJUtEcGIZITRe2nqAg/mu336OKn60XFMV4eVd5aPp49j3KRU0e7WMrLQDUeSGqUADV9Y4YDGtlO7bJdiSu5Yq8yIfBKKEY9KsddmyB0ICJ7y3jYLAigoogCHXNUQIBp/WfOQAOvNoroYKEu+z2TvbyNToc6cJy8nVjTj9l6el1JB550Ka84OBoAicTs6rARkCJYttkId8TOIajPDNw18XQ0jC7/EgWtmM13K/Xz15dPzoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDwqwe4w4b1vh/KIrXzbS/hev+xsYZGVcTHXwi0FFII=;
 b=cHFhH16UGO2rme//3MHYct/yq9efd90+Z8aNXZiMvl0xKw2oovacPYHHSi3zcCxO5H6cRJBcCCioVCIO6uu5xAaXslO2l7PNm+bfCv7hGTeOiJQ1XnN29tUSda6AS3N58sN5ntaCoYG/6zn8/KFZjWAHZMhKMA57qMXIbPZ/NmR44Swb4wzhD2XkbRUv9J60Sg9WwLLhUu+GzmdElXGRoo2bY2ekdxkwCumado3c2JBCUSBpQlUt5ATU1wzrJQeZUlkD8+FtHL2AZbv8spGHy0G8TpfDNBLEU8X70b70VCCqz0lvzCJSC9sshJVxwO2G8u/LnW91y2hVNywLuYXMzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=nabladev.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDwqwe4w4b1vh/KIrXzbS/hev+xsYZGVcTHXwi0FFII=;
 b=G77csBIQ2gOV1NrkwJ+/1RJv+OWYnOlQ3gCY/9KINcxMhD84JQ+Q5YeVYM4Y99ikaPDvBlkGdoiYpeHz06iWzOeMvSwlHzdlZzTEP3N4QDDRRRqUX/M1Wc4cnzkV0zzl7PMz+hxJXckYDx6HjBcCSNscPjLmEETDNNd39wfakjipm2Z3jKFFeJnnEvKNVW3lYrNN6Ik5/VzFglM+uYBQjk9k6kH2ZmfX3Pi1FIdyMPfFEqyP3lTtK8xDCID2zNXss1WPSYgwNB+B792KYCEmU67aaoDzIe5LgiN0YoaarwGK1ZXIm1MMovtUPHhkoMsvx3r5qYcbE77ltcuV6YJDjg==
Received: from AS4P191CA0008.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::19)
 by VI1PR10MB3166.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Thu, 1 Oct
 2026 09:28:52 +0000
Received: from CPH1EPF00000519.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::7c) by AS4P191CA0008.outlook.office365.com
 (2603:10a6:20b:5d5::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 09:28:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 CPH1EPF00000519.mail.protection.outlook.com (10.167.241.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 09:28:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:34:46 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Thu, 1 Oct
 2026 11:28:50 +0200
Message-ID: <22b18ea2-b2b1-4ed7-bddf-2fcd8e3348c0@foss.st.com>
Date: Thu, 1 Oct 2026 11:28:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] soc: st: Add STM32MP2 SYSCFG driver
To: Marek Vasut <marex@nabladev.com>, <linux-arm-kernel@lists.infradead.org>
CC: <fabrice.gasnier@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Raphael Gallais-Pou
	<raphael.gallais-pou@foss.st.com>, Rob Herring <robh@kernel.org>, "Yannick
 Fertre" <yannick.fertre@foss.st.com>, <devicetree@vger.kernel.org>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>
References: <20260902124018.606544-1-marex@nabladev.com>
 <20260902124018.606544-2-marex@nabladev.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260902124018.606544-2-marex@nabladev.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000519:EE_|VI1PR10MB3166:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbf8e33-69f9-426f-c4f4-08df1f9e6852
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|82310400026|7416014|1800799024|36860700016|23010399003|376014|22082099003|18002099003|4143699003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: 2QTy9WOS+vfr9dU8Ypi/xaaCfnRko2xbOqAMS/yh8n2ApY9whSG5PSm8gB/VLqaFceg0T0WxMebIs/qOhBerBQB7tShpog9bXsDQF0Y8yMTo5onr8f3ncMmvdqX/nDuSWOxy4iAT1AtngFTckqcfdiNLiPaPHlo3UW/tgfjT1m4uDcbneXJJOAD1nbQEis7G42MCkE3OnGS1d0vZPYHnnbtaqIwTjXjz2lCEBj7xPz6Melt2HtNafS8nBuMLX4yqc/BL9KkCURZAsPgzpHScv7lTlMn+jdsBw51v7yUbaqHKSFo8We9tiXNvkwQuNs8cxbeMIMnKHjzr7iGbUU1rb83DLpoPcHfKMkHvksGeYLHtnsteDYYByX8/OKUUhKTpqVghkSW8pooZn3MYAod2Qop9dAfJbJHRXkm4+3+2TCA6Y7npKmGCv8lQoOu1pMvCR0IHMuQxpv6i6gdKB5aTcBNAkrCSuvfwDrfhHRaC+heQ+mxyaNqN+cCQSSEIRwnFtbKVh+RKhmG7wTzCgcsSdxuUo93/fm+5vhbNCzefMTSs7cNWd3ZxqwOF6kOCQlwXko1R8i60seoaOoadWWlmhFv7bw71iLLMDPr5uMXZCCK+hFSOmfWFF31aYBEik79twtdgnSBkQ8HKPiZ8M0+PVShvuazGEqy4Np0Cl0tuFbXSX44wGy+pKlMhxzRsFW2P2lAhYDB9URnqTaDujfKoYw==
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(1800799024)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ORx5TWN2SoFXgX2i5koTvm245R3ab07HVQ0Ag90v2BjRBEwTuxCLJAV2eT3N984oSupTfqcukN+4Ea2aHk8kZrVAJLAH9K2CMjxloPqLw/L3/HYQyqin/D9cy4Zp+WPkcdaz10d5umEWKwKtwaMv0hVayE1CwBP13gQ2hiBUQi0w8Mldf3ZYCZsAkoLd3CcHy5RlENucY6DbdqyCt4GLDKxZvKq4Xc7fs02NNoy/ZARaod206DFTPaTStD/zIgI8qwn4FiGRYh2XDtqHdj58IaD32Or1SZcZRkoJk0fzyIAzbo5nGsGFF6rDO8cZOTjw5UanZe8Q2QUGsXGBlA0uby260alzAdL9TW+XajWolAaNEXmhVm2q8RNeWKHz46k0ecgmlE9jeHWTil64AUQbYJE030fPv9yUN2iT4S2hrhftW6KLDFwFCIo4FfpD0LR9
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 09:28:52.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbf8e33-69f9-426f-c4f4-08df1f9e6852
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: CPH1EPF00000519.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_022859_037607_DB5E33A3 
X-CRM114-Status: UNSURE (   9.98  )
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

Hi

On 9/2/26 14:39, Marek Vasut wrote:
> Add trivial SYSCFG driver for ST STM32MP25xx, which binds drivers
> to its subnodes. This is currently used to bind USB PHY drivers to
> subnodes described in the SYSCFG DT node.
> 
> Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christophe Roullier <christophe.roullier@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Marek Vasut <marex@nabladev.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Yannick Fertre <yannick.fertre@foss.st.com>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V4: New patch
> V5: No change
> V6: - Fix up the SPDX-License-Identifier
>      - Add AB/TB from Fabrice
> ---
>   drivers/soc/Kconfig              |  1 +
>   drivers/soc/Makefile             |  1 +
>   drivers/soc/st/Kconfig           | 12 ++++++++++++
>   drivers/soc/st/Makefile          |  1 +
>   drivers/soc/st/stm32mp2-syscfg.c | 33 ++++++++++++++++++++++++++++++++
>   5 files changed, 48 insertions(+)
>   create mode 100644 drivers/soc/st/Kconfig
>   create mode 100644 drivers/soc/st/Makefile
>   create mode 100644 drivers/soc/st/stm32mp2-syscfg.c
> 

applied on stm32-next.

Regards.

Alex


