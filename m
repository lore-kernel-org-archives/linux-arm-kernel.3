Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74CEC5AC7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 12:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADGQV2MZWE4aRyExU85sXe1I0fjGY/evaCiIFTFhnKg=; b=1dQQcMl0uoOz42VFEyWuUJb/7E
	K2YxYPJ0XKSXQxUKINxHeMlKMHdLW3XLdHA/oecn7MfZ5KFNF+DvwjCC1curek2KhICqT5B0tDC4K
	waQjQzvHfYSI5gAdzS7AV6tsGSCB7vAahVQxAt+OX59zmuE+SoXYXpinkB74rumhY38gArBnnH4LQ
	R4VJ2egl+gsZdR8BP5mBf+G8ZPzCiDCSN7PlXRJKbPDURMST6PkjUgqrtGEztKHKrt9uAZqOofeNn
	6PBl8Dwpf+jKqoWBOy5zbtmVHg7+vL/FkqGgzQW5n3e4ruCjSYKm5e1Qo0PNZhOGl7h8E2YUEu+Cc
	cIA0ycLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK9c-00000008349-2Sri;
	Fri, 07 Aug 2026 12:58:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsK9b-0000000833j-2Kbu;
	Fri, 07 Aug 2026 12:58:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5254643BCA;
	Fri,  7 Aug 2026 12:58:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5061F000E9;
	Fri,  7 Aug 2026 12:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786107507;
	bh=ADGQV2MZWE4aRyExU85sXe1I0fjGY/evaCiIFTFhnKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b8TpeN8KQyTQ9ADj8oq0dESwpyOROSFx0EDcgNNtizQpN4Jum3u7NDLgIQMfXilZs
	 djFg9hIjBdJMo3G7zpvqmLo+HWE14aPdq2W8FVIltHD4veTFYhIcWD4YyTf/WW6LR1
	 dEhSfZgzzL3sy9OBTOxjLamaA2FC4hmk7N1BHAfGGE0h8f8EzrQMyPT3I447czYvdg
	 w1kPXpLbalQWzevTm3fshyYDDfAdiQejVdFsABMoar9j0Uh40W5nWnrnDmYyKqfk+B
	 W3p6iZPiu8fL2Ca3pCUHRjVY05w8C7IOAVgsnCLJyae0qU1/xjX9vYybodwGQ8JEId
	 kHVO0UUx171Hg==
Date: Fri, 7 Aug 2026 14:58:17 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Thomas =?utf-8?Q?Niederpr=C3=BCm?= <dubito@online.de>, Simon Wright <simon@symple.nz>, 
	Diederik de Haas <diederik@cknow-tech.com>, Andy Yan <andyshrk@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 01/10] phy: rockchip: samsung-hdptx: Fix rate
 recalculation for high bpc
Message-ID: <xlfzdchgk7nrjhfdnibakwrmtmb4mbxjvbbbcdsvv2okhwymfe@olxwicuvypq6>
References: <20260723-hdptx-clk-fixes-v5-0-8e786067865f@collabora.com>
 <20260723-hdptx-clk-fixes-v5-1-8e786067865f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723-hdptx-clk-fixes-v5-1-8e786067865f@collabora.com>
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

On Thu, Jul 23, 2026 at 10:41:44PM +0300, Cristian Ciocaltea wrote:
> The PHY PLL can be programmed by an external component, e.g. the
> bootloader, just before the recalc_rate() callback is invoked during
> devm_clk_hw_register() in the probe path.
> 
> Therefore rk_hdptx_phy_clk_recalc_rate() finds the PLL enabled and
> attempts to compute the clock rate, while making use of the bpc value
> from the HDMI PHY configuration, which always defaults to 8 because
> phy_configure() was not run at that point.  As a consequence, the
> (re)calculated rate is incorrect when the actual bpc was higher than 8.
> 
> Do not rely on any of the hdmi_cfg members when computing the clock rate
> and, instead, read the required input data (i.e. bpc), directly from the
> hardware registers.
> 
> Fixes: 3481fc04d969 ("phy: rockchip: samsung-hdptx: Compute clk rate from PLL config")
> Tested-by: Thomas Niederprüm <dubito@online.de>
> Tested-by: Simon Wright <simon@symple.nz>
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS
> Reviewed-by: Andy Yan <andyshrk@gmail.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

