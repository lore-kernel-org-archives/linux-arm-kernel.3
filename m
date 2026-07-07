Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDABEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 18:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ct1RYm16x3GFzu4FMGkc7eTBInRFcY8Ty+VPr5iXQDg=; b=enqNmSJ4ozb7msNiID6pmutpUH
	C7i+yOnAeIfVzL9KCyFiwnhD2UWaAhvaGqGYh5Of9OErBKGSjK7AA8pjtRL1koDbbbrShFPM7WkSg
	3IOCd3ZXUQ3QXzDYwgA2jsa/sMOhWJ/oL8LVlF7RPk+DIBkvBrUb9Pmszu60tG5+fpb2EC9UAG3AR
	ZctDPxMzgEXUVYSjDDojT2Hn62EsnkmsOqp6Gwinb0n8fT2TLYLUvDxhRRjWAz85BGL2ckABdlKiK
	GIqzRzdwk07Ap7XNvVpfx/Gu5h8ub1DaEyE1TSqwU87cjnBetTj8Ztqpx3WSWl82a2pDEZS2voywU
	9xvDWdAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAzE-0000000FfbG-3NTo;
	Tue, 07 Jul 2026 18:57:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whAzD-0000000FfaS-1mt5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 18:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ct1RYm16x3GFzu4FMGkc7eTBInRFcY8Ty+VPr5iXQDg=; b=tbPJZbO2+zUHCABOu6WpC9n2UX
	ApKquvPNPi+iTfI9xQUwt3a7HVpJUahC+fmqFDKiAAu7/RqX7VSiPe+7ikL1S21NFsfuh328vAtgK
	8fKPtjvBCnTULNOFDdD3758vwMIM+cdyfwUF7MoVlDipJHktpUez/ijS2s39YIJCYAuE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whAz2-00BDI8-Rq; Tue, 07 Jul 2026 20:57:28 +0200
Date: Tue, 7 Jul 2026 20:57:28 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakub Raczynski <j.raczynski@samsung.com>
Cc: netdev@vger.kernel.org, k.tegowski@samsung.com,
	k.domagalski@samsung.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] net/stmmac: Protect against zero queue DTS config
Message-ID: <d4fb7a9f-c0bb-4ced-8428-14bd2aa66d85@lunn.ch>
References: <20260707174431.1264520-1-j.raczynski@samsung.com>
 <CGME20260707174438eucas1p132b5c02ceed2493cc7de98ab28c390ee@eucas1p1.samsung.com>
 <20260707174431.1264520-2-j.raczynski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707174431.1264520-2-j.raczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_115739_470142_FF97F598 
X-CRM114-Status: GOOD (  12.02  )
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

On Tue, Jul 07, 2026 at 07:44:30PM +0200, Jakub Raczynski wrote:
> Commit 8a7bca6de6de protected against inputing number of tx/rx_queues_to_use
> over kernel supported limit in DTS config. AI review mentioned that we also
> should protect against zero queue input, because this would cause issues
> down the line. Missing config is not an issue as stmmac_plat_dat_alloc()
> does apply '1' by default.
> 
> Fix this by adding check for zero queues input during DTS parsing
> 
> Fixes: 8a7bca6de6de ("net/stmmac: Apply MTL_MAX queue limit if config missing")

I'm not sure a Fixes: is justified here. Does this bother somebody? As
far as i understand, for this to actually do something the system is
broken anyway?

>  	if (!of_property_read_u32(rx_node, "snps,rx-queues-to-use", &value)) {
>  		if (value > MTL_MAX_RX_QUEUES)
>  			value = MTL_MAX_RX_QUEUES;
> +		else if (value == 0)
> +			value = 1;

If the DT is broken, don't we want it to be fixed? -EINVAL would make
it obvious.

    Andrew

---
pw-bot: cr


