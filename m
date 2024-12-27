Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B1AE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 15:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ur0RhuIydq2U2A43n4jYm1JsAzfs2SVp5UUjwaZSQxM=; b=ufvcMnzK8Kg4smw8bvp0YClcyG
	enKTidhC0ab2P7lgdF16lziQa4FTiAhSCRiniI41fnWhKEwBWnxIBlWvtxhaiOWowPsyOWCHfRCjm
	HeVdKglkuAzfU5ZgFvZS1rg0DZL8Y8abamnVQ1Qej25iNN5rvFIZyHhe14JFRCW0q3MtZkijIxkNR
	cHLHJgGQj/W2ZDdvmByuG33lKlMkKgbPMcSFOgAfeVdd7HdutkSpSwaCaBGzuw5fz/iwWt25IASq1
	PA74ZqWtT8vAS44F3ten09huuGiVEViHytT9zIhPRTOGx3BsU1HkaB3upnVEjPz0lPd3hP34Zl6hF
	/mf8hTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCaJ-00000000Yxo-1jM6;
	Fri, 27 Dec 2024 15:49:07 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRCZ9-00000000Yte-0yyu;
	Fri, 27 Dec 2024 15:47:56 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1735314473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ur0RhuIydq2U2A43n4jYm1JsAzfs2SVp5UUjwaZSQxM=;
	b=HufIOT09skINtdAcEUYQTO638YzwXb0DeVI7ykCNr2eh4lF+lmtyYskdWWBT2c3wAckytI
	LwZC03+bHgQ7OJhd2UUQtMUJc8u9JsMGQxpIz+IjmSyUELzMxPhqXibxFZCGgGElsnCo0H
	3KUTmngCgRRiErBGhe5CnYLUVZ90kvnXhlv+A3LVnwN1uksN6airkA5HwTukAA5hfhg0jJ
	NV8mtpqg+RGvbdIBDjUN13OvVtXs+1vj/5w/TzPWZxo62HbTo0jezIF5sJMTVi4/1+Vfh/
	rRE5jIwjQzRjr6kvGtgzVlBqvtw/YF1RE7C0UqCh+J6Vsj+3CHVUwOB+MGmqCg==
Date: Fri, 27 Dec 2024 16:47:52 +0100
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
In-Reply-To: <d9919917c5d518608a7d4e3cac8faf53@manjaro.org>
References: <20241222030355.2246-1-naoki@radxa.com>
 <20241222030355.2246-2-naoki@radxa.com> <86msgoozqa.wl-maz@kernel.org>
 <f93b3bfb5151e4b617b1c99c91b4956f@manjaro.org>
 <8734ifs3zl.wl-maz@kernel.org>
 <e3498590dd81b150670e36561d99b6f4@manjaro.org>
 <871pxysq76.wl-maz@kernel.org>
 <d9919917c5d518608a7d4e3cac8faf53@manjaro.org>
Message-ID: <f84c6820fb54b6eab15575c6bc30dc83@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_074755_576532_B1DC192F 
X-CRM114-Status: GOOD (  23.55  )
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

