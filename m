Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6CAC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6QKIoIF78733xmLtZYky9/b3OtzSnKgxpQ3EdY+9IE=; b=yfmsyD7SYIlKuw+cZdNDksMKEg
	IIkfcQiE3FhrqcVSFKH2b8QTmJQ9DbuPQXPmcMbO6dpneF4sGDTPbQKViNi01kKUv/SkPg3bHOoAm
	+Zdq/IJpUqSkwRTWQGP/ArUN0Kl/y997m48uFq2ly4z1nl/hIPxsMbZnCHHknjOrRVRqYyDRb8mcX
	fxGOEfpK3Ndgr3OfbPkBZBewSJxeUfGUcWbrwE4ax4PIbAdBi/9TQU78KLezLfiunkL9fhAou6FJq
	ZD2zQO3caFchsZqS8YESQkOFZVPESDWK/g5i2pyw0AXnRL98D/1Fqqgo4T9iRDtn7VseAPLYKgGqL
	5hyaMpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuJB-0000000FCaB-16wc;
	Mon, 03 Feb 2025 11:08:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teuCt-0000000FBZk-0SuC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 11:01:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B88211FB;
	Mon,  3 Feb 2025 03:01:58 -0800 (PST)
Received: from [10.1.34.25] (e122027.cambridge.arm.com [10.1.34.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 973B43F5A1;
	Mon,  3 Feb 2025 03:01:30 -0800 (PST)
Message-ID: <811ea27c-c1c3-454a-b3d9-fa4cd6d57e44@arm.com>
Date: Mon, 3 Feb 2025 11:01:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: stmmac: Allow zero for [tr]x_fifo_size
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Jose Abreu <joabreu@synopsys.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 netdev@vger.kernel.org, Furong Xu <0x1207@gmail.com>,
 Petr Tesarik <petr@tesarici.cz>, Serge Semin <fancer.lancer@gmail.com>,
 Yanteng Si <si.yanteng@linux.dev>, Xi Ruoyao <xry111@xry111.site>
References: <20250203093419.25804-1-steven.price@arm.com>
 <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <Z6CckJtOo-vMrGWy@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_030135_240928_E3D2C64C 
X-CRM114-Status: GOOD (  33.51  )
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

[Moved Kunihiko to the To: line]

On 03/02/2025 10:38, Russell King (Oracle) wrote:
> On Mon, Feb 03, 2025 at 09:34:18AM +0000, Steven Price wrote:
>> Commit 8865d22656b4 ("net: stmmac: Specify hardware capability value
>> when FIFO size isn't specified") modified the behaviour to bail out if
>> both the FIFO size and the hardware capability were both set to zero.
>> However devices where has_gmac4 and has_xgmac are both false don't use
>> the fifo size and that commit breaks platforms for which these values
>> were zero.
>>
>> Only warn and error out when (has_gmac4 || has_xgmac) where the values
>> are used and zero would cause problems, otherwise continue with the zero
>> values.
>>
>> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
>> Tested-by: Xi Ruoyao <xry111@xry111.site>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> I'm still of the opinion that the original patch set was wrong, and
> I was thinking at the time that it should _not_ have been submitted
> for the "net" tree (it wasn't fixing a bug afaics, and was a risky
> change.)
> 
> Yes, we had multiple places where we have code like:
> 
>         int rxfifosz = priv->plat->rx_fifo_size;
>         int txfifosz = priv->plat->tx_fifo_size;
> 
>         if (rxfifosz == 0)
>                 rxfifosz = priv->dma_cap.rx_fifo_size;
>         if (txfifosz == 0)
>                 txfifosz = priv->dma_cap.tx_fifo_size;
> 
>         /* Split up the shared Tx/Rx FIFO memory on DW QoS Eth and DW XGMAC */
>         if (priv->plat->has_gmac4 || priv->plat->has_xgmac) {
>                 rxfifosz /= rx_channels_count;
>                 txfifosz /= tx_channels_count;
>         }
> 
> and this is passed to stmmac_dma_rx_mode() and stmmac_dma_tx_mode().
> 
> We also have it in the stmmac_change_mtu() path for the transmit side,
> which ensures that the MTU value is not larger than the transmit FIFO
> size (which is going to fail as it's always done before or after the
> original patch set, and whether or not your patch is applied.)
> 
> Now, as for the stmmac_dma_[tr]x_mode(), these are method functions
> calling into the DMA code. dwmac4, dwmac1000, dwxgmac2, dwmac100 and
> sun8i implement methods for this.
> 
> Of these, dwmac4, dwxgmac2 makes use of the value passed into
> stmmac_dma_[tr]x_mode() - both of which initialise dma.[tr]x_fifo_size.
> dwmac1000, dwmac100 and sun8i do not make use of it.
> 
> So, going back to the original patch series, I still question the value
> of the changes there - and with your patch, it makes their value even
> less because the justification seemed to be to ensure that
> priv->plat->[tr]x_fifo_size contained a sensible value. With your patch
> we're going back to a situation where we allow these to effectively be
> "unset" or zero.
> 
> I'll ask the question straight out - with your patch applied, what is
> the value of the original four patch series that caused the breakage?
> 

I've no opinion whether the original series "had value" - I'm just 
trying to fix the breakage that entailed. My first attempt at a patch 
was indeed a (partial) revert, but Andrew was keen to find a better 
solution[1].

I'd prefer we don't delay getting a fix merged arguing about the finer 
details on this. Obviously once a fix is merged the code can be
improved at leisure. If you want to propose a straight revert then
by all means send the patch and I'll post a Tested-By.

Steve

[1] https://lore.kernel.org/all/fc08926d-b9af-428f-8811-4bfe08acc5b7@lunn.ch/

