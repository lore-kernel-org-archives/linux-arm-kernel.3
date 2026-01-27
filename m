Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BBFD19511
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 00:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1gRYF6UolZvR7cdwuST1ALZKyS43kSST5J305mAZmbE=; b=TNGYwa+REgleT5T5UDHYNPjyYw
	Jw9x8qiylebbSle+7rYQNaj1QVCxRfr1Y7hTkwJIXEvpGYgrYaWFL7zLtpAu/iVLZGCWY2f7VSrzi
	KyeBpOW6mVOEsUm/oG1IiU0d8vPoi53sIsas4jwphpEI5EpyYn3JoTMwFkf2aQIqKyTD3i3sHjvlk
	NOJKv3Fiqu++dbuX/mceCVZ4VhOcgj2IT7NCGWoBpHffhiWrNn8bxcX+j9cXRUCB15Purdf5kb3BP
	mxzuW8kJjql/LU+y5H+Qknn7O/YRYlIUXYxlopsEkDKsoRys27r/hYHC17t9LjoqKL7bDj73/YvEl
	Mpr20GRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXJ6-0000000DOwT-3HTQ;
	Tue, 27 Jan 2026 00:51:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkXJ4-0000000DOwH-38xA;
	Tue, 27 Jan 2026 00:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DD04A60051;
	Tue, 27 Jan 2026 00:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06CEDC116C6;
	Tue, 27 Jan 2026 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769475105;
	bh=/NtOgl//jXPuJSMTE/EaAvxKGxzbcDqlXUmd33t1b6c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qsrKNcrYztJ49G384fvcqcuUjsyoizPuJYIIv8nnqs0+tAyZTI82WG+jPhamGvMFD
	 DCClxEduYLpvjxsSkukoFdnjjSYF+JfvvcGKVzPPMVYOe6ED/vEI8EWDDZNgqS3lCc
	 JevaEQedSZNfAumwFasF1EJ3Cj2jMn5Ca6DHK0ZX1uLxje0wdXBtRv/VadplsmzohI
	 A3RyZAkFqYh9xQONrcQlzUqtrtWj3Qvm++lhrep9lNGuqa/FubpvPsQr0EDAVMfIVC
	 0XP0thotcb/9vc7XTXqFWC5BMsn4+NGrMMTqzG/ifvfPL3A7ybiafHeMhMQ2eH2NYL
	 17EbLfIjvaRtg==
Date: Mon, 26 Jan 2026 16:51:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Heiko
 Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org, Paolo
 Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 06/22] net: stmmac: rk: add SoC specific
 ->init() method
Message-ID: <20260126165144.25055591@kernel.org>
In-Reply-To: <aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
References: <aXdTi4ViCkhhXvFI@shell.armlinux.org.uk>
	<E1vkL28-00000005usi-30YC@rmk-PC.armlinux.org.uk>
	<aXd7aSk7KIxlQd5z@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 26 Jan 2026 14:34:17 +0000 Russell King (Oracle) wrote:
> On Mon, Jan 26, 2026 at 11:45:28AM +0000, Russell King (Oracle) wrote:
> > Add a SoC specific init method.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>  
> 
> I see the AI review has identified that this patch has an issue, whereas
> in the previous review, it was fine with this patch. I can't imagine what
> it's problem with this patch is

I released the reviews for you, the first one looks legit, I haven't
scanned the rest so YMMV.

> and there's no way to find out for about 9 hours (more like 19 hours
> for me because of the timezone) as the AI reviews are not accessible
> until then.

The patchwork checks are for maintainers. If someone wants to build
a public CI for contributors that'd be great. We can even provide
funds from the netdev foundation. But let us be clear that the current
setup is until now maintained primarily by me for me on the weekends.
Unless you make an effort to actually help I don't think it is in good
taste to complain.

> Makes me wonder whether it's worth continuing to submit patches to
> netdev anymore.

If you choose to continue I'd appreciate if you could follow the common
guidance:
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html

