Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB99ECCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 13:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=; b=nvld7NW7tL8qlyWX7QCC7az1mK
	t+CX5MadqB2W9c2Qzu/dgFLdWp4WxS4nhskpFxvCXpk3mybPVC+CAElSSWXIfqhdo86DlZ6LyybDi
	0IZ6z3w/pc4ikDHYMlKVjXp8IiaCXDrzOKdAoiRfBL7Loyis5x5WJzXZkDMFIqM370PS1A/zLA0JQ
	8v711F6SBSezYxmkpn5GX9UwntfMaI+8B3kUbA0njSdlWxrfC3EGkaJJXLoa9zOp8TRWvdr1Weo1W
	we5uDzfBNmDVyo6WwZk4GWufWqzddvr3r2ejfB0iRvwPHy6X7WGzS2ueTJuK3r1trGQ2PWYP2thwZ
	dwqharzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjF8-000000039yp-0AqE;
	Sat, 08 Nov 2025 13:44:39 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHjF5-000000039y6-1AIO
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 13:44:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b3c2c748bc8so202837466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762609473; x=1763214273; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
        b=NAseqkcxXsEVCMYY11SKtq7FS5emHl7RqVpDfPcJGAiBCyCjuttU+qq3GGbouadUo0
         GghMSCSh+daRUOZgapVfhXyZ2tbYFpSZPPApe2qlKD6/WrrZ73Ho4ttFhHeSSmkCfBXW
         pNH1sxEgBcNwQjR7nMhwpICuWfQ9kEFCLH4r1dJAtkl8jMJ2NgE9cjCukyz55RcEQ8++
         ZhUOVkMWmmzXGSLyEwYsuLQkzg20FPGtkrdl0W1XwjStFjnOvPghbVcu1/wn9gtjFBHw
         yJmZch4Cf1Dxc6jZUmlda3gJq1P8wycIenpDYAdzloh4Iu6kSs0YipZ63dZfEEA2inLP
         jpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762609473; x=1763214273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ab0dNgePo+ve9gQ9R7d2FYgAaNZrPU8kUu+qmhjPbGo=;
        b=Kdj9Zqtj4sJy+fUJ5wUEukpiVV46O5j7eLaeUNuLJ3U0tp7xBzi4TdSNgIDXSHV3us
         MBwmJ/hnMRmSBLNX9ds1T9CVriyeh8u3zam9v/FXq5HT7uRxn3aLx3p2KM/pgt1bAV6O
         2I2VLM9hDS6LLhqNB7K7QEXYcL4mzz9Hz568d/zVGtoU+wZyEjfAzZ0cCVdXnOHvM0jw
         QtYMMCuJ2yFosD7PqF+emUOaFX5GnVACkX6JfWG3rcKfLity0M83VbYYfrcyqhyCM/LO
         IuvHQWS+ArpzRpCSBQ7lKm3wdwkb63UAU/6Z+90SvQlxynDeZrIeOVnPZ15TqdjxjeA2
         +pDg==
X-Gm-Message-State: AOJu0YxPTQklkUyPVjV03OMJ5nN7B/QWE6co+rMJ+br9eHXbgVMY6TIM
	gAE4FmHEwUxQhrtlioVp+HN8vRFZHR/5EPEicUqkF74S3/yQqdrgdVJl7I1LRQ==
