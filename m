Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB67D1CA0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 02:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7NKXPDjXNkDNzhyzutC1pOiekcL2DtwZluHyc+bjyU=; b=3wUPSN6v3P8dha7DPpJ2tLJ2Ss
	labeAe8z9hzxeMe+lOCw3eNH1nc2smeztwdlg78Mp8VSDVq2uGahip8IvFCx5gI4beT818WooD+ys
	p+tsPKb7kSUUFhWEeKAqzeNZFipMTiE0Z0YrsYzDBB7srwxobN4ZVOwtjzcTeNCPwFMbCJ1Q/7cqc
	xRt5I0TWZY4VtzJtzHnmqU3bZWbiMn48U2G6pBd+RymrzXbmyWgOuCrI+fwbQyFtCfPXDcGFqwO8G
	Q3d4RdMpBZE/YwQlDHp/c/l8wW72RULtIkY1p68KNM+GdOO10xW/HRKdqoCuUu6zPg1jlXxU0DmMR
	GNL0otuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t89go-0000000Fgxn-3dM4;
	Tue, 05 Nov 2024 02:53:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t89eM-0000000FgeY-1VHA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 02:50:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 52B935C56CE;
	Tue,  5 Nov 2024 02:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1313DC4CECE;
	Tue,  5 Nov 2024 02:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730775032;
	bh=TEvoHLLf7+809rqrhTbFJvPU4jPwqPRuDle/botXGIA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Lng5Bh9VVX3FtlTQLVPEvXflhQvCL7IEv2vblWOybSFGucXnUCrd2+FyflWfgzlw3
	 /VFFLH+QRvuTaN8VCQ9tLSTGHVSrWOekX8QFbc+RLxYFRTvzUb6FFY4RcVjKfrlKC5
	 NgZrk43+83puY7r/Sa+qPff3CufS0M7esfJVk454pSuS4vVLhpdbuuhAlJ3Y7IsqNz
	 5KmRUZGWR5LsnsJI1w1kIc7ZQVIDqhMROjj+iN+Yk6o3T57P36WZmSoRC2sTh3bN32
	 KHuEfG77nYsmjw6wzO5X/xVOoT/voFmFRACj/KdBFShVc6tPiLL/ssfmBKnE2Csbbk
	 TbzJCYTlPqgRQ==
Date: Mon, 4 Nov 2024 18:50:31 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Malladi, Meghana" <m-malladi@ti.com>
Cc: <vigneshr@ti.com>, <grygorii.strashko@ti.com>, <horms@kernel.org>,
 <jan.kiszka@siemens.com>, <diogo.ivo@siemens.com>, <pabeni@redhat.com>,
 <edumazet@google.com>, <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>, Vadim Fedorenko
 <vadim.fedorenko@linux.dev>
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix 1 PPS sync
Message-ID: <20241104185031.0c843951@kernel.org>
In-Reply-To: <7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
References: <20241028111051.1546143-1-m-malladi@ti.com>
	<20241031185905.610c982f@kernel.org>
	<7c3318f4-a2d4-4cbf-8a93-33c6a8afd6c4@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_185034_488377_AED4E627 
X-CRM114-Status: GOOD (  22.19  )
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

On Mon, 4 Nov 2024 16:55:46 +0530 Malladi, Meghana wrote:
> On 11/1/2024 7:29 AM, Jakub Kicinski wrote:
> > On Mon, 28 Oct 2024 16:40:52 +0530 Meghana Malladi wrote:  
> >> The first PPS latch time needs to be calculated by the driver
> >> (in rounded off seconds) and configured as the start time
> >> offset for the cycle. After synchronizing two PTP clocks
> >> running as master/slave, missing this would cause master
> >> and slave to start immediately with some milliseconds
> >> drift which causes the PPS signal to never synchronize with
> >> the PTP master.  
> > 
> > You're reading a 64b value in chunks, is it not possible that it'd wrap
> > in between reads? This can be usually detected by reading high twice and
> > making sure it didn't change.
> > 
> > Please fix or explain in the commit message why this is not a problem..  
> Yes I agree that there might be a wrap if the read isn't atomic. As 
> suggested by Andrew I am currently not using custom read where I can 
> implement the logic you suggested

Right but I think Andrew was commenting on a patch which contained pure
re-implementation of read low / hi with no extra bells or whistles. 

> (reading high twice and making sure if 
> didn't change). Can you share me some references where this logic is 
> implemented in the kernel, so I can directly use that instead of writing 
> custom functions.

I think you need to write a custom one. Example:
https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/ethernet/meta/fbnic/fbnic_time.c#n40

