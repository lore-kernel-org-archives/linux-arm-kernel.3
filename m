Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E94AD0BB62
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcZcoNtK17StNbJld4FBjf5TfS0y1pDALpIecO6pJw8=; b=Q2A9PshqwBMH6Ny8cQzfWjiLtv
	mlULLjxSIhq6VHHOzimmCoWrb40T/R41j+ZHN4stJvkkiAO6ua/4yusHFZE/+hAi4lJqdUc4p3gvb
	rF4w1mmXvqALodRrUQT+Vzre9vYRAAxETQdqJZkSeT7CUVm1q6FffabbEE3g9GLQhmmLc2kDLfpq4
	YgPWXAyLQ0KuRiHlbYTNtn3Y4j+EU8Xbw19e/zz1KPSxYYDkWw8Xt0upBsE/jbSeMKARwNgjIFKYL
	j4Re6vnjOuSU8sHS1sEBUBJmBxTs9A2qTz7YYz71g2fzLzRY3OxOFHee1oh/tyBL1Pljb7sEdlfJF
	oc3+VeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44Jj-00000001iV8-06VG;
	Thu, 24 Oct 2024 20:20:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43w0-00000001ewI-1Qrp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 19:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LcZcoNtK17StNbJld4FBjf5TfS0y1pDALpIecO6pJw8=; b=cpYHN+kpLCNRDo+Jsqh9hkvNri
	8hDvwYHii0T3iIftrtFDnHnSDy54Pphqvp+HPbE+SnF64EHrYfqtUzbdrxnmO4EyI8dU+U9dMacP0
	U9T783tBIEqf//Ri/hBWLECap/87eyFAXO94zckngbICbvyz21ovY4ZyU4+5k9Ifby+o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t43vm-00BAiO-7O; Thu, 24 Oct 2024 21:55:38 +0200
Date: Thu, 24 Oct 2024 21:55:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Meghana Malladi <m-malladi@ti.com>
Cc: vigneshr@ti.com, horms@kernel.org, jan.kiszka@siemens.com,
	diogo.ivo@siemens.com, pabeni@redhat.com, kuba@kernel.org,
	edumazet@google.com, davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, vadim.fedorenko@linux.dev,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com, Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net v2] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <1a0a632e-0b3c-4192-8d00-51d23c15c97e@lunn.ch>
References: <20241024113140.973928-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024113140.973928-1-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_125552_403591_E9C3EDD8 
X-CRM114-Status: UNSURE (   5.96  )
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

> +static inline u64 icssg_readq(const void __iomem *addr)
> +{
> +	return readl(addr) + ((u64)readl(addr + 4) << 32);
> +}
> +
> +static inline void icssg_writeq(u64 val, void __iomem *addr)
> +{
> +	writel(lower_32_bits(val), addr);
> +	writel(upper_32_bits(val), addr + 4);
> +}

Could readq() and writeq() be used, rather than your own helpers?

	Andrew


