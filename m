Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99994C43327
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItRb5YyzJnwgrGcK1uDkzjTd7POtGhF69tiLiuBSj6c=; b=tfPTucEdThDYg6wjj7TbjTw7Kj
	PmOVFw3zZ4NbrZEEdjpOf8mAUgGRp8X4VEtHWDCyP0EJJ8g93CHy1MpKFYzzYrZ2ZCjfFvVoE64mP
	liQ9Fa5IP2oizC3hl44pdyXq6F66MOTwg8uo10XdT5raJONipeeESok2ykzTtMut6MobqbeMzB9Gk
	dsZP4E7mj6pheFlhnIgdrWRHPcynhMUl8da1JEIZ0wqyDOXtiYIPEJQIupBQwZbA8rF/gWur/20Sq
	L2zkXM5JUz/W/23dmSoVj+YHVofxUYw/nDxhjjUPdFaC7qhm+/AcVTWT4uVgoBsaantQ5IUeH17kT
	aHLW33xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCuK-00000003tLt-2ecN;
	Thu, 02 Jul 2026 08:36:28 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCuH-00000003tLa-3Dja
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:36:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F319314000BF;
	Thu,  2 Jul 2026 04:36:23 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 04:36:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782981383;
	 x=1783067783; bh=ItRb5YyzJnwgrGcK1uDkzjTd7POtGhF69tiLiuBSj6c=; b=
	gJbpRuRSvgqHQmKRlBRKpXWwWN442jBJ8LnI4eELmkWNenMu/LhbJKBw9dnHbbKC
	JG+SDSPcyh+Dis12W7Pesd4GsNH9XQ6l4UGb4TI3SijJc7nmbREwwfE30D+ESAZQ
	GzDnBV1it8E4yy8Uw01FAyrtwgocJcJWeRvKRxZBnfX9qzI554HLt9gGdwxsmLMa
	rqFTt5vF+02BtsVPqwnqjx76trgYGfRvwmy9dVyGj7iNHn5fTVxXwoUGzOLqLLJ6
	Djvf7Pn8rRs27VqmRLeqnicJoYqFRMZ1mHGCQHtRtzAdpTgbICdhE/n3EBN5qND9
	kqh5f5B7DoNxXZ2aH4IQcg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782981383; x=
	1783067783; bh=ItRb5YyzJnwgrGcK1uDkzjTd7POtGhF69tiLiuBSj6c=; b=k
	Y9N0GnnU6ucrSdD7EMrTnPinNuQnC8PPRskR2ywEI5PN5mOWSgJuHRoIUY7OhK3s
	uK4ajh5kOEEzKtDjv4YF/gclFhpCx/vVPhS0qes2jqJubPUoDZz0PoFbzEMRJuWz
	nwV/wrOYpCD7nqdYsmAoxBndCzvUt8OoXL4msafiRhQpLaOZEQJAwEw3f6fR4Ijf
	eDs6jgvDmK2/Onmn1zElms+2dvcn8bUQ4IeDfViSS57BC9a0sily5MM6ZJAr1zZ9
	2f2PgBPJI2ONPHKF41XTMfuhOR5LPravMjOdc71gp6fTd1oxtE6yqlJW8JvpXe/5
	HgidNqpuyGKk2Pm6dzpPg==
X-ME-Sender: <xms:BSNGahG09UwAtgkEFwX2Iz9I83SniI6wr4Qd7c_9YHlas-63k_blqg>
    <xme:BSNGahLFnx2AR_FOyEHzA8LZQE5WqWtsT3p_hnYR_ShAoPu7WnEV1c-AtAN3zSRLB
    M1I9E7_Eu21_I_EYpXSTmQWNOzc3Z9ijudg8BqYbAtP40uyO3FlfPA>
