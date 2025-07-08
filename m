Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05C0C83F0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=97sopF4YX8DzwzP4nGmiVk6JsICCBAIUEmsCTEqAsyE=; b=2UysrPpOyH/oWNg9Kbm/igwwsi
	5XsqSURoVtCPi1wTy0DexaQxicjiJ/0P4jpqVWz5Dvx9t/uGuUMc7FtQJLueJQB70cqA0FIRgcvDd
	iHe+6UGjR+LtruRbqElnf6sxde3AuR3zvclLvtMEswR7OWP/PWJ3g2O7O6kTlL4/q6L6c9JTpfCnB
	SROhOgJCJfYMa/JSH74lA2QMuZrId4wPZ6lr128UX/lXIrCHWDi3s3mHTYZjBfeFveTdS0b9r+XxI
	1zxfSS+JC+KxY06h8nmIcf5o191cmW+LzLtClBWFTVFi5LMLVQL0snhbG18bfFSRvoHOfBTnZwxzt
	pHGN5h/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAC-00000006Mkz-3JWY;
	Tue, 08 Jul 2025 19:39:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCEO-000000068Ek-06Fx;
	Tue, 08 Jul 2025 17:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=97sopF4YX8DzwzP4nGmiVk6JsICCBAIUEmsCTEqAsyE=; b=K+fXiJegfbH6kmmryc/nvRZ32h
	2f5QyP6HwtLFc5dTntmsHLxgJLrij4Qt4/gJ/3TroxssEYXqNNbn06FkJjexbGh5hTClQhsJjEHSx
	2ycwocXh5XQENybGOw2UcGAtgOxI5apVYQR86a4wjzR9bMiS8iNSDqmoP5Ud0tK2yoCpgaKCMvt9S
	DfbyC9t5pwrjTgZS/sRPH7Ik9oIpdl9hSq5i/SM7Cke0/01WbpoE9FLVPzVabI6loaCsUA4lnUX9y
	m7JmHwKzhC5yDs6YjNMFZqB3m95P55K9W5zSGKuFDe12adgGGfZDGWVgWatRE9d3CDC05BDubJW4p
	KcOTePnQ==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZCE5-0005cC-HY; Tue, 08 Jul 2025 19:35:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: dmitry.baryshkov@oss.qualcomm.com,
	Andy Yan <andyshrk@163.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	jonas@kwiboo.se,
	Laurent.pinchart@ideasonboard.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	hjc@rock-chips.com,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v5 00/10] Convert inno hdmi to drm bridge
Date: Tue,  8 Jul 2025 19:35:13 +0200
Message-ID: <175199006060.1731917.17930590258834910843.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250512124615.2848731-1-andyshrk@163.com>
References: <20250512124615.2848731-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103548_057006_A5D443A2 
X-CRM114-Status: GOOD (  13.55  )
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


On Mon, 12 May 2025 20:46:01 +0800, Andy Yan wrote:
> Convert it to drm bridge driver, it will be convenient for us to
> migrate the connector part to the display driver later.
> 
> Patches that have already been merged in drm-misc-next are dropped.
> 
> PATCH 1~8 are some cleanup and refactor.
> PATCH 9 converts the curren driver to drm bridge mode.
> PATCH 10 add Add entry in MAINTAINERS file.
> 
> [...]

Applied, thanks!

[01/10] drm/rockchip: inno_hdmi: Merge register definition to c file
        commit: 9c3111df6a681f7b0057f05e7211a98d240237eb
[02/10] drm/rockchip: inno_hdmi: Refactor register macros to make checkpatch happy
        commit: 372a927f93fe0477dd1a5f15f11888391f8ef33f
[03/10] drm/rockchip: inno_hdmi: Remove unnecessary parentheses to make checkpatch happy
        commit: 7431c5462c7f20b7f111c9957a007b8de5b8a76a
[04/10] drm/rockchip: inno_hdmi: Rename function inno_hdmi_reset to inno_hdmi_init_hw
        commit: 55137487bdee89189873e437452a077bb591f33a
[05/10] drm/rockchip: inno_hdmi: Move ddc/i2c configuration and HOTPLUG unmute to inno_hdmi_init_hw
        commit: 52ac749b4505339a321b9695fe9d2977294c98da
[06/10] drm/rockchip: inno_hdmi: Use sleep_range instead of udelay
        commit: 1749267beee76bfd8108f5071afb870903c83dab
[07/10] drm/rockchip: inno_hdmi: switch i2c registration to devm functions
        commit: 078bb17c7bbfe5bb119943fb7a9ef4f9a8c8c543
[08/10] drm/rockchip: inno_hdmi: Simpify clk get/enable by devm_clk_get_enabled api
        commit: 6a1b9229ecf11f409edd9392c96bded1672ea5f3


I've picked up the rockchip-specific cleanup, but the actual bridge-
conversion needs additional eyes.

Also comparing the recipients of this thread, I think your missing some
bridge maintainers/reviewers.

scripts/get_maintainer.pl drivers/gpu/drm/bridge lists:

Andrzej Hajda <andrzej.hajda@intel.com> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Robert Foss <rfoss@kernel.org> (maintainer:DRM DRIVERS FOR BRIDGE CHIPS)
Laurent Pinchart <Laurent.pinchart@ideasonboard.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jonas Karlman <jonas@kwiboo.se> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)
Jernej Skrabec <jernej.skrabec@gmail.com> (reviewer:DRM DRIVERS FOR BRIDGE CHIPS)

and not all of them are in the recipient list.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

