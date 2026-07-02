Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41494C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 06:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lr6/nGVMqbFj04a/oTKJJK/EJEvEC7baqIvXkj+U748=; b=UMgDoF8tlLYdw4a+WPbdrBTwyA
	L5SSkQ7T+CR3dYsNhoLnjpAmY+TDyFaPgoYKAwLTEGsMijFkHJYXY5dRdDfFZ2XCFD30aLB09dA8f
	wdt62URBj0tyBozPrJGiBwwBui4CiXWWN0hbSgtQdVTWZQNd9xJrrPxaDeUwzzoUB7QCWQakpUmsJ
	kWufQhuZtj8JxyC24pG+nQrNL/+Hw3XCnXDxfJVkjEhDuMcFmQClNO6D+7bO+dirX+TkdxuhvG71Q
	MEur5sRTnHyD+UTwS7Oaeg4tQb00PSmrGxvRbNKTGE/1kitNcRDJn313vf0+q5p5XcSX3MTq4W0fS
	7a0K6Vxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAVG-00000003cRw-3w7Y;
	Thu, 02 Jul 2026 06:02:26 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfAVE-00000003cRF-1mxo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 06:02:25 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 81E4414000F3;
	Thu,  2 Jul 2026 02:02:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 02:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782972143;
	 x=1783058543; bh=lr6/nGVMqbFj04a/oTKJJK/EJEvEC7baqIvXkj+U748=; b=
	wIbzOPGoCwjGyOHPdmwVicmgc0hQgjfv5nUzg1LLEf5GaCP1SqNESgHBbk23VE7O
	jLq+w3C003Y578S7klJfk30nSeV4afRUrZl9e3TvugZdNd6XjhEOBQcyqSUTpEkH
	oByxI2zX/4NNpmkvqjENxhf4xe7T5mjIENxHepQEPmrZx2Btzexg6BQWRxZVrsqc
	+S5cukDaj5KkpW8WZP8V0yc3sOa2m8SGNz0kOXVgaUW0HO7/gprJnHfpVd3JQWgC
	DACIUmaOkU40KF4cnkq0LgSgEN//LTcs2L2tGJlCHcRx2Fqsbk4Z52hXGHhrBSv4
	afHIzhqeFPIZgm6PnZc7ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782972143; x=
	1783058543; bh=lr6/nGVMqbFj04a/oTKJJK/EJEvEC7baqIvXkj+U748=; b=b
	evxQom1a4u08OpoVX3L6Z/aT5TnActVsQjVhmTqEFZHvHaxzRGwDng3h1i6z/FhB
	RplXXFJvwFIhGjttdwXjK6UJMIgqsIF/Id65CNILZ9AQiJ4N8K0ioPz8DMHZ4d/Q
	MdyMDZx8e7yu064sNweYkTUGxsf/+oBj1UoRum6Y0WCvQTp9E1yacm4AYXEN8Rza
	8j4dauT9xB6wVqARGa3LH+EE6BdNpnoXWJERpEaxWvSStzLbywYASs5ilc1o7009
	48hQcAELrXb2ZVTyFMRZW7WL8ong6Qzt0ggQ0ekgzxNu1JceKklgodzy/rLTJaRw
	Vyow/FlfFbk0kv9Ee/+yg==
X-ME-Sender: <xms:7v5FapgzlMvs-eAX3PBSbR1xw83qgsjI5wzfmLKj6n449HpLEUq-sg>
    <xme:7v5Fao1bIxCmxkw70c8_Fn5qen-_ZJmkaIscpjXMdcHU5-VXA72iDscUgS6_y1uOx
    DZ1IPdRyPR0l980_iUfSuxHQaIMyWZeTGyBykOPo6S3eDeyNA6q3bU>
