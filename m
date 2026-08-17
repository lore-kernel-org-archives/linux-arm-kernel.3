Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E3EC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SJXQ9vM2KWNlkV29lLJi0nV/8Tka0tw/q9KKnDdas8Y=; b=Vko0Ar2aKyfcPhOSJJ3rP2s0ge
	1JOOulM3y25N2DGlPWx/cXgn0ZLemlTAHv7LOGVjl3kBpKC0gkT/0efINmVCYrDt+xQdOlJxYUnFS
	95IB8rxniR5VKztduXv+Tic4hyAGPBiFt1MaNH2+BS23jbkn759jYs6de9gYSRqBRIverBbp0wtjN
	IwMvrdA/yJ6YIUZloEZvJ3zop8jTA53zZVaCn40+yq7XjSDb6SIarVjBhBdV1UquFKMCeQXhOl75b
	I7NJxpaLSGU3wHBcixF5yr60hi6mHUPZq9I9CfcGBDbm7oSH/JURygfrYqTfYjIvinfkG2KHbEOVC
	B7bkN6xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5x7-00000006vyJ-32xM;
	Mon, 17 Aug 2026 22:37:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww5wy-00000006vrl-2t1b;
	Mon, 17 Aug 2026 22:37:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BA22400F9;
	Mon, 17 Aug 2026 22:37:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 613541F000E9;
	Mon, 17 Aug 2026 22:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787006220;
	bh=SJXQ9vM2KWNlkV29lLJi0nV/8Tka0tw/q9KKnDdas8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDWHfW0q8MOMNW1CFmLos0TT6zU7EHHs+jODOMxxfTbCBc1TTlnB8KTub6ZtD5jX8
	 u5i5bGxiQL45nA5nZ9NjSL8Vu2bcxtDQ1B4btl63DLSnAFXm/PV8ghzWY+RMIxWmQN
	 qfX2CA2y/c0Aw48AIcG+jiUY34Ah6A900lpWj6zg9igB3/XyXJc1aNBZJvju3nLuBR
	 7nwgUPV5iQEyCnlpoJ+HIxJCdldKHwWZDokz9/PCBPqe34etKCZIYROKDyESewnoxu
	 exmzw/wL+tBo3UaodnKpvWGsErzQLLgQujHBrawoTAZXnkC7nSUTGa3N/7yas28Y0N
	 /TPnSHu1Jmuzg==
From: Jakub Kicinski <kuba@kernel.org>
To: jackbb_wu@compal.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	loic.poulain@oss.qualcomm.com,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	wen-zhi.huang@mediatek.com,
	shi-wei.yeh@mediatek.com,
	Minano.tseng@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	robert_yu@compal.com,
	Jeff_Chang@compal.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 6/7] net: wwan: t9xx: Add AT & MBIM WWAN ports
Date: Mon, 17 Aug 2026 15:36:58 -0700
Message-ID: <20260817223658.3688816-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811-t9xx_driver_v1-v6-6-2c969fad57c6@compal.com>
References: <20260811-t9xx_driver_v1-v6-6-2c969fad57c6@compal.com>
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
---
net: wwan: t9xx: Add AT & MBIM WWAN ports

This adds AT and MBIM ports to the t9xx port infrastructure, creating them
through the WWAN framework when the modem FSM reaches the ready state. The
new wwan_port_ops implement start, stop, tx, tx_blocking and tx_poll, and
new CLDMA queues plus port configs are added for both channels.

A few questions on the new code below.

