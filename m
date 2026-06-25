Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A8ACDE00E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 22:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=; b=mOb9w35XDvnnlg8EWteBCEdshi
	rMExC54f1i6H6M19JGsTWR2Lax7yqR872MiBAXslNHQljSfqQD0uEhAzeTZZZfGMF4+jehSrJBwpK
	t1hbt5naC6Vh3NfD+5Ei6ikJYHo8hxOoe+3yKEeMp2COi/wjrb8745IUAhChhcgpClccPjAgxMHpi
	xWMCk3o32E0TG9eDaaSW8Hmd4XSS+TijRQ3jKm8iw2AvMPm/SiEl5u6dtFPxWBGq1hrl0iG4yYaq+
	KGlC9Jw6w/P5CS74js1XWgnTaEhJUYTjHzuUFe558zUw/+anXx0WPQPivMI+XT6Ga0bMKRsGwYGdf
	ZZyb8Qww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wct2e-00000009xnx-0WRZ;
	Thu, 25 Jun 2026 22:59:28 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wct2a-00000009xnC-3uN8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 22:59:26 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c813a45a65so8225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Jun 2026 15:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782428363; cv=none;
        d=google.com; s=arc-20260327;
        b=DC72QhK9n5soxdPCn1cG9G93Gh2l/gIo+bR0V/MmdWr5YyAAebaaOhpIVZ5WwbBRi9
         5cIR+jUDaQS0W+K2s5lk1Bcfr/oUqUFPxhp4BhP0/Db2sVMpGklsbjeGOAebywsESCTn
         6tAwnC3T5KhEJaIOFHpSsbX1cyB3N6i7SgFevp4/vdXM/GI89I8H15x/iUarHpKDrx3P
         //ZYIQxRRfA3WtqO7hpkqzWBA/WyHpvbfAVKR+4RaW8TP5h3E0N0Jk4uYPIx1aXv6u/n
         miBwK7tqgKk1pjjmFmoFhO0iKEmE07S+TrB+iiRMYsRPp4W+sOKALxlH0SdQre57D/kH
         8guw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        fh=g1FBqZqoeQYFwQm/QXU/MwSXpWSaI0z0SIz+28LvI9w=;
        b=KjrA5cybsqeFQks47KTWkfOgGzhZsZVSR8q4cDXXCcFyT5Stq7Gms154XiDWTz7GD3
         Xjc/eNnetvs27PRjq11jsIbmMnNHt9/ZImQV/M7np93hNntZZN9/ZYcCrFRwOD2O9I1G
         zetiE26TxuTGUKHbQxM8/ExmNi0jHK/uQMpQVb3BZyNrtEPqzI8W4q/zalxNlSV/iR05
         5lMrEDbisc126t2l/LH6zwnHkPwEHGQBQ35877eEhw+oSfrBndL5OhyadbKGyNYgTZrI
         LKH6SQoWUyOjIbC7dKRmdQtnG5fEOYNh5grhCONG4dN7UbUrh4rrhyNmYz1ViJQfxX1n
         2Kug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782428363; x=1783033163; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        b=JSUeu97WuF1NxcYGKJZ3+OjcVCjTWhDzPVj0TixTAnSNW95O93n00nw1x+cUMmtPxd
         W2Ls7IyDw5Lg4xqxitO6BllHoZzPc8ut0oT0MA/9+dR3ezN7vwtPcWWWL/Dy805R2whM
         0Fa+ZnOzC/SEnFr5wVds+APYa68K/vHLTI+MEEZd8UimZFRIu7YJdwRxmKVIxhcOFbm5
         bd4IpWozeHTjmPlVhbIiyETfFmcJjDM2RiLIsSoYOtU+g/Ol7Bm7TBQbHI/5QN0F4N9u
         kIEXgLiK5t4enP14lK/0BK/pBmzgdVILPD1NbOuQ2XaJO7GjgP/JvBSuMkXrD+F3b0hQ
         kD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782428363; x=1783033163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/gX7hQHyvfb4Ci0nY3Fxsfc2Doou++pLUQ8Pual9WtQ=;
        b=W2c+W8oNaALy6dX++BBB8Wui0s9GNbhwNLDczfU93ShC1cHWD08NmZqvOJ/PNqdLCY
         6nXjpT3OM2+kQJOTkUHCnMF3Dx6DXznsPCE8FmalKRMJil4Rc/3iYTKnXJBNTIhex6kC
         +ZCPmW5b8MoFxG2knvjZC+86HfRokOA88sFDZ5GRutx2oUo8qBMq2WPHtSAnqvoDWa2A
         Jv8CQhoRQq/A+9mIUh9XI1iEu972T5XE37zbMi9AxRbgvyBF4DRqCRReNb2LNl5Q3exA
         yfijtKZFhnRgC2VezBxgsX+V1nSqVNMz9Vue1bKu3ziyemYzy92fUdXK6V+z4qAg3GOg
         k+IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpW+Xk5ekfqe6jEqfaupA5Pq3WJ58QnY5Y3as6s3tXZoTSKYLxQsW82K67H2X+QWFm6Acw3tD78szjVKDm5pjlD@lists.infradead.org
