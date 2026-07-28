Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8295C54F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/vDpydFat5/uK8C1p3p1zTgtqbOgX5mMSI5XWbVTm1Y=; b=rZJGnI+LLwW/vzI22l+mADc7Vo
	M1/ZRK+zR+mjWYtu0hftJsBj7ASOoAJ9kj7nWhZ+IZcByUwkV4hfMB31kVEposKY/fLzcI9f18koj
	mTsbRGPgjbO+QADgux5UdtimOmnekPHEjdwvqK/aYNxXsP+QlG4PykZGkPL/LwF5AlBFST2Wrpfzd
	hmPUTB84Qa8fDbzVyejkpKeTKIpClGbKfxJkB3fe8S+EI5aou6X5yOBl2nD6FJV2KKy1PbfoEgu0P
	qr3C+D/Qj4ho5oSP6a15cUwtaZ268mhu/EHxm7So54Ye8FiFqEPnxflzB5YvpKZLOr1M/ojYsz3GS
	7JHsS/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnQ-00000005z2l-2eG5;
	Tue, 28 Jul 2026 17:40:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnN-00000005z0p-41QP;
	Tue, 28 Jul 2026 17:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260446;
	bh=82UQvWBJ0MN1pYXoI2DXOwYx1hsGX0PBoDUqkLLhFBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mu21yK1SEg5VeQed30/QcAKtXmRqrWBGD8M67GVg4kjJUijzfGbKE/4zD8RnK4ZeK
	 UZw0VZ/6EcSDJE8t9GrMBuIm0luX2hdOi4l8YtanhOISP+PAYNMGzZn7RE92/opflz
	 kQ9KGMsf7Iy5WCl+7lGKnTJAsc5VsiU10ie7WENOmsTEfPB2iMhLrgJszJQLDTb1Xz
	 mPaerNHaxsewlnaYy+DWIGEt8XA4jba2QWBkDRm9u7nhrHWp+Mo9tYM8iz+8mo3XcH
	 cj9SCVsUkFAVHflY0t4aVobtQbTMEm2g2fYvlW6XhJLuOApF/PN4oZxwOlNd1gNcPi
	 uxiGCLghQPbGg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 56B5117E02B6;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 0C6BD48002C; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:38 +0200
Subject: [PATCH v7 02/18] drm/bridge: synopsys: dw-dp: Cancel pending HPD
 work on unbind
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-2-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1017;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=82UQvWBJ0MN1pYXoI2DXOwYx1hsGX0PBoDUqkLLhFBs=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z0UJ+ZUP2t+PU7zzEBziXi8UH061gAQR
 9CLyIeGSZMKVYkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qa0jYP/i7t9nQt+mTyWACAAOt27Ov5Z1PLIbaK0rreHsu1ArzqqaDwQYUCxcRZ2NFNj/RI5rV
 qaoYMdUa5bclDy6lMYdk1XFK1DavAmBYs15gwyYL5Mv5CZ6FAQ+Ast7vlhL3NADDEaTHI6q02gI
 FvKY3R4cOGXA+PDStowafta6AIEq0Y5MIe/M/rTkI0KR2F0+AppOsFQrPNCYiy7by1d8N84rP/0
 m7xsh46S8ApNlwHx19EJjMXICnOr2r3ygcFs0WNQSSydgktxTA9fkaEOPDLDwN0HeP8rXPROEPO
 lHvyZa0vL8rgNVGa3T3n3C1YfVlB0/FmVUBuRh5ZLStzjG3Z2crRwbkznZc+Ai1tI/sFIdZWqqh
 N5kFg09QG1eYWKgA/lHumMR3TBSHbCpizhgZ9FDomk0GyXALDisNdi2woimNVLbpkR+EiYWgMpA
 K5hJu3vhQtAdAzpX+xsvlrEpDdqHxmuFACtQsfmz5d6KIUvCAoJtlGwlcuh5cIZu2zVeQ61F+4Z
 xR/C/3Xm5GcSiJhf5GP4DekCKVrHNI7cU3od8aqscLt12WCgrjNmwMd2kflhezDGO3NVvumyBQU
 xKuGnpdfCk9I9HvWMiX+vO8iUtJO66np7gSe8o8euPth5m1y6EY5mwK6brCB52HjxWo4z/ybPFN
 tQfOCQJD0i0lBRlaXV8wucQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_104050_157918_61CE6DA3 
X-CRM114-Status: UNSURE (   9.33  )
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

There is a race condition during device unbind: If the HPD interrupt
started an HPD worker exactly when the unbind happens, the worker
thread might access invalid resources. Avoid this by stopping any
pending work immediately after disabling the interrupt.

Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 67d9cd0bf5fd..8393f9c9b0f0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1996,6 +1996,7 @@ EXPORT_SYMBOL_GPL(dw_dp_bind);
 void dw_dp_unbind(struct dw_dp *dp)
 {
 	disable_irq(dp->irq);
+	cancel_work_sync(&dp->hpd_work);
 	phy_exit(dp->phy);
 	drm_dp_aux_unregister(&dp->aux);
 }

-- 
2.53.0


