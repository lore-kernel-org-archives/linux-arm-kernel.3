Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A9FC54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 11:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WvFlw83oU3ardfbEeUhO1Sko4VPKFXB5H/G+vZZef4=; b=oreGrOloEvUABEQ00RD4BC9YqF
	LgHNu37Q5+lRRu9wpNpNTYe+I8BrUHRmN9kRhyIEI9ocmtLu8Pw2p+eY1A2AHYOcJcdCZfMmsVB00
	N68xdeeYzhkkR/NXgt1tp9RM9G2rBbD1F+9h+TXcof6P8yS9DwM0KI09TQTy5wF+wlk8i4iRTkjVe
	pjsagNMag2I2QfGZPbtPRGlTdCYx0vi/WUAm4ib+OqyehuJiaoLaC/l944FLwu4uVLbLQtZUhtCOX
	A6BBXHLAunqlPZgWNjj2ucTVbg/n+SoRBvyOXxClcGK9iNeNtw9qdP4+7ddrfTP1f6f6Yq99Ulb1v
	ADLD4LPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkJj-0000000CIcA-2ajY;
	Fri, 31 Jul 2026 10:18:15 +0000
Received: from mail.kmu-office.ch ([2a02:418:6a02::a2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpkJf-0000000CIax-2AIo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 10:18:14 +0000
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 2A8995C2FCE;
	Fri, 31 Jul 2026 12:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1785493088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8WvFlw83oU3ardfbEeUhO1Sko4VPKFXB5H/G+vZZef4=;
	b=GYwNw3/jgqL5pPBLHw4ZhaBexSS1iEeY5I1u0EYDj2TLnehO1MigECOy3f8gxhtmlGdImw
	zeDsgWuBDH7+gDv3b3yyoZDbwKIu0t+5ZkCtrU0WvgZSNil8Ga20WfJ0qt5AMVC6SRYR2K
	nWL4S+ibCo9l+X1Kvb+/nCQb9rAzXaM=
MIME-Version: 1.0
Date: Fri, 31 Jul 2026 12:18:08 +0200
From: Stefan Agner <stefan@agner.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, Ovidiu Panait
 <ovidiu.panait.rb@renesas.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v2] net: stmmac: resume PHY before hardware setup when
 opening the interface
In-Reply-To: <ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
References: <message-id-of-your-v1-mail>
 <20260707195425.405989-1-stefan@agner.ch>
 <CGME20260707211350eucas1p2c7d585a2f5cdcfdc3f1d9f7bcb1759e1@eucas1p2.samsung.com>
 <ak1rseUKTWFKzBib@AMDC4622.eu.corp.samsungelectronics.net>
Message-ID: <9f7506a99b22293bae3f467f64506627@agner.ch>
X-Sender: stefan@agner.ch
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_031811_843210_D06F9A61 
X-CRM114-Status: GOOD (  15.78  )
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

Hi Jakub,

On 2026-07-07 23:13, Jakub Raczynski wrote:
> Please read
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> in this case 'don’t repost your patches within one 24h period'
> 
> Because:
> - you have two patches now processing and no changes requested yet,
>   nor did you get AI review that is currently employed
>   https://patchwork.kernel.org/project/netdevbpf/patch/20260707195425.405989-1-stefan@agner.ch/
>   and
>   https://patchwork.kernel.org/project/netdevbpf/patch/20260707162146.73823-1-stefan@agner.ch/

Isn't the definition of "repost" the same patch?

I took Andrew Lunn's comment as a change request, hence v2...

> - This change is actually broken - in previous patch rtnl_lock() was asserted
>   by dev_ioctl(), but in this version it is not asserted anywhere and will
>   trigger WARN_ONCE().
> - Full tests within an hour is possible, but no need to rush patches
> - Please spend time reviewing patches, as I spent few minutes to make sure
>   you (or rather Fable AI) is correct that rtnl_lock() was asserted, so my
>   review would be accurate (previous patch was ok, this is not).
> - Please respond yourself to comments, take time to understand codebase.
>   I would prefer not getting copy-paste answer from AI,
>   we have Sashiko review for that.

I am guessing you allude to my response at
https://patchwork.kernel.org/project/netdevbpf/patch/20260707162146.73823-1-stefan@agner.ch/#27051411

Can I influence the prompt for Sashiko? From my point of view the
response was for a specific architectural questions, which needed a
specific prompt to get the answer for. I've clearly declared that I've
used AI to aid for this discussion, is that no allowed?

> - Missing link to previous thread, shown below
> - Moving code to other lines does not justify dropping "Assisted by AI"

Whoops, yeah those two are failure on my part. Sorry about that.

Thanks for your help guiding me through the process! I intend to send
out v3, which at this point looks to be pretty much v2 plus formal fixes
and adding a tested by tag.

--
Stefan

