Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72FC7C982EA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 08:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mgicnWaAz9WEZlH7S8mQa/MGfsAmlS+pMaAuGE5fsE=; b=YpEEIGMWl1BUXcWkcMmfgxabYM
	bKTbGHpmMXf4HLCJH5TlQT9Vs2i3Hou05z2g7Y2TkEFfj3GmqlCnGX4Xn1M3Ll6NJ+mNM3HNCH1Vq
	nfXX4kNByTn37Q+NRMdNH17+Um7oAs/KhXC6uFdVDYrwRSGWCD3Y6un1jKtcu9Yuzmd7c3eX6WK+M
	P9rdFIbX3exLDa2832MsqTAks1PfAA6iyjlmLyXnu3yCxyj2+eoaQ63kpXRhqRD4c+3d3I7mRB8ek
	IR5tN4BxdcWMeE0S10VHyjWWR0sOoVxiDDGdxbUMRykNlz45p1eZ1vko+eyxltDlTSX1o63BZa6HU
	m1+9Oq9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IgC-00000007b0y-0DZE;
	Wed, 23 Sep 2026 08:50:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9IgB-00000007b0R-1iBy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 08:50:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F3BF40AE2;
	Wed, 23 Sep 2026 08:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F52C1F000FF;
	Wed, 23 Sep 2026 08:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790153414;
	bh=/mgicnWaAz9WEZlH7S8mQa/MGfsAmlS+pMaAuGE5fsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fkKZSamInRjp0YI6W/QSd94uSdRqcQ9QG3AN7LzO5kpo4tlYBH/7stKVPbI3rLWyM
	 51Dj3Xr2eoRkgKWBU4SY7eLclI1AxSXOsxKETndqXL9ldyKkMhzAv/ZNZvub7kjzOt
	 DDU8nJDFcNzSiHFvnUTGQ0mtBiDOKWNMcWZumwBbB59w2fcSByR6RtKjuxmaYeao08
	 FQOno6iQvFl5zGAI3kL6lHZK/oMgAFXCndNUeKC7Nv1r0+KwtkLxzlLsPWdLNJrwdl
	 iSYhji6PMY481nS8SormHxQvzAsjaFE//fvW59ZmXBe19z1plukrQPQnmnIQ5+SRM5
	 IeQxyNoTML6Gg==
Date: Wed, 23 Sep 2026 09:49:38 +0100
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
Subject: Re: [PATCH net-next v7 02/14] net: microchip: fdma: rename
 contiguous dataptr helpers
Message-ID: <20260923084938.GK13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-2-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-2-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:33:54PM +0200, Daniel Machon wrote:
> When the FDMA library was introduced [1], two helpers to get the DMA and
> virtual address of a data buffer, in contiguous memory, were added. These
> helpers have had no callers until this series. I found the naming I
> initially used confusing and inconsistent.
> 
> Rename fdma_dataptr_get_contiguous() and
> fdma_dataptr_virt_get_contiguous() to fdma_dataptr_dma_addr_contiguous()
> and fdma_dataptr_virt_addr_contiguous(). This makes the pair symmetric
> and clarifies what type of address each returns.
> 
> [1]: commit 30e48a75df9c ("net: microchip: add FDMA library")
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


