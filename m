Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8284FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 19:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0DxwxRyaG5jF4/uwIPZGuF6ijA1I6hYxXPandl++a5s=; b=SIMOEtszmsuQ2hjB9yI6ln8AFL
	QyAwEBwVfShrly6CBaTrgzAJtkBQluD1ab1z+CGESNgOXgzMxthgT96Lc3xKmiN7dKU4Xhb1i1dO1
	+H58HXnhnzgdCOA3q+8fN23/7M9JdNJC9+CwLapijMHNuyCxCW53keG9z+arpHPzPKkKL27rEcJXA
	Ca6kiQfzMftIBJIMVU2wkHvLrFBeCsfq0hweVCr1x1Qfv/YRZ72KzHtFlySpSLKiqNuUJjbbMS6Fv
	8RykevJCq2ioyMybOwaYR/dRvQCiHtRqMOQ54Y1oVHhMCUvwzPgGqXHU6DtraqYLNjYk132nZses8
	S6YpUm5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTnEq-00000003sSA-3cI8;
	Mon, 23 Jun 2025 19:53:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjiM-00000003MBr-21DR;
	Mon, 23 Jun 2025 16:08:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750694889;
	bh=xDvkLdk8hMUQqSvQi1R6ZixD6fEY6eb3RFzWM6baH4o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oNoRSzib+zbMQPDZnMpSIymSkOk5vbP2+kE4B+QLlBlmB2nWX22ZzU2G76VfViNKM
	 KQJ8IqahXEvsP4i4F3Wgg0hhMmsLKQtQzi/J5AAvVMTkXrOctj1vFrokZQY2mBtfIb
	 9hGF32pz7VLt4p2bqpWF+/LnSNOEucTIFkoRlqonHewBS9WrtFUSeDSo7xmD96nDUd
	 Hu69tPCHe3pdg9fG1XeHaj+npraAnyGCeOVqPtExWSUZW5gzxrsKx+cHAv7bqqYzWS
	 z06/VySIHr7ETpczvNE3H8MYUnUMZwiYW4SjVUg0OemLCd+KgyvRZ5pwvbMd2fJHpg
	 NC4tNIyZb9CjA==
Received: from trenzalore.hitronhub.home (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E065E17E3700;
	Mon, 23 Jun 2025 18:08:05 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH 7/8] media: rkvdec: Remove TODO file
Date: Mon, 23 Jun 2025 12:07:21 -0400
Message-ID: <20250623160722.55938-8-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250623160722.55938-1-detlev.casanova@collabora.com>
References: <20250623160722.55938-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_090810_663217_CB260781 
X-CRM114-Status: GOOD (  14.57  )
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

2 items are present in the TODO file:
 - HEVC support
 - Evaluate adding helper for rkvdec_request_validate

Missing HEVC support is not a reason for a driver to be in staging,
support for different features of the hardware can be added in drivers
in the main tree.

The rkvdec_request_validate function was simplified in
commit 54676d5f5630 ("media: rkvdec: Do not require all controls to be present in every request")
by not setting controls that have not changed.
As it now basically just calls vb2_request_validate(), there is no need
for a helper.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/staging/media/rkvdec/TODO | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 drivers/staging/media/rkvdec/TODO

diff --git a/drivers/staging/media/rkvdec/TODO b/drivers/staging/media/rkvdec/TODO
deleted file mode 100644
index 2c0779383276e..0000000000000
--- a/drivers/staging/media/rkvdec/TODO
+++ /dev/null
@@ -1,11 +0,0 @@
-* Support for HEVC is planned for this driver.
-
-  Given the V4L controls for that CODEC will be part of
-  the uABI, it will be required to have the driver in staging.
-
-  For this reason, we are keeping this driver in staging for now.
-
-* Evaluate introducing a helper to consolidate duplicated
-  code in rkvdec_request_validate and cedrus_request_validate.
-  The helper needs to the driver private data associated with
-  the videobuf2 queue, from a media request.
-- 
2.50.0


