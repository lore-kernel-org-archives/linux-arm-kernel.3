Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16FAC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 05:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Riq7kKlM7VoV+5W49eco3ZRns3vCDS/JO4V0cZM+uTk=; b=kOU0EAXYXCJayTGodMVCSWrGP0
	KqZC1owKZif9cvHYphyP1hyPbI0i4+YWRf6lxXMi8FmnLvt5B/evaxtfxFECXfpctqpep4Hs56jjW
	AUy4JfHExLPhdljDmZrDIsGQB9AvwxECYC4lsVf1X59HEGnYioZKbemkhUgeJl/yk1GnKBKDTZJBV
	FFoHrXpfJ4pTT1O4PuPg6wtuSr4C3DgkspSwTylI9yut8FbP1KLvnkLIYTxm/FMwWtnM95qwquANA
	KSHpZh0n0O5L+mft4YTLsjXEBh7k+6la3T/cWe/i+Ec/ZSdKxt8imB98f/d5n7kwoIdUgkb5Bv7Gr
	eZTenDzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSU6J-0000000Elwx-3Eib;
	Fri, 20 Jun 2025 05:15:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSU45-0000000EloH-1lyx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 05:13:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE3455C6A1B;
	Fri, 20 Jun 2025 05:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711C1C4CEE3;
	Fri, 20 Jun 2025 05:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750396404;
	bh=oQJ+HgZ1HzTQr6gaOz+14ObNdfbXRI6qb0MFsR9E0yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HklS9UjTgmwvOGKiAz7K5E9rk3tmtU4a4dp9E+A/bgh1w98Jx3VM6YKfr7dGQyrb/
	 YgCodfOwUOqW5A5tvIFUKavikr3UYAU1wPc6XbHdKnQBXoCw8eek6rd/vTDjuI6qQW
	 P2aMLXcIOyac+Bh3k88xVesQOg5xbLP4cj9Om7Wg=
Date: Fri, 20 Jun 2025 07:13:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Michal Simek <michal.simek@amd.com>,
	Saravana Kannan <saravanak@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Danilo Krummrich <dakr@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH net 1/4] auxiliary: Allow empty id
Message-ID: <2025062004-essay-pecan-d5be@gregkh>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-2-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619200537.260017-2-sean.anderson@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_221325_543428_E0160242 
X-CRM114-Status: GOOD (  13.27  )
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

On Thu, Jun 19, 2025 at 04:05:34PM -0400, Sean Anderson wrote:
> Support creating auxiliary devices with the id included as part of the
> name. This allows for non-decimal ids, which may be more appropriate for
> auxiliary devices created as children of memory-mapped devices. For
> example, a name like "xilinx_emac.mac.802c0000" could be achieved by
> setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.

I don't see the justification for this, sorry.  An id is just an id, it
doesn't matter what is is and nothing should be relying on it to be the
same across reboots or anywhere else.  The only requirement is that it
be unique at this point in time in the system.

We're having this same discussion on a different thread for a different
bus as well.  This isn't something new, it's been hashed out and
resolved 20+ years ago...

So no, this change isn't ok to make at this point in time, sorry.

greg k-h

