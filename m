Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4529CFA45D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=; b=k6ozXyp5fgFlJgEfOqzYPzW+Dy
	uGKfyze+UQCdeF5/coBiEk5KAncp3IVRGfXqeRdQ8UgHMDjJ5R0eDKLULBxpP88boql9F+FwdK5do
	DQXZdckfWUCRH5BFUAv5KxXFZFxqhEnp8VrBCSd9r6OMZ7BgZgDXibCAnTYyF/juUnxB+twKyxnzc
	AbLTnvK4nrOJP95E5dZZvqtPv4qlZg/bi/+ehiqlA9XG5CkkApTTHp6Azk2egS4pI7KSrAi5qkc+F
	dTbu4IjUaKLNgJQq7ZqyDEyz55HfzDA2Z2pZYXTILZUEct/3VZLAGGIL/vYPuzwMGXdjlchxWumEw
	v3dhFBTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fbt-0000000FRyl-0aP4;
	Wed, 23 Oct 2024 17:57:29 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eYt-0000000FDJL-0c1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:20 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so70318555e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702218; x=1730307018; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=kjYftLd6y4+f367dVnWFm78sv+ZyROpdGHtmxaPto+l+3dim0shUS+Yn0k+g+C/Ev9
         H1zvyHNqlKpP/RKqPRTMrAv6NGj2UFOgpK/Io0V1h4HPHN3ca81dYTgZqKR3bA5EFrc3
         OCkLbv5AdSEUbpWDwpSP36CH8iAGHcENfFAmIaZdoNS5Uv9BkalZSM8AEboeUZnhFbhA
         F1Gxgx8tfL2oY3jYKqD2onnG7lWyloXcOkgOcbMLJ1nt/rp2eSXF9hvnB6FaSIwjKKVt
         feH17fiIshfy+xingmMzqSet1vZd6J5JUos3HgGvS6irDNPlnOCdqqhozhmPFtlRO5sR
         LE9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702218; x=1730307018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GUojHTwofpiEg2dwpNmSHs/emdcMv58M0L0R39wpRI=;
        b=WHJjT4lLbfagImTN8CjivX0610+7PbMkPWegnHtKuPXF6B1KzSPrvu+mWnrpMooKcg
         CJV/jh4YOb/IySXOtnmNt9eTVSWQPeu8l/SVOKid+v8Hr34MaWJShF+nOpAQld6o3+w1
         ZGPzkSXhZdPduO5jejiNekSlPxu7Y+IRTAC6A9Aa+5ypOvbu9r4Cqvp0amV3oJCdQxDE
         Q0i5uSxupef95QqPSvA4cjnrM4iR8pHUGJ6onTGyV19cI8zhowjKhMPjWvPI9gJpYc9K
         0u0iEmZobMXl6ns8SPtEMbA9uEFPKQtqJc79Pk2TT+BOELl4dDDldjrlD8lr5ttzg4bw
         ICig==
X-Forwarded-Encrypted: i=1; AJvYcCXnqmXemF0RFdDay8EHKFtFxKbAguqOtLc7VoEw/oZsl8OZJD/Gk6Zqzcr4vQiKKC528z6++KLnjIKkk9DWIc9R@lists.infradead.org
X-Gm-Message-State: AOJu0YzCXqrZHTCeVkdsfpQSMwD3TOmypLg9mZnnpmMp1+CMhS3OM9o+
	+qhJJc+sNhBFct7fFABOATYIdoUt9rnaCZ7i+gtyDgx6lFe444KcRJ6CWunKnlo=
X-Google-Smtp-Source: AGHT+IGRXt+xjnUqmt434Ic5Jf/wCUKhHYDJmvv7fkNd+2lWuUEM38OLLC7VPFEj10VF2wQhrQ46vw==
X-Received: by 2002:a05:600c:1d9b:b0:431:4e82:ffa6 with SMTP id 5b1f17b1804b1-43184188334mr32238395e9.24.1729702217658;
        Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:17 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:07 +0100
Subject: [PATCH 10/37] drm/vc4: drv: Support BCM2712
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-10-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095019_345426_788391E8 
X-CRM114-Status: GOOD (  13.91  )
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


