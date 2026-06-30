Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC9EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMKiXFK0pfNTOQ9DCFZIRhDUF8Wl7Qfuw9O2ocILSG4=; b=zErkr4T3l1X9KE5g4Q56NQJkKn
	xNVfcqP8eAlHLml/K4mp/hvrRTjEi6V2vxiwNrfEVuTTciC4a5LShVKk9b78peqh7H/g39ihVouX6
	dxLyeZTJDm/XmPhFTB08lupjnT4rehOFpSbCIVmf8TLAjX9ENH0fDTFGp7nTVB+3L/KFJye6hS0JM
	75atJ2JOmnoAXyxXOJZwsxl4aurOqYaRxcb5fL8WPH1F5CYp4CG3z0CH45jg63dPK+Edb11T/idzV
	U4OQoUAacKsC03L8ihhNRafGcus0Kx5B2weCm17tXHnU6LrG8ndHjkiYU6Gi+ahKtpAffcvm+hSZp
	27ll3upA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7v-0000000Gj3f-2p4z;
	Tue, 30 Jun 2026 10:55:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weW7e-0000000Giz8-20J1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782816918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hMKiXFK0pfNTOQ9DCFZIRhDUF8Wl7Qfuw9O2ocILSG4=;
	b=dPm98piFipETikNh4NHxn7nADRLbY++Lp0568Es9auv0ZRadu+Fy0shBcrX8hGXv9WKEbE
	eBXqatQoI5pIkycqEtUGzd83tsSGMvZW44QbuSxwhNMipV5KuBB0vtArkhmbNg9GJLUMeV
	eU0e1sEeh+WGNXtd8XSDf9LIdrS7Rs0=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-QvtidSeZMBux3VVlVNyt-A-1; Tue, 30 Jun 2026 06:55:15 -0400
X-MC-Unique: QvtidSeZMBux3VVlVNyt-A-1
X-Mimecast-MFC-AGG-ID: QvtidSeZMBux3VVlVNyt-A_1782816915
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-664a090b4dcso6469198d50.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:55:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816915; x=1783421715;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMKiXFK0pfNTOQ9DCFZIRhDUF8Wl7Qfuw9O2ocILSG4=;
        b=Fl3TDgqU8QlTZZebnDC2NeSWlJJJSQh7Ombv2w87Zbz/1Jb+jXnvtNVi/CpiIC2oMA
         ePR44g3WPzSlmnAFqR3tXjyDdafoy1xmYHyR/PuRaKWPFTkhro3vyAA9d3JGjJTp0LF0
         K2tzTRB/Y9SEJ2RCp+GfoavWq1nMhCLXu7L1hA2Uj8TeY6MkLzWMGTx8QeYOhNjLqPsm
         MG5I5vNEshK2yETvCb4XIbYQfMpInVm7CXujpK2ehJgzp38u3T3URFyoWaeFhhPffTv3
         OW1Q+n2lrRU2miIsD/VVXKytCSCiTDen9xNXlJVdCjoIDXhYFzoVWPTXXUL6feTanltX
         tSaw==
X-Forwarded-Encrypted: i=1; AHgh+RoS/q7E0jhoTpogJb5X9BNT2zZEvUsEw/BoPRVtkyKZiR04lobrkdGyB0aOVTCSFwjVyaJGRvn30FfXOiqUcP0o@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4pXXJ9uluqd0eYLlN4eWiSn6+iFws6msSsOuwhzzOepS5S97e
	2iMuNc5nB4fUro8a3F8KhLMrNG/E2YCZYgpzl4f2jmPAQ4jC35gqSKW6Rvoq/92lBM5SmpVl45G
	Am38hFQm/ce4uckapsPxxANk3KURTSVpFpyKArxBiubaE5Am9Rh5VSYZjOjjEYpUpMj0wdSNCao
	HF
