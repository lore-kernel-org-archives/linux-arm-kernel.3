Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D356EF33805
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvknyLemjW45Ap19tt73jCMr/JsVlCyt3yofdVpnnZw=; b=v3z0dDJ/tuv9b2lqGXtY4iim7g
	317CFFgvTG4GHfhFDppiCSAwz2ttWKlc4ypssCpmcHjG2mxI7weZs7MsQqmvbK7EEBoJYc3Z7uFOn
	7bEmrHMer5RmxTEOXFrRSzTU3TrLf0lcJTEqaCvgJqtmxvb0xyRA2HxZ07PFHQUYXcvt5+h155ZUu
	TDIiIlVuSOX9ivVuRSh0RQ9iErEDmssl5GTjtgvxnN2//oKxf11jjNgzxLPOF/PZoeZsY5pvwLA+e
	NlAJWU+gXxJ0foaebiDcYr8nZpSyUUf5lSL7nnGHrhJqAAMYGDbYAdVXjw8SxdvOrNEJ96X2CNAnm
	jYTqn1kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7O-00000005VrM-05CR;
	Tue, 17 Mar 2026 06:41:30 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7J-00000005VpR-3O2m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:41:26 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c739d32b72cso3772337a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729685; x=1774334485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvknyLemjW45Ap19tt73jCMr/JsVlCyt3yofdVpnnZw=;
        b=NUDL4R5uhOridcc5doCVUBXuY/gXReh4IJYMK5fMFY7lrBxreWQK9kEQci7edGsVsm
         a65vqjYGtV0ohubzCYD974UVZogsT/6WJLXz6GQ8QbUUvb0+XXqPgFJdCGOCcqr2Udtq
         nex5IgciZ85NBFi6rkTPl4kgeYcThVNJG8y1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729685; x=1774334485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nvknyLemjW45Ap19tt73jCMr/JsVlCyt3yofdVpnnZw=;
        b=J+Xhha4P6145N3R0exS6gdM/plzJAnjM15IvmOqvOs5x5Q9oS0o0l/XqHQLeFxGDRX
         82tm8Y4Sn/ib3A60HJZ8skeNvAssjpsOEBIAodkv89SQhwHaF8h7tRUkawAURDf1gIiz
         hQ2NhaiJMIU1Ul/jzYWynTs1Lsp0DHgHcyzXn6CSx4/0Yy1Xt9vr32AGBoZZKqPNKvS+
         gF2q7QEhHZYBtfb8pbbdhqkB9spXigP9gjM4vkp5+7JwANjFMMdW78VBhmCJgzitCfnq
         7d8u9AFjW8EIhgRFL9OqbQ++VGhE0orjHWZ2allsPmEfZfU5J8U7yiqkGYAMQZKf+GPM
         x5qg==
X-Forwarded-Encrypted: i=1; AJvYcCUORMfVfyf2bx/ukHC3mscn+4S3ghzat3tyhUzuKdExF4uRdtNgld1MFhyTsrpN5DZYNMtCUVoH1oiJF9ivenOT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7zi1jp+45qs4vEz4mmfNy8iITA0Lp7/iRdqAkaPzjqYqwlS1e
	OwVDTqfQYW2jsfGT6IADFv0g1RyrPi5V+ydHZCMLaftmqGLUiGpRKgXcX1TsSpZVzw==
