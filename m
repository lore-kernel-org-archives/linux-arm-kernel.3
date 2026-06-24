Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCC3CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 16:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/KIgQ42qvKpfhlsSKyF2HuauF1ECg4OdEJw3N/MxDE=; b=ChZZJTrdrfCcYM1KdWHRVxK3Fs
	jGWAwM7LsOdTSz++R+VDuKmSiF8td7G5Z2auz+K7pYI31/K2C+2TK97n6wlfH44yNlzThhs1w0swY
	bAl2cMkq8Vnpa3XXALJEBLecA7nUjNjXZiYjumWY/vUWSqRamIPg634b+WMV0d7xm2ws4VbHYxY+M
	ATYBwqnt1t4qw6LQCJckAG4alOTd6BFDfnprWh8QV3Lcp62yo7L/KZXL0Gyxydrbe24RjijrXJtnb
	Eys40IE40xK/G0IGG3tV6Xl0BQMesd5bdMXO91YSFwC2NxOTqVjyljQCPq4dnRTYM0OCZ2hm11z1h
	zJ6LncnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQGb-000000085g7-3cnV;
	Wed, 24 Jun 2026 16:15:57 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcQGZ-000000085fb-1L7W;
	Wed, 24 Jun 2026 16:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=C/KIgQ42qvKpfhlsSKyF2HuauF1ECg4OdEJw3N/MxDE=; b=zbFrCbjAVWSr9s/Viyahf2Olbs
	oTCo4yIjsXdPR24Ttlmx4kTxQXI8ylSJ9k1iCBYbolL65pl78MI2bF9pydBeML/noASJ4tMOyHWpC
	6aBGrmDevD7vE41CyvPDSgLfC5gUPFIl+HZwR/zpqp+4/fLNW977+zmJbh7JowiPQJlI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wcQGH-00978o-CO; Wed, 24 Jun 2026 18:15:37 +0200
Date: Wed, 24 Jun 2026 18:15:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jackbb_wu@compal.com
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wen-Zhi Huang <wen-zhi.huang@mediatek.com>,
	Shi-Wei Yeh <shi-wei.yeh@mediatek.com>,
	Minano Tseng <Minano.tseng@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 3/7] net: wwan: t9xx: Add control DMA interface
Message-ID: <dc007021-9013-47b2-b06a-fe4a50d26722@lunn.ch>
References: <20260624-t9xx_driver_v1-v3-0-73ff03f60c48@compal.com>
 <20260624-t9xx_driver_v1-v3-3-73ff03f60c48@compal.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260624-t9xx_driver_v1-v3-3-73ff03f60c48@compal.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_091555_362717_7E92C511 
X-CRM114-Status: GOOD (  17.73  )
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

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c

> +static inline void mtk_cldma_clr_bd_dsc(struct cldma_drv_info *drv_info,
> +					struct bd_dsc *bd_dsc_pool, int nr_bds)

No inline functions in C files. Please let the compiler decide.