X-Gm-Message-State: AOJu0YzlslEFFu8HaQtKscfxm+3rulUcvQSvRV+t+wLu10bur6gmL4vD
	3jTsGeGut0yGxlpYpJDUMqICWl5N38r6tzRcjeYe9/W0V7114CLChpGPFhR69YZcdxz/4gtQpMS
	lgL+plIkIM0TiUC6nSfK8clAq9+nJGcQRud+z00b2
X-Gm-Gg: AfdE7cmVb/W5d1XwAb9Ulev4SbfaMWwBahLkTkCvN87fqhj+7dXtG0HjTTKJY9g/Fw2
	kvsJyNzN8JJh10aq9D/umWSiuWcR11hk6MdHIHmiAgd00Zk9DUgriLj9zrkfhA7vYOVE39kbgjD
	kORcisJAH5+38EYgaFnjIcIhqlPj9O+7hFQnO4AvoMRA3Cdp7qPUrKOgPuKd0B4e9FvR7gmsDK3
	/ctoMO7AdNsWl96nqzhFze1Bwfs4QZngZaDXsCPW1vKI+qccVR8Rf9KpBHDmlAwaiF3ndZMWTbP
	cNx54lOua9ExLSyo/JnBwoBB56e89WOeHHd3y5Vo+yS4moeBIvDabM39SZzPuyq5HvO+Il4=
X-Received: by 2002:a17:902:fc4d:b0:2bf:193b:a195 with SMTP id
 d9443c01a7336-2c813e4f6c6mr855945ad.11.1782428362363; Thu, 25 Jun 2026
 15:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
In-Reply-To: <20260625-airoha-eth-skb_frag_dma_map-v1-1-31d9e460aae6@kernel.org>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Thu, 25 Jun 2026 15:59:10 -0700
X-Gm-Features: AVVi8CeiefQknrcxxwnBcBr19FhEdmLlZYqiKgArFjpWRrvJ_M8y2FZe1GT04Ic
Message-ID: <CAEAWyHfyWrSdKziDg3SOnx3QRfd6uu6YXtJV85OgqWEQSJykmQ@mail.gmail.com>
Subject: Re: [PATCH net] net: airoha: dma map xmit frags with skb_frag_dma_map()
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_155924_987340_97ECCBE6 
X-CRM114-Status: GOOD (  24.25  )
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

