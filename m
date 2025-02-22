Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAA8C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 00:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ssOi1VCJRc6WEf+VUNdD01niQTyalPzzhTyADiWu7H8=; b=zpZG08b5kzoCWiGhsIFtbyck2N
	tXsJDTxkF1q+QGHvPw99PDRxIYLqzxydIy1QFjzSDwF8qIzoAcmOHtfhvQ4j+3acM2U0XSdQntl8B
	Z8YK5/YzMLqhcHYYmkIqacuMz29loQd6225Ma0lRiUx0N0md4RZ2PFkwYAapsgKnTLtLwsBPr6K4l
	EUhLskv/b+rh6Wniwcl7WoTiaTuL7KB+oPQAErOnK6B1HJc1kPd82tGSkQQ6mpgXfI8gyhrHeXAh2
	oj/uU3ez57BFMhY2Yf0xtApXhQDCjmg/a2WrAy9/JcYW3YcMsSKnZxN/jgQs5oCIB74HSx+TNgL2X
	3pFscmBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tldZ3-00000007EiC-2KV5;
	Sat, 22 Feb 2025 00:40:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldXa-00000007EYU-0Yom;
	Sat, 22 Feb 2025 00:38:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A8D815C5D03;
	Sat, 22 Feb 2025 00:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4731C4CED6;
	Sat, 22 Feb 2025 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740184724;
	bh=FQ2i0wx4TGUTjsWy2c0bZNoWOkyscg1zzRkTcOHmSi4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NGuNNBiZcujTvg2vGTQMV1HJz8aJPA3l4fuod5f7gzqx/YPxrdXwR/sqVQZ9dA2MG
	 6uvM0N98xnGFLvBdlfJF1j8NKW9re/MTh/MrRD2Qm53xQqOKrjdWL9w9IPctm1MFag
	 paIJjNuejhsoVoznJJ6ZMIMwKSjJpGZtG97biBu16Xr6wnzjkAZHimqiZsfQDwzTbF
	 LAg2ApM/FtH43YFeTcldqvhgE86lS4FBSTQ/+4qsrT3Uy2wUUWH5fg8guJAYFQ7jLQ
	 pdZtz8PZQhjx0v/IQwQBKcYPuiX02x4m5jZu5u7aIXMj/YdCBkYoH0pXVQC/2iXsSV
	 bowAQUVgDxZ7g==
Date: Fri, 21 Feb 2025 16:38:42 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Chen-Yu Tsai
 <wens@csie.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH RESEND net-next] net: stmmac: dwmac-rk: Provide FIFO
 sizes for DWMAC 1000
Message-ID: <20250221163842.04863ba1@kernel.org>
In-Reply-To: <20250220164031.1886057-1-wens@kernel.org>
References: <20250220164031.1886057-1-wens@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_163846_239109_129258D1 
X-CRM114-Status: GOOD (  16.87  )
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

On Fri, 21 Feb 2025 00:40:31 +0800 Chen-Yu Tsai wrote:
> The recent commit 8865d22656b4 ("net: stmmac: Specify hardware
> capability value when FIFO size isn't specified") changed this by
> requiring the FIFO sizes to be provided, breaking devices that were
> working just fine.
> 
> Provide the FIFO sizes through the driver's platform data, to not
> only fix the breakage, but also enable MTU changes. The FIFO sizes
> are confirmed to be the same across RK3288, RK3328, RK3399 and PX30,
> based on their respective manuals. It is likely that Rockchip
> synthesized their DWMAC 1000 with the same parameters on all their
> chips that have it.
> 
> Fixes: eaf4fac47807 ("net: stmmac: Do not accept invalid MTU values")
> Fixes: 8865d22656b4 ("net: stmmac: Specify hardware capability value when FIFO size isn't specified")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
> (Resending to net-next instead of netdev.)
> 
> The commit that broke things has already been reverted in netdev.
> 
> The reason for stable inclusion is not to fix the device breakage
> (which only broke in v6.14-rc1), but to provide the values so that MTU
> changes can work in older kernels.

Thanks for the resend, the explanation under the --- marker makes sense
but that part gets cut off when we apply the patch. You need to improve
the main body of the commit. Remove the references to the reverted
commit, please, for all practical purposes it no longer matters.
Please remove the Fixes tags and CC stable since it's not a fix
-- 
pw-bot: cr

