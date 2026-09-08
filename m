Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C966C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 19:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/e0e19wnUZPqqLKoMAOuMvCVCDJrhro7wf7xxyMHwQ=; b=dqnA0Evq5ky4q1j/3JO8xg9oLw
	QlRY2eop/+K/qRz+1p/LHy0S8hHNPly93D0UMaA6PVxRkQbeQn4F7CBvCe20mhpym0t6HQkZS9hyM
	3V5dCdz832LU6ZwFmEw/12t4Q+qXzdK1LxneImC/xZ+HF3XCPlYD+CiiINgwV79ZtTyXEomyosJT/
	d4kQpvHhMkT5QpJ2gcB7/ryxEpzsoovFxrjDi+EpJsvf0LFgcstnfCBzfRSVCembOvHuXYMD9Sbls
	F6TDqg6Qqy71KcsVcaj515w/1S4gN4d4ylTbBNJjqcel4x/rJfyxKvjIdAacmLuvBs/q9IidrwcYp
	25VhF+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41rS-0000000A6uR-3ci7;
	Tue, 08 Sep 2026 19:52:06 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x41rQ-0000000A6u2-2I2j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 19:52:05 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailflow.stl.internal (Postfix) with ESMTP id 85A461300173;
	Tue,  8 Sep 2026 15:51:58 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 08 Sep 2026 15:52:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788897117;
	 x=1788904317; bh=A/e0e19wnUZPqqLKoMAOuMvCVCDJrhro7wf7xxyMHwQ=; b=
	P58IFdzlsTgXoIoBXikdguZ2nXztIlOBmxSodD0WXxYGPXO7M4lOhtfguU9SFu6J
	cZgsQ/MZNekvR/WTiAfwjQoPAlnY4C31oKHSM/gUw7nate2JrzT1hrPeXu30q50+
	BJRrLjVcjAnQcsooyFAIDNUODUcEjo5mJiikG/StoC8C8RvkYG6C5PF2i/5R/VH0
	6C6xFQ4NHddZjgk/6ybGeMryB7G/oCPHBtmu0qrWWDY3fMO0dCNmCw4zy5DMld7u
	G3XoIKaOaFvfpelNde4g0yvWU0Xk9vSSSgk0pxvKieO1hY0F8aWETnNJkwHLMDSE
	nPKb9twScg/ZP4yivk9YyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788897117; x=
	1788904317; bh=A/e0e19wnUZPqqLKoMAOuMvCVCDJrhro7wf7xxyMHwQ=; b=L
	RFD/f46Bs2KJfmFUvSBP/7lf0/w04iiwlgU+qj08BF5beouVQdNMJbf3cmEf1dcX
	NSaypUIjdLDP1C59SiEqiTbSDjBZnklDAKzXCpypeDuVI6II3x5l1NuHDYdCJ/ho
	EKQPwe78auB/W3y7wrKBPSTdaC2ezdAq4cMGvcG8m5bZUQk7R0f9+2iZoHBoU6oc
	kAvXYzPBBLCuULkeApaNoOfUOBO778CMTTv8FIY80/LvhYH63uUbOl0hRvwq30RH
	43kWnjBJ4gW+iGa1p/Pp47lflnCRJC31AeIK9cSMnxnaTlNJQA2RbC4vGOIeemdk
	b3Li2jcX9oMMgrcqkxW1A==
X-ME-Sender: <xms:T2egag5oIkuupeSIYDY94NunnRRhZIxEezsO8rpn3e3dl3iPrchJzQ>
    <xme:T2egasu1mdPaxP9s5F92AtsAgInsQsD3MBKRHJuZTHdkt2bN1j8pzKnZjey8JjmLr
    xQ6KqEFhutp-cOjg1qaXfhchPuC_kb1VnwNt6AicVHDFQpJ98Wz_JE>
