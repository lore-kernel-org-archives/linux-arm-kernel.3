Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D9CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 20:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=0YH1FLUx0AOx1iSe4xA+5diQem
	93RSv8mxCjiuoghD0GduK88SW847ZoP/APOuKTAyeP0SmRGKdlIVMlffF1BRvmoPXMgGnv1RlCols
	9w1gecQSp5PMLcGA2Njcyfw6sOJgyP6ERYI9F8aREwtEHIYw0b3MO9Nj+fdIoVD+gyYRl673Bpdj8
	PNOnSSe9lKt8wMJYmqhebx1mVml18nEny0456D/aqj4k9WxDUPnXKeuZFggmCIrzTYLThSsOJMnbi
	NWJ7VSt3LguPkLqu5qIA8MF2uQRnk9vGkLvhyZKzB40uW1s+Fnwxv9WdloWSWgR0ILVCuPmvvf4a5
	GvNdLIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT90-0000000FInZ-2LlU;
	Sun, 04 Oct 2026 20:49:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDT8z-0000000FInE-1b8J
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 20:49:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DA9F601F7;
	Sun,  4 Oct 2026 20:49:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE661F000FF;
	Sun,  4 Oct 2026 20:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791146952;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bQPFG1eH8MlS1WdA1PL227LgKW3ijDNeLX4a/hFg3A5tIJBs2R4L2pQmbea3oPOZ9
	 uEDR4AFrQIH2K1vLGYWUh9CJMilLz4E6BfOfSRGJBSKzGh0ai4XccVHtFU6p9/ZPmb
	 zkXGKzgGu6nyO1i3CB0N1mEuKvjeK2c3SZ+afifpbsSmpQNl7s0q4Xolxb9ZbixSaK
	 IrCM3I0AbmC79vbvGNwfeli07npEC5loZOsPRkZqR3AiJaGnd5fZ48u+7ZdggW7ZxL
	 bWZZwWBGsoE/EdM5OcyLiL0gcZNQjTdhO7pOrHjhZQZvDWVeZoWg/F6hqXGvZxN28T
	 +ceI17KlLvYSA==
From: netdev-bot+sinfo@kernel.org
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
 James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: introduce XDP rx multi-buff support
Date: Sun, 04 Oct 2026 20:49:10 +0000
Message-ID: <179114695065.1402591.17659606391395950626@kernel.org>
In-Reply-To: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
References: <20261004-stmmac-rx-mb-v3-0-50fa171af9ec@oss.qualcomm.com>
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

