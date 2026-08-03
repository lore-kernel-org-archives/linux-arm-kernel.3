Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531CAC55838
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B5EYEilaxvTpzeLrRhoCx5eknHZ5V8aHsBlGVEU3TBs=; b=KSxQwB3iLCMGmx8ZX9QyZePsv7
	9oez7XgtiCGeye0kfl6QgDjVXwksjdn3lubR+lczgZsnRoEoptjgk3TUaPoL/jhnLDxbisWa0wPzk
	hrpso/uabH/9u+YJI9nF0fIxqhZRmViNh7/SL2gZqJkxFy2l4n43k15sMnKHCL5XY2gwoDpS8MsYe
	SajFpWPVi/jt0Y7L96OPpKBqlLB+AY3kV4sgI7d8KaqnjU0tcyDDXGfWrioARtUxLthsobT971wbY
	hCJrb2/rBLJmqX6YJJDE/R95FP1A5MhmrtzskDLvMSpt3IczlBafvCU5tSSdoWPwZJTo+9h7LrsWI
	ohSUfMtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGP-000000001y8-0PdI;
	Mon, 03 Aug 2026 16:11:41 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqvGL-000000001uH-4Awh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 16:11:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49802c418b5so18630355e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785773496; x=1786378296; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5EYEilaxvTpzeLrRhoCx5eknHZ5V8aHsBlGVEU3TBs=;
        b=E7wq1gJ3jrbicZr9F7n/BeacmRGbCJfIO1c0yboqEI84ZrSYEadzw1swU+xRa3bBUk
         HFVG9l6yXrboND8fQeupvWhGwp7bPX67zpdzjsVz1JoZjQVjLTPyPOdHa0gpdu1CvIkv
         Q52fyO7/P/EDWQsc59gIhBko7JnPl7ZpS4q+gblHPzv5CYCBrF6B08FOpzqls+ptukRD
         ui536brQhliK6a2YTZUuTeKoqjiN8UQb3W/UoDHGKG+D4bZ7TJBL0Ib8p5cqkKuN/nVc
         1r58mxrM03hwiXyg1cvshetb45xeFp7eNXyzd97QXe2k3YMFRIxVShGVbYL7j0to6Tsc
         xxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773496; x=1786378296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B5EYEilaxvTpzeLrRhoCx5eknHZ5V8aHsBlGVEU3TBs=;
        b=FL1jjst9eUs16ZSUIUgB9uXTatq3b6l3/PW8hqgKtTq50fbQ8u5b544KgMUWfYm7eJ
         0Dr7oTTrxdsalApYPNTk1/kv0nJxcIACF+6aVL++WhQ+u4zOaRZqTPjO4J4oHltlKku9
         R8JiuV1DjT9V2KgVQupbd7gxUG/5VLbUVodtqPzM8I5u4gCo1k8cJdmiTJMrRMZFQw+Q
         FxO+xtG1tWXQTuYVjmePw1SYOgg48OnD2uzGQWKDcWjb3dM4emY7/tigQT7pQUocKK5L
         LiONWPf0TY4KTBOX7lFmCwyg59o7qbp4/emzj+u34/qEfG6tnKMLJk407EmeA8emgiHe
         NySw==
X-Forwarded-Encrypted: i=1; AHgh+RqmlyM04gFdYp4RBXM5RJrkOgbLcwc5wrd2pxxYotm/2/9oZOGXTpbzf9NMJWdo75U1Kh2iWP3G/47yGOUj45A9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3wh5uEeWsB/VTzkjJQB7OdAfHc4nC2BE+zTWQ1+sp1HkE+Ig3
	f+5vUbRyZwsA6qoWoFI3QiiB6Ck93OXGDM4w/D/vOXlkklpBgr0Zs5JG
X-Gm-Gg: AR+sD11J3P3ql06LWEJ0SiYPc90Hxh6XGIuHi88BYHL9wJXR/lOxSMyxv4glSXgk3Zf
	blYa2zc6nXJT2vBM2WkSGjKCaF6z90p5KqakJ5xpcOyvgINd23X3P3YwltzN7qsAVsX4jhZNHvI
	BCjCyRg8Nw9gGHEWTaFdd4EUpPtxxGUt+g4BJTkgzc38xQGH8iYlorkLBjrGDkoFBKIFOcrzbHw
	KkB80M6/x6AlWAW+dMqqEO1qDmT+HkKxi79gttbj31sT9/CfiS4BAuyPHhwOeVcfCbdHWooT179
	hapscj8UTm9sUaZnSeNR4Y45f2oetUfVwXO0ITzU3RAIld/zOADTHRWLJo22uY8s5HwLkZMGzEt
	xSishlS1iRXoquTldpziCyc+ckxzOG+8FauVTch+jpyKcgD7ku13vivv35ZKgaSOoJ2Kpc4ciEW
	U2TSYEgLPGiWouHtB1btFYIp7N7NDRgO6rnuI0SrETb68Cl4cztob/jBuRWkSH/htPJObRHjG2w
	0DcF/kM4HRZGzVtDaDSwGOvPiG1RdawR87gWJuxradJynsHrVnMblPsVy+ADmhNZEp+5XjJMnkc
	lnT6motRVLp/WcSZyMRZQnHYrsPywWIKJEZWa86YtZ/hwhcWkby3EEJyvs7NJPsW4xGn3Ujx/P+
	S6LTn3f9mPdYCKuVdJyLfBRhLD9quoymPSmibuyzcvXNtfC2jw+clsbjclDoFx2W6wHjC6MiKLU
	G0kzWmVa49bM9T
X-Received: by 2002:a05:600c:470d:b0:498:490:3bbe with SMTP id 5b1f17b1804b1-4980c679d1fmr255703765e9.16.1785773496293;
        Mon, 03 Aug 2026 09:11:36 -0700 (PDT)
Received: from jernej-laptop (APN-122-100-117-gprs.simobil.net. [46.122.100.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm3363735e9.3.2026.08.03.09.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:11:35 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@kernel.org
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 10/13] drm/sun4i: dw-hdmi: Drop TCON TOP port reference
Date: Mon,  3 Aug 2026 18:10:48 +0200
Message-ID: <43ffcc17f7c3f94c1d7bd1ee89134c766e84df35.1785772659.git.jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1785772659.git.jernej.skrabec@gmail.com>
References: <cover.1785772659.git.jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_091138_048432_21BF034F 
X-CRM114-Status: GOOD (  10.72  )
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

When the HDMI controller is fed by TCON TOP, the port node used to
enumerate the possible CRTCs is never released.

Fixes: 57e23de02f48 ("drm/sun4i: DW HDMI: Expand algorithm for possible crtcs")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
index 96532709c2a7..51cdfa1ae3bf 100644
--- a/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
+++ b/drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
@@ -83,6 +83,8 @@ static u32 sun8i_dw_hdmi_find_possible_crtcs(struct drm_device *drm,
 				of_node_put(remote_port);
 			}
 		}
+
+		of_node_put(port);
 	} else {
 		crtcs = drm_of_find_possible_crtcs(drm, node);
 	}
-- 
2.43.0


