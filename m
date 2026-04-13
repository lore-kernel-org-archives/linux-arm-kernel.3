Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178F3F34C43
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b/LOXITNDN/uMhBAVQruWsPEexWMWJ2BqlDUKp8QBqI=; b=XaP3fepbQfqN9gbcWCx3oC4heQ
	QCwUsb7p3iH4rmaBaElPkxwBFW8WqLraHQNHXK7t9wrbil6namk3OKaPk5ZRJiE1oAoG4sG7EGCyq
	W1tPswxjggsgAPC4Qd4UhdsAELKtMJwnomzf3Vi8akEgHbuSuLl4WAsKg421k1iEP8NOmH9XcWpu3
	i4hfo1yzyWc/gQYhSaLL4s+TklzE9zILDNK765Oj0ViKiFx0iHUTqeFIG2RWOZSOfTtyEihvSUA6i
	pDs/LVat7SZwXUDFlKLWeyXAjMWAM8h3H7yktB2buL3s7imtcqC8/wbfBl6M+RyxmRy/uyZNv3vm9
	HUFosHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlQ-0000000FbL3-2F12;
	Mon, 13 Apr 2026 11:47:36 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCFlN-0000000FbKL-3dit
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:47:35 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82a655cfab5so3659706b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Apr 2026 04:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems-com.20251104.gappssmtp.com; s=20251104; t=1776080852; x=1776685652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b/LOXITNDN/uMhBAVQruWsPEexWMWJ2BqlDUKp8QBqI=;
        b=MpI73SGTLaU+Z2TgbVCDpBWCH8oi/JEPs2MiYoxH+qZvOx1PgaB4fXrZxvU7XN1A7M
         4pkSqZmjNUwckaailgNNpa6pwBTYKFP/fpvq/C+/GFIv+bdJOnY3eRXY72bzIDewoQOW
         WJ1PV215ThEoz2/yp8YK9zIerpSH9uWlKVMOpT8RJ3wnL/4+i2YKDEQYjlL+gbaB46Gl
         dZrsHw0cNm53ZEQJAh/NjI25EehDV1aB876FT7vk/Mx4a4bgJENyzUHqo+u8AVAT+dhM
         F3QSSpu2gJDSq+2MhHKYFP0DWeuXEUTVBFSfcsR+broybH1EYmSdoT/kXuZ4s61dVqAR
         1ysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776080852; x=1776685652;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/LOXITNDN/uMhBAVQruWsPEexWMWJ2BqlDUKp8QBqI=;
        b=Bt1Z4d+ZW3sV8uTUJudJQ1X1mzG7yq2zOgnn4AC9OCLqmzZgtWvPSgI6dhoH2C6zSS
         ZQM6hpoKX+Kgn/lPlmCGfXlTcNV9box8Azzi/KkrT9hRG9SGXB9fQKv7XF/UfyVvR6YE
         gXZFbwZh0QP9N/QJK+0zh7RYK2FI3rchZZNW23Rb5SQ1aNYhlrzigaQofeq+h809qM+d
         LUPKK4bzdMQbn2Nh9e3R3Y7tA1fEbqoqS2qQ995sO7lT4qIJVHOv5TnxO1SMWZhoYfeW
         A/GWXVYVHYkhzVg1rJXG8JjeKWX0WfHBZwkozqATW8gmVNSA897hM2BJ52kLtkUXY/lb
         Z7hg==
X-Forwarded-Encrypted: i=1; AFNElJ+JoEGLWiqEWt1eJVFbj9JdT5lMLgNe6vx9LKLwIJ+2FDqFhwgtzpUVEN+4aWyyOwOVsBUHhUooY9Rpz9474dzI@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu9ARC7+7fpN5eaVxYzGTc43XuAs7C7uj4e1Iu8I0tSvk52i2c
	CRBsH0Y0EtRl/rB3xbcWACcHbtdNYqjG2xN1DgchekDurzZWTQ7haB+8g0N5zytvtPQ=
