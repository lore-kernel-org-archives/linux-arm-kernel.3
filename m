Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA033C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zyDf40pSgrSopnvi3VDfQLuD1JfH1B1bxMawPHCl584=; b=Dp6Bd/I1DG2vK59nWUcJtUgO9i
	6PkcvfW3mEfySVw1aExkRm6kpPybCa0PeDcDkn4BmwLLrodY5PqGXckzEIlvkZSl7jx8hXEbmTIzf
	MyH5fOOiIzuO0E0uKQJHIb0h014F5frwsq6wFxeFV+mSfUbxDvPDSYMW1cAHy1D+bUwUCSqUr/R1+
	EycA54XSRhxuxdCOjSE+jfUwPOc5mn4loDJ8nOTHXQ3TyU2l7c4BOZMIPbgWOHlBEAOyjR075eCJ5
	txKFsQ05Vt5aD280QfCAoGbKLTAH+eD7p7StPOxYcFZ74xheERfGGf4qGyyy0UazMOpA9KDXVf5jL
	4PP/6NhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjmj-00000008dyo-067J;
	Thu, 27 Feb 2025 19:43:05 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tniv4-00000008MKL-0w9r;
	Thu, 27 Feb 2025 18:47:39 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DFBD225A3E;
	Thu, 27 Feb 2025 19:47:30 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NeJMdeaV9PgI; Thu, 27 Feb 2025 19:47:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1740682050; bh=tNxufyEmqvelo58l5TdexlWiSdxOsHppCDLg7M4W79s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R06d9cIO2xlwenccd6afG9XhP6C1IMj8IPLlXGO2KvKAHnpKzXfum2DQz+NcuTWN0
	 eKaJSBCJKrnbfQQgvtFqZPEN+i7v3DGl8C684Z8qWwcqPcbW3DfBXne0RuN0Zye6c7
	 vNBvlgZfE8Cgz5bOGrDF0Ymao6CA+y1aPGAVom1Jc2wJNEOrukHwqR+wEmNT9sEYKp
	 GovGi0gZqWlwIc/+oF4wO6g3RJLP7UgCqg2RYctlfK6ddTayjeqBPi8cZfGb4Mo3Lz
	 pG3qtSfHwL78PCjTxzK/CfA7qWPDwVcwPtyZXS4sGKx/B43qXN/LIPPzUATLbb4GyF
	 hSMehDccy9T1A==
Date: Thu, 27 Feb 2025 18:47:12 +0000
From: Yao Zi <ziyao@disroot.org>
To: Jonas Karlman <jonas@kwiboo.se>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: Add reset lookup table for RK3528
Message-ID: <Z8CzMNI_1CjUgSrl@pie.lan>
References: <20250227175302.2950788-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227175302.2950788-1-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_104738_673622_E89D109E 
X-CRM114-Status: GOOD (  16.08  )
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

On Thu, Feb 27, 2025 at 05:52:57PM +0000, Jonas Karlman wrote:
> In the commit 5d0eb375e685 ("clk: rockchip: Add clock controller driver
> for RK3528 SoC") only the dt-binding header was added for the reset
> controller for the RK3528 SoC.
> 
> Add a reset lookup table generated from the SRST symbols used by vendor
> linux-6.1-stan-rkr5 kernel to complete support for the reset controller.
> 

Thanks for completing the reset part! The patch looks good to me, but

> Fixes: 5d0eb375e685 ("clk: rockchip: Add clock controller driver for RK3528 SoC")

I wonder whether it deserves a Fix tag: to me it's more like a new
feature. Please correct me if I'm wrong.

> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
>  drivers/clk/rockchip/Makefile     |   2 +-
>  drivers/clk/rockchip/clk-rk3528.c |   2 +
>  drivers/clk/rockchip/clk.h        |   1 +
>  drivers/clk/rockchip/rst-rk3528.c | 306 ++++++++++++++++++++++++++++++
>  4 files changed, 310 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/rockchip/rst-rk3528.c
> 

Thanks,
Yao Zi

