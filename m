Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3546CC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 17:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtEhIWEmteQi2LDnAYK+apzYa31aNy6LHyJwmgTwqto=; b=3W5xcMXCqSalXPa79DEIzkHzaE
	GNEOyGPxwIn4teJDMY4uLVzHryfvoD8u8306ZLeZCeGr44ZRYrpO2CqdGaRHZa1ma3E2t9v0hKgFw
	N7h+p7M8hozbrTFjQw0Se4xN95YPCd3yWsc/dS7Xn90u5MTnGtGjAhl0Yhzz6ObsIC9LDm+GwrttI
	4kZ+1hKhCumFi6zPzcavGCCpt8ScCC77Tvk0rxEhUNJ28GwUbNmnw7tPM7mxNlYig43yPHALyXxte
	oiGf+hIRPY8hVsX9EY9nDN/2X2oQvrtvj/qgZWTFzJ5T+IZIkGOQEBt+5MfqJRNRDiLVbF9MJ9RFT
	UM1amnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tub8P-00000006jln-1lJj;
	Tue, 18 Mar 2025 17:53:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tub5J-00000006jUV-3s7l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 17:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 516A1A48C28;
	Tue, 18 Mar 2025 17:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D290C4CEF0;
	Tue, 18 Mar 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742320236;
	bh=05dV3XU+mkBc9epGa05z7Ilnv35DhfiJI5QbiveCVaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SEtfdg4hz79B8jrpwRwn2cl9oYH73z/gds+uQ/pYSRMJOYKFTDpp8ii7283VGc1Ds
	 klTmWdF4rqn3mRKo9ZrkyE+h36AFAXZ9FtXKcrhS9cpPYyc/MvoqkUwRukqrGBLv7K
	 5RbN2ST8KQNqatL8CIBU1/tpS39nMDEJBFtiZS9O/eJhBMpaBYvZo8ftLO0J1cBDHr
	 DxpoTg6DFuEMkLw+QEeLZdA7CCIXTp5FGNqtIejpFAOJIqvIM/rnGnrGqu+4Sj+lXh
	 kfjKTaeSeSLgdxhMl4E4COs4/8WsN8dfeHy4ryy8+e669gAhnKW88hfwAoqxMa2yvX
	 jp0ZHf3aABIaQ==
Date: Tue, 18 Mar 2025 17:50:31 +0000
From: Simon Horman <horms@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Yanteng Si <si.yanteng@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Yinggang Gu <guyinggang@loongson.cn>,
	Serge Semin <fancer.lancer@gmail.com>,
	Philipp Stanner <pstanner@redhat.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] Clean up deprecated PCI calls
Message-ID: <20250318175031.GT688833@kernel.org>
References: <20250313161422.97174-2-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313161422.97174-2-phasta@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_105038_024587_471984C5 
X-CRM114-Status: UNSURE (   8.79  )
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

On Thu, Mar 13, 2025 at 05:14:20PM +0100, Philipp Stanner wrote:
> Spiritual successor of this older series, of which one patch has already
> been merged [1]
> 
> P.
> 
> [1] https://lore.kernel.org/netdev/20250226085208.97891-1-phasta@kernel.org/
> 
> Philipp Stanner (3):
>   stmmac: loongson: Remove surplus loop
>   stmmac: Remove pcim_* functions for driver detach
>   stmmac: Replace deprecated PCI functions

Hi Philipp,

Unfortunately this series did not apply cleanly to net-next when the CI ran.
Please rebase and repost, including Jacob's tags.

-- 
pw-bot: changes-requested

