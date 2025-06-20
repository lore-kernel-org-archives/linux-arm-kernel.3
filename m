Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18180C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HHEQIePscC1n74lyuar5DR9Xw0jtRobcupQvjAoT8Q4=; b=GPAfHd5SOKyrY+z5coCXiJxG1s
	zVg2+ogeeFj8OpWwuQpkSdICl1BJ6On0bapShptwcEaAl35k9K+jf2VolgD9w11FBL445iJZYx18v
	oNdw974aW0ze89X8UkTukMRUuicgy3kbflSyjnWOKVHVDxtfCCFjYiYfDAcNODTjYeJJMoPyK++Yc
	Gxufb78GTaI42DJwDmhdQhbS0VaIhjQV1UdD4CWBXD/a13hvXmTYB2HkXhBZK0eWWkh+XKgUlhjBl
	mXN7J4OvkNYleaa7nVyXv434v0PvAb7Xe13tEGaBuZVCRPwSVcmqqgL4hJ1NqjfhjyPnLG1JGTIJP
	NiE7iNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSebn-0000000G8TR-1mjY;
	Fri, 20 Jun 2025 16:28:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeBx-0000000G50t-1ctf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 16:02:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF4F34A3A9;
	Fri, 20 Jun 2025 16:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B9AC4CEE3;
	Fri, 20 Jun 2025 16:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1750435332;
	bh=hwOS66AkNq303wqYtSJkQ76RAWd8KoMvwvGYKnWmxfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L/gMlsrqDHi7gZtcvoKK+cRorj30vVE/vQq9jaF87QRDGCIrc7NhyK2UNr0OWmNZE
	 AwPVfT89QpXW0fJC7d6g1VmB37aXCXlrhhVVtLbGhdFRRn6YNvPT9WiS0/SJ+T44QG
	 4nEZuRXSVt///a+m3Um5rQxFV/+Hh0kPb/dz0/u0=
Date: Fri, 20 Jun 2025 18:02:10 +0200
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
Message-ID: <2025062006-detergent-spruce-5ae2@gregkh>
References: <20250619200537.260017-1-sean.anderson@linux.dev>
 <20250619200537.260017-2-sean.anderson@linux.dev>
 <2025062004-essay-pecan-d5be@gregkh>
 <8b9662ab-580c-44ea-96ee-b3fe3d4672ff@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b9662ab-580c-44ea-96ee-b3fe3d4672ff@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_090213_445431_4DEA6988 
X-CRM114-Status: GOOD (  21.90  )
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

On Fri, Jun 20, 2025 at 11:37:40AM -0400, Sean Anderson wrote:
> On 6/20/25 01:13, Greg Kroah-Hartman wrote:
> > On Thu, Jun 19, 2025 at 04:05:34PM -0400, Sean Anderson wrote:
> >> Support creating auxiliary devices with the id included as part of the
> >> name. This allows for non-decimal ids, which may be more appropriate for
> >> auxiliary devices created as children of memory-mapped devices. For
> >> example, a name like "xilinx_emac.mac.802c0000" could be achieved by
> >> setting .name to "mac.802c0000" and .id to AUXILIARY_DEVID_NONE.
> > 
> > I don't see the justification for this, sorry.  An id is just an id, it
> > doesn't matter what is is and nothing should be relying on it to be the
> > same across reboots or anywhere else.  The only requirement is that it
> > be unique at this point in time in the system.
> 
> It identifies the device in log messages. Without this you have to read
> sysfs to determine what device is (for example) producing an error.

That's fine, read sysfs :)

> This
> may be inconvenient to do if the error prevents the system from booting.
> This series converts a platform device with a legible ID like
> "802c0000.ethernet" to an auxiliary device, and I believe descriptive
> device names produce a better developer experience.

You can still have 802c0000.ethernet be the prefix of the name, that's
fine.

> This is also shorter and simpler than auto-generated IDs.

Please stick with auto-generated ids, they will work properly here.

thanks,

greg k-h

