Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A52C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 23:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jWjprf8y6cAF4Vs6ys1NyVQMZL58pnQZ4Y/NPoHcBJ8=; b=lCHYAsNoEkLCZs1Ly7U4oTMVO0
	eWSfEpJAbDpaTsEvoZIQ+fKPlo+7l/4RPkEofIJKE11mSADqa3Cu4xQNYSZQrBV0motuMlVYjNAsC
	cwgVSRobr+TA2eQkncwxUG+oOTHpD9gMnOnJk/Tc1kRtgPnUCysd5HWEbFYWBSLxfMU28JSUXl+3z
	THss0GP9hlutx6B5P2t/om7iByWDzOYYEgdgoU4PUfyyvaIjX/kXPVlyu1lSJEC17OXiQ2vcE8t4b
	t6qBBpeyJTep8thy5wC+cpryELmEeHOQ4eHEY449XCCEq1h9E/HFmIi39hYkwO4vqmnqqu3cR4A1x
	gXVmLYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSOZq-0000000EQLz-2Hop;
	Thu, 19 Jun 2025 23:21:50 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSOXb-0000000EPxc-0AB9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 23:19:32 +0000
Message-ID: <5a69ba82-813e-4f6f-9f62-7d68a9c74197@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750375164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jWjprf8y6cAF4Vs6ys1NyVQMZL58pnQZ4Y/NPoHcBJ8=;
	b=Wwk4E4C2IvGBD9QrcvoNNDOOLPT/KnHLPLgEpFIN6dxZdSEIArJKhd7PM+PP/qFm/SlN+u
	jw5wupAx8JwpsMMEIxQcZM06V1qD4gLm3l4wJFS8WgWF4Y8HSplK7e2yE3KKMCwT80CaW7
	x+rlS2wEUJ6DeykVAgqnr+tK0VIFYfA=
Date: Thu, 19 Jun 2025 19:19:15 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
To: Jakub Kicinski <kuba@kernel.org>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Saravana Kannan <saravanak@google.com>,
 Leon Romanovsky <leon@kernel.org>, Dave Ertman <david.m.ertman@intel.com>,
 linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-arm-kernel@lists.infradead.org
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-5-sean.anderson@linux.dev>
 <20250619161030.6f14def9@kernel.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250619161030.6f14def9@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_161931_295109_305AA418 
X-CRM114-Status: GOOD (  13.02  )
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

On 6/19/25 19:10, Jakub Kicinski wrote:
> On Thu, 19 Jun 2025 16:05:37 -0400 Sean Anderson wrote:
>> Returning EPROBE_DEFER after probing a bus may result in an infinite
>> probe loop if the EPROBE_DEFER error is never resolved. For example, if
>> the PCS is located on another MDIO bus and that MDIO bus is missing its
>> driver then we will always return EPROBE_DEFER. But if there are any
>> devices on our own MDIO bus (such as PHYs), those devices will be
>> successfully bound before we fail our own probe. This will cause the
>> deferred probing infrastructure to continuously try to probe our device.
>> 
>> To prevent this, split the MAC and MDIO functionality into separate
>> auxiliary devices. These can then be re-probed independently.
> 
> There's a, pardon the expression, C++-like build failure here
> culminating in:
> 
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__exittest'
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__inittest'
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'init_module'
> drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'cleanup_module'
> 
> I'm guessing the existing module_platform_driver() and the new
> module_auxiliary_driver() don't want to be friends when this 
> code is built as a module?

Hm, I thought I had built this as a module. I guess not. Will fix.

--Sean