> +static int mtk_cldma_reload_rx_skb(struct mtk_md_dev *mdev, struct rxq *rxq,
> +				   struct rx_req *req)
> +{
> +	struct sk_buff *tail = NULL;
> +	struct bd_dsc *bd_dsc;
> +	int nr_bds;
> +	int i, ret;
> +
> +	nr_bds = rxq->nr_bds;
> +
> +	for (i = 0; i < nr_bds; i++) {
> +		bd_dsc = req->bd_dsc_pool + i;
> +		bd_dsc->skb = __dev_alloc_skb(req->frag_size, GFP_KERNEL);
> +		if (!bd_dsc->skb) {
> +			dev_warn((mdev)->dev, "Failed to alloc SKB\n");

You might want to rate limit this, and the other similar messages in
the data path, otherwise it could be a DOS.

> +u32 mtk_cldma_stop_queue(struct cldma_drv_info *drv_info, enum mtk_tx_rx dir, u32 qno)
> +{
> +	u32 val = (qno == ALLQ) ? qno : BIT(qno);
> +	struct cldma_hw_regs *hw_regs;
> +	unsigned int active;
> +	int cnt = 0;
> +	int base;
> +	u32 addr;
> +
> +	hw_regs = drv_info->hw_regs;
> +	base = drv_info->base_addr;
> +
> +	if (dir == DIR_TX)
> +		addr = base + hw_regs->reg_cldma_ul_stop_cmd;
> +	else
> +		addr = base + hw_regs->reg_cldma_so_stop_cmd;
> +
> +	mtk_pci_write32(drv_info->mdev, addr, val);
> +
> +	do {
> +		active = drv_info->drv_ops->cldma_queue_status(drv_info, dir, qno);
> +		if (active == LINK_ERROR_VAL || !active)
> +			break;
> +		usleep_range(WAIT_QUEUE_STOP, 2 * WAIT_QUEUE_STOP);
> +	} while (++cnt < 10);

Please use one of the helpers from iopoll.h. Any loops waiting for an
event to happen should use those macros, since the open code
implementation is often wrong.

> +static int mtk_ctrl_trb_srv_init(struct mtk_ctrl_trans *trans)
> +{
> +	struct srv_que *srv_que;
> +	struct trb_srv *srv;
> +	int i, j;
> +	int ret;
> +
> +	for (i = 0; i < trans->trb_srv_num; i++) {
> +		srv = devm_kzalloc(trans->mdev->dev, sizeof(*srv), GFP_KERNEL);
> +		if (!srv) {
> +			ret = -ENOMEM;
> +			goto err_free_srv;
> +		}
> +
> +		srv->trans = trans;
> +		srv->srv_id = i;
> +		trans->trb_srv[i] = srv;
> +
> +		init_waitqueue_head(&srv->trb_waitq);
> +		for (j = 0; j < NR_CLDMA; j++)
> +			INIT_LIST_HEAD(&srv->srv_q_list[j]);
> +	}
> +
> +	for (i = 0; i < NR_CLDMA; i++)
> +		for (j = 0; j < HW_QUE_NUM; j++) {
> +			if (trans->srv_cfg[i][j] < 0 ||
> +			    trans->srv_cfg[i][j] >= trans->trb_srv_num)
> +				trans->srv_cfg[i][j] = 0;
> +			srv_que = devm_kzalloc(trans->mdev->dev, sizeof(*srv_que), GFP_KERNEL);
> +			if (!srv_que) {
> +				ret = -ENOMEM;
> +				goto err_free_srv_que;
> +			}
> +			srv_que->hif_id = i;
> +			srv_que->qno = j;
> +			list_add_tail(&srv_que->list,
> +				      &trans->trb_srv[trans->srv_cfg[i][j]]->srv_q_list[i]);
> +		}
> +
> +	for (i = 0; i < trans->trb_srv_num; i++) {
> +		trans->trb_srv[i]->trb_thread = kthread_run(mtk_ctrl_trb_thread, trans->trb_srv[i],
> +							    "mtk_trb_srv%d_%s", i,
> +							    trans->mdev->dev_str);
> +		if (IS_ERR(trans->trb_srv[i]->trb_thread)) {
> +			ret = PTR_ERR(trans->trb_srv[i]->trb_thread);
> +			trans->trb_srv[i]->trb_thread = NULL;
> +			goto err_stop_kthread;
> +		}
> +	}
> +
> +	return 0;
> +err_stop_kthread:
> +	while (--i >= 0)
> +		kthread_stop(trans->trb_srv[i]->trb_thread);
> +err_free_srv_que:
> +	for (i = 0; i < trans->trb_srv_num; i++) {
> +		for (j = 0; j < NR_CLDMA; j++) {
> +			struct srv_que *next_srv_que;
> +
> +			list_for_each_entry_safe(srv_que, next_srv_que,
> +						 &trans->trb_srv[i]->srv_q_list[j], list) {
> +				list_del(&srv_que->list);
> +				devm_kfree(trans->mdev->dev, srv_que);

It is unusual to see devm_kfree(). Why is it needed?

> +static unsigned int ctrl_port_chl_mtu;

Is this a global variable? Why is it not part of priv?

> +module_param(ctrl_port_chl_mtu, uint, 0644);
> +MODULE_PARM_DESC(ctrl_port_chl_mtu, "This is used to config the ctrl port mtu!\n");

Ah. No modules parameters please. If this is an MTU, why not use the
normal networking interfaces to set the MTU?

	Andrew