> diff --git a/drivers/net/wwan/t9xx/mtk_port.c b/drivers/net/wwan/t9xx/mtk_port.c
> index ee52b44ddf861..e67ac14c92861 100644
> --- a/drivers/net/wwan/t9xx/mtk_port.c
> +++ b/drivers/net/wwan/t9xx/mtk_port.c
> @@ -819,6 +819,29 @@ int mtk_port_ch_disable(struct mtk_port *port)
>  	return ret;
>  }
>  
> +static int mtk_port_enable_by_type(struct mtk_port_mngr *port_mngr, int tbl_type)
> +{
> +	struct mtk_port **ports;
> +	int ret, idx;
> +
> +	if (tbl_type < 0 || tbl_type >= PORT_TBL_MAX)
> +		return -EINVAL;
> +
> +	ports = kcalloc(port_mngr->port_cnt, sizeof(struct mtk_port *), GFP_KERNEL);
> +	if (!ports)
> +		return -ENOMEM;
> +
> +	ret = radix_tree_gang_lookup(&port_mngr->port_tbl[tbl_type],
> +				     (void **)ports, 0, port_mngr->port_cnt);
> +	for (idx = 0; idx < ret; idx++) {
> +		if (ports[idx]->enable)
> +			ports_ops[ports[idx]->info.type]->enable(ports[idx]);
> +	}
> +
> +	kfree(ports);
> +	return 0;
> +}
> +
>  static void mtk_port_disable(struct mtk_port_mngr *port_mngr)
>  {
>  	struct radix_tree_iter iter;
> @@ -850,6 +873,9 @@ void mtk_port_mngr_fsm_state_handler(struct mtk_fsm_param *fsm_param, void *arg)
>  	case FSM_STATE_OFF:
>  		mtk_port_disable(port_mngr);
>  		break;
> +	case FSM_STATE_READY:
> +		mtk_port_enable_by_type(port_mngr, PORT_TBL_MD);
> +		break;

[Severity: Low]
Should the error from mtk_port_enable_by_type() be handled or at least
logged here?

If the kcalloc() in mtk_port_enable_by_type() fails, it returns -ENOMEM
before any port's enable() callback runs, so no AT or MBIM char device is
ever created and there is nothing in the log to explain it.  The
surrounding code (mtk_port_ch_enable() and mtk_port_ch_disable()) does
emit a dev_err()/dev_warn() on failure.

>  	default:
>  		break;
>  	}
> diff --git a/drivers/net/wwan/t9xx/mtk_port_io.c b/drivers/net/wwan/t9xx/mtk_port_io.c
> index a4e264cd5f630..c249b973bd097 100644
> --- a/drivers/net/wwan/t9xx/mtk_port_io.c
> +++ b/drivers/net/wwan/t9xx/mtk_port_io.c
> @@ -41,6 +45,145 @@ static void mtk_port_struct_init(struct mtk_port *port)

[ ... ]

> +static int mtk_port_common_write(struct mtk_port *port, union user_buf buf, unsigned int len,
> +				 bool from_user_space)
> +{
> +	u32 packet_size, left_cnt = len, cur_pos;
> +	struct sk_buff *skb;
> +	int ret;
> +
> +	if (len == 0)
> +		return -EINVAL;
> +
> +start_write:
> +	ret = mtk_port_status_check(port);
> +	if (ret)
> +		goto end_write;

[ ... ]

> +	ret = mtk_port_send_data(port, skb);
> +	if (ret < 0) {
> +		if (ret == -EINTR)
> +			left_cnt -= packet_size;
> +		goto end_write;
> +	}
> +
> +	left_cnt -= ret;
> +	if (left_cnt)
> +		goto start_write;
> +	else
> +		goto end_write;
> +
> +err_free_skb:
> +	dev_kfree_skb_any(skb);
> +end_write:
> +	return (len > left_cnt) ? (len - left_cnt) : ret;
> +}

[ ... ]

> @@ -233,6 +376,198 @@ static const struct port_ops port_internal_ops = {

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
> +
> +	consume_skb(skb);
> +	return 0;
> +}

[Severity: Medium]
Can a short write be silently reported to userspace as a complete write
here (and in mtk_port_wwan_write_blocking() below)?

mtk_port_common_write() returns a positive partial count whenever some
prefix of the request was sent before a failure:

end_write:
	return (len > left_cnt) ? (len - left_cnt) : ret;

That happens when mtk_port_status_check() fails on a later loop iteration
(port disabled or flushed by a modem reset while a multi-chunk write is in
flight), and on the interrupted blocking path:

	ret = mtk_port_send_data(port, skb);
	if (ret < 0) {
		if (ret == -EINTR)
			left_cnt -= packet_size;
		goto end_write;
	}

Both tx callbacks only test ret < 0, then consume the skb and return 0.
The WWAN core treats zero as all-or-nothing in wwan_port_fops_write():

	ret = wwan_port_op_tx(port, head, !!(filp->f_flags & O_NONBLOCK));
	if (!ret)
		return count;

With tx_mtu of 3456 bytes, any larger MBIM control message is split by the
goto start_write loop, so a truncated message would be reported as fully
written with no error.  Should a positive return smaller than skb->len be
propagated as an error instead?

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

[Severity: Medium]
Does this early return need a compensating mtk_port_ch_disable(), the way
the wwan_create_port() failure path below does?

