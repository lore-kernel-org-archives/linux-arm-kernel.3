Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FD1CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ybN+zKzW5jtev4JOwijJxF6dmUlE6KgsldvxQFQEb8=; b=g+mFDRX2nYHHeyPztnTUTkDU/u
	b2TsqzcvI6AciFhioLgEE8o0/pcGBTn0SMnrihQefVk/mk+fL5s7PEpGyDhHfpEA/LD+LPYHoHXOv
	TnNcL46Medj99VllJhIWxquJN0wIObpVYH3z5ZlW014k94g0iWcP8Xv3fuTrSKas1AXWEnJQiJ7Lc
	AapY5JdjLuLvvhrj2vk11vSw0mMaqG2bsezIlDquIOV+/LGXHQ+lur0E3NqzM0vYHOdpt5p79D2L7
	OGTQx4TbVlTkvozL2zH8n7VDb8eA3O3g0yc3c9KeD6jSnin76abnk0N+yvJvhG9KeOtWuulM0BNEX
	kVQc45dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWlg-00000007vc4-1kQu;
	Sat, 09 May 2026 01:46:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLWle-00000007vbD-0cvb;
	Sat, 09 May 2026 01:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6178843B9E;
	Sat,  9 May 2026 01:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3B59C2BCB0;
	Sat,  9 May 2026 01:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778291169;
	bh=emN9I4dE2aoxQzpvVrwUfIhdo8UBKuater7jkdYqjpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vM5uqZMedY9Qkh5eyYP7uWgGEa0qCOkcOV6KLwb2/f6UBbXuFrmefKpUua32wtk35
	 gkuyZv9Q5NOtJ5LoYFqCYal4bR70j8XHQ5g6vOQaFmlAVQoGLYvr8ggjQzMRDpVX7Y
	 TdQUPZxI4+NW89lcOtSivEHgNL95pa48hjuMSJ/aKARvHqZBM13S5iHvX0jRGXqVkx
	 MDNKnRwmV15aG+6DdvL0jz4VLHxvwKEG1Abx9F/KxHxNI1S6Vgmya+MlMI/LeEBkYa
	 8Zuvc7y9wWV7z+BFOwIYbgqPrWCddzQiep7XTySGMU6Iiev159iRpfNy0vKUevXlAR
	 aZXrkfObq5B4Q==
From: Jakub Kicinski <kuba@kernel.org>
To: lorenzo@kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com,
	benjamin.larsson@genexis.eu,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	madhur.agrawal@airoha.com
Subject: Re: [PATCH net-next v4 03/10] net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct
Date: Fri,  8 May 2026 18:46:06 -0700
Message-ID: <20260509014606.3558018-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507-airoha-eth-multi-serdes-v4-3-af613b61ae02@kernel.org>
References: <20260507-airoha-eth-multi-serdes-v4-3-af613b61ae02@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_184610_310059_5BBC047D 
X-CRM114-Status: GOOD (  12.84  )
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
Subject: net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct

This patch moves the airoha_qdma pointer from struct airoha_gdm_port into
struct airoha_gdm_dev, as a preparation for allowing multiple net_devices
to share the same GDM{3,4} port via an external hw arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 4af64f182968..1798b4a6cf5d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -854,7 +855,8 @@ static void airoha_qdma_wake_netdev_txqs(struct airoha_queue *q)
>  		if (!port)
>  			continue;
>  
> -		if (port->qdma != qdma)
> +		dev = port->dev;
> +		if (dev->qdma != qdma)
>  			continue;
>  
>  		dev = port->dev;

[Low]
The resulting loop body assigns dev = port->dev; twice with nothing in
between that could change port->dev:

	dev = port->dev;
	if (dev->qdma != qdma)
		continue;

	dev = port->dev;
	for (j = 0; j < dev->dev->num_tx_queues; j++) {

Is the second dev = port->dev; intentional, or leftover from the
refactor that should be removed?

[Medium]
Can the new dev->qdma dereference run while port->dev is still NULL?

Looking at airoha_alloc_gdm_port(), eth->ports[p] = port is stored before
airoha_alloc_gdm_device() runs, and airoha_alloc_gdm_device() only sets
port->dev = dev at its very end, after several failure points
(devm_alloc_etherdev_mqs, netif_set_real_num_tx_queues,
of_get_ethdev_address).

The existing cleanup in airoha_probe's error_napi_stop path and in
airoha_remove guards accesses with if (dev && ...) when reading
port->dev, which suggests port->dev can legitimately be NULL while
eth->ports[i] is non-NULL.

Before the patch the equivalent check read port->qdma (an embedded field
zeroed by devm_kzalloc), so the compare was NULL-tolerant. After the
patch:

	struct airoha_gdm_port *port = eth->ports[i];
	struct airoha_gdm_dev *dev;
	...
	if (!port)
		continue;

	dev = port->dev;
	if (dev->qdma != qdma)
		continue;

would dereference a NULL dev if port->dev has not yet been assigned when
airoha_qdma_wake_netdev_txqs() runs. Would a NULL check on port->dev (or
reverting to the original port-field-based test) be appropriate here to
preserve the prior robustness?

