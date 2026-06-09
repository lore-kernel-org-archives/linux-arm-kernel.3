Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10D76CD98C9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 19:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=; b=3aVZxgZVfeivXKSJJ6YRY3XX3o
	r2lMFXC7WeLQOiU08XoQ8wT6U6o2dbxFsEyqf+AEyrfK6w0IRmMKnQysj2m+aAYQdx4RBtb0gnIAC
	UIe/vRdtWKGHefl5uWqheLzC9JiZt67RTH4uMwY48s1grsIBQwYOb+kDNZZAM4Vs+qNWeUMNRCqwa
	l7LTe6LJKJlqcsx/+NTkZHkO9e1g+8V7THStC98sIWrXv+cTZumHDu2uCGLJknifWahhRbW1ceyJW
	n+4cFbvg0QZCmPhV6DbcUnajMYX4A/g8LmnPFVbBA3ha9FuAhyITEFgmG+5FOEPMpMsw0Xgi85nsf
	TgeL8JVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX28c-00000006HXQ-0ewe;
	Tue, 09 Jun 2026 19:29:26 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX28Z-00000006HX5-2HAu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 19:29:25 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 33BF11D000EE;
	Tue,  9 Jun 2026 15:29:22 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 09 Jun 2026 15:29:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781033361;
	 x=1781119761; bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=; b=
	i1I3GlDPwmzPvHxX6edtGc8KzYo4kM7CBQMEVrU/FJozDmpIVGXGi9kLeiu+5vln
	ZHEHLYgYVpy1mH+SlZEcTHs9tTO0bKBcFeJiEqsXVX8gH0/XIK0TNl1j2Zw7GoMw
	85URutU+zE3LtS53XD4T80ve+lKTWh8yk7zTdD5hCHDc59OgDpp1790eYM/LrLzg
	OqeofCRhvGTCMYYogrIJMst/6X/wStDUywsgDI0yjSOH3aP12nitgugONIM8tamw
	aqczuBJYCT7uGW3gJ9xZvy7gqFpGFCcCknPgI9jZ97tgyiwZwO9JNMdI5eBIE2MM
	cBbta3uhow8nsEsfM7hRAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781033361; x=
	1781119761; bh=Cs605zMJrUshlZeCk45mL3y9U03ND7j6Y7qDtI/Ma5w=; b=B
	/0SRSHXxvj12/35zYAqsvk05ioBsQ92qrDiHhM4rTouPyEdkajji8vGjO6YSTuii
	Y7EK+p1Hi6xF2CKkAFDcTzN2Br8G0fudrdszTroP+38oYNSY+zGvM5O/yL7/QBF6
	pzt4POxKjpH5b/K7XuT25WZnWgGVhtbUN0XP1Ph68aN5sQfz3l5serG0e+4ezO2S
	zfbk1P0g8gdthFDJb4JW+ijfjBGlsZtIQLyRmYcYfzpYXO77pET6tpNG6lkFeAlH
	2/wTKitZFkkCaWQ1Z5mJQABEWwKiSezPFT/mdkXKHnn5mfPPXCsTiCtajWtlYxAw
	umZCkYeeeZ0WoHBLeZCzA==
X-ME-Sender: <xms:kWkoasHj73Oy7kuLAMfS0q4d_XtyVn8wRHAbJx0ZaZVoz89sJMAZKQ>
    <xme:kWkoagIzPhNDgLn857M8X-EZ1lWRlc7Zblk6Ykz17bRdHmApeguWnH5SPlj5xCahL
    k0rGOmI19_d5is7Iiogc6Kf2UyxmL0z4AJFhVtHg3spdvLpJ92eqac>
X-ME-Proxy-Cause: dmFkZTEQnMd57GWDMiaatNU5FEJEsKgWZwCtn8j2fFcJFJ0sQpxlDegCEJtcWLDSgbwHQG
    /Y5cejkcIVuQwnKvee89Gp+8fQ4rc5QwmHGx/3pM6Nx+FTk8YIcKXWgf1xeGUnYIvoy1zc
    ZWdS/lPztEi8t1L+/ziMgueMQ1ZsnjZMdgRJiOv8NVcQKq44NO6YJNdVSJL0kd6gbgqdyg
    aGbuJKdlI12qGR+UXqIqxIc6FCop3dhtr8kQnVpjdZovqPDqiR3tCLXjPLmNtEidoXrOZ/
    w2EummCV1XO+Vrc8mUWri+8XTwADJ9jm5plVToDqt5siprQzRBvstnA4MEQaecy7dG/LnJ
    1Ah+le0fZ9WeZvNdryQ3AfWngLfAb+mXkx40KxmGlEX241qdbevq92rye0cCjpPHyao7xx
    XsnZXu2YyVhR4bWALe4q3JLFXZaAtjD4nGZjO6N7y0s4Fx8JcVkm2yzVo3OxUWTx+8KHG3
    YMReSeniRCwH7p+M9vxmxOM8cJXM3fRKATS40L7zmAmo1FzUit91nHp0nCkXw3xWCvoOrf
    YFTAKKDHjpUjW+kSUod4lyjfKx/fi3S9fvjKDNQECzNFoaMyAb7ycx3POGVSJ87KBPNAas
    63fzM53hmdO6ENrLYa5Hs0xdGIga/GPUa6ZBNVQKhhpAJuQg/s7QZev5o00w
