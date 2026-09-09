Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A82C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Ch7x13utIHgwLUu5zUZg55R0atEhpY6PA4Jn3abWVo=; b=Rpx8BYBQ1cnxGjMEGwyNOBIbof
	Kew1VGiN3mifoGWS9/li2yyCRsfp307HgE1R+GNguoqPPVPt0/HwhryWuOVuBWi7raG/ayrfZY9Aj
	Lvj/4BtWCCsg4mcW85ALTzJIh+NAz5alMKSU+ZJNl7TN3eVugeMTpbbJB+frj6a1d54l1ssjq1jXu
	SwlUCM98jilujFWNo4d40htfWXAoV6ctBVwutUrnIbB7uD4iZypzOwNmD0uom/88RyV0RWW9L/kLV
	A8LlZYs0K4pgNuwvLpTLOJl7yYJb+gFuJ/7KYsfNcOfUEegUD1v3QJa/2q6jWQBWDGo7ru3ow3Zyl
	1s/WqTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dbt-0000000B5dK-059D;
	Wed, 09 Sep 2026 08:24:49 +0000
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dbq-0000000B5cl-28LO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788942281; bh=DALhJgrp1N9sdmCEOJnvPHzTPos7appyxxVQnOEMFCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvGrjhs4cfqezCJ6hO0AJ62He6bHVP8uw0YXLGtu5sbsG0wXu/5zCZ65jVSllKuSp
	 7uX14J/0ozSfzLe8xVzKZwO6PQ6/Ln9GzgF2KTyHiIlA5SFEoc5W3rZyj5SkP9MoPs
	 DHAK0SaFNzAOTv8W3fjNSdXOzu3wGRhsGufLqdsoPg9ddXAYi2MXt1sc8zzMWG6WeZ
	 lp5RudD6KD4M4zz6+wkYnAqvevlpPBgs+nerzAtxWsOAU/G8XnIa+0O7pvuFx6YosK
	 n47k0eDeoCzxXrxxAwyylucyqzTfV5s8EtBr904uzOHvikCcUv1qJm2UZv9FgToWTg
	 mfw1y+VAyVZLQ==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id 9133887006;
	Wed,  9 Sep 2026 08:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1788942281; bh=DALhJgrp1N9sdmCEOJnvPHzTPos7appyxxVQnOEMFCw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rvGrjhs4cfqezCJ6hO0AJ62He6bHVP8uw0YXLGtu5sbsG0wXu/5zCZ65jVSllKuSp
	 7uX14J/0ozSfzLe8xVzKZwO6PQ6/Ln9GzgF2KTyHiIlA5SFEoc5W3rZyj5SkP9MoPs
	 DHAK0SaFNzAOTv8W3fjNSdXOzu3wGRhsGufLqdsoPg9ddXAYi2MXt1sc8zzMWG6WeZ
	 lp5RudD6KD4M4zz6+wkYnAqvevlpPBgs+nerzAtxWsOAU/G8XnIa+0O7pvuFx6YosK
	 n47k0eDeoCzxXrxxAwyylucyqzTfV5s8EtBr904uzOHvikCcUv1qJm2UZv9FgToWTg
	 mfw1y+VAyVZLQ==
Message-ID: <e337bf5c-6ecf-4a65-b8e7-e11bb9aba8ff@mleia.com>
Date: Wed, 9 Sep 2026 11:24:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] ARM: imx: remove i.MX31 SoC support
To: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Shawn Guo <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-8-arnd@kernel.org>
From: Vladimir Zapolskiy <vz@mleia.com>
In-Reply-To: <20260908152808.3928630-8-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20260909_082441_623355_2FCF1B4C 
X-CRM114-Status: GOOD (  16.73  )
ln: failed to access 'reaver_cache/texts/20260909_082441_623355_2FCF1B4C': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_082441_623355_2FCF1B4C 
X-CRM114-Status: GOOD (  14.13  )
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

On 9/8/26 18:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The Freescale i.MX31 was an early SoC based on the ARM1136r0 CPU core. It
> was used in the Bug Labs modular computer but ultimately much less
> popular than most other i.MX SoCs.
> 
> As the ARM1136r0 support is causing a lot of extra maintenance effort
> to keep alive and there are no known users, remove i.MX31 in order to
> allow removing support for that CPU core altogether.
> 
> The related i.MX35 is based on a slightly newer ARM1136r1 CPU core that
> does not have this problem, so there is no reason to remove that.
> 
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: imx@lists.linux.dev
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

I still do possess a LogicPD i.MX31 Lite board, which boots the upstream
kernel, but there is no plan to maintain it further.

-- 
Best wishes,
Vladimir

