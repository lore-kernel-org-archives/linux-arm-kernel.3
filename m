Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18FFCA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 12:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=; b=Kn93lVzMcojkD7y6X1wQDNhNp0
	+eHegRZuV0OJRPRGT5MM9cKYOwqv0GRytsXr33XXjKqHKR3dIyGjtG2kOPYA5MNVufYPI7idFvCqL
	zAZ7jiB55/WJV57SQLxcIz4kP+gveBmBN0vdTCeEPlwcN/ONU2rhLYznmulgmZyunnStoL2K3LobF
	BYQSanE7RXIGUGAZUhY829IoTZKAUlyRfceGkYjPIVtrAsf6E0BBBjR9az0HTHep+BGrgk/FuNp/b
	tunry3dL29j4atXrwKQX7SRCFYSK+JrzmQhyXYHrb2PXNgGCaCRVgotxANU6mbcwx/VMLm6buH/qI
	L4O6HmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX2p-00000003Y62-2Mp1;
	Tue, 29 Sep 2026 12:34:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBX2l-00000003Y4k-3S74
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 12:34:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 46A94601FB;
	Tue, 29 Sep 2026 12:34:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484EF1F000FF;
	Tue, 29 Sep 2026 12:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790685287;
	bh=URC7r36kokGjXCV5G6Ei8oKV54JoMbconYpCKkPt2AY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AS9Y8cUU0K5Vh3g/tb3oX7MTDqTBy8lWildZ5ulIRgrK2uzt4t6slaWogKoZ1nEBR
	 A56brpG1ZCYZVk03EJ1BAI9hdQT02YVbgEcZ2ZR0UFf1dCb/odq65Ws+RYPt9RrhsY
	 2LuzKrqBVgUgXYauj3sKhHeidLeF0+7lxpMOBpqK+XOLwDJXqFe0JghYMYDOtxv9EZ
	 +g6U+pUtG9jnGAzhnQ8vzqf9QMsI3Lnd9yAe3zRMNute42N50/2ldxOEIMzL0Rcmj1
	 +bnFPw/RsWzkCQLrAmtT3vcvMNSDrSfmvArrgjiRVf9sRvy449hIhcB9yq/RH4Ppz0
	 aKK8fa//OY/OQ==
From: netdev-bot+sinfo@kernel.org
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: Disable checksum insertion for XDP frame TX
Date: Tue, 29 Sep 2026 12:34:45 +0000
Message-ID: <179068528574.31693.11994088057366518251@kernel.org>
In-Reply-To: <20260929121025.20821-1-jszhang@kernel.org>
References: <20260929121025.20821-1-jszhang@kernel.org>
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

