Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7790DCFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0VXG7M0+edMYKBQpiJHMGtp1VEyRPMm6kVJ0JBtPBU=; b=U3rzGl/gYWM5ylG234IccCkwpD
	HdehIZfPwize+z6cHQEYEb8w8UiS5SCjHSVYykk9omZyegpB5cRWLOBw6x3CYwun7hI55i5dAXwpN
	48O8HZmosG5bS8igdX0ulWHr6V7Wslcpw5rtQKuXMTDizh9r/efmphntqDN0dVN0wJ+me8bYcoJJk
	O0ST97VabQSYfaQraoWDSW1t48aw3+pbsFYBFlhoiqkprL0cQvzH3G3vX4Dh9sC1ipyLLys0LwHSZ
	QZxCQeYG0TPO9fkGin7/9vLSuUo5xfTl/YR1kpEpVFC19t5WMYDJUpijjjNIJQODKEo9BTkTIJcn5
	TsFE2XCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3grs-0000000FdEV-3FzW;
	Wed, 23 Oct 2024 19:18:04 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYl-0000000FDE8-231d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:14 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37d4c1b1455so4669242f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702209; x=1730307009; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m0VXG7M0+edMYKBQpiJHMGtp1VEyRPMm6kVJ0JBtPBU=;
        b=NgDkx5J7jroME8S1JGXq6CV7chPNPW1OCRahJsBaX5uu+RYPGa7h0WF7mYf3OPsuc7
         IeGJIa5QcS3PiDUqaKjyKV62f+Nhs2IoR9ZNm/T0HmGSO6Xl5FTLbUXFBcXNKfuaFPt5
         vCfayb6PwFbEen2Q+02vhVtE46PruFZ/BHeKqKVyJ3ejV/oMbzeYaktuOjpVx5Owc7Aq
         StgBErEy86YZPvKIon5bapuegbbO1wliHYIkYfq45jvEnFstEKODEQUPFywrwDN5DgYz
         ty/RkvJ0mcrGe7o6PxAU3AUDO7FjWf4/giDyQgLgoWTUd8V5iWqBBEqoM3JDIMtAjPfR
         cTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702209; x=1730307009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0VXG7M0+edMYKBQpiJHMGtp1VEyRPMm6kVJ0JBtPBU=;
        b=BU6f8LfCtuib8M1P6BCdqPjY4v963wI+yQwiHVbvFcQNAzBKXBzDRmyKuidpzP2V2t
         FEDbIBFW46/2uFvsLB4IzLUqEtu+8NH2OPQnOdUwzL5udb0HRxBheNFHeKOfdZm+I6uG
         Jg4ujRrXSdcVhq0LV8FE2Z4ffK/WCJYDRdNTwRmemJkZxFJl+AXe9besrV+MQx/3rlct
         Yy5aCN0nOZJgERgzI95A+zTKSnS/6Bmcm1PUukH+lK+yR6MTz/1FVOvxIDXU1uffAGsZ
         jBAuUoB93roZ/SM45RHZ0CUTtqBXXlkVxZlkza5OAolG7y2/91Ekcdx7KSfslRqFsIgM
         L0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeOSAmQ+L365JuAE7Pk6cDpG8txi1I3yiSJq8uBW+r45dEMW2phRvdu5g8y9D+pbiKDqXtZl/Jwc+Ccc2ugeiy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8slkgCVUHqFDAv6x1Ph3AQKMcD0ri923v+ES4UCWydJ8veoNi
	/Lk/OGjtHE5mfDaXFNWj4Md6wrgfuElgBC/PSx7sxLOt/hGLRkOvXBqSW5mDi18=
X-Google-Smtp-Source: AGHT+IERCELF/aNULiFYaJhFKCUgkKnhHnsR2hcb6th/CbnCs93DrujrebahUME8WNgVcpsKAm29Eg==
X-Received: by 2002:a05:6000:1887:b0:37c:f933:48a9 with SMTP id ffacd0b85a97d-37efcef117cmr2285226f8f.1.1729702209268;
        Wed, 23 Oct 2024 09:50:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:08 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:49:58 +0100
Subject: [PATCH 01/37] drm/vc4: Limit max_bpc to 8 on Pi0-3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-1-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_095011_844239_CBA22017 
X-CRM114-Status: GOOD (  12.33  )
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

Pi 0-3 have no deep colour support and only 24bpp output,
so max_bpc should remain as 8, and no HDR metadata property
should be registered.

Fixes: ba8c0faebbb0 ("drm/vc4: hdmi: Enable 10/12 bpc output")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 62b82b1eeb36..6ebcc38be291 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -640,6 +640,11 @@ static int vc4_hdmi_connector_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	if (vc4_hdmi->variant->supports_hdr)
+		drm_connector_attach_max_bpc_property(connector, 8, 12);
+	else
+		drm_connector_attach_max_bpc_property(connector, 8, 8);
+
 	drm_connector_attach_encoder(connector, encoder);
 
 	return 0;

-- 
2.34.1