X-ME-Proxy-Cause: dmFkZTE1hwWACJKEFIUoFEnQ5OMi3j19SlP0C3otzlzCF8RUdgGEVzHBBEEzC7QNVT5mdZ
    wn5ONexXjZdSnpsWV63fsi8yrSf+f0LgPP/04gwfVqXs6uZvmMnVveKzmnmq7M8TlGIsLG
    T5vAg6REddxJvKOG/NJdxuW8enDsm68J5OifLsFdBqJbkqZvOuef21J+fv1yCO0emwuPYr
    E7kdFxLg7/71Gl3GME/PVUqk8OqK7ga5NomWM2Dkw4oeUs9BB1Qrt53CTvCyXs0fEI3kRy
    odDCY2kTsKRJT77uzAnKwzv+YVRBIEziVPFLk8/tWPwMCVk4wlPFnD44IGU8oPgBMz+/lV
    c0tKmOqBqsB3clrHc6NTXwgmDAmFC0J5KBaSXQgoV32/GHhuBlSxh8EJNy+TmlEUJCnaHo
    /lOPmqF6q2pd0/MuRp7j565E7sKjA2m3YeuGqd5PPPLjxhqiurDJDutc/WZgCLdyD8nzwd
    pk2wvyyLpvOGXuJU1B9FIdljfZX+X10vY4CrdCHos/aHF5IekDLfsdBv2Yo+USiaqTfKku
    +sLLmvpisHSN2p5m0XA5Jy9l9uCt3l10avGs7dzFccSTkxFxKwfmuSkASsq04Q6L5xZ/66
    9+HYHPfEXPvbc7abN0WmFi+x0lVl29l3cmEzhepg2k78hk9Z+3yla5dF1DGQ
X-ME-Proxy: <xmx:7v5FaruZA2SC-0IiJulQMnJ6087TcCm3EXzdAVzHm3gYYz4YuFUyLA>
    <xmx:7v5FajTcKljnvAKJQjysI4a2ivYLzpho2u1QD-J9F2Vz7N-6_U2ZCg>
    <xmx:7v5FansQlAEx6tz7RH8nTbvu7NyVQ-rG7Pie1sTCKDBr02lSMMw3JQ>
    <xmx:7v5FatBRP6bykKDJb8cDyiE5DPWufX6goN4riQbLvA2EHmzrihxuFg>
    <xmx:7_5FamHmBpmSGd3sc1DlJch9jxxUCjRyxoks7OQPmEuQ5TTZ1vCpn42G>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8362E182007E; Thu,  2 Jul 2026 02:02:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALI-OaCDsipc
Date: Thu, 02 Jul 2026 08:02:02 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
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
Message-Id: <4099d875-0da3-45df-9abe-437d688039ef@app.fastmail.com>
In-Reply-To: <CADkSEUgm4yX36W6dG-5WOm42Z3iDpHVcz73suWDN3=bsGgq+0g@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-7-arnd@kernel.org>
 <CADkSEUgm4yX36W6dG-5WOm42Z3iDpHVcz73suWDN3=bsGgq+0g@mail.gmail.com>
Subject: Re: [PATCH v2 06/19] ARM: mark CPU_ENDIAN_BE8 as deprecated
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_230224_694308_54BF7896 
X-CRM114-Status: GOOD (  10.82  )
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

On Wed, Jul 1, 2026, at 23:57, Ethan Nelson-Moore wrote:
>> At the moment, there are no known bugs with big-endian ARMv7 mode, but
>> it does break occasionally and require someone to fix it.  By marking
>> the code as 'depends on BROKEN' now, it will no longer be covered by CI
>> testing. If any users remain, they can keep patching out the dependency
>> but are more likely to run into regressions.
>>
>> The big-endian ARMv5 support (CONFIG_CPU_ENDIAN_BE32) in contrast is
>> still used on Intel IXP4xx platform, and is the only currently supported
>> mode there, so this one can still be enabled.
>
> If IXP4xx is the only known remaining user, would it make sense for
> CPU_BIG_ENDIAN to instead depend on ARCH_IXP4XX || BROKEN? Is BE32
> mode known to work correctly on any other platforms?

This is essentially what we have, just expressed the other way round:
all ARMv4/v4t/v5 platforms depend on CONFIG_CPU_LITTLE_ENDIAN, except
for IXP4xx, which depends on CONFIG_CPU_BIG_ENDIAN.

        Arnd

