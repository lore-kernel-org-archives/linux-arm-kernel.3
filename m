Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4308AC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 13:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VfGSB4cRPyZ91JBGoqZHrOUvB/yFMHL0qZ43xcXvMEA=; b=s0gwbFI3/3rQFiSMvRJsgMR74+
	Ls0lgqlCDlvRIaAsm5woPel6GjxlL/sTr2q/qEhb23Djsf+F4k+N645GpjhDZxvc2X/69p55+Vkgy
	IYcgbCTtncdSlRbCm3lG3biM2Zm8GESx9rAXyH8lYT5OHvLfLk5Q2xW1tPttUdk9uYi7RT2DSavqO
	b00vspCXkbrBYN9GKHnNYuf1pEzogprJr4Ckz06WJNOnCKLWoJng8PBLxQhzvD/zsfITxUOi1wx9s
	tHuDYxx3FimXEobs5+htM/daQJ2mNGXNOpjlLkhb5I2P15xGWxbQeeH71xxgf/pFVBKMDo+UKmcOM
	FFEik5Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKIJ-000000084Rq-0nSE;
	Fri, 07 Aug 2026 13:07:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKII-000000084Ra-08pR;
	Fri, 07 Aug 2026 13:07:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4BCC4040F;
	Fri,  7 Aug 2026 13:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16CC21F00A3A;
	Fri,  7 Aug 2026 13:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786108045;
	bh=VfGSB4cRPyZ91JBGoqZHrOUvB/yFMHL0qZ43xcXvMEA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QmL2BtEJQdD8xwOQTGZcg1RqhCPOt8nHrKh8n7SxuCS5zBTockhDcJSpzsnAEXEiX
	 XQ7Lz2rluD3gZa4cneu4RJSpCu9urzyncHA51xUGN7rBkoAULhFu6eoxwUII2+prv1
	 gAfAFCPZinp0RLTvhbIm3aPHHly5tQGTOEBUoUwESXVfwwX/HXfr9h0aD/iTP8u5Ee
	 wzDOTbItM0QzfcHr8HSBHKUBJLlPcLrKcxP4FYwKpqVvIir6DonNrLpmNzs5FQWWRz
	 4o/oEEiV9Amm7NohF+r/PUvwbK/Va102NVTt4/PJgh68PkllpVAK9U0al29tKGI0Q2
	 utprM1y1Fh8NQ==
Date: Fri, 7 Aug 2026 15:07:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/10] phy: rockchip: samsung-hdptx: Consolidate
 consumer_put on error path
Message-ID: <7pshndmrl3yy6oulomog26vjfppcuh6bxbn5fy7rys3w34pizo@psbah2rng6tz>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-7-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-7-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:50PM +0300, Cristian Ciocaltea wrote:
> rk_hdptx_phy_consumer_put() is invoked in both branches of the mode
> check conditional in rk_hdptx_phy_power_on() on the error path.
> 
> Simplify the code by moving the single call to the end of the
> function.
> 
> No functional change intended.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

