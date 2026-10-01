Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1BFCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=onVjtqF9pOGYGUZfmhqjbWwlS7
	o8V9RrFP87uzbD12WQ7w7xvzJ0paJb5vX/JyPwHV8vX7k1XRlQDyEEU+avqrg4+bG8ezYhmk1K2MI
	2doVenaG4EJrLNT5DYV+DDoR3urzKTOlgXicTM8CVVd68JLnvcFVoa2jFmvrNnoGeadxgyjrqx/bI
	iiPI9HQXffaxfdYU9CKO8YiYRGZzD+1SHGFWZZTz1B9PO5rps1YbwM5HjjeU148KVtcLEQJOJkkaF
	OM6qfvmYNMFTVCI+VAK9SZkIiKMJTzc3CkibdRxuO9JxGToVJHRyu+4637w1ClGH6Ovaak9kJxoAV
	ZTT1s8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8dJ-00000007kK6-2IN4;
	Thu, 01 Oct 2026 04:43:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8dJ-00000007kJy-00BR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:43:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCA2642A58;
	Thu,  1 Oct 2026 04:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9D71F000FF;
	Thu,  1 Oct 2026 04:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790829780;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m6CibyApBhAxklukMkRmJRcb+rDQ5COKx2k0QaLVZFuQ6FxrZch/teyQgqBUHZwQM
	 yqfQRxqNjCxW+bsi7WBfamGrQ3jJrKv04U7ul5ODigb3btbGf9cU7RfnEyVwDBXzVc
	 6PTaiexJQpUFpRROVnayfxo7zsI6xFlghfW/t6KtMQ+mwB2lRh7BrRCEWlNexNCng7
	 YPsUUQxeBOIjKSYkVqxFXl5svGqgVNHGtShcu0ATTvh/u6M2EXKBBc2t0QDGoeYaQT
	 k4hYx9PUatnkNsYstjzuynltt2rf7N1eInBa48CAFhbNjVLfgvB5y9r8dM+AGTCZ9v
	 91Ol//i0HTV+g==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Marangi <ansuelsmth@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: leave the datapath running for
 normal-size MTU changes
Date: Thu, 01 Oct 2026 04:42:59 +0000
Message-ID: <179082977927.31693.14994198839172125816@kernel.org>
In-Reply-To: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
References: <20260930-stmmac-mtu-fastpath-v1-1-fd73f378c071@gmail.com>
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

