Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C3DCCF2D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 11:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llR1/M0o2+RZ7BjQt2ccx5czJ+FAocfUi1hrDYTfbnY=; b=cJKHLiOnC1SR5VMfeAFi/zEZFa
	kmowmefM3M+oygdKCg71LAE/OoorZ7Hr8s45On45n4/UQMldZ1xwqM2SGvHD3FowQM7OLnSOzicWC
	Y/jrArcsaqcIaaEl4GtNFrLRtxaANu7eZnTxrxC+EDaDQULyxVQKSZSdukZB3zs9rJF5UAHORPMf5
	BOAbnL2i5tlA9uwdhTwn9c7N92j0DyS+H9iA+tpQ2u61JI8Lt4O2DjPeDnHhQxYioD8wZj0XGy53k
	RuMSGFCSqQ1HQAMZ5AE9+Auilglubs6MItWh32SfqVi0JORUGxRUbqL5jjH6J3te91i4lld57sE37
	c5EDJxQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlEU-00000007G6X-2SSx;
	Mon, 19 Oct 2026 11:08:46 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIlET-00000007G66-03e9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 11:08:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B9E08A012B;
	Mon, 19 Oct 2026 13:08:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1792408123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=llR1/M0o2+RZ7BjQt2ccx5czJ+FAocfUi1hrDYTfbnY=;
	b=MhI1Q9md5FRv287FvCaP3fHOmIanX/KO9qN8HAatofw9iqGHq4SmS9eyFq6OT5TYZubKo/
	81Tok1syzLXxgRy18Oi+xm0Jb4dSyqfS/m0T89/4ivJ/EeN5Z9LkDo+FU+kFrZ49XuVBhu
	efbrH0HZsOB4+XsBTgi0QnJk1Iv8Zazihtsma6OMHsvESK2aid09Dh2Fc+zRhEJS5oxGZy
	nueKDGINUQK6ng7ofrmDPjRSkVKlx6kkHGvcmnhZySsb3W1hypA1zdP/orgU7SLqswPOyL
	fE6l+774LYv13uyeN6nRy2W+1WQeZSTIirgrOhqtBQuSTRmJY3BRs5p9786rCw==
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 13:08:42 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Jose Abreu <Jose.Abreu@synopsys.com>, Ong Boon
 Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next v8 4/5] net: stmmac: fix VLAN tag stripping on
 non-linear RX frames
In-Reply-To: <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
 <20261018-stmmac-rx-mb-v8-4-5f58c0b25849@oss.qualcomm.com>
Message-ID: <276f90f8ab2bc5f022c894b0542d57e3@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_040845_214607_01A270D3 
X-CRM114-Status: GOOD (  11.10  )
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

On 18.10.2026 19:07, Lorenzo Bianconi wrote:
> stmmac_rx_vlan() reads the VLAN header straight from skb->data and
> removes it with skb_pull(), assuming the header is always in the linear
> part of the skb. That is not true once non-linear skbs can reach it: a
> program loaded with BPF_F_XDP_HAS_FRAGS can pass up a fragmented frame
> whose linear head has been shortened to as little as ETH_HLEN by
> bpf_xdp_adjust_head(), and the unguarded skb_pull() then drives 
> skb->len
> below skb->data_len, tripping BUG() in __skb_pull().
> 
> Pull the VLAN header into the linear part with pskb_may_pull() before
> touching it and re-derive the header pointer afterwards, as
> pskb_may_pull() may reallocate the skb head. Also move the XDP metadata
> written with bpf_xdp_adjust_meta() together with the MAC header when 
> the
> tag is popped, so data_meta still points at the metadata after
> eth_type_trans() anchors mac_header, instead of at the first bytes of
> the destination MAC. Return an error so the callers can drop the frame
> when the header cannot be pulled.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

