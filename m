Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4FFC9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfLFefFTZ9CCY0LnSyMHekNeX2TotPch4ikL4DSCq7U=; b=1a/FIxiJbK9RVHmiKeDSrw388t
	mrjeS2AXBN+pKjLnWTjfdaXsbNJI/y14rrFs0/a2mzIVUrZbua3wvjapeRES2PpTR4ImGSnZV5Jw6
	Zs4Wj7D0z4RN8II3JXvRz/EfJfLUJxhKKnmn/OfVWtUx9GkSIOsVGMWrkvxaayzoDVhDC/LDzKD/z
	jfnOgyhcucVlZQFO5xuV/jM4oH7S6RZLDDb7FJnjRs4A0e19sQiFsPuiH/QliBa2/Hg5F1qUIM4hl
	PLQ6kce+rzGkmOx8OWuPrzMLw97+kppHxccFSD2Op3bjy6lEefcjtfU0pCx6lfbaiPu1l8M4TkiZA
	QHGTnpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAszL-0000000GffQ-3FvJ;
	Sun, 27 Sep 2026 17:48:35 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAszI-0000000Gff0-2V0U
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:48:34 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E9E1AC5CD41;
	Sun, 27 Sep 2026 17:49:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 06961604FF;
	Sun, 27 Sep 2026 17:48:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8AD2B102F1E7E;
	Sun, 27 Sep 2026 19:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790531305; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=AfLFefFTZ9CCY0LnSyMHekNeX2TotPch4ikL4DSCq7U=;
	b=TdsNNYUEGR/IlBVUa5FG0wm302dtB1cFBSLS4xtjpv0xlLK2c5SQFG14+2O+6kp8Zkzf+5
	6auCNcbQvePq9bPfeHYNzImSnb4sxVuebq2UkFT59Y9cdJv7wxFy5XhQTM2ZKpD2AHOqVP
	LU9zy2Z3/fcjkHK4MZAcVp+lnl/jMxIizh07sIJ6HCO5D/vMmLxC/iDBk/bPd7nPdzGSOT
	G9xJBcGeVqr7fvZ1let+m6wXw6tAqNqgemQTI36cO0QmcGTwbGp17wf82fOTa3m4fxzI8j
	FLvQBl3dtHJ/iysB5ksUHdtxADjdQ9a81tSbFup5guiEaGsrlhGHoScMxTSs5A==
Message-ID: <9f7d6b86-3ccb-4ccf-8758-c4b8c6ad2ef1@bootlin.com>
Date: Sun, 27 Sep 2026 19:48:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: fix rx Scatter-Gather support
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
References: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260923-stmmac-rx-sg-fix-v3-1-ed26fea7180d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_104832_833650_FA5EBE3A 
X-CRM114-Status: GOOD (  19.16  )
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

Hi Lorenzo,

On 9/23/26 11:14, Lorenzo Bianconi wrote:
> When a received frame is larger than dma_buf_sz, the DMA scatters it
> across multiple RX descriptors (rx Scatter-Gather). The secondary RX
> buffer (sec_page) was only allocated and programmed when split-header
> (SPH) was active, so for regular frames buffer2 was neither allocated
> nor backed by a valid mapping. As soon as an incoming frame overflowed
> buffer1, the DMA wrote the overflow into the unmapped secondary-buffer
> address, triggering an SMMU translation fault on IOMMU-based platforms:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x7f0011, cbfrsynra=0x1c90, cb=11
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c90
> arm-smmu 15000000.iommu: FSYNR0 = 007f0011 [S1CBNDX=127 WNR PLVL=1]
> 
> Enable scatter-gather for non-SPH frames on cores that can program an
> independent secondary RX buffer (GMAC4/XGMAC): allocate and mark buffer2
> as valid in stmmac_init_rx_buffers() and stmmac_rx_refill(), and account
> for it in the buffer length computation. Legacy cores have no set_sec_addr
> op, so they keep buffer2 disabled.
> 
> Since buffer2 is handed to the DMA at page offset 0, the page pool sync
> window is widened to cover both buffers in every mode: offset is set to 0
> and max_len to dma_buf_sz + stmmac_rx_offset().
> 
> The FCS can straddle the buffer1/buffer2 boundary and a descriptor
> boundary, so it is now stripped from the tail of the assembled frame with
> pskb_trim() instead of from a single buffer, avoiding an unsigned underflow
> for frames that overflow a buffer by 1..3 bytes. For single-buffer frames
> the XDP program must not see the FCS, so it is removed from the XDP buffer
> before the program runs.
> 
> Native XDP currently only supports single-buffer (linear) frames. An
> oversized frame accepted by the MAC (jumbo enabled) is received via
> buffer2; the XDP program only sees buffer1, so on a TX/REDIRECT verdict
> the frame is forwarded truncated. XDP multi-buffer support to handle
> this case is planned as a follow-up.
> 
> AF_XDP zero-copy RX is not covered by this change: a ZC queue still
> programs buffer2 at DMA address 0 (and XGMAC has no buffer2-valid bit),
> so an oversized frame overflowing buffer1 can still trigger the same
> SMMU translation fault. Handling is planned as a follow-up.
> 
> Fixes: 88ebe2cf7f3f ("net: stmmac: Rework stmmac_rx()")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Meh I replied to the previous iteration... I did test V3 actually, so
here's the blurb I said on V2 + tag :

I was able to test that on DWMAC4 (stm32mp157) sending oversized frames,
and they correctly spill over the next descriptor, no crashes no stall,
the only limitation being the RX fifo size now.

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


