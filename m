Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4685C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LonbSv6mOMlAd5WzTKA2LLMgfG2NEu6AB9P2wuSPqmY=; b=TbFQvb0JIhw3JETtn4ZiQEtEQx
	mCySxT6VD7Ee+J2RVy+P0n3C3FV4PBwfEFTcWH7DmYgWEiff0uRtUWf0lGAI/DY6AeGLFVnVjKDSU
	jUiSH4eThEWugw1pHsY3P4sgSjlBJxpKofZUYQLczjTfpUqCThsc0UGSEGHYvQoaRjunUitFHDNkr
	H6ZgRDQ6DRdDPA+gp45xvbzCeiotBBffRJcs0DTEJgINosGFdABEpK6rN8TPQAS8u8x0mVaa6SoXS
	GWBiJfe9vz3XbrluvE5UFbSnhM9GdX5P/IFZ2ELOPCijyeX5Qd6Ki0ggUVkaon4g1O0+11uKyuY/2
	WLwJ94qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHev-00000004Xw3-05wg;
	Thu, 02 Jul 2026 13:40:53 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfHes-00000004Xut-0urd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 13:40:51 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id F1596140017C;
	Thu,  2 Jul 2026 09:40:48 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 09:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782999648;
	 x=1783086048; bh=LonbSv6mOMlAd5WzTKA2LLMgfG2NEu6AB9P2wuSPqmY=; b=
	e4oRmAIul3LuXTdascpDhlp2nPcMzm0oyW7vsjD7gljWU6fI3jE8n1AlnTt6wL1x
	JaalVNR/Q2/70j7p2IrBt2fGt87F1ksvwtFMBZBlrFvDBcebBBog0hCeE0Bg1ubV
	Ksrcak1MMCySvnigDz3VyuQIwwiQ/BKtQF0TNCUpqEICcqOnJQl3f7AhBxY6ZhvL
	UlqDWiANpm92nfVK1E40KDikiMXq5wYOusHpeqtC7hC9AXYw5QW5wd16LC/LfabZ
	NId3gq2MdGp1baXUmX536kAEsIfSYEToa2dbWdbXx6elLIOZVzivzV+TUEvRyD4C
	JCqgjpyuB83G2vZCd4asFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782999648; x=
	1783086048; bh=LonbSv6mOMlAd5WzTKA2LLMgfG2NEu6AB9P2wuSPqmY=; b=J
	ldSok/kXeQdGr6H8ictxaIhzW7eER7uaM3ws8lVmjPKxezEBwdwfdpUYjXstngMh
	965y7oMgDdIHLottHt/6R0MaLzzJgxCLrykd2T6/PvTCxyedetze8ocMeYqqjktZ
	kgaG+gKh+mf5zyY15s2kswf4xxy0JRSnxKTGrSAVQcBWe0jTUOvNu/9ioZEqy5ce
	NMJKIBTNZpEtuRlZ/EqbSZSrZtGlyVhwbBlmKgHz2BJLzoiP25zGVUjwbEcpZPBD
	jqE2RI/1cwiTinFQ0F3Jc7zSbglUVSA9PMkwioMuFpPKIbU3xwXfKx0VNkdNJ1az
	sZd5tm+iPbQWx2x09OkAA==
X-ME-Sender: <xms:X2pGatA0_utwEbuJdfD-jhnzsNj8qVEOtLdTL5jzc7_JI9yX3-OxPw>
    <xme:X2pGamUw_skwyhq9XvceJXPAU9-OXtEY_BqaXqJs8F_A50Ck3z8PYxzz9JYQveki0
    eWjVDoeCsOvmmYPmvW_xbBKXNNFcIGwDLXTGbCLg-8JtF-YgIOkJkI>
X-ME-Proxy-Cause: dmFkZTExK5qn4CPi5fOIwGaLWfCuad7dmp3ygrUxj+28CWnvQACOoCAeEABE0uas9IqI/t
    Ui34oWa+IJsAw+ZLWDSRP5orAfaqbWqBhZ3NB14W4eed4smj72XEywSA2C3dY+IUO4CvKa
    yXS/wa8BjhfajWIqNBfDL/2F8PTsCsIPSVuqlcOqHow9P9x98g+AaICNdSyxWp9hg6hvEQ
    HQkef+iohbzwDMX8eogs3GS7D+TQJI6Ja0PLb7zohGvpAIbKi9qWvbDbxCmneRTPdpUpHH
    w7q5/UA+kfuc1STyGYaVi9JjvHbE7ryAjSjJPnaXTdgDgHug1lVEHC6lqpcK40iw3m5kSy
    G4rVNThHIiudI1tY4KMeyPFWQqSE3XDkNisR6PgeA5e2V4vTaChEMzOlA9rt6i26RRvmAW
    uLICpIigt7ohckp/juoAOI4L7u2vGJ5wqIMnFWUratHa9S3jGRSe5r2viUqYG19jejTUbY
    fGnXFZwrPr4Bdtcuznv+/20p26kSIwUB4RiEvflLUEpPQYkzLiTT0k3rr2QesrQ9r3dxAo
    EKLWGqKBr2ecRPkmRNlE61QK1i6K8aiXMg/XeiZqbvnt4tjaH3Q1JzSkP0LE5Qq8mp7Z5K
    cAH28xhAMrEI0x4pM8hoVwM4iE8eVDKsqgrlU8W3eQXUoCAFO2RhXSxkfPmQ
X-ME-Proxy: <xmx:X2pGajaCnsOxZLK2sNVNjgtunWIOjnGm3c8Xwtzi_he6nNyMSLfu7A>
    <xmx:X2pGaos9qyRy0iuMTJ4C-CYImvYRQv2QI4zx1P2tOtQpKshwdeBiGQ>
    <xmx:X2pGar-L5K0tpmnGn8QJN0NSA7zGVV60DIIQvxoot7ROkj7U-qSHvw>
    <xmx:X2pGam-77TQNC0i6nLcPA4wQFGcfwCn6-VSNh5sLIYiztRs_fjKg9w>
    <xmx:YGpGarDeKqL4jyyVMDrUoIcpERlE9hCrd6sh_LRsnV3WtAM7C9ythHdY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0FEE71820086; Thu,  2 Jul 2026 09:40:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AY8ECbGwMVhZ
Date: Thu, 02 Jul 2026 15:40:26 +0200
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
Message-Id: <6eba2de1-bb2a-467f-abdc-c9562c5b9853@app.fastmail.com>
In-Reply-To: <20260702133626d12c29ad@mail.local>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-3-arnd@kernel.org>
 <20260702133626d12c29ad@mail.local>
Subject: Re: [PATCH v2 02/19] ARM: limit OABI support to StrongARM CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_064050_548196_BC4B66EF 
X-CRM114-Status: GOOD (  10.08  )
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

On Thu, Jul 2, 2026, at 15:36, Alexandre Belloni wrote:
> On 01/07/2026 23:23:36+0200, Arnd Bergmann wrote:

>> @@ -9,9 +9,9 @@ CONFIG_ARCH_MULTI_V4=y
>>  CONFIG_ARCH_FOOTBRIDGE=y
>>  CONFIG_ARCH_EBSA285_HOST=y
>>  CONFIG_ARCH_NETWINDER=y
>> +# CONFIG_AEABI is not set
>>  CONFIG_FPE_NWFPE=y
>>  CONFIG_FPE_NWFPE_XP=y
>> -# CONFIG_AEABI is not set
>
> I'm not objecting to the change this reordering is not directly related
> to the current patch, maybe this should be squashed in 1/19
>

I've dropped these changes now, I don't think they were
intentional at the time.

      Arnd

