Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7691CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fLl6q1Y+72vHxOIMF4slDKrUf5187PWqHxWI44dG6yE=; b=BiK4sQNzTW1dru0GR75coby2ER
	PUfdmOA83N9XLIyLYf+231x315G8xJB6pnkX8pzJ1bxdchIfvZtnimEKubGMYRNCA+R6pMWVUA134
	CoLwyDZPE1ecJXSWg0nUIcySeQUKEArMVkUyJmpGzQ924JgLrHOMPI65YnFaZIMfRXWq7kQNV2+gj
	wRXDVGUvZYuLRTBs+ramwxxao0YPzf+6nZ4yqI1KEpoxwDLf14Hvv9d2R9MuMVNxBr9deCv5dFaod
	eJJh0SOO2bKrrOpnc+ABTxZepeMtYTyrz93bfE66dGh+358j9zl0o10e/S2VJCLuaVF6jEgTZXi7f
	yjgHKv7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Ao-00000002qb1-1f7I;
	Wed, 15 Oct 2025 20:32:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Al-00000002qaX-3DJR;
	Wed, 15 Oct 2025 20:32:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=fLl6q1Y+72vHxOIMF4slDKrUf5187PWqHxWI44dG6yE=; b=Yfz7vK+9g3WW7BmyFBFji3dkMU
	UevXDzFQ4ydupk++uQA9CA0Kni3han+FwzAvwR1aU2BFfJ6pKsTFz8BXw/B4dY28bnusWTOcilWIq
	c5tT3UCH41N0TqRuXgZYdT1jnvonWs1mYI7vkq0kQ53SMjy0hakUfxwHDXc6KMNHe2sdPT8guKzGV
	SLDjaMJm2Ce7EM6fEw9FapvU2XaIlLVoyFSK+kWCiYyyJ1aWdU2lTKwtizn8jxC/H2TXSuQkufMLK
	JS0q3ff+QkqkfAJCiLHiCrCMGVMhAJ6y5nElRZXCJt86E9KkViyTeu9wmkejJwNgyfRqhE2eDurvE
	8f/4GNWA==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v98AD-0002OA-JH; Wed, 15 Oct 2025 22:32:01 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Derek Foreman <derek.foreman@collabora.com>,
	Daniel Stone <daniels@collabora.com>
Subject: Re: (subset) [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Wed, 15 Oct 2025 22:31:51 +0200
Message-ID: <176056029579.2036456.8048983695806935631.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_133235_851189_3A6CF2CF 
X-CRM114-Status: GOOD (  13.95  )
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


On Wed, 03 Sep 2025 21:50:58 +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> [...]

Applied, thanks!

[1/6] drm/bridge: dw-hdmi-qp: Add CEC support
      commit: e4a2d54a2f1a9c9a1971651832c8f0ad9d3782c4
[2/6] drm/bridge: dw-hdmi-qp: Fixup timer base setup
      commit: f7a1de0d86221000dc0699a8b48ad3a848e766d9
[3/6] drm/rockchip: dw_hdmi_qp: Improve error handling with dev_err_probe()
      commit: b6736a4ea3fa68524074a18334f344a34a05bee8
[4/6] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
      commit: 9baa02327adf2b1e919e95af23036102cfd0133f
[5/6] drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
      commit: 33ea4d520fbda505e2cfe5b36ebf522de1f3f5e9

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

