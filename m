Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5193F428C8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pVTrtpzMMcbopjMq6dzVghmAnApUfVfApynT2z7zNw4=; b=5A2C63GeiKOuqn6LdXPAM48TtZ
	/Dh7Cd8NWe2Md/cv/MCQy7VTfdbkSJL0ATOOvP98KImDoWCbGlMnndvkb+7lbN37dbw+kVaDAGq2i
	/l126Fk7Q41ZpHCVXY8E9ARDs/To3m/Vt17TlsgOEJIwi81mOnjDPmePlcX7KRyV6S5gtgd+Eujjq
	N0G4ekm+CXQld3C+ykQClpYqBLQ+Hw5l1waPtu0ES9SOLK/Lz8XtEA46rVt/Vuj01yn0/9OtLKpe6
	9ZLiK3oqvL7r83UlbiiqFKrgEyrQJCWSl2Mlr6oEW5vsXX2rn/guqickWO6gU+jSZ9gNMY/6Q5YQ8
	C2vCm6YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0r5-00000001DEm-45ie;
	Wed, 15 Apr 2026 14:04:35 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD0r4-00000001DDl-0XvO;
	Wed, 15 Apr 2026 14:04:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776261871;
	bh=21h7NyivpOz74ue2rg11pkknE/jlHCT9nP2kf9C1szg=;
	h=From:To:Cc:Subject:Date:From;
	b=kHZJQv3gSr7mjPUiqA8xXytY0Z+tkDFhaHfXBo1GFIUOLFZ2KrSN/Im66qkCUl3f0
	 ZzBAeWAbyeH4khO07hzYGdOv5nU5Pg4iX6IQaZ4xlMZqV2fG+H3UG9xGcJMngW9vdO
	 zeL/uHl5iAWvHylAwiLvTM5rarVkUJVmkQPZNAnfCN4Z9f+MJmHhP3HfFL9cvWc5hC
	 SRh9raw5SnPHfaimcZttFQLSwhVNiTwiffBJOWtjGjT5+E2zwPUZm+XSx9T44iT/Tc
	 I44azkb8/vTXvFVD+uPwjxoOvxPdpUg3ocaKAHDjfoXx8PyLR3mynZTUPzzgAqJL3+
	 TGWIJYRytGgpg==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5FE1117E1276;
	Wed, 15 Apr 2026 16:04:30 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 0/2] media: verisilicon: Simplification and clean up
Date: Wed, 15 Apr 2026 16:04:18 +0200
Message-ID: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_070434_319302_54DB3358 
X-CRM114-Status: GOOD (  11.79  )
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

Simplify motion vectors and reference allocation with common helpers.
Since it requires to move some of codecs specific functions and
structure in codecs header files add a patch to finish the clean up.

Benjamin Gaignard (2):
  media: verisilicon: Simplify motion vectors and rfc buffers allocation
  media: verisilicon: Clean up messy include

 drivers/media/platform/verisilicon/hantro.h   |  31 +-
 .../media/platform/verisilicon/hantro_av1.c   |   7 -
 .../media/platform/verisilicon/hantro_av1.h   | 100 +++-
 .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
 .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
 .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
 .../media/platform/verisilicon/hantro_g2.c    |  36 --
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  26 +-
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
 .../media/platform/verisilicon/hantro_h264.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.h  |  98 ++++
 .../media/platform/verisilicon/hantro_hevc.c  |  37 +-
 .../media/platform/verisilicon/hantro_hevc.h  |  82 ++++
 .../media/platform/verisilicon/hantro_hw.h    | 446 +-----------------
 .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
 .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
 .../platform/verisilicon/hantro_postproc.c    |  29 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 262 +++++++++-
 .../media/platform/verisilicon/hantro_vp8.c   |   1 +
 .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
 .../media/platform/verisilicon/hantro_vp9.h   | 104 ++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
 .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
 .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
 .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
 29 files changed, 796 insertions(+), 572 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h

-- 
2.43.0


