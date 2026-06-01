Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DC8FCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KiqfZFOz259aUEoNXA+PD+xHuOUOQFTzoPCeQ4T7w38=; b=u3+5GdBexLEk8u
	uWO+eoEy7TbQYXr9KXuRyHb1CPg3pzHD07U8iAVMI2dRA8ODM05RW+pIgAlLfxA9mETiSc//0th0H
	VnIG4VoFkyWR3Uc+WJpYGL5Ixr9k8UBslI2CiWuuFsS7A9gzzve5cJVJPr32gEDvYvoEHTpthPwxq
	h2/A+yp+Fhc2j/jKnlER6aiKBe01MW4FFyKu158wth37ONWM0w0aetBN7qO0VKZoh4p2r7pEqUKZi
	qcCZIP+NBPYXiuIqtI2TiOEFDFERFQgQCFGiHMU3trLQS5UkiV3nKPZkRqTq9CaB6JAzFY3YK2qLk
	0aQcpDWtP5avUYn7xdVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6wJ-0000000Bd45-1FLx;
	Mon, 01 Jun 2026 18:00:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU6wF-0000000Bd2a-1YHn;
	Mon, 01 Jun 2026 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780336832;
	bh=f3hUMNFcEdyqeQuUHaPUg6wYaJ5ED/dmqbO5zRa5LnM=;
	h=From:Subject:Date:To:Cc:From;
	b=kGIUJ8ve3/hI+JQuzo60CZ83t7lc3FfA6ay+h3etetqrznxwIkEW4spp7rfFmdSxS
	 IIv7VBp2eGjVhVm/YTyZT8BEfUnHxvLjzAqbUsr1/GrExPomvXqMvH82qdvSIHNWb9
	 wqY021pJKPqh9Hb3VrKFL18ey8VV0zzUNIcHzqSuJhbX4H5FaIPUoivzYCqTQwgTAQ
	 WmYQRU15/4kzc/xsz4J0C7OegRSQaNJfBDZRlcVDA0V2YHi/Z0p/0JOc3v2XF+hFHN
	 7SFKpRa3AcWCLCk7Eb914qC2qHZCuevZdF8Kck/DrFFHmsFbI9HK5NhPOLKnPpAdMN
	 iWK57FPpVIqUQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62CF417E03DA;
	Mon,  1 Jun 2026 20:00:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/2] YUV support for VOP2 background color
Date: Mon, 01 Jun 2026 21:00:02 +0300
Message-Id: <20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQ6CMBBFr0Jm7ZgyWgyuvIdh0ZYBapCSFhoJ4
 e4W3Lp8yfvvrxDYWw5wz1bwHG2wbkhApwxMp4aW0daJgQQVQtIVoxsJdYvLHDHXggslSiNvJaT
 F6Lmxn6P2rH4cZv1iM+2J3ehsmJxfjruY797/csxRYG10oSSVdGnkw7i+V9p5dTbuDdW2bV/F8
 53YvAAAAA==
X-Change-ID: 20260524-vop2-bg-yuv-1b0e6a09c579
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_110035_572389_A9AE085B 
X-CRM114-Status: UNSURE (   9.44  )
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

Since commit bec7cbfa7d4f ("drm/rockchip: vop2: Support setting custom
background color") the VOP2 display controller allows configuring the
background color of each video output port.

However, this is currently limited to RGB formats.  When operating in
YUV overlay mode, the color must be programmed using YUV format.

Add the necessary RGB-to-YCbCr conversion logic, covering all color
spaces supported by the display controller: BT601L, BT601F, BT709L and
BT2020L.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Used vop2_convert_csc_mode() helper to address an issue reported by
  vcstate->color_space holds a V4L2 colorspace enum
- Rebased onto latest drm-misc-next
- Link to v1: https://patch.msgid.link/20260524-vop2-bg-yuv-v1-0-dcb6a52923f5@collabora.com

To: Sandy Huang <hjc@rock-chips.com>
To: Heiko Stübner <heiko@sntech.de>
To: Andy Yan <andy.yan@rock-chips.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Sashiko: vop2_rgb16_to_yuv16() expects an enum vop_csc_format, but

---
Cristian Ciocaltea (2):
      drm/rockchip: vop2: Rename CSC_BT2020 to CSC_BT2020L
      drm/rockchip: vop2: Add YUV support to background color

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 155 ++++++++++++++++++++++++---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |   2 +-
 2 files changed, 140 insertions(+), 17 deletions(-)
---
base-commit: e84b07e0a30b371117f9a1120a4645c213f39cd9
change-id: 20260524-vop2-bg-yuv-1b0e6a09c579


