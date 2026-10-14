Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1A0CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4ymEuqTqyaGq+HF/qthlrZ+HnGnQbv0+xl6gccW0qw=; b=mfF8xziPzOXo1UGFdHADp6CwXo
	nJtR1octrVHiJms5zWgNuNKy0aYRtL5uVWoT8M/8labeRgjaJtWmKkrvXJH24BxxG+6XGZpahyCDg
	MA/vBvi24J3lKNZGQx9gJC0eL7PJTnyHpgQ5pq/AR6ZyRAy48iICY6/erZvKjf2WoCF5Z6snwCbu3
	B2W+D84vb02n08GRjMzkXYVY9WXmxklKBrKRLe3Jms3IZict8j2IEh1wFDrMSK7S/7k9mdCu1PSDo
	Djkoj9yhKQNsh5vO3NGcNFWrfj184IQs9UCDt89weQvZQoUI9PqpnQ5svtrBhXGtgVMBp60V0y+mA
	D77uTtiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxIh-0000000FMWT-43uK;
	Wed, 14 Oct 2026 11:37:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxIh-0000000FMWJ-0qJI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:37:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=V4ymEuqTqyaGq+HF/qthlrZ+HnGnQbv0+xl6gccW0qw=; b=hJSEzVUB9cetHo7Xj2vFAwNKln
	by/AYGX+DvcmCEk/xVg4lO4eOm4gktNEH8NYX8FS0M3aBguQthnNHhgQVrOfXjINtQrunWO+IzFxx
	j6DUWoyf6ndRU0XTmDULVyRFh3FgvBfpxSR/egOUhvd9xDk6g5rJz78L2D40Ys1Pt9OPNQIVXS63A
	DsElqvXLt0HYqEYp/F6ioicbkvE3/W7A4YQqbZmnoM5RgfU1GO5v1XK+E0GyI/qvcIo0cxqeeNWSB
	nVqKr6eF5cByk0MhtWacqCZSOl6Yce1gVQIxKh99owhy4nWzzZ8UgVBP4+bk1CVJ8StksYoCW1an+
	xLkQDcZg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxIe-0000000GhUR-0ISL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:37:38 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3CD9CC63443;
	Wed, 14 Oct 2026 11:38:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D64760368;
	Wed, 14 Oct 2026 11:37:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E41B010328B3C;
	Wed, 14 Oct 2026 13:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791977846; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=V4ymEuqTqyaGq+HF/qthlrZ+HnGnQbv0+xl6gccW0qw=;
	b=WimA8nXlV/g+Y+ZUIyVT/eGUQPHsoHwQzPZbgc659ZiDq5n/nyjMkKmB2jsahsmpXVBHUP
	y1WXOeZ1wKwgk3+PYlI4eB6+NWmltzXZNzbCp66isfr3QC2VMC+z6WQKBD8roI+iEaX95N
	toqaPVbA7yACgD77dKlLz4jiqTb17fQVy/V3wPWUrU/V0b3c9ByJcdYZKXkeq9VOaFVatD
	+lIN5IIQC3cHqry8fc65sYSF6slJRSPpzw+e3PFRpHrosx3UgmgL7aCXDEAOH5X/op4zVi
	L9j25MgZLf3mpLJRNOfaH+tnn4VMCddzGSYn4eIOr7MFSwrAFVpBkPMVKTPnwQ==
Message-ID: <1e6bee3e-a4fd-4cdb-9c42-5cee57e3ed83@bootlin.com>
Date: Wed, 14 Oct 2026 13:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 2/3] net: stmmac: free RX resources when TX allocation
 fails
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Joao Pinto <Joao.Pinto@synopsys.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Ong Boon Leong <boon.leong.ong@intel.com>, bpf@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1791958735.git.kmehltretter@gmail.com>
 <e7a5380aabfbc03bd560ab08f37ea255d11d528a.1791958735.git.kmehltretter@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <e7a5380aabfbc03bd560ab08f37ea255d11d528a.1791958735.git.kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_123736_292266_976FB715 
X-CRM114-Status: GOOD (  12.14  )
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

On 10/14/26 08:27, Karl Mehltretter wrote:
> alloc_dma_desc_resources() allocates every RX queue before allocating
> TX queues. If TX allocation fails, its error path only frees TX
> resources and leaks all RX resources.
> 
> Free the RX resources after the TX allocator unwinds its queues.
> 
> Found by inspection. On a BeagleV Ahead (TH1520), forcing TX DMA
> metadata allocation to fail left the RX cleanup event absent. With this
> change, both TX and RX resources were released.
> 
> Fixes: 71fedb0198cb ("net: stmmac: break some functions into RX and TX scopes")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Also covered by https://lore.kernel.org/netdev/20261012142458.2845385-1-dinghui1111@163.com/.

Thanks,

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 495ff7aef..8fd7d2173 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2425,6 +2425,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
>  		return ret;
>  
>  	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
> +	if (ret)
> +		free_dma_rx_desc_resources(priv, dma_conf);
>  
>  	return ret;
>  }


