Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E1F5C5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nCBMWcitatTJabf7wK8SLh17rK3LgMa3gsz/Kq7ZCPk=; b=Ojj9bKpKyzfmMb3Yi5dJ6ZE7X6
	pByqi73+r+UbQv09K5UERs7qjKZyYCAfwDIVIXFXkMaashm0H4pSzm9qJX322Kz9M6XqwUh8dQgv1
	xgcXtY5ZG4MiebxvYRq467SQeIy1Wb8ziQWTUtrgmhYisf3sjlm0I+ij471jdM9tHvJj1BHL76qV/
	4sOHTOS4cWTiwa+eKGZ7jadOxBqkg9SrgNmax8moORBk93UylmmlGX0cCSzkGKza55ANmJgntXUQd
	iiMSp0vSvjGBBbf3BicD0WlU3n1FWx9dH7tz7pctwKIfgrnO1mX6foBu2aGLHMKSbFcyecZ3s/k2C
	/cdIZYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK9I-000000082vy-1CaD;
	Fri, 07 Aug 2026 12:58:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK9G-000000082vg-1mSe;
	Fri, 07 Aug 2026 12:58:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7DA940322;
	Fri,  7 Aug 2026 12:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7950F1F000E9;
	Fri,  7 Aug 2026 12:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107484;
	bh=nCBMWcitatTJabf7wK8SLh17rK3LgMa3gsz/Kq7ZCPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3HKPohsyH+vrIfS+xfAbgMr9BPPFO4lT2+WuyDKr1Uo/iwUlZNdIBg8yP5px0DyW
	 0Pc+W13JbNfWtmi8fDlihPhQQ853C6N36hwJdXmVmOq5svRyCbqEWvMhKRvwDB4WoN
	 zkIk+idpOa51XgdINfgqr9Ajgo/qturgcC37QspmviC3oA5NnV6UewlOXOhI+DNyTQ
	 QlzmmLzPiQ3wdE+pbPOmgYnFI/O1aliYGQXp56HYyfZtDHlTkbYxMnMtIPfXadoNlo
	 8v80MsE5ek8P7z+tWnR3dbBJwFUG4FKPn5V0EmsJ6bF0BD1jHjdeZaKhScm3PI5RKC
	 7qGZVRXQKmcaA==
Date: Fri, 7 Aug 2026 14:57:55 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
	Diederik de Haas <diederik@cknow-tech.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 04/10] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for 3.2GHz FRL
Message-ID: <ejrrn7ryqjduxcadevo72ekujtsmmph6ijiywnvakpgidxi2ml@4dyx7anjoabk>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-4-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-4-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:47PM +0300, Cristian Ciocaltea wrote:
> rk_hdptx_phy_clk_calc_rate_from_pll_cfg() is currently unable to handle
> cascade mode for the 3.2GHz FRL operating mode, as it relies solely on
> LCPLL_LCVCO_MODE_EN_MASK to determinate the rate from the
> rk_hdptx_frl_lcpll_cfg array.  Since there is no entry for this
> particular rate, the function returns 0.
> 
> This is the only rate which requires LC_REF_CLK_SEL to be set in
> GRF_HDPTX_CON0, hence extend the FRL matching accordingly.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260611-hdptx-clk-fixes-v3-0-67b1b0c00e16@collabora.com?part=1
> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Andy Yan <andy.yan@rock-chips.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

