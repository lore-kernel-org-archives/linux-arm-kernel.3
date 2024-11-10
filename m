Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EDFD6409B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 13:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnUN6jzOQoxEtEDJxrICw8KMmAOqEgr/Lq82Mf0pU60=; b=flnBXsPcZ0+hrT3TOyuCXhJlkv
	5b8SG+YcuZSQpNWBugTMH5+OtWV/5WRYF52WLUYM0n0L1K9OJ/sSM3ZUDyfdASnzVZr3h2qiBb+N3
	gLMB2Iz/RcNeBg1A0V9qM3HAb2WFQ8wC8fIc3empl9cUsn63ZXDL2DbtcVgQeSV4cGRwanWoJgy1W
	byg3/RoZn7i+BpqYMD6iaz3ql/+0nOEgJfx8MSNvWDhXyirUEpJq7GGgRh0uRp8/yNLwp9/1+SWRf
	kJN+JUs9hyvZTtYsYt08SUC5+DtbxTr2fkyb66Uvz4LnXWB6Q9Ll34Dx87vLokD2dXZF69mu6+EQE
	6DaiZIVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tA89p-0000000EvVL-0pUK;
	Sun, 10 Nov 2024 13:39:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tA86V-0000000Ev85-2elV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 13:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5E179A407F1;
	Sun, 10 Nov 2024 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E7FBC4CECD;
	Sun, 10 Nov 2024 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731245746;
	bh=/Jzva/lnUCOfdvqz4t7Og5xoYDHm+1gt3wfXfs0Sr7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BgCRP6kreVpFhy+lQT4TBD1fmiDazlrZiRMTe+UBlJ3EpIaiWGjLkSZ+0CjF+1GJF
	 urnTqcnW3LPRAtnx40v/JVw8DANTMJ8blZO3Empp+4HEheBplcGchYdn0DCTyaWCIw
	 4BvKwazdIG7KXCtknQ1fmNKAny+pX9mb2Bz/DjA6njntGc5aaNSojuud7aJUTGfugQ
	 DKcW5YVyWp0H/QJacUBCFnUAoO0ngUoeyeKO/1NIEk0iFzAiGViApAMB9ft2764eyS
	 NO5+ZiQaYWcB/GF/RIgWT26HJc4xvcZbHWe2cXwzdiR3oGSRmK8MigWkUC9PhtiUu1
	 E7nR0Rw1OrQgQ==
Date: Sun, 10 Nov 2024 13:35:40 +0000
From: Simon Horman <horms@kernel.org>
To: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	lftan.linux@gmail.com
Subject: Re: [PATCH net-next v3 2/3] net: stmmac: dwmac4: Fix the
 MTL_OP_MODE_*_MASK operation
Message-ID: <20241110133540.GP4507@kernel.org>
References: <20241107063637.2122726-1-leyfoon.tan@starfivetech.com>
 <20241107063637.2122726-3-leyfoon.tan@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107063637.2122726-3-leyfoon.tan@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_053547_756343_F3E93877 
X-CRM114-Status: UNSURE (   7.36  )
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

On Thu, Nov 07, 2024 at 02:36:35PM +0800, Ley Foon Tan wrote:
> In order to mask off the bits, we need to use the '~' operator to invert
> all the bits of _MASK and clear them.
> 
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Simon Horman <horms@kernel.org>


