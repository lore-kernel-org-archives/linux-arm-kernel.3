Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 131ACEFB7EB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 02:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ty/qAOEPcYzy956IingTp03Hv+p4lW5SGKEmh4LwT4=; b=lWx/K1SUeQqF+rUYeKId1uBcH7
	BMsHwKL31aYyilREweKOtSdY3LZRmLLjkP+veJe9XA/lEVTwUVOWQiOsIbrfz8Tal0PSfoCKDiNjc
	O7OPDPgX5NIlt/t7ixGNJOzsWPqfbRKEY8eMEKjUBJCl+bhQOn3dn8QqPtbY8TOXa9UytmMaBBOmZ
	Ljo3QUc2ahuc5kfEFiI8FOc5PLNQrCw9rYQlmvXz6sI7c+sV1Q7XUV2aiOj4CsARTxEGe3/iEErgp
	oru2ZYfx/n6kKCA5UbibhBdHr5Zsf16gHCYac1XTf5IHbpLjR5xzJPlWbrOLb6mushZvoLa/vz5v9
	YGxrLhVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiT2-00000001N8X-00XS;
	Tue, 24 Feb 2026 02:48:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuiT0-00000001N8K-20A0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 02:48:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 90D7060131;
	Tue, 24 Feb 2026 02:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EFEFC116C6;
	Tue, 24 Feb 2026 02:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771901285;
	bh=14DTH9tX0vpkl6WnEHlzRd/AhE+cZ+QAOtYqoOECUZ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lQHcF8N/eNsQi1Nf1R+LGBSo1FaRXKrKZeZKewdNQSjmA92wsPqWaR3vdMi8q11p0
	 FkAgsGkYMohWNuPPQnJrakNXgiJXGCVYjl6r+ysY0B3aEsGdZ0MvnUCTyZ7RpmrPeo
	 kHgOy/xDFIvf5f+9Lpb4g6vWZwQNcFrboT/quMnQBxRYhAlg9bQ6+yRgjfoLymP4AP
	 lH/MVVQMo6geJBEtJaUx52VeZZyKGrfmQMxDE0MUZTl+LhabPA9+8Ht5QhI8+b8UC2
	 KgVJviIyzyLhKpD/919XBkWYIQ4BzljjPqp7/O8JDPOFLfAQQV93aNdnrPYyFXwN98
	 D//8iH5Yxb0Zg==
Date: Mon, 23 Feb 2026 18:48:03 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
 <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
 <vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
 <vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
 <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>
Subject: Re: [PATCH net 1/3] net: ethernet: ti: am65-cpsw-nuss: set
 irq_disabled after disabling RX IRQ
Message-ID: <20260223184803.739c17a7@kernel.org>
In-Reply-To: <20260220041431.372610-2-s-vadapalli@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
	<20260220041431.372610-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 20 Feb 2026 09:41:57 +0530 Siddharth Vadapalli wrote:
> The 'irq_disabled' variable indicates the current state of the RX IRQ and
> is used by the RX NAPI handler to determine whether the IRQ should be
> enabled.
> 
> Currently, 'irq_disabled' is set before actually disabling the IRQ by
> invoking disable_irq_nosync(). In an SMP environment, this leads to a race
> condition wherein the processor taking the interrupt sets 'irq_disabled'
> while another processor executing a previous instance of the RX NAPI
> handler sees 'irq_disabled' set and invokes enable_irq() before the RX IRQ
> is actually disabled by disable_irq_nosync(). This results in the following
> warning:
> 	Unbalanced enable for IRQ ...
> 
> Fix this by disabling the RX IRQ using disable_irq_nosync() before setting
> 'irq_disabled'.

I'm not sure this is enough. The IRQ enable/disable serves as barriers
so the ordering is sane. I think the problem is that there are multiple
paths for Rx which may schedule NAPI, not just the path from the IRQ
handler. If the state changes have to be atomic you need a lock.

