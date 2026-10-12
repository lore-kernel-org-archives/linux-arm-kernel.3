Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA3C4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 14:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=dm136Wermeu2vfJshL+CFG3DMM
	4vJYwCJk4NG2mRZdflUwAtiLMgcp3+P3UPTIRyKJRWetdhuRCORrbUaTB87BpqO10Q/y8khr031Xw
	QDfXAFT+x6pKYBTSyxNx0da913WO5cm4jM+Xqqo4gnOSNMgA0blStgwlHVdcAAX/09HcPsqfEVfA0
	19R+1XID/L/6bBzo6wX8upSavxLqdqVJTEh3Bl+F5ZyUze/gf+AENw5+dO7wiHsITf1xq0T/PMsTu
	t2s66xWsDFpDnMJOLfPkN1i0D3M9t7jfYAM/U7Yx0ixhs0Q2i4rY5mmGmnWqab8KOiYPseXyUDGbp
	gOVj9ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH35-0000000Agtk-1Pkm;
	Mon, 12 Oct 2026 14:30:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGH33-0000000AgtX-3G9i
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 14:30:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 86372402F7;
	Mon, 12 Oct 2026 14:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFAD1F0089B;
	Mon, 12 Oct 2026 14:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791815441;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HoKb7zEoHyGHsjUhiR5hFFwzxegSpgi1K93zOfhE/JdTyMwZqrwRN7jFmoyQNuYnY
	 Rp47VcI1DhswHuPm5edJ+Ko74/DYSJAUlmbQ2Aref0fiZVETuJGlsbKZR0QQcyEInp
	 rd8pLvV5vuSxu8ObqzAdcehhWnsGL1RZqZuBktOuWCaJlCxOX5KlReyi+Kh//VQ55g
	 wrjW70PmW66Z9+WFbFi3jsUl0enzlx9K5XLbXRWo17z/k41Z4fy1lN3y2CwkawoQvF
	 0KhGSvY6xIIz7lsYMXzA9ZYvPpuuHbrLDiw4/yd0mZDuONyljfeGOhTGiNjf699h8S
	 yh7hR7XwsWFJA==
From: netdev-bot+sinfo@kernel.org
To: Ding Hui <dinghui1111@163.com>
Cc: netdev-bot+sashiko@kernel.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dinghui@lixiang.com, xiasanbo@lixiang.com, yangchen11@lixiang.com,
 liuxuanjun@lixiang.com
Subject: Re: [PATCH net v5] net: stmmac: fix error path cleanup in DMA
 descriptor ring allocation
Date: Mon, 12 Oct 2026 14:30:39 +0000
Message-ID: <179181543993.2527009.12387879434239599818@kernel.org>
In-Reply-To: <20261012142458.2845385-1-dinghui1111@163.com>
References: <20261012142458.2845385-1-dinghui1111@163.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by code inspection). If it was triggered please include
   the symptoms, like the stack trace or error messages.

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

