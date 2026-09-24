Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B66C2C98314
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9U5Yx5v7I8BH9ZzG3vCb+fn78dwC+hyl9uOCicOfhQ=; b=H7tJr/Iomrbysxrh94F6D7EYJG
	JMSSKXMtjX7mnfGHvZQMrd58KG0VBERAlx5DLYft7ao2z+/NIFc1+cLPV/lrtiACW9T96uRnmM6TC
	Xx/ULDoCAmsmVEi3R52KLQSxwwe9nWKG6YG+TVeLQdAsI4OQzGZRJQBF/yFdQnb10/HwVI6MHsLA+
	YQyxlo2FlhlPyQXgrx8ck43no0rQ8Go2BjoWw3Nt2OotEi2GRyrLQA5G0S4o8OAn5D5lCjzm08x4O
	DWfMb0ls8GgSqJ6JiHtofaTNpFksfTtfpIplAEYVXGQ7CsfcMLj9wj5eS28pgaeQ2fuJRe+oFCvrt
	RwzfQZsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dL1-0000000ACFs-1AyY;
	Thu, 24 Sep 2026 06:53:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9dL0-0000000ACFk-1aa1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:53:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD9A960209;
	Thu, 24 Sep 2026 06:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70E9C1F00893;
	Thu, 24 Sep 2026 06:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790232825;
	bh=v9U5Yx5v7I8BH9ZzG3vCb+fn78dwC+hyl9uOCicOfhQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cViPT28AaCFTT7VyliU/cbiIZWP32lGsiq4ouP9bw7l1vf0LJbcApD5tXxvqt3HqK
	 FwYE4th7mb4fmjboLaC0D4vDUB0lGLJXO6/I8snfIDYq79y5UPqrLwRg6pxVO8teMK
	 iMH6AsmbfYO87Z8D0Z7TXREZXXUojvnhb5akylZGkCWpqa9fIXJxRg3YpiBZDAWFU5
	 cw/vmdxO1bA+LRdRVHgh85TqszLzjexFPvZjrYoQXGGYyrB2as2hbWEKgY+jJPGWVP
	 a2kFxmPFDCBIsqlz7xbH8pH3rgwSgyK1J6/fasTZtiuTtT59mcZkl+8YlrV2lOJzzR
	 eGZn5xnZ3/XFQ==
Date: Thu, 24 Sep 2026 07:53:39 +0100
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
Subject: Re: [PATCH net-next v7 12/14] net: lan966x: add PCIe FDMA XDP support
Message-ID: <20260924065339.GZ13925@horms.kernel.org>
References: <20260918-lan966x-pci-fdma-v7-0-0ecc179c8a2c@microchip.com>
 <20260918-lan966x-pci-fdma-v7-12-0ecc179c8a2c@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-lan966x-pci-fdma-v7-12-0ecc179c8a2c@microchip.com>
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

On Fri, Sep 18, 2026 at 01:34:04PM +0200, Daniel Machon wrote:
> Add XDP support for the PCIe FDMA path. The implementation operates on
> contiguous ATU-mapped buffers with memcpy-based XDP_TX, unlike the
> platform path which uses page_pool.
> 
> XDP sees the frame with IFH and FCS stripped. These are removed in
> lan966x_fdma_pci_rx_check_frame() before the BPF program runs, because
> after the program returns the driver cannot tell whether the tail
> region was modified. The skb_pull/skb_trim previously done in
> lan966x_fdma_pci_rx_get_frame() are removed for the same reason; the
> frame pointer and length are pre-computed by rx_check_frame() and
> passed through rx_get_frame() and lan966x_xdp_pci_run() to the caller.
> 
> lan966x_fdma_pci_xmit_xdpf() handles XDP_TX: it rebuilds a fresh IFH
> in the TX slot, copies the post-XDP frame after it, and lets HW insert
> a new FCS.
> 
> lan966x_xdp_setup() is extended so the PCIe path skips the page_pool
> reload that the platform path needs.
> 
> Only XDP_ACT_BASIC is supported.
> 
> Tested-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Simon Horman <horms@kernel.org>


