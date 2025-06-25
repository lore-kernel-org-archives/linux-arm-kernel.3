Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633E5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21mlcTHTaD8VDtaALhFYdfX7EhyrQTi9pS+W+Q3HmHk=; b=YyHh8Ycw3ctOWu824pEEnKdaeK
	JFt7OYxlVfgW7xB2TGqYiUx5wuKP93O+v8/oA9/ESsoDn2UuDQroQTzyvT0/aZgro1p3Geyi5ibKW
	yQQA7JG4PVwjLr4rtOTRcGXhCKRCT9t/nQIEXRkYZOMkuMEV4Yj1x5Zun5UFDN2ZTnzOwh8bA3v8S
	n81hfZ/vE45D3KSLGGqrwyqQPF83ZRyaxyGGK7ZRWEe/PiMYHL0teqeKg0KSrBHB/LL0PjhUqjwws
	OwKOAvzWaxDpuIoMpZAjv9OZd0rE9+d2c+CDZ31dLCl0VvAACwlkboCcDU1m9rdtaXNUU7S1X6aNg
	BLfOHbaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUZ0b-0000000A7sO-1YkC;
	Wed, 25 Jun 2025 22:54:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYmG-0000000A5WH-1uP1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 22:39:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2824CA52CB8;
	Wed, 25 Jun 2025 22:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58653C4CEEA;
	Wed, 25 Jun 2025 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750891174;
	bh=GcuNJbTYdXYziN1YijGv29rtLzd+WmmzNrw+qRJrnng=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TwrYSOnLz0kbxjQHL1jipsW+C8ZqtaxWWos0jTM4FqG5a/w6Hl6q4ot2W7fQN8+ZV
	 hbXJd64nBJxA/NdDa/ti7ABo4pZEzL5uF1f8i9qiHb1UvB0Im/jjpV5BTbr0Xn1wg2
	 YQQhT19yiVYqUe696FQT2MB9cW9Fo97IBmu5nkx6kyikCMazXups6s7SL+iMvAGgAy
	 POwfLjZuAqEEAcsWDXK1v96Ywz+cUxra82OuzDP/8Tnw8toATwVBVCtx2apBEX+7y2
	 mg1n32yAUjd3KpvwrsplLZZk8UQ1YwJ8BW6IdNxnfbi9ttRDQjQNFrV1xvvshT/2X3
	 sJSvhOZDNu4Qw==
Date: Wed, 25 Jun 2025 15:39:33 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: EricChan <chenchuangyu@xiaomi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, Feiyang Chen <chenfeiyang@loongson.cn>,
 Serge Semin <fancer.lancer@gmail.com>, Yinggang Gu
 <guyinggang@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, xiaojianfeng
 <xiaojianfeng1@xiaomi.com>, xiongliang <xiongliang@xiaomi.com>
Subject: Re: [PATCH] net: stmmac: Fix interrupt handling for level-triggered
 mode in DWC_XGMAC2
Message-ID: <20250625153933.7757fde3@kernel.org>
In-Reply-To: <20250625025134.97056-1-chenchuangyu@xiaomi.com>
References: <20250625025134.97056-1-chenchuangyu@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_153936_566788_D84AC39E 
X-CRM114-Status: GOOD (  15.29  )
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

On Wed, 25 Jun 2025 10:51:34 +0800 EricChan wrote:
> According to the Synopsys Controller IP XGMAC-10G Ethernet MAC Databook
> v3.30a (section 2.7.2), when the INTM bit in the DMA_Mode register is set
> to 2, the sbd_perch_tx_intr_o[] and sbd_perch_rx_intr_o[] signals operate
> in level-triggered mode. However, in this configuration, the DMA does not
> assert the XGMAC_NIS status bit for Rx or Tx interrupt events.
> 
> This creates a functional regression where the condition
> if (likely(intr_status & XGMAC_NIS)) in dwxgmac2_dma_interrupt() will
> never evaluate to true, preventing proper interrupt handling for
> level-triggered mode. The hardware specification explicitly states that
> "The DMA does not assert the NIS status bit for the Rx or Tx interrupt
> events" (Synopsys DWC_XGMAC2 Databook v3.30a, sec. 2.7.2).
> 
> The fix ensures correct handling of both edge and level-triggered
> interrupts while maintaining backward compatibility with existing
> configurations.

Could you please add a Fixes tag pointing to the commit in which 
the problem was introduced?

If the device you're working with is publicly available it may
also be worth mentioning what it is in the commit message.
Or at least mentioning whether you tested this on real HW,
or in simulation, or not at all.
-- 
pw-bot: cr