X-Gm-Gg: AfdE7cnjIvwXnvZVSv++wt2XDy5P74fNciBqn8QHSbsQi6wIdYlFcFORrCPwFssm468
	mEtMsRZPY4KvL3QwBfrQD/hQBakS6jnVwAOpk1s5lqAlqi9l+2dN42VHlCs4tXUy4Yo9snelWhj
	jyWems7sw2O3LdnCQA4sxnydwEb0uQVI8jSBntjrCly88PdQygOkACgou/810GCHkQHs9E26NBN
	GzmeCKu5a9H0g6ujZbEl+RGeNCXYs+WtSg8eHnzC2AHmp26GKF+AGnze4Qj0vLyGNCQb10dGl58
	ngWqdXvqznLpDmwfrxYg6CaACj95KRnwkFgMNAxLInRi5BFdkEWsbWyk8ewZEgt/Secgv+EKo4q
	LEhSlfAcEKHlTkLpvH48osp5xAfAgjmOTanfRBJlknp9/68OOIjUiK6em3uMc5/sgG51xM0oBvg
	7hEATrpslFwA==
X-Received: by 2002:a05:690e:419b:b0:662:e26f:cd10 with SMTP id 956f58d0204a3-664f98cfe16mr2737860d50.51.1782816914985;
        Tue, 30 Jun 2026 03:55:14 -0700 (PDT)
X-Received: by 2002:a05:690e:419b:b0:662:e26f:cd10 with SMTP id 956f58d0204a3-664f98cfe16mr2737836d50.51.1782816914353;
        Tue, 30 Jun 2026 03:55:14 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66500666305sm757620d50.5.2026.06.30.03.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 03:55:13 -0700 (PDT)
Message-ID: <b42c9095-aa2a-4e2f-b65e-11adbd2dbec6@redhat.com>
Date: Tue, 30 Jun 2026 12:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] net: stmmac: fix fatal bus error on resume by
 reinitializing RX buffers
To: Ding Hui <dinghui1111@163.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>,
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Ding Hui <dinghui@lixiang.com>,
 "open list:STMMAC ETHERNET DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: xiasanbo@lixiang.com, yangchen11@lixiang.com, liuxuanjun@lixiang.com
References: <20260627122533.1165324-1-dinghui1111@163.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260627122533.1165324-1-dinghui1111@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MUcENor9OeHyPD9IaBdPzjFShm57yZSzNF8Zr6ATmmA_1782816915
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_035522_685085_058885FC 
X-CRM114-Status: GOOD (  50.86  )
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

On 6/27/26 2:25 PM, Ding Hui wrote:
> From: Ding Hui <dinghui@lixiang.com>
> 
> On suspend, stmmac_suspend() calls stmmac_disable_all_queues() which
> stops the RX NAPI, but the RX DMA engine may still be running for a
> short window before stmmac_stop_all_dma() takes effect. During that
> window the hardware can write incoming frames into the buffers pointed
> to by the RX descriptors and write back the descriptors (clearing the
> OWN bit and overwriting RDES0/1/2 with status/timestamp data). Because
> NAPI is already disabled, the driver never refills these descriptors,
> so the RX ring is left in a "consumed but not refilled" state with
> stale content in the descriptor buffer-address fields.
> 
> On resume, stmmac_clear_descriptors() only re-arms the OWN bit and
> does not repopulate the RX buffer address fields. When the DMA is
> restarted it dereferences these stale addresses and triggers a fatal
> bus error (not kernel panic, just a Fatal Bus Error interrupt and
> RX DMA engine halts).
> 
> Fix this by introducing stmmac_reinit_rx_descriptors(), called from
> stmmac_resume() immediately after stmmac_clear_descriptors(). The
> helper iterates every RX descriptor slot and re-programs its buffer
> address fields:
> 
>  - For normal (page_pool) queues: restore RDES0/1 from buf->addr and
>    RDES2 from buf->sec_addr. The DMA mapping has remained valid across
>    suspend/resume because no pages were freed. Slots left NULL by a
>    prior GFP_ATOMIC failure in stmmac_rx_refill() before suspend
>    are re-allocated here with GFP_KERNEL;
>    -ENOMEM is returned and resume is aborted if allocation fails.
>    The slots with null buffer are unacceptable, because they will
>    cause a DMA suspend dead lock problem by the condition of
>    Current Descriptor Pointer == Descriptor Tail Pointer.
> 
>  - For AF_XDP zero-copy queues: restore the DMA address from
>    xsk_buff_xdp_get_dma(buf->xdp). Slots with no xdp buffer
>    (e.g. TX-only socket, empty fill ring) attempt xsk_buff_alloc()
>    first; on failure the descriptor is zeroed so the DMA engine skips
>    the slot safely via an RBU event.
> 
>  - For chain mode: call stmmac_mode_init() to rebuild the des3 next-
>    descriptor pointer chain, which hardware may have overwritten with
>    a PTP timestamp value (as noted in chain_mode.c:refill_desc3()).
> 
> After reprogramming all address fields, a final pass restores OWN=1
> on every valid slot. This is necessary because set_sec_addr and
> chain-mode init unconditionally overwrite des3 (clearing the OWN bit
> set by stmmac_clear_descriptors()), and must run after all address
> writes are complete.
> 
> Also fix stmmac_init_rx_buffers() to actually use its gfp_t flags
> parameter instead of the hardcoded GFP_ATOMIC | __GFP_NOWARN.
> 
> Signed-off-by: Ding Hui <dinghui@lixiang.com>

