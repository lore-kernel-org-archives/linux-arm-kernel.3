Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A93C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SEm8cfvEI16A8HFN9NKI1hzRPfiuDbsin9gZ9ScTug=; b=Ulfr8q5nHquVfaJ5wz8VCtdMYl
	aqjxCkqWASXQN41S6npRWoRUck/qHREnXZ6lzEQmEtFRVqVNmWUHs2cZ7WRHLYG6l9XocACuFYJkq
	eCBpFBbuUncN3xg6t8Sf2+RSxNQJJ/20q/wd4AV3dRw3bdc6aaVpR5Ny2/mr3oZWUeds6W9fKLQMd
	GW1huJDJDVn2e5NXDhQKF5o7rRkK2lp7DaKXwyB917A1y8gtdfjxTLEAafX2RniRHWyxxBSUeZKol
	LFHD74mqzU36prMLygrSxZp9ng40CGroJ4cxOlwmYQMW2X5e60aSHTH8uKHApVTnbViiVoNdpO89s
	4O+tAWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHor-00000004Z7I-3k3H;
	Thu, 02 Jul 2026 13:51:09 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHoo-00000004Z6c-0aev
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:51:07 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 4ECB6EC01BC;
	Thu,  2 Jul 2026 09:51:05 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 09:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783000265;
	 x=1783086665; bh=1SEm8cfvEI16A8HFN9NKI1hzRPfiuDbsin9gZ9ScTug=; b=
	tkPufZp5iV/NAB1kjJpE72IY8w0sksXba6R0rlaXrXLpDcUdfhJeRzwRbK/Bubgk
	6A3xlHSUEsVzM8ncLbuaeyQbwkdAsZ+PjhKExO6MxtWhImXfZ2wXqTRrNf5hVNkF
	XQrVfK7xKemkl8ekETGtiqmPx8gs57xKlni18ei+TIJXaG07H9gnYCj/gBskMEIX
	GKbMMHXfMqW6J8e8ad/1mXzXumEnLW++q0ieiPUDNzJ5w613eNvFEKFKZRbE909J
	04a4/UfZMJ9YLtCY4XIHPQHVTmU1vjY15l5pzfpV7LZFOEbJ5UxmEnhNizNYOzLi
	fsi0yOIqwgG3wYwtb9dEgw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783000265; x=
	1783086665; bh=1SEm8cfvEI16A8HFN9NKI1hzRPfiuDbsin9gZ9ScTug=; b=M
	AroIsoAiia8uM/tLu9Sj7APJ+O5VTNbae3xWCmreRFVgh7f8sxOu9wqrJ5nY4CA7
	u7NpTDcSjllhYbKvWWZB1XD6nCNvruANKAxzRRz0mhGFiXAGC9yoExEsqks1y6e7
	/ePSd4qwJfWbtFBiytv+ROiakNluw9VUq4Z8r7n4bvCHpg/D9c8e2K4jLpb6K022
	UsDuMvxGYtHOGAmGw0DTlMCRVUu2ncWHphkqqLKGGqJDrCkmhTDg4JmEZMUaW2Ev
	efU+GkYQZhPuy3mjHFV9Il2gc1KlaQzFaxLisPwJYOEMod/EqY9R51qR/7sKwgnU
	7iMx7wOgYqZBMKzLyHiKQ==
X-ME-Sender: <xms:yGxGauUHSyRtl-8vunOcIAf-DPtKxyzZ8uE7uxPhfoGg-fcrO-6HfQ>
    <xme:yGxGalbutJVYjcXoBVYNEe7iyDhw6uC4ZkS2_8olB2See1i-Gp2MSwVum_1AFNhVE
    qxNCaZFtpeztES6iEgejEds5uXSUXnpkFAFvvMF4J0KMm-eI0cccwM>
X-ME-Proxy-Cause: dmFkZTGPxJhHsrrzS1+dKQQKy0RT1B+UuFHRYC1qVU170b6iZjI75u0jFkhUhWsyjaGvWO
    xFzeB92uAchtxlzM7Ol6+lxBH0ehplXQMzellorW70jKeoYvhdAFJf7wPyjeG/xb3vJB49
    uEHyU2tNHuJaBcYH9nHmlwiA6kvtBKGl9AvT24gIqzM5Zh3y0Ly8ECJKdZACvvrwC7s+tO
    A5pNJ6PhZsaeo6MFDmA9jE/DZDhnF0lJzIu8I2e6artta5SVneUInTxwGkEBDP77xhDcDc
    JkBpuXSgeFEqBiI+lQzTs7mLVOyJMZ9GZcj855sA3oyMAIjDymcf7F6UdpxbMGgeVYt6Al
    CupGJIwtLPBS7mjm+G9tkSgwlyf+ZSV4lHeyGJBxSvJC+UggVjqBlC07BYAXrf1awEEgsg
    OhgNLoVXNBE9l/vcKc1vYH43GNw9eZ+mZmZQ8GqxeKoiVjKZrmkso4bgLLaVfjk0T7DqoM
    ylf8P513MQTtPS2Rb8IKkhJ59EFAo8bfkdHm4gBGWbkd4ik84qcWaXx2zovjpFwp0a9l6/
    HTsfcTYMbTXhTNbiQ+JjPJvNvXl1Mn/lRfjQYYtpiiz6nG7yMQhdT8GXVteF3QRRoAz8v7
    0+PJeGGJuX64xxj26/q/mXQuFc8Z+cXHUEj/v1j7YBGvu9T+mZo1SHmSOUAw
X-ME-Proxy: <xmx:yGxGaojXErSxBvfTSGmy_Odi-YxDQN5NHeye7pOWmsU28TOb7l12gw>
    <xmx:yGxGan1aKt9k8JEMlFYYdgMa6WXnhLxqoTXBlJD8JLcPXIrRWYUhIQ>
    <xmx:yGxGapBrHsGz6JqD1FDzOR24cJf1wMx-09GuWjWYZ6ixbILvvJSD0g>
    <xmx:yGxGasH3WK8bNoj5tZxWSwpIqCZDc9Yex2cKKQqdAeloWKaiAdq7gQ>
    <xmx:yWxGao5J3REwASpqXJVZTV9R87TPNOA4apIWtxKx6tgiSBWqlqi6PBUH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 33D8C1820082; Thu,  2 Jul 2026 09:51:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AHl9TlhFlo5N
Date: Thu, 02 Jul 2026 15:50:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>
Message-Id: <b152bde8-c93d-4b50-b3c3-55b9b8372f79@app.fastmail.com>
In-Reply-To: <20260701212353.2196041-14-arnd@kernel.org>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-14-arnd@kernel.org>
Subject: Re: [PATCH v2 13/19] ARM: orion5x: mark all board files as deprecated
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_065106_250037_59113444 
X-CRM114-Status: UNSURE (   9.67  )
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

On Wed, Jul 1, 2026, at 23:23, Arnd Bergmann wrote:
> Debian has previously removed the orion/kirkwood kernel
> binary from the armel distro, but building custom kernels
> from the Debian source code should keep working, so
> removing the board files after the 6.12 release ensures
> that this remains possible for the Debian Trixie release,
> assuming this will use the 6.12 LTS kernel.

I noticed this paragraph is outdated and have now replaced
it with

|  Debian and OpenWRT no longer support orion5x, and buildroot
|  could keep using linux-7.3-LTS for a few more years.

    Arnd

