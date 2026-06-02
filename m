Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE43CD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gKB9x1tpiuLUEeBus3o7GudY3/h5ARry57xES+ML00Q=; b=EnkTsYbF+em8hPivFqNwLjM5Te
	wiRDZGQnFWIVK55EZZQueWXOsMAe3LsJAH3zE5KpVRVTqlFlhXq5aj/bd7gFPEoAJcTyON7TFf85i
	mU4hFa+92cTMcWoZhMJB3mF6Rmx1UhnlwZQP8AVwxGW3WH9oqRKhcJJcuQD7lOuYJJBpqv4DMmEpO
	njs/OJgIz4JNuyLvPxTmrMFeAI96wNH4BRBZmAeQAANCAHsi5yNd42PijFB4s3L2oFUCRR3z9woK/
	Xu2FsDyK86XYS/vIjFxOUzHpuNftNUPQYJDCsVNPlQ7WkRZmNtlXNLY+XQy1xt2vy9obq1dzDl0+H
	AX3l09cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUV2S-0000000Dhgz-0Fyh;
	Tue, 02 Jun 2026 19:44:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUV2P-0000000DhgZ-3JYW;
	Tue, 02 Jun 2026 19:44:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=gKB9x1tpiuLUEeBus3o7GudY3/h5ARry57xES+ML00Q=; b=HdXi8ByxbzTxRwmizh/1mOWD7f
	R7+X+vJ0h22fusPLEAc7dw2I6ZLJwoa0OEIR7bdKR6Y5ckQAKeGa+rsioN4vDsrRkKb28LHCDa3nu
	NTvYxBYtuKDgY01PhsOJ7hSJhSzeJlNAe1jNWCXuuNMf4iw1nGv91eyIBWAFtQsdsftVgMPGGknSv
	Be8q/PHO6neaPACJD/YNS9a//hsxBL9BIOMznhyD7C6fKY1MOteI6SK1jurYcxic65eU/EAU+JWUd
	HzJQe1o+82DSbvWJP9+j9LSq6W3gHqNUEm/YmMPQBhvKCvr84cq6T/QLh4PJRS/MzODe+SqaFi6bv
	ID89T8fw==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] drm/rockchip: vop2: Fix layer cfg done timeout on multi-output setups
Date: Tue,  2 Jun 2026 21:44:19 +0200
Message-ID: <178042945330.650189.17239358036514651129.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
References: <20260504-vop2-layer-cfg-tmout-v1-0-730226a7331e@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_124433_832059_EC6B4A86 
X-CRM114-Status: GOOD (  11.65  )
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


On Mon, 04 May 2026 21:23:58 +0300, Cristian Ciocaltea wrote:
> On RK3588/RK3568 boards with multiple active display outputs, start/stop
> transitions may trigger a timeout during overlay layer configuration:
> 
>   rockchip-drm display-subsystem: [drm] *ERROR* wait layer cfg done timeout
> 
> The shared OVL_LAYER_SEL and OVL_PORT_SEL shadow registers are committed
> to the active configuration at the vsync of whichever Video Port is
> selected by LAYERSEL_REGDONE_SEL.  When two Video Ports race through
> atomic commits, rk3568_vop2_setup_layer_mixer() has two issues that
> cause the wait to poll for a value the hardware might not be able to
> produce.
> 
> [...]

Applied, thanks!

[1/5] drm/rockchip: vop2: Fix wrong wait target in layer cfg done check
      commit: 9f5670802df085ad343146561e69bac43e9905d2
[2/5] drm/rockchip: vop2: Wait for layer cfg done before switching LAYERSEL_REGDONE_SEL
      commit: d1ad644e572c0647ad8428439eafea0aacfccf9e
[3/5] drm/rockchip: vop2: Delay old_{layer|port}_sel updates in setup_layer_mixer()
      commit: 6a2f7339191b652f7ff998595df90987b33c3fda
[4/5] drm/rockchip: vop2: Drop redundant zero-init in setup_layer_mixer()
      commit: bc5ffd6fc30cc52983d95fbe8783bb4233db6f86
[5/5] drm/rockchip: vop2: Use vop2->old_layer_sel directly in wait_for_layer_cfg_done()
      commit: dc3de97433db03157ba6f87b6494ff1ad416a5a8

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

