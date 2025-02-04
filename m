Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753CEC02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 21:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8qGaRnlJuFuPN0PYNkdSXUI0ZogwqBFiYUJFMRE2sDs=; b=QkB1HyCwex+x6daJ+WqQH0/wS9
	9fPUMUX2x5W920yIwnigOmrbABrf5LlxOsgt/j8Q7TWccVkTCKhQ8pQKKRp9iJ2jEdU5gBjDaXp5U
	GnyPpsTz6qpdKzXPkcveFNGQR9BUPXxch6roxAjgNntzqA4f763Sjg8ymVdLReIFVYUX12YEw4pyM
	alIOktl6f5ZBbfmMR5nP1Uactx1ZL/9CEM0clZZQnKkcrtgbu37Ed4aXQ6e1SWp7WPqFBd4MhFn/V
	3vNxXr05DxBT7eJrZigG5bpx06Fb9VTpoVOypDyyF4UwDXnMJaayOR8QRg/BGZXiyQ/Qjvn1lKVP/
	FS+/I2bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQj8-00000001d8p-2IP9;
	Tue, 04 Feb 2025 21:45:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfQhi-00000001cuo-1rYr;
	Tue, 04 Feb 2025 21:43:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B08F5C6B11;
	Tue,  4 Feb 2025 21:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B43FFC4CEDF;
	Tue,  4 Feb 2025 21:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738705413;
	bh=m8GYnkgYI7fcL9yp4e1ubi28RL805QQPehrMMx73558=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YJS7xBabGSYqT+e5Tz5JlbNObumGlum7hSL+mLqLgR3qw5HYW5Z3XkttuhJwfBh6J
	 IhhRu5bZVyYXzD7T0xBTE84VDeRdDqI1Oz7a0BQ1wTuH59+UU4Xii9DtcGjyaj+5v4
	 NybfB+xPcru05fSXKpX37BRu4mEQXdw8L8Ke/7HH7we34VNp6XsRj7Cz9cxJyqXSon
	 Ao+O5DAHTk5fWHbhLz4yL4GGHxkhhWBH3kvNoIpgNt6vPEyAsAvvATl57jCmU4haZU
	 YKTrTJUsxlbYWntqjW+fkcFsffjRdSIVFrh4iyVB/2CCV7dfU3slZr5/f2dHPcyfIw
	 1GL89ahroikqg==
Date: Tue, 4 Feb 2025 13:43:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiko Stuebner <heiko@sntech.de>, "Russell King
 (Oracle)" <rmk+kernel@armlinux.org.uk>, Steven Price
 <steven.price@arm.com>, Chen-Yu Tsai <wens@csie.org>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH netdev] net: stmmac: dwmac-rk: Provide FIFO sizes for
 DWMAC 1000
Message-ID: <20250204134331.270d5c4e@kernel.org>
In-Reply-To: <20250204161359.3335241-1-wens@kernel.org>
References: <20250204161359.3335241-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_134334_527961_5544D2A9 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
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

On Wed,  5 Feb 2025 00:13:59 +0800 Chen-Yu Tsai wrote:
> Since a fix for stmmac in general has already been sent [1] and a revert
> was also proposed [2], I'll refrain from sending mine.

No, no, please do. You need to _submit_ the revert like a normal patch.
With all the usual details in the commit message.

