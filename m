Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E374C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yTO3YdBSku104YsDHmadAMJYlJFGtvsp+k7l1sVkgSg=; b=zKsg/Xf6Kkwv0vB+Uum+Q1F20c
	PYI4MN9ROcTkktseklybLD9h1cNcu2ciZmRJ1CDtvdNqVDx/wez0eiEqSqZ2kfWESqv9AABN/zQ2p
	8It6xSKh52dmGEIsFD2M2bJhIYqvoBsXGCL+pt1ew4oAb4CjACFe2d6Evc2S+2mE8gi1qkziEzZck
	jTI92Fc05YvViT5W56oRe3v25SRaEVrpcWK86Q4md+yTPsOkzjrMUwIfsGPzMG3nJjoQV10jr6+kx
	zlyMSEQZjZn+UiOBwK+Zx4Tov1TM6WaYB6h49DAxkwxCHe8Fui2DqVXKf5GmWA9+OOAkLrmwnzjIM
	h26Wqpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTrZy-00000004G7w-008z;
	Tue, 24 Jun 2025 00:32:02 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTltA-00000003gaQ-2eYU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 18:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yTO3YdBSku104YsDHmadAMJYlJFGtvsp+k7l1sVkgSg=; b=YXI94wCGPdOe2CSM6CC4T+f6Rk
	s67hx3V6dimXQeRJaWcv0iJpYTreqPJ1GAJtE2RG6zijyvgwEotQkcTR6PkSPsSECwHwMobeAY0WT
	tbRRgl3SMECeUH7B5QTEI0gX6c1f6+vslJkZ1kIGzRKmVZ/+Cpp8BePYS5rAEztTIUVg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uTlsv-00Gij3-1s; Mon, 23 Jun 2025 20:27:13 +0200
Date: Mon, 23 Jun 2025 20:27:13 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 4/4] net: axienet: Split into MAC and MDIO drivers
Message-ID: <c543674a-305e-4691-b600-03ede59488ef@lunn.ch>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-5-sean.anderson@linux.dev>
 <16ebbe27-8256-4bbf-ad0a-96d25a3110b2@lunn.ch>
 <0854ddee-1b53-472c-a4fe-0a345f65da65@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0854ddee-1b53-472c-a4fe-0a345f65da65@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_112728_672508_1BC80842 
X-CRM114-Status: GOOD (  18.64  )
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

On Mon, Jun 23, 2025 at 11:16:08AM -0400, Sean Anderson wrote:
> On 6/21/25 03:33, Andrew Lunn wrote:
> > On Thu, Jun 19, 2025 at 04:05:37PM -0400, Sean Anderson wrote:
> >> Returning EPROBE_DEFER after probing a bus may result in an infinite
> >> probe loop if the EPROBE_DEFER error is never resolved.
> > 
> > That sounds like a core problem. I also thought there was a time
> > limit, how long the system will repeat probes for drivers which defer.
> > 
> > This seems like the wrong fix to me.
> 
> I agree. My first attempt to fix this did so by ignoring deferred probes
> from child devices, which would prevent "recursive" loops like this one
> [1]. But I was informed that failing with EPROBE_DEFER after creating a
> bus was not allowed at all, hence this patch.

O.K. So why not change the order so that you know you have all the
needed dependencies before registering the MDIO bus?

Quoting your previous email:

> Returning EPROBE_DEFER after probing a bus may result in an infinite
> probe loop if the EPROBE_DEFER error is never resolved. For example,
> if the PCS is located on another MDIO bus and that MDIO bus is
> missing its driver then we will always return EPROBE_DEFER.

Why not get a reference on the PCS device before registering the MDIO
bus?

	Andrew

