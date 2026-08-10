Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21723C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chHdjN/r2caqZs+B2ulSg/L4viYE46RZQ5FvjmRt05U=; b=OFmXXdiIB3BRSk51KZuUOi3Rwy
	o6xu3P9tqZveHpsNaSwpxtMp1EkApI6P2fsCGebH0W4T16prWuBcbt9Hp7Gg3anJZKaY3dE61+yOE
	o1Rx1ubj0z2Ele+kg5JYxwM+bWXFJfzMYbjS5PoicsY6ggrgrdzZ86WYLhOb9WBCWuJXECIPXmHYM
	AzRbnaXpGDHfnL3lVlxxuNTG/sGzOUYEDPc16sPLTmJgVvbulZYzy+iJccnnbktOh9yhswkG7osDl
	QqW8x6sV2jDTl9uPD1rlJsSDvWtF1IcocDXK9t8xxqUSN8gn3e6ARcHO7PbVp6ZYgYzBfkJYwAJXd
	SWlAZ+iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLcJ-0000000BKDN-02X5;
	Mon, 10 Aug 2026 08:44:19 +0000
Received: from mail-francecentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c20a::7] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtLcG-0000000BKCX-1XiH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 08:44:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+vC3de0QxkoideqmI8u4j0SphNh6pDULX7QH3R0jwxv/8uPJbD9Ke+nlcYsTkig41Sz1k1/InXfm70dEEc1qW+aAPX0xhGXuIaLKbOiKKq5dYO8N7kIg8am6E16b+q5ucuoETDamJ+koyeknkzVOd1GnZC2amQXCUpLO/7aXJIOhWvWwrlqwv8MhPM14RLudVTHjDksI0ZiLQWwe0Y0WDKbbl4O3wo69w0icA2vsqJnJvNjcGQEnOV2x8kDR+NsKJnr8EtnNAcYgxzo0WvHslR5Gsu0TAgA3hhraopsMsdofRwXGJSxy2OPHk4NUwuWmM4K8T/H+b9OzgurRTLgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chHdjN/r2caqZs+B2ulSg/L4viYE46RZQ5FvjmRt05U=;
 b=iXVJ4Vy9kzrorRHnvfqPna1XlonJl27hHBkNbnQRWS1hQZy91vOibBhVa8PBAYe85RO2hgih2PJjPokeJMbvQnsyo/2Di87GWsq9aPWPL/g8Cuuvs2p2SiarWYBenDNUMTDVzHOdc3x2GDTmOTa38rDo3phhIyqdFPS041w9Ly0SkJ+opMwbSDTOEjmN1/uVlUKrUZAvjVh+mrrG1lrUx29rVhCxir/GD1cwZcKjKwQ82OohhJU2XvV8Hq8fUUwciKiAV3KZEABXt6wx/DrbxuQAkeeJnTOo2Zwu/wfavB7kDHZUn70EiaTPww0EyvzDmY7O/nROyW3K4+b4wd4CwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chHdjN/r2caqZs+B2ulSg/L4viYE46RZQ5FvjmRt05U=;
 b=n2zJAXY4gRenY4wquqh2RD9eJKVm6upGaTD8YSSE2ZuCiv5zqyd6FO0WcV3tDAswtRWdhbx8/UD/52ZhX2Sw90XcTty+VahwtNI8AWGl2pWFQr0DZJVj8lKRJ6yAhecjpT4bUDbBAoIH3IDn3TvuUrEc4d78Oz5168YIBvufp6wTEAHFuluYgq/qKXu3EIf5L+TTay7OpJP6h4r8z4a4CDUQ1Qa/7dp5WKu6YJ601WFN1NLEWgyvRwCz9xbfkEpicFC9UpvUXUsdonmo0v5N2gjlTyjrsmIsQYhQq05AT6YMt7IqwGut/gnohyQYViH37VvBHrf8lnKKOHpphZE0nA==
