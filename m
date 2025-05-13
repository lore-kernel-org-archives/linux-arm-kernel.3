Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AB64C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MXqgYnE3AepAu7OCHe6xShNfWSkRf6wZdbffLDc2GQI=; b=jtK+MQ95wEP5ca4InwmOLjpS/U
	/8eH0/pqK/WPAxDt3WOU7xjeSyxONNYXm97cyEBPNkLVaMr50z5Faxy5qM5avqq5QvYfRpWwLRxOM
	zB06sO2grgdxfW2rQYXjbkjt8I7qaZz0B1N66/t7fqZ2AxI2PVjLlZ5VH8TvOy3hXxkymQLv2VQSe
	pEmdFd3UTXoAeLsqiVMIKIr9ZBgZWkxfMGd7KQpLQHIOZ1qhix/ZmPuZ6bT9qvne/lWtpY9n5M+7h
	t/IIu0UvK8bVs2fthHTA657AtuZHnyptSB9r/AlaIEADu4YXKHtfiTCskpHkutJRjqHoVH84aNnNj
	fzZEIOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvRy-0000000DOAS-1BiV;
	Tue, 13 May 2025 19:38:02 +0000
Received: from out-184.mta0.migadu.com ([2001:41d0:1004:224b::b8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvEA-0000000DMOv-0Ehg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 19:23:47 +0000
Message-ID: <7b50d202-e7f6-41cb-b868-6e6b33d4a2b9@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747164223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MXqgYnE3AepAu7OCHe6xShNfWSkRf6wZdbffLDc2GQI=;
	b=VtZdYZuFJN9nYBtFV5UQzISBic9XzYAiNeQg++rh/pXLuhJcMYllZu/O2Q6GMMAQ4HuCEd
	fGuZJB6B1v4oafU0j7h8i/qH0U8a7kaLqNm+j8GElY07h0yssh4/rb36IGjQjpJoS079Yu
	kWKljet5kNrkLMPVphCd9wOA3iwyNO8=
Date: Tue, 13 May 2025 15:23:32 -0400
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: phylink: introduce internal
 phylink PCS handling
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <aCOXfw-krDZo9phk@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_122346_383394_130084D1 
X-CRM114-Status: GOOD (  40.59  )
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

On 5/13/25 15:03, Daniel Golle wrote:
> On Tue, May 13, 2025 at 02:18:02PM -0400, Sean Anderson wrote:
>> On 5/11/25 16:12, Christian Marangi wrote:
>> > Introduce internal handling of PCS for phylink. This is an alternative
>> > to .mac_select_pcs that moves the selection logic of the PCS entirely to
>> > phylink with the usage of the supported_interface value in the PCS
>> > struct.
>> > 
>> > MAC should now provide an array of available PCS in phylink_config in
>> > .available_pcs and fill the .num_available_pcs with the number of
>> > elements in the array. MAC should also define a new bitmap,
>> > pcs_interfaces, in phylink_config to define for what interface mode a
>> > dedicated PCS is required.
>> > 
>> > On phylink_create() this array is parsed and a linked list of PCS is
>> > created based on the PCS passed in phylink_config.
>> > Also the supported_interface value in phylink struct is updated with the
>> > new supported_interface from the provided PCS.
>> > 
>> > On phylink_start() every PCS in phylink PCS list gets attached to the
>> > phylink instance. This is done by setting the phylink value in
>> > phylink_pcs struct to the phylink instance.
>> > 
>> > On phylink_stop(), every PCS in phylink PCS list is detached from the
>> > phylink instance. This is done by setting the phylink value in
>> > phylink_pcs struct to NULL.
>> > 
>> > phylink_validate_mac_and_pcs(), phylink_major_config() and
>> > phylink_inband_caps() are updated to support this new implementation
>> > with the PCS list stored in phylink.
>> > 
>> > They will make use of phylink_validate_pcs_interface() that will loop
>> > for every PCS in the phylink PCS available list and find one that supports
>> > the passed interface.
>> > 
>> > phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
>> > where if a supported_interface value is not set for the PCS struct, then
>> > it's assumed every interface is supported.
>> > 
>> > A MAC is required to implement either a .mac_select_pcs or make use of
>> > the PCS list implementation. Implementing both will result in a fail
>> > on MAC/PCS validation.
>> > 
>> > phylink value in phylink_pcs struct with this implementation is used to
>> > track from PCS side when it's attached to a phylink instance. PCS driver
>> > will make use of this information to correctly detach from a phylink
>> > instance if needed.
>> > 
>> > The .mac_select_pcs implementation is not changed but it's expected that
>> > every MAC driver migrates to the new implementation to later deprecate
>> > and remove .mac_select_pcs.
>> 
>> This introduces a completely parallel PCS selection system used by a
>> single driver. I don't think we want the maintenance burden and
>> complexity of two systems in perpetuity. So what is your plan for
>> conversion of existing drivers to your new system?
> 
> Moving functionality duplicated in many drivers to a common shared
> implementation is nothing unsual.
> 
> While this series proposes the new mechanism for Airoha SoC, they are
> immediately useful (and long awaited) also for MediaTek and Qualcomm
> SoCs.
>
> Also in the series you posted at least the macb driver (in "[net-next
> PATCH v4 09/11] net: macb: Move most of mac_config to  mac_prepare")
> would benefit from that shared implementation, as all it does in it's
> mac_select_pcs is selecting the PCS by a given phy_interface_t, which is
> what most Ethernet drivers which use more than one PCS are doing in
> their implementatio of mac_select_pcs().

I generally agree. The vast majority of select_pcs implementations just
determine the PCS based on the interface. But I don't think this is the
right approach. This touches a lot of other areas of the code and
reimplements much of the existing phylink machinery.

I would prefer something more self-contained like

phylink_generic_select_pcs(phylink, interface)
{
	for_each(pcs : phylink->available_pcss) {
		if (test_bit(pcs->supported, interface))
			return pcs;
	}

	return NULL;
}

which could be dropped into existing implementations in an incremental
manner.

I think the inclusion of PCS lifetime management in this patch
complicates things significantly.

> Also axienet_mac_select_pcs() from "[net-next PATCH v4 08/11] net:
> axienet: Convert to use PCS subsystem" could obviously very easily be
> mirated to use the phylink-internal handling of PCS selection.

But the bulk of the patch remains. We still have to add the external PCS
lookup. There still needs to be another case in mac_config to mux the
PCS correctly. And we would need to add some code to create a list of
PCSs. I don't know whether we win on the balance.

>> 
>> DSA drivers typically have different PCSs for each port. At the moment
>> these are selected with mac_select_pcs, allowing the use of a single
>> phylink_config for each port. If you need to pass PCSs through
>> phylink_config then each port will needs its own config. This may prove
>> difficult to integrate with the existing API.
> 
> This might be a misunderstanding. Also here there is only a single
> phylink_config for each MAC or DSA port,

My point is that while this is the case at the moment, it would not be
the case with a "generic" select pcs. You would need to modify the
config for each port to ensure the right PCSs are passed in.

> just instead of having many
> more or less identical implementations of .mac_select_pcs, this
> functionality is moved into phylink. As a nice side-effect that also
> makes managing the life-cycle of the PCS more easy, so we won't need all
> the wrappers for all the PCS OPs.

I think the wrapper approach is very obviously correct. This way has me
worried about exciting new concurrency bugs.

--Sean

