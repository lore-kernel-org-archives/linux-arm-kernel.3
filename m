Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F4ECFD35B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 21:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=C/E7ZuF1WG2RdW43j5ZVMZIAuRt/4I7TPnFJUi1LDhM=; b=feHHdzkkMRvgk6
	abEpJHIdd/9ZdlGMFmjiNlVpQXkR723OrtfgKkYGTHVxa/cGkx41FtsIUr2gSdAYjJI/gN7MQf5dT
	GbyfN+hxCYnNK+wiRe9IRRKj0486qUoQJafwgXw0ZsrCXPc9aTi914MEloE3NE2Cdc8LAIQL7iPGO
	7lWYVrdlhZ3jWkS2OBja9lpfP8i3Nca5bT89SIq/P33EwOJrxXdYJIAKrT1DQYb9eSeTNTO4+L3cY
	d0nZ0amDOQ7rPEE2hbFIv+LZ1bmPvCg15T5j8orimdO4Q9Tyl48FEwiGUwGzlLYSa5zviktt9z4CQ
	i6ubafqpf0w+tCV4fXaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeHf-0000000CLjH-0Zzz;
	Mon, 24 Nov 2025 21:39:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNeHc-0000000CLis-0D8d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 21:39:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AC8940960;
	Mon, 24 Nov 2025 21:39:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3D2FC4CEF1;
	Mon, 24 Nov 2025 21:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764020379;
	bh=Mn992qsllYM14Z14kmIBgsP6C2fYWqJdQ1/Gpx4Iyyo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ga8QXg8YOYS8Qs3xO3wgPfADlTRyQ1B/+l8yCHt29FqdM6eAcgacAxTDy7qrTvXGv
	 bS5/LRb3eLuW5ap09C6K/IiMG459WuusAZqzIBUrsa8yv99TqdXsLeMwu7oVmq21cO
	 ZNaTfZsYeUJJwiTLwteONBzZZwlHjaZxAPaZzdlJWuB1V6EgZNALiYwiuYZ68A45tX
	 Xbcn5oQeY9N/M/eejrGYzCoG47uNN7bXFcdgqckX8S9ypi9I+GfLohzedOjd+KJS+a
	 Fhe3VgYziSE/yaYUyxQrNqHnA1A/XgQzu8QWoVjGOcdEJoRAaK/ChSW+0/2PwHvKDg
	 8EVTGtCROVnRA==
Date: Mon, 24 Nov 2025 15:39:37 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Radu Rendec <rrendec@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: Re: [PATCH] PCI: host-generic: Move bridge allocation outside of
 pci_host_common_init()
Message-ID: <20251124213937.GA2716196@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120113630.2036078-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_133940_122397_294E60B0 
X-CRM114-Status: GOOD (  12.70  )
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

On Thu, Nov 20, 2025 at 11:36:30AM +0000, Marc Zyngier wrote:
> Having the host bridge allocation inside pci_host_common_init() results
> in a lot of complexity in the pcie-apple driver (the only direct user
> of this function outside of code PCI code).
> 
> It forces the allocation of driver-specific tracking structures outside
> of the bridge allocation, which in turns requires it to use inneficient
> data structures to match the bridge and the private structre as needed.

Nits since you plan to repost:

s/in turns/in turn/ (maybe a British/American idiom difference?)
s/inneficient/inefficient/
s/structre/structure/

> Instead, let the bridge structure be passed to pci_host_common_init(),
> allowing the driver to allocate it together with the private data,
> as it is usually intended. The driver can then retrieve the bridge
> via the owning device attached to the PCI config window structure.
> This allows the pcie-apple driver to be significantly simplified.

Nice simplification, thanks for doing this!

Bjorn

