Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AE3C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sqJsmzAvVdU+ObHxFGWkb7BkBsjzmkEndCdAUVN7nmI=; b=o6Udr1F6yXzmv0Nd1233hXufGl
	8O4jmSRa8xbzlXm2NsZ72l+LcLzL9c0UANghxSSUb4ttJPDPIvwtxMMBmtic229nWAQ5ESXBOiCe/
	6lcxcKDQW/YjrT0uRd+3UhyDbIHO2vR95xyfK7h/gHazn7iR8WOaJ7XKulF43mQ8sNTIrk7Hnva88
	aPkNzfU6DROE89P58xVWxWp8LL3jvAhRvjKGJJlz9X9qmOFGxn1itGjbrS7p1EqdIKbldp98x9qf8
	ekWr6oFlQGnMdUrYlLP6F8VUFwkK1D0vK3NKnlr9yOXRu6VagO87QKcdU69OANurWlvt+dRyEGGUC
	/Ot/9ehw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpR1-0000000EVw8-1pkV;
	Tue, 11 Aug 2026 16:34:39 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtpQz-0000000EVvT-2T3l;
	Tue, 11 Aug 2026 16:34:37 +0000
Message-ID: <eeb5c44a-6cfa-479f-bbb5-f557470258a8@infradead.org>
Date: Tue, 11 Aug 2026 09:34:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 03/12] net: pcs: implement Firmware node
 support for PCS driver
To: Christian Marangi <ansuelsmth@gmail.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Philipp Zabel <p.zabel@pengutronix.de>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 llvm@lists.linux.dev
Cc: Daniel Golle <daniel@makrotopia.org>
References: <20260811092843.673837-1-ansuelsmth@gmail.com>
 <20260811092843.673837-4-ansuelsmth@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260811092843.673837-4-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 8/11/26 2:28 AM, Christian Marangi wrote:
> diff --git a/drivers/net/pcs/Kconfig b/drivers/net/pcs/Kconfig
> index e417fd66f660..f5c9ca2e992b 100644
> --- a/drivers/net/pcs/Kconfig
> +++ b/drivers/net/pcs/Kconfig
> @@ -5,6 +5,12 @@
>  
>  menu "PCS device drivers"
>  
> +config FWNODE_PCS
> +	bool "PCS Firmware Node"
> +	depends on ACPI || OF || COMPILE_TEST
> +	help
> +		Firmware node PCS accessors

That indentation for the help text is incorrect.
Should be just one tab + 2 spaces.

-- 
~Randy


