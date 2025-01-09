Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0158E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 10:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCXEkdQUkL2wd08/hMtAK7d558exhzf0emr4McwTqMY=; b=TsIvG40nrT2CnbPXZIDF0VkDEP
	+2xqmNyEAEyVmBm7+SE7vYC9a7zqkhtUUPDKlAQqGCLQhgBzR1M7zR9t67hUmlsosjPNduUJ+UxdV
	s9TzBLIcgLnWQMo8OLUpQv2AxRnr0qe1Z9hTdz5EnDViNzN6y0dfy4d4CFnBMNLKuC+OzzQqgGBsf
	emq2i16dCU+JICJAVnYm0F0iUHy+43LxHhoBthHon9g0lZ9nlfdGPzeFLOZLlXOSvCBVDdxTcXgMg
	ORb2CFXwKJPTKcNt/aimKXEHP8vVGCHExVu62ZFZv8uiYfJeyU2nm0WMwUfRZu+DIrjE9tD29NkKs
	u4ejAdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVq1L-0000000Ba8L-22Cb;
	Thu, 09 Jan 2025 10:44:11 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVpvP-0000000BYvv-3bP0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 10:38:05 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-436341f575fso8138615e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 02:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736419082; x=1737023882; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DCXEkdQUkL2wd08/hMtAK7d558exhzf0emr4McwTqMY=;
        b=m9jeKLpuk5RSy1U5DAk4jBtEcx4F+wqtYeIM24qXS7PI9nl7iCgGtGS3pDKLeDUCEh
         VPQZ4vXk3BlnczwNyvFzEKfWYYn8z+b4UMRVnQ3b0DseCsCKkcHBhGjrErywTMpHwiLw
         XIzF2hGbM3Q0118esbsg/KNrN42fFgRRHAh1yDniFmDski655mqxZDkEjni0q/kKiGb0
         aD64VbGsBWekkUW/3zu62G9lWGoSJDAMpDxCuvpjWPDMa2F9hmY9ebladg75ppJWDa2z
         6gVdGVi05OYKObe86waDdF6v8CqU8E1darwj2C4C8R66d8feJhhIuDX2Z4GMTOx2iPVE
         +hiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736419082; x=1737023882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCXEkdQUkL2wd08/hMtAK7d558exhzf0emr4McwTqMY=;
        b=sEMMFrw155+IAsYQIBEc0ZgVIwF0F0Jd5a9FrOQLcj3K80UOsCSK+efHb5/OiHww+T
         eqqkMIbasfLnLtpP+68RyRy0YLAk855xfDVIkAyhAtFihwNOrbz/mhCvjDQ68G448Pg/
         sGBUgmllqrHZjL7xmLqcamVUThmlZTO5KUfIW71wsl30p+aWr2vSMUCti+bciwrb/zIP
         plw+AxWIWWo8rL1iUZ9ZyiF88ACodIWa8nYn502XlA6se0yfjuwFcxA9NbL7mM3Nb6Dh
         6oj2oWx5FBbLM2yIqN3iKTZeYHr6E+LLpxUELPBwAoSmcgx3VJG+72EiLzelHKl1iLVZ
         7yog==
X-Forwarded-Encrypted: i=1; AJvYcCViiQdSRM1WaN9CUAJxB9rzi5OacoOPwKdq6Njexwvmd0e8Hk6UImOEY1lwh4ooQ8WvRjE052V7Dky9k41o4LG/@lists.infradead.org
X-Gm-Message-State: AOJu0YySixWQRPqUJGdi7+AaRJ1jMFuIoaZYE2Sv69TQNuF/maFD5EVY
	iMUpeZTl8+Zh+wK7ks0EscsYzmfQpmgbGH1eozM02KIUxGp0spFfoQiXt1JHJZ0=
