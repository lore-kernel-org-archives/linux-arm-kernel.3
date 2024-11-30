Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58522D73619
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Dec 2024 00:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36yDOxib/1gmocQMgVorj80a3sqs2EFrrs6+X9Hy7i4=; b=oT+W8OKucSQkKaC/x5HaYyB/CL
	kb+8h/uctBl8GiMEWvGlmEtRMk6OOk17Rtmsq3/R8j0kFdD6HBV5CfIvrqpQ7Pth6uSWc/FEXf2/g
	NJvV4lFyAqbZIeJS9bqPPj55LMGKaHF4Nt9ThXEwHvxH9CFMx5pjAbkBeqDBT+y16ipN1qxXP8prQ
	ojTC9CDwk42szcG+zCMxRx4uJOg4hGukl0z+aLt+2lQYzyZw68kNIs29+rEJXY+q9838Fic+cA5yB
	5Qf2qlU3cLvNY+Yzy/Pb9sCBtDfgN4ACPtLpjUpN12cyC/Vj1RbUVi+I01pvQQT9aaYjeBWdqrJ6L
	3WMFtQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXPw-00000002mA3-0JwF;
	Sun, 01 Dec 2024 00:02:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHXJS-00000002kvQ-293r
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Nov 2024 23:55:47 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53dde5262fdso3328372e87.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Nov 2024 15:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733010945; x=1733615745; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=36yDOxib/1gmocQMgVorj80a3sqs2EFrrs6+X9Hy7i4=;
        b=mNzBjEGgZlvV7RUNkGcQOSSj84ZyWl/Gd876AopqJHxTYBxWlmdvvqZPhCcY3JXqG6
         y+z0O0pCN982vylZQQliFHou2qwefn4yvFYgePYWv0u95feukxgtqtDar9VaNWRcJkvr
         v7qaiY6vwxoyuvZtdr2PRre3AgFGvpSAUcARCY+Fd2z+54RN0hexxijPYBCBZ+9lUQor
         A3nqzmUgHg8BNX4cb9dwsS3XLJQoUDDAFAtJfSLDpjYORagtjcMBi3lg0kPvScWnU91s
         Yz+Zo6VDzKlsFcth0VEOU8J477GoTbD90FNW6SoTvJzK8QrDHakpm5aYkpvbDZ3DGyRY
         n87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733010945; x=1733615745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=36yDOxib/1gmocQMgVorj80a3sqs2EFrrs6+X9Hy7i4=;
        b=tH3n+tnFWqjm8V2/whBq+ZZj+fpWCP3Jd+kfS4rg6g1pJFEGrIapYWe/KyI1gqhdsy
         CUsi9zD2yiZcWxj0Ip+GgvykSdliJ8SA83yrSQgjVzdqA57HQ+9H8MjQcsSuwK/zMVck
         X9JC6iKnnQ1aD4i2nisQ3WeYw4i9B0FmrBl2pugkSN3+vp/71JDqZ6guyilWJNK7ufxE
         hD+sLWqQA2wYX3EG7aYqre8R7nQBKSf2ondeK/Sy1+XcsCAFOeMMOJWcH14++0Y0Pqrb
         Uycy0jKBjB4R0e6sq9k7Tu5z10fTukZ8KjxGodxl/U9KjHNWnzdPZkNQ+2jZoFq8bXvm
         ciXg==
X-Forwarded-Encrypted: i=1; AJvYcCUbWtMUYW3pGqzJZPPgbgulXvltz6IlthZ8knhSkgGMEKzqlDcHQTnTxc8YMI9/m7QRIxQ8+kMBE7hqlsoebq8n@lists.infradead.org
X-Gm-Message-State: AOJu0YzxvjgdtUrMULWHX4/VAFW8JxKmklirUbHYqQl+atk8SApuQUJj
	ijsKuBHjoJz2A7cWNtPMHh1v7JME/TkMo04XLaHEsyrdPnxmxbGJc/akuQtPpR4=
