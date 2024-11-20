Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7AD44152
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQUWmnoTYf9CwO6YqmQ1nnXZjfC/vwe2aODMfdt2LuI=; b=WR6HEE5ebd9dTdIcD6n05o+OfZ
	D13z/n0gbVg02MNpjZgCq12Q5cg9H2L4yzmQAieYTIOWBjL6s92LJ8ykdK0lSGZB1hsSpRqZ8UvAX
	6J0z5JPhjZ3DgZxHU0MzyVxaUA3x1InEDyvYyFV7G5syXuxQ3OOBzvhW/tgqtGB+r/8VMgyV3LBRl
	trfEUMGUJEGFasfCXfMgrsanSWRzhLFOjswFePm6kJX0yAS+hF3RBd6ZtYO82+r9b5RNNxzwvH4vZ
	KVzlCpQhsJnU4Q7byUAFptJ11IdSdW1YxIBpWz9jYBa8tGEO5n1tmkSPCzmmGkeYVGfV64trD/uP7
	oFwzbc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm2P-0000000FbAx-3Hio;
	Wed, 20 Nov 2024 14:50:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDm1T-0000000FayX-1RWW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 14:49:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3217A42741;
	Wed, 20 Nov 2024 14:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5F9C4CED1;
	Wed, 20 Nov 2024 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732114177;
	bh=jMjgTssF8JTk16sOo+gXL1KKvtQZooI008o2ZjDi9Zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gj+kVtgKs2fEbZoaLU/WK4qRB6Y5lmlFlXJ1B6a/qhogii+CuftNsMve1n963nsNg
	 ubUXC+PT+yFzorSeTCOIT5NKbk4UsnFDVsl/LIRJhhDReLa6NAhnXg5tDGNS4VUE62
	 n75s710NFzJCfQqvV/bU2D1TiYJUJgETZJdV1WigkNUxP8DclWfw6g57arCdUQip5T
	 f7YE1BTYH6JRvoRvwqG2INosdOYalseGBR2VjT3KLcoAqS8AP/XFJdlZTS95v9VaOB
	 xVlayAtsMW16jBXlOyDAGzbQwmK2SkJ7umMPAatdDyJ/6L3QEPtnyu4ai2HpeDjtkj
	 iFXLMwLDeiopg==
Message-ID: <ea3b4e40-8798-4352-8f45-242962532500@kernel.org>
Date: Wed, 20 Nov 2024 16:49:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/12] xhci: introduce xhci->lost_power flag
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Chen <peter.chen@kernel.org>,
 Pawel Laszczak <pawell@cadence.com>, Mathias Nyman
 <mathias.nyman@intel.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Kevin Hilman <khilman@kernel.org>,
 =?UTF-8?Q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240726-s2r-cdns-v5-0-8664bfb032ac@bootlin.com>
 <20240726-s2r-cdns-v5-9-8664bfb032ac@bootlin.com>
 <1cd45625-84e4-43aa-ae2b-a59f10add898@kernel.org>
 <D42NIH63EHZG.KKWZR2WZB68L@bootlin.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <D42NIH63EHZG.KKWZR2WZB68L@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_064939_514606_0E92B8CA 
X-CRM114-Status: GOOD (  28.33  )
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

Hello Théo,

On 10/09/2024 16:50, Théo Lebrun wrote:
> On Mon Aug 5, 2024 at 3:41 PM CEST, Roger Quadros wrote:
>> On 26/07/2024 21:17, Théo Lebrun wrote:
>>> The XHCI_RESET_ON_RESUME quirk allows wrappers to signal that they
>>> expect a reset after resume. It is also used by some to enforce a XHCI
>>> reset on resume (see needs-reset-on-resume DT prop).
>>>
>>> Some wrappers are unsure beforehands if they will reset. Add a mechanism
>>> to signal *at resume* if power has been lost. Parent devices can set
>>> this flag, that defaults to the XHCI_RESET_ON_RESUME value.
>>>
>>> The XHCI_RESET_ON_RESUME quirk still triggers a runtime_pm_get() on the
>>> controller. This is required as we do not know if a suspend will
>>> trigger a reset, so the best guess is to avoid runtime PM.
>>>
>>> Reset the xhci->lost_power value each time in xhci_resume(), making it
>>> safe for devices to only set lost_power on some resumes.
>>>
>>> Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
>>> ---
>>>  drivers/usb/host/xhci.c | 8 +++++++-
>>>  drivers/usb/host/xhci.h | 6 ++++++
>>>  2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
>>> index 0a8cf6c17f82..2c9b32d339f9 100644
>>> --- a/drivers/usb/host/xhci.c
>>> +++ b/drivers/usb/host/xhci.c
>>> @@ -1029,9 +1029,12 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t msg)
>>>  
>>>  	spin_lock_irq(&xhci->lock);
>>>  
>>> -	if (hibernated || xhci->quirks & XHCI_RESET_ON_RESUME || xhci->broken_suspend)
>>> +	if (hibernated || xhci->lost_power || xhci->broken_suspend)
>>
>> Why not treat xhci->lost_power and xhci->quriks & XHCI_RESET_ON_RESUME independently?
>>
>> XHCI_RESET_ON_RESUME is sued by devices that know they always need to be reset on resume.
>>
>> xhci->lost_power is used by devices that don't have consistent behavior.
> 
> The goal is to avoid almost-duplicate functionality. I feel like:
> 
>     XHCI_RESET_ON_RESUME is the default value of xhci->lost_power,
>     which might be modified at resume.
> 
> Is a more straight forward solution than:
> 
>     Both XHCI_RESET_ON_RESUME and xhci->lost_power define if power was
>     lost at resume. First must be statically known, second can be
>     updated during runtime. If second is used, first one must NOT be
>     set.
> 
> Indeed, the first solution brings two additional lines of code as you
> commented below. I'd argue the easier-to-wrap-your-head-around logic is
> more important.
> 
> Tell me if you are convinced the second approach is better.
> 

I would still vote to keep logic tied to separate flags.

so XHCI_RESET_ON_RESUME to always resume on RESET
xhci->lost_power, reset based on runtime checks.

Which implies that platforms using xhci->lost_power should not
set XHCI_RESET_ON_RESUME.

But XHCI maintainers should give their opinion on this.

>>
>>
>>>  		reinit_xhc = true;
>>>  
>>> +	/* Reset to default value, parent devices might correct it at next resume. */
>>> +	xhci->lost_power = !!(xhci->quirks & XHCI_RESET_ON_RESUME);
>>> +
>>
>> then you don't need to do this.
> 
> To be honest, I added this line out of rigor. We could remove it and say
> that any device that modifies xhci->lost_power once at resume must set
> it at each later resume.
> 
> The above line felt like a small safety net to avoid logic mistakes.
> 
>>
>>>  	if (!reinit_xhc) {
>>>  		/*
>>>  		 * Some controllers might lose power during suspend, so wait
>>> @@ -5228,6 +5231,9 @@ int xhci_gen_setup(struct usb_hcd *hcd, xhci_get_quirks_t get_quirks)
>>>  	if (get_quirks)
>>>  		get_quirks(dev, xhci);
>>>  
>>> +	/* Default value, that can be corrected at resume. */
>>> +	xhci->lost_power = !!(xhci->quirks & XHCI_RESET_ON_RESUME);
>>> + 
>>
>> nor this.
> 
> Regards,
> 
> --
> Théo Lebrun, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
cheers,
-roger


