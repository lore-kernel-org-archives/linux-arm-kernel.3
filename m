Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F43CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=JLlLPC9C5lwP9GwZOHXBZVMjIQ
	0Pdk2tNWa61k0z/Kq+2uC1TXUUnKKH0hSdWoIzROIuIN0JQyRqyKxtXNF+IlISeIza0KdxIvbkOmP
	IJcyP7JtP4Giz8K3ynllSkDg6k0KgK6Xi2imE5QL3g+VYkcqL7ib8L8EElMFx5eBYVDu6RVRyARHJ
	28IrIcEmdISjQkJHVb48WYnFpHiqqb+K3JXkutuMh+3fswTvecyFdA/0ydmt23BEQRZQ37UAAPbWw
	01gBbWLtFJ3K/csMP0bjpcxUkbSDHSj+k5XXLIfVlmOJ4KGDftSpV9fwC74JoGFc6SWFOSY0ZHT89
	5PEjnZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjI6-0000000E1gz-1O2o;
	Tue, 13 Oct 2026 20:40:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGjI4-0000000E1go-0ZIh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 20:40:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0661601DB;
	Tue, 13 Oct 2026 20:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C421F000FF;
	Tue, 13 Oct 2026 20:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791924001;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fEsHE9UlJiPlgGv9Engklk6RpJzvQTOr4OzD5TzGvSLuJVS/IRRnBQNx/fjrMRaaE
	 KIHuzgnrrTESZJxlGkVyIDS4AsRpFL+eSOCFW6npGwJ4yGzm+li/rpSUY4oA+pOr9K
	 LD71SbrXfhs2SCKGFDPf5qEl1n5vu0i0ykc7i+P2dDL2IANYhwHjErp2X4HEyuXpOe
	 QeL0Bw+qcoEAEjwpLLOY4hUEieJWpjzkOJz2u8oOL464++sMkPMGqQwbPW4z4Gn1zC
	 fdbLk4uqEaAi29loB63nKJDLPGwxBfEmspoYP+SK/O8BW52Qtu+zy/okpN1ph4+RyT
	 jKTm0X/PDas9A==
From: netdev-bot+sinfo@kernel.org
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Stanislav Fomichev <sdf@fomichev.me>, bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: avoid duplicate XSK TX completions
Date: Tue, 13 Oct 2026 20:40:00 +0000
Message-ID: <179192400014.160550.9046457038671470723@kernel.org>
In-Reply-To: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
References: <20261013-submit-stmmac-xsk-tx-completion-v1-v1-1-f21b9d098e62@gmail.com>
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

