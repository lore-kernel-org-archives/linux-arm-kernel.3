Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4300D149D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=; b=36u1Ck8RFU8sWytor5nS9lC1RR
	OA+PS+/8zKQ79iE0/2BumD4Ir8KIVMhveO5M3/+HaD8NHkED014n2xTRHtEneD3E/PZyrT72xU82N
	R4+cy+LxNkYVQL7MD4RU4K+qmiEJPvdRIf3BViQa7DyiminZAQDKneWwmiB0Hjdq4s9Mf+hR7X29d
	nQQhwpdaY+tXyNJ4U+SmxcJr5Tmb4jjXsp6AWPyR/Yt/1TrFURjXN9DzN7ppdoXfYOIRBC2vHm9L1
	+oTV8L5kQsUL67w6rZeOIg8p9y+t79757rjC4FTV7MaHVoSVasYRtQhOnV3HkhjTQINDyqpKR7rIB
	OsEVqxcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4OVw-00000004gmN-3RYY;
	Fri, 25 Oct 2024 17:54:20 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NvL-00000004Y33-3fI1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-37d3e8d923fso1438024f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876590; x=1730481390; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
        b=qLJSqjO3/nEum5VZlyNaikkdhJrh0rwQxR3VBFaIfw3/dasKQcn3mL2JzSR+z4rcOp
         Hn1G5p3XvtJWRVc7PCd5WkDHPfCporEX5unI5WBn+m1Jx7aptFgWcfhGSwJ6D5ZQWd9E
         ka/77i6/xfsCrRfSDKLF6J0vVyiAVyrN3cigPmSUDQAtqoAKvufQgdSReqbDVLaA+6Uh
         9TZUOOppcKwQ1kdEMKEeitrWw/6RVlEORHVXWv0YCLx9q5CrvkzjsY2gzaBMdn+ncxs0
         XM/+qSqHWaMUnnX+0TNOC5CAIliMUKDFlv7NG/ueRtkaFJRT3LuWYaTfrlum8emJ9oFw
         vB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876590; x=1730481390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RbWeszNg1J6sxJWK/VxJPpcVrMqaA756zdsXOCwMWo8=;
        b=exCjBNnzMdUuy+Z8n/ks3etEUlTLBhHLIwlqLiI+T1ZTyIFcktXDhk2kkHrzc48rW+
         LlHGCqMs2N7iGnyomUmI7Mi8goSFyXhbo8Al7rVlkGo4W7SA+1UXRFabl63u6XxG9oSk
         7WAoPAPCn5lg0dFdmnYfSFx2AXaxbPx7iWgkbIJs3/tBzFoVe5jgy5bwmUaXCNRNkk8m
         H5rR8WtOLvXROzz8miG6OwB79n2PxJevpi8ZIekCpwnmQijJixFTs4j8oMR8KMx+J3Ol
         oqZ5Led8BN4W3xn/SRyWMJCmkBCbduTkQ7N17uyECRuHxR5HOsnU75GDO+J1h0tXOSzf
         1org==
X-Forwarded-Encrypted: i=1; AJvYcCX+hHyPubNNRyuq+KWnIzSNtLzvZVI8vDhuGdwkOuliHzr9L/qTVLqPZrwGFZkVupLDOuvfCAQNxEcsOMDHrg9U@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9Qz0R8Kpi0ZqaAVO9Q4PmMlqbs5MkFs2brp49XLOYBu6vCnuK
	Y5hNhQxh6aDVBA0cMBs2Ko0MzdK0+RREWsOK0p/ty81i0fiWr34tsaMNpCoWqU0=
X-Google-Smtp-Source: AGHT+IFzLQpTgUQ1GGNf1FFbit3NR6SLMLyJmHIlrv1yJ02k6Akx4PaydsdQXONZLxuVWGUKuRmYsg==
X-Received: by 2002:a5d:5224:0:b0:37d:53dd:4dec with SMTP id ffacd0b85a97d-38061137a3emr110320f8f.15.1729876590408;
        Fri, 25 Oct 2024 10:16:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:29 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:16:01 +0100
Subject: [PATCH v2 30/36] clk: bcm: rpi: Allow cpufreq driver to also
 adjust gpu clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-30-35efa83c8fc0@raspberrypi.com>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dom Cobley <popcornmix@gmail.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_101632_027432_2F1EBF1B 
X-CRM114-Status: GOOD (  12.97  )
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

From: Dom Cobley <popcornmix@gmail.com>

For performance/power it is beneficial to adjust gpu clocks with arm clock.
This is how the downstream cpufreq driver works

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 6d5ee1cddded..d374538e7108 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -156,7 +156,6 @@ static int raspberrypi_clock_property(struct rpi_firmware *firmware,
 	struct raspberrypi_firmware_prop msg = {
 		.id = cpu_to_le32(data->id),
 		.val = cpu_to_le32(*val),
-		.disable_turbo = cpu_to_le32(1),
 	};
 	int ret;
 

-- 
2.34.1


