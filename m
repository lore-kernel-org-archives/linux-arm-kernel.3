Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B272CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6p8WMfmPS/2ENAV2cQiuR3uNGwiPH4kh/nqLPv36UjI=; b=Hqqrn1Xm8OzZaz
	JXbcRm7FuBnsrZzTZNnX5VAq+P95FNO5Qanr9T9pKTO9DgLtewbHBte7Kvvohrd5Li4apOcumpO5V
	k2SfBsQSQcNTnG88+CK+Mgfc7nKhoCFwHwyIcvAU/fCKuAjKXdUoda2SEgNYO/4lBTeX8YOIWcPFX
	F4h/9uzskdl0VSG26v4ytCO/WfyWE/LoV29WrLLK5O58Ti0JAkb781XbywZJkoO7V4F7Fsnf5gzME
	wJAuu4Jj6Ig+IcutgpeolbFzCGxf1f1lsOW/OY40y2+0qg6a7EyjL6RNoW7sktFfBv69V/Cht9q6W
	i1Ygljbs9sI58+eohTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFV-0000000G6Cl-2w1T;
	Tue, 14 Oct 2025 11:31:25 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8dFS-0000000G6BC-3WkM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 11:31:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7507C1A136A;
	Tue, 14 Oct 2025 11:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48E46606EC;
	Tue, 14 Oct 2025 11:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16468102F2298;
	Tue, 14 Oct 2025 13:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760441475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6p8WMfmPS/2ENAV2cQiuR3uNGwiPH4kh/nqLPv36UjI=;
	b=MFJvYsc63DmUpUkpCKHQjuI/RLnMI17jrS5/jJUT8DRfNGXMIzmthheE7w4LzLqwHC3IMm
	y7R4pOQTiMiChEj5glwZ4fHyPYaJvgdBpIiSzC20ONyWYDFRZbl82IyUUzPJ7EYns56TdV
	xdFsFSXr25J3Rzqlob7LrEjEVqq2E/SOlv8rQo4yDJKFPFgPV3G92CcrYOhCobjJZaHzgV
	b9TSxh8rOwq5tgkxjEndTgluNftA6FDVSGmpI50WESXJqZEN9zdayy7LvACxIrIxhHNOIj
	k34PxeHOYjOX7Ww2NDHhXL7B1Y1DPgf5g1vBaSHuvld4DDIjVqydaF7QFsBruQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/imx: parallel-display: fix drm/panel/panel-simple
 v6.17 WARNING regression
Date: Tue, 14 Oct 2025 13:30:50 +0200
Message-Id: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGo07mgC/x3MSQqAMAxA0atI1gZsnahXERfaphpwIkURine3u
 Hx8+BECCVOALosgdHPgY09QeQZ2GfeZkF0y6ELXqlAVOtlwEnapjOt6WOTtQT6vu0QztUb7pjb
 WG0iDU8jz88/74X0/M86X3mwAAAA=
X-Change-ID: 20251014-drm-bridge-alloc-imx-ipuv3-9b792f659cf9
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_043123_004983_7A3619A5 
X-CRM114-Status: UNSURE (   6.97  )
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

This series fixes the WARNING regressions reported by Ernest [0] and due to
the missing conversion of the DRM_IMX driver to the new
devm_drm_bridge_alloc() API.

The second patch also adds drm_bridge_add(), which is a good practice and
proposed to become mandatory [1].

[0] https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
[1] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/imx: parallel-display: convert to devm_drm_bridge_alloc() API
      drm/imx: parallel-display: add the bridge before attaching it

 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 48a710760e10a4f36e11233a21860796ba204b1e
change-id: 20251014-drm-bridge-alloc-imx-ipuv3-9b792f659cf9

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


