Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D8EC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 00:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFGkta2yH79YT2RqKo4wHaIBm0v430uzCtbMdsMX9HM=; b=sRFCgiRCwQjILRsu0uCenVSTJe
	DVM4tll5ac6KDI3M6TGt4bYKUDvl54YbtfN1V7kHaNL5uj/e6ax06qCxhu83EvwjmDfgwDtVfzZbH
	63UjAXVCSe7yKzekkrIox90BybyEhYFbR+ApcSGjdtymuk0YhRGcAMIwvCYZJiMbO4mJApdJC6u/Y
	P6enWq71YgLhn+plUICe8UqwwdcXlQpJgqhGM2GvqzOHa6KRCP7zXDEjhNsPzDbLKYite/4ILT7C3
	gbfilWl7eLVVYrjmb/ZJa3v4kcrK94QBwWnirmDIPOfOwJz2NN8adGbwPF5grEv9zQ/MxFvsx8S/e
	+C5kpgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldMx-00000007DR7-2DV3;
	Sat, 22 Feb 2025 00:27:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldLT-00000007DIt-0s9I
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 00:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740183976; x=1771719976;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vrsf0n7ZKY8Rgo7QAxaBCIwX0QhPlVwAlrXV1JsxYTc=;
  b=FUDYZiDn/GW3AQIGJpTHYVKw1JtbrDxafYgaHp+c88faMBTtfQEJYQVB
   SK7pAGuByCPbfMRMRPkCm4BgeVfRgGGfSxyj1GP1IouRzzBrxvWOdIyZq
   KbjkX6D82seM8ZxJYs/Es8/zgfs3ZgHjrGzLPcJCLAhjsB9wTf/nWMCtq
   8+Crk61zddSdjCBFmYEifbJwYsLplmLmo3NZqQ/XH52+jLNikA+KNJasd
   6vVaS+vWZfBleDAAEN4j3OQLPVQxeaErCxWk6THV+FSR9Gw/8nPEYO4as
   vgCdtCAOBQA1rdW6Aqr5Ych8x+5DpOFieVDSLzUaHtv0jFKfe3zUzsyGy
   A==;
X-CSE-ConnectionGUID: eA6ZIIduRlKCp3I//+fAUw==
X-CSE-MsgGUID: TG+dLHoyTj2hK6qUbZTmZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="63488039"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="63488039"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 16:26:13 -0800
X-CSE-ConnectionGUID: PHiHpXemQRq6zbcoQudtdA==
X-CSE-MsgGUID: +tqM9EucTUKBlk9KS9eT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="115474920"
Received: from mohdfai2-mobl.gar.corp.intel.com (HELO [10.247.60.175]) ([10.247.60.175])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 16:26:05 -0800
Message-ID: <fbcbfdc4-5f20-4dbc-9e46-e9c28fc399c8@linux.intel.com>
Date: Sat, 22 Feb 2025 08:26:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next v5 1/9] net: ethtool: mm: extract stmmac
 verification logic into common library
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Furong Xu <0x1207@gmail.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Simon Horman <horms@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Serge Semin <fancer.lancer@gmail.com>,
 Xiaolei Wang <xiaolei.wang@windriver.com>,
 Suraj Jaiswal <quic_jsuraj@quicinc.com>,
 Kory Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
 <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
 <20250221174249.000000cc@gmail.com> <20250221095651.npjpkoy2y6nehusy@skbuf>
 <20250221182409.00006fd1@gmail.com> <20250221104333.6s7nvn2wwco3axr3@skbuf>
 <3fbe3955-48b8-449d-93ff-2699a7efcd8d@linux.intel.com>
 <20250221144402.6nuuosfjmo5tqgmj@skbuf>
Content-Language: en-US
From: "Abdul Rahim, Faizal" <faizal.abdul.rahim@linux.intel.com>
In-Reply-To: <20250221144402.6nuuosfjmo5tqgmj@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_162615_295245_5B118E2C 
X-CRM114-Status: GOOD (  38.49  )
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