On Thu, Jun 25, 2026 at 2:43=E2=80=AFAM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:
>
> Map xmit skb fragments using skb_frag_dma_map() instead of
> dma_map_single(skb_frag_address()). skb_frag_address() relies on
> page_address() to obtain a kernel virtual address, which is not
> guaranteed to work for all page types (e.g. highmem pages or
> user-pinned pages from MSG_ZEROCOPY).
> skb_frag_dma_map() maps the fragment directly via its struct page and
> offset through dma_map_page(), avoiding the need for a kernel virtual
> address entirely.
> Introduce an enum airoha_dma_map_type to track how each queue entry was
> mapped (single vs page), so that the matching unmap function is called
> on completion and in error paths.
>
> Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 =
SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 61 ++++++++++++++++++++------=
------
>  drivers/net/ethernet/airoha/airoha_eth.h |  7 ++++
>  2 files changed, 45 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 932b3a3df2e5..1caf6766f2c0 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -944,6 +944,25 @@ static void airoha_qdma_wake_netdev_txqs(struct airo=
ha_queue *q)
>         q->txq_stopped =3D false;
>  }
>
> +static void airoha_unmap_xmit_buf(struct airoha_eth *eth,
> +                                 struct airoha_queue_entry *e)
> +{
> +       switch (e->dma_type) {
> +       case AIROHA_DMA_MAP_PAGE:
> +               dma_unmap_page(eth->dev, e->dma_addr, e->dma_len,
> +                              DMA_TO_DEVICE);
> +               break;
> +       case AIROHA_DMA_MAP_SINGLE:
> +               dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> +                                DMA_TO_DEVICE);
> +               break;
> +       case AIROHA_DMA_UNMAPPED:
> +       default:
> +               break;
> +       }
> +       e->dma_type =3D AIROHA_DMA_UNMAPPED;
> +}
> +
>  static int airoha_qdma_tx_napi_poll(struct napi_struct *napi, int budget=
)
>  {
>         struct airoha_tx_irq_queue *irq_q;
> @@ -1006,9 +1025,7 @@ static int airoha_qdma_tx_napi_poll(struct napi_str=
uct *napi, int budget)
>                 skb =3D e->skb;
>                 e->skb =3D NULL;
>
> -               dma_unmap_single(eth->dev, e->dma_addr, e->dma_len,
> -                                DMA_TO_DEVICE);
> -               e->dma_addr =3D 0;
> +               airoha_unmap_xmit_buf(eth, e);
>                 list_add_tail(&e->list, &q->tx_list);
>
>                 WRITE_ONCE(desc->msg0, 0);
> @@ -1177,12 +1194,10 @@ static void airoha_qdma_tx_cleanup(struct airoha_=
qdma *qdma)
>                         struct airoha_qdma_desc *desc =3D &q->desc[j];
>                         struct sk_buff *skb =3D e->skb;
>
> -                       if (!e->dma_addr)
> +                       if (e->dma_type =3D=3D AIROHA_DMA_UNMAPPED)
>                                 continue;
>
> -                       dma_unmap_single(qdma->eth->dev, e->dma_addr,
> -                                        e->dma_len, DMA_TO_DEVICE);
> -                       e->dma_addr =3D 0;
> +                       airoha_unmap_xmit_buf(qdma->eth, e);
>                         list_add_tail(&e->list, &q->tx_list);
>
>                         WRITE_ONCE(desc->ctrl, 0);
> @@ -2193,8 +2208,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>         struct netdev_queue *txq;
>         struct airoha_queue *q;
>         LIST_HEAD(tx_list);
> +       dma_addr_t addr;
>         int i =3D 0, qid;
> -       void *data;
>         u16 index;
>         u8 fport;
>
> @@ -2250,24 +2265,22 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff=
 *skb,
>                 return NETDEV_TX_BUSY;
>         }
>
> -       len =3D skb_headlen(skb);
> -       data =3D skb->data;
> -
>         e =3D list_first_entry(&q->tx_list, struct airoha_queue_entry,
>                              list);
> +       len =3D skb_headlen(skb);
> +       addr =3D dma_map_single(netdev->dev.parent, skb->data, len,
> +                             DMA_TO_DEVICE);
> +       if (unlikely(dma_mapping_error(netdev->dev.parent, addr)))
> +               goto error_unlock;
> +
> +       e->dma_type =3D AIROHA_DMA_MAP_SINGLE;
>         index =3D e - q->entry;
>
>         while (true) {
>                 struct airoha_qdma_desc *desc =3D &q->desc[index];
>                 skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> -               dma_addr_t addr;
>                 u32 val;
>
> -               addr =3D dma_map_single(netdev->dev.parent, data, len,
> -                                     DMA_TO_DEVICE);
> -               if (unlikely(dma_mapping_error(netdev->dev.parent, addr))=
)
> -                       goto error_unmap;
> -
>                 list_move_tail(&e->list, &tx_list);
>                 e->skb =3D i =3D=3D nr_frags - 1 ? skb : NULL;
>                 e->dma_addr =3D addr;
> @@ -2291,8 +2304,13 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff =
*skb,
>                 if (++i =3D=3D nr_frags)
>                         break;
>
> -               data =3D skb_frag_address(frag);
>                 len =3D skb_frag_size(frag);
> +               addr =3D skb_frag_dma_map(netdev->dev.parent, frag, 0, le=
n,
> +                                       DMA_TO_DEVICE);
> +               if (unlikely(dma_mapping_error(netdev->dev.parent, addr))=
)
> +                       goto error_unmap;
> +
> +               e->dma_type =3D AIROHA_DMA_MAP_PAGE;
>         }
>         q->queued +=3D i;
>
> @@ -2313,11 +2331,8 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff =
*skb,
>         return NETDEV_TX_OK;
>
>  error_unmap:
> -       list_for_each_entry(e, &tx_list, list) {
> -               dma_unmap_single(netdev->dev.parent, e->dma_addr, e->dma_=
len,
> -                                DMA_TO_DEVICE);
> -               e->dma_addr =3D 0;
> -       }
> +       list_for_each_entry(e, &tx_list, list)
> +               airoha_unmap_xmit_buf(dev->eth, e);
>         list_splice(&tx_list, &q->tx_list);
>  error_unlock:
>         spin_unlock_bh(&q->lock);
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index d7ff8c5200e2..2765244d937c 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -170,12 +170,19 @@ enum trtcm_param {
>  #define TRTCM_TOKEN_RATE_MASK                  GENMASK(23, 6)
>  #define TRTCM_TOKEN_RATE_FRACTION_MASK         GENMASK(5, 0)
>
> +enum airoha_dma_map_type {
> +       AIROHA_DMA_UNMAPPED,
> +       AIROHA_DMA_MAP_SINGLE,
> +       AIROHA_DMA_MAP_PAGE,
> +};
> +
>  struct airoha_queue_entry {
>         union {
>                 void *buf;
>                 struct {
>                         struct list_head list;
>                         struct sk_buff *skb;
> +                       enum airoha_dma_map_type dma_type;
>                 };
>         };
>         dma_addr_t dma_addr;
>
> ---
> base-commit: 232c4ca2343d1181cbfc061f9856d9591e397579
> change-id: 20260625-airoha-eth-skb_frag_dma_map-bcccd5d6e4b1
>
> Best regards,
> --
> Lorenzo Bianconi <lorenzo@kernel.org>
>
>

