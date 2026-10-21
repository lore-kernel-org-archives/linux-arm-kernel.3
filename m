Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289DA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 01:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ycREuQ9q;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQn6XZEm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nek6SQB9HilcNqrUDKvbjnwNeRbszXlVW1qjIvvxAf8=; b=ycREuQ9qH1JJ0ALxLzBpt2zAnv
	AmKUDZ5NXc5++i0nS1IMeBF+jrXg+SFduNUW/7FBNVQUCcqNQfW6vQHMXwCPNgR/XLAptbnqYHZI1
	HfIlS+qoWCaj/r0EjIo5T26AL0tR0tMDC5+nlDGgVcMU9F4P5DsKCSoTXdcKVG2Zu8k50Ygsn1FH1
	mWliC9nVgPnTVRSKPxvEv6Y9ZjLPbgPoxGapZw+xZD0DHf3B2u8xdz7IOvAKjRu9S7PQih14EYPz2
	yZpXmtHrSwJKTSXFPDg8h3QLArGkyrKc7upFiO5WL/A/lc5az0vgHg6OoRJIczuemaRoha1RqpdVS
	7DCpUaJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJKlN-0000000Asnq-1RQx;
	Wed, 21 Oct 2026 01:05:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJKlL-0000000Asnd-29dR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 01:05:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B536A601FE;
	Wed, 21 Oct 2026 01:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B860C1F000C9;
	Wed, 21 Oct 2026 01:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792544702;
	bh=Nek6SQB9HilcNqrUDKvbjnwNeRbszXlVW1qjIvvxAf8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=CQn6XZEmx4JuBxOCkGUoJxghD6fgxKGGvSTb7ELHt1bjWPlVx48I+kyKIgnc0qr7c
	 NhgbVZWa4Lwo67KLrbjDl6sjNbG4cTE3Y5zwpFpZVpbAbOITcS/Wfx9vxPUj1slJkb
	 WQsgQF7PJo+NWG+9REo4JUnCIzps60aCpEq1pTNgCxknuRGsxQ/gOkPWoyRJ4hCZQJ
	 oygMrQghn5CeQf526xtBNeHcN/kfyQUR9srbICRbEtVMDVVoumuUqSJ5TVXxHPjBdT
	 nNgxYhhdyIj2yHGGFqz+jS84eNxdAe8gyzYkwDhnv3dL3FzNUVDWKKnYaMtQSYdKhy
	 MV4yOooKiLIxA==
Date: Tue, 20 Oct 2026 18:05:01 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Thompson <daniel@riscstar.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev
 <sdf@fomichev.me>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Eric
 Dumazet <edumazet@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Alex Elder <elder@riscstar.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Avoid freeing and
 re-requesting IRQ during XDP set prog
Message-ID: <20261020180501.59a77f38@kernel.org>
In-Reply-To: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
References: <20261015-tc956x-stmmac-no_irq_teardown-v3-0-8189870be545@riscstar.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 15 Oct 2026 15:55:00 +0100 Daniel Thompson wrote:
> Currently stmmac will run a full cycle of IRQ tear down and setup when
> setting up a new XDP program. This makes tuning TSN systems difficult
> because whenever a new XDP program is installed then the irq threads will
> be stopped and restarted which will undo any thread tuning.

Series does not apply