On 2024-12-23 11:11, Dragan Simic wrote:
> On 2024-12-23 10:29, Marc Zyngier wrote:
>> On Mon, 23 Dec 2024 06:10:21 +0000,
>> Dragan Simic <dsimic@manjaro.org> wrote:
>>> On 2024-12-23 00:16, Marc Zyngier wrote:
>>> > On Sun, 22 Dec 2024 18:25:02 +0000,
>>> > Dragan Simic <dsimic@manjaro.org> wrote:
>>> >> On 2024-12-22 10:04, Marc Zyngier wrote:
>>> >> > On Sun, 22 Dec 2024 03:03:53 +0000,
>>> >> > FUKAUMI Naoki <naoki@radxa.com> wrote:
>>> >> >>
>>> >> >> Rockchip RK3582 is a scaled down version of Rockchip RK3588(S). Apply
>>> >> >> Rockchip 3588001 erratum workaround to RK3582.
>>> >> >>
>>> >> >> Signed-off-by: FUKAUMI Naoki <naoki@radxa.com>
>>> >> >> ---
>>> >> >>  drivers/irqchip/irq-gic-v3-its.c | 3 ++-
>>> >> >>  1 file changed, 2 insertions(+), 1 deletion(-)
>>> >> >>
>>> >> >> diff --git a/drivers/irqchip/irq-gic-v3-its.c
>>> >> >> b/drivers/irqchip/irq-gic-v3-its.c
>>> >> >> index 92244cfa0464..c59ce9332dc0 100644
>>> >> >> --- a/drivers/irqchip/irq-gic-v3-its.c
>>> >> >> +++ b/drivers/irqchip/irq-gic-v3-its.c
>>> >> >> @@ -4861,7 +4861,8 @@ static bool __maybe_unused
>>> >> >> its_enable_rk3588001(void *data)
>>> >> >>  {
>>> >> >>  	struct its_node *its = data;
>>> >> >>
>>> >> >> -	if (!of_machine_is_compatible("rockchip,rk3588") &&
>>> >> >> +	if (!of_machine_is_compatible("rockchip,rk3582") &&
>>> >> >> +	    !of_machine_is_compatible("rockchip,rk3588") &&
>>> >> >>  	    !of_machine_is_compatible("rockchip,rk3588s"))
>>> >> >>  		return false;
>>> >> >>
>>> >> >
>>> >> > Please use the relevant property for that purpose ("dma-noncoherent")
>>> >> > at the distributor and ITS levels. We're not adding extra compatibles
>>> >> > for this anymore, and you might as well fix the core dtsi to expose
>>> >> > such property.
>>> >>
>>> >> Thanks for your response.
>>> >>
>>> >> After a more detailed look into drivers/irqchip/irq-gic-v3-its.c,
>>> >> it seems that relying on the "dma-noncoherent" DT property may not
>>> >> be equivalent to adding another compatible check.
>>> >
>>> > It is. My email makes it plain what needs doing.
>>> >
>>> >> Here are a few
>>> >> quotations from irq-gic-v3-its.c, to illustrate this better:
>>> >>
>>> >> 4746 static bool __maybe_unused its_enable_rk3588001(void *data)
>>> >> 4747 {
>>> >> 4748         struct its_node *its = data;
>>> >> 4749
>>> >> 4750         if (!of_machine_is_compatible("rockchip,rk3588") &&
>>> >> 4751             !of_machine_is_compatible("rockchip,rk3588s"))
>>> >> 4752                 return false;
>>> >> 4753
>>> >> 4754         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
>>> >> 4755         gic_rdists->flags |= RDIST_FLAGS_FORCE_NON_SHAREABLE;
>>> >> 4756
>>> >> 4757         return true;
>>> >> 4758 }
>>> >> 4759
>>> >> 4760 static bool its_set_non_coherent(void *data)
>>> >> 4761 {
>>> >> 4762         struct its_node *its = data;
>>> >> 4763
>>> >> 4764         its->flags |= ITS_FLAGS_FORCE_NON_SHAREABLE;
>>> >> 4765         return true;
>>> >> 4766 }
>>> >>
>>> >> 4814 #ifdef CONFIG_ROCKCHIP_ERRATUM_3588001
>>> >> 4815         {
>>> >> 4816                 .desc   = "ITS: Rockchip erratum RK3588001",
>>> >> 4817                 .iidr   = 0x0201743b,
>>> >> 4818                 .mask   = 0xffffffff,
>>> >> 4819                 .init   = its_enable_rk3588001,
>>> >> 4820         },
>>> >> 4821 #endif
>>> >> 4822         {
>>> >> 4823                 .desc   = "ITS: non-coherent attribute",
>>> >> 4824                 .property = "dma-noncoherent",
>>> >> 4825                 .init   = its_set_non_coherent,
>>> >> 4826         },
>>> >
>>> > Nothing tickles me more than having my own work being thrown back at
>>> > me.
>>> 
>>> I'm sorry, that wasn't my intention.  I just wanted to make
>>> referencing to what I was talking about a bit easier.  Though,
>>> I now see that I was wrong, and I apologize for the noise.
>> 
>> No need to apologise. Just understand that the way you approached the
>> discussion was suboptimal. Next time, just ask how the proposed
>> solution works, rather than asserting that it doesn't.
> 
> Thanks.  Indeed, the way I approached it was waaay suboptimal.
> I just wanted to clarify that it was an honest mistake resulting
> from not looking at the code carefully enough, nothing else.
> 
>> Hopefully we can move on and you and Naoki can come up with a set of
>> patches that does the right thing.
> 
> Of course.  I've already prepared a small patch series that,
> hopefully, does the right thing when it comes to the Rockchip
> 3588001 errata.  I'll submit it soon, after I check the patches
> a bit further.

For future reference, here's the link to the above-mentioned
small patch series on the linux-rockchip mailing list:

https://lore.kernel.org/linux-rockchip/cover.1735313870.git.dsimic@manjaro.org/T/#u

