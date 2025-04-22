Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1ADC369D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=weXN4IQwhPqB9cEpvD0ds3Xd1d/HGeU1/wCq5TjQLSw=; b=MNL+J/6jBDqj4v/gKGPZK3V2Rv
	cBhVNYsQmJgtK+98bQSt8XaiTfnldkznut1sd3KI7B5AInk+eUXx0viNQQ3pwDQ5MtbycXFGO6JYy
	BxnQM3Il4O0djIVLWJNdN1NdwlFXCOunQdLGVntWRMZS3BBrQy4egUtmN9EowC2R8N2IhdXEuIA8v
	xi75My7LoM8Z8L0Uf1Ur78qrmq+SnkNr+MLv1Hu4X3J82n49uFbN0BnsiOBDSl/OaDzVvSBUSfjLU
	x6ztpfqmsam9jN7DaE4bU40+B/P2m5MI2r8b1cFTIdnaRWgiQieVyIl8frYzw+iFV/QBgtVXWZNDq
	YBfH/Ilg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8V-000000085aV-3FvS;
	Tue, 22 Apr 2025 18:14:24 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7EBm-00000007PIc-04Wq;
	Tue, 22 Apr 2025 14:01:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 703CE1FD49;
	Tue, 22 Apr 2025 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745330449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=weXN4IQwhPqB9cEpvD0ds3Xd1d/HGeU1/wCq5TjQLSw=;
	b=D/iYA3tlYeAcV2qo72QQQOulGZa0PhsLCGGvS2XtBrOpw9eF8L2L4D9/s5tHpodwvgqhjl
	kmBrBYJIQ9O+w0G7V/e/s4rTEx8ePugOcsOi/axI+3tvbIrj8BoJ2EHiUuVUAfyCCTQ1Z7
	rHAPcZtVSBvSeXGSXhzHxxW8GBHGBR7+3gXQTL9TnRkvDXOWr2Siu5T35DUTEHp+LW3JXS
	hmoxGmVBlDWPqoTeH8thQsfugxGpqtB24ZOdsuZS9I+BxpLnADoo13MVbLXOi795wH2MfT
	QbOwyI/TRn12q6AFSlFhYeLjVZ99b5PZtg/S9/lbG60a2hZrhVf9WlN3G6wNNQ==
Date: Tue, 22 Apr 2025 16:00:46 +0200
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Biao
 Huang <biao.huang@mediatek.com>, Yinghua Pan <ot_yinghua.pan@mediatek.com>,
 kernel@collabora.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] net: ethernet: mtk-star-emac: fix spinlock
 recursion issues on rx/tx poll
Message-ID: <20250422160046.73aa854a@fedora.home>
In-Reply-To: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-1-1e94ea430360@collabora.com>
References: <20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-0-1e94ea430360@collabora.com>
	<20250422-mtk_star_emac-fix-spinlock-recursion-issue-v1-1-1e94ea430360@collabora.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevledtvdevueehhfevhfelhfekveeftdfgiedufeffieeltddtgfefuefhueeknecukfhppedvrgdtudemtggsudelmeekugegheemgeeltddtmeeiheeikeemvdelsgdumeelvghfheemvgektgejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugeehmeegledttdemieehieekmedvlegsudemlegvfhehmegvkegtjedphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudekpdhrtghpthhtoheplhhouhhishgrlhgvgihishdrvgihrhgruhgusegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepnhgsugesnhgsugdrnhgrmhgvpdhrtghpthhtohepshgvrghnrdifrghnghesmhgvughir
 ghtvghkrdgtohhmpdhrtghpthhtoheplhhorhgvnhiioheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgifodhnvghtuggvvheslhhunhhnrdgthhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_070130_495652_07324677 
X-CRM114-Status: GOOD (  19.12  )
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

Hi Louis-Alexis :)

On Tue, 22 Apr 2025 15:03:38 +0200
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> wrote:

