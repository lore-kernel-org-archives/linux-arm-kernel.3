Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B811CC6B3A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 11:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sdNkNBafRccqTYJjZh2GSaQS3+kqdDiQMw0aTXAGmM=; b=ZzR0cK1J5u1f2q2BK5GuwIK/j/
	jOQD0y3EItTMCNbYmizmDjzpT3G4g0pj+2SiLZcPnEFukqooEivn/mkCx/fYp0lNZoiN5kPSLoxn8
	R+EMYyROmtqf1JEG/JDqkK9V9OV96hPHcG65yeBd/CM8iJKTUxgGXlaCjb9PNBM7RlUJuQMlh64bF
	6eSY/M2SmFh/p6KnKAonYMinmcU2vfSR9aNE13Igs+gpbUKbD90aWaAvx8Nvu9nEuIuen1tGVlmn3
	Iw5BD62H97PpxyVtzWNyI8sJUUGHDRHmM9mNr3OzpafLyxap1iB9NDpe2ad1pGR0IpTUhZ6pRh7rr
	mwAUVsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJsh-000000000zt-30NH;
	Thu, 15 Oct 2026 11:44:19 +0000
Received: from mail-westeuropeazhn15011023.outbound.protection.outlook.com ([52.102.161.23] helo=AS8PR04CU009.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHJse-000000000yP-1kyJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 11:44:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6gqmo2zKG4XsCEhl67F0JJbPmNW4kfubc9fATsv/WJoHVN0PEQP3/qjKrkT1TUI+Zh+fv5tWgP8kx+k6aXvz2wYdDSAC7ta9ITbmYt7pNtg4509ZYpVvYYRfxkGLuLg66AQGE6If+pGxwnODNtD96mafQxtabd66FoYUWHADYRii1R9qlrHUav3vojKj9bdscghEj9yaz8tw3+80Scgy7GkzpFpO2SxwkH5pagJF2HDZlAweNKqfpZj6rLqp2eBse0Yi+v2LNx5q1Dx9nX3FroZXD2g6xGPbksKcQ+qhLPVJT5W+RB9AIQLkSVQSjJMS5s27LN7/OkHuO2+gZj1kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sdNkNBafRccqTYJjZh2GSaQS3+kqdDiQMw0aTXAGmM=;
 b=o/lXtRXQQQtAdGxCqEW1f30FDk9/9sxZOBJi4rzZH01kL5AFY1wEM2aDEfu4xtzBtqMjwy8M+mMOwDT3LCHi9QqZuPjAm4l5iFJpmxwvcuFd2sRyazAILsBdiF4mkjHTYNraZr59Mhj+b1yuwgax7xYrC/4KB7OM/yp1hkWx6HYbVy4ZFskvi9aXQHMKHHwR71APIYhWHZ4vNuSv8GuC01DFa3WdpxU9xtddcYax9xkoNxGnkFZQFtFSoP+shU3UW201aWeQ7K7uZbuhxYRB40Z1OSRoKvYirxU2qgib8cKXbW42R0DBbgMt/HBlpkQpNJjgceoALG+gFI6KaT8Arw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sdNkNBafRccqTYJjZh2GSaQS3+kqdDiQMw0aTXAGmM=;
 b=Ldw5MfY7ahjrIQJv1Wy4ewMubfP4vXifA4GwJM5wYMgZuH7fXNkFKo/NtdnwFoqOswWjInzjTmQJHX8DxMelexjDAWvJtCQUrUvNQUBsyEfBWRzkHyrHaaVbUUyKUgmMJ0jT6YfKhTis/WcOm4MO9Mw9tytEiWANqRBeAORCnwOUKuy6E3B/y5yY8bARRmmvcvJI5ppg1UsARXMk3aVsyud4/3V03rvpkLKeXIZGXoepmrLuxq4KeRSybdqllxaNdApw2F4y1fGcplPL5RIhxxMMs7XnrRQMm/cKqToYU5Y6qaLm0zxivw8moFVfZfs77irpoCkZpWT/yH3hbrSXzw==
Received: from DU7P195CA0029.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::12)
 by GVXPR10MB8946.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 11:44:06 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:54d:cafe::2b) by DU7P195CA0029.outlook.office365.com
 (2603:10a6:10:54d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Thu, 15
 Oct 2026 11:44:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Thu, 15 Oct 2026 11:44:05 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 13:44:10 +0200
Received: from [10.48.87.100] (10.48.87.100) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 15 Oct
 2026 13:43:09 +0200
Message-ID: <70074c6d-1141-4723-b61c-dbef3962e381@foss.st.com>
Date: Thu, 15 Oct 2026 13:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: st: add thermal zones on stm32mp251
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>
CC: Valentin Caron <valentin.caron@foss.st.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261009093709.19907-1-mateusz.nowicki@posteo.net>
Content-Language: en-US
From: Patrick DELAUNAY <patrick.delaunay@foss.st.com>
In-Reply-To: <20261009093709.19907-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.100]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E3:EE_|GVXPR10MB8946:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a7f05a1-dab6-4ba6-cbf4-08df2ab19de3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|34020700016|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|22082099003|10067099003|18002099003|13003099007|12100799066;
X-Microsoft-Antispam-Message-Info: fV6vRw0tJ8hI8V9LcHPsWzYM5+d1cZsI8pOJOHX/hghMTo/+Y+A+jTtlmaTgaZLViCSumPGztlzM+FooKpUqZtSchPuWiF8oxOHEPY09t8QFe5gZp4RkxPeqfgD6UkH6WnsTKQ8lrmNF+6s6D03bg4BWvb/zQy4T3U7TsX/LYa//j/spbWlQRo2Xysodsv+mzOquGMdfnp8/MSoLaZmqzyvioyHOH1qL8AR5KNJKipM5aQfQF5hRrAAlSVW/bHMu5bZVWKRCAijdjSi8asVuJS1/WHngqr/m1/u+sTApz4gtn+6N1vYL7NT69ejDAFhVfjqW9Qo0PD7x/6NsrmEVW82d3l/LVnwiwGw5Ws+0o2w/N88Sp4ibu4EYkKwUfZ4Up/5qDNXQeuEQxA9+WH37R+uGAtYQXqf0oICjvpgqXyUAa778rR4v6xW7PIL6YywRurrZsEUvj4UqjteoKy8SLCG+j5ZPzQWPlpmiV3KVmcsEeTK4hZPdpUp0OlNwFKxirkTBHRaN5UNYz5ubpIr0IYEDnrzsk414mpHcKRSUj1XWuh+VWfdAN2YORxhMq8idc6PWYvMPX6Sj2bhQWBLo4aBPhCldrFpCPh6N9C2qu79ak2Lbt6pb7rNa8wbyvcVjiIoj8r6PQSl8+kBI2TDAjvZ8svl3tW23RVk/py43wck=
X-Forefront-Antispam-Report: CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(34020700016)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(22082099003)(10067099003)(18002099003)(13003099007)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JODpdvSrITdcQR2Ussg6daEtguMwoxU4QG1HdVDtg7qvCv1nqkikjPD8ZIkZZnfmACAjkfxXO2wqcAjcCT6W1WhCGaephExyFHN2rZse6spTLgYR/PQHEv7QxHXjHz605H+iOQeRehq8Vl8RforqNoLp/blOwHw3CJPO9+yWHkH7S6XUl7SUdh7RpLicn6LfMa8lLZ8T6j1v1uGZqksyNwd+fvUgXeZTXnsg2ykrAqVpspHMmu2eh8kV2ROUtxNiaJEYsaVqsbY/aIxvaBWkdcG8pAeBoQbpxQTg4WMC19WCyO7TT2FNQ4yyCMRmp46tasW2lAl3ADxDZaNdf2xUV4oeXhMnM3sYmnKRisw9+OkvtjZI848KaqqBbJLLSI4PvQGAvbn7b9bXR6GStZlI1vrpIlMP0OjUfTk9d2JpoK/RiHABK7b+jhb5YukQfnJ4
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 11:44:05.5269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a7f05a1-dab6-4ba6-cbf4-08df2ab19de3
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8946
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_044416_718089_A364F886 
X-CRM114-Status: GOOD (  14.22  )
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

