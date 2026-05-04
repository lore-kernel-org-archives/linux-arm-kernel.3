Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F9BCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 23:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KAOd1V9M6ZWqHCSjDNjv4F8nmp8wTumJhk0Vw3mgNZc=; b=EO1QU9ZgodrQEtz3VBkDCQ+alq
	4eFfb2YpSNTL3LOwQFqGz1aVisCjVEL4lGc2o6gw8SFP89599+yzu1cQLDVmwQRco+NTkx/+D3cXn
	Z1N6oLdpvxEFSKimGBehC48WTSBA5wSUG+g8CC3EPEps8mo/JXEOajzQun9aUIvAaPuUWJH6+HDLw
	Qoc21j/QjKI3BDDAVDIwkat9u4gzfSBHU1/tjOkc66Y4hUbWNc3TCXGOfFNK5NXHLGkbaiFmTRj+N
	cNAH/Jhs7RQ6nKQ6shs2+tCYjdrkEqJz9ztnEUdVygWsttcU/P5Pg3aiqucEYaUAsh+56lFw7XDwu
	2P/m0aCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK360-0000000EeKu-0GpF;
	Mon, 04 May 2026 23:53:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK35y-0000000EeKj-2ik8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 23:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEF056001A;
	Mon,  4 May 2026 23:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C2FC2BCB8;
	Mon,  4 May 2026 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777938781;
	bh=KAOd1V9M6ZWqHCSjDNjv4F8nmp8wTumJhk0Vw3mgNZc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u8uWwS7Qzn6wA7JSIKsO0sKF2G+VlRXqBQsxSe4/fk6fahgfaVOW656JguZiNUqKS
	 5DI3BzNywNszZ40oGTo4QRBrzSBkYXrkofQAgNUt2mCNgeNas0njNZz69IMCg65Btp
	 mvTgVaMcx5+wQXbFZagAhoVv/l+WlDwpF3KelSs+X2TRsa00lydA4dz1J5jsuqSA4T
	 4vkf6nMFPbzHSA/66+CjKd0leHCoJmWc3K1cWmQ/2Skquvu0YHLt6PCdDmQF96DxlQ
	 RROPDH/Gp1CrLd8pZryGatPE9Oy76gKptmGL6wQXWBrPjdo0MaA0bLXfeptNxCvEAR
	 QcwJBcsO5earw==
Date: Mon, 4 May 2026 16:52:58 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Machon <daniel.machon@microchip.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Steen Hegelund <Steen.Hegelund@microchip.com>,
 <UNGLinuxDriver@microchip.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, Bjarni Jonasson
 <bjarni.jonasson@microchip.com>, Lars Povlsen <lars.povlsen@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rt-devel@lists.linux.dev>
Subject: Re: [PATCH net 2/4] net: sparx5: fix sleep in atomic context in MAC
 table access
Message-ID: <20260504165258.30b81158@kernel.org>
In-Reply-To: <20260504-misc-fixes-sparx5-lan969x-v1-2-6604306b5743@microchip.com>
References: <20260504-misc-fixes-sparx5-lan969x-v1-0-6604306b5743@microchip.com>
	<20260504-misc-fixes-sparx5-lan969x-v1-2-6604306b5743@microchip.com>
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

On Mon, 4 May 2026 16:43:43 +0200 Daniel Machon wrote:
> sparx5_mact_learn() is called from .ndo_set_rx_mode with
> netif_addr_lock_bh held, but takes sparx5->lock which is a mutex.
> A mutex may block, which is not allowed from atomic context.

Could you try to switch to the recently added ndo_set_rx_mode_async?
We added it exactly because most drivers have to sleep / wait for FW
to do something.

