Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8FDCCFA16
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=; b=VdYuvaeGLbCWfCzd53MYqNGNqA
	oWissrnEzoXfXur0BZHzRqHr7dyZ9F0ME3TpnBKwZHZCYCXJ6sgvw/Qusqhrgn0sawHWlHdjXdgOP
	83AlGWaMFVa7jC5l3jl0dZqeiJSptlXn8nHKkIZBI0A805jzGR3jhSoxr6QifFueSn4quD5EaQLat
	jWykXjmoROVl03UzwR9MZXg2geZDujtjce4yyQCXjljxQOuYr0Q5+3w0C/rwdHuVk9HT0CihIWPDk
	w5eAzXLYLs4Sq3sN4LNqvt8s2suo/IIzSB+Udf4kuaQDcY9QkFkPQiN5biUEHONC2x4ebVcm7pFMS
	zJc7Qmog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTt-0000000CLC0-16o6;
	Tue, 04 Nov 2025 18:10:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLTp-0000000CL9q-0F1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 18:10:06 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso48081915e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279803; x=1762884603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
        b=e54NpzKKCyUyQR+i7fngXumX/kkWCyNk5RdY0HC+XiykuZzNSMrfjiUZHsTcmMc+1P
         GTAjBThFI+CdNNb6zzYdMepjHGJSG4w5UhYbf2XCR6zDcy4NDov8vrpyrh24CffkkHlA
         fUqNn9tmY/b/TmzFFXiTKN62fDWute8oZewW1a7P8/R1JjbbT+RXa4h/mIV9i496afiS
         QucUgAwxmSnwYjJklaKTGZkP8mBNflXp0OS97njhJIhXw7hY56elPSwPadAbqbiSeEsK
         l8/d4QBar2aEl1b9nMLZlY5UB/SOb1aM9si9/K/uOdJ7cHOHL+7VVEBLgu3P295kLqNF
         74OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279803; x=1762884603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+/CRDV30StujBfkrHNR5F++4wuDv1TH5QOb5NIYpYA=;
        b=tDYO78p2b7gSm5aUY3qJDns4806un+n0mlvr7FWW7Dnf0Q3hCmrekUG29PHSwbn2mG
         T3/jgegGc0BOgIavHL/Whz1CEGhIfbCzU0KnlRu2qp3oWiZ40Vhs1Y6p+uUq6B3m3+3V
         vnySbLe+bTX1pLSFaRB7zVir4ABGCd2BkamllQrvsVOd8M4ZX8mHfJsFUclRo0XoHFCE
         Nv+yBkLLYUi6mWK5JkSUHK/GNdOkzadm6EGfvHGuIi4ikeR9EgWCPRTe35cZBtlF/+0v
         z0M0VnHdwRvbqAobOQCZv5sRRaw2xJ2X+WjYPjjnPKtye+b78Kfsjw7WGA4T5PA2+aj1
         oq0A==
X-Forwarded-Encrypted: i=1; AJvYcCUkql03Ce79PVKkktx1DaJ77E5Xh8E0VgOOIc71mGLoCZBL2QITm0SsE/AUAZJJUjh3zPOlwUQGnED6kcwD+yY5@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpl0A2zgumFMsjJk83W18vwH9xaOat6NVP5jNVFGxAb1Pb+vW+
	hG8k7dDphHCt9GrxiJrStX0c4CbRv4bZJ+Mb/LUUlo8B17czRz/+/SkA
X-Gm-Gg: ASbGnctUJy8i5gWLEV0d7N8ShPbgIgTbG9BtowspZCrdscAIW3AYen2Dn7flmP20KD3
	kdjkIOpIyttPLMqM+innYZQ7D8QHuAyo3iLrkGkgm/G6dtf2Zw8QSVAoXMnXK5WT9JcUKu/f2Jr
	BZvstLb0mIRQOblABvPu4paUrlCdAlAteE4qvPSrbW1KQe2fYfbFWQZLRaki4GFUhd9MT3Ewr9H
	iGe0gWwKudIhkppoaEdPUPAAxZHdfOn0IHW7+SIouIeGk1+JVMjQ61g9liGsU6vw3tBhvfNJ3cB
	I3sCCIZb0lhE4Wzt/rtFeHFfIgW6B68+jSizeNBZ9LMZdPbu2ePcm9Xd0rmr0XzJUk7zxMkGu19
	1xYb+QMQj90CY6PcuA18YHlEEpRwiljfPI3/h9w80HswPqKtfR9KRuqMuqdxSiokK9SDG/POEJ/
	Lje3KkWvBpANXXwDtM9g==
X-Google-Smtp-Source: AGHT+IGtn2Tb5IVfUa8fwzSIF6EUNQPbcBikspeOnI6L4J7SH1eZ3RvMdCq27U9/2nMsft5HkQB0Jg==
X-Received: by 2002:a05:600c:5251:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4775cdbd440mr2296855e9.4.1762279802950;
        Tue, 04 Nov 2025 10:10:02 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:02 -0800 (PST)
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
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 01/30] drm/sun4i: mixer: Fix up DE33 channel macros
Date: Tue,  4 Nov 2025 19:09:13 +0100
Message-ID: <20251104180942.61538-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_101005_114976_5CB6D49D 
X-CRM114-Status: GOOD (  12.73  )
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

Properly define macros. Till now raw numbers and inappropriate macro was
used.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.h b/drivers/gpu/drm/sun4i/sun8i_mixer.h
index a1c1cbccc654..b5badfa2c997 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.h
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.h
@@ -39,6 +39,9 @@
 #define DE3_CH_BASE				0x1000
 #define DE3_CH_SIZE				0x0800
 
+#define DE33_CH_BASE				0x1000
+#define DE33_CH_SIZE				0x20000
+
 #define SUN8I_MIXER_BLEND_PIPE_CTL(base)	((base) + 0)
 #define SUN8I_MIXER_BLEND_ATTR_FCOLOR(base, x)	((base) + 0x4 + 0x10 * (x))
 #define SUN8I_MIXER_BLEND_ATTR_INSIZE(base, x)	((base) + 0x8 + 0x10 * (x))
@@ -242,7 +245,7 @@ static inline u32
 sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
 {
 	if (mixer->cfg->de_type == SUN8I_MIXER_DE33)
-		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
+		return DE33_CH_BASE + mixer->cfg->map[channel] * DE33_CH_SIZE;
 	else if (mixer->cfg->de_type == SUN8I_MIXER_DE3)
 		return DE3_CH_BASE + channel * DE3_CH_SIZE;
 	else
-- 
2.51.2