Hi,

On 10/9/26 11:37, Mateusz Nowicki wrote:
> Add a CPU and a SoC thermal zone for the two DTS sensors. The sensors
> have no interrupt, so both zones are polled.
>
> Each zone has a critical trip point at 122 C (Tj max 125 C minus
> 3 C sensor tolerance).
>
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
> ---
> Changes in v2:
> - Set critical trip to 122 C with 1 C hysteresis (Tj max minus sensor
>    tolerance), as suggested by Patrick
> - Add polling-delay-passive, the sensors have no interrupt
>
> Link to v1: https://lore.kernel.org/r/20261004121200.64034-1-mateusz.nowicki@posteo.net/
>
>   arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 ++++++++++++++++++++++++++
>   1 file changed, 30 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> index b624f998b87c..da75e02f7c8f 100644
> --- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
> +++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
> @@ -158,6 +158,36 @@ RET_PD: power-domain-retention {
>   		};
>   	};
>   
> +	thermal-zones {
> +		cpu-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&dts 1>;
> +
> +			trips {
> +				cpu-crit {
> +					temperature = <122000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		soc-thermal {
> +			polling-delay-passive = <250>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&dts 0>;
> +
> +			trips {
> +				soc-crit {
> +					temperature = <122000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +	};
> +
>   	timer {
>   		compatible = "arm,armv8-timer";
>   		interrupt-parent = <&intc>;
>
> base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1


Reviewed-by: Patrick Delaunay <patrick.delaunay@foss.st.com>

Thanks
Patrick



