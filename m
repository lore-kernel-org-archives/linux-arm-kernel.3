Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A7DCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 18:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwR+qaVYQqLnehz8yvAmtBQRj6IOKxDjbyqTslh5Xos=; b=PwaX7/ZWq+Ea8FjxLtPl8s625+
	4TKuz0cCQicvTofYeCu4m3Mhyi4rxU+K6QzmQJE42NsLAEXu9QKHKHUZelghGbXcucbzrsyxcA4br
	BrgY1YxC4gs+K92218GdnVlsSjx15Q6aOTidJ5msvhCJ191ZCnrQtThC3DwSiffYA6IABKf6x9zy7
	U3WElSsRv/7K2fDr9ZFMZQt3jYKD/5EjPE7GWPEZnncHw3bBjpjcE8rMDjB7fyCp18t5H+aUTT+Ei
	FDS/MMUWPPpv/A7wl6Q7FiX82V48rCqZSnMubhWtyL0Lmpkb2yOVc2N5eexDaq5hW0Ni7ppstBuxm
	psw3XTiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiWQ-0000000EGKC-3j4K;
	Wed, 05 Nov 2025 18:46:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGiWM-0000000EGJZ-3tMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 18:46:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC9441946;
	Wed,  5 Nov 2025 18:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C404DC116B1;
	Wed,  5 Nov 2025 18:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762368372;
	bh=/7ve3+tQimCzMR5/qtDRaI5WhPCdOJsQTnRzqLXdSwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=h+P8klHQZq/i1nHmkWblnzc1Yb4JZoInNn+x9o6PpIPgOE0rR2RYzuvy29dJxWRV5
	 nI8yHkl5fgSJHmEMcr+vHfBwITeyD6SFdBcVCWlnk2II0X1MXyqO7mrnry6VDQPmM5
	 s3a5z0KxOxwpUoZQQKdXIwjRtL/x3tUsi/zkwABEEDKzUoHcTED/FAuGp4z/Q89pR7
	 tJdjBN2VGmzHLbJ0s9GixUa2kRe6EQor5r3ekl6GJYO2gOmmL9zbVlCJHrX/sBcnSw
	 jDZGmSGAYGvfz2Ydl5Z2+0WXcYRCpHFsgRPC5YJ+MnHij6/U3p6mR4XIEV73DYqugy
	 BIFbVVmPiNr4w==
Date: Wed, 5 Nov 2025 10:46:10 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: Manish Chopra <manishc@marvell.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Sunil Goutham <sgoutham@marvell.com>, Richard
 Cochran <richardcochran@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Simon Horman <horms@kernel.org>,
 Jacob Keller <jacob.e.keller@intel.com>, Kory Maincent
 <kory.maincent@bootlin.com>, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/7] bnx2x: convert to use ndo_hwtstamp
 callbacks
Message-ID: <20251105104610.726fb780@kernel.org>
In-Reply-To: <f28ee997-ed08-4123-83ab-3496e88ed815@linux.dev>
References: <20251103150952.3538205-1-vadim.fedorenko@linux.dev>
	<20251103150952.3538205-2-vadim.fedorenko@linux.dev>
	<20251104173737.3f655692@kernel.org>
	<f28ee997-ed08-4123-83ab-3496e88ed815@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_104615_110562_086F1378 
X-CRM114-Status: GOOD (  12.65  )
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

On Wed, 5 Nov 2025 13:33:08 +0000 Vadim Fedorenko wrote:
> >>   	bp->hwtstamp_ioctl_called = true;
> >> -	bp->tx_type = config.tx_type;
> >> -	bp->rx_filter = config.rx_filter;
> >> +	bp->tx_type = config->tx_type;
> >> +	bp->rx_filter = config->rx_filter;
> >>   
> >>   	rc = bnx2x_configure_ptp_filters(bp);  
> > 
> > bnx2x_configure_ptp_filters() may return -ERANGE if settings were not applied.
> > This may already be semi-broken but with the get in place we will make
> > it even worse.  
> 
> Ah, you mean in case of -ERANGE we will still have new filter
> configuration set in bp object? It's easy to fix, but it will be
> some kind of change of behavior. If it's acceptable, I'm happy to send 
> v3 of the patchset.>

True, you can probably make the -ERANGE handling a separate patch 
for ultimate clarity.

