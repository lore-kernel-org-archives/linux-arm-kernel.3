Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55203E65D17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=; b=pIHO/GxTH42HzYzec6CvRmMq0B
	pBYzf9a5kZqmJCYcrTTUMtSyiW6QsbFvGsANmC202t0V6XKx9VBGcgXgZ7wO2u+r+WILNIOahqmqf
	VBsaeSP/7NSfj2PySE2f4pHt/h2DMcA9VkQxVV7s7RS6vgWOQJuvAbJBh/mSjFfM/72zQylFBkgqB
	xLj/KmYbQFxL0rMU4jQlrblkz+g6roxVXIK7TlE27vEADcbAB2IQo++6AUQMC3jZ0TroNXj2zxk1h
	An2s41byyJZiisCvNhXAXwTqCs31BwwypCettxOE0Vf+69f1WeSA7Wmb2YNLb5u1e7L/vp0bnkGs3
	R9w6ZalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPks-000000022Ry-0Gmk;
	Fri, 22 Nov 2024 09:15:10 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPiz-000000021dY-2lUj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 09:13:14 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-539e63c8678so2076594e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732266792; x=1732871592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
        b=LBUmgVqDgZZGn1HMvoixUZMSwtNPe+KNKR7sWJBJKPxw/5m49zTdPozyZeqZnVQ4Kx
         FyOBLRrCTQ52GbZDplCBs1kQwAu6wLdZSCTcLUaTOraSagNOwCnEsjSgDbfYxbeefCRk
         7LBMC9GIodJb5QLDrqHoaCr0ywF0Z6VA6Rk2lAzqeskddy4FUZkuZhv3+QzcpRN/hKTX
         aipWBnRG5KSHACzQLyPpL+l/2ec7RelaSkqe5gLAdxBoBbSjFefczRduO6k3hinkeHxo
         /9jHR6MamhwL3Wcw+nrZX7k5THEw62e0rInhf/rcF6HMtjCGPsVC9S1mC5aNePL9u2l/
         DgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732266792; x=1732871592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6W3bqmSBPUsE+fVjxjecsCfWlJC1+mE/7mRAcZKJqvU=;
        b=qS5Gwz+CldXjNhi0G3APBRCL7Z7wZ1DCpyXPgDyjFz57a3FLPdRfI9WaiTswuY5+qC
         GBVw7Erj+9qrvdYH3EHbkzGzPRzivRE/WsPXlnjjLLsu5l2YMl8hpISb1BcunjPMUI/B
         sXc3OT2iPnLqy5esZsGK3m8PSlDEmzqn1MhK8tbOKb77gEixB+g5sEd9TU3ZyWteQ1zo
         Tql/Z4Czq333+bSz4ySyeqqMeyt9tNjPn8jFwSB3SNNHnkm6R0RFuqUktwkMRkEaJm3W
         u6hwmdcD9ZWptjYAwiyTRZrr6MVhAXLSR+6yXeEX75aC6GkwQ/I69rZsqqOmOhYeYcrF
         KEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG9JMqZPTBUsKjTvtOwBO5aeQFQW+zfmXSz3SPybzaGaGdD/DVIV7LJd6fBe10X0OVPM5Ju2kZ4TEiICX9uDFU@lists.infradead.org
X-Gm-Message-State: AOJu0YyPim+DKhcjz/FgC95+HlADW6IvH81DHg1+nsWg5Y+lYNOABnOq
	8uK35XuKSvCzLTNRXuLmsq6x8RGiPch3Kq7zD9wT9vIdtNjHZ/g0AvKFId/sUWo=
X-Gm-Gg: ASbGnctec4yapbkC8i+fQWU2J2rxg1XugoV4sEgXZePsbMwnDAw3jkCcq3Q0rT4/dUl
	VYdCILHDHz5AUGxeYgW+ByLc/gZn/C6/4Nd0BykPyEzUy+gvtcgqnMs8TjUMmvDgEL4mpGFIdVT
	qTjQXzkWCGqhBbfTDbXL9yhFPdsxmdraenTeAMGGlj0PbmasxLSXG3TCVOELJJYFxawzP64Vpl1
	ViQKODLQ/zbqqJo+VGakrNrzIxjaFy1EOB1AjIGu2F3ebqZXcRR5nqBng==
X-Google-Smtp-Source: AGHT+IF9ThfWnsEQI6UyED7pA9h6Wf7FpGWyg1saUJdib/WRVSKuqZ2ksQYV61QNiecHx3mAhZLedA==
X-Received: by 2002:ac2:568f:0:b0:53d:a024:ddb2 with SMTP id 2adb3069b0e04-53dd37a6c3bmr1142300e87.24.1732266791780;
        Fri, 22 Nov 2024 01:13:11 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451386sm299530e87.77.2024.11.22.01.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 01:13:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 22 Nov 2024 11:12:57 +0200
Subject: [PATCH v4 01/10] drm/tests: hdmi: handle empty modes in
 find_preferred_mode()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-hdmi-mode-valid-v4-1-2fee4a83ab79@linaro.org>
References: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
In-Reply-To: <20241122-hdmi-mode-valid-v4-0-2fee4a83ab79@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cHHtfh9y6/Xe5pWD0imwgSoaSzh5tOQpdFVxQZ5xP/s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnQEshW4nqOdXL0T4IVeWcFtdcIU865J/geaZOs
 dJST3YPq1iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ0BLIQAKCRCLPIo+Aiko
 1aCMB/4mAMbVULeSJaQKgD/thf0SdySNUWeV6CvGlRgfogZod1ZMqfju5iE0YiqI7xy28Ycv74E
 B0vuUvxyNt+MKQbKrGS8BTlEhjMqCpiI/CHQBw9F6k2HpfGFkrWHDIoMHaaoW5DaERqX6xacG/s
 DhPpiLyKV55OciJGf0cj7Okd9I+OzcIvE3aVDAo8uG6emEXX0UO2hya4rXHN74Rwop72ki1rJn+
 7Co2fSv5VYDWughxDBVCLzuLe6u6WeSCbhxlSg97MXogFyunITxmcV5RlLk5Z5TQWDhuX4634jq
 pnHjEf3jhAkLQer5IkvtUgJ1d8uMHBw5CJY0WH/gX/wWSOgj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_011313_714126_E1E2F5CE 
X-CRM114-Status: GOOD (  12.26  )
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

If the connector->modes list is empty, then list_first_entry() returns a
bogus entry. Change that to use list_first_entry_or_null().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 294773342e710dc56772f839c2db9c2e487bbc1e..1e77689af6549f162eb3026c7bd2bbd59516ed98 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -46,7 +46,7 @@ static struct drm_display_mode *find_preferred_mode(struct drm_connector *connec
 	struct drm_display_mode *mode, *preferred;
 
 	mutex_lock(&drm->mode_config.mutex);
-	preferred = list_first_entry(&connector->modes, struct drm_display_mode, head);
+	preferred = list_first_entry_or_null(&connector->modes, struct drm_display_mode, head);
 	list_for_each_entry(mode, &connector->modes, head)
 		if (mode->type & DRM_MODE_TYPE_PREFERRED)
 			preferred = mode;

-- 
2.39.5


