Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D71FCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 04:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=nHaIG6GS9rVvDFnTwnkooNY3Ej
	Q3HMcLvjmFq+5VG6f9MD92GHLXVh0Ryno/OgaGPeXqjv4VRGARBjHYOBIQimBGQ/lF7DRME//BJAV
	26+NVC8wQ4WDs17Exdx3/RVaollsUOsUqpkUT9Nxy/GpcnrEeVjFKEjfXNegzxHGwZqIsdoung40v
	BCriKaU4pc0RKC0P+W8B1Fsd4hZr4aD7bi04tO3jaF7rJWkjLwAiiCiaH26CrJFhtc7z/ZJv8P4nh
	dK5c+y0E7iV568AclkbH6XdXlvQ/0RTpXBRwE0VXxbNA1DHsPjNKFTJGkznMnSPvHrewLJ0f7FzZX
	D2uYINUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8ss-00000007mZE-3fIh;
	Thu, 01 Oct 2026 04:59:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC8sr-00000007mZ8-0CCl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 04:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 890D040447;
	Thu,  1 Oct 2026 04:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9A9D1F000FF;
	Thu,  1 Oct 2026 04:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790830744;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EzTwqSji3ot+XrUWfJ/UxMnJYTJo8eYKk5SD/NQnoybXyFvDMjaeqyWZ4m9pwtmg7
	 QIX7KToA8P8hHgpeIzzwRNHwINfC9l4Cidpt1Hi7zCfHJwkT4hSi9ZSWxvUVXdZXyp
	 n4F9+0IeMzcDFJ9FM5+HJDEi/oWkkwvdvLYhbKq3NH2Msf/qNMzGugMAr334OJz+ui
	 tRaQtMBGQz1biqN9kzF+eYMsq0YZ0DkqgwkzCKt6NhOdtlLEdiwKNAyA36wYeCsvPN
	 f9gYuzSDLaRnLGLVNnvgs9lLMN3akstmKt6bF0B+ItLfo/iS8XOFaHQvJSXc87mcFa
	 8DEnjlIP1AjZA==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: take ownership of saved RX state at poll entry
Date: Thu, 01 Oct 2026 04:59:03 +0000
Message-ID: <179083074323.31693.13810000342248985832@kernel.org>
In-Reply-To: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com>
References: <20260930-stmmac-rx-state-v1-1-c286c43813c1@gmail.com>
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

