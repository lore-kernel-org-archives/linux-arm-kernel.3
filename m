Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF31DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 16:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hEUjCIgZ671hwuLea+OZ0fUCMqtew4H5KtrTJBE/Lx4=; b=tMJb3Qpx2BXy/p3L04T9WF+puU
	k/51peUCJTfGFf3nKenj0ZcQaiAn3M7xdz54TrjqWvknepsfjkez6ywFQFAwwASMjGxHQAcShrPuz
	BBKem8FiYHyYsduYVVmRUiSJ2YDI2IzvN+7rntb13EfKRM/qBb5OIBf+RZpGai3Ov4tbFQFdceA3q
	CsmvZIlLmdwStuyZkEPHtGi8X0NNnOM+KaxmRb+F8ShdI+qK3/PFoXnU6gJok8Odu1dIFOiGSMzjT
	zBrao9PSpfwfaF4VoJooSyUhcXcZbnYtyw4q5bauHCakG+ojFUv5xuVq6SO16MVppR53VoRnPu9wm
	buBME7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNade-0000000EENC-1Og1;
	Tue, 17 Dec 2024 16:41:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNaXw-0000000ECw4-1S0o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 16:35:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 59EE75C5FE9;
	Tue, 17 Dec 2024 16:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79154C4CED3;
	Tue, 17 Dec 2024 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734453343;
	bh=/dZtUTdnhLYhG2L/43KFiQTEBTs+21tdyBzFD6hhoH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P/HJ9a1xQl8pF07zs+jiCgA6Ufn65F22qQK2hTSdMKozssSiT1/9snJXgjLg6HMg4
	 IWS2JUmyPB0Rq0waxl552ll3jjafAXmFEeXgfUZrT3sdkzDpLfSEMbVNy1F+TVr3e3
	 NqzfanoZS0C8SS9IHKCwlFdJ8w11F+5xfX+tKWhyZRxs6l9rQixJrbU5oEugFTPUHK
	 n90ZUuKrGQLZVs1eqjts+B5w1WY97NEG6hoTf5vL3u4JLLv29nQfQbg+Df/wnKcsg4
	 B8NUl8T6kkv1TSH58s6VgEzaetgMO89x6TTzuKhFwfuGW0S3SCbSuUzE7gaP1XTCev
	 MtYElsT79HriA==
Date: Tue, 17 Dec 2024 16:35:38 +0000
From: Simon Horman <horms@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net v1] net: stmmac: Drop useless code related to ethtool
 rx-copybreak
Message-ID: <20241217163538.GU780307@kernel.org>
References: <20241217091712.383911-1-0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241217091712.383911-1-0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_083544_435714_2202B6CE 
X-CRM114-Status: GOOD (  11.19  )
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

On Tue, Dec 17, 2024 at 05:17:12PM +0800, Furong Xu wrote:
> After commit 2af6106ae949 ("net: stmmac: Introducing support for Page
> Pool"), these code turned to be useless and users of ethtool may get
> confused about the unhandled rx-copybreak parameter.

Hi Furong Xu,

I think it would be useful to explain why the change cited above
renders the copybreak implementation unnecessary.

> 
> This patch mostly reverts
> commit 22ad38381547 ("stmmac: do not perform zero-copy for rx frames")
> 
> Fixes: 2af6106ae949 ("net: stmmac: Introducing support for Page Pool")

Based on your description this feels more like an enhancement
for net-next, without a Fixes tag, than a fix for net.

> Signed-off-by: Furong Xu <0x1207@gmail.com>

...

