Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 09:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=; b=VxZtUTNkshsM4yOpOGvIETQniM
	+NhFop4PUwmjUGZFzJDORi8X8e4tKvXl1/eqVABIFF03lvQalpKb5CoFTpbKYNjdm+fEBDHETuSHk
	gQOOqY1L9vfIcM06WwNy4jBUITMycepx7rqxk7XC7zvuSXmfMAlGCX3Z3p1kNYiHTcWDdyjy/xd1W
	PGYVeBbyDaMLfa3ODYnRiHcVirbo8rLmxYx4HVqnM5KUSvrzV9RFODe3voEUqvv3UkIJ3Urqemk6B
	kH9+0dJWwYUuLrs8mg9fdSja2wwPu5b94xbDPJ6i8afNidsjuo2dYf91z7r9yvQiT4Ph8Y7pw5Qgs
	1hQPFDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUum-000000018Tw-0oZR;
	Fri, 06 Dec 2024 09:46:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJUrm-000000017VD-3vqr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 09:43:20 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so16744131fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 01:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733478197; x=1734082997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
        b=MAJB9u21/sfCSidLiS6Ko2zoLEgXVC4txa20p9fxDHVs1QwW6tMws9pxFMemBsvN4I
         tDsqPOkku0xlp0IKTDJtP2WE0KF9CYKiV1jYfbaY4XPyBwcCCzjseMuPtW1eh8Z2wEDq
         wxYKAKuLTQwM9z44pKhS5ICatR4Ox2z70tEZK7x5NAOWMTZZCT97lNRBz2SGUMNmmm4Z
         wSG+L/xG4NMzF2r0atwl5tQ0w//64sgLSLeBf0fu9YkrqL94/vKtRFUnNeK73csHb6ex
         qpDAj34qRdJQs97uqr29JOfD17EIchwdmfHo/o2H1Yli0ZppyVKcNFifbSpMuiuSepLo
         zbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733478197; x=1734082997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXd2OzHxXLbpmSJUeio7TPXwyPaZHSalM8FhliMGDmw=;
        b=fGv17l5JEzy57XuvEQk8dEACAeXbuluogYChqE6snzIoeJ4ajUog4TNeFdqBikR9QZ
         /vjTfCRCnmpXXE9uswsJxp3YMNfxclKxbXSp2FO04wZfF4ZL7NfPxRsM1jSyJx8pQjkI
         uBeG6Fu5/91m1U1hNFznML+mr0Dm/q5z/H+bJt+JSkWY12VJ+sQmUbkTcC6OAuDZGPbf
         h8UBh85k1C2N9WLBwjcDdto4TMv9L/brxNJ+5vXWAJRKpF/EWWByUI8RoMts+ibC1cjX
         GagWC1hgNx1xgT2lT6vVgGEKRXSAJAvL3EoIlUkGV8QqlquMloo6HmK7eywmRwpluZVO
         uMug==
X-Forwarded-Encrypted: i=1; AJvYcCVTb05iEq1l8o480xxV/v6DEus2Ztqbs/qwe96IrKyJiUY2kxnaaWh7HguryDmQUZF6z4oLxqoylweRsVkMEdDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxE6O2cUBQUQ7IWYEjIk/FajtgrdjIX7uLPYaoGSvyiGQmUck/+
	tXa+OvruAA59ij5Q9uktNtFByY6dJDfXGSReXjU+ZfjZf2yLVh32NovFW9XkwYg=
X-Gm-Gg: ASbGncsrQ8ESTN7KjYN2vp5rODTx7H4FIHWiYueuorKcUlNDa/7oeKcBk1uww62dJfF
	FIKXgA8uLnieHZXkXti4FLEIY82fH+WCT/uu/i+gMo9s37WKYqtRNnXiDPVbmDrcgSjTXMfb5jS
	pyIt8y4H/qvqwZbEui9GFJJ82ErWRALXQm/SbFy1GW9XOd60vgUlhJA5fc52YXGYXXEtOJWEna8
	G+h8JILFrJ+Wu7qTHPiuaNGiKruDOeiMuLgZ4Aqh9wcIp91LzEfgLdJoQ==
X-Google-Smtp-Source: AGHT+IHOzYvZJj8Vkykxd2x0JSD+NBvzpXfm6jlvPobPhv2vFXWDLmCYeuoQOdT69cvmzqWGVgvY9Q==
X-Received: by 2002:a2e:a9ab:0:b0:2ff:d0aa:11b with SMTP id 38308e7fff4ca-3002f79b514mr6682241fa.16.1733478197396;
        Fri, 06 Dec 2024 01:43:17 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020db3805sm4128441fa.50.2024.12.06.01.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 01:43:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 06 Dec 2024 11:43:05 +0200
Subject: [PATCH v2 02/10] drm/bridge: anx7625: use eld_mutex to protect
 access to connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-drm-connector-eld-mutex-v2-2-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1073;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=zYvAEMAKJI/pMjPuMCGmB4bmJnIIZvQ3OxFQhHsqYJE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnUscuOWsnWIy+09WL6ZmIga61MhuoPN14wFRyc
 CTUUhM7PIGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1LHLgAKCRCLPIo+Aiko
 1QuCB/9GVQCw++i7vtbIm18C0qWy2CcrBgiveGKyYFt0iSpolRcgaG6RbcwjW5qst9mjy3Q6fyT
 wfoOatec5nsxe7H0nq3z0RdLACzVly4qvlxnotelWRdH/BQ6ujFXyFerWcmtX3JM/VBGIQ2IBAc
 cy6kBFVrFFfY0hrjJEvNHpO8Jw7wJ8KQT4IzkIw7DCzBnKyhq7QShr5O2I++bdw+2PCmYR+Ig4l
 AKpe8UolsbHTV1DesMVMTPNQMXDw/veYJp5B5GOVzXYZoSXeg0/Wp4HONWYO6yhjuqBKn4BL1Kz
 Qv9O5BOb777DITYj54ixLYloqlzSi9P0cRUdPa0UewnOGLrp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_014318_979837_2CCDF5FC 
X-CRM114-Status: GOOD (  11.72  )
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

Reading access to connector->eld can happen at the same time the
drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
order to protect connector->eld from concurrent access.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a2675b121fe44b96945f34215fd900f35bfde43a..c036bbc92ba96ec4663c55cca091cd5da9f6d271 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2002,8 +2002,10 @@ static int anx7625_audio_get_eld(struct device *dev, void *data,
 		memset(buf, 0, len);
 	} else {
 		dev_dbg(dev, "audio copy eld\n");
+		mutex_lock(&ctx->connector->eld_mutex);
 		memcpy(buf, ctx->connector->eld,
 		       min(sizeof(ctx->connector->eld), len));
+		mutex_unlock(&ctx->connector->eld_mutex);
 	}
 
 	return 0;

-- 
2.39.5


