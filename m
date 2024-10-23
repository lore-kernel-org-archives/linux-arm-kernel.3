Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA19CCFA45F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=; b=G55Uzxz66Tf5fz+2qlO8XueXc4
	qgViyX+LzdfJlnfKEzAL5Pry/SeBJFaOjSGEOsslTFd2VLOhsbVBbF2edKEozJfF+P0/JBsJzDmOl
	vJo/PBX1je09AOBDKt/hsXsd9AcdQ7wMkU9zDrr7c4aKK9Iy44+l9aRPR5RQiTeuZwVjhDlyWysYb
	/jRaVPaCcAZ3c2zCSvnfdPPwweMFjThjrILs5oUPg7j3UWhIDbKTTTfjtvUDBFjgC5vmO6vHXxMV+
	aq2UyRBzPeHt5H1rUpJ+X+EeBpZHaMUNoZQQrt/NLq0k9r+qBzZHKltHEUH7ZAGjgTir0piUh67f3
	MYyFXzrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gry-0000000FdH4-0iH4;
	Wed, 23 Oct 2024 19:18:10 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3eZH-0000000FDYQ-0bFz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 16:50:45 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43163667f0eso55402695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729702241; x=1730307041; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
        b=fiyB6FGovMSGfqLguD2t958PoqV1DhRP/dKRuQtUP2u0mDRI+LVZw1/aKNe0maBp9S
         X/RZYZNJD6uSKe/u9mG/1B216Fb+yn/I0DCAutujcAGjb/BIRWrKW04kGAeeokQFXygG
         jKa3+wipt0QTRjqkqkRN1IOthmYgOawdWEehvkQ0UNtEkFYLIgQG2lapuRSbezU/dnJu
         u0DFqirJuhwpFai+HfWIyUVo4KJL+mZmWvGOGbmbsqHXuYUtjBbXHsTBrjpu1sf/pNiL
         bSR8zyj1X4oT3vEOYI8MOK5/guiXc59SGpiXoO8TyOYems5vf19MSjmyIERmQhaobuOS
         Yrpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729702241; x=1730307041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vaguUe7juL1LVMz08cL6sDxAEiRfNF+JBFP9wF0Q+s=;
        b=vlU48k53zVu3pLP98kINLXY7rgKh06NV2hx8LsB02Gf6RS8TmLZ2H0gdD6D9EjITdd
         uWMm7hvZK/BWIlctMepjugQpjH8SM/R6XW6dDP8359DTqAsXbiKqxkboePa10OGJddLs
         3KP4LDWXDOL/3wMYJEmG4FskK/DwFmyIAUHwa3MekJFzJJSjQmM1mUSmm+7eyTKIOxQs
         9yU+na9tYuLRsraz/fvQRtMRr7sKfUPYjJfF2CmbYPratXnWtlmPu1gz8QpotFnROfMV
         Cf47ek+he/4WjQwMCUZWoOnOtpcrMjeQGSYjcpbrSB60rAK9EqnZNhH2BdDBjGUfKbHx
         0Cog==
X-Forwarded-Encrypted: i=1; AJvYcCX7nKCHlWm0hQf5dyWEx83okMv2GrxHg7urNVhgh8nStoZZwHaHAyqDFZdTul4+qtpPo2ktXxKwQQ3iMJSZcsMY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgt9cuVvQ3ekn5eiTV+B4RI0yi5UwT3cbZ82XYlvJhV4pDc59i
	fS2tZWEZwrcegFvpCuthF7gzctkUsE5Ndk+rlPXQGSJmHeImc6m94JbzoVxEZ4c=
X-Google-Smtp-Source: AGHT+IERYOndgW/udDrkKTC0Se/KUmNKFRwzDAk4TOKT6h49ITwfBkIc/0nZV6Akai4GqaHXpM9b4Q==
X-Received: by 2002:a05:600c:511c:b0:42f:823d:dddd with SMTP id 5b1f17b1804b1-4318423b856mr23693165e9.27.1729702241069;
        Wed, 23 Oct 2024 09:50:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 09:50:40 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:23 +0100
Subject: [PATCH 26/37] drm/vc4: hdmi: Support 2712 D-step register map
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-26-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241023_095043_372437_03D0479D 
X-CRM114-Status: GOOD (  15.15  )
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

The D-step has increased FIFO sizes of the MAI_THR blocks,
resulting in changes to the register masking. Add support for
it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 19 +++++++++++++++++--
 drivers/gpu/drm/vc4/vc4_regs.h |  9 +++++++++
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 95ef8bbe6439..6fcdd1c247d2 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -2128,18 +2128,33 @@ static int vc4_hdmi_audio_prepare(struct device *dev, void *data,
 					     VC4_HDMI_AUDIO_PACKET_CEA_MASK);
 
 	/* Set the MAI threshold */
-	if (vc4->gen >= VC4_GEN_5)
+	switch (vc4->gen) {
+	case VC4_GEN_6_D:
+		HDMI_WRITE(HDMI_MAI_THR,
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICHIGH) |
+			   VC4_SET_FIELD(0x10, VC6_D_HD_MAI_THR_PANICLOW) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQHIGH) |
+			   VC4_SET_FIELD(0x1c, VC6_D_HD_MAI_THR_DREQLOW));
+		break;
+	case VC4_GEN_6_C:
+	case VC4_GEN_5:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x10, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x1c, VC4_HD_MAI_THR_DREQLOW));
-	else
+		break;
+	case VC4_GEN_4:
 		HDMI_WRITE(HDMI_MAI_THR,
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_PANICLOW) |
 			   VC4_SET_FIELD(0x6, VC4_HD_MAI_THR_DREQHIGH) |
 			   VC4_SET_FIELD(0x8, VC4_HD_MAI_THR_DREQLOW));
+		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		break;
+	}
 
 	HDMI_WRITE(HDMI_MAI_CONFIG,
 		   VC4_HDMI_MAI_CONFIG_BIT_REVERSE |
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index 0046bdb7ca32..27158be19952 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -987,6 +987,15 @@ enum {
 # define VC4_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(5, 0)
 # define VC4_HD_MAI_THR_DREQLOW_SHIFT		0
 
+# define VC6_D_HD_MAI_THR_PANICHIGH_MASK	VC4_MASK(29, 23)
+# define VC6_D_HD_MAI_THR_PANICHIGH_SHIFT	23
+# define VC6_D_HD_MAI_THR_PANICLOW_MASK		VC4_MASK(21, 15)
+# define VC6_D_HD_MAI_THR_PANICLOW_SHIFT	15
+# define VC6_D_HD_MAI_THR_DREQHIGH_MASK		VC4_MASK(13, 7)
+# define VC6_D_HD_MAI_THR_DREQHIGH_SHIFT	7
+# define VC6_D_HD_MAI_THR_DREQLOW_MASK		VC4_MASK(6, 0)
+# define VC6_D_HD_MAI_THR_DREQLOW_SHIFT		0
+
 /* Divider from HDMI HSM clock to MAI serial clock.  Sampling period
  * converges to N / (M + 1) cycles.
  */

-- 
2.34.1


