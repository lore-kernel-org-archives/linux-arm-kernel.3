Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0242EA4FD7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1QK+XTI72jPh2y/0D4GbqXzfXEd9VJ42J/eWjmHkRs=; b=ARPpzTHAr+4izUozp9vc4rd3aX
	z4YNkChXeqFVa9Na6rs0mT2ZJ1uKlvtIzYDqG7O9L7jOYpHnNGK/MnKdx+L3XIi7/+d5kxe5i5kMB
	CczCUPEmDYbgCLUt6lky+UicJPoa7f1gKi5V0CFH9h00rsTQ7iqjPwl+tlgr14xXmVfl+SmJaD1E4
	jeX8cgpZzB8WyZf9zqscgiQbfNc4KSXxLD+OtDguGKbt7LeqiKMwsXiKO9kPpAFEXyOc4rfL9Gr3g
	XWLTJTHPzONOhFPplPA7MhIeTKk4mCuJ96dO7IMKQZ6MJILHr+D38JXrbnv05idB6QjtueUYJ2UPl
	+mlWFLng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoi9-00000001kgp-43j5;
	Tue, 24 Feb 2026 09:28:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoi8-00000001kgT-11t3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 09:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C0D86091C;
	Tue, 24 Feb 2026 09:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDE2C116D0;
	Tue, 24 Feb 2026 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771925287;
	bh=UjV+lVT62XoKCNm3uXANF9IwXBOBlVqxQ2pDtUbIBXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUZpqHl9KOq3NztIgVFQnBX5c8PRe87hioP2HSuqHpab1UHLsBZ1svI4vteAQLBs7
	 OLLP0B1MFP/TXSaItgMk2liCMMbrwVVrCe+rnHoxFAEUmwjVdmFQDavW+rwWOqJ6wT
	 7pDiHJ5lAQmlfqabozb2hCqOok6MNK0d4i2zEO/Bu11+ZHQITQfh5m1iXI/D5QprT8
	 /NIQxW8w1xhBkngwn/+JQoxH43uRqFerkMTn1IqsD6LCH32ro2/JEbLk2R+8O+K3Lw
	 ENg9Hux853QsTM7B6D/Kuz1Ct7LNCm+u4eznPQk+7+1lWUHYhmYn8qwwgBlHh3MKGp
	 NbzsPIp6HJN3Q==
Date: Tue, 24 Feb 2026 09:28:02 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next] net: stmmac: fix timestamping configuration
 after suspend/resume
Message-ID: <aZ1vImgrq1yxBIyy@horms.kernel.org>
References: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vuUu4-0000000Afea-0j9B@rmk-PC.armlinux.org.uk>
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

On Mon, Feb 23, 2026 at 12:19:08PM +0000, Russell King (Oracle) wrote:
> When stmmac_init_timestamping() is called, it clears the receive and
> transmit path booleans that allow timestamps to be read. These are
> never re-initialised until after userspace requests timestamping
> features to be enabled.
> 
> However, our copy of the timestamp configuration is not cleared, which
> means we return the old configuration to userspace when requested.
> This is inconsistent. Fix this by clearing the timestamp configuration.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> 
> I'm in two minds whether this should go via net or net-next - no one
> has noticed that getting the timestamp configuration after resume
> doesn't reflect the hardware state. Here's the commit that introduced
> the problem:
> 
> Fixes: d6228b7cdd6e ("net: stmmac: implement the SIOCGHWTSTAMP ioctl")

My feeling is that the bar is not if someone noticed or not.
So I would lean towards a fix for net in this case.

Regardless, feel free to include:

Reviewed-by: Simon Horman <horms@kernel.org>

