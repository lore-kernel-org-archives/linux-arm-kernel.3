Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A514AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4KG/X8MV7QZrgKJunvYu/eMHjk3xLJnP6aj383Xw5Y=; b=0p07yUHBqXNJO6WpzHJ2jZJljd
	sXy7rOBDHJbimakST7aGGV8BTXqpqztiKFFtk/eEMUYVE0p77lIeSSA4uZ6SeAzB+R+pvRBBQ6IuU
	OtR2n/2ijUAMTywFmfVcHQtQOY4Zjb6GoNPaGxt3lOEjA1PqHJnpapV6zmMs7y8JSfmnrV1RYnmnw
	EJIPRxY/igfA1M/tHSWNLE0cFMbeqk0akc6A4tjER8kaSClcfd7Ba3HPfd1+pe8RJ83pgCtfsMfUt
	gF+78ARe4x6huuAnrRlvz9QFAMEd0U76/i8u59FoxMIpjvKu4uflSjxD+LBLnnt1W+hlqXPp5eRy4
	TJ8SiKpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN1b-0000000Fdgr-24QE;
	Tue, 30 Jun 2026 01:12:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weN1Z-0000000Fdgi-3mIJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:12:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 591B7600C3;
	Tue, 30 Jun 2026 01:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E51F000E9;
	Tue, 30 Jun 2026 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782781949;
	bh=f4KG/X8MV7QZrgKJunvYu/eMHjk3xLJnP6aj383Xw5Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hKBIQYHy9ClqCroiLhVPj/iYZ9jX+pmLL3fkbu4rZTRY36gntSHQrWj8lZiI+Rvif
	 5Fz3prlNEe6Wr6dnpFtVMFjuDzUcQSXAftL4fdj8P21ooE08n2vQTmX5pRuzHfeL1W
	 XwmNSJfJICCCktG0kna7FsdFKktj22DuRF4rXEEMfC44Z8bSGQAbNF/j2A/dohrn23
	 ZdItA1jPk0MU9gqGaERIDOQyr4L3z3m/h/twdJaJvGEncmMpSDbS8PqIKdxVcLbMob
	 wpYrjAq+eTSjAQcjE/6VfzTIZd86aUFMimvUlbO3FJSDMY5yhSyfI+/usYW8ryxL8z
	 sY7d2RY7WLpyQ==
Date: Mon, 29 Jun 2026 18:12:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: David Carlier <devnexen@gmail.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
 netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, m-malladi@ti.com, hawk@kernel.org,
 john.fastabend@gmail.com, sdf@fomichev.me, ast@kernel.org,
 daniel@iogearbox.net, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: fix XDP_TX from the
 AF_XDP zero-copy RX path
Message-ID: <20260629181227.4418d953@kernel.org>
In-Reply-To: <20260625063121.24746-1-devnexen@gmail.com>
References: <20260625063121.24746-1-devnexen@gmail.com>
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

On Thu, 25 Jun 2026 07:31:21 +0100 David Carlier wrote:
> +	PRUETH_SWDATA_XDPF_TX,

Sorry for the naming nit on v3 but XDPF_TX is ambiguous, I spent
a bunch of time digging thru the driver. It should really be called
XDPF_LOCAL or some such to indicate that the frame originates locally.
XDPF_TX is ambiguous.
-- 
pw-bot: cr

