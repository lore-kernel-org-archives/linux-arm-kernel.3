Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F8CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DudOMLsQRV+n263ygkOCjNo/TpYnVuRGxN7vn/o0BCU=; b=vc+sNJkNJ0ZGR0Sz/8MjJckcEU
	/Vvm2mO7X3bzxOTRTqRKkU58Azo9vQklamD5ag2+5MEcXj7scDfZDRlXFp6gZQHgVMhJnZrRRcwuX
	zKCY5pi0j0EtjAK6GT0ennKMk5N7dyadMIYbY2Fr9xcKmYEBst0+Xo5o59s+6IQi9kSmSNh21CIl9
	cdmLll3i0cfD3E2rQwUhN9J2bkoJPdfiuUlV/gowuEtlGzaSdjxkbvcyZFRQgjZwPvsZFe2uHEqx9
	uNTneNwM16LWj/CLEqAQP+Azj35ytyCgbSTr4uoSiljnSNx8AahmxLwKRVd3BGb7qigDi5+CytwLN
	oTkVSFdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EzE-0000000ClTe-14tT;
	Mon, 13 Oct 2025 09:37:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8EzC-0000000ClTR-32a9;
	Mon, 13 Oct 2025 09:36:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12079611A3;
	Mon, 13 Oct 2025 09:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E215EC4CEFE;
	Mon, 13 Oct 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760348217;
	bh=Yn7TjBfBuD0cTKnd++PHp7G1b/Ur34AI7puSNAOld80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n6NvnqACa97Q5EohDysILSyqPs2pPG8bBTEgVxKXb7GRMJFkAK4Tvs2H3jAQMmOxo
	 5QETZF33oLTnRK2QXovE7gy6jQY5BFwrK2v15NpwI1jalM9WXNOAAZrdApBmWga8B/
	 47REY+apf591ZtewkgH4WjoA7hvR/5pzeX1XLXEUKHMDzcjzTmHLz38KNscoednQJq
	 8M7fN5eJCcZKsIY9zrAOeDcepo2hnEI3nCO2PvCbSCXdxToNoE3SyOw3exEuD7mAz/
	 +rZJp0VeQ9avfdO19WODybyFrwk7faBRvxR1lPVbz3TKbjpOx4dg+xduOXvjX93ysz
	 VWTr63UmwYmrA==
Date: Mon, 13 Oct 2025 10:36:53 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2] net: airoha: Take into account out-of-order tx
 completions in airoha_dev_xmit()
Message-ID: <aOzINXtv-gu50mJ7@horms.kernel.org>
References: <20251012-airoha-tx-busy-queue-v2-1-a600b08bab2d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251012-airoha-tx-busy-queue-v2-1-a600b08bab2d@kernel.org>
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

On Sun, Oct 12, 2025 at 11:19:44AM +0200, Lorenzo Bianconi wrote:
> Completion napi can free out-of-order tx descriptors if hw QoS is
> enabled and packets with different priority are queued to same DMA ring.
> Take into account possible out-of-order reports checking if the tx queue
> is full using circular buffer head/tail pointer instead of the number of
> queued packets.
> 
> Fixes: 23020f0493270 ("net: airoha: Introduce ethernet support for EN7581 SoC")
> Suggested-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
> Changes in v2:
> - Fix corner case when the queue is full
> - Link to v1: https://lore.kernel.org/r/20251010-airoha-tx-busy-queue-v1-1-9e1af5d06104@kernel.org

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>

