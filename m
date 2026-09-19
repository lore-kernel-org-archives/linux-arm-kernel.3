Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F45BC982E0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 01:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6uZDwEFJumNvTbIJEbn+gxLlSe9+77ye6ZNKB8Slw14=; b=zO8DneJuPTMtEYtt2G+xtqsdmr
	hYbJ2HLM4K9hjw8WQg9HYSMFZzxxJGh6JIkDT0i4jjiByaQy8lJMpjItTl362yBYRbzRdqV4OU4bL
	AX9L6C/90UCFHP2TmB5OG2lA685da1Xg/ba3usILaHk8uPxv8AtWfKE4RbVT3Jrx2/ryCWhFVWAzC
	7F6aA9TUd6kctD9FMQQozE6HtD3hNcKgeFZ7eLl5EjyoPGZe+mi18bSnVF/bTlbCcI1cgWs5unug7
	JFyCsYEuS3j8qZ+j8ezSLOg5fahMzKdzw0eXxTD4K4t8xf2waECkikianuFbT0+Rdj51XIQvhAYqV
	mKMawpCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jqo-0000000Fot3-2MfE;
	Sat, 19 Sep 2026 01:26:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7jqk-0000000Fos2-1ln4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 01:26:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A8481447B8;
	Sat, 19 Sep 2026 01:26:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE2E1F00899;
	Sat, 19 Sep 2026 01:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789781201;
	bh=6uZDwEFJumNvTbIJEbn+gxLlSe9+77ye6ZNKB8Slw14=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=bDv4BHgo05EQ1oZRs9XCRWQyvgVHfGLchfMVXJZSswAIJ98Ml7SCrYo8hNkKnSbHw
	 Tvgmu8yUZsXFkMq5JEtCOSfpxY0vP7aR5AjvyQx3LoqrUUv6gYpvFjdtlK8M8RhwP3
	 NabnfZB+tSmdqkll/KzPl8ZXvLALy+eFW7K4QdY1mEXcVklsCCGML0U17LHiF4hZgy
	 WeUEh4a3wvoLLi7RroY3SBpxJbZMwGS3F5hO9NjhyStxA3NVT1HecAWrcU6FQTIcjd
	 NDxihpY1tZyw2oP6D3WBsqQvcf+5AJq/fT3tTfLu9da/UcCbBvGLFhx05yDOzifpxq
	 fhCi7A9rKHDsQ==
Subject: Re: [PATCH net v4 7/7] net: stmmac: selftests: Account for alignment
 shift on dwmac1000 for Jumbo test
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
Date: Sat, 19 Sep 2026 01:26:39 +0000
Message-ID: <178978119967.22033.10382531437584060350@kernel.org>
In-Reply-To: <20260917215339.2022523-8-maxime.chevallier@bootlin.com>
References: <20260917215339.2022523-8-maxime.chevallier@bootlin.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 0 · Low: 0

- [High] Incomplete fix: the NET_IP_ALIGN compensation is applied only to
  the selftest packet, while the driver keeps programming the full,…

--

net: stmmac: selftests: Account for alignment shift on dwmac1000 for Jumbo test

The Jumbo selftest sends a frame sized from dma_conf.dma_buf_sz, which
started failing on legacy cores after NET_IP_ALIGN was restored in the RX
DMA offset.  The patch shrinks the test frame by NET_IP_ALIGN on non-xmac
cores so the frame no longer spills into a second descriptor.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index 43b8411c51120..c25dc9f89270c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1789,6 +1789,9 @@ static int __stmmac_test_jumbo(struct stmmac_priv *priv, u16 queue)
>  	struct stmmac_packet_attrs attr = { };
>  	int size = priv->dma_conf.dma_buf_sz;
>  
> +	if (!dwmac_is_xmac(priv->plat->core_type))
> +		size -= NET_IP_ALIGN;
> +

[Severity: High]
If the hardware behaviour described in the changelog is accurate, does
this only hide the mismatch in __stmmac_test_jumbo() while leaving the
same shortfall on the receive path for real traffic?

The RX DMA start address is shifted by NET_IP_ALIGN:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_rx_offset() {
	if (stmmac_xdp_is_enabled(priv))
		return XDP_PACKET_HEADROOM + NET_IP_ALIGN;

	return NET_SKB_PAD + NET_IP_ALIGN;
}

but the descriptor buffer length programmed for that shifted address is
still the full dma_buf_sz:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_clear_rx_descriptors() {
		stmmac_init_rx_desc(priv, desc, priv->use_riwt,
				    priv->descriptor_mode,
				    (i == dma_conf->dma_rx_size - 1),
				    dma_conf->dma_buf_sz);
}

drivers/net/ethernet/stmicro/stmmac/enh_desc.c:enh_desc_init_rx_desc() {
	bfsize1 = min(bfsize, BUF_SIZE_8KiB);
	p->des1 |= cpu_to_le32(bfsize1 & ERDES1_BUFFER1_SIZE_MASK);
}

So on non-xmac cores the usable single-descriptor capacity is
dma_buf_sz - NET_IP_ALIGN, which is exactly what this patch encodes in the
test, but nothing reduces the value handed to the hardware.

Can a frame from the wire hit that same boundary?  The buffer size comes
from the MTU, and the rounding uses strict greater-than comparisons:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_setup_dma_desc() {
	len = mtu + ETH_HLEN + 2 * VLAN_HLEN + ETH_FCS_LEN;
	...
	if (bfsize < BUF_SIZE_16KiB)
		bfsize = stmmac_set_bfsize(len);
}

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_set_bfsize() {
	else if (len > DEFAULT_BUFSIZE)
		ret = BUF_SIZE_2KiB;
	else
		ret = DEFAULT_BUFSIZE;
}

With DEFAULT_BUFSIZE == 1536, an MTU of 1510 gives len == 1536 and
dma_buf_sz == 1536; MTU 2022 gives 2048, MTU 4070 gives 4096.  For those
MTUs a maximum-size double-tagged frame including FCS is exactly
dma_buf_sz bytes, so under the changelog's model it needs one more 4-byte
burst than the descriptor advertises and continues into the next
descriptor, where the legacy status handlers drop it:

drivers/net/ethernet/stmicro/stmmac/enh_desc.c:enh_desc_get_rx_status() {
	if (unlikely(!(rdes0 & RDES0_LAST_DESCRIPTOR))) {
		x->rx_length++;
		return discard_frame;
	}
}

drivers/net/ethernet/stmicro/stmmac/norm_desc.c:ndesc_get_rx_status() has
the same check.

Would it be better to subtract the offset misalignment from the buffer
length programmed into the descriptors (or add the NET_IP_ALIGN headroom
to the bfsize computation for non-xmac cores), so that dma_buf_sz keeps
matching what the hardware can actually store in one descriptor?

The patch also carries a Fixes: tag for 23680bf5f8c6, which invites a
stable backport.  Since the change adjusts only the selftest, does the
backport carry the tag without addressing the receive-side exposure?

One more consequence: __stmmac_test_jumbo() is the only in-tree probe of
the advertised single-descriptor maximum.  After this change, does a
future mismatch between the programmed buffer length and the real DMA
capacity stay undetected by the Jumbo test?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917215339.2022523-1-maxime.chevallier%40bootlin.com

