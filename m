Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C1B106F311
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5/bl8GTjOouTlTXh8s/BuHH3L5XK1eHHd49OQHimj5A=; b=E3KdghXA1FjeYhoRhCpf5qeWew
	WxfIId5kG58ytThOjsfkCxypLJTxEwCWqFMptHlqSdMJpoVOYyDB3cKI6++to5ueFVymaQsGpQzEy
	8qx4rw5QzYUV73BFZ6LkdeRUgoiOJKEctCq34RYKwBDxVtQK9KdJ7KSpzuCu0PcZJrLRnuK/HPCka
	WpaGRn0tbWBS4vfPQWp4oOj0cEFfdsOyAoxQZtRJsoQVfKS8NFPsphdoEFBKU1a0cS5u6dUwz14ar
	zLNUYpRczor74jPqAUKCwieGz9rivGRuKzbaCzx/oCGujI5t8ou7oU2fs57Aga/pHdabQ0rcF22nX
	WYjvZ95A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYe-00000005DoS-1832;
	Thu, 26 Mar 2026 10:03:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYQ-00000005Dif-0GLU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:03:18 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b056b7f783so3232765ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774519385; x=1775124185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/bl8GTjOouTlTXh8s/BuHH3L5XK1eHHd49OQHimj5A=;
        b=QCmSh2Tv4Ay2m/WCKc0QmsCdvMT9+0Jf/dB2cy01HpZhoVnDX2wWav2t36V4WlHGJp
         gB7N9q4LfhaNSaUmXVx4c8IuwEutmMRYQEhgobDmPEwWrOlgbXVopLp5Iwo3Lr60n+8y
         ma85fzQovCr7NzrSjgsPiOVwG0QhLVpJOQ9yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519385; x=1775124185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/bl8GTjOouTlTXh8s/BuHH3L5XK1eHHd49OQHimj5A=;
        b=sHtuY6QXzGV5ABhq2etTKLruOBjC60ZqQNfXoFFV+uwX2viY8wFmtNfVq1qffNIoxB
         Y0C52g5pNbAtYgsFtvumiLGnnogzNuql2d/sFXpnPDy9Sct5aXLu2vRTlTTGF22r53e6
         ieNJm8lAotV5FKGpEyyB6z9ssXrRTG4Jqs5HnSLS95wr3JPKTZFAhxqqEjXk8vv9/Pzw
         jNjgTcu3KFpuC9CnLeCpLdNzBDJ+ZJnkd47a7OjeDfBJ7XmlF5E4VnPKggRGl7jPM9t9
         PSeS9jmY7uxlj2nbBoi6uswYHifpTbKvIFvc03IqHG7R9/X/7BfP48tp/nPUoAl7rSkA
         NrAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXrY6jNIdNUR90hworEX4n2IyKlUyQONL+jwdtE8QqZGpUdCdigIxMS4MkTG3+/LviqzW8kfSaLPAWbGYqMIk+@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQe2skfPki6dT8z2KnJiJWrcGB7llhJ+aClLtM6KiMRvVJRGE
	j2aGuMVuItiFi5M8sgY1Kcnei/9QG3iTaqUjJE1UD2pTLXrgAzFFuiKuJ/gq8FNXkA==
X-Gm-Gg: ATEYQzzbcL+kp8OxQmAlzDQV8Mvs1MY5Hq1J2/OQmOC3FwNK1LADdPECl8g0dhHJFcl
	ZCDbTW4U2WBcRYnu6sCub5sA8sJl1hdslMA+dQ4MBTBR5+M3KKFBZrxr57L+bOUn+6nVEOA3fKB
	D43fkZBLfuGqCyvo/KdqdPc2Vqw3h3qpSSHg06K49FNjDTEND64rmuM4sz6brETO7pT6D9vPk7X
	Z8iLPo4upgdtT5s7lSLvE6xd0W640fO6gq3Hq21J+cwC0WVhIRPsEyUY7L3CJNPIQkjt3hXdcT2
	vd50i5ES5TvfXQPZpVPvcy7iupjptErun0uwj5vkEGdSckRuHgAt0JSzYlwBr0P5PZFbbR7qllc
	e3qn77Jcyt8XvJtbnCDssZHZ9etIN5ZYayYx4CLbctvNM2DcIJV/RH3p6qfGRDaJR2PXys5xubC
	KlrXcQy8+aG7r9/Eu1o+rMAOHL+Obg3e1Q3/LWLlY+UT0wssZ+PgqNQh3cQi02ykgo6fLdSP381
	JnvUvR2
