Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E1606A320
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 00:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=StEecAsu;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=D8dVqAfw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J05n6Gr0/sJKA2C8cqIM/17mIypCcK1yS1CYec+efVE=; b=StEecAsuWgWPLBcKET7mNJr5o/
	TxiLiK8nwaIRI4icpjJ3rI0pMWVX0yeVZ9yeYGRNnW3Q5spYZL4db7UAXbaPetvmGF+FrdjcRF6AT
	93fXF/ErHz65jepD9T6mSnOupV3KBih24tsaJqW+yWPtKaaD9srpxdmly/dc/MaWQ0urj9cpIzl2d
	zA+C2F+teS6eiBALaQoW48e6B2uHAAuQABCShjb5djrHsYj4HnPyoolFnr/VeCBXxjUjH5fwGlVbn
	RgKT9k7PZfvAlsS+OzAhf79LM/e5YqoS5CibXbss2fm0W/wAHBNyQYirOqnI8OV0wpQCFjpXNIT7h
	k+J8b+aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIy2E-00000008ago-34na;
	Tue, 20 Oct 2026 00:48:58 +0000
Received: from mail-m128241.netease.com ([103.209.128.241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIy2B-00000008agI-3YJx;
	Tue, 20 Oct 2026 00:48:57 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 519de6bff;
	Tue, 20 Oct 2026 08:48:49 +0800 (GMT+08:00)
Message-ID: <9c18acc0-2b4b-4f19-9928-de1632718f15@rock-chips.com>
Date: Tue, 20 Oct 2026 08:48:49 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>, "david.wu" <david.wu@rock-chips.com>
Subject: Re: [PATCH] i2c: rk3x: Disable the controller between transfers
To: Alexey Charkov <alchark@flipper.net>
References: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net>
 <bfe8baa4-e740-4908-9d2a-4defc5240a82@rock-chips.com>
 <CAKTNdwFYxPeaG6pZn3SYoR6cPAtON37ajo4nZpPE0Hm=y2c6Lg@mail.gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <CAKTNdwFYxPeaG6pZn3SYoR6cPAtON37ajo4nZpPE0Hm=y2c6Lg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa156c84b5003a4kunmb2638d4f8a0982
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUNJVkxIS09NHkodSB8eHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=D8dVqAfw85rr9XasLOyMPAcPscEwWj2/fg2RaOjDPvEXf4fqLm8uGD/ZSzQ3zTpiFFj6KLlNJjR7nsfvCu96NGj8uYakRg6Nhc4+/VPl5wLG1mJfafFfuPY+wU2b4w0nS0/DOiy+dgG5aWf3kp6hlKptsEYkOf4oE7i5lXDhPq8=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=J05n6Gr0/sJKA2C8cqIM/17mIypCcK1yS1CYec+efVE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_174856_451539_AA7607E0 
X-CRM114-Status: GOOD (  18.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

在 2026/10/20 星期二 0:50, Alexey Charkov 写道:
> Hi Shawn,
> 
> On Fri, Oct 16, 2026 at 4:33 AM Shawn Lin <shawn.lin@rock-chips.com> wrote:
>>
>> Cc: + David
>>
>> 在 2026/10/15 星期四 22:00, Alexey Charkov 写道:
>>> The driver leaves the controller enabled once a transfer completes, and
>>> an enabled controller keeps tracking the bus. If the lines collapse under
>>> it while idle, as happens when a target's supply is switched off while
>>> its bus pull-ups stay powered, its state machine wedges driving SDA low.
>>> Every later transfer then times out, since the timeout path only requests
>>> a STOP and never disables the controller, and the stuck state even
>>> survives a kexec.
>>>
>>> Clear the enable bit once each transfer is done, successful or not, so
>>> that the controller does not watch an idle bus and starts every transfer
>>> from a clean state.
>>>
>>
>> I checked the vendor kernel tree and saw another case that you perhaps
>> need to fold something similar below into your patch, along with your
>> disabling controller?
>>
>>       In some case，log like this:
>>
>>       [   12.393926] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 0x51
>>       [   12.416592] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd = 0x51
>>
>>       The i2c clock is disabled, so the pending irq clean is not
>>       worked. Disable the interrupt after the i2c jobs were done,
>>       the error log would not happen.
>>
>>
>> /* Disable i2c all irqs */
>> #define IEN_ALL_DISABLE   0
>>
>> i2c_writel(i2c, IEN_ALL_DISABLE, REG_IEN);i2c_writel(i2c,
>> IEN_ALL_DISABLE, REG_IEN);
> 
> Thanks for looking into this! Do you happen to have a reproducer or
> any additional info on how this state gets triggered? I haven't run
> into it in my setups - did I just get lucky? :)
> 

Unfortunately, I don't. That came from what I found when checking
the vendor kernel commit to see how we handled your case.

So I have looped David who made the internal submision for the same case
as yours 8 years ago and hope him could have a comment here.

> I see the same write of 0 to REG_IEN just above my changed lines for
> the case if (time_left == 0), which makes sense because a
> too-long-running transfer might eventually complete and trigger the
> interrupt with the controller disabled, unless the interrupt is
> disabled too. For other cases I'd be interested to know what can raise
> the interrupt.
> 
> Best regards,
> Alexey
> 