X-Gm-Gg: ASbGncta55BHNVXsKfVxAO5u8o1BuZE3iLUg2fwUoZ5Lth6S+M/uloEwUCfelJra4/c
	7mpTp2FqaCKPsdDwI3G57pYdAaS4t/tSFzOwipQU+G4RSpTKBDzAh01JMQ6oLRCxYGKLIUKoAf8
	UlqbF96eo6B8evYVrnixdMLK9p+C/Z3pgNBf4O6d3JOfqROCmKMlrKbYFu/zEAL3LL7dCzX58P1
	cYrCd8gc1Cf0NHyBaMok/2pUi45moRpxAjSShHt3LLqURkYhP0g6OCeyb4=
X-Google-Smtp-Source: AGHT+IHDqk9Dn/QqIZHU6jgykmIRsxf9NASNh5jt9YjZTPMmzwA2ZvT2ZXMyssDp6F9Dcqpt/13q0Q==
X-Received: by 2002:a05:600c:1c8b:b0:434:a852:ba77 with SMTP id 5b1f17b1804b1-436e26a7e1emr61442675e9.15.1736419082410;
        Thu, 09 Jan 2025 02:38:02 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:125:358f:ea05:210e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm16428195e9.11.2025.01.09.02.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:38:01 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Jan 2025 11:37:57 +0100
Subject: [PATCH v6 4/6] arm64: defconfig: enable display support for
 mt8365-evk
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v6-4-c6af4f34f4d8@baylibre.com>
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
In-Reply-To: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=5LcQ4cCyrjtrBHi+BM+fpfBFczkCA62rUsdMrSt+Gvg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnf6cDT94L4X0YgQPmvNBZWcAPwVjpeyziQ4f7xGFx
 12bbNdCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ3+nAwAKCRArRkmdfjHURfIID/
 46lLcLh3k8s/bf1kjHlDFKxQYXHfHNEk+fM0kc/FCBgx/BsY3Pqwg5Xxop+5OsozYOirZeb6Pue8XR
 MYFlq2xGGOhzoi6L6cv9U4D0aTPkyRAyotixoFwXz/vff51ZwS7HJbjE6lyv5LVw9Om+EDHfpv/Ri5
 fcvo32f8ArHOWrw248Sq83AdKC6Rb/4oEf9NyEjCNhScCnoniayIQhsEvX2AnlGWRsk5SCFH/R3YAl
 qH2wsE4mXIR2n11/R2OSbSVJPRQrJW4r5zP6thvZyO0tlHD6c4wQIB+f8xkqEMI7rpTMIvIxyzZwcC
 /+K24WvmfO/rVeKeAEI/ZXh0kwYFmR5RlWlCBJEzah3Y7/HmnFGmHdZnGtU13PGuubeU1yKXBQeRoo
 kb4auVvR8xbDwifrB5Rd3Rcdu45OercclIlfXA3SFsPqmR5VsW2Osvlhj+Bx1J5HLvHv5c5gu1q7Rc
 UBw5z5jYRnBN9jLagFonr+sdNAabpWx03urz9/Dn6OHhxjwG2Gyi4opLY8Wj++uhF3vXa8pX0EGUpo
 PrbUw7qmwh2ozUnc6YqBNjkGy/uMpHjS9XLUKh9HowiZyWvve+3pPsvCh48F1joL0yS3VPIk+jvWU6
 e/eT7KD81nVSxjVNX6sTAW6Wo7/o4ICmWbBJ4BvUfK9LkwjnkH5G4YnoPJfw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_023803_903632_D9CD6CA4 
X-CRM114-Status: UNSURE (   9.73  )
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

Enable the DRM HDMI connector support.
Enable the MIPI-DSI display Startek KD070FHFID015 panel.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..1e2963a13500 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -897,9 +897,11 @@ CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=m
 CONFIG_DRM_PANEL_SITRONIX_ST7703=m
+CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
 CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
 CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
 CONFIG_DRM_FSL_LDB=m
+CONFIG_DRM_DISPLAY_CONNECTOR=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m

-- 
2.25.1


