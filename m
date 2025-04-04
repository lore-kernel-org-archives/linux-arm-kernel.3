Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D5C3601B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 07:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zPU3ATn0FBmkkuVv3Gyis7L+Irx3UYz32Kc58zLv+pM=; b=joWoE0IgbkK3yXaVE4gxrDZ/zC
	JlG80ueCEKoXj/+QIFWNsU4ecy8hZNnL+nI891kiIwhcKO4g59b9JA6OeEF7PrD4NVQxHKf0jZ7bz
	ARiUQeMK86POUGlq2H3yqS/5Ad+ziFdaVb3sDdrHTR2Lz+zHlQ5aP/JXnY5g3JAKq6Sc27jaWH9C4
	wyGnzEJ3UrZA783rHKYKJiQfWuGOJ9+fB17XWdxNbX6j3Zj47k1xqvm08EayZeWkoVXaRTK+usykV
	QjIg1ahmrFbkP0Ju+ce050Dxzz9wIm6LpB2seTk92ZBv4sE4yCaVY3mJEV1rLGeLhWCn7BrRpV0Jj
	SAh6pwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bnx-0000000B40g-19HQ;
	Fri, 04 Apr 2025 07:49:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0bm9-0000000B3oy-1blJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 07:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03B4C44FAC;
	Fri,  4 Apr 2025 07:47:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 648B5C4CEDD;
	Fri,  4 Apr 2025 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743752859;
	bh=n3WVEOSVyo5twplGrYfxLFXNkYDXkXuKVIkLlw7ygbk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CC5HlRubywiTUHDH3GzqNyIgC1CyFlxgDXREVTm98WIyeYzkFtFs1a/eZoA1kVwWy
	 OQury3Z2olmo+RsZFmcEkI9l2TlvcYevXb6UpYO36+NuZLGzgGohMhfUzUUkOeR3ZE
	 GsyjJqoQatJnwtYUJxI385nqicOS+N5RxwEyl3ayC7VhmCQYA+yQZIFc0njrKNU3Vt
	 bYaJjiUwN2dEOIEadffJuZIZ+TGdEkMwNpJ/EVOrzlgARVxCK6wTSh0jyurUNsP/it
	 7WkwttaqqGemqoIwLYqZvVcPffwhGG1EXh/aH9PJ/nKWsgAS2Cwi8c0wyf3bQgm/He
	 dVGBSaXr9RaRw==
Message-ID: <58d26423-04da-4491-9318-d4a7a1f12005@kernel.org>
Date: Fri, 4 Apr 2025 10:47:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 3/3] net: ti: icss-iep: Fix possible NULL pointer
 dereference for perout request
To: Paolo Abeni <pabeni@redhat.com>, "Malladi, Meghana" <m-malladi@ti.com>,
 dan.carpenter@linaro.org, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 namcao@linutronix.de, javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 horms@kernel.org, jacob.e.keller@intel.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-4-m-malladi@ti.com>
 <0fb67fc2-4915-49af-aa20-8bdc9bed4226@kernel.org>
 <b0a099a6-33b2-49f9-9af7-580c60b98f55@ti.com>
 <469fd8d0-c72e-4ca6-87a9-2f42b180276b@redhat.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <469fd8d0-c72e-4ca6-87a9-2f42b180276b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_004741_466138_B9D4EF19 
X-CRM114-Status: GOOD (  21.54  )
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



On 03/04/2025 14:25, Paolo Abeni wrote:
> On 4/2/25 2:37 PM, Malladi, Meghana wrote:
>> On 4/2/2025 5:58 PM, Roger Quadros wrote:
>>> On 28/03/2025 12:24, Meghana Malladi wrote:
>>>> ICSS IEP driver has flags to check if perout or pps has been enabled
>>>> at any given point of time. Whenever there is request to enable or
>>>> disable the signal, the driver first checks its enabled or disabled
>>>> and acts accordingly.
>>>>
>>>> After bringing the interface down and up, calling PPS/perout enable
>>>> doesn't work as the driver believes PPS is already enabled,
>>>
>>> How? aren't we calling icss_iep_pps_enable(iep, false)?
>>> wouldn't this disable the IEP and clear the iep->pps_enabled flag?
>>>
>>
>> The whole purpose of calling icss_iep_pps_enable(iep, false) is to clear 
>> iep->pps_enabled flag, because if this flag is not cleared it hinders 
>> generating new pps signal (with the newly loaded firmware) once any of 
>> the interfaces are up (check icss_iep_perout_enable()), so instead of 
>> calling icss_iep_pps_enable(iep, false) I am just clearing the 
>> iep->pps_enabled flag.
> 
> IDK what Roger thinks, but the above is not clear to me. I read it as
> you are stating that icss_iep_pps_enable() indeed clears the flag, so i
> don't see/follow the reasoning behind this change.
> 
> Skimmir over the code, icss_iep_pps_enable() could indeed avoid clearing
> the flag under some circumstances is that the reason?
> 
> Possibly a more describing commit message would help.

I would expect that modifying the xxx_enabled flag should be done only
in the icss_iep_xxx_enable() function. Doing it anywhere else will be difficult
to track/debug in the long term.

I don't see why the flag needs to be set anywhere else. Maye better to
improve logic inside icss_iep_pps_enable() like Paolo suggests.

> 
>>> And, what if you brought 2 interfaces of the same ICSS instances up
>>> but put only 1 interface down and up?
>>>
>>
>> Then the flag need not be disabled if only one interface is brought down 
>> because the IEP is still alive and all the IEP configuration (including 
>> pps/perout) is still valid.
> 
> I read the above as stating this fix is not correct in such scenario,
> leading to the wrong final state.
> 
> I think it would be better to either give a better reasoning about this
> change in the commit message or refactor it to handle even such scenario,
> 
> Thanks,
> 
> Paolo
> 

-- 
cheers,
-roger


