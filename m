Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2093CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 22:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:To:From:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4hGlKaEF3owGaJz4O+b4FB/WpfLoASBvaTMeTYOloZc=; b=A15PqtBkJq+7y0q9v05dJ1gGtC
	vDZppCa9hw1qizhcfKJb2rfh4dDvPby8L4LS/Fg8jBxviHSWYaCnEWwAMQI1RMaoFNHB+fH69ybBG
	+A0u4YUD/g87zXrRERhGy21XdYoxtS+wpaFngoviih61nZRjLxWfC36cYAJ5lMGSifg4Nd+leavIP
	Rp920iVYsSb/q5tWSDj8SqvDt+v9rxXEAlv+8RllzFUf67E+xVvpfMB8dnqYbFP98un21Aa6wY8fn
	k4l7edtIkHrbDLGp5u18yG2cFEI4kguy088nq2sB22TNr2ztDGKHp/cZJthQQosLsY/YQ+uo0S9Eu
	+M8TUYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4RzF-0000000BMiE-2cfN;
	Thu, 02 Oct 2025 22:41:21 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4RzC-0000000BMhl-1vAW;
	Thu, 02 Oct 2025 22:41:20 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 994D07A007E;
	Thu,  2 Oct 2025 18:41:14 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 02 Oct 2025 18:41:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1759444874;
	 x=1759531274; bh=4hGlKaEF3owGaJz4O+b4FB/WpfLoASBvaTMeTYOloZc=; b=
	rR2II8h5qGEQ+N3qrO28io3mSYbEZDNSzni4M3uFzc+SC3OxBkJMCLbsISCw8gRo
	aW7K/HA7nJ62jDjk+OjEtSuVCoseyfkV2PlL1VM7U92QmC30zEB0so6jgtGVq5FU
	UkwkTYZrV6Mk7OwFtasY/kz7eO49Z4wjCiSqUOSWg7YLxJyXvj9OYDKzK1gcTRBP
	YFuQLK84PpiDOEJh0ruq9q5J6yTty1qcPCyPYmZ/5UBH23ZuoDh7tKMeg8qlfmqn
	nQNMSAFSUzlwuwo/GHd39tdRF+tJOd2mIf8CstxtksHlrne5DNSDesTrQSOIIka6
	cyyV/MLozU/JOG7vD11G7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; t=1759444874; x=1759531274; bh=4
	hGlKaEF3owGaJz4O+b4FB/WpfLoASBvaTMeTYOloZc=; b=DHQCYoqVFUx85gU6v
	slFj/IXlslxekzNbzX2t7cUTqGO6QdU8WtPxzXoF2czC3Egzb5qv938SuoB2+G3o
	s3bE3Ftpp2KWlTljOf2cPRSNewo8R2JHWJoZwO8QFaMsiq1FVQOA+SIkYQ8m4VmE
	YlRprSecGGmLx+QIBg/+CnwxqT5kL0QPnPRTgH6vsOIClrIQQyiTWJlLKiKMbRgl
	pq6zjyheL/EI2oTfTLghrESZoZ1Shu5+pMHwrMwAB+Nr65/b/+2zD0ja+aStDU8S
	dt+hn4YZhV23dBtKL/PMPboqncgL1r0PxCuxrPmRIhbcm19iAWl+9VQk6BgyXT0U
	cE2+Q==
