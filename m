Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5449FC36017
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDYBjAcDz5eCjRuh66ZMHv0WoyJwMEbosIp6bG55lNU=; b=rCYNpQFJsjgxDGit7h2FkMygAB
	JxTmnhM2sMzdX3CwIht52yO55kLuHTEv8Zgwk65zuDB5hxHTuzYuJjZwyrwKRfaR6KCcdY39yaC5V
	j/Aoqhy3Et8csIxAxsd3Ztoz3yStQRp2mT6oiTf9rlF3OWIuLrxNkeE/VzS4f5UoJgoSiOKoboFvZ
	G0Hh7Zwfq+pRV+PtAjXhxG68yiYEW92A+kQSnRLCTgTc61umK9NZtP6O6I36MUFrEY3LU4zAzAtIN
	89DPlv0IHvUaY2R1LjRJcoNqjUDfZ5dXCsEGVp+7+dmVYuVutF45HSRE5Mh3Zsa9RCJeYT7t1eY2r
	kzL8B/GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx6A-000000063bI-0uFu;
	Wed, 02 Apr 2025 12:21:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzx4O-000000063FA-39Mw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 12:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 04DEBA44659;
	Wed,  2 Apr 2025 12:14:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 839ADC4CEDD;
	Wed,  2 Apr 2025 12:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743596387;
	bh=JuHVA5+8TCS9Wnl3ErI7KLLe5QXbdlX/nJKEhl2WNnQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KW/2qggx+iOP+JLKFUL809XxFqzG5AqtgpHTMCP2wl7W8AHTrHX6FqaozU4Qn4uGe
	 9QnVErmZChI3R1hFL2H+avv/VZWLU2+ZkUJQ+OtDinRt44DTcsbF7qE+6E/UQWlgk8
	 8nreQWCz1V0vuFauKlSAZaNF/ezygzxvMNyOmAp/LsNBk9tIO3vWGurc7rFpemY3Fg
	 NY8mEEBenri5vVlpNh+gujQB11KaMEGq6TCcGsAhxSFaN2kbnjNwFjVZX+Ym0o/UAh
	 1697a2MTjvJqqLw+cOUtPbqitwrFIULyKqgohWI18y6XjU3nOpYt2+sQyxxolbu3EO
	 dhG0fHPBiTdrg==
Message-ID: <ba453200-429c-4828-b4b3-6df8b7cfb134@kernel.org>
Date: Wed, 2 Apr 2025 15:19:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 2/3] net: ti: icssg-prueth: Fix possible NULL
 pointer dereference inside emac_xmit_xdp_frame()
To: Meghana Malladi <m-malladi@ti.com>, dan.carpenter@linaro.org,
 pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, andrew+netdev@lunn.ch
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 namcao@linutronix.de, javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
 horms@kernel.org, jacob.e.keller@intel.com, john.fastabend@gmail.com,
 hawk@kernel.org, daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
 Vignesh Raghavendra <vigneshr@ti.com>, danishanwar@ti.com
References: <20250328102403.2626974-1-m-malladi@ti.com>
 <20250328102403.2626974-3-m-malladi@ti.com>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250328102403.2626974-3-m-malladi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_051948_854045_0F469EDB 
X-CRM114-Status: GOOD (  10.71  )
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


On 28/03/2025 12:24, Meghana Malladi wrote:
> There is an error check inside emac_xmit_xdp_frame() function which
> is called when the driver wants to transmit XDP frame, to check if
> the allocated tx descriptor is NULL, if true to exit and return
> ICSSG_XDP_CONSUMED implying failure in transmission.
> 
> In this case trying to free a descriptor which is NULL will result
> in kernel crash due to NULL pointer dereference. Fix this error handling
> and increase netdev tx_dropped stats in the caller of this function
> if the function returns ICSSG_XDP_CONSUMED.
> 
> Fixes: 62aa3246f462 ("net: ti: icssg-prueth: Add XDP support")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/70d8dd76-0c76-42fc-8611-9884937c82f5@stanley.mountain/
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Roger Quadros <rogerq@kernel.org>


