Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A83C982CF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LlnRbt5c8SP+aAJF87ouKUvRBbld9YxcfP/ftrnkZgw=; b=hfLdjWgSiw6JcAFjZ29Cq9BoDW
	i4yiU6DY+mhHQxu8Wk6PysfuuA04dZCpTMe6WyppVeZ/6aAXfrM8uImBB16TrCIQ4y3Vjehz36LcB
	3ClKYYzJ/+TSWz0inXL83x9RLp/bjjcxq2Iy46lCUa44hLlbkDfTpzhIksEEaVVkCNBCIOTjy9dkD
	pA8tnDfi/ZvS1tptkxovdnq7XKbP4lV5mI1znsyZXdOmBrlyFzpP66hkHWIDBFzWkqQDezuK6E7sN
	OEuDEsqWKfo+mTifNia/qZGbg18eCvvg0gZCcZkemd3Cmpgcm2tY8PtBOnXbWIOwTCHtKkpUeIhZk
	DtpZSV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Asg-0000000BFfp-2Ted;
	Thu, 17 Sep 2026 12:06:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Asf-0000000BFfX-04vU;
	Thu, 17 Sep 2026 12:06:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D71A602D3;
	Thu, 17 Sep 2026 12:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B62D1F00898;
	Thu, 17 Sep 2026 12:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789646779;
	bh=LlnRbt5c8SP+aAJF87ouKUvRBbld9YxcfP/ftrnkZgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0ljomUrwTL2UcjQ7HHAcYdrtIKTqFYzw3wyXinI7YNmmp9wq2uvlibGxRe3/YSkmK
	 ryRmZwW7JLzSvGxQ06hWYVVDby0dfdp29e7FXIUOZVmR0sEpEhuqhRPALUXGZax/u9
	 kyEaroyGZOc8yeqFj6lfvzQPnCrsFqApRO66wVvc=
Date: Thu, 17 Sep 2026 12:57:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
	jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com, stable@vger.kernel.org
Subject: Re: [PATCH] mailbox: mtk-cmdq: Fix GCE clock reference leak in
 cmdq_get_clocks()
Message-ID: <2026091720-erased-urchin-8903@gregkh>
References: <20260917093745.2144930-1-vulab@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917093745.2144930-1-vulab@iscas.ac.cn>
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

On Thu, Sep 17, 2026 at 09:37:45AM +0000, Wentao Liang wrote:
> of_clk_get() returns the clock with an elevated reference count, but
> the references taken for the other GCE clocks are never dropped: those
> clocks outlive probe and the driver calls neither clk_put() nor
> clk_bulk_put(), so probing a GCE with multiple instances leaks one
> reference per other GCE clock.
> 
> Let devres drop the references when the device goes away, which also
> covers the probe failure paths after cmdq_get_clocks() has returned.
> 
> Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for mt8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

Please stop sending these patches.  You are not responding to any
feedback, so we are assuming you are just a bot :(

All should be dropped until proven otherwise.

greg k-h