X-ME-Proxy-Cause: dmFkZTE6mB3voIYf1j7QCePQp8dWZpfj6LKnXWlhlUVsV6D3ZTUV9sYkKASiWOV/niIMHV
    I0hhkcof2jkhQuSi80/kqv1FleZfUjkOuB2J30tViw/QPuULcoB1AQ8kgiRTVD8GRq/qSX
    hF+RT5dYpnz+YKQq3wshnpGtZIYoELsC3qa5qJEwOS0TyaRQ1pZnmYqSvz0YWh/MiqNO1H
    Tkt7XWBbQuwzaxujd2DXnBkS4Z8XUHmTrafgivOwd+GW62UmlTOVb0oR2zilLve6m9EFsp
    gE6jY+ApeXOVweaGo6xiPXFpljaQHZdpzedkzI71mo3Xm8Uu4sGp+hMF5YDCclO7QOb/OK
    TmI25GbGZUGqSzP0htyAQXb9pdORTIVQHN2jV0lvtH/rTSyQ9Etmq+TeVg1USSu+TjxAqF
    liTiKnXlquvbuS7nFCc5a2TpgV5wFo56xvLWDwwtVZLmD4WrmbgMujc86TQCfwHgeM7NWd
    H47g11enuogEjAgOYqYg6Vs16M4qmy57gQ5RkQH6CS8xVNvVbvpXKto1o/bdOrVBeG4JZj
    5lcsLRfFydU5tsqvMNuLauDymndrnlr+V8xOc84b2kHGrIFxCL5Dj3UtK2HIrMDdhxBFli
    50VleocWf+vTwYzEY4blToYaJIRR20GcxSNU+936UNAaU2CT+olMvEk673ig
X-ME-Proxy: <xmx:BiNGau9iwZklAUBf6Ml6Hd-WPEQP_pIvKTiEjPJL3I6gkYwsytZXWg>
    <xmx:BiNGalAi9z-FTouNG3Z_KzhQQ1Qk-RiVJxi7KYbP-Rf-tVmQlfLHhw>
    <xmx:BiNGaqDxWTjI_2qQA8e1fWh3wiMIHz_RYezAPwV-MxtIekskO4STFg>
    <xmx:BiNGajxC3quhIa5HW6WA0E_lzLFi_kD0rbw5NsQHvSutfg_4ig4ZXA>
    <xmx:ByNGahnMxun3MC4Oihj7Fgr_fnu8DcxoFsII875B2Qy8Ht5pj2IuL_Rd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D6E11182007E; Thu,  2 Jul 2026 04:36:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AWIzbxp6I0Vo
Date: Thu, 02 Jul 2026 10:34:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-arm-kernel@lists.infradead.org,
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
Message-Id: <88f5301b-9153-4f9e-97e9-6411a33376cd@app.fastmail.com>
In-Reply-To: <d48d79ad-6a30-4a86-8895-17d4e4fa2940@microchip.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-2-arnd@kernel.org>
 <d48d79ad-6a30-4a86-8895-17d4e4fa2940@microchip.com>
Subject: Re: [PATCH v2 01/19] ARM: use CONFIG_AEABI by default everywhere
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013626_188050_D0A93AAA 
X-CRM114-Status: UNSURE (   8.86  )
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

On Thu, Jul 2, 2026, at 09:42, Nicolas Ferre wrote:
> On 01/07/2026 at 23:23, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>>   - All machines that used to explicitly enable EABI can drop that line now
>>   - Machines that are likely to actually use old distros and had NWFPE
>>     enabled in combination with OABI (rpc, footrbridge, netwinder,
>>     assabet, neponset) explicitly turn it on now.
>>   - Machines that already had both EABI and NWFPE disabled in defconfig
>>     (at91_dt, collie, ep93xx, gemini, h3600, imx_v4_v5, integrator, jornada,
>
> For at91_dt, EABI was explicitly enabled (see below)...

Right. I don't know how I got to that list originally, but looking again
now, the only configs that I see using OABI but not NWFPE here are
spear3xx and spear6xx. I've updated the text now, thanks!

     Arnd

