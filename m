Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A3DFCA600A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOlVfgfP6cReZbjYOfgC3BBrEq2xqxmMoSO9wrismZA=; b=KnET/JcyyKKbRtci/778iwHYLr
	wqah5W4IDfVtxZLefOz7HVf1lPnILFIqAjEyeFA1Fsx/nR5GPm7fUql+JhJCBbeIaNc5H19wldqD/
	qikdTI0uOeurgZh+VKQOGqwOeIYYtGAIad3Yuvs13VYw5LaMdKF08n9PKd3gD4/1aklPoc/WoXSTU
	5M8H4tc8Y6WVNhOqqKOmeTkg5NRfKmJvUoHZszCcSMFCzLkZw4Z/nEDxMFhy01zGSFFGv5cI5G2Jt
	t7Xllu6cSXSMoksR14QfhBXCkNL3Zl0WjaW1UJ9oZzSZULxquyONbS+fhBCqOCeU49+q7XKUtjl79
	6h2d7SAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEitZ-00000003nMe-0jwu;
	Thu, 08 Oct 2026 07:50:29 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEitU-00000003nM5-2Yq2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:50:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECF85A05A6;
	Thu,  8 Oct 2026 09:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791445821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IOlVfgfP6cReZbjYOfgC3BBrEq2xqxmMoSO9wrismZA=;
	b=g3P/M1+mF5kD6hBkOKBHZoxyAkWBu+lPEehfpH8Rfpa8IeuT01zbhtt2OIcMvlGT98DBTJ
	mzKrkXcSERT8siNk7rc7F/R0nFwU+bUw0mqwCpGPbF4nQlYQkhO21ikv+5CCgIkO+DchRz
	lYjBWRCRkysI/X54d24qzdZTcCBC6Q646g9JGx4cia9H5nqCzPT9Sw17PM3w4JvLrd+oqL
	fHqI27x30xOdrFnmUxzAs/QJnVrexuuFVGmTRnNzAnrrL+wbGn/GcPiBkXElSE0KCh9R0g
	IX1a8v3l7+Ss2INEO/rpI7uGMu+ll3P9r1gyx9p2q+LK0jzDf9X1msBmi0cREQ==
MIME-Version: 1.0
Date: Thu, 08 Oct 2026 09:50:19 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet
 <edumazet@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard
 Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Song Yoong Siang
 <yoong.siang.song@intel.com>, Noor Azura Ahmad Tarmizi
 <noor.azura.ahmad.tarmizi@intel.com>, Mohd Faizal Abdul Rahim
 <faizal.abdul.rahim@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v2 1/2] net: stmmac: Disable NAPI before stopping Tx
 queues in stmmac_xdp_release()
In-Reply-To: <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
References: <20261005-stmmac_xsk_crashes-v2-0-46c60cba6421@linutronix.de>
 <20261005-stmmac_xsk_crashes-v2-1-46c60cba6421@linutronix.de>
Message-ID: <bd26a838deb15b560419d1e4a33d838b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_005024_805859_A8DBE203 
X-CRM114-Status: GOOD (  12.96  )
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

Hi Kurt

On 5.10.2026 09:09, Kurt Kanzenbach wrote:
> Attaching an XDP program while Tx traffic is running results in kernel
> crashes in stmmac_xmit() -> dwmac4_set_addr().
> 
> Loading an XDP program tears down and reallocates all DMA resources via
> stmmac_xdp_release() and stmmac_xdp_open(). stmmac_xdp_release() stops
> the Tx queues before disabling NAPI:
> 
>  stmmac_xdp_release:
>    netif_tx_disable
>    stmmac_disable_all_queues
>    ...
>    free_dma_desc_resources
> 
> A Tx NAPI poll may still be in flight at that point. stmmac_tx_clean()
> takes the Tx queue lock, reaps completed descriptors and wakes the 
> queue
> again when it observes it stopped with enough descriptors available.
> Nothing stops the queue afterwards, so the Tx path resumes while
> free_dma_desc_resources() releases the descriptor rings underneath it.
> 
> On non-coherent platforms dma_free_coherent() tears down the vmalloc
> mapping of the descriptors, so the subsequent stmmac_xmit() faults on 
> an
> unmapped address instead of corrupting memory silently.
> 
> Disable NAPI first and stop the Tx queues afterwards, which is the 
> order
> already used by __stmmac_release().
> 
> The issue can be easily reproduced by:
> 
>  1. Run iperf
>  2. Run application which opens an AF_XDP/ZC socket
> 
> Assisted-by: Claude:claude-opus-5
> Fixes: 77711683a504 ("net: stmmac: ensure tx function is not running in 
> stmmac_xdp_release()")
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # stm32mp215

Thanks,
Nicolai

