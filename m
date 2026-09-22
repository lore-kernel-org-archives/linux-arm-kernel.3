Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3991C98302
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 21:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aegPoYsp2AnoEEWdjQn2RZBVdKkWUQvus+hn1ZEnwSM=; b=Slzlmn+NNacBgMn7AJTXu0eAnG
	HgnSjN/99jXppTcGticzi/MqIxF9y+CoQ8EpgDU0Az+9iv0rLpn+JwabsYfIjL2XyhcOORI1J9XSi
	waJPHvBaC6hQOo+PEMzIFfINkdpQCMHDnBilhxGGQIoG2ItJZ5AtO3wgpSUHirEIOcnvu5tfPnyDB
	o6vtyZHRZfzsNLr9SKJfxnHgu89M1QZ/MMvo+QY9sGzYjp9HwPAiCJHzD6qvk3HkKjJ4scutVz6J8
	NJY0GDR98CzK4/cQPnsM7onG1gjjCukYkMQUaPfIG+g1L9ZsQSsymBdAwq7gCRhRBMRuWxVxZe73u
	uZiojyqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98FI-00000006dJ0-2XUb;
	Tue, 22 Sep 2026 21:41:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x98FF-00000006dIb-0Osv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 21:41:47 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B089C1A0FD8;
	Tue, 22 Sep 2026 21:41:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8312060580;
	Tue, 22 Sep 2026 21:41:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 25E371032802B;
	Tue, 22 Sep 2026 23:41:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790113296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aegPoYsp2AnoEEWdjQn2RZBVdKkWUQvus+hn1ZEnwSM=;
	b=KMiykFuYrNaFvXZEd7Sbft6hBWsxxzytH0Ys/Xhr0z3bOKFcnVuSdfYw7bD+naDWkWNhYJ
	n84P5TUGvw1scqI8EfPzuV479LYCgGGk5GUJnCRbY9dUzSaIWb5FipKg7E055phzyBOiqt
	LhEnakyQ+kOhCC9IEF6I8f7As5nysxntEIyFFryiSBByWYFj+4eQP/+ULmYJd3jCrrk83t
	VWoU3HBXXQ/MgHCVyvsb91QAmJ0aVtjs2nNRXx4r0b7/KiZxBYgjsyQi1ginViGeLbb4Zz
	SjyxzOUNbE8xN/WAv+8dtpz6O7eEZSjcMKQ78BKWIs+qjLgCLgaePW0f7Z7z/A==
Message-ID: <76dafa51-b20a-4bb1-9c2b-38f2a7d83dab@bootlin.com>
Date: Tue, 22 Sep 2026 23:41:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: clear stale buf->page after recycling on
 skb build failure
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Yanteng Si <si.yanteng@linux.dev>,
 Alexander Lobakin <aleksander.lobakin@intel.com>,
 Furong Xu <0x1207@gmail.com>, Larysa Zaremba <larysa.zaremba@intel.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260921-stmmac-fix-napi-build-skb-error-v1-1-3d54bf6d9bb6@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260921-stmmac-fix-napi-build-skb-error-v1-1-3d54bf6d9bb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_144145_282404_3406B75A 
X-CRM114-Status: GOOD (  16.95  )
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

On 9/21/26 16:46, Lorenzo Bianconi wrote:
> In stmmac_rx(), when napi_build_skb() fails the descriptor page is
> recycled back to the page pool with page_pool_recycle_direct(), but
> buf->page is left pointing at the recycled page, unlike every other
> consumption site in the function which clears the pointer after handing
> the page away.
> 
> With the stale pointer stmmac_rx_refill() skips the replacement
> allocation and programs the already-recycled page back into the RX
> descriptor.
> 
> Clear buf->page on the napi_build_skb() failure path to keep the buffer
> lifecycle consistent with the other consumption sites.
> 
> Fixes: df542f669307 ("net: stmmac: Switch to zero-copy in non-XDP RX path")
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 1fb5f804ea23..11035b7d944e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -5887,6 +5887,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
>  			if (!skb) {
>  				page_pool_recycle_direct(rx_q->page_pool,
>  							 buf->page);
> +				buf->page = NULL;
>  				rx_dropped++;
>  				count++;
>  				goto drain_data;

I'm not expert in the page_pool API, but this seems correct to me, the
doc says :

page_pool_recycle_direct() - release a reference on a page pool page

Seems to make sense to cleare the ref from buf->then ?

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> 
> ---
> base-commit: 1e24c4f2ee44be0eee94092b5d13cbdb4bdf0d60
> change-id: 20260921-stmmac-fix-napi-build-skb-error-a02a3e839bd9
> 
> Best regards,


