Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F89C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0qhwNl8Ti7/+PwPxJQG47LfuEzLVphs4ZT5l2JYVBg=; b=wg9rFr5C05ZPjlTRqM7ONiF/Tp
	4FuotA9HRbIBBYw0iGKLYTEOlIN1mkwEte6QC/Tti2xUbXAEK/Io6d/fj3EH5PmDbsN+BQsrSGuYu
	POhKj7dWVcqHHlKftsFtiJBITHRMAmZK6r6qbXdRGxZfRgCLbU/ZbXWF9KVCKTzFtQsqvEnS3eylQ
	/sWcY/UssXiI/TnUWoWdvY30SeAUbd05T2X5XEsiII8+qQ6CGfzU/yA5fsZ9LBsgAAdlviQJsQob3
	825j/15e+qD26Kn0hH5dboc8t1Mt1JKRdGMB70iHENPP4EQV+feRm+65IucDB6546iMY2g+fksWyd
	EvRjZeWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHnF-00000004YiD-1ioZ;
	Thu, 02 Jul 2026 13:49:29 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHnC-00000004YhV-3ZS2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:49:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 1B7CBEC01A9;
	Thu,  2 Jul 2026 09:49:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 09:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783000165;
	 x=1783086565; bh=s0qhwNl8Ti7/+PwPxJQG47LfuEzLVphs4ZT5l2JYVBg=; b=
	RfxLj7NcmAzl7mfYDbGMdp3IOFyLmhhvp8OkYXOBFgbccAzcqb+QfHWfDcA+1QVa
	06wtSgX6LWO8V1m2yPAkiIZbNuQyAxWkt2afRfn8zp9LRn9qOLhPwVigSlRl5PSA
	Oe5ux8Ju/h+qGp2UgXP09+RRFZZZasEfUBMiYPlt64Z47JKrbpLoy8f21II66NVc
	825v+UMws0SrHnbTEHmQ0LgAaGVQx3ZSowGrSwVTXrFkrPdautqE6ncJh77arosV
	tgPooiLtmX+Uny3e0S8EZ5Lfu9aP2nRSU97TnhY4kalcY2kjrL1plRBTXj0ofQa7
	o5zE76UCAo/DZ/w5Od5WoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783000165; x=
	1783086565; bh=s0qhwNl8Ti7/+PwPxJQG47LfuEzLVphs4ZT5l2JYVBg=; b=E
	Hv02WVmWKPGJ4iQGs/semYJXPz+0ajOJ5zXcB+QIqXhlBH88yW/A68GofZwEQX2J
	0Pj3rZYuMRjMztHg+vip+yVDtUE59ye5pA2USRovqkSrRo3GQ5QioJwuE7rHPgb9
	pnFiHqr0iE1gtj/RIBIbf7cyZxqdt5HymrF+ZVZAb0PYBUq30iEXPeVA2+frjUm/
	UMeLDMloeWMyU4lLDgPfAffuM6H9o2X8qeN27123d/DMI04Lz+4fUbYdCRQM4yLD
	FkddA9yEUeBJk9UPxDNGIiT1haBtJp6yiG8TTyocu1AJNSlcOCyVG5Pq1nUWa84M
	ChzFy7cVzLCga1vAPtOKQ==
X-ME-Sender: <xms:YGxGaqY4jvCggJyXt3tN3p21nYw8L-JbKFMn16xKRdM7JKMbZRn-jA>
    <xme:YGxGaoMWCjwKYV09MpAUvJpe8YVap_AV1L4Tcsn79PSOO91cFlOmEIjtnt7sKu6G0
    wzzXdWpnVxtAnqQDkpLeUuBrkSw035d5P5i5xgtbpCPO4q32o30ObQ>
X-ME-Proxy-Cause: dmFkZTEOx1CG+3Lucry0wYcMqSOqV+ylcgCjt+9E5QrzG0j5axr50UlMYJ0ar0deYl+kIe
    OYMASixdZaOwVrGfrHD1ZovcRUIeNiPCnti1MXqMwO6n+t939K5eorJCWKuGHO7q9EBfEb
    a+6ZL6dLd9jl/R8tae8AlP23rbJpGw+93qRZshPuhYfxdXJAL5EwAwQecijNYFS5gNp1Tr
    tSGQZFl21b0JfEQgBKiofkwlxwtYpkGfQ/mfH6tPim2h52zXVU8trwqIIyHhe8JH2CgN/X
    0Z/YGFUyg4xTmfbe5tjfb2g4uCQm6jfsuLHMzUr8vxAHRoCZDqr4wyvmr+kM2midKmKLW8
    qhbzZWRAlxMdUEr/QnWimAJngJhosdaM23VyuctJGyII2pCd5Q/nolS77P37OD0WnCvLPj
    TwxxjEhp2FboNjLqk13zLqa7P9MdAK6wB5LSVR7DF1ySaQF+KNb3CZMwm6+avI+vphLEDX
    5R6DsqbeIb9utiNP6/zOob8QQBz5aBTeVwoQawnaOcWelIvLsSkSqBrOQ+HnRzHtOyzUPy
    c0KtBXT5kh0BaoMTrvYTi70bjdB9YQKulYauZcjQ1E3MxYxyGUhtCF0grdv+lcyX45NpSJ
    6gx6Dyl5+la72Lu9LW76fIWJxnYycWZIdyc0cTMYXnVTbIgVydcUzP4dNXAg
X-ME-Proxy: <xmx:YGxGalwktcZP-iPMemPMOvoFRC9sc4T1K31iSqKBGANQSMcrrm5Yvw>
    <xmx:YGxGarlrBDqRAb17XNpShh6cPTJT6UjF405KxQNmBNGRhABinajpKA>
    <xmx:YGxGalWJwlrCqn5NbsrHBNq2a_XA7r2tZ6RudFaUtCBUkgEFv0oIRA>
    <xmx:YGxGak14jxtoZXIjGOfW6WwJQVDUhYm60zRSewWQu9rY8-0tYGL78Q>
    <xmx:ZWxGamI7jum-I3CinoiO5DRrkv7Yd91HMyrwgJ3AVp6J9_DB6vQQOux0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A04F6182007E; Thu,  2 Jul 2026 09:49:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ADtf3HBnvRk-
Date: Thu, 02 Jul 2026 15:49:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
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
 "Will Deacon" <will@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Message-Id: <2e7d9365-ba32-4871-aacb-c72c3adddfbe@app.fastmail.com>
In-Reply-To: <202607021346368633bfa6@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-4-arnd@kernel.org>
 <202607021346368633bfa6@mail.local>
Subject: Re: [PATCH v2 03/19] ARM: rework ARM11 CPU selection logic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_064926_961104_1F617C96 
X-CRM114-Status: UNSURE (   7.95  )
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

On Thu, Jul 2, 2026, at 15:46, Alexandre Belloni wrote:
> On 01/07/2026 23:23:37+0200, Arnd Bergmann wrote:
>> 
>> To my knowledge, none of these have any actual users aside from
>> reference boards being used more easily test the platforms.
>
> There is a missing "to" in this sentence ;)

Fixed, thanks!

      Arnd

