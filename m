Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F08CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 07:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n4UPEtYv85DDTxdGxZ3GOa4tyKg7+fMqKk+6YoXF2Fw=; b=Oe+icb/LL1fpj8E0NsCDC8wo2A
	7o79sjv2qaFQk96Ax2VGIkXDyu0D08pqYyI6673STsySK8qavEa56qSHU4T0jASt541duRx93k0Xm
	ldF+gn5nfXNpcd6FrLM6fJ6pAvDAAzFkekPYZYMdV32g4YKIoMi8HKXlhxV/IsxOm+qzmXZOlgVAM
	vTRuvKIAruKHqvB01E+A8LTIXlRkT6uzbHO24DJJEtVaMVs+q3c06wmb4T8jTtdIj145mzxbfqsRU
	M3sKyUVjb5SppSqTtwq6bdC4GgzYA3huuDBz8zaDOjI1KlsWgxdHTmTgtLjqBbNNKEDcfOi/et02y
	fFuUDMpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaif-00000009KO8-1WDE;
	Sun, 31 May 2026 07:36:25 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTaid-00000009KNY-3SQP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 07:36:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8423f1d8902so48636b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 00:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780212982; x=1780817782; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n4UPEtYv85DDTxdGxZ3GOa4tyKg7+fMqKk+6YoXF2Fw=;
        b=JenlJnCQ7tRsugnbFQEDF+v7bJGFRsAeBbWb4KTWRqHfm3dNUhTUwVmYVmYaQnpsbJ
         wN+NW+gzLl+9M0/BK03363dXWWSHAnzcgu/XcWTdpnPdX0PHznlCj429KDFd6C5MfRSI
         gRTo/Al9zaGj8FeOjA57zLT0TlkmDFlAEbTnWpxQRlJAwE6Tz4g6kjKkoG1GWlX4aFiD
         CmbfeJh0QUkH/YeMNPzO/ArGXd6TkjMTvouHWWeW+2mOEGxwJs4vFhQCwNhwlz2FdKUr
         kZWv+PY6BVP6tu063Mj33IsW4eoT25Fsx9wORXQgABvfkgbFi4tDlo0yo4Oi1pVMYTDa
         53+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780212982; x=1780817782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n4UPEtYv85DDTxdGxZ3GOa4tyKg7+fMqKk+6YoXF2Fw=;
        b=R+cmU+62holbrTNRmS+RPCKzb/W4gYQn4ZCdzR6HI/xjmMxJ6d9GFi3wefQXXNCp8w
         0YlBLDOjtmrdCvsBFZVJRvykSg4MR4KEVkH6m2JzG/IcZRIUsf2w9yc9pn1FiJqaLRhi
         9GkkKFyIVagQb/G4SB4LrpK/YV0UGAyKGLxdCUKUR9/HIKGgqi3mLai9vVJVEWvtSVB5
         6pUKdSw49kTudYBmVc5dtTqsgjAlAHKgBmR9rMuCDQbGaFGUMnRlSArMawoWjZnKTfxC
         ZN2VeZ9vGNWSr/ZRnv2CRcGqAhT2XIZOCjkbclAwp1ZCfArTMlCXTrUCB3lgpUYB3y1m
         UV+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/wbTjaKiglzP+xht4heAZHf7ZHmT9OQrcE9C/rQuJ8Ugsbhq3386MSOo1w0OYF2q9XVi0vxEwMVdJAFBx4+NRh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz49IhgoUDyc3TWmwKY+z1XmocJs9p4aKgwvScdeCxWh2NEv8P+
	cvEaRraRDAXi3QKigdxVrj6q2hDR0fVHyZCwNOtIOq6KXE1G2WJV6Soo
X-Gm-Gg: Acq92OH4GRTfB7uZZqvjpep6bF2VWq7NYAXlanLEBhav7ijJPGrH3cFEM80U0e/z4hc
	RoxnJp/gKIhYkNjKvEc4HeFKH+A9JQAvvo7bA3SB9Nlhscnfh9MUXAjiNP+zSEwI4Fb0TBUB1N5
	obr4xSbkgxJaCguvaxsIC2TU+8dwKrBx49Osyk59dIBfglARoq6h4rx4YfbHcQtlwQBlbCbI2uq
	IKDgTGP3IN10cEPPp6s2/7YC3bcOXcXY0HH2GC2L9UAWnBRRCTuZDKBAkIAlCM3sYjF9H8kMdH2
	xjjK2qLFAyGPcwmzx7CUgCsO3I+EeDgyNkVLslKpZuzCu9oTAZC7hMGpPoI1EcZZsX4vy+9xzNx
	5DtXyN00L7PS/TqsH3qpB/RT+HRBWglFLCNUgKOx8zwydIXkJC73OzuaIhTrrnJ7zDr27eH6KIN
	IxFS0xocRZPp621tZ178WjLhMeijiqjrfoNxOlJwduZw==
X-Received: by 2002:a05:6a00:1d15:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-8422579f2c6mr6160781b3a.42.1780212982185;
        Sun, 31 May 2026 00:36:22 -0700 (PDT)
Received: from Naman.Naman ([2401:4900:1f39:4c4a:1e56:d301:ce43:ac25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm3760709b3a.59.2026.05.31.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 00:36:21 -0700 (PDT)
From: Naman Arora <namanarora029@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	stefan@agner.ch,
	alison.wang@nxp.com,
	jyri.sarha@iki.fi,
	tomi.valkeinen@ideasonboard.com,
	kraxel@redhat.com,
	dmitry.osipenko@collabora.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	linux-kernel@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Naman Arora <namanarora029@gmail.com>
Subject: [PATCH 0/6] drm: Open-code drm_simple_encoder_init() in several drivers
Date: Sun, 31 May 2026 13:05:26 +0530
Message-Id: <20260531073532.8609-1-namanarora029@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_003623_865558_418E2F2E 
X-CRM114-Status: UNSURE (   7.69  )
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

drm_simple_encoder_init() is a thin wrapper around drm_encoder_init()
that provides a simple destroy-only encoder funcs struct. This series
removes the dependency on drm_simple_kms_helper in six drivers by
open-coding the encoder initialization directly.

Each patch adds a static drm_encoder_funcs struct with a destroy
callback and replaces drm_simple_encoder_init() with drm_encoder_init().
The drm_simple_kms_helper.h include is removed where it is no longer
needed.

Drivers converted in this series:
- fsl-dcu
- tidss
- virtio
- meson (encoder_cvbs, encoder_hdmi, encoder_dsi)

Naman Arora (6):
  drm/fsl-dcu: Open-code drm_simple_encoder_init()
  drm/tidss: Open-code drm_simple_encoder_init()
  drm/virtio: Open-code drm_simple_encoder_init()
  drm/meson: Open-code drm_simple_encoder_init() in encoder_cvbs
  drm/meson: Open-code drm_simple_encoder_init() in encoder_hdmi
  drm/meson: Open-code drm_simple_encoder_init() in encoder_dsi

 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c  | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_cvbs.c | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_dsi.c  | 10 +++++++---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 10 +++++++---
 drivers/gpu/drm/tidss/tidss_encoder.c      | 10 +++++++---
 drivers/gpu/drm/virtio/virtgpu_display.c   |  8 ++++++--
 6 files changed, 41 insertions(+), 17 deletions(-)

-- 
2.20.1


