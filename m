Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CD1CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=0jNJm6CvVJ7RCfjo0tvYrAy4sg
	e6yemT5HoPJ0Wh59b8imIoh5O4ykfy5bvGy+PwBfDyLOPHa5DXP4DKy1Z4SD1mDGG07xKjzP0ATVk
	Qqks5WwNrbJYzSJNahTCiGCtR5LhZVup8rqxyzMzFCi6S2V3M/oVk0KADU9SirEMgppSkP/yaDj8S
	7ZC6YvdJmC2xfY0rSzh04Q5ok5dIv62NGCs3AxQFbn1KYgOH5E3HZt75PbdX57qyVivFzUwuOSJBT
	cbSOxetTV3OS7W3AWQjb8y4DMnR6zpI7z50RBLbasmUrAsaB3YqbroO+IN0ZdaQNwUL35FeZmYuuC
	RvROZElw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdn-00000000Zr8-025s;
	Mon, 28 Sep 2026 12:39:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdl-00000000ZqM-2lxI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:39:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 89B16600D1;
	Mon, 28 Sep 2026 12:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82D541F000FF;
	Mon, 28 Sep 2026 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790599168;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nWyYoASU1sR937AvQP2vKlYXcdY/HMVhvCPKSNXzbJ9R+ENQAl0ADFM9iQpWZWdTd
	 mtWMHKt5Mji2LwgpCOsdUaDZqKkAKz1VRepjfZrS/HbXIhG7ZHLgCrH2ZBB/fyMJCu
	 DhJIBuyiN2l8p/HoOfoJdK1Jf7IIhPdqqrA/bJBTk9P1e03saWcf9x3+LQ1tdjDDlC
	 WU11Mc3rkQySmCZi3/oPYgvHL2jEoAgLQpJuWzhe9v+xhyZLbfCqAUB7idLUMT67cT
	 i2Fp9j8gtLgNaZ13oiPHu5WxQVy7/ludkHPDp0CfdnjQhKUnS+ZC27DyHz2lQyGmRc
	 th3RJguq4frVw==
From: netdev-bot+sinfo@kernel.org
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Linkui Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net v4] net: stmmac: do not keep the new TSO MSS cached on
 mapping failures
Date: Mon, 28 Sep 2026 12:39:27 +0000
Message-ID: <179059916708.31693.15841769312205825846@kernel.org>
In-Reply-To: <20260928123422.1698785-1-xiaolinkui@126.com>
References: <20260928123422.1698785-1-xiaolinkui@126.com>
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

