Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2B5CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4Jky2OwCqDUqRvRq3+TtsxjzZyj4RpGbXfiPseYZ/E=; b=0BIbb/sgaTztL3yK1UD3D8zNX4
	yDPN5gg/azG0BQV+u0FmcfX9UvpWmKL3NODX1/m4vTYuIJ4doDXadIPQNV8ZEPGtacBXPj80C5k7Q
	dyBVd/lc3VNyAysyFmcab/7deL0XQ/DDa68dZppaKrJf87BOgL8u5EAJUjjLcgXHd5aKMw8wq2HpI
	7brTdrOy1O3D6P08dxPAuHfLIQb/Je/AFeWw9IFnGCi33IQfsC4ytVYyhdf7leBJZnZpiGK7VlDax
	69u1Ia6w5ED4tXcrWUpZC6GCDHUuo9VXutc5PUJiRq9YEdjQUH1lTp78mUqF2mAo+hI5L6YgSHqSe
	W+w2fJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8OO-00000008pHz-0uU8;
	Thu, 21 May 2026 18:45:12 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8OL-00000008pH7-2N8u
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 18:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=L4Jky2OwCqDUqRvRq3+TtsxjzZyj4RpGbXfiPseYZ/E=; b=eIi62TrtPwYQcUULc7kqfNFt+q
	AAcv2p0aeF2I4iBzc/MVRzSkgeQqKn+jVrIH59Pc3pj8gS1xkqKjXx9mtRp7o7FaD0lwE3NjsaVmp
	3IRfHEDX0JLHIedipEVqyivVKBcQmab/tHfM9M/vNOMOM4LEpN8Pmm4STOsn4kLJbqBQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wQ8O5-0044cj-QY; Thu, 21 May 2026 20:44:53 +0200
Date: Thu, 21 May 2026 20:44:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: dev.taqnialabs@gmail.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] net: stmmac: mmc: Remove duplicate mmc_rx crc
Message-ID: <2d702678-5b2b-451e-b692-228efcbbefc4@lunn.ch>
References: <20260521-xgmac-mmc_rx_crc-cleanup-v2-1-7d9de09f5898@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521-xgmac-mmc_rx_crc-cleanup-v2-1-7d9de09f5898@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_114509_610956_C8EA169F 
X-CRM114-Status: UNSURE (   9.75  )
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

On Thu, May 21, 2026 at 04:32:46PM +0000, Abid Ali via B4 Relay wrote:
> From: Abid Ali <dev.taqnialabs@gmail.com>
> 
> MMC_XGMAC_RX_CRC_ERR is clear-on-read, and just a single read would
> update the mmc_rx_crc_error counter.
> 
> [1] commit b6cdf09 ("net: stmmac: xgmac: Implement MMC counters").
> The duplicate read appears to have been unintentionally introduced in
> the intial MMC counter implementation. The databook does not mention
> MMC_XGMAC_RX_CRC_ERR needing the additional read.

Thanks for the updated commit message.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

