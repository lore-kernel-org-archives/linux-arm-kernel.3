Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E41C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 15:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=; b=181jzU+XhRm7N+WlAUIrNgv2SU
	kqNal9eQRTrfYdkS6KTnT17GR2NpfrBHuWeIzpb5pxJHtzGjohZtb5ilnpWBvXBcWMIaI6WrnMtra
	NKn7aZIrC0Vk5prKaYKo31Eh1AzZEgvSatTElZySAeEroz++m7wPn4GzXgowYwHY8ZcuuW/TTI/Gk
	ZfdCxvCb4iQO/5TF3EbMxnkLP6Rgokw1yUrM5ct/MXCTvuBDp6VRzQtQW8g70f8p8WvLjD8QW+KvC
	RZ2+aAJJ8PoZZ/EGMxE82pjTQeJg9Rqe4dbbWmNnaXhdDgwdr5jJfbdd3PemNsntjYaUgjw2/m/wZ
	iUhAFdSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGkf-00000002AXN-21Ie;
	Tue, 04 Aug 2026 15:08:21 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrGkc-00000002AWB-2NqZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 15:08:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5654654b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Aug 2026 08:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785856097; x=1786460897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=ZU1BPmr2Us2514IYnDBJ4K+dfYj3vXFa/5GF3xfsext7xLeHMIWKkL4/2WwKZqgJM5
         47dmW4MgAO1spkfIRQHmTG5vQ2fA5mnzXfywKeHOlrhHb1fGYehuEidum6StN4bQBvHK
         t1Bisvuxjn1twxtSs65IpOvtj0AYKHmjWrsGZX/VMP/o5hJtx0EsH/Qj1EfcVhdJESp+
         sh3sL+NTDpdh23HdhuPN0M3wEA9NUD5FYYmG0XtTcKfxHVwfGOQSI3/+0e46dchaN6+x
         EzT6HKrfli0dRbD8xk4lYCIiFfs1EDcFmQreykA8uNuOS+Rzn+Tt7MlCXpVff5MPchpU
         b9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785856097; x=1786460897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4Qg2o+emc3m6rF47B2E/svsOXDIcQrkgOFSzKR4MaY=;
        b=YyB9Tz1BdTMIJf6KGXIdSyN0REsJUZDXSZygtIFBpN02SKHcSf6H4zJ2F+HJs1zkXE
         brjTTo91MRT928eg5Is8JB3zvAqjvFm9Cr+8NrqdRVkHnc751qni3dzruPIGBJ5er0jx
         tB+7uYdyJl1R+CmsRniupBrFfZoZUmaPI+QFkYzdxvkxAKLJfPX/Epv5sDHaGkAZFPss
         U+cOBSyGJvstcdPYsmeT/SQvcbPg0op2NXLYEbHmuGoayAgDbE+o/RlmL7xsTHEmbFMw
         5jxevq7Yw7vT5T1oW0ftHSJnMasFAEoyktARX9KqrG/It8GmgbdGI3UREhyDtV92mszC
         96sg==
X-Forwarded-Encrypted: i=1; AHgh+RopVoIa18xVxdh9fvCbW0uaCeYRNnyq9AYD7uIEhAnc6sbHaeNuDu9mVJ7hvyYqO/M2nHutvLUukcwBE3hdUR9+@lists.infradead.org
X-Gm-Message-State: AOJu0YwdpK2hROqaLP247aDKTivEfMCQvzQ7IdLGuB/W049XP15JCIRD
	gsdjKSU8P0VlSFr8kq2oUmliA4xauQTFzcynNJrRoYV+95lwo0DsBT0=
X-Gm-Gg: AR+sD12fim+onnPuKofA3xHkY4IIqw9osG6D8UpqTMBau9nx1nVGEJhY79tRg6Z6Uv7
	UOP6KNS4WBq1AbqgnF4YQaufftKxKLM+ndYCTRrfabJWEnPWd2lb2+peoFfPetb5/30GAB97IMX
	MsIDyLn3ab9vsx2reNLncw53F4GkZmy+XBui7uVDGCjFDYgtgeOlfdmHhGOy84ykcRczxmIi0uB
	gdfs6qSnKSMlPf/KR1IbQpIkcYvHw3G3nZ1kdRneEqCrEitHzdWGOBWexZ5fz0k0cjaLwLbcLGJ
	e1BvUTFa3yF0MnszP8aQ+uwd5RS+7vwM5+rlK0TQZDTKFKiXEIcXT4nXNELrQsoV2GZvlwqzdlL
	0sU38gExJpPsaUUuDJl8rJcitDNeCraFngWVwalYrsh+r6VCp8Nm/3/RbRkdUo5bOQzZUYvB2Cd
	IqX5zJ1sLSOtOBSg30Rz8XF5Wt5JqtiZ3Hxgp2z3vwLH/kBd1+vVmqUH+Cfd87Ania50KGjtkQA
	3HPpQyyIUyvBr0jrel/GY58vUnrk8nJSo2n+sGgRJInwLjaLmXXl5H/+aKq+B3inTuxCay5NxHX
	ExQnlRsltmKpd7PfXhWPqcU=
X-Received: by 2002:a05:6a00:ad1:b0:845:4126:222b with SMTP id d2e1a72fcca58-84ee47d8768mr14159742b3a.28.1785856096851;
        Tue, 04 Aug 2026 08:08:16 -0700 (PDT)
Received: from localhost.localdomain ([1.226.165.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc41ca4dsm5420587b3a.52.2026.08.04.08.08.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 04 Aug 2026 08:08:15 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	dri-devel@lists.freedesktop.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>,
	oe-kbuild-all@lists.linux.dev,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] drm/meson: clean up KMS polling on register failure
Date: Wed,  5 Aug 2026 00:08:02 +0900
Message-ID: <20260804150802.45262-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260524160657.17802-1-mhun512@gmail.com>
References: <20260524160657.17802-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_080818_630611_8CCC3152 
X-CRM114-Status: GOOD (  14.58  )
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

meson_drv_bind_master() starts the KMS polling helper before registering
the DRM device. If drm_dev_register() fails, probe unwinds the IRQ and
DRM device without stopping the polling helper.

Call drm_kms_helper_poll_fini() on that failure path before freeing the
IRQ.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: bbbe775ec5b5 ("drm: Add support for Amlogic Meson Graphic Controller")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Avoid the unused uninstall_irq label reported by the kernel test robot.
- Link to v1: https://lore.kernel.org/r/20260524160657.17802-1-mhun512@gmail.com

 drivers/gpu/drm/meson/meson_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 49ff9f1f16..bcc36f2cdc 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -351,8 +351,10 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	platform_set_drvdata(pdev, priv);
 
 	ret = drm_dev_register(drm, 0);
-	if (ret)
+	if (ret) {
+		drm_kms_helper_poll_fini(drm);
 		goto uninstall_irq;
+	}
 
 	drm_client_setup(drm, NULL);
 
-- 
2.47.1

