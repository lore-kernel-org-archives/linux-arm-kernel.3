Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83F0ACA9ED2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 20:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vaoUskc8feZSg15SFM0v3Zd5QJMwrh9CubC02jWIJuE=; b=o5Q+yvCCNPKiWOoc4kb8ARfDjo
	Zrwicr7UO2laWCQ5zymQvs+bYMvpgvXLZy+Rdo6LKRLHYANRGhpNkpKtufwBnUj6DwpLOlqJSHC4n
	cOGPBXZLQfG/WdxSXPWufK40lx0ALAHfo5phePbVwgy9mcYJDz5EFZwunc3QfuOmA5W5jMbdfkUZ/
	TG7Sk7i99asStrJ/uVIosWQGEyCzZYVGpOqT9L2EmjIoXtFC020ebzGIJsu8eRaJ7vhqDtfH75LHk
	J6TGa6vJ+Ubc7UlnMuGAu9BlW7xqgtT7pThtqk5jeaZGRNomKy19Rt8/amHA9pL8V5VYGMCSXWDgN
	1TFOe1DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN7J-0000000BVwM-3g7L;
	Mon, 12 Oct 2026 20:59:29 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGN7G-0000000BVvR-20C3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 20:59:28 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79E20A1552;
	Mon, 12 Oct 2026 22:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791838763; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=vaoUskc8feZSg15SFM0v3Zd5QJMwrh9CubC02jWIJuE=;
	b=wN+s3QTHwrwRNofUuZHoJjX0YjT021I+RyJYFpDy9DMMECvd07aLIJ/bGIIWjMxceryAPJ
	vcnPBC8QJ+HIYkptQ/8jJ37C+aLbzsoq/J7q9ru5kStE9Azi0JzgR/3XCrSKFEw5IjSjpk
	krEbMTM0VaCTEWLkWQyMjrkQorkhkwVnbiAApyZyvLnhxZUHVuXmoGEKaHLi9IZVEzP7aG
	Eumk5FPOFKaSHP3slCSTJYMuSEJKrop2HuA+kCGD4m1B3L2uMk6vGW6/nkbYITo3qhiYGz
	IY8xUxKWgzgnCWWsaAK7s+TMwftpk3fO3nrTJuHcYIkygAmEZU7apOK4BapIDw==
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 22:59:23 +0200
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
Subject: Re: [PATCH net-next v6 2/4] net: stmmac: drop split frames on AF_XDP
 zero-copy RX
In-Reply-To: <20261012-stmmac-rx-mb-v6-2-2225050915c1@oss.qualcomm.com>
References: <20261012-stmmac-rx-mb-v6-0-2225050915c1@oss.qualcomm.com>
 <20261012-stmmac-rx-mb-v6-2-2225050915c1@oss.qualcomm.com>
Message-ID: <c5b6cd354d32c5b84c146943ce00b3d6@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_135926_677178_F48B6D64 
X-CRM114-Status: GOOD (  17.57  )
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

On 12.10.2026 18:44, Lorenzo Bianconi wrote:
> stmmac_rx_zc() assumes a 1:1 mapping between a received frame and an
> XSK pool buffer and drops any frame that spans more than one RX
> descriptor:
> 
>         /* XSK pool expects RX frame 1:1 mapped to XSK buffer */
>         if (likely(status & rx_not_ls)) {
>                 xsk_buff_free(buf->xdp);
>                 buf->xdp = NULL;
>                 rx_dropped++;
>                 error = 1;
>                 dirty++;
>                 goto read_again;
>         }
> 
> The non-last descriptors are freed and dropped, but the frame is not
> marked as errored. When the poll reaches the last descriptor of the
> same frame, error is still 0, so the fragment is handled as a complete
> frame: it is passed to the XDP program, copied into an skb on XDP_PASS,
> or converted for XDP_TX. The tail starts in the middle of the original
> payload at a predictable offset and, parsed as a fresh frame (len == 
> 0),
> stmmac_rx_buf1_len() reports the full dma_buf_sz length for it even
> though the DMA engine only wrote the tail remainder into that buffer, 
> so
> the reads extend past the received bytes and can reach beyond the end 
> of
> the XSK pool buffer. GMAC4 always enables jumbo frames (GMAC_CONFIG_JE
> in GMAC_CORE_INIT), so an on-link peer can trigger such a split even
> when the interface MTU is left at 1500.
> 
> Set error when the 1:1 mapping check drops a descriptor, so the
> remaining descriptors of the frame - including the last one - are
> drained and released with xsk_buff_free() instead of being processed as
> a new frame. Account every freed buffer with dirty and count the
> dropped frame once in the poll budget / rx_pkt_n, and once in
> rx_dropped.
> 
> Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