On 21/2/2025 10:44 pm, Vladimir Oltean wrote:
> On Fri, Feb 21, 2025 at 09:30:09PM +0800, Abdul Rahim, Faizal wrote:
>> On 21/2/2025 6:43 pm, Vladimir Oltean wrote:
>>> On Fri, Feb 21, 2025 at 06:24:09PM +0800, Furong Xu wrote:
>>>> Your fix is better when link is up/down, so I vote verify_enabled.
>>>
>>> Hmmm... I thought this was a bug in stmmac that was carried over to
>>> ethtool_mmsv, but it looks like it isn't.
>>>
>>> In fact, looking at the original refactoring patch I had attached in
>>> this email:
>>> https://lore.kernel.org/netdev/20241217002254.lyakuia32jbnva46@skbuf/
>>>
>>> these 2 lines in ethtool_mmsv_link_state_handle() didn't exist at all.
>>>
>>> 	} else {
>>>>>>> 		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
>>>>>>> 		mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;
>>>
>>> 		/* No link or pMAC not enabled */
>>> 		ethtool_mmsv_configure_pmac(mmsv, false);
>>> 		ethtool_mmsv_configure_tx(mmsv, false);
>>> 	}
>>>
>>> Faizal, could you remind me why they were added? I don't see this
>>> explained in change logs.
>>>
>>
>> Hi Vladimir,
>>
>> Yeah, it wasn’t there originally. I added that change because it failed the
>> link down/link up test.
>> After a successful verification, if the link partner goes down, the status
>> still shows ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED, which isn’t correct—so
>> that’s why I added it.
>>
>> Sorry for not mentioning it earlier. I assumed you’d check the delta between
>> the original patch and the upstream one, my bad, should have mentioned this
>> logic change.
>>
>> Should I update it to the latest suggestion?
> 
> Never, ever modify logic in the same commit as you are moving code.
> I was wondering what's with the Co-developed-by: tags, but I had just
> assumed fixups were made to code I had improperly moved because I
> didn't have hardware to test. Always structure patches to be one single
> logical change per patch, well justified and trivially correct.

Got it, sorry about that.

> I had assumed, in good faith, changes like this wouldn't sneak in, but I
> guess thanks for letting me know I should check next time :)
> 
> I think it's a slightly open question which state should the verification
> be in when the link fails, but in any case, your argument could be made
> that the state of the previous verification should be lost.
> 
> If I look at figure 99-8 in the Verify state diagram, I see that
> whenever the condition "begin || link_fail || disableVerify || !pEnable"
> is true, we transition to the state INIT_VERIFICATION. From there, there
> is a UCT (unconditional transition) to VERIFICATION_IDLE, and from there,
> a transition to state SEND_VERIFY based on "pEnable && !disableVerify".
> In principle what this is telling me is that as long as management
> software doesn't set pEnable (tx_enable in Linux) to false, verification
> would be attempted even with link down, and should eventually fail.
> 
> But the mmsv state machine does call ethtool_mmsv_configure_tx(mmsv, false),
> and in that case, if I were to interpret the standard state machine very
> strictly, it would remain blocked in state VERIFICATION_IDLE until a
> link up (thus, we should report the state as "verifying").
> 
> But, to be honest, I think the existence of the VERIFICATION_IDLE state
> doesn't make a lot of sense. The state machine should just transition on
> "!link_fail && !disable_verify && pEnable" to SEND_VERIFY directly, and
> from state WAIT_FOR_RESPONSE it should cycle back to SEND_VERIFY if the
> verify timer expired but we still have retries, or to INIT_VERIFICATION
> if link_fail, disableVerify or pEnable change. One more reason why I
> believe the VERIFICATION_IDLE state is redundant and under-specified is
> because it gives the user no chance to even _see_ the "initial" state
> being reported ever, given the unconditional transition to VERIFICATION_IDLE.
> 
> So in that sense, I agree with your proposal, and in terms of code,
> I would recommend just this:
> 
>   } else {
> +	/* Reset the reported verification state while the link is down */
> +	if (mmsv->verify_enabled)
> +		mmsv->status = ETHTOOL_MM_VERIFY_STATUS_INITIAL;
>   
>   	/* No link or pMAC not enabled */
>   	ethtool_mmsv_configure_pmac(mmsv, false);
>   	ethtool_mmsv_configure_tx(mmsv, false);
>   }
> 
> Because this is just for reporting to user space, resetting
> "mmsv->verify_retries = ETHTOOL_MM_MAX_VERIFY_RETRIES;" doesn't matter,
> we'll do it on link up anyway.
> 
> Also note that there's no ternary operator like in the discussion with
> Furong. If mmsv->verify_enabled is false, the mmsv->status should
> already be DISABLED, no need for us to re-assign it.
> 

Will update, thanks.


