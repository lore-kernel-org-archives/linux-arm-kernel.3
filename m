Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97CBE67492
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 00:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fn3LhrswAJ6uldcqCvizMSK2GK9rmkw5c0L7tOFDyzA=; b=zLT3IYxjmks2f8fxM4ciLypM45
	DOjiXBSzTQXdXxhW3UUd4E+WwJGBXNNPs2JTeulST1E7SMW+EGQLkrLp+UlW/JbZLMcu668FoOk/O
	Fgx9XxVJpFfR+mapqh311N0cc4v8gsRZ17SOZa4mizg0WUuWb7TtSyqwSDK9E682GUh/mHMJvLTET
	wsEkz7AZf9GFbdZFM0vLmmTOog5mGydWgarhNDYEOa3YCklmOTnL/fQhJ9lK7NZfJE7gqmn8+oV76
	d+ztNgHGc0z80e48L+K3m1zrCQT3w083zVeVeH6PgqoJEOZL08sEflmyye36TnFItn+Yc1F31Qwak
	HIITKWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fd9-00000005JVg-09RK;
	Fri, 01 Nov 2024 00:35:11 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6fTc-00000005HsA-39k1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 00:25:22 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-539f72c913aso2407689e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 17:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730420719; x=1731025519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fn3LhrswAJ6uldcqCvizMSK2GK9rmkw5c0L7tOFDyzA=;
        b=QL050i2xF+yNs726eL5tTfVEE6+wK9N+nL57dAe78hLxd5iuXr+Zv54e77knm1STl7
         SZI0OfPHhdp5eg+RbXQgqxFN7N4AT4KAMpQMk8Pxhgtah8cM+VQCB/niyR6BmOZAyzs5
         4E1ilWab+V44JbNoi6mSI6lzygbKdRmsMLDvOuXuiVLT/xzNKSC10ii+4RVS3Z02ZgEF
         VnXy52QCHElVLQqkHBB9J9tmdYVnOnC/7dBpozhVMSFZ+bkxWfk0TrqfK8BBu64YCplT
         BAIddWqYYaEyJEBoOlWTv72nN7++rx/aQPQKJ08Y7RwMU54KCqUZL6peLN+CVw9qoqR8
         MQFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730420719; x=1731025519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fn3LhrswAJ6uldcqCvizMSK2GK9rmkw5c0L7tOFDyzA=;
        b=OmxycvqMivPEFAPTQsQUMHhDEQs7djDk2xRiYF6sT1bBrywZdbljVYHj4XSzF6GsBc
         53ze0hqC+m014HiV8OLK9TlQw0n9sQNjpgQZHZLBsWG/l9CSQ4Z+Qeposq7+cYADjNtw
         afcuXHUr4/LZQAi+ib5HswrYuLceK+JStzWi1KxVSuCSXci+AynoAypD6uHHfSRpAFt6
         3yFZPirEysFdn7vOE15fh9u4zIxa6dFn5VudsUidpHF8E3/qkDWLbDE/WQRvAl8cb+fJ
         hWFchUTQa86b/Vk7JAisJXnI+06kY+zG9XDTLMnyyDIQ89yUNBw3+xiV1pMHlaQgjedT
         llFA==
X-Forwarded-Encrypted: i=1; AJvYcCXWr1B1aAAb8GEEmLzHNJDCE7Q4HEUGwwtAE8Lsxi2sumVI0jNwhjdeff22iqGETBtuRKGWZxEaXKHPcKrtU7xZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwIG8m34ghzozrJMalA4Q470TX4J4vFdWDDnvNS+OrDneM6/j46
	GRw0stxg/EPut31U5Kr4c+XYAZXrpGv5Avu2fsVZKjpVAiqsB+qPmvwHDc6Tzjk=
X-Google-Smtp-Source: AGHT+IFLGk370oJX7M/fOs9yssB9UroX/yB5UrOBpoOmI1k9rBV3Tjw44Gv6j6p0t2YpMLg9rxw7rw==
X-Received: by 2002:a05:6512:33d1:b0:539:e873:6e6 with SMTP id 2adb3069b0e04-53b34a1953amr11874626e87.43.1730420718759;
        Thu, 31 Oct 2024 17:25:18 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce489sm371153e87.127.2024.10.31.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 17:25:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 01 Nov 2024 02:25:07 +0200
Subject: [PATCH v2 4/6] drm/display: bridge_connector: use
 drm_bridge_connector_mode_valid()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-hdmi-mode-valid-v2-4-a6478fd20fa6@linaro.org>
References: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
In-Reply-To: <20241101-hdmi-mode-valid-v2-0-a6478fd20fa6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1823;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Q9ji/NbRYwF1TNZj9n1TpgdHLjl20UItRRGWWpdDvcQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJB/hTl+xfDm56PcvCfyLR4ruPHvUICtQpdeUo
 JnDXQfGiVGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyQf4QAKCRCLPIo+Aiko
 1UGsB/0ZWiyvOHwonVjOKqiPjNjrJWmuBjMDfQVw3/uHD8NPKzxvZ9Hr3iL0YRRXMuK3C+IGqcZ
 1xDNk2AzPqJOGZgbbGmpLSH/Vfq6va9o3zKRASXyCKqCYVPLYrHwhfxwJJ+TqXvMYWQrGm35SKi
 jUViyUXSxon0WYJwpk/vcmqyB+DineqeodUGO0o6BRHs0eKeAqqkT/GiDQapFvbC7uizl6AHCjB
 i6jc11/scL3bkp27MSP3HSuKmIMjtfX9dg/uyl7UEyOEM5tMkpbonBX96LPrwSzUbsRnAefU8O2
 LLRA4GeogLOARJb31LmT0HUrWNwo2OHAqrb3GA19J0T6xiHS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_172520_825909_70A512F2 
X-CRM114-Status: GOOD (  14.45  )
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

Use new drm_bridge_connector_mode_valid() helper if there is a HDMI
bridge in the bridge chain. This removes the need to perform TMDS char
rate check manually in the bridge driver.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 320c297008aaa8b6ef5b1f4c71928849b202e8ac..512ced87ea18c74e182a558a686ddd83de891814 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -18,6 +18,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 /**
@@ -299,9 +300,22 @@ static int drm_bridge_connector_get_modes(struct drm_connector *connector)
 	return 0;
 }
 
+static enum drm_mode_status
+drm_bridge_connector_mode_valid(struct drm_connector *connector,
+				struct drm_display_mode *mode)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+
+	if (bridge_connector->bridge_hdmi)
+		return drm_hdmi_connector_mode_valid(connector, mode);
+
+	return MODE_OK;
+}
+
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
-	/* No need for .mode_valid(), the bridges are checked by the core. */
+	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,
 };

-- 
2.39.5


