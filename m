Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE25ED149D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=; b=lf1DqKuESvWRgrBxrOIhXUcc0h
	WdgCZQDqE2W/H1v7N2WRNEe+HJSyskj1I4FCo5U5YdLP36JzNQa1fZlpFGLSZT7uN0C+93L1JO67J
	8/aqHRXprwhy1wqvSBebjnqaqJm9arKucq5GbrVniMztQhtpCDjTmue3OGdVYrl8EHkT26GZk/451
	eCzuT9ilKkPjVqGltfmOHyaK8Ha5zTles0i+gO486EWdmoMilUkZVinKc4IzZFxRn5Uttug68a5wf
	QelUxxYzzz1EMFp+5c5KOT7HPVhvXcp+MZAj1+ZmMkR2z1bNBINn5ef9OpQp+zfwh0b6mvO3tXNh9
	96jPOJew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4O07-00000004ZQ9-0IsL;
	Fri, 25 Oct 2024 17:21:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nuz-00000004Xne-1r3g
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 17:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=; b=Zwa6R42jAyxr5bizO9KE7W7Fmf
	Nkb+t75pkxz5ERkhOHvaInw8FbNMqnXa1F5K7L90C/v6qhlDQnOmKo5TPCE0waFH2dv6gzrKiXWEx
	ot5tmG0WMhLNkivDGGYRBPtEgebpVRNoQms+jwBG5h2yaFRYvuD4lHMWJRwmGkBj2BcetXHBwVPOH
	iN/iGqGtVciT52Dwnnbq/5+gv0JiijRlKEIUjj4pV9ZS/jvAKpQsdm9ea3KmO6fm4CsceXkofb9XC
	GvQfBAETJ18ay373rbBBzvv+cxG4UqJ6PlhGKvMWPxqGcfII563iCpm2Wn9yx2IG4XN1sTpQctMoI
	PnmcvzOA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Nuw-00000008zcr-0bG4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 17:16:08 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37d58377339so1728559f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 10:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1729876564; x=1730481364; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=;
        b=QkpCddvkYkPvgjB+tkkNpmc/Tlmv00FUsom96zn+qmY5PB797h1lnlWRBUq3U8ACcR
         VjjBnfQy9/zUPmqwReS+/5Ux93GV4jPlozEnFYP+1B2fidkXO2ZeZeHnPxqN5NitkA2w
         LlEzS9vXwm0bi0LNKKNpw9EaOXr96euIpp9JFZjP5GbMctdC7YU61ZvQvjh7OKiTV+z/
         xTxmh3qhTTaOdowuwFe0CfkkPFn030pLQd1EjowmgJp6jeBkTdAtFnYycdKQ9/KjV7ly
         ZbUrM1VRXRydw00sk8yfQnGxJbJseoVYSdzousSwmF+rf7WC0sqL3ZStwkCZiHboy7s0
         cmaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729876564; x=1730481364;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvdhnqZWhjJaVRixzXDF8i8NipPmGHymdrTVaS8WSIY=;
        b=b20+ewHCRPXMtX+GxoR2LocSvmz5JrkE0f8tPJn1I3vrLwUkEu9RjEgW3ZzNZUmNCI
         Go1UBMHzth01CcGahZQH9mlbNj7WD+JFq4vj0U1YTWegk2ouA2b9WpKiU3NZ/GJdEBMk
         fGv0UrAWssAfB9FD6+L6Q3blZ71+2Zts7KfaVStk+4YLTlTLtrmL94G075KBej/DbAlm
         LDiTbUnM9APAGny7ud9u8tOOBCtLQVQtBa2EZ0QQhV4wnAiCDoljAqoMH47GUwmd+63S
         B/Apz5+fEdyYtktkxPlOUJPr7/EvAu/viS+yS1W5uecIhjLjYWC0EMC9RNoMOj3iPzPQ
         Mqmw==
X-Forwarded-Encrypted: i=1; AJvYcCUFLGeL38CiWuisfH8peRTpOJhp1UOJiluy5cwS5HvJKXxsrAZYDbZ0I2y7t9YBmMpAwgYRabLZ+xiLZlFQy8wS@lists.infradead.org
X-Gm-Message-State: AOJu0YwV7zpE0INcJJm9VRMLayPq8621FsgegNLGPfOq5SbITcn1L9DP
	i8KoWXKxEV3ilNCqAnBQq5y3LFHnl5FPl3HKmD06nnidWIzvhz/rJubG23QukS4=
X-Google-Smtp-Source: AGHT+IGJw1+OsEH13czUNrPVKJZqUz4zqCjXXtEZzfN0U7VM1+Tkm4ryrjbOYe8QkQQMzLnZPTtsFg==
X-Received: by 2002:a5d:6a07:0:b0:37d:4619:f975 with SMTP id ffacd0b85a97d-380611727b1mr120000f8f.19.1729876563675;
        Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 10:16:03 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:34 +0100
Subject: [PATCH v2 03/36] dt-bindings: display: Add BCM2712 HDMI bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-3-35efa83c8fc0@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241025_181606_455202_88AF0BDA 
X-CRM114-Status: GOOD (  11.55  )
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

The BCM2712 HDMI controller uses a slightly different HDMI controller
than the BCM2711, and a completely different PHY.

Let's introduce a new compatible for it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
index 5b35adf34c7b..6d11f5955b51 100644
--- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
@@ -14,6 +14,8 @@ properties:
     enum:
       - brcm,bcm2711-hdmi0
       - brcm,bcm2711-hdmi1
+      - brcm,bcm2712-hdmi0
+      - brcm,bcm2712-hdmi1
 
   reg:
     items:

-- 
2.34.1