> Use spin_lock_irqsave and spin_unlock_irqrestore instead of spin_lock
> and spin_unlock in mtk_star_emac driver to avoid spinlock recursion
> occurrence that can happen when enabling the DMA interrupts again in
> rx/tx poll.
> 
> ```
> BUG: spinlock recursion on CPU#0, swapper/0/0
>  lock: 0xffff00000db9cf20, .magic: dead4ead, .owner: swapper/0/0,
>     .owner_cpu: 0
> CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted
>     6.15.0-rc2-next-20250417-00001-gf6a27738686c-dirty #28 PREEMPT
> Hardware name: MediaTek MT8365 Open Platform EVK (DT)
> Call trace:
>  show_stack+0x18/0x24 (C)
>  dump_stack_lvl+0x60/0x80
>  dump_stack+0x18/0x24
>  spin_dump+0x78/0x88
>  do_raw_spin_lock+0x11c/0x120
>  _raw_spin_lock+0x20/0x2c
>  mtk_star_handle_irq+0xc0/0x22c [mtk_star_emac]
>  __handle_irq_event_percpu+0x48/0x140
>  handle_irq_event+0x4c/0xb0
>  handle_fasteoi_irq+0xa0/0x1bc
>  handle_irq_desc+0x34/0x58
>  generic_handle_domain_irq+0x1c/0x28
>  gic_handle_irq+0x4c/0x120
>  do_interrupt_handler+0x50/0x84
>  el1_interrupt+0x34/0x68
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  regmap_mmio_read32le+0xc/0x20 (P)
>  _regmap_bus_reg_read+0x6c/0xac
>  _regmap_read+0x60/0xdc
>  regmap_read+0x4c/0x80
>  mtk_star_rx_poll+0x2f4/0x39c [mtk_star_emac]
>  __napi_poll+0x38/0x188
>  net_rx_action+0x164/0x2c0
>  handle_softirqs+0x100/0x244
>  __do_softirq+0x14/0x20
>  ____do_softirq+0x10/0x20
>  call_on_irq_stack+0x24/0x64
>  do_softirq_own_stack+0x1c/0x40
>  __irq_exit_rcu+0xd4/0x10c
>  irq_exit_rcu+0x10/0x1c
>  el1_interrupt+0x38/0x68
>  el1h_64_irq_handler+0x18/0x24
>  el1h_64_irq+0x6c/0x70
>  cpuidle_enter_state+0xac/0x320 (P)
>  cpuidle_enter+0x38/0x50
>  do_idle+0x1e4/0x260
>  cpu_startup_entry+0x34/0x3c
>  rest_init+0xdc/0xe0
>  console_on_rootfs+0x0/0x6c
>  __primary_switched+0x88/0x90
> ```
> 
> Fixes: 0a8bd81fd6aa ("net: ethernet: mtk-star-emac: separate tx/rx handling with two NAPIs")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

As this is a fix, you need to indicate in your subject that you're
targetting the "net" tree, something like :

[PATCH net 1/2] net: ethernet: mtk-star-emac: fix spinlock recursion issues on rx/tx poll

> ---
>  drivers/net/ethernet/mediatek/mtk_star_emac.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> index 76f202d7f05537642ec294811ace2ad4a7eae383..41d6af31027f4d827dbfdfecdb7de44326bb3de1 100644
> --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> @@ -1163,6 +1163,7 @@ static int mtk_star_tx_poll(struct napi_struct *napi, int budget)
>  	struct net_device *ndev = priv->ndev;
>  	unsigned int head = ring->head;
>  	unsigned int entry = ring->tail;
> +	unsigned long flags = 0;

You don't need to init flags to 0

>  
>  	while (entry != head && count < (MTK_STAR_RING_NUM_DESCS - 1)) {
>  		ret = mtk_star_tx_complete_one(priv);
> @@ -1182,9 +1183,9 @@ static int mtk_star_tx_poll(struct napi_struct *napi, int budget)
>  		netif_wake_queue(ndev);
>  
>  	if (napi_complete(napi)) {
> -		spin_lock(&priv->lock);
> +		spin_lock_irqsave(&priv->lock, flags);
>  		mtk_star_enable_dma_irq(priv, false, true);
> -		spin_unlock(&priv->lock);
> +		spin_unlock_irqrestore(&priv->lock, flags);
>  	}
>  
>  	return 0;
> @@ -1342,15 +1343,16 @@ static int mtk_star_rx_poll(struct napi_struct *napi, int budget)
>  {
>  	struct mtk_star_priv *priv;
>  	int work_done = 0;
> +	unsigned long flags = 0;

There's a rule in netdev that definitions must be ordered from longest
to shortest lines (reverse xmas tree, or RCT), so you should have in
the end :

struct mtk_star_priv *priv;
unsigned long flags;
int work_done = 0;

>  
>  	priv = container_of(napi, struct mtk_star_priv, rx_napi);
>  
>  	work_done = mtk_star_rx(priv, budget);
>  	if (work_done < budget) {
>  		napi_complete_done(napi, work_done);
> -		spin_lock(&priv->lock);
> +		spin_lock_irqsave(&priv->lock, flags);
>  		mtk_star_enable_dma_irq(priv, true, false);
> -		spin_unlock(&priv->lock);
> +		spin_unlock_irqrestore(&priv->lock, flags);
>  	}
>  
>  	return work_done;
> 

Besides these small comments, the patch looks correct to me :)

Regards,

Maxime

