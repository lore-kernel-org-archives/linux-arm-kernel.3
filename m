Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D21CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 12:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1oaB41rnPMap/G96Eqbi5g5rusO6BlEVyBratQDjgE=; b=OxPA/duOCi2NQb6mwqQSY1I5mS
	M+5eEqjnJXhi+8pnlUfOuQmUcJsSW5RrNoGx6YxgGnlIBMWAkLxmGn5+W2DxJ1uROwNYYECRgkr1M
	DMo6wHWlTYJg0sEwHT+8TbrfiN5+Z3x2APZJ7+48Qpbv0RxW2iPlIqV+ETUADch5nzZgE6xSRrP3M
	mCz32Y8naVxkg8+hmMtJk/+4QZAy0thDNU41/JyGoEsX3ZTRLcVk68871SYnVRvp7KTvuR09G1WB/
	JNthFIsu0TGTiJk0ovDvSOkl+UJ6/LpRS1XUa/RP8RKn5OEjXhBPLwgkUvvypROJNMIMiPsOTNyWf
	5FGBsndA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt1q-00000005xar-11j5;
	Wed, 30 Sep 2026 12:03:18 +0000
Received: from fout-a1-smtp.messagingengine.com ([103.168.172.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBt1k-00000005xaA-3avN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 12:03:15 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 0B1D7EC02ED;
	Wed, 30 Sep 2026 08:03:09 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 30 Sep 2026 08:03:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790769789;
	 x=1790856189; bh=N1oaB41rnPMap/G96Eqbi5g5rusO6BlEVyBratQDjgE=; b=
	EJgmnN4gOHBoK5qPAzbzB6eBWPgj/fo64z2JsMgG7XZV9xYb+eLVsHB2By0MEi62
	BSYCBip7kCoNEown5VZ56wDIrYaaNGMJ9h/GeXZCoMhwSQgoLLGQAavUFH4xciro
	yu23DA+n5RP+puEB0mNwVmUaE5mFgehdLh5dglgQMW84fOAJkd1eZiZA1hb0N+TE
	pIFjwa/ce7hRgMKRlkgwwsurFYXjOtzrww8UW4gxdWwHGQXfIfmcGI89s7qjBhLT
	R9K1wMWn9SYvybsXdCA9thYMSrA7Na0SEPOYpej0uSY71zLbyg3l06w5vup0xAni
	4iTYXgVefe/mzpLyuNxMIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790769789; x=
	1790856189; bh=N1oaB41rnPMap/G96Eqbi5g5rusO6BlEVyBratQDjgE=; b=d
	wqMoVk9wPS5dQgQ8UcgHafoH5C6vxXHIA012gxb4EtN2/unWlfBXMFJwxSgSMkR9
	wyNRFUI4UsHl4+7Np3jdYXCA9DqnL+cdWUv0Wxk6+zxe64bxL5koHCAWYbhTtTX4
	7jtIprAM3rn9zARqlTIt8WZ6jZZeDJ21RfBa17SdAPBms8Qg7ywXNE5+GV/s7s3O
	vV4OZmvWu/Gq4bXzpdjN8nmDrabwTb1XFh/SH9hqvV1oLOlRToVM7Q6iZJNBab1P
	f933uAY1ZFelqTaskGwOLU5kpWc4sZyaX6hSuPp78r2HZBJduTRwF8uyYQ8gGf1Z
	uTv5hjNlF1ggnrNqvI/TQ==
X-ME-Sender: <xms:ePq8aqOFNh2h9t5DQRk5x7tvrJGCiQkdgQG_HF3jme67g3UtaOhB7Q>
    <xme:ePq8ajwsGtQRGA2o6ifwTcfnWBYUGNcOFNYd5Z_vTQ09x3PQKkcL7z7xyv3VpcXZa
    zuXxxeo-mSJGG242VP3UHh9ulEwD8RmRE6rDstzelZe9ME4a1c1C3BL>
X-ME-Proxy-Cause: dmFkZTEAygohlf/ZA/9BOczOk2E0ZPKkMLfxJWRH0hIDtg7XhCUmhFpB6fka6NiYIKNK9s
    tty8oPX3qWQwE6ASc9LC2XBE/3udub2rs9Ocq4gPBsUk5VLdTNdQdl6dJEstl5Auv5Ptol
    OmkhD71d38pRuLOiOj7uJMyh8dRldLMTLoUpS+CbIvbRsa90jTfSozXpoXfNwSkKExGZnq
    Igg72SuJ0syfdIHKuoW4KQIkpfyDtFEVmg4OT/lAhk1g9bS2paMbLJ+B4z6I2iQiO0GY/R
    JzKpdLjaWJ7aLyWf5YKSYRNCfauAHsV5Yt8IAaVc4IkXHfjpgstk/ehb09k7edgGQ5jAd3
    nGs9GsG+RpDa8Eqcl8gBn/c9DYGfL8AlydA8UCOf4TSlNI/FcLV0qnOV48Ag0VqUxljbCm
    NrIiv/3DJBc5c76ABIphVLt41amxxaAprtooEBOCZEs7PWpzLoarlHNRoQGl1WVY3NYZ5j
    dlfCiB/R+xWemYgfePyA5VfMjiCfyJ4hsMlGow2eo1WCarelWLZZYNOZLGCeNhtBHOXeHU
    1zDW9FIwH9DEFcgTNwG0EOPeIh1Dq6Aw17eaiQdipFozOVFK+7d0HE5ejMf7i87mEp+8Vj
    v1GyIE1NeUPyP5+bvKO6hpdCQ5kMIttkzS+rmV3ikvyGZvsI7vn6OwOAafeQ
X-ME-Proxy: <xmx:evq8ajHkuxiQjpVBvRvxyhTzklaZOcacDCCAP5wnIJBX0MZrF6WWeQ>
    <xmx:evq8arAH1lSaGAXEPfBjCst87l58Y9uv-YZpA6MVEyVayntoeu_gfg>
    <xmx:evq8arwYCS2itwtQk-88hvcrwwhA_A7P94iiKfj0e57CGNwLTkVsLQ>
    <xmx:evq8asALkcucEhEoBE1wjTjqDKdLqG0zTnyApMJsMu8ZWvq-f5qiwA>
    <xmx:ffq8atNf5voebHgY48NrFDdFZ-QqW46kjI-R3iPZqYzHfO1SUdaeN4rM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2669532A008A; Wed, 30 Sep 2026 08:03:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AAFgH-j8k6Zg
Date: Wed, 30 Sep 2026 14:02:43 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jason Li" <jason.li@cortina-access.com>
Message-Id: <f6d0478a-3438-4903-a9e2-5d314f5948c4@app.fastmail.com>
In-Reply-To: <179076863241.3327419.16233537387530771884@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
 <179076583795.3054628.14443934429806440798@gmail.com>
 <CAD++jLnZBpoF3H3-sqzmrtwzxLGombFMdSYMVo59jiGFYcyCFA@mail.gmail.com>
 <d97a806f-a5a3-476e-8910-30027a6f568d@app.fastmail.com>
 <179076863241.3327419.16233537387530771884@gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_050314_436090_91DA6DAF 
X-CRM114-Status: GOOD (  22.62  )
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

On Wed, Sep 30, 2026, at 13:43, Fil Dunsky wrote:
> On Wed, Sep 30, 2026 at 01:36:32PM +0200, Arnd Bergmann wrote:
>> How about making this one ARCH_CORTINA_ACCESS to match the 64-bit port
>> (saturn, venus) that Jason posted at
>> https://lore.kernel.org/linux-arm-kernel/20260610112821.3030099-5-jason.li@cortina-access.com/
>>
>> I think this would be consistent with how we deal with other
>> acquisitions (storm->cortina, freescale->nxp, ...). I would
>> leave Gemini as-is because changing the name only causes problems,
>> but for the new platform I would use the current name of the company
>> that last sold them.
>
> Thanks for digging out the history, that makes sense. I will use
> ARCH_CORTINA_ACCESS for v2 and keep arch/arm/mach-goldengate as the
> directory name, as Linus suggested.

I think I would go with mach-cortina here. Or even better would be
to find a way not to need any code. If you control the boot loader,
you could just implement the psci ops there and actually bring
up the CPU from EL3. If that doesn't work, maybe it is time to
actually have a generic spin-table implementation on arm32 the
way we do on arm64. As far as I can tell, your code is just
a copy of that anyway, though we have so far never added this to
common arm32 code in order to encourage SoC vendors to use psci.

> Should the DT side follow as well? That would mean a "cortina-access,"
> vendor prefix (added by this series, as Jason's has not landed yet),
> "cortina-access,cs7542" and "cortina-access,cs7542-uart" instead of
> "cortina,...", and arch/arm/boot/dts/cortina-access/ for the dts. I
> have no preference, I would just like to change it only once.

I don't have a strong preference either. If nobody else has a clear
guidance, changing to "cortina-access,..." would seems the most consistent
to me.

    Arnd

