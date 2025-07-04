Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1785C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwPESGhWKv+7KcG7Y+6hg6ArUz7BLGZW3c250YalFrk=; b=hejbKRMgz6kAb1eGbzftlf1p7Z
	JD5EF3tw6xBurOMJ6fIT5aXmxMM/Q98b+NlV2CgziriMMxUBDI+29EO0d6hCidQgd1k9LjoBdnUt1
	/xx3zxeUH995+iQatJ3xZdxLAq+E8SyF3G4yqouHWCUFYI4eScmpHM3Hy1f1hhLvFUXhEJljGJP0P
	/wk0Kv6Ts2KtiZ0QibKQ8FTI979VH/Yybxx+kmhPT3VeBr7NtNr8LYMTXUPpmzF5IFbYJRphIzIS2
	DpV3DSek0kf1e0tTsQIYlMJFU+vwKD5QvftLRH4TjdXOKC1fkq5tnXKJu9cHi+u7m56QtwusQ21aj
	bl0Gpk7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhyL-0000000Ekjq-3Lgq;
	Fri, 04 Jul 2025 15:05:05 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhlq-0000000Ej5p-0HAn;
	Fri, 04 Jul 2025 14:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F0CDA53C98;
	Fri,  4 Jul 2025 14:52:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADAFEC4CEE3;
	Fri,  4 Jul 2025 14:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640728;
	bh=KYFuRsqR/zu9FKP7GnSfbAmTbkR2pR9lH10PSgYV828=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UgSkqDYNHPRrNBMyLjRXv6KNc88Uo7f+E64cgYIKYBk+GHqPoAEhzpf7ou0EO7lqL
	 83WYucbPjic+d50gqC6WzcgvliuTcdwRB43sy+DJXRnIIU4gZvI9iUKh9RNOxvr4k8
	 bygqVu9rcHADe/eBZmVFYXzdcBpSX1wpXoV1eJQzE6bdHsSkXiHBIOpt0PJPETnXvn
	 5TxSkZT6wkizA1OVN455wCvarspTCHh5hxW8v5Q0hOUNDAAUsQ8N4VDI70hY5P2Cyv
	 zPHrxfZjQ6kzkwHgs6mIIhxZoSj8iyAzxPyCaAxnteaTkEa0cyTHZ0yFthoh/GkMln
	 a9Z5CZugJDZlw==
Date: Fri, 4 Jul 2025 15:52:04 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 3/6] net: airoha: npu: Add wlan irq management
 callbacks
Message-ID: <20250704145204.GB41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-3-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-3-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_075210_175061_8A488948 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jul 02, 2025 at 12:23:32AM +0200, Lorenzo Bianconi wrote:
> Introduce callbacks used by the MT76 driver to configure NPU SoC
> interrupts. This is a preliminary patch to enable wlan flowtable
> offload for EN7581 SoC with MT76 driver.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


