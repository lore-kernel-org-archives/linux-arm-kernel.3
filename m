Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E046CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eMLdNmdNwgUmvAo6yFCQwGyE2IXMBMPu/dG68ponrNc=; b=cnEoyqfuBcDvPOOhZmYcJAukif
	3xqAn/cDlGUi3uHGBq+us0Ev9V1ZNC80wN7Py6XRl75SCNllL2HfNwOM6a8rEE405R4CM6oxfmOfB
	GqitIXfRyMxG7QXX3hBMXl0k40TTPlZVeXmvK7samp95evqeMKM6syQ2z4QlCMKPaZqP5EQl9WB8g
	+uhoo0M/8jR/yeQtrkhwkpFfmpK/XOXo8Nc8zj4qXbe7wMNlRt4R7+D1YMe2SrcaeL/KktCBkOUIB
	p03z1MnEHZUnwDLR6o/d1sbtRuEQ3b/Gi7Mjhjsnm/Zhmg8cLDJRl3otK2VeiOUJWmij14y1Vrzx8
	JCyegUFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbGu-0000000Cmle-2CRp;
	Tue, 13 Oct 2026 12:06:21 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbGp-0000000CmkO-1cCd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:06:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B73CA154D;
	Tue, 13 Oct 2026 14:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791893169; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eMLdNmdNwgUmvAo6yFCQwGyE2IXMBMPu/dG68ponrNc=;
	b=x4RpA1anJUuS6zo86bux7WVQtdYUwwEKX5gOg2e6Pmj7RB5A1O08u9aUZnNZavuNduP+Mz
	DbQ/tQKRZvQ8yb8BG5QDHf7vULvBdcN+Lrg0Mz6nLbkgJ3dYPqixPoUfGaoBkswyuC13ZZ
	8WW6NckeKULzD80LBeWQ0v2xm2ttFX5yYTiT446qZum2Xm8+VzCQY8LF4oReLmDXeNKnqG
	jIcHHAjUI7HAZBPltTfQ1avQsgmlS6Paxc2InQPR3mXFxLFEdg3+eV7eM8NLHGsRij8ncg
	Eh24DGwxRDd8daIFQ2hJQO4JQ3fT17UiTjJWK7/R6tyt8lXjF1MXaIMpZgD6xQ==
MIME-Version: 1.0
Date: Tue, 13 Oct 2026 14:06:06 +0200
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
 <yoong.siang.song@intel.com>, Mohd Faizal Abdul Rahim
 <faizal.abdul.rahim@intel.com>, Ong Boon Leong <boon.leong.ong@intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Maciej Fijalkowski
 <maciej.fijalkowski@intel.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v3 2/2] net: stmmac: Stop Tx queue when (en|dis)abling
 XSK pools
In-Reply-To: <20261013-stmmac_xsk_crashes-v3-2-50fca7790af2@linutronix.de>
References: <20261013-stmmac_xsk_crashes-v3-0-50fca7790af2@linutronix.de>
 <20261013-stmmac_xsk_crashes-v3-2-50fca7790af2@linutronix.de>
Message-ID: <cccec8df7c85b987bc67affeedfe40e2@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_050617_853926_54DB90AF 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

On 13.10.2026 10:57, Kurt Kanzenbach wrote:
> When enabling or disabling XSK pools in parallel to Tx traffic, kernel
> crashes occur. For VLAN tagged frames that happens in stmmac_xmit() ->
> dwmac4_set_vlan_tag() and for normal frames in stmmac_xmit() ->
> dwmac4_set_addr(). Both of these functions access the Tx DMA 
> descriptors.
> 
> The XDP pool (en|dis)ablement frees and reallocates the Tx DMA 
> resources:
> 
>  stmmac_disable_tx_queue:
>    __free_dma_tx_desc_resources
> 
>  stmmac_enable_tx_queue:
>    __alloc_dma_tx_desc_resources
>    __init_dma_tx_desc_rings
> 
> NAPI is disabled during that allocation window, but the Tx queue is not
> stopped. Therefore, add the stopping of the Tx queue during the 
> enabling
> and disabling of XSK pools.
> 
> The issue can be easily reproduced by:
> 
>  1. Run iperf
>  2. Run application which opens an AF_XDP/ZC socket
> 
> Also add a dedicated queue check for the XDP Tx paths.
> 
> Fixes: 132c32ee5bc0 ("net: stmmac: Add TX via XDP zero-copy socket")
> Suggested-by: Nicolai Buchwitz <nb@tipi-net.de> # XDP Tx checks
> Signed-off-by: Kurt Kanzenbach <kurt@linutronix.de>

> [...]

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>
Tested-by: Nicolai Buchwitz <nb@tipi-net.de> # stm32mp215

Thanks,
Nicolai

