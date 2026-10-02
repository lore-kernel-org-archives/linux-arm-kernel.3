Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B6CCA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbYSzylms7o12wuCPlSjyl59qP4qkoDF5kmaNChmMWU=; b=TOS2zBdfFCItb1Oeths1cszp5M
	Ct3pnPn529syCyaTRaZe9xryaKzYhCfCe7j+i30oSMTkLsdqEJcbsLFF89ucO8pZdurSBPZXZi0by
	RYH5Y8RDalbdGXER4DDEH2wxSEj7c6IABl8dpG0MqPl02uWzmr/+7bjemjPCaPxdyaLO9bQSCctt9
	CMRyTO3YFxxWTpN9RiPYrDXQ49QFEdUNisIGZZ43A5t0taBZqXJ8hPG8jjfwryDOThGxdy5oZ5uBq
	I7Svh9bhP6/MXQDkFmu0Z0KWw1nyD5+wuvAJzyxANR7jyJCprxSpdlBmPSjxhZuLhRoayOoESp+IX
	kui6yDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdGt-0000000Bf7O-3JLD;
	Fri, 02 Oct 2026 13:25:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdGt-0000000Bf7I-0wMb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:25:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F39740938;
	Fri,  2 Oct 2026 13:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A85371F000FF;
	Fri,  2 Oct 2026 13:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947554;
	bh=PbYSzylms7o12wuCPlSjyl59qP4qkoDF5kmaNChmMWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmHxuDyafXnH6yN6mdvkdJmGGHhTaFZoYT4ccKchi2fE4Z+4PokAD8XIcNBYlMYvV
	 RSIZAUNlwRIPbZYcANRZUpqIKFhchZAkAusigMIXZutGLqGpXEmHfj7C9XXIesU0z3
	 Sh1/onvDtHA06k2nWqnerjLTR/tu4og1uik5eKrqpCsSe74TLF9kIX87Id3e7WiOrK
	 JZLWej9ZmCt10qyfJRfGIT5YPa4wysnkcucxRzDtgw5WzUwy8/+7Oq9GfQxWFv8edI
	 8Zxnl8k5KWF6GDUOPX6UgoXS8MHY7XJjbDhUVETVhU2qLcR2pgVxDYmAjIeh02OvBY
	 dYHjGwkxACS4Q==
Date: Fri, 2 Oct 2026 14:25:48 +0100
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
Subject: Re: [PATCH net-next v9 04/15] net: microchip: fdma: use
 little-endian types for descriptor fields
Message-ID: <20261002132548.GH13925@horms.kernel.org>
References: <20260928-lan966x-pci-fdma-v9-0-a17caf60f89a@microchip.com>
 <20260928-lan966x-pci-fdma-v9-4-a17caf60f89a@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928-lan966x-pci-fdma-v9-4-a17caf60f89a@microchip.com>
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

On Mon, Sep 28, 2026 at 09:32:52PM +0200, Daniel Machon wrote:
> The FDMA engine reads and writes the DCB and DB descriptors in
> little-endian byte order. So far the descriptors have only been produced
> by the little-endian SoC itself, so plain u64 fields were fine. With the
> PCIe FDMA path, the descriptors live in host memory and are written by
> the host CPU, which may be big-endian.
> 
> Change the descriptor fields to __le64 and convert at the library
> boundary: in __fdma_db_add() and __fdma_dcb_add() on write, and in the
> fdma_db_*() accessors on read. The dataptr and nextptr callbacks keep
> their u64 signatures, so their implementations are unchanged. Add
> fdma_db_dataptr_get(), and convert the lan966x sites that read the
> descriptor fields directly to use the accessors.
> 
> No functional change on little-endian hosts.
> 
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


