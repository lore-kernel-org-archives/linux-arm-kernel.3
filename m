Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B812D149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vbQi4zffHZmgrFZhlEz3qZo9PncYkAwxBP66oHpwT0=; b=CyhBbKsV5CMk10o9OnGJl/c/4j
	ZBrGWOXn8Q6Uwr/s4yD/IDJGXT8xOzgBs/jYSvxFVYSB9X2+Bq+t1yJKlJwDql/D9lqkN3HtVyNVa
	J+QGI2b9cVh/e3T+kKw3NRki0JBfVnD3kPM4ytVsGkAlQCuzPerYHRsdpO/2ElMlieogKVp6Ljusp
	nrblTL2g6T4srRilNZZfZ2TBF/Mr8+Czqg+pIf4FGqkpw4zxGDE6HaEu6qMa545n2xkd2VlGCzDmt
	dlPiaH/EPQNVl+rw389TKIzk024j8IqR82SnV1CGtBzVKAR3Tj68MTlhFnoIot1t19E6rhHsiZUoK
	Emu7Mi2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Oq1-00000004lOi-1TXK;
	Fri, 25 Oct 2024 18:15:05 +0000
Received: from mail-wm1-f52.google.com ([209.85.128.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvJ-00000004Y1g-2aA5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:31 +0000
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155afca99so22978805e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876587; x=1730481387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vbQi4zffHZmgrFZhlEz3qZo9PncYkAwxBP66oHpwT0=;
        b=WG40k2a4oQn4kztMND/p3Zsr9UDZc749uUTcArdaPOzK2zKiONL0xKSNJQchHwzGim
         0NjX1usqwFIShPJ92hWVMBXKvcu2+Z0H0e09ggTK7NBdItm6u/vzUgY/zkHD19X6mlGf
         9xCKv2d4MxNjrUioqv3iMvtxnw7YgoHnY0gXJ+EbypyHTX4tJ898/g3xpsc0SgmRiJAX
         DE46msR34ayxxPntZP8lU338DhaSaZnE4tvHtAjb9zrD+y8muGUcmN+6pNVVi8Pq9x31
         Hq2bX8CeaDfdnhE9y0DI24q6pAM612wBDUswIhi1qzS+ki2OEZxHei/HvCSIEllbN8xX
         xrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876587; x=1730481387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0vbQi4zffHZmgrFZhlEz3qZo9PncYkAwxBP66oHpwT0=;
        b=mgsV/4nHCaxBoI6DYWdwEg3LzkJTD2syrosm2dSUaUNs9WepWHxP8KFKdXUHVQRAPV
         Qp4ER+lN52SaDeQIYMIpTdm8B22j1vljCGihpBK3/HNCWI7jUOXQ2PU+xeY/9zeu3Yp+
         +OYAtnNl6qigk3EblBDXqqnde2dUV4nAfiMkJlVTAg6eiOkvBTYkTj5tivknJDT4O2jw
         bA9czXEAn9IDuxiBvO9FP6lW0wr2ADlhYk/CS5EGOG9bic+jOSMlNuUNHTeqIeiqvJQ7
         DkIpZPOMmpAlKu46tOFqKTbw+Lj800mprxDkIDlCCRXylAPuKurrKD55ajBz9QEwRJ4L
         ahgw==
X-Forwarded-Encrypted: i=1; AJvYcCW5XWhkjnaEgY2lO6areMNroKqz+YYQpCNu5l3wvQFJ/8Lyqf69Dr008WsBboQDysT/ZpQEISdapib248rHrXZE@lists.infradead.org
X-Gm-Message-State: AOJu0YzS+UBXjbedn9CsfnDAvuyYvcswdxGidsD7HlKtZ408bbWJQ7tG
	WcBPKV1H3k8LoN9hbQveBTQzNLP8tkp3VMiHLE6Z9BUoWgZJF8rlpkmzt4ak4x0=
X-Google-Smtp-Source: AGHT+IH+29oPVsRqs2fqHrAWDnK5QD/g1okRZ89yJvrj7HxIWsx6pgAGD3QO00ZuQ026KdKRThmfow==
X-Received: by 2002:adf:ec8f:0:b0:374:cd3c:db6d with SMTP id ffacd0b85a97d-3803abc51c6mr5147977f8f.6.1729876587557;
        Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:27 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:58 +0100
Subject: [PATCH v2 27/36] drm/vc4: Enable bg_fill if there are no planes
 enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-27-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101629_824968_3BE740C4 
X-CRM114-Status: GOOD (  14.95  )
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

The default was to have enable_bg_fill disabled and the first
plane set it if it wasn't opaque and covering the whole screen.
However that meant that if no planes were enabled, then the
background fill wasn't enabled, and would give a striped
output from the uninitialised output buffer.

Initialise it to enabled to avoid this.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 2493ac17d78f..c8bc2b48648f 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -936,7 +936,7 @@ void vc4_hvs_atomic_flush(struct drm_crtc *crtc,
 	struct drm_plane *plane;
 	struct vc4_plane_state *vc4_plane_state;
 	bool debug_dump_regs = false;
-	bool enable_bg_fill = false;
+	bool enable_bg_fill = true;
 	u32 __iomem *dlist_start = vc4->hvs->dlist + vc4_state->mm.start;
 	u32 __iomem *dlist_next = dlist_start;
 	unsigned int zpos = 0;

-- 
2.34.1


