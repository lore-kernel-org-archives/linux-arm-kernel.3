Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318BCC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 01:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dg+WSPCRS/arkripWnJ7b4hj1+39gGDq7ZO/7GEdTO4=; b=FDMi13gkN42q8IQlKhGrxcUiBo
	howZYcJgJcoesrmP3VszqzaXrVIeAKzdHV86NR2Kn/BlbT3jkoX17GWIHLbVqYBNKodnT1gYuOolx
	wigQ9b8Wfa27oSOQIzhqBpN1r3kqdnQKwu48RumQGxkw9C2bDxE+pqpHZZnmVXQyfqi2xDeLIQ9Uk
	O39lLlqIN3atLWzm7vwMQcqwWMexHRxa/d0r3AguMN5cItdenIDGng+Zkr8AhYFP3bW85+UT09AGk
	p/Iv/mieJA8s5vbEIUa2jvixiB10RIF30Fpd4QmgRa5Y5D5WcZjU7Z+unqlL/bQBRcl3LzchgVW7E
	itTblr1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFQg-00000000SGm-278p;
	Sat, 14 Jun 2025 01:11:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQFOW-00000000S9b-1wYi
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Jun 2025 01:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EA575C5ECC;
	Sat, 14 Jun 2025 01:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89251C4CEE3;
	Sat, 14 Jun 2025 01:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749863355;
	bh=bhtNPk++UTQ57VyxrddQMBBkJ5x/UxyRvLf25/kjd70=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bz/vwUnTuREj01l1K5Yg4O5PrHNSbSGqSUZ/j2791RYV5RdQqzU7jtKPMqT5T/LsJ
	 MPYwhXrRvnxink30KLqMS3u6ntB6hn9292WO+o1ftk99LBzHCWUzA/T4+hQ+zg4ZVK
	 iML4jVb6MtRh+gY4DTsePsy3IkKtNwaxTE321Rm8YvQiPGsXbFMNA1LCKPH/LUdmE0
	 qnBQhbTouiDveKhMPVknuBk64c/PZjv9XJ06gUNrKhHKjPxLshSrqnRj7j9qKxem1O
	 tqk8mPG8OuhooASwcPgvpjokVhX+eUxaS6mzMLhGF6iUU1z9qCGOpLeqaReSCv1oki
	 1fd7zmF96gZow==
Date: Fri, 13 Jun 2025 18:09:13 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <namcao@linutronix.de>, <john.fastabend@gmail.com>, <hawk@kernel.org>,
 <daniel@iogearbox.net>, <ast@kernel.org>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net] net: ti: icssg-prueth: Fix packet handling for
 XDP_TX
Message-ID: <20250613180913.5e164263@kernel.org>
In-Reply-To: <20250612094523.1615719-1-m-malladi@ti.com>
References: <20250612094523.1615719-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_180916_547055_2A6C2461 
X-CRM114-Status: GOOD (  11.22  )
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

On Thu, 12 Jun 2025 15:15:23 +0530 Meghana Malladi wrote:
> While transmitting XDP frames for XDP_TX, page_pool is
> used to get the DMA buffers (already mapped to the pages)
> and need to be freed/reycled once the transmission is complete.
> This need not be explicitly done by the driver as this is handled
> more gracefully by the xdp driver while returning the xdp frame.
> __xdp_return() frees the XDP memory based on its memory type,
> under which page_pool memory is also handled. This change fixes
> the transmit queue timeout while running XDP_TX.

Makes sense, but since this is a fix it needs a Fixes tag.
Please add one and repost.
-- 
pw-bot: cr

