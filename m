Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4952C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 12:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwJmXPh0UZn8nk0X5v3R0BkMm6bGB9ygKP2kfBs4kzg=; b=XgbUqofQ0lDb7H1Nvopcv0neQz
	S5rO7Q2rS1ihrv+ws4uUaPciC5/UlFfI16iDQVT6nf6I2EA8BCASNCnT6A/4rIE2rkzLVK2aJYi5d
	5Bmx+f90KuqAq75DUwUxvVN4qjxB9Kveac/FPznd2g5zeNZqTXqc+PhZRyKfB6RavRn+e8fHAoZA5
	ceIs1rVatA9pMPJawvbkr6SQ+Wiqoo0f/NXeOnUirvdy8i5ID8Ho3o3/3Fc0aLoROsO5GIX39X+PG
	I+/5QTzHu7X4TXwvQ+RG2kOloYTKDFy5T9I0+wKI2yuEUriXO23+UlmI4Cx6lhk94mOOZ1N/EJYs6
	+IfoNCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3kf-0000000E5y6-3xJH;
	Fri, 14 Mar 2025 12:02:57 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3ix-0000000E5U5-39FU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 12:01:14 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-6fedf6aaed2so19152977b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 05:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741953670; x=1742558470; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwJmXPh0UZn8nk0X5v3R0BkMm6bGB9ygKP2kfBs4kzg=;
        b=SRd7gW1mxd1JtVXeiJbn7tlJwBGrPLMVglvYR6xdkCAFAu7tOCOrr15l8HWdNhF0Md
         mLquWR9KAh55D/2NPPe+GM3v457+3+OsVVClssFDjw7MremGfY0g3bigMz7et+Wv4+5P
         L81oHqtCG3Qg2EWWeZ+gksEzSVEkaTK49EhLui8dsEZfQPPLR1QMIqmnXfrEFe/HKiDx
         zoCc0oiNC1rym6zYL52V45xQkeXtg5RFcX1bcHgXWRFEelQ1OcYZq2pCF5T2C9wqWSEQ
         Vqe/6SdJI569hIX1MezgwlIpoAspsjRCACQUG92I96R+x3o9I+o+W5Rrxc/eibFnVuX9
         h/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741953670; x=1742558470;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwJmXPh0UZn8nk0X5v3R0BkMm6bGB9ygKP2kfBs4kzg=;
        b=sqfm7BECoO8iFIPojWgxhKD770PUcIenP5WH0j6ycgIk25kQtFjEICjJgfmP6u13Y2
         no69W2BVWSn/CNSmIM/bh/oDjPgqYSrpxTVSNpOIjJFxgy2fdSPeuOKm+fZWyoBZ4NIH
         5PXtuMadRX0pxJ+LbQASraRtiTQmlBa6GAw6ebWQBn2c2yahbygxwk4E0+oiKXRMJmc7
         AcO/MnfZAc26EJOfLq83Q0cUtPoqPKI3A2f8NVfF1iwHs8FIDFnfuFvNXGpzdPOIAbdR
         SV3BWpi2YtmkRC3MkPCab1v32zqBCKch3zzHZOHn8hPQrcGkp8+iU4Jo0/3/jyV5uGyo
         mMkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjmyQimE1mFiB+pZaoDT7x+wyOA7V2vZ2ntLwDPn8iioghIqd76GJqpKPZSkgZR5eV6xpJ4ylNphr2XM6VBpLS@lists.infradead.org
X-Gm-Message-State: AOJu0YwFi1wOk6wgdrx2B2ssVUkd0GSwZC0CHOjdH1kLevg/ho1k25hj
	p0V2aGAl7H4NnZ9g7/fVOg+34fPebEhxKm8PLtBCohi/u0GxIaBNYY97q8/ITYQjt+vN0BwX56J
	D9wIjr1cu8VVksVHTTEkY1G4tOwuOnzNI7AkhkQ==