X-Gm-Gg: ASbGncuxcic7VeHRoAaITz3n4uztlnIMkmfOSzS8+raenP+yUyDK5PWR1BO6EieAPKZ
	EiLxGjBuK+U/43F5jQ93A8SaGZjLd7FK3EAcQNZO7SP6lM71wRxlpA6g/1odCdcMe8HdJIiH+ea
	gPSRpq3t/bV3l7RUyB6PvEChjul90GxDgiJVYUFtggB59iZM9nlbXtnxL95p+44JtAAH6bMZ0mk
	o3vWH471YKdHIFrVTXzbosxbsJovr1giGp1FNSR1GPNesdeBKkW+oWIfQ==
X-Google-Smtp-Source: AGHT+IH1Dd+tGUe6sC5VDohyZs6YM5bJlrw02OG47IUbMBnDEhuVmgxIpQdpIhppnPqJWxsmsvhkAA==
X-Received: by 2002:a05:6512:3c9c:b0:53d:e544:3fda with SMTP id 2adb3069b0e04-53df0114865mr10496986e87.55.1733010944592;
        Sat, 30 Nov 2024 15:55:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649647dsm900706e87.195.2024.11.30.15.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 15:55:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 01 Dec 2024 01:55:23 +0200
Subject: [PATCH 06/10] drm/i915/audio: use eld_mutex to protect access to
 connector->eld
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241201-drm-connector-eld-mutex-v1-6-ba56a6545c03@linaro.org>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ocQZIy+T4sFAsnN5vtnQkv7E1kptjCde/MaB/nCVvag=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnS6Xtmjf6X7lDNnSYnbN8EtG+XlG2iAcozEYaN
 vKRL0ru9MOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0ul7QAKCRCLPIo+Aiko
 1YA7B/4nI6CxdNCnT52tQHBg9M36pI1GVe1vqRtK5C3wJVqMCVhoJSG54VKPili2oAyP9q7Y5SM
 wfFkEzkHUs2iCBzvmcSxgtU8l7GXrHr4G37JlP3I6B3mtLZs7nUZ9Uh0WxA3RWI3Mvs0QxgkdOt
 d+fckwL/7V2GpA+I74A7OYQiz5GdF3miJBFmjtYL0TbdSjNBXXtzdj187qJpxJ5kogVYysHQ+Jx
 JRXPmwqhg8MNbZs+6GsTbv/A+sTxNTCEgU7RZ077JdqBKJNYgCqGX3SbCj59ZG+wd6EGcLw7COJ
 TaQwbVrLdRTZHn6/hP9VyBUkVHX5G7ONl7SU4lh2FjAe8VoW
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_155546_560537_A330B127 
X-CRM114-Status: GOOD (  11.49  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/i915/display/intel_audio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_audio.c b/drivers/gpu/drm/i915/display/intel_audio.c
index 32aa9ec1a204d2ecde46cad36598aa768a3af671..3902ab8431139c3ff4dc17b841d94b6d3241dec3 100644
--- a/drivers/gpu/drm/i915/display/intel_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_audio.c
@@ -699,10 +699,12 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	const struct drm_display_mode *adjusted_mode =
 		&crtc_state->hw.adjusted_mode;
 
+	mutex_lock(&connector->eld_mutex);
 	if (!connector->eld[0]) {
 		drm_dbg_kms(&i915->drm,
 			    "Bogus ELD on [CONNECTOR:%d:%s]\n",
 			    connector->base.id, connector->name);
+		mutex_unlock(&connector->eld_mutex);
 		return false;
 	}
 
@@ -710,6 +712,7 @@ bool intel_audio_compute_config(struct intel_encoder *encoder,
 	memcpy(crtc_state->eld, connector->eld, sizeof(crtc_state->eld));
 
 	crtc_state->eld[6] = drm_av_sync_delay(connector, adjusted_mode) / 2;
+	mutex_unlock(&connector->eld_mutex);
 
 	return true;
 }

-- 
2.39.5


