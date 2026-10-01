Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B20CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=f+uxIWt13tlRNCSEh7sJuFrgmU
	3AJwBUeFOLWnrzZiVUJ+H3bNFE/eLfuGMXqZTCrz+nz4NZEyUWNYPT4nLkCW05/IqN1pUizMv3DdA
	/ZypjtxkZ6XXZM4+M2JnwD3grKc4Q+6PB8R2bs0TeqYFGiIruXQLoThN+m3JTDdT9yDXRnOM5o7BI
	ixQgpmhPR03fLtRklZVluAanxUX7PXCsrtDnfnInMdHAPBzRMHzxxT0W6De4PWCaGaGcC1wQsjhSx
	8PUDhejjB6Hwmoccnx65Pjdit7HM0f0KyUfi1XniWpjXQuvZghjHcbzZfyzgl0jqFMETiDwVzmOZw
	vNn0BOyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8Tf-00000007jPY-0kYE;
	Thu, 01 Oct 2026 04:33:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8Te-00000007jPN-0PgN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:33:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AB0F60142;
	Thu,  1 Oct 2026 04:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536C71F000FF;
	Thu,  1 Oct 2026 04:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790829181;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bVRCDdf0/1T8kSqaKwEzdCIoYR6HU5BI7iyh2jOl+PXmpwZbt8o9DhW4p24oGXdpN
	 /PTZ+SsBkJPIsIPvDcoTwm9LfB+asS5Hkkq+HJ5ww2TizYYZW3JxVe0CpFBnmZ+N2S
	 A/WPfA1LU5Jq42mqez/7H5iC90o5GKWpWO7nRNhKIMcZDqZw16FfPEEWFd+Gcr2hdX
	 pVNKUqvOSttOHiJkesISfQ47cwgLhzDtaU91wkM1PVkjRdIaFo6iRD8IM3G21heegY
	 jhvxjJh+lFi6qCfHAMo4MfsYy4gZbU8pYYjopnmrvatStYYBV24maw5iXQNStyzunG
	 SNgp3Dt1tfiKQ==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
Date: Thu, 01 Oct 2026 04:32:59 +0000
Message-ID: <179082917987.31693.16306963663623790870@kernel.org>
In-Reply-To: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
References: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
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

