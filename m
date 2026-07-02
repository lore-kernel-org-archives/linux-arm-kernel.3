Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4C3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 12:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgzVAKieF0iuF8m7CPEO5R6wFSEw4erbN+1y1QD9JfI=; b=hc6D8EkOy697tWhktKjk6mDtxE
	EUOQiFeXrNFXlveL0dKMLI9/0RvKKTYrsV/1AMXpbFNwKOwLisTOU+8F8t1mns8VtPadYa8XJ60RB
	hBmQ6H76gWr1gWbr+UaDfjnNGzlN9yyPO0nJz/7ySypRuaDGcd+jA4kwltaqtKLjvRgOZZseDeaLq
	GggMlNEDvmQ7BykDicvlQ6lsJsIMnuGNe7gYlZ79s6ZkG2L+3AveLDC41YO2rNnEH0YXUh6MHxJKi
	lQ4ZYc16CqBzKU+yguR6SoDuLJXxve3+ubLsxbNZqGBcY2WQfByTc1BvsuxxwHARtE3hklyRjaOXC
	4Qml8ANw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG9S-00000004PGF-1mAm;
	Thu, 02 Jul 2026 12:04:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfG9Q-00000004PFv-30Vc
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Jul 2026 12:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BgzVAKieF0iuF8m7CPEO5R6wFSEw4erbN+1y1QD9JfI=; b=PVhVq355kL01t7KbPUAo7JVQNS
	T1R/S5qTGeOQXF41vW1jgbea/TV2hzPne/L0OFCMAKDU7uiR9W1uBVApuMkC9szw7GbFuV8IKFMzf
	SbVzJkxb2yNOwx7RNLGisl6v7ORxIWD0nre6Pf40rDbcU0he+0h/2T+/YlREPvrYL9aMSmxV/hTln
	eIFQ5E9eX9kFBONRRhjZQk4xK+K79+mlwjTKmwOlTOlDkkWSFTLnMICVIkVeudmDZVimcve7FnNfA
	spJ2orvtiHDcAzPNvg/khlWSW7sOcUAUJNawYNrhZRAn6rcoqAEMVDtm3pnNifTLnOQ8eVfZg49Gu
	aGMKQMiA==;
Received: from [72.10.137.214] (helo=rfs.netwinder.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wfG9K-00000003mN5-2Lu3;
	Thu, 02 Jul 2026 12:04:10 +0000
Date: Thu, 2 Jul 2026 08:04:05 -0400
From: Ralph Siemsen <ralphs@netwinder.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Ard Biesheuvel <ardb@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Daniel Mack <daniel@zonque.org>, Frank Li <Frank.Li@nxp.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	"Jeremy J. Peper" <jeremy@jeremypeper.com>,
	Kristoffer Ericson <kristoffer.ericson@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Mark Brown <broonie@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Mike Rapoport <rppt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Stefan Wiehler <stefan.wiehler@nokia.com>,
	Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 07/19] ARM: update DEPRECATED_PARAM_STRUCT removal
 timeline
Message-ID: <akZTtfOqEftfT3ZS@rfs.lan>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-8-arnd@kernel.org>
 <CADkSEUhO9nhzQZCS7ZziCtMna+ibfj9_PbSH5R+c0pyi5viCvg@mail.gmail.com>
 <46f76624-ba35-427d-8a60-ec0fe39e5b8c@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f76624-ba35-427d-8a60-ec0fe39e5b8c@app.fastmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <ralphs@netwinder.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html
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

On Thu, Jul 02, 2026 at 07:36:02AM +0200, Arnd Bergmann wrote:
>On Thu, Jul 2, 2026, at 02:54, Ethan Nelson-Moore wrote:
>> Hi, Arnd,
>>
>> On Wed, Jul 1, 2026 at 2:25 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>> This configuration option is for the older boot method that preceeded
>>> ATAGS. This was scheduled for removal back in 2001, but the removal
>>> never happened, presumably because nobody cared enough to actually do it,
>>> not because there are any users left.
>>
>> Only netwinder_defconfig selects this option. Do the most recent
>> NetWinder firmware versions actually need it? (LinusW, do you know
>> this?) If not, can't we just drop it entirely?

Support for ATAG was added in firmware v2.0.6 in roughly Jan 1999, 
meanwhile the most recent firmware is v2.3.3 (still 20+ years old).

It is quite safe to disable support for the older parameter method.

>If all StrongARM platforms are on the way out after the LTS kernel,
>I don't see a need to remove this any earlier, even if the chance
>that it's still needed is low.

Also agree with this, might as well remove it all in one go.

Regards,
Ralph

