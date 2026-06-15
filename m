Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB2ACD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8kZOmjRF3nm/M3yU+1H+7o0l++3zGQDbGNNK8pg1Lc=; b=Ao1fwgk8mTQUXMPCbP/U3/GCuF
	13xxtfujwJueWGfm3yGVjKskeVWevWc6q9LewLdXxG0FIhB8m6MXBCv9zUKDmkIgaQKtzU/obFiTA
	qTE0TAn2WO/nreBU9DtZqTnxSJevkq08+/sEpmLVFl4aUqJG43q5elc7q9VA0vXjkOL6fz4yhkoNl
	s3pMPsl6e1YwfKWA+bcXP8szhi73WR3ovRt0XR81lgpOZysbIKTgUlNjBD0ZbtVEETYPIfmGHC6UU
	/QvLJC9WUOJBv37NBmBAiEyhAvYKw0eHJLNsKzeQPyc1eOiEjln+qWkloLePzSqmBSA/rjTT8ydtk
	hN+JS3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2kV-0000000DsQo-3dBG;
	Mon, 15 Jun 2026 08:32:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ2kU-0000000DsQR-2GSs;
	Mon, 15 Jun 2026 08:32:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02E476008A;
	Mon, 15 Jun 2026 08:32:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F4E1F000E9;
	Mon, 15 Jun 2026 08:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781512369;
	bh=l8kZOmjRF3nm/M3yU+1H+7o0l++3zGQDbGNNK8pg1Lc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FPpIFACXQZ95iX1KnmBpaNLqT5r/cZJk6jgXTOvwNIMIeDlzLyD98yeR966OLWcYZ
	 j/O+mhnP9AtkvHFfq3ZaQzdwjDn/aNMCxdtUsrfZJztDJuO/FgZsdLqx5pMKAUDg+c
	 Px/w3SqoUlmUX0VppMm2U5xAfWZ1uchnqZaCQsRuqRhaWAYJlyLFsbJdVcSVUHXNRv
	 1wGjHabsRhJ/ztgedUGARlNZoIYsXIAFQ8hHGrOcb1fJqK2LNl8VNlb7G/LqZwEI4C
	 j2M8ZlzR2jZxK6oZjNWvLjB4YUgvHZ3Qihje/QEy0vJCDSVkGr2PdG7UZx603nmcZ+
	 XWJygWyNHgPXw==
Date: Mon, 15 Jun 2026 09:32:45 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>
Subject: Re: [PATCH net-next v5 0/3] airoha: add the capability to configure
 GDM3/GDM4 as WAN/LAN on demand
Message-ID: <20260615083245.GD712698@horms.kernel.org>
References: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260611-airoha-ethtool-priv_flags-v5-0-c11de08486d1@kernel.org>
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

On Thu, Jun 11, 2026 at 11:55:50PM +0200, Lorenzo Bianconi wrote:
> Add the capability to configure GDM3/GDM4 as WAN/LAN on demand when QoS
> offload is created or destroyed.
> Make dev->qdma an RCU pointer so the TX path can safely dereference it
> without holding RTNL.
> Introduce airoha_qdma_start() and airoha_qdma_stop() helpers.

For the series:

Reviewed-by: Simon Horman <horms@kernel.org>


