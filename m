Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0A2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 06:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX1KMqyrXnPhgcTTW4BZ+u196NqhNdIoH0w8SpaWSbU=; b=MUOcpo0joCtlmlLdpXewzbfInl
	0KTbITHl/hC2tSdTX1a6cnKO4NF14Qo8yR98Q7zmy/sP3695/y6MkzpN7zI77sT+v1N50ebUd27G7
	XBt6kHH3s4Xw5OORrT9b9e5f50rxp7ApY3axc79cac+x7apYGvfo9TI82WBKhoLdtY2Zuw36ZOspK
	s8MXSydf+ezT0SiD9TT3zRPekO7LD49HT5nRBg0drMcYAd3/Ts2211YNo80yZjYjI+B3e0TNAavfp
	JGepI2YYZkpoJRHbxUXvEsRjWnrwsNAgRhMZXkgZgzeNLPhnXgHLcvhB063bcq506LBh1+Fwx5kXd
	l7bAINAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbfI-00000009OEg-0Dus;
	Mon, 23 Dec 2024 06:11:40 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbe5-00000009OBI-42bU;
	Mon, 23 Dec 2024 06:10:27 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1734934222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TX1KMqyrXnPhgcTTW4BZ+u196NqhNdIoH0w8SpaWSbU=;
	b=fUys+vgC3glxAUasbCnGi8sv/mBAdFXPUF03w3S4EXx3mIH/BtwGuj7cSDH+Qx96bYqGMr
	7gh2fIVdjf+n63Ex+NAfw0ic7teItkbKfcsFt17HP08dM0D4TZdMt3iX3t10HuiDFhhagt
	LoeWMPkqPyCQXDSO3jEVDRmmGS0FpHu1FWV9Jtq3i66k62oSHST+h+1dwW6RUDVzxxfhfN
	fbHm8N+sk1xyQ8wE8bF53aJ8b2ssgx8ckq/N2s8ADSuz3V7PUEk+oaj9QGC8ZFuB9/IZuR
	rIYtbG2sR+qeGxGZZjaH6JsEozd4WRqka/zCMybWY9GMGQC/GF0kx9P89XqRew==
Date: Mon, 23 Dec 2024 07:10:21 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Marc Zyngier <maz@kernel.org>
Cc: FUKAUMI Naoki <naoki@radxa.com>, heiko@sntech.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, tglx@linutronix.de,
 jonas@kwiboo.se, macromorgan@hotmail.com, andyshrk@163.com,
 liujianfeng1994@gmail.com, dmt.yashin@gmail.com, tim@feathertop.org,
 marcin.juszkiewicz@linaro.org, michael.riesch@wolfvision.net,
 alchark@gmail.com, sebastian.reichel@collabora.com, jbx6244@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] irqchip/gic-v3: Enable Rockchip 3588001 erratum
 workaround for RK3582
In-Reply-To: <8734ifs3zl.wl-maz@kernel.org>
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-2-naoki@radxa.com> <86msgoozqa.wl-maz@kernel.org>
 <f93b3bfb5151e4b617b1c99c91b4956f@manjaro.org>
 <8734ifs3zl.wl-maz@kernel.org>
Message-ID: <e3498590dd81b150670e36561d99b6f4@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_221026_556865_C0A36936 
X-CRM114-Status: GOOD (  32.42  )
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

Hello Marc,

