Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24528D2F7CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qt3EtITe5CtWE6F3jVNtNOBQRgaD3NOIImCHAwwQILE=; b=gRPyJ9XgwS1/sr
	k9m/RjlSNj5fwhR8pgVyoOkYzFyl2CIlvXEibx8nYqoW2FUuBAI6qTHPEWT2+HnJTsk6muWqMvMCv
	fS2yVAedMKGLRCgPYfNHyDfiXPZG/3+J8ZO1TXOuS3wRbO6Nk00HWoTXCp64N3dHhr6KNViQ9B5j7
	JTcOsJcLMr14Io+O1ZamhR2I/Rgl7gBCnUr9MYoYWnj0uPZEQDcSr5rS9K/namdKuD/JigAi5Wzbp
	g/7CoOjcWnkm7oBDqiacj7YlOa5u8qIkL/ip/mm9slqIPMsYAF8raTy8x7+Ab1b9YvUsQSp9V3WxD
	alOOLp+x7EF50wIiYp0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSUL-00000009KPq-0bo5;
	Fri, 05 Dec 2025 09:52:33 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSUI-00000009KOb-2AIv;
	Fri, 05 Dec 2025 09:52:31 +0000
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33843EAE;
	Fri,  5 Dec 2025 10:50:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764928208;
	bh=MwhXgW4rnOQ3KSc+GudAM5PShTGwJykoDUKEmfRikoI=;
	h=From:Subject:Date:To:Cc:From;
	b=fbiRk4tg7s7BEQm0DNSKCqvfONzM9PYmpxTgwuUqk3nVU0a6Mw5JW/J+mF/3lS0bp
	 tEoHuNKYGONHG1MSvZ3UFqM9g8gUSCpa/u3xVDMpq4uppgxXYvoP+eZG/z0LOMGyjP
	 moCJLA2vjrejj4nuB7QX7z1vCpPaEzLiQaFJr+qU=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/4] drm: Revert and fix enable/disable sequence
Date: Fri, 05 Dec 2025 11:51:47 +0200
Message-Id: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADSrMmkC/x2MQQqAIBAAvyJ7bkFFPfSV6JC51h6yUohA/HvSc
 QZmKhTKTAVGUSHTw4XP1EENAtZ9SRshh86gpbZKS4shH1joxsgvekNBReucNB56cWXq+r9Nc2s
 fls7cZF0AAAA=
X-Change-ID: 20251205-drm-seq-fix-b4ed1f56604b
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1909;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=MwhXgW4rnOQ3KSc+GudAM5PShTGwJykoDUKEmfRikoI=;
 b=kA0DAAgB+j2qjLyWHvUByyZiAGkyq1Gj1d8xlj6diu63t7iZIaLIFc3fvXjAEHe/VLZfrvIfQ
 okCMwQAAQgAHRYhBMQ4DD6WXv2BB5/zp/o9qoy8lh71BQJpMqtRAAoJEPo9qoy8lh717W0P+wRa
 1bq77t/4zLJJmCAjxcRV1DhoWfVPncOTXA2HSsEIMgPBHpUKZyan6fBYxHp6XkG0gNVZlwTrYhW
 pSyAvXsrnTNhW8q5otmzGyWpCw023NDpDDWbiGUgGg43yQml50nFn6Ij48jk2lXLvpfPWvcsvk6
 bpX+tDXMn0m+FLf1bYvhoJdJIyvq/0wvT5ZIgRfzsZZjWqjDR+WXbdtPV/hyleczIwGaJWqFNhV
 9op0yeeanXhucwBN2xqL73naXLUq9EBNDWtFE4LSmBBXBBLtqTx2K4b5Tsr8g3C9Ch5pf+Qqodm
 OVcabnpPmbZVlxRiBF11N0zi0chMynlCJDfFX0HjltHxOaqXW/LySuusslTdBU0FFpkdS9AwyEa
 lbdnRRJFwaU18kSgasLNEzSBV77gug1YhZ4kkVVTyblKCLlK0GojYFPsQEdPXoIjIXQcpurCr22
 Ln5os9CZuhApjyd3l241B6ZIvimL2MMi6eJE+MGkg6dRaD6GQdslRy1cbxJsY+nhPrku/DS5+58
 IwydYy0PKmXzLH4IcgDqAnmLcFnUstEvCq5lXmvbOPzAGKbIHyIIcxuy9vMmnG03hpyeD+7JY53
 EC2vrgEsPyrVDzXTj+rH5LCRxtu0UFsfuArS7xPBa95f4PCtPr5Cf4MCstwKNERRerTYeCdl8b1
 C77QO
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_015230_717174_642C2BF0 
X-CRM114-Status: GOOD (  10.02  )
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

Changing the enable/disable sequence in commit c9b1150a68d9
("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
has caused regressions on multiple platforms: R-Car, MCDE, Rockchip.

This is an alternate series to Linus' series:

https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa%40kernel.org/

This series first reverts the original commit and reverts a fix for
mediatek which is no longer needed. It then exposes helper functions
from DRM core, and finally implements the new sequence only in the tidss
driver.

There is one more fix in upstream for the original commit, commit
5d91394f2361 ("drm/exynos: fimd: Guard display clock control with
runtime PM calls"), but I have not reverted that one as it looks like a
valid patch in its own.

I added Cc stable v6.17+ to all patches, but I didn't add Fixes tags, as
I wasn't sure what should they point to. But I could perhaps add Fixes:
<original commit> to all of these.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Linus Walleij (1):
      drm/atomic-helper: Export and namespace some functions

Tomi Valkeinen (3):
      Revert "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
      Revert "drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order"
      drm/tidss: Fix enable/disable order

 drivers/gpu/drm/drm_atomic_helper.c | 122 ++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dsi.c  |   6 -
 drivers/gpu/drm/tidss/tidss_kms.c   |  30 ++++-
 include/drm/drm_atomic_helper.h     |  22 ++++
 include/drm/drm_bridge.h            | 249 ++++++++++--------------------------
 5 files changed, 214 insertions(+), 215 deletions(-)
---
base-commit: 88e721ab978a86426aa08da520de77430fa7bb84
change-id: 20251205-drm-seq-fix-b4ed1f56604b

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


