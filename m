Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3E1C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9R/jdzp6H0trc2YHptwzrPBCOeYRbcCIeW7Re4MZVEk=; b=LDLqErQh66bIhZ7dR73lAIuKjk
	KpuHdYhvoWCtPtUquaNDQplAKQCzrZKgKPkozlFxIqatCaXm7cT42AAeD24PhX1kCUvU2D5WL7J8S
	vcLVwqZf1KJsa5Gg4G3hsEzl9pft2kZwPg6QA7N3FQ230AZt3+qXLLI7EpoUpxQdRS/gczbZ/lX6F
	/DtmsUlBVIYtwOUS1R/ADSuf7wlss4GsjoznbQgVHbUeGv6aPAodUyJ8gGz3k4aAXg1csmSZXTxBF
	ah9y3SGay9YPKxf+n9yMFz0w6kumBt6czh2H1Or/AqN9tvgeiNgc2DqaPpbrd0S7Yk8n4X0h7BhBC
	9vj5qqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ih8-00000007bUw-3fiV;
	Wed, 23 Sep 2026 08:51:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ih7-00000007bUE-1EBv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:51:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 11BB140422;
	Wed, 23 Sep 2026 08:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B79D1F000FF;
	Wed, 23 Sep 2026 08:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153473;
	bh=9R/jdzp6H0trc2YHptwzrPBCOeYRbcCIeW7Re4MZVEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U38BvoMok+tVm3LD4Ox8Qje/Ld8r5MGUiJpdYr/Jfkn9dkII3NsVjrgAuBnuRCiXq
	 ogWXrdHo7tAqB7qAi2wc/OzUqDtWz9zl9+GPwdlr/uqVyP+6Gia9GfHI6VLfKDZfHC
	 nIN/kOJ028wE3w9LEY5xJ8np+WrRCSyUKdapHmMQ7XM5CrtM7UGYutgkC+yL8E0jkR
	 6rwemc1YCu2rFOe3+75D0zpdfR7MIPncEdcboAI9Mc7t3kmDGT4M2cyE029ClKegr8
	 RRzwKOUgVEBsbGHRoHcSo7CFAHyvH6TJhWsU1kUe4A9RCbf5hHAUmci0WI027bQfCC
	 4QmrVM1TVvucg==
Date: Wed, 23 Sep 2026 09:51:07 +0100
From: Simon Horman <horms@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	UNGLinuxDriver@microchip.com, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Herve Codina <herve.codina@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 03/14] net: microchip: fdma: add PCIe ATU
 support
Message-ID: <20260923085107.GL13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-3-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-3-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:55PM +0200, Daniel Machon wrote:
> When lan966x or lan969x operates as a PCIe endpoint, the internal FDMA
> engine cannot directly access host memory. Instead, DMA addresses must
> be translated through the PCIe Address Translation Unit (ATU). The ATU
> provides outbound windows that map internal addresses to PCIe bus
> addresses.
> 
> The ATU outbound address space (0x10000000-0x1fffffff) is divided into
> six equally-sized regions (~42MB each). When FDMA buffers are allocated,
> a free ATU region is claimed and programmed with the DMA target address.
> The FDMA engine then uses the region's base address in its descriptors,
> and the ATU translates these to the actual DMA addresses on the PCIe bus.
> 
> Add the required functions and helpers that combine the DMA allocation
> with the ATU region mapping. These are used by the lan966x PCIe FDMA
> path.
> 
> The ATU cannot express a limit finer than its 64KB region granularity,
> so pad the mapped allocation to that boundary; otherwise the outbound
> window would extend past the memory the host allocated for DMA.
> 
> This implementation will also be used by the lan969x, when PCIe FDMA is
> added for that platform in the future.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


