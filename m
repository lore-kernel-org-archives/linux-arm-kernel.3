Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD599D25920
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 03:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBfrT2SYBajWGxIiZs490HqJJkuO5ALmWFlH+nYCxVw=; b=DA9zYfoqtCSNepmTIzBw3XjKSW
	GAgySDEGCLeoW7CLxVj7cy5uIILdFTTIr/DZyEFu7DVddSN/B+mWO69/v4W2cA2YrpCu1vLYpe3fV
	pSebGdHkzDzXd1aTWdWxBdXV/2TVOsly4NlgSCi+mSvbkB2FEB/f8g6jO78NQflr+FVWAhz7Myo54
	v1NSyA6MVYBIkzYTBOtLDNnxvGJV1MYHgKHQBTszOXC548PpZ8UffXbbmWANVA3xZBetCSDKNUhkk
	wybdq1oCr9+cD9yMaROe82rIEDptcvhh63Q5Mkw61w56jLC3OlF/mLZ+3AB1IkdpYUHJHHJQXMUTp
	fBnHOLQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZON-0000000DYHr-03e7;
	Tue, 27 Jan 2026 03:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkZOI-0000000DYH4-2zuw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 03:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3523436A4;
	Tue, 27 Jan 2026 03:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4736C116C6;
	Tue, 27 Jan 2026 03:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769483117;
	bh=0eIazrYKt2H5dVz7aR3WwR1CWkD2A4VVVnLg5inRWCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bsteKB38Vgdxvn6fjaonze1NGEu4h/x6dfnvShLEL5ZXBp6d78jL3+k0oIrPtrL+W
	 JHpww+J6XLaI8onnyqSBQJVjRb12xmCEaS4TMyuDwq6K2tOQz+pRYNQmAR58Kvkxek
	 kKKnilR3gJVsaXrW6PD0/KWxsNcOw1a91QXE8cNlprmiTDGns7cfmc66XiiN/ax1cJ
	 JofwEocyUtpkGH3rPHgThSTr8DSpgIUhh+CgrHJb0JUbKA5oHdKB2XWFdgj/OlnTgA
	 r+98poQyyjsQVifmEX6PEfHp1XmeQNa+NCJQ+shpBhFekKHzv20ZVeVRhh2KGrjnfn
	 S5XJNivEjJjqg==
From: Jakub Kicinski <kuba@kernel.org>
To: lihaoxiang@isrc.iscas.ac.cn
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org,
	sdf@fomichev.me,
	bpf@vger.kernel.org,
	ast@kernel.org,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	john.fastabend@gmail.com,
	mcoquelin.stm32@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	daniel@iogearbox.net,
	linux-stm32@st-md-mailman.stormreply.com,
	boon.leong.ong@intel.com,
	hawk@kernel.org,
	davem@davemloft.net,
	pabeni@redhat.com,
	edumazet@google.com,
	alexandre.torgue@foss.st.com
Subject: Re: fix a potential memory leak in stmmac_xdp_enable_pool()
Date: Mon, 26 Jan 2026 19:04:47 -0800
Message-ID: <20260127030447.3838706-1-kuba@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260125135412.2070798-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260125135412.2070798-1-lihaoxiang@isrc.iscas.ac.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_190519_786019_F6650390 
X-CRM114-Status: GOOD (  13.66  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
fix a potential memory leak in stmmac_xdp_enable_pool()

This patch adds xsk_pool_dma_unmap() to the error path when
stmmac_xsk_wakeup() fails, to release the DMA mapping allocated
earlier by xsk_pool_dma_map().

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> index d7e4db7224b0..7d89d6066ea3 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
> @@ -48,8 +48,10 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
>  		napi_enable(&ch->rxtx_napi);
>
>  		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
> -		if (err)
> +		if (err) {
> +			xsk_pool_dma_unmap(pool, STMMAC_RX_DMA_ATTR);
>  			return err;
> +		}

Is the error cleanup here complete? Looking at stmmac_xdp_enable_pool(),
before this point the code has already executed:

  set_bit(queue, priv->af_xdp_zc_qps);
  stmmac_enable_rx_queue(priv, queue);
  stmmac_enable_tx_queue(priv, queue);
  napi_enable(&ch->rxtx_napi);

When stmmac_xsk_wakeup() fails, the patch unmaps the DMA pool but does not
appear to reverse these other state changes. Comparing with the cleanup
sequence in stmmac_xdp_disable_pool(), should the error path also:

  - call clear_bit(queue, priv->af_xdp_zc_qps)
  - disable the queues and NAPI that were just enabled

The DMA descriptors allocated by stmmac_enable_rx_queue() and
stmmac_enable_tx_queue() would also be leaked on this error path.

>  	}
>
>  	return 0;
-- 
pw-bot: cr

