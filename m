Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34CFACCFA07
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=; b=clHmcI7bhRAfvTLzx2JCrvYkC9
	4eNjdqb85BHg2Fxfu9I6zK+MjF1CCsUoEoV11iiD3thvAG0WQA+b/79bJE6K3ud3/Efu4afKdXpie
	C8/LNyfpuk3Opn4akP4u+tR2BHvsqVbBVCvj3mNtLFSLX/YZsxQg47rAEBcy3zwVT52ENIowLekhG
	v+0Jj7D9sF2rklaKDz/UG/AHGKmPiua5UBYi0aXst2MwQ1ei2jeVscZMZj+kK5foe/CkzOidCJGIH
	pcIFlLkwnZXj22dwazE4It+EHsfLKOFkAJ3SidmTt4qFIR3ia4IeibwtL5I9t6kMgO+dT0x/WZ195
	QBnYHYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUb-0000000CM9W-1mGq;
	Tue, 04 Nov 2025 18:10:53 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUG-0000000CLdU-2r1b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:35 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-47112a73785so38745755e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279831; x=1762884631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
        b=Oe9BGdpw+cTGyhNHFTczpiZDJMfvemD34ISqITPAQTrlug45CsvJWqCMyGctWu6mu9
         ZhONcg9GX8hi3BOO6i03PY3kdbp/ta7yF9lhb7P+vL3hwQzWBX9D4sBsLegUNB3cm+jz
         WGwPNHLsOW/h1oPGraqsmpT0vvW4IzM9Zz52QRDt5rX1tNCjiK359oKyAT2XZkZu1bd4
         lb7BGpFtzrbakjai2W+2rQmj/HFmxYRCt2RYyZ5cPDmaGEW3uJL7lEf/5jaqxkoOMoBk
         PT2GzTumpom6kzgKlKsNcU9VQiKmQY54mQXEeX5hkw6QYuJkp04071nRlpFsNdUAbfU4
         b6GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279831; x=1762884631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJ4iKgm80T4FXqrGlRaNuAcAySKRsjOyr7WXu8sKn/8=;
        b=SPIfPhr2ySzDYbsk04HrSxYW2tzsjG0rDc19GKjZk+FMh9vJGCXai5weaCTwf4yNCS
         YwP0EA3mOmMMsfuUGmOIf0dgagC3I7+47QiuQa0YgbygHh9q+1AhLXNKjtNErOODW4FQ
         P49SmU9hmJiYaSZvXQVD93gd616An/0Ha5Tjprbu2ulspA7FXCLZZHbhaYdNrqm4rW4k
         D6xMAWMzfvk0P6p/w1HG2ZaUVk1ZeD+Zs0T1/rwpRfFyl/ClquJwMS+xGayG1EY10POm
         hFToprXjCd5OCejvM03k0FbNIw2fULjN/45jzNS8rW2vkyMKx/tRcWT/GtL73EjxLJGb
         hz4w==
X-Forwarded-Encrypted: i=1; AJvYcCVdpi3RX96/jCDpUey6sn5GzelxLrpdPPxc4WyiaMCiEMdu0hwXlhHAcONcCwtU4YeefghkKGniZpw/UWm3UwwK@lists.infradead.org
X-Gm-Message-State: AOJu0YzA0ZoZPypjLb4g5i1Oa759XsVnsTZxpjsI3izGqKINz8tF3jfv
	2G/u01sJ7PDblASKOHhfsZqTuOFlbIJj8/4QuaWYFNmvxKgnGZ4MxL6S
X-Gm-Gg: ASbGnct9o8O2QmLPE7nDW+IEnueoTIqfpucA12+C2iRVYIBCw2YJTtT6+MDl57LzZTD
	Eh6idCnQIgZwxbKbJvETxHcJ6NB1pkJ2HLFtrVkIGH1pvKwGKSgEDQ+7YkaVhGZlfsg+MFUe1BC
	/g9fvggMh9ljCXEO19lBzG6NycRj6ib3iDMQ5QCPImTLFGZxx9MZywqToHqx2PrMbq6v/hZGD9i
	h6pWPpwM1JrDgxKeeMbGgzV93R7ZKMCU3sNrvvEG/bILhmEihGozjP2gwLNO7uvvkVkpHPrEsjz
	LA+qe0moMfTiHW4abkCFecugZ2PjTH1B0PwZ0jupbpMlUFak4FNiSh6gLsp1E3SXFTfj/Vprr1X
	S2QL4YhBVBSJFxOzNcT/+fXJ+GDDPoj+53TCS2TV8/0YWfbUCa5MNxSULwpSpKr/d/yBXbCcIXs
	LK6HMdmC74MCjaFChc33VJXrJCywzT
X-Google-Smtp-Source: AGHT+IHkpIC3aSMOHY0XvNH+UoXWk3HEri1Jf6ytHO5K5mDJ0+pJHIyqN7z61F+ww/rx9c/Kck19GA==
X-Received: by 2002:a05:600d:8381:b0:46e:376c:b1f0 with SMTP id 5b1f17b1804b1-4775ce9bc74mr1190495e9.7.1762279830853;
        Tue, 04 Nov 2025 10:10:30 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:30 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	samuel@sholland.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 23/30] drm/sun4i: vi_scaler: Update DE33 base calculation
Date: Tue,  4 Nov 2025 19:09:35 +0100
Message-ID: <20251104180942.61538-24-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101033_565319_B19CED16 
X-CRM114-Status: GOOD (  14.78  )
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

Now that channel base calculation is straightforward, let's update VI
scaler base calculation to be simpler. At the same time, also introduce
macro to avoid magic numbers.

Note, reason why current magic value and new macro value isn't the same
is because sun8i_channel_base() already introduces offset to channel
registers. Previous value is just the difference to VI scaler registers.
However, new code calculates scaler base from channel base. This is also
easier to understand when looking into BSP driver. Macro value can be
easily found whereas old diff value was not.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c | 3 ++-
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.h | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index 0e308feb492a..fe0bb1de6f08 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -836,7 +836,8 @@ static const u32 bicubic4coefftab32[480] = {
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return sun8i_channel_base(mixer, channel) + 0x3000;
+		return DE33_VI_SCALER_UNIT_BASE +
+		       DE33_CH_SIZE * channel;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
index 73eecc4d1b1d..245fe2f431c3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.h
@@ -18,6 +18,8 @@
 #define DE3_VI_SCALER_UNIT_BASE 0x20000
 #define DE3_VI_SCALER_UNIT_SIZE 0x08000
 
+#define DE33_VI_SCALER_UNIT_BASE 0x4000
+
 /* this two macros assumes 16 fractional bits which is standard in DRM */
 #define SUN8I_VI_SCALER_SCALE_MIN		1
 #define SUN8I_VI_SCALER_SCALE_MAX		((1UL << 20) - 1)
-- 
2.51.2


