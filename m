Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C071C4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3REs2qGjomqbxDR0NSQ8ilL5HrSoQvM8Tf4GumzfTic=; b=TvRvyexIbrzSVL760VskNWR0UR
	/gbDcCDZp3sMawhROvBhcRmqUexrOHeRfg4WAKG7OF7Sd91Lv3GcEiuuctZISPv7T2ZezDDnNlFD9
	eQFkTrMGtHhxgDPPpvVT8wXpPRYv/KkcQDSRZ4HCQlGVX8lI8nsWRg6OB0QfiMkAh2dFPgGsS+Pa3
	9LwL7h9+UthxVVx1Nrse3Rot0VMOTOETkxt/QcJqHvZhqmdZ6/Hgu72Euca8XZbG2N79PoFuW+avx
	B3VNH7Ly5GFv8WmKka70yFQGfPguBcfXCmGs9MqElAOTNJXCBwQ5A2WPL6KjdWDm0SgcCbbMXkf1/
	LyjXRKGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTrZ-0000000BV3E-0xY6;
	Wed, 22 Jul 2026 10:07:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTrX-0000000BV2s-0SvE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 10:07:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4956869750eso10705315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 03:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784714856; x=1785319656; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3REs2qGjomqbxDR0NSQ8ilL5HrSoQvM8Tf4GumzfTic=;
        b=tcT/cWqt0L2/Y2aJOG70CVMptD7YZtzOGmDOcGLbMW2SBO5706pdGzBgf0aNasx2tP
         jcW1g7CzHIRy55cONlwrNF4B1GdYty6k3CX055tcB2qJs5Jg+M6imyZhMs/2X7kwSgPv
         L4cH7iL69ZY0GrVsRR6GC6Oc2PVADP+DZ2Ad8qVt/AzHX/S6NsNyD6zsiST10YQgNvWH
         9SjbIaVZNhmAsat1ZsgJXR9uktSsSg8IpazHCy1c0TFWIIPcRC62ll2fJDqSDUgdSdaM
         bFZEzDOF0HbbvSaV3OvawYyF6mP3FOm/9kBX+czBTi9S3CDAWwnkRJUva1L/hDLzr1Ji
         lTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784714856; x=1785319656;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3REs2qGjomqbxDR0NSQ8ilL5HrSoQvM8Tf4GumzfTic=;
        b=P7ACaj142X6p+9hkBt79suG/Ab8vTJGDJEqcaE5KqDFmOY4uwHJnFXH2PV7s2FE/h6
         LoTxn/hBnGnfKyA2bjORpZa+io0I8dzVqV/8cRmjsLCS1916BiO5+Mp8kJps5QLipri7
         Qi9ANOCTQfKa+MbYlW8SukEnF9YWnAIHllGzsfF5L/cV0tbuOGEftDdz2l+GBnT//xeP
         i9gXl8dc/jP9VgBdYNaaAszi9+ovY30cT4bwunr4CpNhS2KzzSp9RrOEk2tNeVP2WZMk
         IgQ9hqpx+PgnsLqooWLnvNcytMHKreYV3Zr7EGhL3EchhGjbftUgibKYGEgYEt8aenxc
         iM8g==
X-Forwarded-Encrypted: i=1; AHgh+Rqfr1mQh/9ZlmuBPkrLJdPS8vD2hAaVrezLm+m+8FXqCX1aaTeGNU83F736zOoRzkUe6IaTjz28mECM0W0154ln@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/OU0RUDk/WjIpAjVd+6D0xWQlmo5qmZAaBBCB3b+MMb58yhnE
	BPRPltorImYVPjh5RDTcHyhe/O8+klbNRiDtlKJaMIGgq7x+9iR3StPAS0Ula/oVorE=