X-Gm-Gg: AeBDiev9i65c78jhXkSSowYg8IpAlkRzTynOTAKM5f+mhGNXeP8eYGJzo8pOpM8/mYA
	b7xhHgTku1ZTyi1zSHVLy8uuDcdrrEf1iU1c99kLWj2rNY2HgMw/6GAfSqlB+l5jsw3Bpg0NhTN
	fzhNg4uYDcOxRRoRWjwcMGlhQpzHadZIPh6UhH4Jfb91gqpU6GURv6MS09wEELn+xEHy5wHZUwO
	3BM2bqnII5VbHhI1r55BpErgRxExJsHm9VpuQ+prpxPn10azX9Z1VaRAR5R0AOY/ebPqeEaLmpn
	6fyd1eC5ejAaCoWLl0kCdexGgvXY2gryhEqXtR7NKTOXuwV76FrSZ6CyA40xDS4nQtOqgdlLfIA
	eec+n9GlV85kuU2WIYNsdLzlZb7pXv5sUthR8XonMiFr6y7F8aOEp7lpwh0I5QNUMzaYwa4nDzT
	HR8mtYr4tWQNxz1tUJk5yf4THoH1QLdEugR8JC
X-Received: by 2002:a05:6a00:39a9:b0:82c:e3f4:f5e9 with SMTP id d2e1a72fcca58-82f0c219ccfmr14135131b3a.18.1776080852304;
        Mon, 13 Apr 2026 04:47:32 -0700 (PDT)
Received: from advait-work.lan ([2001:df0:e1c0:3414:7eaf:93c5:46f:fbe4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c330925sm12822137b3a.15.2026.04.13.04.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 04:47:31 -0700 (PDT)
From: Advait Dhamorikar <advaitd@mechasystems.com>
To: marex@denx.de
Cc: stefan@agner.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Advait Dhamorikar <advaitd@mechasystems.com>
Subject: [PATCH] drm: mxsfb: lcdif: enforce 64-byte pitch alignment for scanout
Date: Mon, 13 Apr 2026 17:14:56 +0530
Message-ID: <20260413114456.173485-1-advaitd@mechasystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_044734_000406_D15EBE02 
X-CRM114-Status: UNSURE (   9.98  )
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

The LCDIF controller expects framebuffer pitch to be aligned to a
64 byte boundary for reliable scanout. While byte-granular pitches are
supported by the interface, the i.MX8MP reference manual
recommends 64-byte alignment for optimal operation.

Corrupted output was observed with XR24 framebuffers where a pitch of
4320 bytes caused visible corruption and choppy display, while an aligned
pitch of 4352 bytes worked correctly.

Ensure that only framebuffers with properly aligned pitch are accepted
by rejecting invalid configurations in lcdif_plane_atomic_check().
This allows userspace to fall back to a compatible allocation.

Signed-off-by: Advait Dhamorikar <advaitd@mechasystems.com>
---
 drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 72eb0de46b54..8e574e9a591a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -674,6 +674,18 @@ static int lcdif_plane_atomic_check(struct drm_plane *plane,
 	crtc_state = drm_atomic_get_new_crtc_state(state,
 						   &lcdif->crtc);
 
+	/*
+	 * While byte granularity is supported, LCDIF requires
+	 * that framebuffer pitch be aligned to 64 bytes.
+	 */
+	if (plane_state->fb &&
+	    !IS_ALIGNED(plane_state->fb->pitches[0], 64)) {
+		DRM_DEV_DEBUG_DRIVER(plane->dev->dev,
+							"Framebuffer pitch (%u bytes) must be aligned to 64 bytes\n",
+							plane_state->fb->pitches[0]);
+		return -EINVAL;
+	}
+
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						   DRM_PLANE_NO_SCALING,
 						   DRM_PLANE_NO_SCALING,
-- 
2.43.0


