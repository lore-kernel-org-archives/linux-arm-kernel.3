Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B713D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ucVW7j3VRo2xghhoJqgDsgYFtjK370Q9Kpp51qjXUY=; b=yeyqYnnrN8QPi02PeKDtigiviD
	7LVXKw1cY36MGxeINIUdAnFDZWqQtsTLEYGyJe4zO51E89OV4dRlMKgDQfsB85zvXukl6Kwr5w/TF
	WQhcBci75THB2CeltO1OG00gm3cY1+2QPe2XJE2xEUwJ7J8FxuvbyVIPIl84DU/yXDpGqdWvCHNI3
	O7GI8j9e7Jrj9cUMj+cQ8rNrEp4qIyL6Ag81C3KWOmJyjTtX7upphNjHjPbGuk2NFO+T4BX5jYWJr
	J80wcdknc6HsUXDsuXrzqQBJOxrb7F2oypywmps/orCyCJWjVZbv0QiHrqz0MmTu25NiPrdAAq6SS
	usNeUTGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OeN-00000004iiB-3CKv;
	Fri, 25 Oct 2024 18:03:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvR-00000004Y7j-24Kc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=/ucVW7j3VRo2xghhoJqgDsgYFtjK370Q9Kpp51qjXUY=; b=QI1WN4GLKib3apZK4DB/0Ty4Be
	gn7BezAvZr5ciFZQFmcKRTXtqvnPsT+qSZcFXOsHKZmE6G0FOHpt193ulALkLPu3Sn2tLYdRDxZtk
	rS8ZYdksRZktwYuhktlybOM/3lYo2Jz6Mj+nlKq6jLK8eQ8s5no+wdUozaFJLDc0FMxgyrG7Pm/4k
	ovgQcDIB38FNVRLgIV/HTsAAgVN5PgXi/FI5NVimw4sHSAElkxZHSNtDhneLIg1qh85SO0TSYh2Vu
	fWZqtKG+iC5Lo99CV1mEZzLVkADd9MxLFkp3LNPFRLfVeUb4EXVN1W/z+AGU9FhjRSjjlaf3nMwqR
	xI60ZVtg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvM-00000008zrd-0CnJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:36 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so1498891f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876588; x=1730481388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ucVW7j3VRo2xghhoJqgDsgYFtjK370Q9Kpp51qjXUY=;
        b=CxeYrde4mJU0NYcDDlGp/zXdJbR7/+wWHPrEy0CwU/dbf3SUQG0XI5wr6mJBCAatgs
         CuJtZgOKjDaBvzuM9WHq7yUZV0xHJa+QZryNW1FQ/HUDTO6hh48v/+F12gCHJ45ElJmu
         1VxpzXN33cCxT0VDE6kUIUNaWazhvGZyO9mYcM5QPnt+1N07L7qPG3qDmII33FaPFiv+
         ret4nK2FHePMOT/qfXsMBq8fGH1WaK6/EIyXWIj9gQS46B3+PW6jg++x9yWEU4+Eh0it
         0ThYKAjvoWL0rWRrdQBmwbFgWA4zbqEPIrB1/fl/l9/8LRlTzb+C/86VMLfSSN3GM76w
         TdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876588; x=1730481388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ucVW7j3VRo2xghhoJqgDsgYFtjK370Q9Kpp51qjXUY=;
        b=OMT1ns9+0bKDgcaye0ocFV8ylHFXgs1wBZW6vWuDmfphd7BTQjysgSN3NkfbN1HS/d
         Upto4tRFSwk+g7pMNcg+GiD2nJ1rydyfsjUm/R2LvU/5/0JbV8Pw7IBntO9wVs46gYth
         jir+9/PK+13KEiEkjjPdZWscTfQJ0eQ+HFEXXOj16lYqHVuLKMWbVwecC3L22j4ISpor
         L6Gozb2PnE0KqmtUVevmJThqpjAQHfh94AquzfmdIQNxHCf/82IryxIVwdbxKqyFr3Vj
         PoL2HlDYqrlH8gKkkX8rf68hw9ySbULX/IZrRiTPR6mVhVbFRLXBug0adRMCv4ug0o0V
         WDPw==
X-Forwarded-Encrypted: i=1; AJvYcCU99ylv5T5f1fYv86K1aDEVwHKwye1gKLE0/DORAY7HjuC2VaRuP4O1/elQ00/rV53PUMg9Xr7+ad3zwhhOe868@lists.infradead.org
X-Gm-Message-State: AOJu0YxcObpWBoifgpxhxhZwlEtLwaZu6zvt8jCX6H0bxcax2bp2QsMf
	G08qkBlZDV9tnhuD8oO5u84ayThoT9nCU3KkOJH3RwrEsvz5wPOONDNFZ9znmfU=
X-Google-Smtp-Source: AGHT+IHith+nby6S+6PBCDtMGCYXz8WWaZpZndzlrwLswYlE/kRFwhddJaPxJNnioSkaK9oic7PjTw==
X-Received: by 2002:adf:9bd4:0:b0:37d:4e74:687 with SMTP id ffacd0b85a97d-380611e1392mr111135f8f.41.1729876588429;
        Fri, 25 Oct 2024 10:16:28 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:28 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:59 +0100
Subject: [PATCH v2 28/36] drm/vc4: Drop planes that are completely
 off-screen or 0 crtc size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-28-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_181633_353634_D058F015 
X-CRM114-Status: GOOD (  16.13  )
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

It is permitted for a plane to be configured such that none
of it is on-screen via either negative dest rectangle X,Y
offset, or an offset that is greater than the crtc dimensions.

These planes were resized via drm_atomic_helper_check_plane_state
such that the source rectangle had a zero width or height, but
they still created a dlist entry even though they contributed
no pixels. In the case of vc6_plane_mode_set, that it could result
in negative values being written into registers, which caused
incorrect behaviour.

Drop planes that result in a source width or height of 0 pixels
or an on-screen size of 0 pixels to avoid the incorrect rendering.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index c084967d3527..94737c587f20 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1230,6 +1230,13 @@ static int vc4_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -1753,6 +1760,15 @@ static int vc6_plane_mode_set(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h) {
+		/* 0 source size probably means the plane is offscreen.
+		 * 0 destination size is a redundant plane.
+		 */
+		vc4_state->dlist_initialized = 1;
+		return 0;
+	}
+
 	width = vc4_state->src_w[0] >> 16;
 	height = vc4_state->src_h[0] >> 16;
 
@@ -2135,6 +2151,10 @@ static int vc4_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	if (!vc4_state->src_w[0] || !vc4_state->src_h[0] ||
+	    !vc4_state->crtc_w || !vc4_state->crtc_h)
+		return 0;
+
 	ret = vc4_plane_allocate_lbm(new_plane_state);
 	if (ret)
 		return ret;

-- 
2.34.1