X-Gm-Gg: ASbGncv2dx/B72gc+s2paTrFuGgn7ysqhrwvhLUEXGw4lwI6vYcmAzMcFwU1UTbXxfY
	pb6AUQfQ2RcT/FDUALN9txZmFQrBlDGQWWDlU6hFTcZ9d/+HUru/fWorZLncEug2YfbYaAHNbwx
	PYjXcgisDMtiaRLY7R1G3IVnspffBU71SU1CF/IWNbX7oiH4/lDLfhleWVW5NwHXfxejkJvOiAX
	+3mm8svNnfAoxUKGodbC6HruHMeroisivHEJ87R7MYpwI1HgZOKelVxBffhig327ArM5qbsQTkD
	q+UmPb6/3l4pjDRUX/sSKhI07o9Gkyxtps9jIqfCwEPqtL6bmSco6fLLbQkKY3QkZCinSU3eORh
	qqgM6gLYXgCnSizvBHmyExCWFVknjnn6v20oUXm48noTIzX9cKo4RAgolQ+kL2ePBrMj9Yuf9Py
	fBUv4RFrwo3uNgJeOcEIPUYMru0MoDeP1oGlQKLdnRtbaKSPykZqJQNevjAvbE69e4fWJBQxa0V
	Bns37P7WKP1xIav4LPUR13s1Dqci5igyZKfStXLkilLYXGL5Zbf
X-Google-Smtp-Source: AGHT+IE3t5XHoEClnas6c0fwEVjyNk2axByTaO1rMD+gsebxQxdsSRmYQhKPt6+QjmiTNvXr08iIdQ==
X-Received: by 2002:a17:907:6e8f:b0:b6f:9da9:4b46 with SMTP id a640c23a62f3a-b72e056cc6dmr230845266b.43.1762609472959;
        Sat, 08 Nov 2025 05:44:32 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-ae88-0800-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:ae88:800:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b72bf97e54asm531374566b.34.2025.11.08.05.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 05:44:31 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	neil.armstrong@linaro.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	tobetter@gmail.com,
	christianshewitt@gmail.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH RFC v1] drm/meson: venc: add support for HDMI DMT modes up to 3840x2160
Date: Sat,  8 Nov 2025 14:42:36 +0100
Message-ID: <20251108134236.1299630-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_054435_363411_CFFE4087 
X-CRM114-Status: GOOD (  16.63  )
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

Commit 5d0bfe448481 ("drm/meson: Add HDMI 1.4 4k modes") added support
for HDMI 1.4 4k modes, which is what TVs need. For computer monitors
the code is using the DMT code-path, which ends up in
meson_venc_hdmi_supported_mode(), which does not allow the 4k modes yet.

The datasheet for all supported SoCs mentions "4Kx2K@60". It's not
clear whether "4K" here means 3840 or 4096 pixels.

Allow resolutions up to 3840x2160 pixels (including middle steps, such
as WQHD at 2560x1440 pixels) so they can be used with computer monitors
(using the DMT code-path in the driver).

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
I'm sending this as RFC as I'm hoping to get some comments on the
"4Kx2K@60" note from the datasheets.

I have tested it myself on a GXL Le Potato board using a computer
monitor at 2560x1440 pixels.

This is the spiritual successor of a patch titled "drm/meson: add
support for 2560x1440 resolution output" from [0]

[0] https://lore.kernel.org/linux-amlogic/20250927130239.825060-1-christianshewitt@gmail.com/


 drivers/gpu/drm/meson/meson_venc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_venc.c b/drivers/gpu/drm/meson/meson_venc.c
index 3bf0d6e4fc30..4abd0c09b442 100644
--- a/drivers/gpu/drm/meson/meson_venc.c
+++ b/drivers/gpu/drm/meson/meson_venc.c
@@ -868,10 +868,10 @@ meson_venc_hdmi_supported_mode(const struct drm_display_mode *mode)
 			    DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NVSYNC))
 		return MODE_BAD;
 
-	if (mode->hdisplay < 400 || mode->hdisplay > 1920)
+	if (mode->hdisplay < 400 || mode->hdisplay > 3840)
 		return MODE_BAD_HVALUE;
 
-	if (mode->vdisplay < 480 || mode->vdisplay > 1920)
+	if (mode->vdisplay < 480 || mode->vdisplay > 2160)
 		return MODE_BAD_VVALUE;
 
 	return MODE_OK;
-- 
2.51.2


