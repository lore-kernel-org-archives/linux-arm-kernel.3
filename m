Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB27EC55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BlBBYwRTDRAaiDfmDKu0GwfXvFKTY8AE4ZGeeeheVu4=; b=U3RE5MwCctr8iPpgi4aHSbFdr4
	TEMJ3th7tN8D4Z0NHwzMbJJn+bttr6GWgd6bw6uBk73P/yR/WKQhGJLyoE/Clu+ydny2hOK962OIw
	2He6cBgCWe6Au823dsDop2MMeMcj2Fe1mHjtfyGgDhaSTJw/jSn3lARuWMMYmpFUyv67sDmZKWJ09
	H/HKUzEwZ+R9w1XX2gzx/EhozVLICWfP71Xeu3YxQHqd16AH0avG6tTb4jcJlbSA0xrANRPCSwzB+
	RKBNW2CFc6h0wM6zhdfYBV+4nGitjSX0cL44ED/AGNv9TavmrzgCKSb5OSQk//AV9F7rnhL8JrS3Y
	a6WomuYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQv8-0000000Acnv-140M;
	Thu, 30 Jul 2026 13:35:34 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQv5-0000000Acmi-1Vhr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 13:35:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BlBBYwRTDRAaiDfmDKu0GwfXvFKTY8AE4ZGeeeheVu4=; b=rg9kiSct5RsdD6WKRqypNdkEGp
	KtuI1/9rIQPhGOXgZtqcDiVXyWmAi9A5qqqZl8VRunovPlSSzj9B9K9wZmvRyYqQA/l9fg55o7BVF
	KVCjrYNwP3tXBh0UHymSYZ8gYLTXr3HHXQF+ROdplejQU3NFpa6IXeWxeYp0usCmsX9A=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wpQuj-00F0oL-Ax; Thu, 30 Jul 2026 15:35:09 +0200
Date: Thu, 30 Jul 2026 15:35:09 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Avoid freeing and re-requesting IRQ during
 XDP set prog
Message-ID: <ad3249e5-c607-4516-bf2e-63879e168272@lunn.ch>
References: <20260706-tc956x-stmmac-no_irq_teardown-v1-1-df009d0272bf@riscstar.com>
 <akzLgrzsw4xYmnLH@aspen.lan>
 <9f949b97-da81-4bdc-8be5-68f7883d768c@lunn.ch>
 <amtQjCV6Oi7UI97t@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amtQjCV6Oi7UI97t@aspen.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_063531_423367_10C3D6B1 
X-CRM114-Status: GOOD (  13.40  )
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

> After review I found that moving the disable to stmmac_xdp_release()
> does and removing the call the stmmac_init_chan() gets things most of
> the way there. After these changes every action in stmmac_xdp_release()
> can now be traced by to corresponding restore code in stmmac_xdp_open().

Great, thanks for finding time to look at this.

> It's not fully symmetric because activity in open does not appear in
> reverse order compared to release. However it definitely moves things
> in the right direction ....

We cannot expect stmmac to be fixed all at once, it has too many
issues. Maybe we can ask developers who need to touch some code to
spend a little bit of time to also do some fixup in that area. So we
slowly chip away at the problems.

Thanks
	Andrew

