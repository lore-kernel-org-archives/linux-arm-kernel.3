Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41E1AC28B24
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 21:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogLZAuYeTK3/4DxQxKpS5NhtK0uL51zVQoxAkrY1bR8=; b=UalrBc5hqeZpK6P58Q/Md1HzBZ
	26FQx23tKiCKNBBZ1i2zBfICTjh4yhvmaB/wu/ePol2vizvqj1ZxtglKK6c5R0HI6hzk9EFUClnEv
	8w5XnJlxYFeakDwyn4xYfXMIxJJu0TwtO4nw+Rb1o2l+OuzBFH/Emx2IBp+bYIFsHgYPAyRvRFl6e
	phM5j6D8WvuQYrWFAdI8r6BZ5RaYkLuHr5UvtBZxmnZhj7PvLNFuCWDlbmby/8soPTj+6fQ1omkZZ
	TfbZNhCFBSFKe4X2pNxC1z1349Ff7YZCYqbHS7L3kyS28hMXAwuIt5BVRMLevQMFTe34l8XZiwHPL
	jaKzqAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIzP-0000000CIY8-26OZ;
	Thu, 06 Mar 2025 21:42:47 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqIxl-0000000CINZ-2sJV;
	Thu, 06 Mar 2025 21:41:07 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1741297263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogLZAuYeTK3/4DxQxKpS5NhtK0uL51zVQoxAkrY1bR8=;
	b=mWBugUuD92cKAZA0g1fWhmejy6D+0gx+j1JkJJNyP7AZqdfO+gC1rD6xbKped/eNbIufKf
	rEv8Ou+aL2CUSWmiKN5mrd0No3l4TVFv7UwCMH/pJ8josaFzXztiiuWwGxEWgpeSgNtsbV
	DNAq0m4+EzHbCMT4CUNoysz7LNDrSyFo3RhVtpy5hkP3HskAuDzJFyYXXxEtAe7xKtgBUv
	8bh84TgqT65ytOhqqfTBOfV9CwvMx6A2tZ4V42WlQJst30nkG3pyp3XOWv0pD8u/rhLzS6
	CDE3Ah/+COdJw3ETzBPp3221mqy6DXbuWjdmlTe+/oOO7hqaGbYwBQaSa5TGeA==
Date: Thu, 06 Mar 2025 22:41:03 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Use DELAY_ENABLE macro for RK3328, RK3566/RK3568 and
 RK3588
In-Reply-To: <20250306203858.1677595-1-jonas@kwiboo.se>
References: <20250306203858.1677595-1-jonas@kwiboo.se>
Message-ID: <41bb2c8d963e890768bceb477488250e@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_134105_868396_367A94B7 
X-CRM114-Status: GOOD (  15.00  )
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

Hello Jonas,

On 2025-03-06 21:38, Jonas Karlman wrote:
> Almost all Rockchip GMAC variants use the DELAY_ENABLE macro to help
> enable or disable use of MAC rx/tx delay. However, RK3328, 
> RK3566/RK3568
> and RK3588 GMAC driver does not.
> 
> Use of the DELAY_ENABLE macro help ensure the MAC rx/tx delay is
> disabled, instead of being enabled and using a zero delay, when
> RGMII_ID/RXID/TXID is used.
> 
> RK3328 driver was merged around the same time as when DELAY_ENABLE was
> introduced so it is understandable why it was missed. Both 
> RK3566/RK3568
> and RK3588 support were introduced much later yet they also missed 
> using
> the DELAY_ENABLE macro (so did vendor kernel at that time).
> 
> This series fixes all these cases to unify how GMAC delay feature is
> enabled or disabled across the different GMAC variants.
> 
> Jonas Karlman (3):
>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3328
>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3566/RK3568
>   net: stmmac: dwmac-rk: Use DELAY_ENABLE macro for RK3588
> 
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)

As far as I can tell, the RV1126 GMAC should also be converted to use
the DELAY_ENABLE macro, which the vendor kernel already does. [*]  
Perhaps
that could be performed in new patch 4/4 in this series?

BTW, it would be quite neat to introduce the DELAY_VALUE macro, which
makes the function calls a bit more compact. [*]

[*] 
https://raw.githubusercontent.com/rockchip-linux/kernel/refs/heads/develop-5.10/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c

