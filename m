Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5728D25B76
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5JCMMNEQztUBwudeMkHWDAcD2USZ9OKX/sG/bOWf9o=; b=C/j7tSPJPAp4BQ4W1YJq7sY9aH
	uEIp3M6vOQMR62PS1kJHBsd1EjLUW07bITgM9WMeuV8yPf6tjNbJzISBiXMN2lwFA1xS4iC8MLuFk
	0ByHql+V7NSbs5jdy28IZXUu3KgTeqXmbMSPNcjptXzTbtpKuVno+KH+pa3tApn96XfL+YSKBxRDa
	WM7Q0AL1ygcMQASCz86KhHp5+hl/nt0bcjqv/LyrNkAbZpCuRMI0LGJZGEPvfSoShHY1I0Prp32tf
	Jdl9jYiqTsNga6E3zWgOhxePISIrsLS9EtErHJ7ZCaoWMIQRo5Nfb9sX6cq7ur0NBPQdOeBa58f/o
	mBRKWMNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5ar-0000000G3z0-2g1f;
	Wed, 28 Jan 2026 13:28:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5ao-0000000G3xM-35zi;
	Wed, 28 Jan 2026 13:28:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C7596C211E6;
	Wed, 28 Jan 2026 13:28:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3FD826071F;
	Wed, 28 Jan 2026 13:28:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8C84119A880E;
	Wed, 28 Jan 2026 14:27:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769606886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=B5JCMMNEQztUBwudeMkHWDAcD2USZ9OKX/sG/bOWf9o=;
	b=Ny2IcdL+0uvG2HzvmhoJYWRsybshnbCU63i6zoWkLe7lAy/SxM+3RQH3HuMhzcsKDzthvm
	Ncv2bCC9ZuxwqZmSxakO1IxqCwaqG8nj9SyNQpC8rYdLiUHdnu9hfRub5Vp45wO3YD3F+P
	+Lr5IXCVwi6ca6GQtkt2yTTywD/XoJXrSE4Adf1x/LYAylM0xnu1qKKN+sSk1LK7BT4NCF
	J8N2tya1yRQYXmPCOCX7/zT9Id6idCLqeycnBAIvrq6hCKDBjUMqSKd9WNsBw3xU2W/zn6
	y0EQm4XwXf4KECtIKvBgdUdcbPezhsRrgBgrYlfDGhgvDexOEjQkmSIbQ/zrWA==
Message-ID: <0822e32a-3914-4678-af1b-f811a11ee2c8@bootlin.com>
Date: Wed, 28 Jan 2026 14:27:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: stmmac: rk: add GMAC_CLK_xx constants,
 simplify RGMII definitions
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <aXnrzIbZN-gaZTia@shell.armlinux.org.uk>
 <E1vl3G0-00000006v3R-2ZBc@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vl3G0-00000006v3R-2ZBc@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_052822_978402_50A82EB6 
X-CRM114-Status: UNSURE (   6.89  )
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

Hi,

On 28/01/2026 11:58, Russell King (Oracle) wrote:
> All the definitions of the RGMII related xxx_GMAC_CLK_xxx definitions
> use the same field values to select the clock rate. Provide common
> definitions for these field values, passing them in to a single macro
> for each variant that generates the appropriate values for the speed
> register.
> 
> No change to produced code on aarch64.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


