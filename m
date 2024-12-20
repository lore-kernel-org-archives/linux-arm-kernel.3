Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 12:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmRCmaPkLkPswmKEyB/ZICUJHMBmUsSjq9Yct5NQ1ro=; b=f/Wx1DIPJbwISCCOyibHPmwTby
	b3RUrRQOYhrEV+2Y990iYFAS9fdBJp4zeTUn2l2dViX4mMOYWFQoejFZsHsboH4YtP0dtp9cRbIA0
	qwaoZiq7feV4hNAiBlxnhzhGQGXJmUAtir3qiRdkwK7tYE2e+rtSJmDl8BmhkVJLqNsRoPkzwHNCT
	wCmlBlG0PCiEz1b3YTJA4IHAasQ1gfahbokO0DDo8N9hMnHODVrWTkJjNf0kboXOLeIV9rHjVr2EJ
	iO4M7u2owVvPTOXZlOeW8eG5T/JGC/w1b04M4bxgky2FS8xZvOFKwZNp2Y79SmLvoHvoZPMt2FU/1
	360sL7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOc9v-00000004taD-1XLn;
	Fri, 20 Dec 2024 12:31:11 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOc8j-00000004tQ0-2vRG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 12:29:59 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e3983426f80so1469011276.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734697796; x=1735302596; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VmRCmaPkLkPswmKEyB/ZICUJHMBmUsSjq9Yct5NQ1ro=;
        b=Jx4TVj9R6vIfaFrIs36YOvbtIDnicXxMhK/7RJHP87yjkaTbr6JxL2stR9Fw4WeGHz
         9P43w9rOF5n2ZDeHGjANbeOIM9XTqDfDhoeo2cmdburNejvmfJR6u5nCPASOrK92UlXK
         eo9FdNnf35mqgGyw5E3AmbZI02V3wW30HP4rIZb8i1dOeDxBesxWVZc162/td7CSJmv2
         r9K26rIAekKBaU6iDpwF+DEyhEQoK1vblTZ/kmOcgy4/p/BrXFAworGERMdVWdt2ZC6Q
         A5QlORqQNkYcqLpWjiXo/oVdrSIRQmEts+OPq/BtcTF259Bzev31lgL/O7jQL1GbfjhY
         hmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734697796; x=1735302596;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VmRCmaPkLkPswmKEyB/ZICUJHMBmUsSjq9Yct5NQ1ro=;
        b=Uf0VYA0yE7x1mYZFuXM6JqQP5HAHWMTmjVldI4Jp5m0e8Dm1OfM/USI7mQ6NSi/jRU
         YKJIKO0SjCyU+tYZ/spiAKmeMz2BKeypi/CKhDM29f1Kb/F7lbsURsd0SNMYHYtPll2M
         idtq6KI2aIWVNBTPu00PojBp7piua+4p41kpJ3Jt+Tx0idc7QFn6bP8GSVkagonfrkaI
         5G6Hmhkc7O/0esDBTCEdfu8v69Jxh8ZQGYGTDH2xpkNCiFoDyM/bxCu4yd4avqHYbkOG
         umHSD4XzkotgfyJ6yCxfFp3ljCJ1nIEwBY84miE/siaqha1z8XO1Og/qJW8KunrKhBWu
         K2aA==
X-Forwarded-Encrypted: i=1; AJvYcCVH3KgI7wZzPhF1C77XuZ+SpCh9rTorCIYQYD88gNWvfE5uytNf9D1ceycWAwKk1GBO2lkUMXBe0h6nUHUy7tyf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8BBCaS1vO7fzzvPH/sUe7JId8Wats3r/3U8Ue6/vbJtmOA/k7
	JfxSkzTt9SoRsgTORqCkFY6wKCM5wrGzTpEL5oUiJqK5jR2Z7qWL5QLXuC5iYjH+xii98EvTBB4
	YZkLMU4rCu41hZ93VPBkRHL2+eCFgfRkebSkGCQ==
X-Gm-Gg: ASbGncuF4f4HheJPNrRkGx7ySUnAvM2ZDwzhpLuorTMKat0D9RzyBLiXdg55HD/pFAV
	2j5EAI7VdnOohXaNUvFWTkfZRfnwj3MYSjYhwoQ==
X-Google-Smtp-Source: AGHT+IGSsUG4iSnRRcdUuCq27bUw63jRg+t86G+uWqSkEhiBTf+pNCH23b3m4irAGr9UmyGYIOuuYUx3ncEVJac77D0=
X-Received: by 2002:a05:6902:982:b0:e3c:8ec9:c896 with SMTP id
 3f1490d57ef6-e538c350d10mr1981319276.34.1734697795572; Fri, 20 Dec 2024
 04:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20241213122739.4050137-1-linyunsheng@huawei.com> <20241213122739.4050137-2-linyunsheng@huawei.com>
