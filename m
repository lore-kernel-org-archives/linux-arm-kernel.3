Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF869C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TV8tl8agqKwLpgfHtmJHvY+8PG3WpGYxYzrYv+Oy+A=; b=psdr9uCbs5QuFfmN2cbXPLvEZv
	cYPeo9JAzjdu13JnHP0Tksa65syznx3k2mZA3xSrtC/ivfoy85fgF9m5apr6eqv8GFg/OyypHeDLm
	94PaeqXcd/Ah3jha3HKBKtt3AuMu28XbCXdHTbfTYrYuyhW7veJns5dvy6WL9XsDeRXRFLkcIuw4T
	bDTew8yOzA8pU23afp3i81FxOlNPsSBQFLDV37GN1HnPv7NW44/HqWY6z3JCrC0cNZZcZ1R/dYZyp
	aTZeT2hfZm8EI8DmMkYD3ymB2Hb8Z8bS0bRC2RSO6YUKnsO/sNZsUYwHKpCbic7A7M5V9sWplSN+x
	fwVduTXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIUO-0000000Gt6R-3B0I;
	Thu, 16 Jul 2026 09:34:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIUG-0000000Gt01-2lmt;
	Thu, 16 Jul 2026 09:34:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A0E643C21;
	Thu, 16 Jul 2026 09:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599081F00A3A;
	Thu, 16 Jul 2026 09:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194476;
	bh=6TV8tl8agqKwLpgfHtmJHvY+8PG3WpGYxYzrYv+Oy+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=btzwrW2WHUhoHzOAas/Q8lx/bETANDijmUL3bYGTX3QlggJmQiTq8Tk5IhZ83nOcs
	 D5Qn5Ceu5eXEJHDnkLCHMibfsdWy8aJd3Ki1cNSeRXW/seJUuwo6hg8Os2ZKVekRQf
	 oqjT95fcO3utuaeudnh9VMPxS+YI08GfB6tSPKdQ3OoDuNqjUBYVwRiq5zJf5r37tD
	 0mh0xgYvlFN8ZYF83ji6FXT9yQTcnEH4DzXWrgwIKXMxs8DcO7W1ipm7jBFbIcuosl
	 isV3SQQCeZCjuGx5Ym1JZoDvn/j1VX82kRK7LJQF1U15+nqDnWZRX7DQu2IHPAb7eV
	 QmzRuHJiia5lQ==
From: Simon Horman <horms@kernel.org>
To: jackbb_wu@compal.com
Cc: Simon Horman <horms@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 6/7] net: wwan: t9xx: Add AT & MBIM WWAN ports
Date: Thu, 16 Jul 2026 10:34:29 +0100
Message-ID: <20260716093429.231132-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709-t9xx_driver_v1-v4-6-a8c009d509c5@compal.com>
References: <20260709-t9xx_driver_v1-v4-6-a8c009d509c5@compal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
--- Patch [6]: [PATCH v4 6/7] net: wwan: t9xx: Add AT & MBIM WWAN ports ---
commit 1739a55610bf7a44ce24874819e01c07236d9442
Author: Jack Wu <jackbb_wu@compal.com>

net: wwan: t9xx: Add AT & MBIM WWAN ports

Add AT & MBIM ports to the port infrastructure.
The WWAN initialization method is responsible for creating the
corresponding ports using the WWAN framework infrastructure. The
implemented WWAN port operations are start, stop, tx, tx_blocking
and tx_poll.

> diff --git a/drivers/net/wwan/t9xx/mtk_port_io.c b/drivers/net/wwan/t9xx/mtk_port_io.c
> index e3a2de6d2f297..882254b74026f 100644
> --- a/drivers/net/wwan/t9xx/mtk_port_io.c
> +++ b/drivers/net/wwan/t9xx/mtk_port_io.c

[ ... ]

> @@ -234,6 +376,198 @@ static const struct port_ops port_internal_ops = {
>  	.recv = mtk_port_internal_recv,
>  };
>  
> +static int mtk_port_wwan_open(struct wwan_port *w_port)

[ ... ]

> +static int mtk_port_wwan_write(struct wwan_port *w_port, struct sk_buff *skb)
> +{
> +	struct mtk_port *port = wwan_port_get_drvdata(w_port);
> +	union user_buf user_buf;
> +	int ret;
> +
> +	if (unlikely(!skb->len)) {
> +		consume_skb(skb);
> +		return 0;
> +	}
> +
> +	port->info.flags &= ~PORT_F_BLOCKING;
> +	user_buf.kbuf = (void *)skb->data;
> +	ret = mtk_port_common_write(port, user_buf, skb->len, false);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
If mtk_port_common_write() successfully sends the first few fragments but
fails on subsequent ones, returning a positive partial write count, does
this code silently drop the remaining data?

The condition ret < 0 is false for partial writes, so the SKB is consumed
and 0 is returned to the caller, falsely reporting complete success to the
WWAN core.

> +
> +	consume_skb(skb);
> +	return 0;
> +}
> +
> +static int mtk_port_wwan_write_blocking(struct wwan_port *w_port, struct sk_buff *skb)
> +{
> +	struct mtk_port *port = wwan_port_get_drvdata(w_port);
> +	union user_buf user_buf;
> +	int ret;
> +
> +	if (unlikely(!skb->len)) {
> +		consume_skb(skb);
> +		return 0;
> +	}
> +
> +	port->info.flags |= PORT_F_BLOCKING;
> +	user_buf.kbuf = (void *)skb->data;
> +	ret = mtk_port_common_write(port, user_buf, skb->len, false);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Can the same silent drop of partially written SKBs happen here?

> +
> +	consume_skb(skb);
> +	return 0;
> +}

[ ... ]

> +static void mtk_port_wwan_enable(struct mtk_port *port)
> +{
> +	struct mtk_port_mngr *port_mngr;
> +	int ret;
> +
> +	port_mngr = port->port_mngr;
> +
> +	if (test_bit(PORT_S_ENABLE, &port->status))
> +		return;
> +
> +	ret = mtk_port_ch_enable(port);
> +	if (ret && ret != -EBUSY)
> +		return;
> +
> +	port->w_priv.w_port = wwan_create_port(port_mngr->ctrl_blk->mdev->dev,
> +					       port->w_priv.w_type,
> +					       &wwan_ops, NULL, port);
> +	if (IS_ERR(port->w_priv.w_port)) {

[Severity: High]
Can a race condition occur here if wwan_create_port() fails and returns an
error pointer?

Once mtk_port_ch_enable() completes, hardware RX can start. If
wwan_create_port() fails, an ERR_PTR is stored in port->w_priv.w_port
without holding w_lock. Concurrently, the RX interrupt handler could call
mtk_port_wwan_recv():

	mutex_lock(&port->w_priv.w_lock);
	if (!port->w_priv.w_port) {
		mutex_unlock(&port->w_priv.w_lock);
		return -ENXIO;
	}
	wwan_port_rx(port->w_priv.w_port, skb);

Because an ERR_PTR is not NULL, mtk_port_wwan_recv() will pass it to
wwan_port_rx(), which will then dereference the error pointer.

> +		dev_warn(port_mngr->ctrl_blk->mdev->dev,
> +			 "Failed to create wwan port for (%s)\n", port->info.name);
> +		port->w_priv.w_port = NULL;
> +		mtk_port_ch_disable(port);
> +		return;
> +	}
> +
> +	set_bit(PORT_S_WR, &port->status);
> +	set_bit(PORT_S_ENABLE, &port->status);
> +}
> +