X-Gm-Gg: ASbGncvT3vyVHQRcSABtnj0AFKGFJd9wfvCMvDj4Y+7Kdk26c9c1UU3tmcr+/UN5Rej
	/SsOXFM/+CwiDGJugH4mXYG7YsGGs0g2wwxkUh3B22vzN79MQhhfkb20aA77cBR68Zmqg+B+W50
	BqKtAG2eimshZZpx6zeHrelkms6fw=
X-Google-Smtp-Source: AGHT+IGZZCcwY5/1JbZjTo0RWJ2K/xyqiqYRIB+WoabIYLpe9OvKoQa822klhbBDtTeF2wPU+BJ9g+hqI+KNvuehlJ8=
X-Received: by 2002:a05:690c:4c0a:b0:6f9:47ad:f5f1 with SMTP id
 00721157ae682-6ff4641f8cfmr21140237b3.17.1741953670170; Fri, 14 Mar 2025
 05:01:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250311-mvneta-xdp-meta-v1-0-36cf1c99790e@kernel.org> <20250311-mvneta-xdp-meta-v1-3-36cf1c99790e@kernel.org>
In-Reply-To: <20250311-mvneta-xdp-meta-v1-3-36cf1c99790e@kernel.org>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 14 Mar 2025 14:00:33 +0200
X-Gm-Features: AQ5f1JqD4PpWF9sD-c3WrV8oOlJztNLgYA2GJMvNudQfJQpIo6DpWKsJUUlKuVc
Message-ID: <CAC_iWjKRLs4POP3TQ0XrXUiBmW0D5qD0JYh=UxqAytXjPvRmGw@mail.gmail.com>
Subject: Re: [PATCH net-next 3/7] net: netsec: Add metadata support for xdp mode
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Marcin Wojtas <marcin.s.wojtas@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Masahisa Kojima <kojima.masahisa@socionext.com>, Sunil Goutham <sgoutham@marvell.com>, 
	Geetha sowjanya <gakula@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	hariprasad <hkelam@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Felix Fietkau <nbd@nbd.name>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-hyperv@vger.kernel.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_050111_789951_2767E90C 
X-CRM114-Status: GOOD (  17.05  )
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

On Tue, 11 Mar 2025 at 14:19, Lorenzo Bianconi <lorenzo@kernel.org> wrote:
>
> Set metadata size building the skb from xdp_buff in netsec driver
>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/socionext/netsec.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
> index dc99821c6226fbaece65c8ade23899f610b44a9a..ee890de69ffe795dbdcc5331e36be86769f0d9a6 100644
> --- a/drivers/net/ethernet/socionext/netsec.c
> +++ b/drivers/net/ethernet/socionext/netsec.c
> @@ -970,7 +970,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>                 struct netsec_de *de = dring->vaddr + (DESC_SZ * idx);
>                 struct netsec_desc *desc = &dring->desc[idx];
>                 struct page *page = virt_to_page(desc->addr);
> -               u32 xdp_result = NETSEC_XDP_PASS;
> +               u32 metasize, xdp_result = NETSEC_XDP_PASS;
>                 struct sk_buff *skb = NULL;
>                 u16 pkt_len, desc_len;
>                 dma_addr_t dma_handle;
> @@ -1019,7 +1019,7 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>                 prefetch(desc->addr);
>
>                 xdp_prepare_buff(&xdp, desc->addr, NETSEC_RXBUF_HEADROOM,
> -                                pkt_len, false);
> +                                pkt_len, true);
>
>                 if (xdp_prog) {
>                         xdp_result = netsec_run_xdp(priv, xdp_prog, &xdp);
> @@ -1048,6 +1048,9 @@ static int netsec_process_rx(struct netsec_priv *priv, int budget)
>
>                 skb_reserve(skb, xdp.data - xdp.data_hard_start);
>                 skb_put(skb, xdp.data_end - xdp.data);
> +               metasize = xdp.data - xdp.data_meta;
> +               if (metasize)
> +                       skb_metadata_set(skb, metasize);
>                 skb->protocol = eth_type_trans(skb, priv->ndev);
>
>                 if (priv->rx_cksum_offload_flag &&
>
> --
> 2.48.1
>

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>

