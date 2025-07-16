Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF4BC83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=; b=04E9DZbmOnU0ajX5NNMRTFsf6l
	49ZzS4cHS/dCfawd1/woTyV4si049PVrf1bFz1fFwzTGA9UOPmi0PfBuEj59O5WBB9/jORdUlWatX
	betgCvdwSESImVHJdrmEaGPqhY1pMUnT7XH5Qqwlg1zfBSPZFoklN0wdDDRs0SgRRRBM3DaYTE3X/
	tpxHfTeuw3s4UXYSIX9iUeZoPlNLhg25q0PCh8NFQTJyqoeZLqPdYEM0LT4Y9k99iCTeQxBcowyxt
	pRQMFjPicPIwhtS4Sjb+mWDd/3kT2fsHpe3JTVnb0g6poGlcwT/7qYseYIf+edhBeRHjJLIRmfgpA
	aRi/VoGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc8HW-00000008YpW-0CfY;
	Wed, 16 Jul 2025 19:59:10 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7qz-00000008Uqf-1ouV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:31:46 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so244534a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694304; x=1753299104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=k0lXn4SiF37sMZkmsGBDUnEDI+oxMo6LAS9mWUxQ7J9c5haZp0s/KxVDclDhBZ3xxX
         oPrjAngUWIOKrzdbDZeHmrpIpG6BJCqBGfbBPoEKwzJWsh5RSPal2KR7DJUzSyZRYiYS
         b/cs1KPrMzc4YOpO7NjeO6c4Y+UUEbtl1++pQaMLiry4AkStfyzLQVddHwSrvUypcbi6
         EavDmEPNARaLw8w1152gQoftaX4qaqQjjSa/9Ltg9vPwu56cru2huquCGoXrWaB+u5cw
         FdkRd5puTZswU1QfVEVgypimajxM/N3h/kl7S+jf/3UZ9DfPog5YAdriCLF1ed9Aiq/W
         fAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694304; x=1753299104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YhQAjQyJkWY6Jp3g1C7XqqcjfeJK/9/EyL1eyErKpI=;
        b=s+JJzr8Bu5ox3+hqKk1+TdX0vVEsYfkl0AeTFCFNmqEFqQqN3s0vPdmZT2tRcee7Al
         g+GOCW+oIpmUWTTef3qJRy1bKNwdYdA5YQkh0b13CgzoB4OQMGazGjDWNOeo4min0Cxb
         7439KnuGipKKOW4K4MzVRQKx/i/rKhMSrZVD77mvgq/YCOIBxxcYtL0K7VkdHr8OlOsp
         oZP9zYDz0+rj8FmZtEr3VvI7GGDmFKXCE4dGCtl5JrVcHOXHWveHOeYZP9HPXt1iRr9r
         TMOf6fObed4njefjaT5IaeSwTJBuUb4UzJXQPusmRWJe90VsiiOo5L/TjM2GktsmeKuc
         uiKw==
X-Forwarded-Encrypted: i=1; AJvYcCWCgB6DZfvv3LnH9zF/vbeGUk58sy44C3r10Wuinxp8rYsCKslEF8RSndYx3mQRhpvzuqYJ7aoVKDnRvgtVt749@lists.infradead.org
X-Gm-Message-State: AOJu0YwzgqPdcSj6GxvBU17Br0xDHbQ00+X18aANJh4eUfiG+Mpbi6K5
	E8VpHi7KSDnGCTwXFhNpYL4q86D8TTfGbdKYRhaqY/QqnkG6OszhQm6acbLXjQ==
X-Gm-Gg: ASbGncvtnDPHjuaruVApeRq/CyN+ICNvSfoAU3W7CZ0kwlrJh/DOkIMTniqN0vyBDj6
	rvbUQ2ZkECGEPqbUG45DlwnJwMyQkRU8p1+TeoB4QxTBMi2MBp1+gIX6Mh1dIZ0qphMRj7G1VRF
	q+77IpuoSmBmRCoV4uATYVrPcivaZZW+jSD3gysvJqF1wkYvGLLZRUGf/Ru2P90h+UsRN/yQl8e
	u/eo5wS6re255xL32RpEtVCIgfOwRUcc2gtcL2ahBUyewKoISFWv5By8kuzPsR3qLRPntKOQEoj
	Sz00zfZ7YDpaGxclusNYNSUahUOpY+Q5f6U8I4N2j0OJZMJoccUce2rhCZf4Lb3r1gRKUdglKR5
	oEC58bRYNcaRewhoTvCbHfn1+p9/J9qsTLuo=
X-Google-Smtp-Source: AGHT+IEsQJRdGqu/qTwBOaHc+FiLvZ4m8UDavPdSRUZGpJBwNjalNTkg+vxrzylDLQtfYyEHd3CBfQ==
X-Received: by 2002:a17:907:86a2:b0:ad8:a935:b8eb with SMTP id a640c23a62f3a-ae9cdda9e7cmr406952966b.3.1752694303989;
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82df54csm1226534666b.155.2025.07.16.12.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 12:31:43 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v6 10/24] dt-bindings: media: i2c: max96712: add support for POC supplies
Date: Wed, 16 Jul 2025 22:30:55 +0300
Message-ID: <20250716193111.942217-11-demonsingur@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716193111.942217-1-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_123145_473356_7DA63D16 
X-CRM114-Status: GOOD (  10.85  )
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

The GMSL links can carry power to the serializer when using coaxial
cables.

Document this capability.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 758c0223977d4..b345305acc4c3 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -96,6 +96,10 @@ properties:
       - required: [port@6]
       - required: [port@7]
 
+patternProperties:
+  '^port[0-3]-poc-supply$':
+    description: Regulator providing Power over Coax for GMSL ports
+
 required:
   - compatible
   - reg
-- 
2.50.1


