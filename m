Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7A1CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gu1c3uquHuuEbbbF+ownzXg8e3d3QwLSqMpB9MeHIIA=; b=1GM6f4NbV1b7da6eRt8SbYqNtx
	eOiJUEvOsiB6SW/Z8huj7chm93+nbMfCcCtmCX3q2VKhscDmMtYnJrv4598x6d9Jocu6IYA/d7fe1
	m0Cg1IiHLIMaE188CXddPaxt5M4Kg2CLqK1CJNdFZ/GfWzv0aSunwKT/+FqtSPGzVmmynQCUmCJY2
	YgMR/jDx4ZwLqECl8LG/xw9ncB4vLXqnwlGNs9bvEGDaKf0wJxj/+5xSryoYsho6j4nX3k6X8iqpB
	EvgIFV61+gmVczoEbZ3x6x3bTaU8vSdgOkDxU/xJAp5G+9kAP9DEo8UkwYlRbkoJFsYa7uv/EgsRn
	spGMxsgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUqR-0000000Dgyy-3hMK;
	Tue, 02 Jun 2026 19:32:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUUqP-0000000DgyY-2q3h;
	Tue, 02 Jun 2026 19:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gu1c3uquHuuEbbbF+ownzXg8e3d3QwLSqMpB9MeHIIA=; b=XYPp70BuKKW9wSNmqWd7MIIQNw
	lFj6XDcvGDvWIgMiEmJsNhjElQDuviLiFtH8H4mAsm9YEWN/2CeuYpfvAIANaG4/WiR4kI9Ynwdeq
	IIaOSg1HFTkXej+5IURSwgfUm9mDRWrSRtoW1O+u+rrp5ZV22CaktYXNYcFdQRRFx80Pl21kD+KdM
	rvflqpOblScLA9QltdFuacmqyauYhvKpVpIpP2NcqGk7yGRehYRDKxrixj7zzhJM7D0dsE90OcFRP
	CUZksaa8blHHWwCfKknPF6KpuU11BOP3RDNwxlCisHjcFIknyboYGQLco147erohB8wzRDeuCgEqd
	dgtzUNjA==;
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Rockchip DRM use-after-free & null-ptr-deref fixes
Date: Tue,  2 Jun 2026 21:31:43 +0200
Message-ID: <178042869904.638042.16054419218883756618.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
References: <20260601-drm-rk-fixes-v4-0-c3f3f123e1da@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_123209_739669_21CE1D62 
X-CRM114-Status: GOOD (  11.50  )
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


On Mon, 01 Jun 2026 19:13:43 +0300, Cristian Ciocaltea wrote:
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

[1/3] drm/bridge: synopsys: dw-dp: Support unregistering the AUX channel
      commit: ed04e8e2307f35b3d8d49a554faf5e72d3d224e6
[2/3] drm/rockchip: dw_dp: Add missing newline in dev_err_probe() message
      commit: 0a01412178047bf3ff351c7e75d373e411072a87
[3/3] drm/rockchip: dw_dp: Release core resources
      commit: cc6d7aca2f37a1525a94ef97eb3ce361732c876c

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

