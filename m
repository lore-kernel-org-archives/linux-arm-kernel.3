Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A984CCCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 12:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrD15lH7IUb1YniDYdLmkUnzg/+PCDE4bFnXHniYJUY=; b=pGuOeDf5NG9nS0B9Y5UWW/dIzo
	D9g7eOMum5BOLpTxZlnU2n9APtmMHD0vDgocCPtW2Ric4X/8dRTxEDlRoWFyZxtV+tEslxC76oqKO
	1ZQzPSfWjtSBE54V7F/57MFv8gbg20nd94NgrTeyR6jMfWIscv8dtvDdDG3d7PjQCxDqNTZFeLraJ
	cj0XICrEri9sAd3NlprL52VRdDDy/GwBZtLgLZ+TnHhGnkQEHcHtFYQDx1LTHxerHFb2tP0kv4ZOc
	sun8Luk86E5um3BcXTBV4O3ZApxue2dv17SK5AetCj0iBfTPCbgPVEuGmAOOyRABPDce63iU0t4ky
	5QvOHQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8e4A-0000000GF5A-3JrE;
	Tue, 14 Oct 2025 12:23:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8e48-0000000GF2c-0tmG;
	Tue, 14 Oct 2025 12:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=KrD15lH7IUb1YniDYdLmkUnzg/+PCDE4bFnXHniYJUY=; b=k8DUbYZQER5zJacQEJZcChExiJ
	vhPUeZ/Zv2fV5lYzYR7IW+20M6hSqq83JjRMMrdU8xD2M7uo6GSDBwFtbwR7dPyOWBgEcLQOZPe8q
	VG9rnq397wQkFIaTpDA1CXF85u+HpmIEtiszRnJYuclchiLDT8Lh98oeSBlFQcPIn3dD/uDHMk9qk
	uGk3Z7s3dSb7PukDAhu23N6xrSiXJwONj2QVhnfx7FhvFt12Og4RjcwMNFEMBLa7BEDFAuBWN1xih
	IUXpLgrinQP7f85hy+nghNIpbdYXB6I9665GL2NiMUSfj7VMtR8kEFbHrPfQadCVbwmLfPraZH/nL
	7R0uH3CQ==;
Received: from i53875b75.versanet.de ([83.135.91.117] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v8e3t-0007Hl-3y; Tue, 14 Oct 2025 14:23:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andy.yan@rock-chips.com,
	hjc@rock-chips.com,
	Damon Ding <damon.ding@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH v3] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
Date: Tue, 14 Oct 2025 14:23:19 +0200
Message-ID: <176044455976.1550590.2860570275886738546.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250928103734.4007257-1-damon.ding@rock-chips.com>
References: <20250928103734.4007257-1-damon.ding@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_052344_251993_297985F7 
X-CRM114-Status: UNSURE (   9.92  )
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


On Sun, 28 Sep 2025 18:37:34 +0800, Damon Ding wrote:
> The "grf" clock is optional for Rockchip eDP controller(RK3399 needs
> while RK3288 and RK3588 do not).
> 
> It can make the code more concise to use devm_clk_get_optional()
> instead of devm_clk_get() with extra checks.
> 
> In addtion, DRM_DEV_ERROR() is replaced by dev_err_probe().
> 
> [...]

Applied, thanks!

[1/1] drm/rockchip: analogix_dp: Apply devm_clk_get_optional() for &rockchip_dp_device.grfclk
      commit: 0dc25a11b8936bb752d6217f9db9857641c3d266

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