X-Gm-Gg: AR+sD13lGSTlk/B2DjJehCHq0jOKZbhxb+qZUf7ktt3X5Oy20KC2TzZ32Vb5/YkYK1w
	2IIFht/YmFTrAxl014QuoXUsO4YjakYoPFkcBnGtqEfowiLbrGiiFbdYRkmBcXVEmTy3ly/RLxn
	fl4hSjT7y7Tbb8SCU9Q3uVt21YuHzj9AkOLZh61URSAm+N9c++WsQuJe2vPo5NfjzdwzQxa0IZM
	rLOoeDm/WZgySrRAPLsnK5eDpzM2r+HZ5+ajBnZpysVk1/DOuwPhP4SCOc3A7n70MWwpTw+OANh
	IMkxJPw3+lCt1OzAjG8I/ekQdxfjMC8w4nWuXJ2NO63YRJsxUnJfXEzdcOa3EG4j5QcQN7zwNG2
	vfb2gWpk9pbf+H/K5Xb8wC1L8NVTDhvl/25VMrQp/6pUj3cICEb87jC6LOmWJPeydX3JoXNqHJO
	AszO7ViF852M8URrhLPsFFm8k=
X-Received: by 2002:a05:600c:4585:b0:495:3eb2:b763 with SMTP id 5b1f17b1804b1-4954a50c51bmr246233625e9.21.1784714856416;
        Wed, 22 Jul 2026 03:07:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f25b6sm56086095e9.2.2026.07.22.03.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:07:36 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 22 Jul 2026 12:07:30 +0200
Subject: [PATCH] drm: fix missing header include for drm_panel_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGGWYGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3YLEvNQc3bTMCt3s3GIor6C0RNfYItnA3NLE0CjNwlgJqLugKBW
 oCGxydCyEX1yalJWaXAIyTqm2FgBMJKMtewAAAA==
X-Change-ID: 20260722-panel-fix-kms-panel-put-38c079412f83
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Albert Esteve <aesteve@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=g7/eALbrieKWG+a53MxxDem/J0HE9S+G/F/iwhj41eQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqYJZnXQr6E0bZ+prdCer0OHkH30wy9EoEP5dhovRB
 +qgdEB+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamCWZwAKCRB33NvayMhJ0e1OEA
 CcwEihOXsJfN3H92DygMrdNgASLoPt8ng4ShFdeyVmwcjH8KAOi3alcKUuGqlI/uYLI1vQkeuFDoYx
 np3ywKiZ6jvYrYwGnysbJ52twLrF7lLrnT8yISsZckIsN60fckNkkfIaJhufdLhGnUM+pdf6pGiofI
 vKy4+ZCidkkSLe4/YgWs6gIMWC6YAiKPH6BuwjZNv3UlCKG8XOOSp4+cUN6o8fnHZ2WVJ7vN6s0XMY
 Sf0a4Tg2IBuQxUMMGiNR/5Fi84os8S8gjs5x2b+xYGOO5m3HrpdGJaC2PRTxevHKW6R9CSEEHGKG8r
 1/INHJX3YzTuFVTM04IFizTk5WA2W3lOnsQhAq1Hh3yEV04VP91kO5mVBd0LBLkzRytLhoxyQG0HiX
 6u1+iqwpf+YGMlvoljOeDydqSqTMp6ATkk6da1Hl9EYEy/CeCU2ot2/bQQGq2xo0usQwxBST89AQen
 VqoZSjf4fMZHm+X7MHc8DgbOdPqag2vg5bfWaxEjL4oq/Wuj49t88YE5ugb1oEKdSz/TMd7uztn00p
 qWIzKj1vrbKRCTwspahUEKbqt8GsJtVIRCbq9Ct5r24qvpr4RjCT+puehfixjtrKyKul26i/UrUvzL
 LvXcG3SJjZYTaoj7YDfveJ1zPlTP4kvr33BPm0gtjqCv2B1rcPV9cMGO2t7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_030739_206513_ADEB25E8 
X-CRM114-Status: UNSURE (   9.78  )
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

Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference").

Fixes: b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c   | 1 +
 drivers/gpu/drm/stm/ltdc.c          | 1 +
 3 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
index 01e0c10b6ea1..7c5a6e2bc89a 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index 7cb19c15bf39..8b4a500347fb 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -29,6 +29,7 @@
 #include <drm/drm_mode_config.h>
 #include <drm/drm_module.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index daf198edb42f..8818dcf98da7 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -34,6 +34,7 @@
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>

---
base-commit: 0f065acf44aeb8c32691d88cc87004fd2e54e902
change-id: 20260722-panel-fix-kms-panel-put-38c079412f83

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