X-Received: by 2002:a17:903:28e:b0:2b0:b3bd:1de3 with SMTP id d9443c01a7336-2b0c483ad89mr10070645ad.7.1774519385036;
        Thu, 26 Mar 2026 03:03:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7c2942sm23339435ad.36.2026.03.26.03.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:03:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v3 1/3] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Date: Thu, 26 Mar 2026 18:01:43 +0800
Message-ID: <20260326100248.1171828-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326100248.1171828-1-wenst@chromium.org>
References: <20260326100248.1171828-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030312_690994_DDAAA310 
X-CRM114-Status: GOOD (  17.18  )
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

From: Rob Herring <robh@kernel.org>

Introduce a new flag, DRM_MODE_DUMB_KERNEL_MAP, for struct
drm_mode_create_dumb. This flag is for internal kernel use to indicate
if dumb buffer allocation needs a kernel mapping. This is needed only for
GEM DMA where creating a kernel mapping or not has to be decided at
allocation time because creating a mapping on demand (with vmap()) is not
guaranteed to work.

Several drivers are using reimplementing the GEM DMA helpers because
they distinguish between kernel and userspace allocations to create a
kernel mapping or not. Adding a flag allows migrating these drivers
to the helpers while preserving their existing behavior. These include
exynos, rockchip, and previously mediatek.

Update the callers of drm_mode_dumb_create() to set
drm_mode_dumb_create.flags to appropriate defaults. Currently, flags can
be set to anything by userspace, but is unused within the kernel. Let's
force flags to zero (no kernel mapping) for userspace callers by default.
For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
can override this as needed.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Emit warning (once) if args->flags is not zero]
[wenst@chromium.org: Moved flag def. to include/drm/drm_dumb_buffers.h]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to drm_warn_once()
- Moved flag definition from include/uapi/ to include/drm/drm_dumb_buffers.h
- Reworded commit message

Changes since v1:
- Emit warning if args->flags is not zero
---
 drivers/gpu/drm/drm_client.c       | 2 ++
 drivers/gpu/drm/drm_dumb_buffers.c | 4 ++++
 include/drm/drm_dumb_buffers.h     | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 46c465bce98c..3d3e61823cc1 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -14,6 +14,7 @@
 #include <drm/drm_client_event.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_file.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -404,6 +405,7 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
 	dumb_args.width = width;
 	dumb_args.height = height;
 	dumb_args.bpp = drm_format_info_bpp(info, 0);
+	dumb_args.flags = DRM_MODE_DUMB_KERNEL_MAP;
 	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e2b62e5fb891..60f4c2d08641 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -233,6 +233,10 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 	struct drm_mode_create_dumb *args = data;
 	int err;
 
+	if (args->flags)
+		drm_warn_once(dev, "drm_mode_create_dumb.flags is not zero.\n");
+	args->flags = 0;
+
 	err = drm_mode_create_dumb(dev, args, file_priv);
 	if (err) {
 		args->handle = 0;
diff --git a/include/drm/drm_dumb_buffers.h b/include/drm/drm_dumb_buffers.h
index 1f3a8236fb3d..4657e44533f4 100644
--- a/include/drm/drm_dumb_buffers.h
+++ b/include/drm/drm_dumb_buffers.h
@@ -6,6 +6,9 @@
 struct drm_device;
 struct drm_mode_create_dumb;
 
+/* drm_mode_create_dumb flags for internal use */
+#define DRM_MODE_DUMB_KERNEL_MAP	(1<<0)
+
 int drm_mode_size_dumb(struct drm_device *dev,
 		       struct drm_mode_create_dumb *args,
 		       unsigned long hw_pitch_align,
-- 
2.53.0.1018.g2bb0e51243-goog


