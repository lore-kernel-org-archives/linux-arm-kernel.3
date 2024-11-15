Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930F4D68BCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z89RBnjernh2Ayxy6rPJHDg//OMEO2+nOHpo0bh/Zq0=; b=M6ZwAUJ3vwOIIzz5lfDlDfA0J5
	PgMH6l7ttq2LsHydsMgTTaIx17B2jJzhh1l63QX8XhvojeS7vhRp0L4TXID448C2xBhGF/oKj2g8h
	yMPYYsIQpV+fmGWzaWQySHf0UIO9q+E1q6gLt253OUQYeurW7AHhCU+8rKj1frg9IPZ7P6yPly9iE
	2EpewP1fpG2DS9ndqkoGVnu7rnnNhOcZIGHCG7yYXbLKwb/VkRryYPsnbFTUT+Aj3Pv27a12HszRr
	VqchS96/DkTvjimgqcOQUsmHQJQGNlIt6QMGhnJfmHxohWU5PXP18/myV1NOoHG5+KDpQodpy7H/Q
	+V0kS+cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBz5X-00000003KI1-2UXR;
	Fri, 15 Nov 2024 16:22:27 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBz4b-00000003Jzm-2Uu6;
	Fri, 15 Nov 2024 16:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731687686;
	bh=qQtgDiPyFIYE/RVlLSKOi/67cZnKV6qJu6S3Iy9AxRU=;
	h=From:To:Cc:Subject:Date:From;
	b=hmd/+CVz/rsdlgI3i5EJhKz6xS8+rmVUawAX/d+cBv21FSGnEezB/GgAunwIR1Kgo
	 NKAIejQI+NRC8B0rWdJy3P+JPO0lMR2qw29lyUGn9LsOf4k4UoffIBVafjUXaOgzSP
	 LTlaCA6l/YoDM82smQC6kquhakhPnzSz6EtbEdlACBQFJFpQGvgGhIl37Nt8DD4VkW
	 CnOq7TJI9YpBqDgphKaHKXuGnmAuPFaAj+8NwmnlFySfj7M+lHRyAr8KYQfWvPiRWm
	 3zNHu7wS/oAVW0uxa/Ap+rkCqkYjskKVIBYdptcGtr0KrHwgriECX4X0ETwu+Am8oG
	 rZFZQpBBXLkrw==
Received: from bootstrap.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF98317E36CB;
	Fri, 15 Nov 2024 17:21:23 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v4 0/3] drm: rockchip: vop2: Add VP clock resets support
Date: Fri, 15 Nov 2024 11:20:39 -0500
Message-ID: <20241115162120.83990-1-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_082129_812347_4D42DFBF 
X-CRM114-Status: UNSURE (   9.55  )
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

The clock reset must be used when the VOP is configured. Skipping it can
put the VOP in an unknown state where the HDMI signal is either lost or
not matching the selected mode.

This adds support for rk3588(s) based SoCs.

Changes since v3:
- Rebased on drm-misc-next
- Reword first patch subject
- Reorder commits for different trees

Changes since v2:
- Rebase on latest master
- Add details on how to reproduce the issue

Changes since v1:
- Add AXI and AHB clock resets
- Set maxItems for !rk3588 in vop2 bindings

Detlev Casanova (3):
  dt-bindings: display: vop2: Add VP clock resets
  drm/rockchip: vop2: Add clock resets support
  arm64: dts: rockchip: Add VOP clock resets for rk3588s

 .../display/rockchip/rockchip-vop2.yaml       | 40 +++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c  | 30 ++++++++++++++
 3 files changed, 82 insertions(+)

-- 
2.47.0


