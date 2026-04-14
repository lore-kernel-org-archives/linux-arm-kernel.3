Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062C0ED7B87
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DigNPQlaEMr+fYZbjylCUqlUkj2+OF9+JpKPFIeOgh0=; b=49+dT8S/esFZq1svTJy3kIolio
	2gMCILF5S03Ghi18I2DHAbPMfCKOPhJpn/lv2WdEUK2ssdKqXg+0qCttbA/Ni2Xh575wffH26vv+s
	l77OgKQZa0Bp/b58q3dBWjpLRP5UQZSxf2EuqeRac4PSu7EwITPamnFik/KnvQT28Bq4MmQApWcOc
	DZwlUQijfrrBtq2+VTAoflG5lU+rEmdJXsqvdV0bcQKWr1On855EwzLL9uE/dUkd3q6eN1WXZHzMq
	Ewi2lpLNkT+l/wL+qi7Wo5JhmZaJfjTrHbTv+Kc8DLvykiQG1Z5IDPONbAGEhILs/oF67F1TJRX7H
	vGnfUS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZAd-0000000GyWf-1CDB;
	Tue, 14 Apr 2026 08:30:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZAa-0000000GyVQ-391I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776155450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DigNPQlaEMr+fYZbjylCUqlUkj2+OF9+JpKPFIeOgh0=;
	b=NbMKbLQvTutUAmTwzaogwrDlBOQeeRiWONs43WgCm/YT1BgV+ElxkaubITqNN565T6WKzA
	d/fYbEmO/75bCXIWJbVf6PIuOYmGOPDcMApb2u55zqshqM7IAmjtH+Uu+eZzcRVY0xhekP
	6EJy9ItN4P8gs/eleVGnVZ6EeecACsc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-9yk3hmX1Pz2SUi4zHch4vw-1; Tue,
 14 Apr 2026 04:30:47 -0400
X-MC-Unique: 9yk3hmX1Pz2SUi4zHch4vw-1
X-Mimecast-MFC-AGG-ID: 9yk3hmX1Pz2SUi4zHch4vw_1776155446
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0BF5419560A7;
	Tue, 14 Apr 2026 08:30:46 +0000 (UTC)
Received: from gerbillo.redhat.com (unknown [10.44.49.51])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1FBA919560AB;
	Tue, 14 Apr 2026 08:30:42 +0000 (UTC)
From: Paolo Abeni <pabeni@redhat.com>
To: lorenzo@kernel.org
Cc: edumazet@google.com,
	kuba@kernel.org,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	andrew+netdev@lunn.ch,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next] net: airoha: Wait for TX to complete in airoha_dev_stop()
Date: Tue, 14 Apr 2026 10:29:49 +0200
Message-ID: <20260414082949.104611-1-pabeni@redhat.com>
In-Reply-To: <20260411-airoha-fix-ndo_stop-v1-1-caddaa181739@kernel.org>
References: <20260411-airoha-fix-ndo_stop-v1-1-caddaa181739@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: leU-56nEgkQxqExD_zf54k6iL0EW3CAg_8F-Ky5nT_g_1776155446
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_013052_853217_47B9648F 
X-CRM114-Status: GOOD (  18.07  )
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: airoha: Wait for TX to complete in airoha_dev_stop()

Wait for TX to complete in airoha_dev_stop routine before stopping the
TX DMA and run airoha_qdma_cleanup_tx_queue routine. Moreover,
start/stop TX/RX NAPIs in ndo_open()/ndo_stop() callbacks in order to be
sure the TX NAPIs have completed before stopping the TX DMA engine in
airoha_dev_stop routine.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 8e4b043af4bc..9e40c8f375c1 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1684,18 +1686,26 @@ static int airoha_dev_stop(struct net_device *dev)
>  	struct airoha_qdma *qdma = port->qdma;
>  	int i, err;
>
> -	netif_tx_disable(dev);
>  	err = airoha_set_vip_for_gdm_port(port, false);
>  	if (err)
>  		return err;
>
> -	for (i = 0; i < ARRAY_SIZE(qdma->q_tx); i++)
> -		netdev_tx_reset_subqueue(dev, i);
> -
>  	airoha_set_gdm_port_fwd_cfg(qdma->eth, REG_GDM_FWD_CFG(port->id),
>  				    FE_PSE_PORT_DROP);
>
> +	netif_tx_disable(dev);
>  	if (atomic_dec_and_test(&qdma->users)) {
> +		u32 val;
> +
> +		/* Wait for TX to complete */
> +		err = read_poll_timeout(airoha_qdma_rr, val,
> +					!(val & GLOBAL_CFG_TX_DMA_BUSY_MASK),
> +					USEC_PER_MSEC, 100 * USEC_PER_MSEC,
> +					false, qdma, REG_QDMA_GLOBAL_CFG);
> +		if (err)
> +			return err;
>                   ^^^^^^^^^^

Can this leave the device in an inconsistent state? When read_poll_timeout()
fails (TX DMA busy for more than 100ms), airoha_dev_stop() returns an error
immediately. However, atomic_dec_and_test(&qdma->users) has already
decremented qdma->users to 0, but airoha_qdma_stop_napi() was never called,
so all NAPIs remain enabled.

The networking core (__dev_close_many in net/core/dev.c) ignores the
ndo_stop return value and marks the device as down regardless. When the
device is later brought up again, airoha_dev_open() sees atomic_fetch_inc()
return 0 (old value) and calls airoha_qdma_start_napi() -> napi_enable(),
which hits BUG_ON(!test_bit(NAPI_STATE_SCHED, &val)) in napi_enable_locked()
because the NAPI was never disabled.

The early return also skips the netdev_tx_reset_subqueue() calls at the end
of the function.

Should the code either continue with cleanup on timeout (don't return), or
ensure NAPI and DMA state are properly cleaned up before returning?

> +
> +		airoha_qdma_stop_napi(qdma);
>  		airoha_qdma_clear(qdma, REG_QDMA_GLOBAL_CFG,
>  				  GLOBAL_CFG_TX_DMA_EN_MASK |
>  				  GLOBAL_CFG_RX_DMA_EN_MASK);

[ ... ]


