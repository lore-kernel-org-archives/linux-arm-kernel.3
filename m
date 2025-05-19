Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC615C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 23:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YN4/HEa9sDxP2Z7RL5+mxoGiZVvfCkU7xA6VooLndAc=; b=hmG8u9xiLdFzqRz9tQktzDNwcV
	G2ClpcB+x4VLtnwkKNvHgyB3er/K9AcPipCZ1JYRh6JSaMKfCrzKVQ+Yw3YpzMyucF7LCR63LT0SG
	h0L9B6wXSilwOJz7SR+FHKPFOrD9hBB4HDsKEpYwyBMgUyRHFdcJennWm2+9AwHpns1fJEwcO8v1+
	uLu+Z+5TT4JvJ8obtPbx8TITkyBsNeEeFCfCuxNDixxSlxccuPhn7Gzp1w+dVV4dh58+dGxWbXfGh
	FMXcB3jbxclkaUQU1VtJd3c66r8LsFFcFTsKB50IuFYNT1Wy1kJLko6MBCOCLdbNxQCwnZhqZgkB5
	BqSIdHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9wm-0000000AuMw-4ANm;
	Mon, 19 May 2025 23:31:04 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH9ue-0000000AtY5-3DUJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 23:28:54 +0000
Message-ID: <7bb37bea-917c-4082-9eaa-063c4d97833b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747697320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YN4/HEa9sDxP2Z7RL5+mxoGiZVvfCkU7xA6VooLndAc=;
	b=w9wOR6RaiLyWj5YbX8yxLIvDgvwTh7Jq0WreayRD2rt1JAzgyn53ikzJwG70M1wq8Q5U4a
	P/2WI6G41QCFTI0nPDQeR0I0YDRMCc85FCJIGg11Njaz8Hcg7ygbTCSJEIZuezMWiSe2p8
	+IenDzDtW6ALs7mEOpXIGiRzzE0xdX0=
Date: Mon, 19 May 2025 19:28:34 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-4-ansuelsmth@gmail.com>
 <5d004048-ef8f-42ad-8f17-d1e4d495f57f@linux.dev>
 <aCOXfw-krDZo9phk@makrotopia.org>
 <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
 <aCQHZnAstBXbYzgy@makrotopia.org>
 <cdfbbdca-001b-4ed5-92ff-40fd3a8e3341@linux.dev>
Content-Language: en-US
In-Reply-To: <cdfbbdca-001b-4ed5-92ff-40fd3a8e3341@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_162852_948640_8D79F62E 
X-CRM114-Status: GOOD (  49.71  )
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

On 5/19/25 14:10, Sean Anderson wrote:
> On 5/13/25 23:00, Daniel Golle wrote:
>> On Tue, May 13, 2025 at 03:23:32PM -0400, Sean Anderson wrote:
>>> On 5/13/25 15:03, Daniel Golle wrote:
>>> > just instead of having many
>>> > more or less identical implementations of .mac_select_pcs, this
>>> > functionality is moved into phylink. As a nice side-effect that also
>>> > makes managing the life-cycle of the PCS more easy, so we won't need all
>>> > the wrappers for all the PCS OPs.
>>> 
>>> I think the wrapper approach is very obviously correct. This way has me
>>> worried about exciting new concurrency bugs.
>> 
>> You may not be surprised to read that this was also our starting point 2
>> months ago, I had implemented support for standalone PCS very similar to
>> the approach you have published now, using refcnt'ed instances and
>> locked wrapper functions for all OPs. My approach, like yours, was to
>> create a new subsystem for standalone PCS drivers which is orthogonal to
>> phylink and only requires very few very small changes to phylink itself.
>> It was a draft and not as complete and well-documented like your series
>> now, of course.
>> 
>> I've then shared that implementation with Christian and some other
>> experienced OpenWrt developers and we concluded that having phylink handle
>> the PCS lifecycle and PCS selection would be the better and more elegant
>> approach for multiple reasons:
>>  - The lifetime management of the wrapper instances becomes tricky:
>>    We would either have to live with them being allocated by the
>>    MAC-driver (imagine test-case doing unbind and then bind in a loop
>>    for a while -- we would end up oom). Or we need some kind of garbage
>>    collecting mechanism which frees the wrapper once refcnt is zero --
>>    and as .select_pcs would 'get' the PCS (ie. bump refcnt) we'd need a
>>    'put' equivalent (eg. a .pcs_destroy() OP) in phylink.
>> 
>>    Russell repeatedly pointed me to the possibility of a PCS
>>    "disappearing" (and potentially "reappearing" some time later), and
>>    in this case it is unclear who would then ever call pcs_put(), or
>>    even notify the Ethernet driver or phylink about the PCS now being
>>    available (again). Using device_link_add(), like it is done in
>>    pcs-rzn1-miic.c, prevents the worst (ie. use-after-free), but also
>>    impacts all other netdevs exposed by the same Ethernet driver
>>    instance, and has a few other rather ugly implications.
> 
> SRCU neatly solves the lifetime management issues. The wrapper lives as
> long as anyone (provider or user) holds a reference. A PCS can disappear
> at any point and everything still works (although the link goes down).
> Device links are only an optimization; they cannot be relied on for
> correctness.
> 
>>  - phylink currently expects .mac_select_pcs to never fail. But we may
>>    need a mechanism similar to probe deferral in case the PCS is not
>>    yet available.
> 
> Which is why you grab the PCS in probe. If you want to be more dynamic,
> you can do it in netdev open like is done for PHYs.
> 
>>    Your series partially solves this in patch 11/11 "of: property: Add
>>    device link support for PCS", but also that still won't make the link
>>    come back in case of a PCS showing up late to the party, eg. due to
>>    constraints such as phy drivers (drivers/phy, not drivers/net/phy)
>>    waiting for nvmem providers, or PCS instances "going away" and
>>    "coming back" later.
> 
> This all works correctly due to device links. The only case that doesn't
> work automatically is something like
> 
> MAC built-in
>   MDIO built-in
>     PCS module
> 
> where the PCS module gets loaded late. In that case you have to manually
> re-probe the MAC. I think the best way to address this would be to grab
> the PCS in netdev open so that the MAC can probe without the PCS.
> 
>>  - removal of a PCS instance (eg. via sysfs unbind) would still
>>    require changes to phylink. there is no phylink function to
>>    impair the link in this case, and using dev_close() is a bit ugly,
>>    and also won't bring the link back up once the PCS (re-)appears.
> 
> This works just fine. There are two cases:
> 
> - If the PCS has an IRQ, we notify phylink and then it polls the PCS
>   (see below).
> - If the PCS is polled, phylink will call pcs_get_state and see that the
>   link is down.
> 
> Either way, the link goes down. But bringing the link back up is pretty
> unusual anyway. Unlike PHYs (which theoretically can be on removable
> busses) PCSs are generally permanently attached to their MACs. The only
> removable scenario I can think of is if the PCS is on an FPGA and the
> MAC is not.
> 
> So if the PCS goes away, the MAC is likely to follow shortly after
> (since the whole thing is on a removable bus). Or someone has manually
> removed the PCS, in which case I think it's reasonable to have them
> manually remove the MAC as well. If you really want to support this,
> then just grab the PCS in netdev open.

