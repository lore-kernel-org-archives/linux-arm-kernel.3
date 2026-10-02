Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590BECA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zgilu93Hp4FlU2A2Q+0E24y0uk6qApz0rFUUk+jie8=; b=37NvaCTAg5tp9e+/y2ovTf2Too
	oZIbhFLLeZD5GtBsZTktxS+CSqCbtmy44mViY0u/KurPgOYse5jL4D4km9CK67J/EIdFEjeqnnsDo
	Aap8LRDdmIOmOcYrLwWQ/K2Ee9vbTJ74gIHrZUGTHuuz8t7LqzRN/AqeVTSMAZ3Y4PvbSZQmHSRn6
	VEQZfG7Ayj5n2kJ7u1OaFu4e2u/kUrjl19HI/mDsg8Z/6dH04S527VKbhYIN6dkC8ZbYcxW9JiQsA
	+uoLdYn20zQf8hXsIkbSKmC28K+f4nWxm/TeZZ7oLy3qpP1CENYJwI0g8PttqHZCABGkdYApUcbll
	18CXWXvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCe2S-0000000Bl52-2EJP;
	Fri, 02 Oct 2026 14:15:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCe2Q-0000000Bl4d-0GNi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:15:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49B8C439CF;
	Fri,  2 Oct 2026 14:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60EB41F000FF;
	Fri,  2 Oct 2026 14:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790950501;
	bh=6zgilu93Hp4FlU2A2Q+0E24y0uk6qApz0rFUUk+jie8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R7QQYL1Nqt64YeWSigZIxuY27nMZq8IArDoFjTRP1ex7LDXrfdfnoi/DeCe4ewvBv
	 J+aYs2ahtRXbKTYd2IZJEaeMW2GE6vPhnRFAfmgsGc6zVUrUMgx0ncrZ7Wmtg3PNg+
	 Y4agbe7YQKBZWjhgrKoKZbLhzUqp2SWvB1C7MEJ9mNsAoabBcqHjxKixMiUByeWh2o
	 wMUf73wkyqMRhd8HnXu5vbtoW2PGIQJ74y1IZ6fNk4P8/MnNbRsdk6reNa4bypV1ki
	 XsAjmqjn0F0oiaTK77tEJU1tF2e3LTjLw3gzoZtHJySHeil/vd7ExKpoUkw8rr0Ya3
	 OTDTpiIYRBizQ==
Date: Fri, 2 Oct 2026 15:14:55 +0100
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
Subject: Re: [PATCH net-next v9 11/15] net: lan966x: add PCIe FDMA support
Message-ID: <20261002141455.GI13925@horms.kernel.org>
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
 <20260928-lan966x-pci-fdma-v9-11-a17caf60f89a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-lan966x-pci-fdma-v9-11-a17caf60f89a@microchip.com>
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

On Mon, Sep 28, 2026 at 09:32:59PM +0200, Daniel Machon wrote:
> Add PCIe FDMA support for lan966x. The PCIe FDMA path uses contiguous
> DMA buffers mapped through the endpoint's ATU, with memcpy-based frame
> transfer instead of per-page DMA mappings.
> 
> With PCIe FDMA, throughput increases from ~33 Mbps (register-based I/O)
> to ~620 Mbps on an Intel x86 host with a lan966x PCIe card.
> 
> The RX path uses its own copy of lan966x_hw_offload() that reports back
> when skb_vlan_untag() frees the skb, so the caller can drop the frame
> instead of touching it.
> 
> XDP is not supported on this path yet, so do not advertise xdp_features
> and reject program attach for PCIe instances.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