X-Gm-Gg: ATEYQzyQM5RvoFwTwETUzNcOfkEWpiMKlEsAHrvwudqQLn7cq/VnAq6vGa3aiodwnKz
	T0a1YmLJEiQ9UTUdUNGeog90bO3HTMwCSZMBmXzqk9rX9Iz35jrUJKboXaiX9RVVIzxOIrCUbYO
	P9fk6RmRJD3MEwqwBVq5tmc2CVRSNtPWlEHzocBm/YgOdARIHl4PzaUJCk6MLSm+nze4Bce60dl
	9xpgpRUpu3gsOVgKDxcLyyelqOhwLOib1VE7/WGYoHFKirzXhdY3Yhg26QrWrg/+i8M9qg4VNC0
	NYnhDz/Ff7/lM82slKkubtIpyF0bXW6BQwZO024Z8shVlFBIJC7fyHiFl32ZJTxsnw/HKgIk09H
	ZBFrwltR6LnQ+iJ3b5ohDn8j+LFFyfbtSdpuu0XguWOyfvVvCRJWcTMdD9dRfQII8qkEFaO/Fla
	RSMt2DYjiU6Jl5lHCDvovj1WsQ5bd/FFJyFOuJ7g0XAl7jFjyTfG03nX/3eQ++H8L3oqBMD6mHH
	X5FzfK3
X-Received: by 2002:a17:903:2a90:b0:2ae:5628:a18a with SMTP id d9443c01a7336-2aeca940e72mr180774555ad.2.1773729684962;
        Mon, 16 Mar 2026 23:41:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 2/4] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Date: Tue, 17 Mar 2026 14:40:44 +0800
Message-ID: <20260317064049.696795-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260317064049.696795-1-wenst@chromium.org>
References: <20260317064049.696795-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_234125_850345_EDDF0D02 
X-CRM114-Status: GOOD (  16.42  )
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
CMA where creating a kernel mapping or not has to be decided at allocation
time because creating a mapping on demand (with vmap()) is not guaranteed
to work. Several drivers are using CMA, but not the CMA helpers because
they distinguish between kernel and userspace allocations to create a
kernel mapping or not.

Update the callers of drm_mode_dumb_create() to set
drm_mode_dumb_create.flags to appropriate defaults. Currently, flags can
be set to anything by userspace, but is unused within the kernel. Let's
force flags to zero (no kernel mapping) for userspace callers by default.
For in kernel clients, set DRM_MODE_DUMB_KERNEL_MAP by default. Drivers
can override this as needed.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Emit warning if args->flags is not zero]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Emit warning if args->flags is not zero
---
 drivers/gpu/drm/drm_client.c       | 1 +
 drivers/gpu/drm/drm_dumb_buffers.c | 4 ++++
 include/uapi/drm/drm_mode.h        | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
index 46c465bce98c..1a57e7eadc0f 100644
--- a/drivers/gpu/drm/drm_client.c
+++ b/drivers/gpu/drm/drm_client.c
@@ -404,6 +404,7 @@ drm_client_buffer_create_dumb(struct drm_client_dev *client, u32 width, u32 heig
 	dumb_args.width = width;
 	dumb_args.height = height;
 	dumb_args.bpp = drm_format_info_bpp(info, 0);
+	dumb_args.flags = DRM_MODE_DUMB_KERNEL_MAP;
 	ret = drm_mode_create_dumb(dev, &dumb_args, client->file);
 	if (ret)
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/drm_dumb_buffers.c
index e2b62e5fb891..ccdcc401d4dc 100644
--- a/drivers/gpu/drm/drm_dumb_buffers.c
+++ b/drivers/gpu/drm/drm_dumb_buffers.c
@@ -233,6 +233,10 @@ int drm_mode_create_dumb_ioctl(struct drm_device *dev,
 	struct drm_mode_create_dumb *args = data;
 	int err;
 
+	if (args->flags)
+		drm_warn(dev, "drm_mode_create_dumb.flags is not zero.\n");
+	args->flags = 0;
+
 	err = drm_mode_create_dumb(dev, args, file_priv);
 	if (err) {
 		args->handle = 0;
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3693d82b5279..7d5f50e4af70 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1272,6 +1272,8 @@ struct drm_mode_create_dumb {
 	__u64 size;
 };
 
+#define DRM_MODE_DUMB_KERNEL_MAP	(1<<0)	/* For internal kernel use */
+
 /* set up for mmap of a dumb scanout buffer */
 struct drm_mode_map_dumb {
 	/** Handle for the object being mapped. */
-- 
2.53.0.851.ga537e3e6e9-goog