X-ME-Proxy: <xmx:kWkoaufGDUojx54sQeC7nJ_G3XFALO3e37KTiB8-teUU92RDzq1EiA>
    <xmx:kWkoao6oNCZw8g8yrcM68Q1FGvMG-PTTomhFGaGEFd2xKtzYHT7pkQ>
    <xmx:kWkoatsseGIeRgPFJBb6PFausiyLTt5lSndJGp07gUzdm7tcZgRYbA>
    <xmx:kWkoagg7qXsgzn_eubJhpqc8Kv9_h8fh63JFiUyolU9zFtg1dqW2EA>
    <xmx:kWkoaiwmA4jlgB0aprFbGFn0U-pauCT5lk4BZY8nCQm53_Wu-MTOexE7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 819FA182007E; Tue,  9 Jun 2026 15:29:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AUV8JOC_Zpjc
Date: Tue, 09 Jun 2026 21:29:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Aleksander Jan Bajkowski" <olek2@wp.pl>,
 "Gregory Clement" <gregory.clement@bootlin.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <956403e3-d47f-498c-9f62-79d39c1cf5db@app.fastmail.com>
In-Reply-To: <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
References: <8733z1c8uj.fsf@BLaptop.bootlin.com>
 <bf8092a3-d037-44ee-8e08-8b2204e5cc95@app.fastmail.com>
 <4e690104-b42f-4a2b-ac52-5ebfc82f6853@wp.pl>
Subject: Re: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_122923_846811_E87C5E70 
X-CRM114-Status: GOOD (  23.85  )
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

On Tue, Jun 9, 2026, at 19:35, Aleksander Jan Bajkowski wrote:
> On 09/06/2026 18:11, Arnd Bergmann wrote:
>> I'm a bit surprised by this oneline change. Since you successfully te=
sted
>> this, I assume the change is correct, but I have two questions that
>> I would like to have an answer for before I pull it.
> By the way, the upstream safexcel driver works correctly only on=20
> coherent
> platforms. On non-coherent platforms (MediaTek), the SHA-384 and SHA-5=
12
> selftests fail. Since the selftests pass on Armada's SoC, I assume I'm=20
> right.

It's not necessarily proof that this is correct, but it is quite likely.

After checking the datasheet some more and finding that this should
indeed be coherent everywhere, I remembered that even the old
32-bit Armada 370 had a coherency manager. At the time, we used a hack
in  arch/arm/mach-mvebu/coherency.c to mark all device nodes as coherent,
since the original DTB did not contain the correct annotations.

I suspect that the Armada 37xx started out with a copy of the
old DT files and also never had the annotation, but then never
had the same hack because arch/arm64 does not have platform
specific code.

> I have a plan to send a patch upstream, which has long been maintained
> downstream in OpenWRT[1]. But I need to think a bit more about how=C2=A0=
to do
> this properly.
> [1]=20
> https://github.com/openwrt/openwrt/blob/main/target/linux/mediatek/pat=
ches-6.18/401-crypto-fix-eip97-cache-incoherent.patch=20

The patch is basically correct, I think you should just change two
details:

- instead of defining your own SYSTEM_CACHELINE_SIZE macro, just use
  the existing CRYPTO_DMA_ALIGN macro that is used in crypto_dma_align

- move the 'state[]' and 'cache[]' arrays to the beginning of
  safexcel_ahash_req so you don't have to manually align them.
 =20
>> - I would expect a missing 'dma-coherent' property to cause data
>>    corruption, as the DMA master may write directly into the L2
>>    cache, which is then invalidated before the CPU accesses it.
>>    Do you have any idea how this one ends up working even when
>>    the property is missing?
> No idea. Don't have access the Armada SoC TRM. Maybe the folks at
> Marvel will be able to explain it.

ok

        Arnd