This looks like 'net' material, it should specify 'net' into the subj
prefix and include a suitable Fixes tag.

> ---
> Changes in v4:
> - Just add description for return value of 'stmmac_reinit_rx_descriptors'.
> - Link to v3:
>   https://lore.kernel.org/netdev/20260604144557.3175399-1-dinghui1111@163.com/
> 
> Changes in v3:
> - Re-allocate page_pool NULL slots (from prior GFP_ATOMIC failures)
>   with GFP_KERNEL in stmmac_reinit_rx_descriptors(); return -ENOMEM and
>   abort resume.
> - For XSK NULL slots, attempt xsk_buff_alloc() first; fall back to
>   stmmac_clear_desc() only when allocation fails.
> - Add a re-arm loop at the end of stmmac_reinit_rx_descriptors() to
>   restore OWN=1 on all valid slots, since set_sec_addr and
>   chain-mode init both write des3 unconditionally.
> - stmmac_reinit_rx_descriptors() now returns int; stmmac_resume()
>   checks the return value and propagates -ENOMEM with mutex/rtnl cleanup.
> - Fix stmmac_init_rx_buffers() to use its flags parameter instead of
>   hardcoded GFP_ATOMIC | __GFP_NOWARN.
>   (884d2b845477 ("net: stmmac: Add GFP_DMA32 for rx buffers if no 64
>   capability"))
> - Run stmmac_reinit_rx_descriptors() after stmmac_clear_descriptors()
>   so that stmmac_clear_desc() on XSK NULL slots overrides the OWN
>   bit set by stmmac_clear_descriptors().
> - Update commit message.
> - Link to v2:
>   https://lore.kernel.org/netdev/20260526022620.501229-1-dinghui1111@163.com/
> 
> Changes in v2:
> - Introducing stmmac_reinit_rx_descriptors() to reinitializing rx
>   buffers without any allocation.
> - Modify commit log.
> - Link to v1:
>   https://lore.kernel.org/netdev/20260515053856.2310369-1-dinghui1111@163.com/
> ---
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 164 +++++++++++++++++-
>  1 file changed, 163 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 3591755ea30b..c82f3d5dbd43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1660,7 +1660,7 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  {
>  	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
>  	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
> -	gfp_t gfp = (GFP_ATOMIC | __GFP_NOWARN);
> +	gfp_t gfp = flags;

The above should go via a separate (net) patch.

>  
>  	if (priv->dma_cap.host_dma_width <= 32)
>  		gfp |= GFP_DMA32;
> @@ -1693,6 +1693,148 @@ static int stmmac_init_rx_buffers(struct stmmac_priv *priv,
>  	return 0;
>  }
>  
> +/**
> + * stmmac_reinit_rx_descriptors - re-program RX descriptor buffer addresses
> + *				   after stmmac_clear_descriptors()
> + * @priv: driver private structure
> + * @dma_conf: structure holding the dma data
> + * @queue: RX queue index
> + *
> + * Description: Called in the resume path after stmmac_clear_descriptors()
> + * has re-armed the OWN bit on every descriptor.  Walk buf_pool[] and
> + * re-program the buffer-address fields of every RX descriptor from the
> + * buffers that are already attached to the queue.  Slots whose page was
> + * never allocated (GFP_ATOMIC failure before suspend) are re-allocated
> + * here with GFP_KERNEL; the resume path is in process context.
> + *
> + * Between suspend and resume the hardware may have written back status/
> + * length information into the descriptor address fields (RDESx are reused
> + * for status on completion for GMAC4/XGMAC), so the address fields must be
> + * repopulated before the DMA is restarted.
> + *
> + * For XSK slots that have no xdp buffer at suspend time (TX-only socket,
> + * empty fill ring for Rx), xsk_buff_alloc() is attempted but does not
> + * return an error on failure because we can't identify a real TX-only
> + * socket from an alloc error (same as stmmac_alloc_rx_buffers_zc() in
> + * __init_dma_rx_desc_rings); on failure the descriptor is zeroed so the DMA
> + * engine skips the slot safely.
> + *
> + * To avoid the DMA stall after resume in non-XSK mode, this function
> + * re-allocates pages for NULL slots using GFP_KERNEL (the resume path runs
> + * in process context). If allocation fails, -%ENOMEM is returned immediately
> + * and the resume is aborted; the caller should report the error.
> + *
> + * This helper must be called after stmmac_clear_descriptors() and before
> + * stmmac_hw_setup() in stmmac_resume() because we need to wipe the OWN bit
> + * set in stmmac_clear_descriptors() for NULL slots in XSK mode.

Please try to condense the above text in one or 2 paragraph.

> + *
> + * Returns: 0 on success, or a negative errno on allocation failure in
> + * non-XSK mode (e.g. -%ENOMEM).
> + */
> +static int stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
> +					struct stmmac_dma_conf *dma_conf,
> +					u32 queue)
> +{
> +	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
> +	struct stmmac_rx_buffer *buf;
> +	struct dma_desc *p;
> +	int i;
> +
> +	if (rx_q->xsk_pool) {
> +		for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +			buf = &rx_q->buf_pool[i];
> +			p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +			/* The XSK pool may not be fully populated (e.g.
> +			 * xdpsock TX-only, empty fill ring).  Try to refill
> +			 * from the pool; on failure zero the descriptor so the
> +			 * DMA engine skips this slot safely.
> +			 */
> +			if (!buf->xdp) {
> +				buf->xdp = xsk_buff_alloc(rx_q->xsk_pool);
> +				if (!buf->xdp) {
> +					stmmac_clear_desc(priv, p);
> +					continue;
> +				}
> +			}
> +
> +			stmmac_set_desc_addr(priv, p,
> +					     xsk_buff_xdp_get_dma(buf->xdp));
> +			stmmac_set_desc_sec_addr(priv, p, 0, false);
> +		}
> +	} else {
> +		for (i = 0; i < dma_conf->dma_rx_size; i++) {
> +			buf = &rx_q->buf_pool[i];
> +			p = stmmac_get_rx_desc(priv, rx_q, i);
> +
> +			/* buf->page can be NULL when stmmac_rx_refill() hit a
> +			 * GFP_ATOMIC failure before suspend and left the slot
> +			 * without a buffer. The resume path runs in process
> +			 * context, so re-allocate with GFP_KERNEL. Allocation
> +			 * failure aborts the resume.
> +			 */
> +			if (!buf->page) {
> +				int err;
> +
> +				err = stmmac_init_rx_buffers(priv, dma_conf, p,
> +							     i, GFP_KERNEL,
> +							     queue);
> +				if (err)
> +					return err;
> +				/* stmmac_init_rx_buffers() already programmed
> +				 * the descriptor; skip the reprogramming below.
> +				 */
> +				continue;
> +			}
> +
> +			stmmac_set_desc_addr(priv, p, buf->addr);
> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
> +						 priv->sph_active &&
> +						 buf->sec_page);

AFAICS stmmac_rx_refill() can error out after successfully allocating
buf->page, but leaving a NULL sec_page, I think you should try to
realloc even the latter.

Finally this chunk shares quite a bit of code with stmmac_rx_refill()
and stmmac_rx_refill_zc() it would be better try to factor out common
helpers.

/P


