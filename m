Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935B4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QT47o+62gx1hHba5ZZ9rrXyxlq6ku1sMz4BWbaK2vs8=; b=wGBRzP/AcydwwJ08Y9bAypk0+F
	GRF9Psybh2PVmIHa5h8FdumQBGLd2/jX+it7gtfPxUoUmyROf3QBKgv9iH9uewUAp9nxyOhD9BLYI
	Ek+1mTfJjJXmB95hGxSp47BF2uwLQjKS7bJ2dM1qJyCf2XDWGVGcKAUlniKtCVkiLvCiZF+MW3PR9
	1xlV2d0h0i+Dm7Nf0Mg+yn3NucgJFPJkloKx1gCyI+ZIb56pJ4sEeeVxNx8rYVhHb/9gJaBAc1nMK
	T+j9hxpUCTXrEi/zZJF6AJMuuFjAFCOM90CfdikqQFdKPvzUKU/rXjBDNfAQLwUW3qGcgI3yaOo/S
	zJ7WTSGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL9p-00000007pkO-2SNO;
	Tue, 18 Feb 2025 10:48:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkL7o-00000007pIi-2h35
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:46:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1EF0BA41E04;
	Tue, 18 Feb 2025 10:45:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A6EC4CEE6;
	Tue, 18 Feb 2025 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739875606;
	bh=lFybjn1lzd3uty5K8+/fX/EZsa8vtx9u05tnjD6rAIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LN7/crkcTZHdkdwLpR5JGrRCG/xYcwV7jukPGpHXq4XaRTgDpWXcdWfMYMQNzCuLT
	 rp9K9RFdMnXPh7bxX14G9dTedkkgHsGLvroa1YFHmxWysSxdXBN+v3u0OMDJOwJxp5
	 n9i3l+MKZfktPcPbepwTA6J0VHfftOEH1fEt9BOXlGJkKtwBeaAfxPs4+r0fWUcuz5
	 fjRrEIx+31QqVfgVhFvjtPmZtO8sPLciHzQ0wulItC7Y8mV04Kt+MoVrSSbn8RhWbU
	 iz1AF7CwjyotSIrAM9Y4IcK2/OY56JRKQI9+ugfNzT6RAp57fZ/epqu3GHD6sQ7pHk
	 VXTUxoHEdDUqQ==
Date: Tue, 18 Feb 2025 16:16:43 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, srk@ti.com,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dmaengine: ti: k3-udma-glue: Drop skip_fdq argument from
 k3_udma_glue_reset_rx_chn
Message-ID: <Z7RlE+QfzdQ07spk@vaman>
References: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116-k3-udma-glue-single-fdq-v1-1-a0de73e36390@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_024648_747248_25E040C3 
X-CRM114-Status: GOOD (  11.25  )
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

On 16-01-25, 17:00, Roger Quadros wrote:
> The user of k3_udma_glue_reset_rx_chn() e.g. ti_am65_cpsw_nuss can
> run on multiple platforms having different DMA architectures.
> On some platforms there can be one FDQ for all flows in the RX channel
> while for others there is a separate FDQ for each flow in the RX channel.
> 
> So far we have been relying on the skip_fdq argument of
> k3_udma_glue_reset_rx_chn().
> 
> Instead of relying on the user to provide this information, infer it
> based on DMA architecture during k3_udma_glue_request_rx_chn() and save it
> in an internal flag 'single_fdq'. Use that flag at
> k3_udma_glue_reset_rx_chn() to deicide if the FDQ needs
> to be cleared for every flow or just for flow 0.

This fails to apply for me on dmaengine/fixes, can you please rebase and
resend

-- 
~Vinod

