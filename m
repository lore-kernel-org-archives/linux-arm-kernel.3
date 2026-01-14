Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E608D37E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 15:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MwXa/ICy6eTNMiYusHqgT+W35ycbQKAPOWz/OHAJ8o=; b=L4p/c1UiwgwDTqvRrW5m5/e5nO
	nhUXV4DUvQB8ZONbL7uGG7ndtNTJ2PoVEVQI5ql9F4cGbtzPw/4IZZCouTQOtRMLkB8fc6XthcO7m
	RZjN5vtO2ZnVjlMtRjoWs6qHKfDfBbya0EsHoQP0ZGqlZtLWAChC0aw/VtaNxw7x70Z13k+qFMTEO
	M5cjfOUIpA4H3ngSN1FX1BpROjRBP7C5DceI2p0jiSdD1SzxZzlptvRLi4GDMxn3U40YbEtpJSpJP
	Wzhk/p29u6Xii/avMiS6f04oXNoiFanccC7tzJF9Lr5Wa+uYfXx1Gzjvzvsnj8YK2YrMAfYavl+pK
	HHPoHNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg38G-00000009mFH-3qrQ;
	Wed, 14 Jan 2026 15:50:04 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg38A-00000009mBA-3JWt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 15:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3MwXa/ICy6eTNMiYusHqgT+W35ycbQKAPOWz/OHAJ8o=; b=v9kfuXaKeDUzwifeWjMppAFgyf
	2AJQxzNG2MXkCroXsG70fr67XXaboxSAKehO40fsM8sUdwoUb3V9zockUzgbFD2Kk6VkbwOyCa6ZJ
	a5CRkdiiG6L9X392sNvyw3dH76jSncsN8RDyiEjo+KLSNblj0Td4zcm1N5Oz6PV3YiS8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vg37q-002oXD-Mc; Wed, 14 Jan 2026 16:49:38 +0100
Date: Wed, 14 Jan 2026 16:49:38 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Marek Vasut <marex@nabladev.com>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Christophe Roullier <christophe.roullier@st.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,PATCH] net: stmmac: stm32: Do not suspend downed
 interface
Message-ID: <3df848c5-eca8-4a57-ab35-004e59d5f719@lunn.ch>
References: <20260114081809.12758-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114081809.12758-1-marex@nabladev.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_074958_826750_B084D718 
X-CRM114-Status: GOOD (  11.49  )
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

On Wed, Jan 14, 2026 at 09:17:54AM +0100, Marek Vasut wrote:
> If an interface is down, the ETHnSTP clock are not running. Suspending
> such an interface will attempt to stop already stopped ETHnSTP clock,
> and produce a warning in the kernel log about this.

>  static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
>  {
> +	struct net_device *ndev = dev_get_drvdata(dwmac->dev);
> +
> +	if (!ndev || !netif_running(ndev))
> +		return 0;
> +
>  	return clk_prepare_enable(dwmac->clk_ethstp);

The commit message might be missing some explanation. The
suspend method enables the clock, not disables it.

	Andrew

