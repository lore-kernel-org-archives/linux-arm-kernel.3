Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3566CD6E61
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwhnOXJquDTFrNkY3bAEDfh98xtmc3TROZSuwO/v1yg=; b=zGW86iydpwxIA3g3Rko4OuNgJU
	wPaC14Ze/55mx783oyv05RJ4Hmc5lEG87Xx6cPmkcCZ9MsEitgZx7UKnoBbC3c1HHOK0f7Xr+7K8E
	m966apw5G/7r+sROkiG4wYQFA2bs7hi8O7f1BSOGRkZ6oe19ce6UQFrAgwuQR0ANxDTm1nnvie5fT
	J9pVO2D/WrpwDD95R60FIhY/zijo9T8T/asV97jWLXqavLOCaqbZqBQOORQI8NJIWVEbmV9ceveKR
	BMOFLhqNPKyLqpWRUq8ypR6SrR/HEoTtsbYVJH3urDRLyrvWDH+V7dFfI0z/gsdzZ686NlUMo5TXc
	QwmwElUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULRD-0000000CfQa-0iMd;
	Tue, 02 Jun 2026 09:29:31 +0000
Received: from m16.mail.163.com ([220.197.31.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wULR9-0000000CfLF-3Kbv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 09:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version:
	Content-Type; bh=hwhnOXJquDTFrNkY3bAEDfh98xtmc3TROZSuwO/v1yg=;
	b=PkZPaK8/d2mnZxilpRJtFfxV62MDrsJQxMOAqjTDtXrR17I6Tw7SdKqlbt/Kjn
	jCQ1Q1ESIJeBmDvVND9XFFsMWM/Yqgbbd8yiUAJje2Gaw5TzOncrZgaytnxWgcLe
	Q/g6t7AjnhMetcsI6DsrEjz/7Z2lQULkt+p5bmmBHS2SY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCn8hoxoh5qnwk+AA--.6197S2;
	Tue, 02 Jun 2026 17:28:18 +0800 (CST)
From: Ding Hui <dinghui1111@163.com>
To: pabeni@redhat.com
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	andrew@lunn.ch,
	davem@davemloft.net,
	dinghui1111@163.com,
	dinghui@lixiang.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	liuxuanjun@lixiang.com,
	maxime.chevallier@bootlin.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	rmk+kernel@armlinux.org.uk,
	xiasanbo@lixiang.com,
	yangchen11@lixiang.com
Subject: Re:Re: [PATCH v2] net: stmmac: fix fatal bus error on resume by reinitializing RX buffers
Date: Tue,  2 Jun 2026 17:28:17 +0800
Message-Id: <20260602092817.929979-1-dinghui1111@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260528120203.245762-1-pabeni@redhat.com>
References: <20260528120203.245762-1-pabeni@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: QCgvCgCn8hoxoh5qnwk+AA--.6197S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWfuw13AFy3tr13KrW5Awb_yoWruF47pF
	W7Aa1qkrykJr13Jw4UZw48uFy5Aay5tF4UCw13X3ZI9ayakr92vF4aqr45ua47Cr18Zw1S
	yF4UA3sxCF4DuFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pihL08UUUUU=
X-Originating-IP: [220.248.55.69]
X-CM-SenderInfo: pglqwx1xlriiqr6rljoofrz/xtbC0hLWA2oeojJeHwAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_022928_254803_AD6AE61A 
X-CRM114-Status: GOOD (  23.60  )
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

At 2026-05-28 20:02:02, "Paolo Abeni" <pabeni@redhat.com> wrote:

>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> index 3591755ea30b..0dc27d8c66a0 100644
>> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
>> @@ -1642,6 +1642,79 @@ static void stmmac_clear_descriptors(struct stmmac_priv *priv,
>>  		stmmac_clear_tx_descriptors(priv, dma_conf, queue);
>>  }
>>  
>> +/**
>> + * stmmac_reinit_rx_descriptors - re-program RX descriptors from existing
>> + *				   buffers (allocation-free)
>
>[ ... ]
>
>> +static void stmmac_reinit_rx_descriptors(struct stmmac_priv *priv,
>> +					 struct stmmac_dma_conf *dma_conf,
>> +					 u32 queue)
>> +{
>> +	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
>> +	int i;
>> +
>> +	for (i = 0; i < dma_conf->dma_rx_size; i++) {
>> +		struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];
>> +		struct dma_desc *p = stmmac_get_rx_desc(priv, rx_q, i);
>> +
>> +		if (rx_q->xsk_pool) {
>> +			dma_addr_t dma_addr;
>> +
>> +			/* The XSK pool may not be fully populated (e.g.
>> +			 * xdpsock TX-only); skip empty slots.
>> +			 */
>> +			if (!buf->xdp)
>> +				continue;
>
>[High]
>Does the continue here regress to the same fatal bus error this patch
>sets out to fix?
>
>When the slot is skipped, its descriptor address fields keep whatever
>HW writeback left behind. Then stmmac_clear_descriptors() runs right
>after stmmac_reinit_rx_descriptors() in stmmac_resume() and unconditionally
>re-arms OWN on every slot. For dwmac4 that is dwmac4_set_rx_owner():
>
>	p->des3 |= cpu_to_le32(RDES3_OWN | RDES3_BUFFER1_VALID_ADDR |
>			       RDES3_INT_ON_COMPLETION_EN);
>
>and for enh_desc / ndesc the equivalent OR of RDES0_OWN / RDES1 fields.
>None of these clear the address fields.
>
>When stmmac_hw_setup() restarts the DMA, the controller sees an owned
>descriptor with VALID_ADDR set and a stale address — the exact failure
>mode the commit message describes. Could the skipped slots be cleared
>(stmmac_clear_desc() or zeroing des0/des1/des2) instead of left intact,
>or arranged so clear_descriptors() does not arm OWN on them?

It's right that the skipped slots must be cleared instead of left intact.
This change will be reflected in version v3.

>
>> +
>> +			dma_addr = xsk_buff_xdp_get_dma(buf->xdp);
>> +			stmmac_set_desc_addr(priv, p, dma_addr);
>> +			stmmac_set_desc_sec_addr(priv, p, 0, false);
>> +		} else {
>> +			/* Theoretically unreachable: napi_disable() in
>> +			 * stmmac_suspend() ensures all initialized slots
>> +			 * have a valid page before we get here.
>> +			 * Defensive check only.
>> +			 */
>> +			if (!buf->page)
>> +				continue;
>
>[High]
>Is the comment "Theoretically unreachable: napi_disable() in
>stmmac_suspend() ensures all initialized slots have a valid page"
>accurate?
>
>stmmac_rx() assigns buf->page = NULL at multiple points when handing the
>page on to the stack or to XDP, for example:
>
>	buf->page = NULL;
>
>in stmmac_rx() after the page has been consumed.
>
>stmmac_rx_refill() allocates with GFP_ATOMIC | __GFP_NOWARN and breaks
>on allocation failure without advancing dirty_rx, leaving the failing
>slot (and any subsequent slots) with buf->page == NULL:
>
>	if (!buf->page) {
>		buf->page = page_pool_alloc_pages(rx_q->page_pool, gfp);
>		if (!buf->page)
>			break;
>		...
>	}
>
>stmmac_disable_all_queues() only does synchronize_rcu() and
>napi_disable() — it does not retry refills. Under the memory-pressure
>scenario this patch is explicitly designed to make safe, a prior
>GFP_ATOMIC failure can leave the ring with NULL-page slots at the
>moment suspend happens.
>
>If such a slot is then skipped here, the same OWN-with-stale-address
>condition described above applies on resume. Should the page_pool path
>also clear the descriptor for skipped slots, or allocate a replacement
>buffer rather than leave a stale-address descriptor for
>stmmac_clear_descriptors() to arm?
>
>> +
>> +			stmmac_set_desc_addr(priv, p, buf->addr);
>> +			stmmac_set_desc_sec_addr(priv, p, buf->sec_addr,
>> +						 priv->sph_active &&
>> +						 buf->sec_page);
>> +
>> +			if (dma_conf->dma_buf_sz == BUF_SIZE_16KiB)
>> +				stmmac_init_desc3(priv, p);
>> +		}
>> +	}
>
>[ ... ]
>
>> +}
>> +

Same as above, the skipped slots must be cleared instead of left intact.
This change will be reflected in version v3.

Thanks for the review. I will upload the v3 version soon.

Ding Hui


