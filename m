Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8D7DC9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFqh8YqnMjajbouORVkA64AhHHYQbhKovv91Md+wGtY=; b=Gkm5UIfaL7BdOI253pnT8McPIP
	2xaTPmoKY/CCDacHtKp52gj4Yp+FPpDnovVv6OeskHIxTgSs9OHAFgMnhVggT6yqELuUmyX039iQ/
	4r/rxWUa2jXXVsMvev0687j86tBfEjxQuOcV/vjx6S3o3jmE79XRtsOCxXcSEKkEwuRdFbav6dJdV
	24upKLo3f5ML4DiVSHEae4XovIeOlvEoXxrp+8KjfpRFDzdUIPrB74lAWlOT+3q9yXr3kA+GXBZIK
	5d8uNZoGjGXez/WowZWIYVF88mWMTtnnpY20swNjXLTzjfp0so245VQiVZuYcQ3wklVO4CMIanIsE
	kCyt1AkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RDW-0000000979Z-2xpJ;
	Wed, 23 Sep 2026 17:57:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RDV-0000000979C-2L68
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 17:57:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E04614359D;
	Wed, 23 Sep 2026 17:57:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E8DA1F000FF;
	Wed, 23 Sep 2026 17:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790186230;
	bh=YFqh8YqnMjajbouORVkA64AhHHYQbhKovv91Md+wGtY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=TVR0Ykbxxg4hRAfUbakEvbcMICwduPTJ9oUK3A0DXYMxynz994H5Vxbm2hb4xHk5I
	 lO5KKiAifA0zHCqirdmUQBpSdEX8O4tywlQpsSCwq5b4QxheVMRCPu4gKhILHs7eqi
	 c1ndHUqY4IAgg/QED0UBdc3iaH6wTQyoJxAN3OlGY9RRlLkzKDVsF8x46604wGZe/W
	 f6f+SBHnFK1Nt8X7UDR7BoHW45yKtxOwYfzG2xqoZeigdFGBNMPGpy82oylUur+Abf
	 9ysdaxeeJe2cABC0okyb59JxRcpKvmQTj5phP/rnPi8kSMNMl8lflsCUhrdlOdaPuY
	 DH9Yh4yg2y2qQ==
Message-ID: <6b0fc3a4-6c79-4fae-aef1-2880f0faef80@kernel.org>
Date: Wed, 23 Sep 2026 19:57:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: stm32_omm: fix child clock leak on set_amcr()
 error path
To: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20260917235925.44185-1-diegomancera.dev@gmail.com>
 <bea461d6-4ae9-451d-b6c7-5ac7bc144651@kernel.org>
 <CALruWrUYnufzE3Lqm4=32_nSJVSVRRR9oeU0fGNhLfr7uyJoaA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <CALruWrUYnufzE3Lqm4=32_nSJVSVRRR9oeU0fGNhLfr7uyJoaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 23/09/2026 18:35, Diego Fernando Mancera Gomez wrote:
> Without st,omm-mux, of_property_read_u32() fails and leaves mux at its
> initial value of 0, so the "if (mux & CR_MUXEN)" block is skipped and
> the child clocks are never enabled in stm32_omm_configure(). The new
> check is then false and nothing is disabled on the set_amcr() error
> path, so there is nothing to leak and no unbalanced
> clk_disable_unprepare().
> 
> The cleanup uses exactly the same condition that gated
> stm32_omm_toggle_child_clock(dev, true), so this also covers the case
> where st,omm-mux is present but CR_MUXEN is not set. The earlier
> "goto error" paths are all taken before the clocks are enabled, or
> from toggle_child_clock() itself, which already unwinds on failure.
> 
> If it helps, I can send a v2 that states this in the commit message.

Oohh, I see... I also see simple code paths were made here originally
complicated. To figure out if the cleanup has to happen or not, one has
to follow three places/variables. ret, mux & CR_MUXEN and where the mux
is even initialized.

Side note, feels like you used LLM to reply to me. This reply is exactly
what LLMs are sending to us. 100%. If that happened, then be careful not
to ever repeat that. I don't want to talk with someone's LLM through
that person.

> 
> Best regards,
> Diego
> 
> 
> On Wed, Sep 23, 2026 at 8:54 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 18/09/2026 01:59, Diego Fernando Mancera Gomez wrote:
>>> When the mux is enabled, stm32_omm_configure() enables the two OSPI
>>> child clocks via stm32_omm_toggle_child_clock(dev, true); they are meant
>>> to stay enabled for the device's lifetime and are disabled again in
>>> stm32_omm_remove() and on the devm_of_platform_populate() error path.
>>>
>>> However, if the subsequent stm32_omm_set_amcr() call fails, the function
>>> jumps to the "error:" label which only calls pm_runtime_put_sync_suspend()
>>> before returning, leaving the two child clocks enabled. As this happens
>>> during probe, the error is propagated and .remove() is never called, so
>>> the clock enable references are leaked. devm_clk_bulk_get() only releases
>>> the clock handles on unwind, it does not undo clk_prepare_enable().
>>>
>>> Disable the child clocks on the set_amcr() error path, mirroring the
>>> cleanup already done on the devm_of_platform_populate() failure path.
>>>
>>> Fixes: 8181d061dcff ("memory: Add STM32 Octo Memory Manager driver")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
>>> ---
>>>  drivers/memory/stm32_omm.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/memory/stm32_omm.c b/drivers/memory/stm32_omm.c
>>> index 84eb23c824f5..3599683ab04a 100644
>>> --- a/drivers/memory/stm32_omm.c
>>> +++ b/drivers/memory/stm32_omm.c
>>> @@ -274,6 +274,8 @@ static int stm32_omm_configure(struct device *dev)
>>>       writel_relaxed(omm->cr, omm->io_base + OMM_CR);
>>>
>>>       ret = stm32_omm_set_amcr(dev, true);
>>> +     if (ret && (mux & CR_MUXEN))
>>> +             stm32_omm_toggle_child_clock(dev, false);
>>
>> How does it work without st,omm-mux?
>>
>>>
>>>  error:
>>>       pm_runtime_put_sync_suspend(dev);
>>
>>
>> Best regards,
>> Krzysztof


Best regards,
Krzysztof

