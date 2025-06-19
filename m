Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD9BC7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 23:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NORCWqNeCw+KafYtbOVa71VaCuGoqfl0e3TMoGkjMt8=; b=QH9bfpvEPz2HM+urSzFcEipnB0
	0uafU9IVPARcUI2JT2z3yREbIa9RhuDcX+i0kPpJB5anFvrcMIvqrTi0AZci963Vos4n5QJsCGkvJ
	f5AvVOP/9wxkyvlzzVqelYs7j/NbRq1YUormQLfdnC7ln5Gs5ib9kZqdHE4vPL1AZPeniKj0b4xV4
	5tY6pTlYKZLvCJI1uR1LnY2zqAIeBb9fdhXXWScxNvQ1jQ9GOJIZ9iWOTy2oDLukbreqnBaeqHB5e
	WppL9h5UJxN2t1/Kmuarww8u5p4RZx2Kh/MnSb5dkkteHx1YwTrnCboBpp+QwWrBc5jY03TfxVjro
	2Y1JxZwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSOSt-0000000EPls-1vn8;
	Thu, 19 Jun 2025 23:14:39 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSOOv-0000000EPbJ-3VyW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 23:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44C9DA52B8B;
	Thu, 19 Jun 2025 23:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F9EEC4CEEA;
	Thu, 19 Jun 2025 23:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750374631;
	bh=rnVGVNG7SOYESn+2orXzfsDBfz1d8U4NDTEnCFm0dE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=tJCwf2fbGxdSVgK9Drd/CsR1mKOia0H+KByw58GuiVjufxkDflRyHQJsFiC8Jw3/X
	 PzK7Ivn0g3s30WXb/sX69Psc66rs5qOWZ80vUNfG6rXhndrQlz1qSRFhQP0RVErcDS
	 s6zIxnoxny50AuSZt55K6UTOy5ilFptvMzmB82Gq2rPU2+bNiBtVdYml8gAgfNiaBA
	 H5XvoKPDROMxDiJPnKKUwkn/UhawdllQEiWXZn3en31eKlqDBaCUBzIazwDuS/W5Mk
	 /2UDjmhXAREdDDuKFD2yuc+SU8Fv6wVKO6Isiy3rbyzmf8DfB/uqZxJ4uqNyMIQWeH
	 E85H3tOrscgEQ==
Date: Thu, 19 Jun 2025 16:10:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 netdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Michal Simek <michal.simek@amd.com>, Saravana Kannan
 <saravanak@google.com>, Leon Romanovsky <leon@kernel.org>, Dave Ertman
 <david.m.ertman@intel.com>, linux-kernel@vger.kernel.org, Ira Weiny
 <ira.weiny@intel.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
Message-ID: <20250619161030.6f14def9@kernel.org>
In-Reply-To: <20250619200537.260017-5-sean.anderson@linux.dev>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
	<20250619200537.260017-5-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_161033_947297_EE736544 
X-CRM114-Status: GOOD (  12.66  )
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

On Thu, 19 Jun 2025 16:05:37 -0400 Sean Anderson wrote:
> Returning EPROBE_DEFER after probing a bus may result in an infinite
> probe loop if the EPROBE_DEFER error is never resolved. For example, if
> the PCS is located on another MDIO bus and that MDIO bus is missing its
> driver then we will always return EPROBE_DEFER. But if there are any
> devices on our own MDIO bus (such as PHYs), those devices will be
> successfully bound before we fail our own probe. This will cause the
> deferred probing infrastructure to continuously try to probe our device.
> 
> To prevent this, split the MAC and MDIO functionality into separate
> auxiliary devices. These can then be re-probed independently.

There's a, pardon the expression, C++-like build failure here
culminating in:

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__exittest'
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of '__inittest'
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'init_module'
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:3225:1: error: redefinition of 'cleanup_module'

I'm guessing the existing module_platform_driver() and the new
module_auxiliary_driver() don't want to be friends when this 
code is built as a module?
-- 
pw-bot: cr

