Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E23810AB819
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 19:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vAkWmARhLdVP3gbtcCX8NsX3ZXhUuRpLFStqhcpudag=; b=h/3yCvkNCcusjpAp+Ip9B1JThT
	lQcTVG3Yg45BBtXCwnohGJxAf95oJFHF5OwPGn/CpQr7EuFjeLSFfX1u6VY5FyW3a9I85DJ5ZqFaa
	r3d88tb6q244gALk4aK/ZIM57tTqO7efCdntQ42NQFP09dzPA+rLYWUBSAHSNashf395DdtPPmP9z
	z8s8m4w065y3aTzaopLTQ6a0Wo/Uc4P19htXL7+Ls9hHkdFeGV/nEXd/wgbGY0hYLie+yd9SdSnhD
	EiCzB8vsqgz/6GTTRA6z5MDtAQpWvmQ1Cj0LuyPygD/+Q+E/uD/oq8VVx1WpP6Tza9lbnZa3YkM13
	L5cs3dMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qa8-000000067yJ-0xij;
	Thu, 26 Mar 2026 19:41:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5qa2-000000067vQ-2qex;
	Thu, 26 Mar 2026 19:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vAkWmARhLdVP3gbtcCX8NsX3ZXhUuRpLFStqhcpudag=; b=a5JDTmqql5yF9JATcx3NeEWjwO
	NsUy++drtotrp1/hSszJT1yhZ1d2peCWYpHZiwqssh29XNHatmnj4ShyEJNuMZF9/CaO4q2MHz71Q
	4hYYsB5ADnVM6Sp/UdkXO1t5U/B1EyOJKQJyL6kpBLd3NmqxKl/KUaH0o9jLwo11xkQkBIG2/MPUp
	bBUJCq1NXKAsF3kWMwhQ42E+e+AMm5SFylTTBZ7lymZuFxVnonDAuTEgPnsy7M9Rz71cORdlowGB7
	EzTLoBC7dqPC1QZw9PDNC2+ibUux+Ujp6tqlaVMUnsKRxPnvKB+atkwuawmGc3/i5/1Ao5PsYuU9b
	lLAFU0rg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/8] Rockchip DRM use-after-free & null-ptr-deref fixes
Date: Thu, 26 Mar 2026 20:41:01 +0100
Message-ID: <177455405022.1277100.574051493111614473.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
References: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_124122_714752_B5C64BE5 
X-CRM114-Status: GOOD (  10.76  )
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


On Tue, 10 Mar 2026 00:44:28 +0200, Cristian Ciocaltea wrote:
> The first three patches in the series are fixes for use-after-free &
> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
> drivers.
> 
> The following three patches provide a few minor improvements to dw_dp
> and dw_hdmi_qp, while the remaining two address use-after-free and
> memory allocation in DW DP core library.
> 
> [...]

Applied, thanks!

[1/8] drm/rockchip: inno-hdmi: Switch to drmm_kzalloc()
      commit: 3cc50e7f73fcf79f28660b9d91566b13cb62e520
[2/8] drm/rockchip: dw_dp: Switch to drmm_kzalloc()
      commit: ed9da8d23020352ad24c528db09b5acdd78b81fd
[3/8] drm/rockchip: dw_dp: Fix null-ptr-deref in dw_dp_remove()
      commit: 9456381d8b60bb7dd42f2f04afe5ee4ce6e0bc12
[4/8] drm/rockchip: dw_dp: Simplify error handling
      commit: 26cb3e26efa7cc84289966cab871889f6ca93616
[5/8] drm/rockchip: dw_dp: Drop unnecessary #include
      commit: 31a98842a11fcb52a2db9b1b498d5ac11793e35f
[6/8] drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()
      commit: e1f7b7cbd74c6561944f5dda345dab59ad391acb
[8/8] drm/bridge: synopsys: dw-dp: Drop useless memory allocation
      commit: 971a6d5d41315f3bfe1e1207f24da9a191c949ff

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

