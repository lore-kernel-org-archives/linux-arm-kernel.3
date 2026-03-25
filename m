Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F294106B53D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 14:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SqxoRN5g0EKQMWQCd6IzRpFpiUiI25FuVz4/3jPuP10=; b=F0roC/9JeB+5ccwoUwo1GGy5GO
	WGKsQwcHgkFXZDTU8dQoIxqZq+F8vW3+Siygh/GP7t2VVI/Tl3c1CPeBniUg/LNAe1BJdxMg3eFux
	fCP85gl/ZoFX2yFmiGUOxJlIe4ePn5Rj0WzgbJo/vRCp6YZcB1YwYmqOrI23t4MkhE1bkfhZLRZlu
	MJA8+6mVuDzxQEWY85gQh7Oj3jUZf6KhM3de4wdrA9Vzy4mJvXPc5t6a//X/ZmxejucSFdV29w473
	7m+wgDe/kls5/K41BkTU42G4+pvd8vq2DAhf4Ox20AleYhwHSpKjQgWY7tULBoTVa7f5CWXyMNeVi
	blDif6Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Os6-00000003XMJ-3U22;
	Wed, 25 Mar 2026 14:06:10 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Os4-00000003XLS-3mGe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 14:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhxhe6Md8/8kObnKC1Fit2pvEmDsBYq3csI20tBpbkUTZVpuD+06UU6e5M1Co0/wK1G+W+DKwViOjbEynQdV1KjOfI7e7F5aaz3Y6JlKeHstScDeWHAx0HN/sGv3X+AGmCerrTVJRY4dXyPh1SDhJrrhveRAf8CwTW3f4NNwOAuGZ/vetTAhnhIR27qxRlKIprKLDCm5Xl2ChzwBpzl9bIzKo/Ewc4MGQuo0QfivhVrsnqVYOrSVvp6pPWWTJaN/DK11fqNtKL5I6s0vnD/8DqZlI+TJr1Z3Pes/h/EmqdR2f9d8ILMWsFZdxEpXtBpcK8aD11FiNUMUX0tdcppSJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqxoRN5g0EKQMWQCd6IzRpFpiUiI25FuVz4/3jPuP10=;
 b=xk9C0yO+C6weQS5jma4gi7TbFw4OQNvS+azmLTwpW2wulq9wpg8zPzZ7xxPJecRNVrOTGMCaVoJRrXiz2w8kCxOpqQOJU4tpWlPoHOK8NhWftW9ckXp8rrMBgf4bhvgFQo3MbLrt/09KxoGGYASMpE+5PuFMaMS15MknBOsnyiCI5qQsPz5zNCBD8qwQS9aEQwxZFyOmsJpL/CFldSB+Gtpal3EEun0PjdBL3Pp+NkNxGAewudAfdY+aY8vrkIg80mIhmAmWYd2fFWDGCIzHjmhIQOr3NsnX7B/FO3AnAYZWu0/dw1TWENN7pGe+c7dtHFNkuyN+q2g3s2zxd48UzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqxoRN5g0EKQMWQCd6IzRpFpiUiI25FuVz4/3jPuP10=;
 b=YtYFzpSGJ2tUeOJ0m1cvPjedBuWKEW6Fy++YnI4S24siJV+JUUw8r6No6fjex5cI+B+RoaDr54LYQvu9p84YAP0dqce3Q0nE7dxWo3a3foI9TYNU1PJvw1ia4bmV5vS1ovCC9HwQ27DjHM4zOvINhv8kBoVkxz6FSYm0hJI9JuK0oRfCWToeJK/25cOjbn+d45xMj5w4e5jNFadRxD5SZtRwt/VyaY8SGKT6xL9nXq4y2NM0QK/8HFpw1+MT+Ij76YVIFBK31CWsWTXwvESPyWRvZGw7syqVTVeBY3vrLe+FbGRolJTr9EGDCLFkq6FjSFBOkUCKcfsojeB+/GkIwQ==
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by PAVPR10MB7260.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:31c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 14:06:03 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::40) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Wed,
 25 Mar 2026 14:06:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 25 Mar 2026 14:06:03 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:08:32 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 25 Mar
 2026 15:05:40 +0100
Message-ID: <2908a58f-90c8-45ef-8a6d-728bb7d0efaf@foss.st.com>
Date: Wed, 25 Mar 2026 15:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: st: omit unused pinctrl groups from stm32mp25
 dtb files