X-ME-Sender: <xms:iv_eaORAfmyx-VrNY1qjojo2ry6eNu_jd6HzWbWeTYEjU_xDIhppBg>
    <xme:iv_eaOlMzQUBukbXXyBPZaKmAtXPYb1i7cbcNBfyWplkCDXIrZliEB6nxxb7AaJY5
    V44DQlJnaZH7DI3F_bTauG_PKU3CYtrNB1YEFh0e7pCG5y3rixDDX8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekjedvgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhguuceu
    vghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvghrnh
    epkeetgfeufefhkefhjeegffefteffveeuhfdvieejtdefvdetheeftdejudffvdehnecu
    ffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphht
    thhopeejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepkhhriiihshiithhofhdrkhhoiihlohifshhkiheslhhi
    nhgrrhhordhorhhgpdhrtghpthhtohepthhorhhvrghlughssehlihhnuhigqdhfohhunh
    gurghtihhonhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlhes
    lhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhrih
    hstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhotges
    lhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlh
    esvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:iv_eaN1i_9MEdLYEaN5LmPLsLN4VdWQ5gzqyXtm4S2hdB3FI6ojE8Q>
    <xmx:iv_eaJQ0iqhekBJG_ZNv4N7eyiZd6qivnqLNQ9d2MVElQqs6DFJQcQ>
    <xmx:iv_eaOxYPZ981NcrRqq5DjAYYDp97i96adR2uvubuViawKp-w_Y7Tw>
    <xmx:iv_eaBA1Vg93SANUa7SRpW7_2SDp8UR21x4gNm6WJd3zRTuGfCDkxw>
    <xmx:iv_eaFi4-HVvRUCQzDfSfHm0IxXHeK_HBVcSXLPGriYfhV1o9UV624s2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C7B6700065; Thu,  2 Oct 2025 18:41:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXqMPTuZh4v7
Date: Fri, 03 Oct 2025 00:40:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Linus Torvalds" <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 soc@lists.linux.dev
Message-Id: <a7fa4971-85a3-4435-8728-493acb68ed0d@app.fastmail.com>
In-Reply-To: <CAJKOXPcRw3teqahDc6RBCz8XvqLt2sHqxrOUxpA84RszcsnGFQ@mail.gmail.com>
References: <54b49f7b-9232-44d7-9ae3-ecc1826f17d7@app.fastmail.com>
 <d482931b-1779-4b49-9fa2-1c101bdf0929@app.fastmail.com>
 <CAHk-=wjsMPACg__N37EL8Sh=z1wkCpj+FQKpoVPXzyiVpm1i_w@mail.gmail.com>
 <CAGE=qrpygJ4XgtzdnGACj-6KRiD8r57F4ogNYaA3LLMusBV9fg@mail.gmail.com>
 <CAJKOXPcRw3teqahDc6RBCz8XvqLt2sHqxrOUxpA84RszcsnGFQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] soc: dt changes for 6.18
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_154118_987928_1B3BA691 
X-CRM114-Status: GOOD (  19.79  )
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

On Thu, Oct 2, 2025, at 08:26, Krzysztof Kozlowski wrote:
> On Thu, 2 Oct 2025 at 15:04, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> On Wed, 1 Oct 2025 at 15:27, Arnd Bergmann <arnd@arndb.de> wrote:
>> >
>> >   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.18
>>
>> Bah. I've merged this, but this causes build failures on arm64.
>>
>> I only noticed after already having pushed it out.
>>
>> > SeonGu Kang (1):
>> >       arm64: dts: axis: Add ARTPEC-8 Grizzly dts support
>
>
> I'm sorry, I should not have trusted contributors from Samsung that
> they know what they are doing and I think my CI misses allyesconfig on
> particular branches, because for-next branch did enable this symbol
> and it was tested by my CI. Also LKP tests each of my branches and
> didn't report this, I think.

This one is on me really, I had the right tooling available and
I had used it in the past, but I never ran it after I did the
bulk of the merges in the past few weeks. There is always someone
who misses a dependency in the DT updates and I rely on that
check anyway to detect some types of incompatible binding updates
and I have no excuse for not noticing it myself.

We'll have to refine the process anyway when we start taking turns
with the soc tree merges.

> Issue will be fixed with commit coming via clk tree - Stephen Boyd:
> https://lore.kernel.org/linux-samsung-soc/20250825114436.46882-2-ravi.patel@samsung.com/
> And git pull:
> https://lore.kernel.org/all/20250909183504.104261-2-krzysztof.kozlowski@linaro.org/
>
> I understand this won't fix bisectability.
>
> Arnd,
> Eventually you can just mark arch-artpec as broken just to fix your branches.

The missing commit is at the bottom of your branch, so I'm sending
just that commit as a build fix, that seems easier than marking it
as broken now and then later reverting that change.

      Arnd

