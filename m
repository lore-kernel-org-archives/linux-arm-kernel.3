Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8906EFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbyDCSwMYZk7eG5a6jkCN+qhSVul6PYK1pXIvlezugU=; b=rgbQuU7z5KmzAPKTKNZILPFqUq
	0Rzx0IbR/5FQ4ZVCTCcOSheiNTJ2dXB5W5LmgSGj5TG2CzhiD2Y6y8/zO1OSem2Zrol4RvH75vKgu
	bBd9HF0L7KDUSLOBbgzqLDowo1/KTww8cif+EnVAKzFlej7IHoLphiton67PHIrloKDpUxNXTK5YK
	SOP7JF6U942pEd2KLl1ultIbPBOFcixuq+K00xlg02ApT1c/GGMfdjJ1Nk7GExjGxy6iWi1Md9P0W
	uwNhTnibH9whG52hN1IKoxnQHgtXZme838S1zLZ4LD8Xk0/3yaZkKmVlPbqLer82DlOMVTGSFQSnH
	Sa2bw+wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFLK-0000000GFzo-3DvU;
	Tue, 05 May 2026 12:57:43 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFLH-0000000GFyG-3T58
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:57:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DbyDCSwMYZk7eG5a6jkCN+qhSVul6PYK1pXIvlezugU=; b=jRUt0o88F1fXqtAQNU2ekCe6DI
	hDxvl96nLo2h2Ye6E6RXzjPlf+HZ4wiITdGhpkIosRr/UEwJkift30vCD599K8o/RTdpK+6wJcL8w
	O7JJhGnQ4dGLKOj4Xhi3NMf2wdzOZtFXU9YSGM4yssuPDHSoGdbWT01Dd4XLO5kFs30s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wKFL6-001Scf-Lt; Tue, 05 May 2026 14:57:28 +0200
Date: Tue, 5 May 2026 14:57:28 +0200
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
Subject: Re: [PATCH RESEND] net: stmmac: fix RX DMA leak on TX alloc failure
Message-ID: <af3d7a77-048e-4cb8-8980-8462365d2fa9@lunn.ch>
References: <20260505-stmmac-rx-desc-cleanup-v1-1-df85cd095ebc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260505-stmmac-rx-desc-cleanup-v1-1-df85cd095ebc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_055739_864532_AA5DEFD0 
X-CRM114-Status: GOOD (  16.66  )
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

On Tue, May 05, 2026 at 08:23:07AM +0000, Abid Ali via B4 Relay wrote:
> From: Abid Ali <dev.taqnialabs@gmail.com>
> 
> Free RX DMA resources when alloc_dma_tx_desc_resources() fails in
> alloc_dma_desc_resources().
> 
> Signed-off-by: Abid Ali <dev.taqnialabs@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 13d3cac05..8bb843b55 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2370,8 +2370,12 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
>  		return ret;
>  
>  	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
> +	if (ret) {
> +		free_dma_rx_desc_resources(priv, dma_conf);
> +		return ret;
> +	}
>  
> -	return ret;
> +	return 0;

You could keep the return ret, and simplify the code:

	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
	if (ret)
		free_dma_rx_desc_resources(priv, dma_conf);

	return ret;

    Andrew

---
pw-bot: cr