X-ME-Proxy-Cause: dmFkZTE1Y/y+iXHrT4A989RrEgu0WXpfA7PAMkeHi9WihMt0TWWMtR/yeXyoHJrl1nWQmF
    7TF9E/yrsVXkvWrzHR9tCljohg66JCwGrfHpeOsdV/8TeksGyT4UgQM9BDOKl2/9dooW98
    VMeYCwebTyuaL/I24VjdGNS2Opu/hxKG3Q5gsD/wZU49IMOPPWbh5LrEMNOqEq0m37O1HH
    Ipa4ffH9ZrQf6phbhHSzBRN6uNfWxpxExSFKFxbG7ndmQjU+NUVSW8+9dHbfO0fU9VeXSX
    mqQq7UYma4YiPTGbM93H1k50hN9X2iydbnXKAlinNkbusXfalUmxf/BAdu7WUDqL33sLbU
    hEigDe8rdfutTXBaUq3zw+iiKx6t8HYXdqZEejcdDB1br+Lp3cd6+QYtOs/OsbmVF1qNTS
    Rhxvdn1h6HI8HWEfrr2fwCrbo0Wmvihd6JP+pWUxCkoTdfLR+sCm2BaKLS2qMiwBn9cV0O
    TmXjGJuISjoOnnDb1s9pb6+Utb8BQkeSe0AimVI1qzv3cfHso1rLst7Z/sHjnQFQEcAUrB
    kkM1Ra3oyPOYQFSgzoceKCG4CH+vqVnToW2MpFprAe67sHiRSlpvqPUPieu0DuK0e47b21
    XMaOzmnHsBo7TRE4emvWAa2h86Dqlp188ynY4lC9Iiax1qTcb6Q6j+FOxKQw
X-ME-Proxy: <xmx:Vmegag89zoQyZd7bVnRNCeqp7tMNNUpUcO1GkHbVWd6fN_k5yDnR7w>
    <xmx:Vmeganv4hvj2MQSKk_aQQ_A2RQMYX74hr_WLF-nXtFyP1f0iSYd_mg>
    <xmx:VmegamIudnmukHuTPOYl0uLi0lqF_qVVDE2nQfPnkXBZprX-zSeErQ>
    <xmx:Vmegai2z5BFwRC0w2LiQbXnsdKFTnweeCfNN2o9Ixrv2AAKuVYKzwQ>
    <xmx:XWegagO5GSccbuwz4TrW8ZYubo48bMkCyrDqfEbHJ4MNRPk9XUvqggBR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 817EC32A007B; Tue,  8 Sep 2026 15:51:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AzMelPSusUZF
Date: Tue, 08 Sep 2026 21:51:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sudeep Holla" <sudeep.holla@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Drew Fustini" <fustini@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Liviu Dudau" <liviu.dudau@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>, "Stefan Agner" <stefan@agner.ch>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>,
 "Roger Quadros" <rogerq@kernel.org>, "Tony Lindgren" <tony@atomide.com>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Shawn Guo" <shawnguo@kernel.org>,
 "Karl Mehltretter" <kmehltretter@gmail.com>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Nicolas Pitre" <npitre@baylibre.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Andi Shyti" <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Message-Id: <85c2f9d0-0e9f-4228-9275-65e731def3b1@app.fastmail.com>
In-Reply-To: <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-12-arnd@kernel.org>
 <20260908-nuthatch-of-utter-peace-68ead7@sudeepholla>
Subject: Re: [PATCH 11/13] ARM: versatile: remove mps2 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_125204_632884_CEC8327C 
X-CRM114-Status: GOOD (  12.35  )
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

On Tue, Sep 8, 2026, at 21:49, Sudeep Holla wrote:
> On Tue, Sep 08, 2026 at 05:28:01PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The Arm mps2 platform is the reference implementation for Arm
>> microcontrollers and is useful for testing but not expected to be used
>> as a production device.
>> 
>> With all the Cortex-M based products gone, there is no longer a need
>> for a reference platform either, so remove it as well.
>> 
>> Cc: Liviu Dudau <liviu.dudau@arm.com>
>> Cc: Sudeep Holla <sudeep.holla@kernel.org>
>
> Acked-by: Sudeep Holla <sudeep.holla@kernel.org>

Thanks!

> While at it, should we also remove
>
> drivers/tty/serial/mps2-uart.c and related Makefile/Kconfig entries ?

Yes, I have a patch for that in
https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git/log/?h=board-remove-7.3 and will post that once this series has progressed enough.

     Arnd