The TRB_CMD_ENABLE is processed asynchronously by the trb kthread, and
mtk_port_ch_enable() only waits with a timeout:

	ret = wait_event_timeout(port->trb_wq, trb->status <= 0,
				 MTK_DFLT_TRB_TIMEOUT);
	if (!ret)
		ret = -ETIMEDOUT;

By then mtk_ch_status_check() has already done:

	trans->usr_cnt[que->hif_id][que->txqno]++;
	if (trans->usr_cnt[que->hif_id][que->txqno] == 1)
		break;

and at usr_cnt == 1 the trb thread runs mtk_cldma_open(), which allocates
the rings and starts CLDMA1 TXQ(5)/RXQ(5) for AT or TXQ(2)/RXQ(2) for
MBIM.  On the -ETIMEDOUT path the queue stays started while the port stays
disabled, so RX data is dropped by mtk_port_wwan_recv() with -ENXIO.

usr_cnt is never reset, and mtk_port_wwan_disable() returns immediately
because PORT_S_ENABLE was never set, so on the next FSM_STATE_READY the
enable takes the usr_cnt != 1 branch, mtk_cldma_check_ch_cfg() finds the
queue not allocated and returns -EINVAL.  Would that leave the AT/MBIM
channel permanently unusable for the lifetime of the device?

> +	port->w_priv.w_port = wwan_create_port(port_mngr->ctrl_blk->mdev->dev,
> +					       port->w_priv.w_type,
> +					       &wwan_ops, NULL, port);
> +	if (IS_ERR(port->w_priv.w_port)) {
> +		dev_warn(port_mngr->ctrl_blk->mdev->dev,
> +			 "Failed to create wwan port for (%s)\n", port->info.name);
> +		port->w_priv.w_port = NULL;
> +		mtk_port_ch_disable(port);
> +		return;
> +	}

[Severity: Medium]
Can the RX path dereference the ERR_PTR that is stored into
port->w_priv.w_port before it is validated?

The store happens without w_lock and the error value is only replaced with
NULL after the IS_ERR() test.  The consumer takes w_lock but only checks
for NULL:

	mutex_lock(&port->w_priv.w_lock);
	if (!port->w_priv.w_port) {
		mutex_unlock(&port->w_priv.w_lock);
		return -ENXIO;
	}

	wwan_port_rx(port->w_priv.w_port, skb);

RX is already live at this point: the earlier mtk_port_ch_enable()
installs trb_open_priv->rx_done = mtk_port_rx_dispatch and starts the
CLDMA RX queue, and dispatch runs from the CLDMA workqueue
mtk_cldma_rx_done_work() -> rxq->rx_done(), i.e. a different thread than
the FSM thread running enable.  If wwan_create_port() fails, a packet
arriving in that window would reach wwan_port_rx() with an error pointer.

mtk_port_wwan_disable() takes w_lock for its store to the same field, so
would using a local variable and only publishing the validated pointer
under w_lock be more consistent here?

[Severity: Low]
This isn't a bug, but would passing a wwan_port_caps here be preferable to
NULL?  With caps == NULL, wwan_create_port() sets:

	port->frag_len = caps ? caps->frag_len : SIZE_MAX;
	port->headroom_len = caps ? caps->headroom_len : 0;

so wwan_port_fops_write() does one GFP_KERNEL allocation sized to the
whole user-supplied write count:

	frag_len = min(remain, port->frag_len);
	skb = alloc_skb(frag_len + port->headroom_len, GFP_KERNEL);

and the driver then copies the data again into tx_mtu-sized skbs.  Setting
frag_len to the tx MTU and headroom_len to sizeof(struct mtk_ccci_header),
as t7xx_port_wwan.c does, would bound that allocation and drop the extra
copy.

> +	set_bit(PORT_S_WR, &port->status);
> +	set_bit(PORT_S_ENABLE, &port->status);
> +}

[Severity: Low]
Should these bits be set before wwan_create_port() rather than after?

wwan_create_port() -> wwan_port_register_wwan() -> device_add() publishes
/dev/wwanXat0 or /dev/wwanXmbim0 and fires the udev event, so a listener
such as ModemManager can open() the node before these set_bit() calls run.
In that window mtk_port_wwan_open() -> mtk_port_common_open() fails with
-ENODEV because PORT_S_ENABLE is not set yet, and a write landing between
the two set_bit() calls would fail with -EBADF from
mtk_port_status_check().

[ ... ]

