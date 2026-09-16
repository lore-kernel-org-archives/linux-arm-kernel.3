Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B16BC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 00:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SYS4/jXrEtXSvNBADZuOsax1XwEPG6mdqebHxu+RWyk=; b=Zg8c3nj6XSi3rGggahLvkRnqVi
	hjPgixREFBYx1J0mML3WYY8wNTt1NdnQCx14GlQ0SzNfC+OIuDPRSz4kJXV/3lTRE8xd4g+aMCuBb
	FkE9Z+DXvDdo19ayfgkmFN89FK/y/eZHrdpR8LSNItjp5Nstt9V1LUWGieuLZoaWAn2v+SFgUkMZT
	ubzvgWiw8OAYPJ75d55QpxZN5QyLgzqNPOwutTUJn8Hz68WAGLrfmyiK+Yr65ep5TLWbaViQFZvFX
	x0kLlPUa9HlaHnL6kNML17wjzOirXSH/OiaT8xVQsT24z26nppaurlcCsjhfisWUmiwPETaRlVO12
	eSXd+G3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dQw-000000086YH-1ckL;
	Wed, 16 Sep 2026 00:23:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6dQv-000000086Y3-240Y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 00:23:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EFC69406D5;
	Wed, 16 Sep 2026 00:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FD8B1F000FF;
	Wed, 16 Sep 2026 00:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789518208;
	bh=SYS4/jXrEtXSvNBADZuOsax1XwEPG6mdqebHxu+RWyk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Mma+gYTBjeieo9W8jbYk7KdLlVhJZ0kSPcF9zz5jyJpvvPh2peZOX/IpGtHPGhvrF
	 bzdYRv0DptmaUsjlm7rtUyr05czJWd0NTzLeUj/lTgjCfJQejzPYTYIOuIhNjxJKSo
	 072v0vTnIP7bhu5HVSsxx6CJEPb3wOqQxzssYoxMG8gVBmGinv1rp8Y69N+OGLeF9N
	 g3erWhgzclUFWAXvM8meOX0CrmI+S7w5mEZ4pBn8eaYqqVaWn6sNnQtFESc9/txd27
	 9q4p6Cz2MxR/DcKQ4aSJiJJUWJQTU4IK7/l7u+/vBaz95NBWOlIlk3ZJ9sTK/BzYJ8
	 QrjiOKnbF7jgg==
Date: Tue, 15 Sep 2026 17:23:27 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Michal Simek <michal.simek@amd.com>, "Sebastian Andrzej Siewior"
 <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, Steven
 Rostedt <rostedt@goodmis.org>, <netdev@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-rt-devel@lists.linux.dev>,
 <neelisrinivas18@gmail.com>, <git@amd.com>
Subject: Re: [PATCH net-next v2 3/8] net: xilinx: tsn: add endpoint MAC
 driver skeleton
Message-ID: <20260915172327.1691aece@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-3-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-0-3a40babaff4c@amd.com>
	<20260909-patches_v2_external-v2-3-3a40babaff4c@amd.com>
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

On Wed, 9 Sep 2026 00:49:51 +0530 Srinivas Neeli wrote:
> +	ndev = alloc_netdev(sizeof(*ep), "ep%d", NET_NAME_ENUM, ether_setup);

It's up to user space to name netdevs, this is just an ethernet device,
use the standard name.