Received: from AS8P250CA0013.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::18)
 by VI1PR10MB7634.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1c4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 08:44:10 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:20b:330:cafe::9c) by AS8P250CA0013.outlook.office365.com
 (2603:10a6:20b:330::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 08:44:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Mon, 10 Aug 2026 08:44:09 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:49:38 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Mon, 10 Aug
 2026 10:44:08 +0200
Message-ID: <9d7defb8-a05d-4fd5-906a-1c2b623ad087@foss.st.com>
Date: Mon, 10 Aug 2026 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ARM: dts: stm32: lxa: change stdout-path baud rate
 from 9600 to 115200
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, Marc Kleine-Budde
	<mkl@pengutronix.de>
CC: Alexandre Torgue <alexandre.torgue@st.com>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@pengutronix.de>
References: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20260611-lxa-stdout-path-baudrate-v1-0-59b60a5069ff@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.79]
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DE:EE_|VI1PR10MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 00a8c519-da14-48dc-7c6b-08def6bb8bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|7416014|376014|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: MW3IHkzP7R8ZWUvcyGmy3TjvgS6euXf6qADd+NxfQUs8EzRsFDaKhl0BYFFEcyZVQD+Q62OHmVcFm3ZrRpQYVZrRTzIYCA3gFMa2SRkpIFy/4WThR+EyuqTyuQJlLnhN+h1tR2jifq46fHVlZYerLySroek4lvGWLfsIr8tFSxWkZBIsy2UcF/jjWIb5TLmS2rYIKLz2kfv1Q+d2dx15imhC7h+iKeYxiylf+eRDh1ktqbDYvfENbO61YKODIY6WgjGcLrmj8Jpplb1JdtIsJq5qWZoIQFexcobnvr1KY01a0hREJ/VncVscWMgotSKSHWwLI7uKVfhJHg7cwgJDKIBMeD0i+g6a2RLrn9OhVqCxSwjM5HtVY0rLw3tvM9jfe9snDpfxb30XlKHoM69Fj7JJJmhiIK3CYDpOg4Wt/EjucXdKvD8kXnQ5EWt1nn/+GSZ3ujyu/f2wyYeqFBuUrP6nlGr2t5Fya2JICjqb4rotPLWqOOnMgJzSeOrMp6RHk9WttCR3t7lt96gE+sHk4GufHYoZNIbIc897HPco0ASOHCZevmXIWDSHskrD6MGzLQi8HU5aYszUjADGI1fdujYCT3VqBlJUTh20zMfxy4YJ7yVM9GffgKUBw5HQK2ZJxXEznaulaUq5e+SPWVZ+pmM04n8AL/WcyM8xWQb3/yLIIQckaBj08IIxdxMUWhlejo/8J0HNnbKlSzxCP5rXcQ==
X-Forefront-Antispam-Report: CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(7416014)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U4IY5pUf8v/b+jUcNxubVlWaLpZjknd5ZNr2oVSaOkogdA/y344uJgKdG6uA65Cbr18Ll2XGe2iLSbNkmjjrChIFFfrHbR75zxigNOVd+IbaYfwPx5IV32xbKYNqepG9tpnhqYhhruTeXoxG2xqEhZTyvmx5A4yAe48aHpdaSauE2y/h5RXAKBGzFwB1RRcas7QeO2JV2CTchZYnoBmGaHj7SDTo7izQ2lVb+Y+It46/k2IhpzpZH9cbC/KlR0wPHQHk5l+rBdlBoSIFcP41mpxZ5Huc2OU6Qp08ujTqACFwpJBfG9VQXdUGZY4xu8ZG03rFokRIKDS0yR9CgJWjzos8zV2A+9OxG1SaTCvhWKOzk4nIYQk3nR92IcruQGTSRkHFeziET1WayshPhSxvqjmWIQr0jNpSHNh75XIaFlcUvF1wfdlE5wig7GCgTLvm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 08:44:09.9277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00a8c519-da14-48dc-7c6b-08def6bb8bee
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_014416_414412_7D54E61C 
X-CRM114-Status: GOOD (  13.73  )
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

Hi Ahmad

On 6/11/26 20:12, Ahmad Fatoum wrote:
> The LXA boards are the only STM32 boards that set stdout-path = &uart*
> instead of explicitly specifying a baud rate.
> 
> This would mean the default of 9600 is used, but it goes unnoticed when
> booting normally as barebox fixes up a console= line that includes a
> baud rate.
> 
> When EFI booting GRUB however, GRUB will not pass along the console=
> line and thus the board ends up with a 9600 baud Linux console,
> confusing users.
> 
> This series fixes this. As the device trees were added at different
> times, they are fixed each in a separate commit with its own Fixes: tag.
> 
> ---
> Ahmad Fatoum (3):
>        ARM: dts: stm32: lxa-mc1: change stdout-path baud rate from 9600 to 115200
>        ARM: dts: stm32: lxa-tac: change stdout-path baud rate from 9600 to 115200
>        ARM: dts: stm32: fairytux2: change stdout-path baud rate from 9600 to 115200
> 
>   arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 2 +-
>   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dts        | 2 +-
>   arch/arm/boot/dts/st/stm32mp15xc-lxa-tac.dtsi       | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> ---
> base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
> change-id: 20260611-lxa-stdout-path-baudrate-7cf454cdae07
> 
> Best regards,
> --
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 

Series applied on stm32-next.

regards
Alex

