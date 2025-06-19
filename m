Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A76C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2S2sMQELKK7I1JnEpM3OQKNT7nxLVyj/zpY3/QNc8Co=; b=nyDWR6ASFUrwOOINxIfFEgBOhW
	OwFDVLlmtO/a4SQiZHHkiBgLXrv0MGvnKEzT/p4XZA6RvcR0NzzmJnNl+0ypAIlzEIC/iQhjOQN3Z
	xXOs1POpBRrpFrCyJI9Ztlhe2vh0Xw9HFT52yknM2cHKYhwlFiaCdxQwgQxVF9hbG1OFCkO4qftNO
	6azJo0WRAzZYrT1wqu9+zdbgiA804/KhjQ2Ac3AkqUCW8BJkUc26svun2Zxrk9BgD1dS+5le5ynP0
	TtHtbllQXUXfewsaDA5PhnMXinqnWV3YWE4vocS3vLDQXm2derHk83uQYWl2rqR+C4vNat2Lw3Qnu
	a8EV1rVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHRY-0000000DRTn-0rUu;
	Thu, 19 Jun 2025 15:44:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSCAM-0000000CiAD-3TlA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 10:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C20705C0DF2;
	Thu, 19 Jun 2025 10:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15B2BC4CEED;
	Thu, 19 Jun 2025 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750327602;
	bh=n6ybjKDazxybQ2i7xjzgJ9xiqJaoh5bYSS7ARBO4LNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Rw8fQG17fdcWZA22467uefTegZP7T8sr/L/0ZkZAtyiz+I/WMNb4/1LaRL/2sJiHS
	 BxJrxu5qxa8Hho3F7dtQa1Bq3FBHkW4OxJoij/kz6r5AcTM4veu2tQH1br+h/RpYTC
	 zEaDAIXaTGc5N41t8NpeRrnHXmWLWGPsYGAbBHAQn5INIBwmVEUTEWYmkUFg9E1xVZ
	 vL5MvudhhNxeTNuHPJJBfKC6e+pOh2DkOav0btDOHUszzUPtEzuGfSc56yT0I9BngK
	 rUez2bf6GzV+9eiLpHYpFlGQBOkGGt8Iofd77GC5XtCTmnHNo7Fdk48hLiXZSQydbS
	 hdnd1dkeLROuA==
Date: Thu, 19 Jun 2025 11:06:36 +0100
From: Simon Horman <horms@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com,
	m-malladi@ti.com, pratheesh@ti.com, prajith@ti.com
Subject: Re: [PATCH net-next v3] net: ti: icssg-prueth: Add prp offload
 support to ICSSG driver
Message-ID: <20250619100636.GD1699@horms.kernel.org>
References: <20250618175536.430568-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618175536.430568-1-h-mittal1@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_030642_909259_E7162FB0 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jun 18, 2025 at 11:25:36PM +0530, Himanshu Mittal wrote:
> Add support for ICSSG PRP mode which supports offloading of:
>  - Packet duplication and PRP trailer insertion
>  - Packet duplicate discard and PRP trailer removal
> 
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
> ---
> v3-v2:
> - Addresses comment to fix structure documentation
> 
> v2: https://lore.kernel.org/all/20250618102907.GA1699@horms.kernel.org/

Thanks for the update.

Reviewed-by: Simon Horman <horms@kernel.org>


