Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B05DC982FA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80DZGmjDiR4Bg9Mnkz01B8NPJILVq5/IaueQvHOQ1e4=; b=3St41F04bHT10xvg4TAjabSoqI
	LpOK1H5Ms2q7PtNiad+IqrjtgLLMULVISDawEk96dDRmt8x+H4NwvVnaqtCj+k0WIin78Yz+GW32K
	i7dij9oygvEyj+V16/CIBgJ7EwYYUaQDBmdNQAV4qzOW1cgd4N9uZgQ1RKGpHrz5pIvSLQ4AOIZ2a
	57bKPSdbM8rRMQiVP/0ew5ppvHzjuHD1vZgKTur6wkaYWswMO+n56DRAFJOdKqNz890+8Pn4b2yLv
	70tr2+sbwukLX04TXK8ISMpzs82/BxAE+3gKoNBNdvJtqnQPnp7Lpf3syos7z0uDt8tIGcFO35ZkS
	Q3eG+VkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Il6-00000007ceS-2b6v;
	Wed, 23 Sep 2026 08:55:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Il5-00000007cdv-1R0G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:55:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C5B840DF5;
	Wed, 23 Sep 2026 08:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC871F00898;
	Wed, 23 Sep 2026 08:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153719;
	bh=80DZGmjDiR4Bg9Mnkz01B8NPJILVq5/IaueQvHOQ1e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iACzQIDDqwQYRnvhG9KkuG0heW/4q3SDDtbBW6U3CqrXRI3/mCeelAApaskR6VBPB
	 NUoief6+g5RW67Z/DNil33B6jzZeazIQLQFCp+7B7DOJ3iebE61O7rUWemyLYeQxNZ
	 L1xtANiGEvJBwnBtbPAXK9mlB8UasThAaT/3P9NtAob05M+vAZ86tlj2GAwlYP0kQt
	 T38Z8l3XATqB4k3TCFixC+Tm8BR5wxbk+dqu6KHoHr8fxF+Anu2dcLeHsEaJGEwT/t
	 l3M3eOkCqwCqeHsib1ylNFEfeKru04l+VfM39z1IERrQa3lpYZsUYBzoMHMDun6JBP
	 qHVAV2WRfkpTQ==
Date: Wed, 23 Sep 2026 09:54:42 +0100
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
Subject: Re: [PATCH net-next v7 04/14] net: lan966x: add FDMA LLP register
 write helper
Message-ID: <20260923085211.GM13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-4-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-4-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:56PM +0200, Daniel Machon wrote:
> The FDMA Link List Pointer (LLP) register points to the first DCB in the
> chain and must be written before the channel is activated. This tells
> the FDMA engine where to begin DMA transfers.
> 
> Move the LLP register writes from the channel start/activate functions
> into the allocation functions and introduce a shared
> lan966x_fdma_llp_configure() helper. This is needed because the upcoming
> PCIe FDMA path writes ATU-translated addresses to the LLP registers
> instead of DMA addresses. Keeping the writes in the shared
> start/activate path would overwrite these translated addresses.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