So I had a closer look at this and unfortunately it isn't as easy as
just grabbing the PCS in ndo_open. The problem is that we need to
know the supported interfaces before phylink_create. The interfaces are
validated and are visible to userspace as soon as the netdev is
registered. And we can't just defer phylink_create to ndo_open because a
lot of the ethtool ops are implemented with phylink. So this would
probably need something like phylink_update_supported_interfaces().

But TBH I don't think this use case is very relevant. As I said above,
it only affects FPGA reconfiguration and people manually unbinding
drivers. Either way I think they are savvy enough to reprobe the netdev.

--Sean

>>  - phylink anyway is the only user of PCS drivers, and will very likely
>>    always be. So why create another subsystem?
> 
> To avoid adding overhead for the majority of PCSs where the PCS is built
> into the MAC and literally can't be removed. We only pay the price for
> dynamicism on the drivers where it matters.
> 
>> All that being said I also see potential problems with Christians
>> current implementation as it doesn't prevent the Ethernet driver to
>> still store a pointer to struct phylink_pcs (returned eg. from
>> fwnode_pcs_get()).
>> 
>> Hence I would like to see an even more tight integration with phylink,
>> in the sense that pointers to 'struct phylink_pcs' should never be
>> exposed to the MAC driver, as only in that way we can be sure that
>> phylink, and only phylink, is responsible for reacting to a PCS "going
>> away".
> 
> OK, but then how does the MAC select the PCS? If there are multiple PCSs
> then ultimately someone has to configure a mux somewhere.
> 
>> Ie. instead of fwnode_phylink_pcs_parse() handing pointers to struct
>> phylink_pcs to the Ethernet driver, so it can use it to populate struct
>> phylink_config available_pcs member, this should be the responsibility
>> of phylink alltogether, directly populating the list of available PCS in
>> phylink's private structure.
>> 
>> Similarly, there should not be fwnode_pcs_get() but rather phylink
>> providing a function fwnode_phylink_pcs_register(phylink, fwnode) which
>> directly adds the PCS referenced to the internal list of available PCS.
> 
> This is difficult to work with for existing drivers. Many of them have
> non-standard ways of looking up their PCS that they need to support for
> backwards-compatibility. And some of them create the PCS themselves
> (such as if they are PCI devices with internal MDIO busses). It's much
> easier for the MAC to create or look up the PCS itself and then hand it
> off to phylink.
> 
>> I hope we can pick the best of all the suggested implementations, and
>> together come up with something even better.
> 
> Sure. And I think we were starting from a clean slate then this would be
> the obvious way to do things. But we must support existing drivers and
> provide an upgrade path for them. This is why I favor an incremental
> approach.
> 
> --Sean

