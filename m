Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACAE9EFCD72
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oce+0JRH7oP95lMsb9LbT/mHsEvUzOv0UTqoZ9TUMP4=; b=jpvMCAxo8hlhci
	SxD7FcijGQWeAh3FxmSt8xMmjWqd9ImaijVY/ZDaJnCP8SiAMyJ6xL/qJ2FCoAg884fDZSHsj/dz0
	dbEwHmN8kMg3GxzqjwmMliDWdXlFykSuGTXZShE7N9jJBwEIUMNoPL+axLG1QluHrr/QyGX+NaDsU
	pqnjp+txSHxQnGLIBxjfjtYBRLhevYVA6rpM/AYhn8I5oTgTkrcsko1gvjXgZctnvkYwTz1hF9CE3
	lCwJ6/FfJxh4wPY1FYkNcO2zvPSnHxAf3hZsohA+MKZQ1qs5qohLYjvzOoeqQJPbQXUliR2ODE16U
	lACV/qTtlcFF4D8mi7XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjL8-00000008F1F-14XF;
	Mon, 09 Mar 2026 22:44:42 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzjL4-00000008Eyo-105a;
	Mon, 09 Mar 2026 22:44:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773096275;
	bh=ielanxfO36OKZ6/DK4dhhEI8R7wMWkeZYXUkCFDY5f4=;
	h=From:Subject:Date:To:Cc:From;
	b=TIKRFETGF4gqBG8nw+65qMjKzLK/GMPgUAtO1NtCVG2y7Kz9TPkQSfYZsupqe+8id
	 pFEtSyZNp42WMeVMP+jYeWj5iJ1pW/zczJPY1ueOUHezVXxrvtGU6c9ZYhaerlKPNR
	 9kIdVKKTbYD9K7feDVa+xZ3yNgcg081ipZJYN893Gx8hyqKLFGu/o+CPA5EdX1y+6x
	 u/KFN+nDkUPPH1e7PadyWekFQO89cfqi9i9XfLl7TyhSVH8fLVQ0cSYYibHO0ev/vj
	 gUf49wl4WfjopbbDX1g7SzNTxn3pfb9cwUw0fXp+u7u3YZ3Mea22dMbzxTpTjqTBsW
	 kjYhIfcqKa5cw==
Received: from localhost (unknown [86.123.23.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EE81F17E01B1;
	Mon,  9 Mar 2026 23:44:34 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/8] Rockchip DRM use-after-free & null-ptr-deref fixes
Date: Tue, 10 Mar 2026 00:44:28 +0200
Message-Id: <20260310-drm-rk-fixes-v2-0-645ecfb43f49@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQ6CMBBFr0Jm7Zh2sFRdeQ/DopZBGoGaqSEa0
 rtb2bt8/+e9FRJL4ATnagXhJaQQ5wK0q8APbr4zhq4wkKJGaSLsZEJ5YB/enNDZhshbbUzNUJS
 n8HYU49oWHkJ6Rfls9UX/1j+hRaPC+nSgXh+NNYovPo6ju0Vxex8naHPOX1g2iWqsAAAA
X-Change-ID: 20260122-drm-rk-fixes-a7622c71553e
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_154438_462129_0EC464F2 
X-CRM114-Status: UNSURE (   8.28  )
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

The first three patches in the series are fixes for use-after-free &
null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
drivers.

The following three patches provide a few minor improvements to dw_dp
and dw_hdmi_qp, while the remaining two address use-after-free and
memory allocation in DW DP core library.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Fixed conflicts while rebasing onto latest drm-misc-next
- Added two more patches:
 * drm/bridge: synopsys: dw-dp: Unregister AUX channel on bridge detach
 * drm/bridge: synopsys: dw-dp: Drop useless memory allocation
- Link to v1: https://lore.kernel.org/r/20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com

---
Cristian Ciocaltea (8):
      drm/rockchip: inno-hdmi: Switch to drmm_kzalloc()
      drm/rockchip: dw_dp: Switch to drmm_kzalloc()
      drm/rockchip: dw_dp: Fix null-ptr-deref in dw_dp_remove()
      drm/rockchip: dw_dp: Simplify error handling
      drm/rockchip: dw_dp: Drop unnecessary #include
      drm/rockchip: dw_hdmi_qp: Switch to drmm_encoder_init()
      drm/bridge: synopsys: dw-dp: Unregister AUX channel on bridge detach
      drm/bridge: synopsys: dw-dp: Drop useless memory allocation

 drivers/gpu/drm/bridge/synopsys/dw-dp.c        | 12 ++++++---
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c      | 35 ++++++++++----------------
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 13 +++++-----
 drivers/gpu/drm/rockchip/inno_hdmi-rockchip.c  |  3 ++-
 4 files changed, 29 insertions(+), 34 deletions(-)
---
base-commit: bfb18fd193e2413f02ad934e46887f415f0ce4ec
change-id: 20260122-drm-rk-fixes-a7622c71553e


