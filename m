Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322B606A330
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 21:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aklqjWmw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjHSLj6i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHNZsy1AhmzsrhwZyxEBJo+bnbpDcTwMAklGp3PSgbg=; b=aklqjWmwU6Wc1rQfAryGF1E3QS
	J6LGp9HDM0rQDbqKwIeM0tjHVgjk416W9FwKvqEtUa+LcciJajKlh87XqBxCc29uBn0qqrkzWonO+
	yTwe/exm5siXEIO7OBpoOE1tiQG7Ze44h97jL5bu/3vlBAk2/nFto3fxwNtI/6KPZlxp9DYman+0I
	/hDlh9cKHqabFWzrHTkAx4B3Q5ZmoYFvuPMYht+eafti0D1IJEGFqtGZm7kORqpmMBnTUwS2aDXGS
	HlWMqWJcyznnAQ65i4FzLvqoITd/ByainIu2wdWUv0KS/QSfaQozKngzG4Q1XrScbDJJAx5ovht9M
	kfS6UNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJH4m-0000000AfHr-3o8h;
	Tue, 20 Oct 2026 21:08:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJH4l-0000000AfHk-1eGE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 21:08:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AD47F60136;
	Tue, 20 Oct 2026 21:08:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B90921F000CE;
	Tue, 20 Oct 2026 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792530530;
	bh=LHNZsy1AhmzsrhwZyxEBJo+bnbpDcTwMAklGp3PSgbg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=MjHSLj6imdArMWL3vvkO7ju8c//mQbQeY5QXTMPxyT+Z6ghZHyG0SXQr41amV76SZ
	 aGCChnRkuifPNl87J4jDXC+XEhfpf4EXdAdS1LuAVo3yIkPjMwPZdz8UmUX8cAsXXH
	 XCtNspvjoUlRVJ0EaZpzvYr8sZuIoUpH1oLOiwtnRjusbuCb6vIzdtBEmpnAvsuZDk
	 rZ8koiGsJSFWBS5XxRVd9BmDlst3URLlogwzPx0q1besV0QenMGaGRyc3L16dc4Etc
	 hFJOIu3FVDB7xc58fmDLRr1AD9+TgQUzZuYalQ9ozgNlMW0av4O5qpmTbI3DPg58S2
	 hx0G+jRLJ5JAA==
Date: Tue, 20 Oct 2026 14:08:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Paolo
 Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>, Mohd
 Faizal Abdul Rahim <faizal.abdul.rahim@intel.com>, Ong Boon Leong
 <boon.leong.ong@intel.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
 Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 0/2] net: stmmac: Fix XSK crashes on stm32mp2
Message-ID: <20261020140849.12fc79ef@kernel.org>
In-Reply-To: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 13 Oct 2026 10:57:20 +0200 Kurt Kanzenbach wrote:
> while looking at the TBS thingy [1], I've noticed kernel crashes. That
> happens when opening or closing an AF_XDP/ZC socket while parallel Tx
> traffic is going on.

Let's respin this against net-next. The merge window has started,
applying this to net would give us an immediate conflict and pain.
-- 
pw-bot: cr

