Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5057EC982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNYlyICHDiAtyzbtSm0WmmoGzJl3BdJ+V4spo9bThFU=; b=LtrYINBqwKzJ4iCy7mQWfv6fcg
	zc5HtNmnQwKhtlN5qFHdBvkVfq/KoSqA4AoTZi/otBVQNBwlSKn2mIHeDkm/F4X3Q3mLwxEZdnIz6
	KXjxqk4AcMeyFshAOv66sSCCc1B7De6kkG/0zgf/2gHwsoa7OM1miGunhEruzb1TImK9PQvKozxoP
	lk/buJC5SMbfwNixasne9+eqaNah89AmjKDOc+cs8Fr95sq1lf/GM29mzZM4AWOcWhL/AWJLBz+8t
	mMGN98TxywrazcwDjkg/lu+2jgc07ueBV7TEICgWrUvEf+ALMpTZ4gMlxvRrjprf8s/io4UJDVGQ3
	ihDW+9bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xf6-0000000EMJf-3enO;
	Fri, 18 Sep 2026 12:25:52 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xf0-0000000EMHt-44WD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:25:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 06695A0350;
	Fri, 18 Sep 2026 14:25:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789734335; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QNYlyICHDiAtyzbtSm0WmmoGzJl3BdJ+V4spo9bThFU=;
	b=e9Fyd26yQqmSW8ysRa3AoKtnYuq3pFrXjn7p/7K2qYMpUHkXi5USPm4YZVNPkSf8VLfe+w
	YOd+n9cN3EKDLom5BLPVHdMt5AwlWd0eYhYe1lePleDHFisV0A1BVrwAdmrH/3JarZhdb3
	hyyeia5Ds8EItRyit+65PTkgFDsKtKC+EchfhZIwPiAk+/DwX+L9/93/Gc+dkPnOvPjG5B
	vpe8QW/udvQ0D2yk4ImyFMVxrdooiCSkI5BAFTNEeIoRuv3Tnuftf4OaaEUXVVnUouyOXD
	A6V2YXpwAYdHoq8nQKPEEyyFqcPNO8x0MI2mJ3UpoLEm6r/92aP1d+MMvfXSGQ==
MIME-Version: 1.0
Date: Fri, 18 Sep 2026 14:25:16 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v4 5/7] net: stmmac: dwmac4: Use the correct bufzise
 when the len is exactly 8K
In-Reply-To: <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-1-maxime.chevallier@bootlin.com>
 <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
Message-ID: <4b3c26c482ac1d26f39b53fea072e4d1@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_052549_362871_D1D6A3AE 
X-CRM114-Status: GOOD (  18.80  )
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

Hi Maxime

On 17.9.2026 23:53, Maxime Chevallier wrote:
> DMA bufsize selection isn't made on the MTU but the actual frame 
> length,
> so including the L2 header. On DWMAC4, if the len is exactly 
> BUF_SIZE_8KiB,
> the next larger size is incorrectly selected.
> 
> Lets fix the comparison and while at it, rename the parameter from len
> to mtu.

Isn't it "[...] from mtu to len"?

> 
> Fixes: c3efed5ad1b0 ("net: stmmac: Enable dwmac4 jumbo frame more than 
> 8KiB").
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/hwif.h         | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/ring_mode.c    | 4 ++--
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c 
> b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 2994df41ec2c..c6a8f8d73501 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -474,11 +474,11 @@ static void dwmac4_set_sarc(struct dma_desc *p, 
> u32 sarc_type)
>  					  sarc_type));
>  }
> 
> -static int set_16kib_bfsize(int mtu)
> +static int set_16kib_bfsize(int len)
>  {
>  	int ret = 0;
> 
> -	if (unlikely(mtu >= BUF_SIZE_8KiB))
> +	if (unlikely(len > BUF_SIZE_8KiB))

Should we drop set_16kib_bfsize() instead?

After 6/7 it looks to me like the same test as the first branch of
stmmac_set_bfsize(). The caller ends up there anyway when it returns 0
and chain_mode_ops doesn't have it at all.

>  		ret = BUF_SIZE_16KiB;
>  	return ret;
>  }
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h 
> b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 04dafec021b4..de7aa6d28148 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -540,7 +540,7 @@ struct stmmac_mode_ops {
>  	bool (*is_jumbo_frm)(unsigned int len, bool enh_desc);
>  	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  			 int csum);
> -	int (*set_16kib_bfsize)(int mtu);
> +	int (*set_16kib_bfsize)(int len);
>  	void (*init_desc3)(struct dma_desc *p);
>  	void (*refill_desc3)(struct stmmac_rx_queue *rx_q, struct dma_desc 
> *p);
>  	void (*clean_desc3)(struct stmmac_tx_queue *tx_q, struct dma_desc 
> *p);
> diff --git a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c 
> b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> index f7949419eb9f..d2f0c321661d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/ring_mode.c
> @@ -124,10 +124,10 @@ static void clean_desc3(struct stmmac_tx_queue 
> *tx_q, struct dma_desc *p)
>  		p->des3 = 0;
>  }
> 
> -static int set_16kib_bfsize(int mtu)
> +static int set_16kib_bfsize(int len)
>  {
>  	int ret = 0;
> -	if (unlikely(mtu > BUF_SIZE_8KiB))
> +	if (unlikely(len > BUF_SIZE_8KiB))
>  		ret = BUF_SIZE_16KiB;
>  	return ret;
>  }

regards
Nicolai

