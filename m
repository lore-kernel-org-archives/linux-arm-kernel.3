Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931D3606A324
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FGvp4Umd;
	dkim=pass (2048-bit key, unprotected) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=ESvA4/Jp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bUoP3KIGCAm0xwt3Z15aBvbUhr08siqGySkpr9jx0II=; b=FGvp4UmdBzIr9X
	+599M5PDYuH1m7KCi9sGO7kFKjTRK/0seDlPQqwVxsAXsjzX8uOfW7rsBYRrZgTvnKdpVD6+Wwiwr
	SVPLjCqCvVPi2NAKL0nSLriJ4pKLjNHwAvMbXykuRFpSjIDTgenvbOp1L3MsKx2bYK0WJPf+qjDkz
	/hFPBAqnGVqkMD1BbVD8/5wGUf6UHnUdkwqvX7FDNsPpXzMgiaHb4ou1yZ7SmJ3C4SzAcBYldQy5W
	Q3e8M8ONPgcMij+8O4CyGPSqrs0f3eI+pQjYr5n1DW/TTAIUkIsjBgU6Pf6m8ti67S3grple+PxHL
	awMUhpfMgbprn0OyoJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOErm-00000002dMQ-2plj;
	Tue, 03 Nov 2026 13:47:58 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOEri-00000002dKt-2ODL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 13:47:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EBAC4A1608;
	Tue, 03 Nov 2026 14:47:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1793713672; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bUoP3KIGCAm0xwt3Z15aBvbUhr08siqGySkpr9jx0II=;
	b=ESvA4/JpvRFHG1JdoykgCugdbYm2RqvacQyesF9UtwALRjJK9UsmqSJKKPng/fXpkA5tt5
	dwyd6hA4Lr2O2uL17PlQChGLg8ORfppfVQubGTSxEUJt8FxTzB6zZbpJwuxKCeaim/nSk4
	KkD+G5+2vtL+mhOhH3f3/20sqPQCfn4iy6wbrSSgwpP8sDFwxlYe6c2akd15/EYmEOmWLC
	gBBtbzU/HOGOq2rSx/agRyjI8t+TKK2nU3jCujchVpckU/coQibIQhQYA9kaivyj2jDPT7
	9TEAWipqDjxvl9PzfR1D2TsIzuBf3sD9Exu05zWlsyiz8HVZ5H9E7JKwODBuwA==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Tue, 03 Nov 2026 14:47:49 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Song Yoong Siang <yoong.siang.song@intel.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 bpf@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: set XDP metadata length on the page_pool
 RX path
In-Reply-To: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
References: <20261102-stmmac_meatada_pp_path-v1-1-d93cc4f9a864@oss.qualcomm.com>
Message-ID: <3ab1926864137534eac81371ccadf3e9@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_054755_634085_5CB58B7E 
X-CRM114-Status: GOOD (  12.80  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lorenzo

On 2.11.2026 12:46, Lorenzo Bianconi wrote:
> stmmac_rx() initializes the XDP buffer with the metadata area valid, so
> an XDP program can reserve metadata with bpf_xdp_adjust_meta() and 
> write
> it in [xdp->data_meta, xdp->data), for example to export the RX 
> hardware
> timestamp obtained from the metadata kfunc. When such a frame is passed
> to the stack, the skb is built in place around the same page with
> napi_build_skb(), but skb_metadata_set() is never called.
> 
> napi_build_skb() clears skb_shared_info up to dataref, which includes
> meta_len, so skb_metadata_len() stays zero. The stack and TC BPF then 
> see
> an empty metadata range even though the bytes are present in the skb
> headroom. The AF_XDP zero-copy path already records the length in
> stmmac_construct_skb_zc().
> 
> Record the metadata length after reserving the headroom and adding the
> frame data. No copy is needed because the skb is built over the buffer 
> the
> XDP program wrote to. With the length recorded, the software VLAN
> stripping path can move the metadata together with the MAC header, as 
> it
> already does for zero-copy frames.
> 
> Fixes: e3f9c3e34840 ("net: stmmac: add Rx HWTS metadata to XDP receive 
> pkt")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

