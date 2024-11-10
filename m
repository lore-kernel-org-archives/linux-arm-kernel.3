Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E14D5E38D
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 13:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1yjcfDB8RD8pTvTFx0v0Scf0T6VPUgPY4TspJJvJns=; b=C0TysB6OWSZvmkT/yS0D3Cc37/
	zhpE2JthDlr4Iujs2SwGpIAe5gVQ6EdGaR4urN9DEQuYAO36ID3PFBk+V4mx6+yOIIuHbCbF4Q4I2
	D7t5qxMyI8k2SwcD2zhkAGHb25LvaikFRfuNOFwSqr+9pPiLOue1zxEOQBOWQSyWuYmVUTQ7DgaYS
	mmsZSkeom0Rd4K+fiHs0leYgwYiUM3AHIWJawO7kTLqg1Xab4fOqMnAKZENtth9HaqjMnK0EY2I00
	bQt0S+6dM6pQGbzRKJMC1d/S6o0oZGV5/0f9+DEKst2tBCSUzwWAQkznRLEyzyg5ndCXRg/UiBnuU
	IlyDajUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA8BY-0000000Evdv-1Pa3;
	Sun, 10 Nov 2024 13:41:00 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA86j-0000000EvAH-1zO1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 13:36:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C7C1A4033D;
	Sun, 10 Nov 2024 13:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204EDC4CECD;
	Sun, 10 Nov 2024 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731245760;
	bh=/lKfQUd/rjWnE2W48MI2heX3riS1KAnteGBZEmZPoQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UC94Dyjg+IUAL3oeqr88LpjjvFA+XqMTD9MlOqinxd9xDIRQAd/FEYOXDjWylPI9N
	 FTjEyPu5Xhk9m2oQqaukG/9OyD/zxyQbq89FPyXmWeUBdeUkfQEBncVtC1naDrwFZ2
	 Ksbrf1MqVNUwLNLeO76zKcofTmeJ4uJ1KJbHkT3Kve5/4nI0KIRFsF2spcAJQ10UsS
	 VG8TYVyM3GgdiB7QJ4hIltVa05dLpSkZ2z3f4GbwtYr+tJIAHv5w4zP5c33hCNVb9v
	 kCB3mIN/idQAgjB6BZJjrPkl9b5oSTOkgzvdHt2d2eJGv9HFy2gW/l4GmlHImLcaHL
	 2yfK9c0/XQ38A==
Date: Sun, 10 Nov 2024 13:35:54 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac4: Receive Watchdog
 Timeout is not in abnormal interrupt summary
Message-ID: <20241110133554.GQ4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-4-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-4-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_053601_609533_4E808638 
X-CRM114-Status: UNSURE (   7.58  )
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

On Thu, Nov 07, 2024 at 02:36:36PM +0800, Ley Foon Tan wrote:
> The Receive Watchdog Timeout (RWT, bit[9]) is not part of Abnormal
> Interrupt Summary (AIS). Move the RWT handling out of the AIS
> condition statement.
> 
> >From databook, the AIS is the logical OR of the following interrupt bits:
> 
> - Bit 1: Transmit Process Stopped
> - Bit 7: Receive Buffer Unavailable
> - Bit 8: Receive Process Stopped
> - Bit 10: Early Transmit Interrupt
> - Bit 12: Fatal Bus Error
> - Bit 13: Context Descriptor Error
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>


