Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E88C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXBQkyiFLvXRPc/vOwn4FFBd5nq323zoO1sSOJOX4cw=; b=NkKX7NTakvyjeOfwywQ9pIDyV8
	q7DBx0QJKREk1dct36Gkt/EPFr0zfgNQEhFPfStiXqi4yBvEqROLu77fIe3ppCcusKUjyJS3ScXKK
	5Xu6Wft319kkIhZ5lPBtJvQ4o3olZu2bXj2wbVm+ndmqySxjYDGtmCdByXqQqSW9A8Ea3AIDBmaBa
	VkK4axeKMkWExBghGJUD1QeSv06Ilw/5B+tcyVdJFB7RzLtn0fDRfFd3/BCwukjTNSijt6606VerK
	pXdC4zr4Oe70vHahIkhzUd2BeOQpebk+wDJL66rJTfTLNSHKIBVen3JdoakLXrRut1EtnIp9W1lXU
	OZgii7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuPq-00000005tiS-3PKC;
	Mon, 17 Aug 2026 10:18:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuPp-00000005thm-25qi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:18:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6868600AE;
	Mon, 17 Aug 2026 10:18:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000DA1F000E9;
	Mon, 17 Aug 2026 10:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786961880;
	bh=TXBQkyiFLvXRPc/vOwn4FFBd5nq323zoO1sSOJOX4cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WnoxnwwNzxDZ1uTD3Jm53Egy4+C6aqoRoY0GEIURu9TYM82Zq+KqLLAJ/E2+/+UgC
	 M3LKx/OX2d5cuGEO1UZnES5hvb30VCRndCdCmDJLGMHFSiUhJ4tPIkuebjI6x+fVFc
	 54056sAl+BGJK1Lbbl5FuyrHxcXqwZqkNt2PJuLbhjKopgFXps6Xa+ABEO2rh1Lpi8
	 85D0gqTYZKc38c3RkDt/Cgbz3XaSYodY+Dyf0yuy0eQfJ4A6+3RbG6kV0jYw6lQ+fT
	 T9FC3OurG4v08tTv0HWDox4ksMeFINLXpqRB2B8uP2i+pZ/0T8/T5jOE0dTqPDugUo
	 aiXwObD4UGM8A==
Date: Mon, 17 Aug 2026 11:17:52 +0100
From: Simon Horman <horms@kernel.org>
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch,
	saeedm@nvidia.com, tariqt@nvidia.com, mbloch@nvidia.com,
	maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, aleksander.lobakin@intel.com,
	magnus.karlsson@intel.com, maciej.fijalkowski@intel.com,
	sdf@fomichev.me, ast@kernel.org, daniel@iogearbox.net,
	hawk@kernel.org, john.fastabend@gmail.com, witu@nvidia.com,
	martin.lau@kernel.org, yoong.siang.song@intel.com,
	rohan.g.thomas@intel.com, intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
	leon@kernel.org
Subject: Re: [PATCH net v2 3/3] net: stmmac: skip queueMaxSDU check for AF_XDP
Message-ID: <20260817101752.GY265046@horms.kernel.org>
References: <20260813190800.222527-1-sdf@fomichev.me>
 <20260813190800.222527-4-sdf@fomichev.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813190800.222527-4-sdf@fomichev.me>
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

On Thu, Aug 13, 2026 at 12:08:00PM -0700, Stanislav Fomichev wrote:
> Commit c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> was inspired by commit 92a0dcb8427d ("igc: offload queue max SDU from
> tc-taprio"), but the igc change does not apply the check to AF_XDP.
> 
> xsk_tx_peek_desc() reserves a completion entry. Continuing without
> queuing or completing the descriptor leaves the AF_XDP rings imbalanced,
> so remove the check from the zero-copy path.
> 
> The assumptions is that AF_XDP zero-copy traffic bypasses the qdisc, so
> taprio's queueMaxSDU check does not apply to this path.
> 
> Fixes: c5c3e1bfc9e0 ("net: stmmac: Offload queueMaxSDU from tc-taprio")
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>

Reviewed-by: Simon Horman <horms@kernel.org>


