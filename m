Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5ECE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 16:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=mA95m2HU1Fmd+VHWZ09OAL1qc7
	N9yya2SL2U73BHiyL4mSE0aZAxdUkf4hzww3mc6yEejwqAGwBL7O0yKtFrTEoVZtRFk6aclXA6qRT
	P81P8BvJRMFZtK2xvJ8tfGKg8qzuQlRrTgDQHNI5vFc9j+6+f6iADhyitDHac+RMrS5OmrMrIJR4B
	Z6XPqpiWKGNIno9wRLpMBJU1mVltvqwzjaSNjerXI1FTlt2Qfo2yUwBUb5w8u6cgphypNqqcbYSGN
	Dy/wv9c6UubjXgm0tJd0RgDzlne0WLZFejVxjAFrrR9i0hZutCSzEvW6l2WdiGVFiuAexM3TZH6dH
	EGa6muZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYlC-000000098vB-30fj;
	Wed, 08 Jan 2025 16:18:22 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYil-000000098H3-2l5L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6335e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352950; x=1736957750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=IPB92KbvgJ0XzBWa2MA8sTllD5036Nw9b4krQex68GtkAapLQdvBlezQ51Bc8jL41W
         y+weOj/lQ52D1wZh7WAVH37QZmi1fR8StS1tE3Csl0C2FxVpustG9SccmG12LNZLW8lM
         h8dD0s44GrckwiquRUL8z/SAtkdLm20hjBIh1Y+7+s5J72ScylcDBgOs2mpZDXJwOdYZ
         WMHf1VD2mUGcC0kY9gFYb+F14i0tCD/y3uR2r04ICDSMbWobFrzUNjQ7+qt+6dtQYp1l
         rxYkDWlMNYn8WSAwvfiO6KUt7b1Cml/rC1oRpbN8wgYjPVvfK1IftQ55Cp1qJwszec39
         tnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352950; x=1736957750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=QY6v5G7pPrWq546H0PjTeGsonU36EaQrf6s3M7M9vPNknh5FNLPnkUBsh/mMO6EzRs
         VhlVc45Fxb78jO0N47zoBHq50TZxbF4GhnADgljplemgGkoDCq9Zl+dzDhJgjvcE08gB
         UUAzT37XphE+9QMBrFyT9Qeol4E7T0mSb6G5tM6rWPlSnFtCB9lMPq1ZoveW8jCjqy7A
         7DramYFL+DZy6S4M6uRfgLLVGM7vcpiE5MoJb+nvMOzf++Hr3mKuOb0CiZbh6qjnCK9L
         NK9akLBPbeNkjZTYwN4zSS5R22eG/zReTKK6/FvojUBjWsLWpfuj8ILQxwnfZk9pieFH
         6++g==
X-Forwarded-Encrypted: i=1; AJvYcCUdg359GobRiXmf3Y5cDPqye2+mhjc6hJ4KIQLkPfLd9bHFxIgDkWcIHe36sXNSLD3mHPs/t6LhO0yhLZkvcO8v@lists.infradead.org
X-Gm-Message-State: AOJu0YwYx7Uw4nfvx/rbOq0MlSivV7Zx6N0M3EqSNtpUK1eqjPY3qkaU
	acxOXhF1Ekyw9Zo9G/fBUW4yZH3RbFfKdJBaFxixltR1UzVgmy8tMebbMpN7xiM=
X-Gm-Gg: ASbGncsNduUi50nnAAJ8/bbZuZY2K7iGss2GDOMEhHKnAJQT6K1zz6+IpCrHL2doHSk
	JokX/Ztuetsy+d3nj6+wioLGYrmUY7o/pj24XJerAUC3bwJXltM2tr6mW0qk693ZYexU7LCtup3
	KkkOBPBQrb6FLNlN6rTGEuFhz0rIEG6wnlmgdMQUsnT3acEdH0mz6g3xZBODrB3f1uB4VnRPqmE
	Nt11wrPoksdcKVGQyzE6KB1gkr8eG48nusqzlizPWB99S4dv8qBPHL6x/Ep
X-Google-Smtp-Source: AGHT+IErwM3j92JVYdrvJX3rbay8OfkvXx94igFMozvvvB4mQLpq0RzpMVuPEGWSZVlYGy9bvneCfQ==
X-Received: by 2002:a05:600c:1d9c:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-436e2696d35mr27681225e9.1.1736352949654;
        Wed, 08 Jan 2025 08:15:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:49 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:44 +0100
Subject: [PATCH v5 2/7] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-2-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSx5htXrZ1ekJrvaqOwSRFlMwld/dEfa0QLcinc
 YbzjdD6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURXnkD/
 4+h/AOARecYGq4oShtmb2NW0jX93mfDG2xklUJT2F6zBdbeNzF6+Hf9vpfH4IpJ8qCOhzaDAiccTsL
 n/F91FRgA3NhV9vLIweMBfpouNgCAJqDxu2pVQ8JyFArTbNkI6MaA6tXhjHbSFdkiZkH8YSC72VtwM
 bodY/gV06hSkUUimxNUXCx4v1YuSI8QENLLVyMHqubbw2PAm0ROJpZKngxxzQF9Rq9bqENCWWiJNRY
 Ytvo7Bx4FGwzHo57pskqyQ1mAmfje/TeJfv7GuFhUpZ61PaoWaCK0/2ewIrMg9c62/X2ZOR3VY1ci/
 /+m09ncl6oqERlR2m9zs7k7q9b9jHAEVeeKaCcHuSjYP9kRyfI9jygs7XOJCnpMlcLDLNDRra8gR5X
 FvhyaNTLwPHtRkcueY6llSeCx569I6CL3vY6Kctoc76+wJN/ZYGXnIRbu977CDV4r/PvTP9njiTJ84
 ADMCGK3XcaIRppY8TNSWvsCyP0JBEQSt8lWNXtGem2TkJJePfcXNdp8Dca76q9L7/t6XheWKjOl/CT
 eO3iTUH5b0ZhjfF7Vbbq8kHA7F82w79IHNou2cAvQaKO3Yx6ExoIWkcvl76WWSaY+eikcL3TgEVN2J
 keKvH3T/7q8YjxVodQBfIsjyfX9ikYrJJ/UquoQr3Hl0ZXEosxA3at8BhiRA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081551_700832_8258C4BC 
X-CRM114-Status: GOOD (  13.33  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


