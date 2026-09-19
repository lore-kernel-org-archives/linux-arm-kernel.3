Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA22C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDNTTwDHXt87TQnrJXJyanOXqCuFp9CDLP4FBV0ZDYk=; b=rBZ+syGUyLu1XnoF2CDsJZipYv
	FcUN67pHIV5iymXLWcvRooW1aguxeQ4sXp8p+gd71uvnrc3G20IVgryke2GGW4CdQTSccaBkFO/Co
	8smwbmCyULUGCU/Gn96YurQpiqmJbrOS+4ae6W86C5yyr7gPxaa7yl6EaQ2h29F+Sxrg4tIUFSxkM
	T+sVIpbRfxQOVLPao1ZAhugN2z+2gsmh+77j0tJz0cNurtVVXg8zwRV2XX+EJT/IAuFrHGflXRvny
	TCq87+M7pi3v2znwj2GmCQajNC3f0JK5wvjqa3/MzUrEzls/Y3TlEzpuEwO4mzi30WUdWDxASSEMd
	hpR3bUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jqo-0000000Fosy-1w1H;
	Sat, 19 Sep 2026 01:26:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jqi-0000000Forr-1fBO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:26:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96AB5444FF;
	Sat, 19 Sep 2026 01:26:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D78C1F000FF;
	Sat, 19 Sep 2026 01:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789781199;
	bh=rDNTTwDHXt87TQnrJXJyanOXqCuFp9CDLP4FBV0ZDYk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WJFSIZOby+LUcRQGbT/xLyM73i3ih1oSIqoqo5BEMmaucvq3k1SEMf6LLrEeuMaRc
	 dCPxrD/p3CbDbXdlNYE8KvE0IkLj9PL+qH22OkBVPUyJ4KXKBCjQ/BsqUaABcuuVh6
	 cPv4Ife9TUA0ocKkBRHNwDN4fRLcLk6Ewhk1dYCkUyuAAVLEskO2As0XyqbwfCrb5Z
	 N8DZ7mTrWIhUfxBPB79A7f3Oms3HFe8z3HYmHzlpEovy/7BP6cQOQM0ZluXYtzgEKy
	 CAq76lt7hnjc6wq6kKcLd8b9UkhxeE19HwiPKdQFhtAd5EMgGdvch9szKZ+UpHzpNE
	 P404gYi+s595w==
Subject: Re: [PATCH net v4 5/7] net: stmmac: dwmac4: Use the correct bufzise
 when the len is exactly 8K
From: netdev-bot+sashiko@kernel.org
To: maxime.chevallier@bootlin.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
 hkallweit1@gmail.com, alexis.lothore@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, kernel@esmil.dk, minda.chen@starfivetech.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, jan.petrous@oss.nxp.com,
 ovidiu.panait.rb@renesas.com, Jose.Abreu@synopsys.com, nb@tipi-net.de,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de,
 david.laight.linux@gmail.com
Date: Sat, 19 Sep 2026 01:26:37 +0000
Message-ID: <178978119761.22033.12290469821672441760@kernel.org>
In-Reply-To: <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-6-maxime.chevallier@bootlin.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] Taken in isolation, the only functional hunk of this patch
  (drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:477-484,…
- [Low] Commit-message / diff mismatch in "net: stmmac: dwmac4: Use the
  correct bufzise when the len is exactly 8K": the changelog states…

--

net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K

This changes the dwmac4 set_16kib_bfsize() comparison from >= BUF_SIZE_8KiB
to > BUF_SIZE_8KiB so that a frame length of exactly 8KiB does not select the
next larger DMA buffer size, and renames the callback parameter in
dwmac4_descs.c, ring_mode.c and the stmmac_mode_ops prototype.

No Link: tags in the commit header.

> net: stmmac: dwmac4: Use the correct bufzise when the len is exactly 8K

[Severity: Low]
This isn't a bug, but the subject has a typo: "bufzise" should be "bufsize".

>     Lets fix the comparison and while at it, rename the parameter from len
>     to mtu.

Does the changelog describe the rename in the right direction?  The diff
renames mtu to len, not len to mtu:

  -static int set_16kib_bfsize(int mtu)
  +static int set_16kib_bfsize(int len)

Same for the ops prototype in hwif.h and for ring_mode.c.  Should this read
"rename the parameter from mtu to len"?

Also, at this commit the caller still passes an MTU, not a frame length.
stmmac_setup_dma_desc() documents "@mtu: MTU to setup the dma queue and buf
with", is called with dev->mtu from stmmac_open() and with new_mtu from
stmmac_change_mtu(), keeps the comment "Returns 0 or BUF_SIZE_16KiB if mtu >
8KiB and dwmac4 or ring mode", and the sibling helper is still
stmmac_set_bfsize(int mtu).  Nothing on that path adds ETH_HLEN, VLAN or FCS
yet.  That unit mismatch is resolved by the following patch in the series
("net: stmmac: size the RX buffers from the frame length, not the MTU"),
which computes len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN and renames
stmmac_set_bfsize()'s parameter too, but the inverted rename sentence in this
changelog would still be worth correcting on respin.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> index 2994df41ec2c4..c6a8f8d735015 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
> @@ -474,11 +474,11 @@ static void dwmac4_set_sarc(struct dma_desc *p, u32 sarc_type)
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
>  		ret = BUF_SIZE_16KiB;
>  	return ret;
>  }

[Severity: Low]
Taken on its own, does this hunk change the DMA buffer size the driver ends
up programming?

The only caller is stmmac_setup_dma_desc(), which falls back when the
callback returns anything below BUF_SIZE_16KiB:

	/* Returns 0 or BUF_SIZE_16KiB if mtu > 8KiB and dwmac4 or ring mode */
	bfsize = stmmac_set_16kib_bfsize(priv, mtu);
	if (bfsize < 0)
		bfsize = 0;

	if (bfsize < BUF_SIZE_16KiB)
		bfsize = stmmac_set_bfsize(mtu);

	dma_conf->dma_buf_sz = bfsize;

For the single input whose result changes here (exactly BUF_SIZE_8KiB) the
callback now returns 0, so the fallback runs, and stmmac_set_bfsize() at this
commit still uses the inclusive comparison:

static int stmmac_set_bfsize(int mtu)
{
	int ret;

	if (mtu >= BUF_SIZE_8KiB)
		ret = BUF_SIZE_16KiB;

so dma_buf_sz comes out as BUF_SIZE_16KiB both before and after this patch.
The boundary case is only actually fixed by the next patch in the series
("net: stmmac: size the RX buffers from the frame length, not the MTU"),
which switches stmmac_set_bfsize() to a strict > comparison and feeds both
helpers len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN.

Given that, is the standalone Fixes: c3efed5ad1b0 tag on this commit right?
Backported alone to stable it would have no effect.  Would it make sense to
either squash the two changes or note the dependency?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 9314bcb85c221..857f7562c6c6d 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -540,7 +540,7 @@ struct stmmac_mode_ops {
>  	bool (*is_jumbo_frm)(unsigned int len, bool enh_desc);
>  	int (*jumbo_frm)(struct stmmac_tx_queue *tx_q, struct sk_buff *skb,
>  			 int csum);
> -	int (*set_16kib_bfsize)(int mtu);
> +	int (*set_16kib_bfsize)(int len);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917215339.2022523-1-maxime.chevallier%40bootlin.com