To: Amelie Delaunay <amelie.delaunay@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260311-mp25_pinctrl_omit-v1-1-5a3d40046b10@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260311-mp25_pinctrl_omit-v1-1-5a3d40046b10@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|PAVPR10MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: ba28ace0-89ba-4f90-1fe5-08de8a77a698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: N2tpbZskm7Ga8IoyMZjvK+KJ/sYZi8RP6/EDYqwDgqSA7VYoLsWMkSoPhCmVeO+17UpD7Lo4UqrFgXnkIjJMz3XbuYG+SccelTo5E695IBk0gSbiib9wMDlejpzWNz7kr334OjsvMzVJelNzcYmQXo300SKJem+TgjmsrIPRcC9xijpof8mT7J8WFJVXRiRwyLtbscz0Wr49sLzrubsOpMImRkkcb/DsgJAH4cwRMjR4er3Nc0Ya866uOv25WEVnODG1EdrIGmaBeJ0MGySKLgUcxgCpD1juhFBbyTXKlscDiIXMHvKK5PR+3EC0nhN8mNtNgiaMFEDMQDNUjietybY43MAqz/pv+y9EF7cslgdxgQ8wVrxEFnf7dxIAOviykmum+SkPDMroh91uTjkuQIL8Nv9rPo7AJhCg2cpRCmRMuTVspm499Ec5IE0j8dJuobuv/RCp+gboXkUtg9P35bRrW4H0Gz5OOEN3+ixe2NE+AiXvUQ+zKGFZR1pZF8MI9Z+TY0+gZd+fOgKDSaYlbAdO4ahAMt3rrglDpmqZoGlQkATOC8am/MwFT7XSYAWmITAb1p7fj1REMnA0Bxyqgl0th/pSISBbr5Bk2as6XULgnzOSn8argCkQgcCjvI8Cw7Mbj3GHWXi74tsIiLR4ST3z3tGPm787bgl0JwuX0KRAhTTH9Leejnf9Aq/vnePQWLHNRC99ZAW65Cq+nG7N9JrH0Tohv4kBW0Bz+v4gficXAyiklVzF+qT5RZ+MXzI9hwpMcP8GEgOgy2R3cLat5w==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ffWRCBGrHsj/1NXhjYY1zAE5aGsdJ9RzLJRdEeZpga5ukFAgHv1rawQp9pE2Iacuby/67mqq5cjpfMQqKys1Y6KowkuzfPqrvuKEha5jtpmseroEtrwLZasgQvYJ58adBuh79KJQ1F2LR8RIgtFKcFdqxxloOrxmQSawEbs6T2oZkbC5jjBrQZ+m4ywV2k80DWlkiaFXZFrC4TUdLIqRyGSaZDZ7QvqTTIfCpwrln67tTSwf5+QbNnU6lT9vgi0m4EvJ/AsGKf0LTws+zupEbVsQUxC6JVCxgeHSFjTSqzZ8Blem0eC746/bq/sQ9nZEpabcvRGfgUIDhrUo7Imo14ybo4ElaZOj7WlAC9C3kgyxqGSuUPeJkvo6UYI8uRwZWFxjC3MNFLhxlJ0JTRdF3cf6RijbO8TfCmDdhLLuxKWlpX+sDGmS2rsLzv8mssLj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 14:06:03.2812
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba28ace0-89ba-4f90-1fe5-08de8a77a698
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7260
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_070608_939985_D2EEC6C9 
X-CRM114-Status: GOOD (  11.95  )
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

Dear Amélie

On 3/11/26 12:30, Amelie Delaunay wrote:
> stm32mp25-pinctrl.dtsi gathers all pinctrl groups from current and future
> STM32MP25-based boards. Some groups may remain unused by any board,
> resulting in wasted binary space.
> Adding /omit-if-no-ref/ to the groups will remove unused groups from the
> device tree blobs.
> 
> Use the following regex to update the file:
> 's/^\t[^:]\+: [^ ]\+ {$/\t\/omit-if-no-ref\/\n&/'
> Also, merge the duplicated pinctrl_z node.
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>   arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 44 +++++++++++++++++++++++++--
>   1 file changed, 42 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> index c34cd33cd855..a7ac9d08484c 100644
> --- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi

Applied on stm32-next.

Regards
Alex

