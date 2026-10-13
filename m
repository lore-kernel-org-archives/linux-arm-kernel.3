Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B723CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dgzb88563AUvmfiEGWD4/1lRIHtLmN+6Sq0JZi0U+ao=; b=1wq5pbBQOSgtDePDcNXCfY0RmC
	2valNdsSth4cVE4LLN3jT04PxGNvvXSPWIELfExaQA5W6EL6iUWFVjdXLWezcHl+tavGek2EYs5QS
	2/BArY6Ws96zJM8O+P4xBZnXyRDT+xGtqOeYyVVx/ryCeCBcx1Oi05UQ/ZGW1+n+t/vkiw3UYnHio
	n+iVm5VQf8uztac6msKy+UPi16HnKdCk2EPhB3q+w1BbLliIOJ6FWdn5F35rEFOOVBKKvzgsfyg/2
	8DjiLnnnJKTyDEEHJZ9kw6cQmkXTJRSPa7EQdNK3EZSGagpCdYJL1heQX/sEzWJTfcBienlMPECct
	odLIgC1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWCV-0000000CACz-3mY6;
	Tue, 13 Oct 2026 06:41:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWCJ-0000000CABt-0Tw0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 06:41:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 902F21A118C;
	Tue, 13 Oct 2026 06:41:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A7A760362;
	Tue, 13 Oct 2026 06:41:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B862E11D70211;
	Tue, 13 Oct 2026 08:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791873668; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=dgzb88563AUvmfiEGWD4/1lRIHtLmN+6Sq0JZi0U+ao=;
	b=smlFqACmUC32ziTlXtPFhT7Iq7SJNTYS8GP5PpM4GcEUgM1oVL2WEBjlmU8Z2xVGgoOcEB
	+d1j3PjlB+uiIecpdjtJK4UVtBrFyWHUSNfNlp6IBhSoYOQQa/S/RSnBCbxG+cZRKh9zhR
	SIqfYo7JRXTJhbZmRbWhesKIYIrFl8QRGbm+2IXMq4g7xPhNuzqymlMU2/Zkts39SSy3JT
	f9eBsWOhOKmfl4o+gFACtPQkJF2sK+qDX/iiYbjHtGILJMfZjkUtvCnnPy+BBG+JtZeZAo
	AW7h1OGWs30BDrGSUe5/7rA9pYqz5aLUW8U4O4IItYyc2BGbwqR/zuNhphwwWw==
Message-ID: <093d3499-d848-4f68-abc6-f2a3ceda3521@bootlin.com>
Date: Tue, 13 Oct 2026 08:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: xgmac: do not treat TBU as a TX event
To: Pengfei Zhang <zhangfeionline@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Jose Abreu <joabreu@synopsys.com>, EricChan <chenchuangyu@xiaomi.com>,
 Simon Horman <horms@kernel.org>, zhangpengfei16@xiaomi.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261013024747.2688984-1-zhangfeionline@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261013024747.2688984-1-zhangfeionline@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_234115_323320_855B0A77 
X-CRM114-Status: GOOD (  14.75  )
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

Hi,

On 10/13/26 04:47, Pengfei Zhang wrote:
> Commit 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
> removed TBUE from the default DMA interrupt mask, but did not remove the
> TBU check from dwxgmac2_dma_interrupt().
> 
> TBU is set whenever a TX channel runs out of descriptors. Since TBUE is
> not enabled and only enabled bits are cleared, the TBU status bit is
> never cleared. As a result, TBU stays set on every idle TX channel,
> regardless of whether there is any TX traffic.
> 
> With a shared interrupt, stmmac_dma_interrupt() checks all channels,
> so every interrupt from any source schedules TX NAPI on every idle TX
> channel.
> 
> Only use TI to trigger TX processing.
> 
> Fixes: 8d07a7930434 ("net: stmmac: xgmac: Do not enable TBU interrupt")
> Signed-off-by: Pengfei Zhang <zhangfeionline@gmail.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

> ---
> Tested on a board with 8 RX/TX DMA channels behind one shared
> interrupt. A peer sends 10k UDP packets/s to the board and the board
> sends nothing back, so there should be almost no TX work. Every idle
> channel reads DMA_CH_STATUS 0x4 (TBU only).
> 
> Per second, averaged over 10 s:
> 
>                        before    after
>   hw interrupts          9071     8580
>   tx_normal_irq_n       72572        1
>   tx_clean             ~73000        9
> 
> - hw interrupts: the shared interrupt line, from /proc/interrupts.
>   Unchanged, the RX watchdog sets the rate.
> - tx_normal_irq_n (ethtool -S): how often dwxgmac2_dma_interrupt()
>   returned handle_tx. Before the fix every interrupt reports it for
>   all 8 channels.
> - tx_clean (ethtool -S): stmmac_tx_clean() runs, i.e. TX NAPI polls.
>   Each spurious handle_tx schedules one. What is left after the fix
>   is real TX and the TX coalesce timer. The "before" value is from a
>   separate run with the same setup.
> 
> No packet loss before or after.

If you need to respin, that information should be in the commit log
directly.

Thanks,

Maxime



