Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09BAD149CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 18:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=; b=iOuzfGRy0zmlRT/shbCkM3Z0fl
	VhMUDrUEccLB5Td4TreRXJ1WQLJFeMBU7ZXSvd5kKrirwOeSniYHcoTg2PA0Ie7Azd9dlw3UplukU
	Xl3hxFjsGLHYse6cym+lUScI0/5B7jne3YCNSO3fQWql42UCmeqR4LixYMRuk+llDLeTcmTLk2Zze
	XYMheSABOb2HPFlDOCqMoA5iwlhu97qDdPdDreSj98jR9MeFkgQ9O5gIpLlouBEZft8Y5gj7lFUwI
	5XjHGnPBmTAgRAh4ICNWvdO7QaKyNXLewpcTE+pf9SEzeB/KfBaVh92ghFXO2pgJVIgaQWVULMnNG
	Xqeox2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Ojo-00000004kHP-1gRT;
	Fri, 25 Oct 2024 18:08:40 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nv2-00000004Xoy-2DUH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:14 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-37d473c4bb6so1934642f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876570; x=1730481370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=G4ILrkAVT7oZ7htojwmgxuoh+G9l6uGdNo7ouYgI5b/Poee2hp2mgWoKdNCQSAdbPQ
         OCD49bwc2ewsLHCOeIzd+azoSYJTwiegdGhh2KGZZbS5+M5mOSLe5CYx/nfxWX8o31gC
         qdIdnTb3zOu5t6qh94K9zIVHwIykM15vkYFevNB2dK6WsaQiWTYikRldPwquAhQE6eTA
         uIDGa9PKoCkxe40KHYmdeFLOu5iMtEgfs4Mj4aIRb1zwLP8uRZZwgOzd1A+QYWFkzs1S
         aLMAvCFs1KQvZdWuswVp/jF6M+aIEDPz0ycipVqS0n2v+Mf9gJ0N6lrvSosc4e4ha4mz
         NvyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876570; x=1730481370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=sSvuWzbifjAmqMf0qX+I7fiEDc7ICo1UOGHpc2hK5V0bkHni6ajhh0O7BBq4ryuBKM
         ys/k755hXMXEriCOzuU3t1DS7WTR8TVG/ocqNb9o8hrp1NsAbF9Pf9nKSKz+/fHAfGMA
         C/3nokuc1AdRSWZrzRIHkBeMuofaR8Tb3TwvZfJAXuGN/kJaIfzKUYgjF1xyGYY48cy+
         72ljwk3vHdBko10BylXYjYeuMb5HT6AwqGyXJHiQZlMlPv0EimFkbpj2NNUuP0c3Z86e
         CaSFfTKeP9CZRMre4VI1c5oTsskxyW7fZW1clj5I7ej/Lwkn7dGKiR4anvtzf7SZeyJO
         9dlg==
X-Forwarded-Encrypted: i=1; AJvYcCXxJ+ing0aOsJ4OQxsLLCkwHwcBnYKW0ETvQFUbw4rT06ttrzVaszG/29ng+EMb6uYnbXp1JREc9neyINUbCTQF@lists.infradead.org
X-Gm-Message-State: AOJu0YzYdB4T/rbv3xpl05IbCyDqNRJRBqYIx/e4CmRm66ky6cZ4y8JM
	CoAUpsNvSQJYOOwnMhgkvaaltELWpva+1R4Tk9oLriHqPVlCUCHswFyaAtTI2OU=
X-Google-Smtp-Source: AGHT+IGCwZV5fbmeF0D4Xme2MrSeeStQPCABILFJnZu8X/UbpKfmCgg7tE2q1WXeLJuU2hjtaGAprQ==
X-Received: by 2002:a5d:56d2:0:b0:37e:f4a1:2b58 with SMTP id ffacd0b85a97d-38061172aa9mr141238f8f.16.1729876569829;
        Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:09 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:40 +0100
Subject: [PATCH v2 09/36] drm/vc4: drv: Support BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-9-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_101612_580068_A6B41332 
X-CRM114-Status: GOOD (  14.15  )
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

From: Maxime Ripard <mripard@kernel.org>

The BCM2712 has an improved display pipeline, most notably with a
different HVS and only HDMI and writeback outputs.

Let's introduce it as a new VideoCore generation and compatible.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 1 +
 drivers/gpu/drm/vc4/vc4_drv.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 3099292f22a5..417a5b456d80 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -460,6 +460,7 @@ static void vc4_platform_drm_shutdown(struct platform_device *pdev)
 
 static const struct of_device_id vc4_of_match[] = {
 	{ .compatible = "brcm,bcm2711-vc5", .data = (void *)VC4_GEN_5 },
+	{ .compatible = "brcm,bcm2712-vc6", .data = (void *)VC4_GEN_6_C },
 	{ .compatible = "brcm,bcm2835-vc4", .data = (void *)VC4_GEN_4 },
 	{ .compatible = "brcm,cygnus-vc4", .data = (void *)VC4_GEN_4 },
 	{},
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index c6be1997f1c7..14b0a7ef2683 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -84,6 +84,7 @@ struct vc4_perfmon {
 enum vc4_gen {
 	VC4_GEN_4,
 	VC4_GEN_5,
+	VC4_GEN_6_C,
 };
 
 struct vc4_dev {

-- 
2.34.1