In-Reply-To: <20241213122739.4050137-2-linyunsheng@huawei.com>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Fri, 20 Dec 2024 14:29:19 +0200
Message-ID: <CAC_iWj+3Q7CAS3xH9+zWA7nXdFNSJ-XMKQB3ZT0YvUQ-Q2gMCQ@mail.gmail.com>
Subject: Re: [PATCH RFCv5 1/8] page_pool: introduce page_pool_to_pp() API
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	somnath.kotur@broadcom.com, liuyonglong@huawei.com, fanghaiqing@huawei.com, 
	zhangkun09@huawei.com, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	Jeroen de Borst <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>, 
	Shailend Chand <shailend@google.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Simon Horman <horms@kernel.org>, 
	imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, bpf@vger.kernel.org, 
	linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_042957_738587_F770C05E 
X-CRM114-Status: GOOD (  24.12  )
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

Hi Yunsheng,

On Fri, 13 Dec 2024 at 14:35, Yunsheng Lin <linyunsheng@huawei.com> wrote:
>
> introduce page_pool_to_pp() API to avoid caller accessing
> page->pp directly.
>

I think we already have way too many abstractions, I'd say we need
less not more. I don't know what others think, but I don't see what we
gain from this

Thanks
/Ilias
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> ---
>  drivers/net/ethernet/freescale/fec_main.c          |  8 +++++---
>  .../net/ethernet/google/gve/gve_buffer_mgmt_dqo.c  |  2 +-
>  drivers/net/ethernet/intel/iavf/iavf_txrx.c        |  6 ++++--
>  drivers/net/ethernet/intel/idpf/idpf_txrx.c        | 14 +++++++++-----
>  drivers/net/ethernet/intel/libeth/rx.c             |  2 +-
>  drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c   |  3 ++-
>  drivers/net/netdevsim/netdev.c                     |  6 ++++--
>  drivers/net/wireless/mediatek/mt76/mt76.h          |  2 +-
>  include/net/libeth/rx.h                            |  3 ++-
>  include/net/page_pool/helpers.h                    |  5 +++++
>  net/core/skbuff.c                                  |  3 ++-
>  net/core/xdp.c                                     |  3 ++-
>  12 files changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
> index 1b55047c0237..98fce41d088c 100644
> --- a/drivers/net/ethernet/freescale/fec_main.c
> +++ b/drivers/net/ethernet/freescale/fec_main.c
> @@ -1009,7 +1009,8 @@ static void fec_enet_bd_init(struct net_device *dev)
>                                 struct page *page = txq->tx_buf[i].buf_p;
>
>                                 if (page)
> -                                       page_pool_put_page(page->pp, page, 0, false);
> +                                       page_pool_put_page(page_pool_to_pp(page),
> +                                                          page, 0, false);
>                         }
>
>                         txq->tx_buf[i].buf_p = NULL;
> @@ -1549,7 +1550,7 @@ fec_enet_tx_queue(struct net_device *ndev, u16 queue_id, int budget)
>                         xdp_return_frame_rx_napi(xdpf);
>                 } else { /* recycle pages of XDP_TX frames */
>                         /* The dma_sync_size = 0 as XDP_TX has already synced DMA for_device */
> -                       page_pool_put_page(page->pp, page, 0, true);
> +                       page_pool_put_page(page_pool_to_pp(page), page, 0, true);
>                 }
>
>                 txq->tx_buf[index].buf_p = NULL;
> @@ -3311,7 +3312,8 @@ static void fec_enet_free_buffers(struct net_device *ndev)
>                         } else {
>                                 struct page *page = txq->tx_buf[i].buf_p;
>
> -                               page_pool_put_page(page->pp, page, 0, false);
> +                               page_pool_put_page(page_pool_to_pp(page),
> +                                                  page, 0, false);
>                         }
>
>                         txq->tx_buf[i].buf_p = NULL;
> diff --git a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> index 403f0f335ba6..db5926152c72 100644
> --- a/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> +++ b/drivers/net/ethernet/google/gve/gve_buffer_mgmt_dqo.c
> @@ -210,7 +210,7 @@ void gve_free_to_page_pool(struct gve_rx_ring *rx,
>         if (!page)
>                 return;
>
> -       page_pool_put_full_page(page->pp, page, allow_direct);
> +       page_pool_put_full_page(page_pool_to_pp(page), page, allow_direct);
>         buf_state->page_info.page = NULL;
>  }
>
> diff --git a/drivers/net/ethernet/intel/iavf/iavf_txrx.c b/drivers/net/ethernet/intel/iavf/iavf_txrx.c
> index 26b424fd6718..658d8f9a6abb 100644
> --- a/drivers/net/ethernet/intel/iavf/iavf_txrx.c
> +++ b/drivers/net/ethernet/intel/iavf/iavf_txrx.c
> @@ -1050,7 +1050,8 @@ static void iavf_add_rx_frag(struct sk_buff *skb,
>                              const struct libeth_fqe *rx_buffer,
>                              unsigned int size)
>  {
> -       u32 hr = rx_buffer->page->pp->p.offset;
> +       struct page_pool *pool = page_pool_to_pp(rx_buffer->page);
> +       u32 hr = pool->p.offset;
>
>         skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, rx_buffer->page,
>                         rx_buffer->offset + hr, size, rx_buffer->truesize);
> @@ -1067,7 +1068,8 @@ static void iavf_add_rx_frag(struct sk_buff *skb,
>  static struct sk_buff *iavf_build_skb(const struct libeth_fqe *rx_buffer,
>                                       unsigned int size)
>  {
> -       u32 hr = rx_buffer->page->pp->p.offset;
> +       struct page_pool *pool = page_pool_to_pp(rx_buffer->page);
> +       u32 hr = pool->p.offset;
>         struct sk_buff *skb;
>         void *va;
>
> diff --git a/drivers/net/ethernet/intel/idpf/idpf_txrx.c b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> index da2a5becf62f..38ad32678bcc 100644
> --- a/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> +++ b/drivers/net/ethernet/intel/idpf/idpf_txrx.c
> @@ -385,7 +385,8 @@ static void idpf_rx_page_rel(struct libeth_fqe *rx_buf)
>         if (unlikely(!rx_buf->page))
>                 return;
>
> -       page_pool_put_full_page(rx_buf->page->pp, rx_buf->page, false);
> +       page_pool_put_full_page(page_pool_to_pp(rx_buf->page), rx_buf->page,
> +                               false);
>
>         rx_buf->page = NULL;
>         rx_buf->offset = 0;
> @@ -3097,7 +3098,8 @@ idpf_rx_process_skb_fields(struct idpf_rx_queue *rxq, struct sk_buff *skb,
>  void idpf_rx_add_frag(struct idpf_rx_buf *rx_buf, struct sk_buff *skb,
>                       unsigned int size)
>  {
> -       u32 hr = rx_buf->page->pp->p.offset;
> +       struct page_pool *pool = page_pool_to_pp(rx_buf->page);
> +       u32 hr = pool->p.offset;
>
>         skb_add_rx_frag(skb, skb_shinfo(skb)->nr_frags, rx_buf->page,
>                         rx_buf->offset + hr, size, rx_buf->truesize);
> @@ -3129,8 +3131,10 @@ static u32 idpf_rx_hsplit_wa(const struct libeth_fqe *hdr,
>         if (!libeth_rx_sync_for_cpu(buf, copy))
>                 return 0;
>
> -       dst = page_address(hdr->page) + hdr->offset + hdr->page->pp->p.offset;
> -       src = page_address(buf->page) + buf->offset + buf->page->pp->p.offset;
> +       dst = page_address(hdr->page) + hdr->offset +
> +               page_pool_to_pp(hdr->page)->p.offset;
> +       src = page_address(buf->page) + buf->offset +
> +               page_pool_to_pp(buf->page)->p.offset;
>         memcpy(dst, src, LARGEST_ALIGN(copy));
>
>         buf->offset += copy;
> @@ -3148,7 +3152,7 @@ static u32 idpf_rx_hsplit_wa(const struct libeth_fqe *hdr,
>   */
>  struct sk_buff *idpf_rx_build_skb(const struct libeth_fqe *buf, u32 size)
>  {
> -       u32 hr = buf->page->pp->p.offset;
> +       u32 hr = page_pool_to_pp(buf->page)->p.offset;
>         struct sk_buff *skb;
>         void *va;
>
> diff --git a/drivers/net/ethernet/intel/libeth/rx.c b/drivers/net/ethernet/intel/libeth/rx.c
> index f20926669318..385afca0e61d 100644
> --- a/drivers/net/ethernet/intel/libeth/rx.c
> +++ b/drivers/net/ethernet/intel/libeth/rx.c
> @@ -207,7 +207,7 @@ EXPORT_SYMBOL_NS_GPL(libeth_rx_fq_destroy, LIBETH);
>   */
>  void libeth_rx_recycle_slow(struct page *page)
>  {
> -       page_pool_recycle_direct(page->pp, page);
> +       page_pool_recycle_direct(page_pool_to_pp(page), page);
>  }
>  EXPORT_SYMBOL_NS_GPL(libeth_rx_recycle_slow, LIBETH);
>
> diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
> index 94b291662087..78866b5473da 100644
> --- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
> +++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
> @@ -716,7 +716,8 @@ static void mlx5e_free_xdpsq_desc(struct mlx5e_xdpsq *sq,
>                                 /* No need to check ((page->pp_magic & ~0x3UL) == PP_SIGNATURE)
>                                  * as we know this is a page_pool page.
>                                  */
> -                               page_pool_recycle_direct(page->pp, page);
> +                               page_pool_recycle_direct(page_pool_to_pp(page),
> +                                                        page);
>                         } while (++n < num);
>
>                         break;
> diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
> index 0be47fed4efc..088f4836a0e2 100644
> --- a/drivers/net/netdevsim/netdev.c
> +++ b/drivers/net/netdevsim/netdev.c
> @@ -632,7 +632,8 @@ nsim_pp_hold_write(struct file *file, const char __user *data,
>                 if (!ns->page)
>                         ret = -ENOMEM;
>         } else {
> -               page_pool_put_full_page(ns->page->pp, ns->page, false);
> +               page_pool_put_full_page(page_pool_to_pp(ns->page), ns->page,
> +                                       false);
>                 ns->page = NULL;
>         }
>         rtnl_unlock();
> @@ -831,7 +832,8 @@ void nsim_destroy(struct netdevsim *ns)
>
>         /* Put this intentionally late to exercise the orphaning path */
>         if (ns->page) {
> -               page_pool_put_full_page(ns->page->pp, ns->page, false);
> +               page_pool_put_full_page(page_pool_to_pp(ns->page), ns->page,
> +                                       false);
>                 ns->page = NULL;
>         }
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
> index 0b75a45ad2e8..94a277290909 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
> @@ -1688,7 +1688,7 @@ static inline void mt76_put_page_pool_buf(void *buf, bool allow_direct)
>  {
>         struct page *page = virt_to_head_page(buf);
>
> -       page_pool_put_full_page(page->pp, page, allow_direct);
> +       page_pool_put_full_page(page_pool_to_pp(page), page, allow_direct);
>  }
>
>  static inline void *
> diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
> index 43574bd6612f..beee7ddd77a5 100644
> --- a/include/net/libeth/rx.h
> +++ b/include/net/libeth/rx.h
> @@ -137,7 +137,8 @@ static inline bool libeth_rx_sync_for_cpu(const struct libeth_fqe *fqe,
>                 return false;
>         }
>
> -       page_pool_dma_sync_for_cpu(page->pp, page, fqe->offset, len);
> +       page_pool_dma_sync_for_cpu(page_pool_to_pp(page), page, fqe->offset,
> +                                  len);
>
>         return true;
>  }
> diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
> index 793e6fd78bc5..1659f1995985 100644
> --- a/include/net/page_pool/helpers.h
> +++ b/include/net/page_pool/helpers.h
> @@ -83,6 +83,11 @@ static inline u64 *page_pool_ethtool_stats_get(u64 *data, const void *stats)
>  }
>  #endif
>
> +static inline struct page_pool *page_pool_to_pp(struct page *page)
> +{
> +       return page->pp;
> +}
> +
>  /**
>   * page_pool_dev_alloc_pages() - allocate a page.
>   * @pool:      pool from which to allocate
> diff --git a/net/core/skbuff.c b/net/core/skbuff.c
> index 6841e61a6bd0..54e8e7cf2bc9 100644
> --- a/net/core/skbuff.c
> +++ b/net/core/skbuff.c
> @@ -1033,7 +1033,8 @@ bool napi_pp_put_page(netmem_ref netmem)
>         if (unlikely(!is_pp_netmem(netmem)))
>                 return false;
>
> -       page_pool_put_full_netmem(netmem_get_pp(netmem), netmem, false);
> +       page_pool_put_full_netmem(page_pool_to_pp(netmem_to_page(netmem)),
> +                                 netmem, false);
>
>         return true;
>  }
> diff --git a/net/core/xdp.c b/net/core/xdp.c
> index bcc5551c6424..e8582036b411 100644
> --- a/net/core/xdp.c
> +++ b/net/core/xdp.c
> @@ -384,7 +384,8 @@ void __xdp_return(void *data, struct xdp_mem_info *mem, bool napi_direct,
>                 /* No need to check ((page->pp_magic & ~0x3UL) == PP_SIGNATURE)
>                  * as mem->type knows this a page_pool page
>                  */
> -               page_pool_put_full_page(page->pp, page, napi_direct);
> +               page_pool_put_full_page(page_pool_to_pp(page), page,
> +                                       napi_direct);
>                 break;
>         case MEM_TYPE_PAGE_SHARED:
>                 page_frag_free(data);
> --
> 2.33.0
>