On 2024-12-23 00:16, Marc Zyngier wrote:
> On Sun, 22 Dec 2024 18:25:02 +0000,
> Dragan Simic <dsimic@manjaro.org> wrote:
>> On 2024-12-22 10:04, Marc Zyngier wrote:
>> > On Sun, 22 Dec 2024 03:03:53 +0000,
>> > FUKAUMI Naoki <naoki@radxa.com> wrote:
>> >>
>> >> Rockchip RK3582 is a scaled down version of Rockchip RK3588(S). Apply
>> >> Rockchip 3588001 erratum workaround to RK3582.
>> >>
>> >> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>> >> ---
>> >>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>> >>
>> >> diff --git a/drivers/irqchip/irq-gic-v3-its.c
>> >> b/drivers/irqchip/irq-gic-v3-its.c
>> >> index 92244cfa0464..c59ce9332dc0 100644
>> >> --- a/drivers/irqchip/irq-gic-v3-its.c
>> >> +++ b/drivers/irqchip/irq-gic-v3-its.c
>> >> @@ -4861,7 +4861,8 @@ static bool __maybe_unused
>> >> its_enable_rk3588001(void *data)
>> >>  {
>> >>  	struct its_node *its = data;
>> >>
>> >> -	if (!of_machine_is_compatible("rockchip,rk3588") &&
>> >> +	if (!of_machine_is_compatible("rockchip,rk3582") &&
>> >> +	    !of_machine_is_compatible("rockchip,rk3588") &&
>> >>  	    !of_machine_is_compatible("rockchip,rk3588s"))
>> >>  		return false;
>> >>
>> >
>> > Please use the relevant property for that purpose ("dma-noncoherent")
>> > at the distributor and ITS levels. We're not adding extra compatibles
>> > for this anymore, and you might as well fix the core dtsi to expose
>> > such property.
>> 
>> Thanks for your response.
>> 
>> After a more detailed look into drivers/irqchip/irq-gic-v3-its.c,
>> it seems that relying on the "dma-noncoherent" DT property may not
>> be equivalent to adding another compatible check.
> 
> It is. My email makes it plain what needs doing.
> 
>> Here are a few
>> quotations from irq-gic-v3-its.c, to illustrate this better:
>> 
>> 4746 static bool __maybe_unused its_enable_rk3588001(void *data)
>> 4747 {
>> 4748         struct its_node *its = data;
>> 4749
>> 4750         if (!of_machine_is_compatible("rockchip,rk3588") &&
>> 4751             !of_machine_is_compatible("rockchip,rk3588s"))
>> 4752                 return false;
>> 4753
>> 4754         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
>> 4755         gic_rdists->flags |= RDIST_FLAGS_FORCE_NON_SHAREABLE;
>> 4756
>> 4757         return true;
>> 4758 }
>> 4759
>> 4760 static bool its_set_non_coherent(void *data)
>> 4761 {
>> 4762         struct its_node *its = data;
>> 4763
>> 4764         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
>> 4765         return true;
>> 4766 }
>> 
>> 4814 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
>> 4815         {
>> 4816                 .desc   = "ITS: Rockchip erratum RK3588001",
>> 4817                 .iidr   = 0x0201743b,
>> 4818                 .mask   = 0xffffffff,
>> 4819                 .init   = its_enable_rk3588001,
>> 4820         },
>> 4821 #endif
>> 4822         {
>> 4823                 .desc   = "ITS: non-coherent attribute",
>> 4824                 .property = "dma-noncoherent",
>> 4825                 .init   = its_set_non_coherent,
>> 4826         },
> 
> Nothing tickles me more than having my own work being thrown back at
> me.

I'm sorry, that wasn't my intention.  I just wanted to make
referencing to what I was talking about a bit easier.  Though,
I now see that I was wrong, and I apologize for the noise.

>> As visible above, using the "dma-noncoherent" DT property results
>> in not setting the RDIST_FLAGS_FORCE_NON_SHAREABLE flag, which the
>> its_enable_rk3588001() function does.  In other words, it doesn't
>> seem that "dma-noncoherent" is a "drop-in" replacement for adding
>> yet another compatible for the RK3582.
> 
> You clearly haven't read what I wrote. Or rather, you read what you
> wanted to read, and ignored half of it.

No, it an honest mistake, nothing else.  My intention is never to
twist the reality in any way.

>> Modifying the current behavior of the "dma-noncoherent" DT property
>> doesn't seem like an option, because it's already used in a couple
>> of board dts(i) files.  Should we introduce another DT property,
>> perhaps "dma-noncoherent-rdist" or something similar?
> 
> No. We have everything we need. Believe it or not, I actually know
> what I'm talking about. I know, this is surprising. I surprise myself
> sometimes.

It wasn't my intention to insult you in any way.  I highly respect
everyone's work, including yours, of course.  I am a human being,
so perhaps I am allowed to be tired a bit and, as a result, make
an honest mistake from time to time?

>> Could you, please, advise on how to move forward with this?  I'm
> 
> I already have.

Yes, I see it now.  I'm sorry for not reading the code more carefully
the first time.  I read your earlier response carefully, but I missed
to read the code carefully as well.

>> willing to implement the required patches, but I'd prefer to reduce
>> the possible back-and-forth on them, to save everyone's time.
> 
> May I suggest that you read my email again? How about grepping through
> the upstream DT collection and (shock, horror) look at the imx95.dtsi
> file, which suffers from the same braindead behaviour as the RK stuff?
> 
> For clarity, let me paste it here again, and add some emphasis for
> extra clarity:
> 
>> > Please use the relevant property for that purpose ("dma-noncoherent")
>> > at the distributor and ITS levels. We're not adding extra compatibles
>        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> Now, please go look at the code for real this time, appreciate how the
> "dma-noncoherent" property placed at the distributor *AND* ITS levels
> combine to give you the effects the hardware requires.

You're absolutely right, and I should've read the code more carefully.
I stand corrected, and I appreciate your additional explanation.

> To sum it up: the standard properties and the Rockchip hacks are
> strictly equivalent, there is no need for anything extra, and I stand
> by my NAK on this very patch.

Please note that I never questioned that this patch shouldn't be 
dropped.
I just missed some parts of the code, as an honest mistake, for which I
apologize once again.

