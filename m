Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E25CCA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=kjyp23sSArtKs2rpnVMaKopHlU
	6skgdIXcpg4ZKiU9RghkwDwOu26Qy0CpvLNai48N27ErtNIY5kKxx1uvQvSxwZ4du8pSIZFKX8q/c
	e6gYcpUecUzkzJIPME++vHHlsINyrQJ+6WAbWJrAyfxMKdYe7l0ogg89r7uGnqHJ+ed35CtcuBkh7
	DxkmF8BjsXbbsR1rtAE0KHO5TLJJIdu686Lh63Ol5M9ujQDb1h+JAp+/KHC5KEPxeYzbz8Jb3McxZ
	zBrH+W3D95C7B0CrlxnhrKi6k/EOHjBa5GrrUtNetpeH/c9fMICAW5s7nLCEzOOyX8rPx3K4C3g+B
	DidAUBmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8YX-000000069EG-2G9A;
	Fri, 09 Oct 2026 11:14:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF8YW-000000069E9-12xg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:14:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A497741A7F;
	Fri,  9 Oct 2026 11:14:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4511F00893;
	Fri,  9 Oct 2026 11:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791544467;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NRNfl91KP3x0gvus4SvFnEd1BAZgncEGXyBgEhgAdIcbNK9EH7qMNidPymnK5XrpO
	 u54YHX7ZFRq2zYQDE66bNudyKlwzcVT1twu2/Sl2QqneKx75DSmcSLQen2xzLHmwtG
	 /gHSB7glWHz+A3+oyQmW3jvouKY54Sgj4Brs+95fqNUl5E5aGubgADV/sK0Csyzqk4
	 HLLDWgUDADRkaPTkMyPnhVLPE+ySLdKPhvj/cqY+3rSCfa2CdSxbXjETTiPicGzJFS
	 9XZG2rtdn2uCYz523wm8fzXnKyQIoVKCm68rqEvo70+EtZyMrSPa6lg5oXkM3eG4AB
	 1oblLS1h3qO7w==
From: netdev-bot+sinfo@kernel.org
To: Pengfei Zhang <zhangfeionline@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, zhangpengfei16@xiaomi.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: fix RX coalesce frames counter
Date: Fri, 09 Oct 2026 11:14:26 +0000
Message-ID: <179154446637.2527009.3819979695606095666@kernel.org>
In-Reply-To: <20261009111138.320089-1-zhangfeionline@gmail.com>
References: <20261009111138.320089-1-zhangfeionline@gmail.com>
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

