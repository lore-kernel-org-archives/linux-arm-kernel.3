Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EEACA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 03:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=V3rDdMtCmGhPptX7pGPil1pjuu
	TQvICtu95yFxOVoMf8MO6wL0MPGpq8MxhbOfsJYykIXR3EVJfZOmBbpf+1FiMkVHaTm8GdW/6MbRW
	auoVzCfi7+3/ufND/BIztZBYu/gHvvCNG4nC/Mt4EAVSnCs1JraohuvEiEZ3k6H+pmC6zVFPO4ATw
	zTkA7tJKYoF61OP6vPxyaqt7bdVYxJMK3hymR3gpp/MXQ8lqIEHHHWltZplqnHAhGVfntR05XYRl0
	IFlIE0r89+H/hlm/jZeUI6ZBmD9FhbR4IGUaL18AG3+CGHI9q5Dnu74YHXnNOl5iWrflk0gxfULWX
	X6smRJqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7wn-00000007hZK-0Rb3;
	Thu, 01 Oct 2026 03:59:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC7wl-00000007hZE-3wyA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 03:59:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A07A4011E;
	Thu,  1 Oct 2026 03:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFD81F000FF;
	Thu,  1 Oct 2026 03:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790827141;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cEmyU4rLlPgOu/LOv7ht4kyOmHnj6koNHbvUWlIJa8gxQQmJggP/S76XXDUYm4Rqo
	 YwEb7oHYl9Lwr54SZfFsJpMdpbKZXulf34zzM10KGLJxYsjJqQ5O6aAg9BcP0CqXoD
	 R98Poq2GJcB+1QzpKJ5pGqPH5ZtohGLdJ4GE/3mZ7Zh9gVd1PfFH6Gb7sdrVan6Qid
	 ckDa33hj+IINCyIdvthEaegaXsq0bGaHaKmksjNm8yJbcIprZWrMLjirFxcvtgVFwp
	 53UnjLW1e/h87lUhzFHuOVvLIVWpGTLkzOFPj2e77Asf2kjsbonOiJKnixw9y00erP
	 fRvs8mA3GeaCw==
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
Subject: Re: [PATCH net v4] net: stmmac: fix error path cleanup in DMA
 descriptor ring allocation
Date: Thu, 01 Oct 2026 03:58:59 +0000
Message-ID: <179082713968.31693.13138874201716710221@kernel.org>
In-Reply-To: <20261001035045.3305816-1-dinghui1111@163.com>
References: <20261001035045.3305816-1-dinghui1111@163.com>
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

