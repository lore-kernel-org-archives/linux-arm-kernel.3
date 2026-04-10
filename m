Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987F9F36BA0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 02:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=viDYrlihYZNkCXCtGQ4zBOjGUY2uxxjJAlGGYzgd7jQ=; b=NbkcPU/dxEiFV7mIxEWlc1/Rom
	YZoIRR6+uHw3SlZVcX/rKlQ08MldHlr4DxFkcWAlbP337twRBeIM+aivGD1NRqyp8r7FiJYTsAiW7
	DiGlD5F2cqfXPu/6T+1c2d8H6CkFM5x+aW/0W9dhkhkMilsOLg2CzE8qyOmhhiLY0kocpdJALYVQW
	7yT+7fB8siugAMFyat/sB0sC4Y9Y0Po6Yk1KVGCv6woN1aA4PirNARdfakjefRJI16lCPJUc36lgB
	UzPg+Z1UI+qUYA6Az1nzuQ8T8gYFvEzmWVqeN7OHPpDgclYUSrCkh6Um1iDQ0NZFlx/SmkJ9EgJ/y
	OUc54iqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23h-0000000BUwb-3NcP;
	Fri, 10 Apr 2026 02:57:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB23f-0000000BUuy-0ZFX;
	Fri, 10 Apr 2026 02:57:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64AD460128;
	Fri, 10 Apr 2026 02:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 743D1C4CEF7;
	Fri, 10 Apr 2026 02:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775789842;
	bh=L6wszwS8qFkzeqIRGzk3Bj9pcAOHKFzChEeUvPEdrVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=unC8irle7Z3WU/wQW+tQG3kvvhONwihsBJSpZ61ZtOgJMg9y5hpsgn9k+vJYEcT+c
	 HYnfv4g5AcYBdjEkZdN/iLtFLVzOfn3zTaOYEjxRj1RKujkw18nUmpDqnYRS+C4msc
	 cuh9JKjZta34u229RaBwakIw166xI1ktxuAkvyLaSNYGIfYh9yFd4oe5pKhUm5eyqI
	 Byl9p1++5upj/hfB36VMkud/RZJ0jr9TG70WXdJi6q9pIyE/4v0SKCnmWr8e08WRjv
	 LWTkLaANz/OuTlTanVHD2TpMaUj3nL5RqWBeGHwF4cv6faXsaVtlN155Li1VR129D2
	 2CbU6tOPE5cuA==
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v3 02/12] net: airoha: Set PPE cpu port for GDM2 if loopback is enabled
Date: Thu,  9 Apr 2026 19:57:20 -0700
Message-ID: <20260410025720.1809934-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-2-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-2-ab6ea49d59ff@kernel.org>
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
email says "For your consideration."
---
net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct

This commit moves the airoha_qdma pointer from the airoha_gdm_port struct
to the airoha_gdm_dev struct. This ensures the QDMA block used depends on
the specific net_device WAN/LAN configuration.

[ ... ]

> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -1497,9 +1498,10 @@ static void airoha_qdma_stop_napi(struct airoha_qdma *qdma)
>  	}
>  }
>  
> -static void airoha_update_hw_stats(struct airoha_gdm_port *port)
> +static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
>  {
> -	struct airoha_eth *eth = port->qdma->eth;
> +	struct airoha_gdm_port *port = dev->port;
> +	struct airoha_eth *eth = dev->eth;
>  	u32 val, i = 0;
>  
>  	spin_lock(&port->stats.lock);

This isn't a bug introduced by this patch, but does this spin_lock()
carry a deadlock risk?

Because ndo_get_stats64() can be called from atomic context (e.g., from a
softirq), if a process context caller holds port->stats.lock and is
interrupted by a softirq on the same CPU that also triggers dev_get_stats(),
the softirq could spin forever waiting for the lock.

Should this be upgraded to spin_lock_bh() to ensure local softirqs are
disabled during the critical section?

[ ... ]

> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -534,12 +534,12 @@ struct airoha_qdma {
>  
>  struct airoha_gdm_dev {
>  	struct airoha_gdm_port *port;
> +	struct airoha_qdma *qdma;
>  	struct net_device *dev;
>  	struct airoha_eth *eth;
>  };
>  
>  struct airoha_gdm_port {
> -	struct airoha_qdma *qdma;
>  	struct airoha_gdm_dev *dev;
>  	int id;

This isn't a bug introduced by this patch, but since the qdma pointer
is being moved to better align with the hardware structure, should 
qos_sq_bmap, cpu_tx_packets, and fwd_tx_packets be moved to 
struct airoha_qdma as well?

Because QDMA1 is shared by all WAN ports (GDM 2, 3, 4) and qos_sq_bmap
is currently tracked per-port instead of per-QDMA, each WAN port 
independently allocates QDMA1 channels starting from index 0. Does this 
cause different ports to overwrite each other's hardware QoS configurations 
in the shared QDMA1 block?

Furthermore, cpu_tx_packets and fwd_tx_packets cache per-channel ETS
hardware counters but are single u64 scalar variables in the port structure.
When querying stats for multiple channels, do these scalar caches get
overwritten with values from completely different channels, resulting in
incorrect delta calculations?

