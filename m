Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C33CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 18:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=; b=oNAvQRW9R+fgzBVcbeBU/70ymx
	wrlG+grBDo3d26+1SyCIXBIeOEuX+1aFbfMeHfxsvbZlXHq3V2p3RXkOWrIs2qW/HPF1qOa68cN1r
	LYFSXfU7ds6gzd+IIyZgFcqhWbix/mcwu+tlyZ5aFtV37OqPiT/0NkKop90KNWZuQogJoka/D5/oV
	jI/a9qdrvgl2mr0uQs23oT+1RDzqXGIR3mMGneLDmerq2wPH6FNQyWLKwjPOPQBqz0Zw+dL4HolLY
	39Vv1gUWtzaMoxAPSBFfZ7otEG9QJk/BvWx+8Sq04p74cpTXFN6NHveshjBGxhB6DzDqMf3UPkXsG
	Js/LVn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUo-0000000CMQc-07nP;
	Tue, 04 Nov 2025 18:11:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGLUO-0000000CLpx-3CvS
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 04 Nov 2025 18:10:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=; b=FDHxRFlQ0mqlxp6Gd3LVdcgUye
	3EfxTsCdA9iy7Ayf0r+jEXa+fn5JWw5GTzXjKKnb1VL69lccKn0gRrlSoc7cQDGFyjgnJGzSXZUEA
	u6WgtkXe7q1VxImp1/gUaK9FByck6Hk1UMgcd3+zfEnQiNouCcPRavyO+MtJ81lGihFHdsOWeua9x
	aEFA9TMnBJDYUqVSYUUFh4qgEtFMsC6/TRmLCc5H3WRp0URwtQJeqN59+ErbxWeZbH/y8eAyplTiv
	WhWcuhDoDdiMpih+F8kl5FFsR0ReqPlo0YBSoLlGdJM7zswBd5Eu6JXhZ/SCtwc08D4pl6xC0K1tK
	6BN7xFYQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKcc-00000000aqQ-19sw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:15:09 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47112a73785so38746005e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762279833; x=1762884633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
        b=Rh6r/STGJiVNfLr1IRJdWbFOjVNnlrM60pXlSvecBGadS1zUy75EzLZzWcF3KkgbzN
         YcbnJoWj6WkaKuL2b9KGlsXu7cKIiPJyxitTz6VUOKtXkjgPwrHn1RZa0/817RBBNWx3
         AGVgZaZr4C4ZfZNRyMAB90Sv5Lg3Ii2oU+fqfy/vslBhw/YrgAVlAOV84feurXkpmWjD
         OZG8PlmpWLG2HRNmSoF1CpvQffLJ79ZaV9ScLUGkdEDwlAFAC026fnIYdac+IPWWFRzT
         7iUOiE+M8aNlcH1r+ImoRjNwmQcIp8DpDI6gea/Fpw7I8NkgP54Oh5HlNN7m/WCf99pF
         2b5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279833; x=1762884633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMq6+f8w/XMhRL94h1i6thbehjh3w3EiU9h31KM0Dlo=;
        b=v54ZZJCnZxhZGRe4eJ0sIsOUI3SfGhIVW/xMcfmzhtcJAfOEWcrJEByES/p5ZXOtIw
         Ei8nh+D2AS3sJYZwT+7wgdnBq4yYz8hi6dv/ZK17hHz7BSVn8qj704bNS9+SH1AABl8V
         upZ6fTEZ7r7bIjgvTLkQcVv98XzMqUhybO2beVsTQVbOwD99O4RGX1p1Q0j4eWe3P052
         Pr72ue6+GDahi2Zf6ClKS1uTPii9AHUj3wQ1A06PnduKBVxdcOOyNWMD++BLeIQHaEt2
         13Hnq7l6PJgE4X28+LXBZLsol4kKyblobhoiL5ZxZNnz8B0ivWaEn2fpMTXhWoJUCsKj
         eErg==
X-Forwarded-Encrypted: i=1; AJvYcCXv1Cu9VsCEXwmhJN7AewfvicpWbjM2LYGbNIWaKeB8IuqrkqVH14MDDQ+3MRiyu9fFM50ppABi23I0/FCUfM4a@lists.infradead.org
X-Gm-Message-State: AOJu0YyYMzHZXpo94SqPtwf9S6QB8+vPYVY3oo/Dxp56ezWMHn0XB2hl
	PnbMw54UTSpTk+jZOYbbQcrBQcZ/lRUIf/kUcv+vjTYFbELjqPnMjPw6
X-Gm-Gg: ASbGncv9jti1xRjVO8o+IIp3e9YT5Nt8slcb9np25UaFmQu/7nFt7joJ2UozR7d843U
	6p1O1en8Ru8SMxEVGkJpfoUbl8m6uzFl5eBYAxksk0i0YhjeaSLyR7LlcaVymahZDP94heHL3Er
	+Sot3odcPvReasZVNewJdcp/r99tyy1CVR+9MT+wxlJdBo1Gv1gtsVQabHNvS96hMMc1IPrJG3K
	JCsmRHO/ogN+TsOliEJiaVS9rNnF/ED9iCtvJq9gKPdoVMh3NXWL6Nf11BGAT8ceZb/QNE2eUde
	PTwJZZh3kXIAozq2dl8Pi4gzHs6F4spPZzGQcWJgcGvGrZvqMo4ZU7QM61FqigA2I2oce2dra5Z
	T7iPlsLB0Z3mUPGalUTqO5J9m0XhCtNgObyxhr1hoPlpuH5q0JqD+xWbS/mmJn0oqgKrnvgNnUR
	AH/LfHkAFUjruGXInDXA==
X-Google-Smtp-Source: AGHT+IGAou+/VWjl/+havcgVpIaUje7S46iuTOTBDTJA+e9THTDoYyFzTPWTWOtjQVDGfLuUQylUOg==
X-Received: by 2002:a05:600c:1e1e:b0:476:6ef6:e28c with SMTP id 5b1f17b1804b1-4775ce23c7amr2190455e9.38.1762279833261;
        Tue, 04 Nov 2025 10:10:33 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:10:32 -0800 (PST)
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
Subject: [PATCH v2 25/30] drm/sun4i: ui_scaler: drop sanity checks
Date: Tue,  4 Nov 2025 19:09:37 +0100
Message-ID: <20251104180942.61538-26-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_171506_397881_0BA5AFFD 
X-CRM114-Status: GOOD (  10.33  )
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

They can't be triggered if mixer configuration is properly specified in
quirks. Additionally, number of VI channels won't be available in future
due to rework for DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_scaler.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
index 2fc54dc20307..c0947ccf675b 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_scaler.c
@@ -132,9 +132,6 @@ void sun8i_ui_scaler_enable(struct sun8i_layer *layer, bool enable)
 	struct sun8i_mixer *mixer = layer->mixer;
 	u32 val, base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	if (enable)
@@ -155,9 +152,6 @@ void sun8i_ui_scaler_setup(struct sun8i_layer *layer,
 	int i, offset;
 	u32 base;
 
-	if (WARN_ON(layer->channel < mixer->cfg->vi_num))
-		return;
-
 	base = sun8i_ui_scaler_base(mixer, layer->channel);
 
 	hphase <<= SUN8I_UI_SCALER_PHASE_FRAC - 16;
-- 
2.51.2


