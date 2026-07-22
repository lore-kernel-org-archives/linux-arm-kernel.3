Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C0AC4453A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oPdGdJt7xb9LixsBJFZMtoQVAiedhCyeSG6TkYspQU0=; b=D+L59VIV4Xlz/IxlrEws2qF2kN
	2A6k8bvBatktWUBnOu/uSX4VZRoMrD19f94LLL4kptdWmDad9qL7mBeswXGdWyfu3unqoY8BD0SY9
	YOve1N1VRyeTs7HnqzB65UTsdpCdrpfYPQBZju1zuL0I5KHXfxhChpq0Q/h5tC0YSqz8OR/qgv/uP
	Sk55w0q2sidOKFBTeP1OomYvXUbtQ8M92bcJ2iLptdV4LAmByL7iH4fuwbgOg2qSttkhEuijKnwEY
	DN7Jz1O3qGFNiqpb0vzq3JLa4vHccqNgdDDnKhUn+2vTVd1HGb7cUavsY/OCNDSgvrEh2J07HqgT8
	BJRTKEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdWl-0000000CiUA-1J39;
	Wed, 22 Jul 2026 20:26:51 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdWi-0000000CiTe-2xgG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:26:49 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-493f6de72faso45788865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 13:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752007; x=1785356807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPdGdJt7xb9LixsBJFZMtoQVAiedhCyeSG6TkYspQU0=;
        b=lGLzK7C7Kgqiu8Q2WPbijyzhaYG0SWCkSvF4eP8zr+zQi35gushjg/jUG17OVGwAKM
         y8OaXl0EDtfsaUp37uE3jrECUovy2p+zLRvMxLhWsqUBr6nKyhHb5cC/JjZcCxWA9rDm
         mVVxkgmSbWsRS3cNfUAp5FLr2kItJlygSAv8z326EFhFXdt7HYyHMqHv5AuYm8Va9Wyl
         mDWYgr45xXsnvbhOEMwfkmPzUWj7WcqJcpkafOBP9SAaCu3ZtIDB/+KzLOCE8s3SXId4
         pzs/2NolrNx1HuWjuZlsB9C6njibMT9aUmlKEdCFcEanwy0Sw5AAP0hRKCPp9NWwmYCJ
         40Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752007; x=1785356807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPdGdJt7xb9LixsBJFZMtoQVAiedhCyeSG6TkYspQU0=;
        b=r++z/q3LLuh/qdn2qWnZyUZGmo/0gSENUd/g1ic35PkTkiWAZ7cPo90576lU8dRNAW
         PQEHooqwbF8AtFyXU7HefKufgeIkDfC8Z214OCO+bCwUKTUtUoTgKUvCfzDVx3zo5d8u
         /IObHhkuZCNowZngAxaPYIwT7Zg+s5oUeleo5fOFQ1t54DqwFCDy32h+1pIdFbJUOcvA
         24fRQRfp6xyBdzf1WyH3GLCYWu6xTz0CpwBKP019mVQ9U3viP/Elxz2blgyoTLRGEvh7
         AS7QMa1iqumXwtHSAiiZRG9BPEZQj/XvMOIdezBfTAFr9zmlFHLGjXDLLcgu/sT/f2Rm
         rg8w==
X-Forwarded-Encrypted: i=1; AHgh+Rq0VbWi0RSJW4O6VgL17eQpAnL3FuYZ3yDmvALvDvS+eSJS9Bwgois0xXiDsLww6f0epM5hY63dw7XNxo+estUj@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0geoAcfV/fFX5is3NCZf91MfSOsJ20l6efx5zE8F5pYlJkpQc
	hy+7rbNdnQdaway/6EDjprIE/f432CSgQLJI7dpzBHzHVel7z7QdgMoj
X-Gm-Gg: AR+sD13qcUDbQ6K/Y5b//ROKle8IakgAOF67Sl2svaTb/2PDMKuTzJ73o1frXRbf9C8
	Akc0LlWcMPcCZ6BxfqgcQSWKiS+EwEx83Wm0DtsiSMYN6PL46241LzhWqRvmreoQP+5nKGK9Wht
	LRrbQNfVg0yRd9mxbu9dcQsDcT6aCgRLMV3AJU3oW3CX80nbr/OukQbezyywxZjCWOIbrqpywfA
	cmSkoh42F+ArRsQ7PR5tYNZ5WAJrmvgsaoDnfma7jPYzQ+3JUaCC6+48wBM3kbjCnaUCAxv+PhN
	T6U6GutF7bJsNbyYMDME2f4NQGUgCZWt8RvP/3C1ox9gpqMqQ2rBowoOVx+Ca4sx/UUIpjg4/mH
	jEZbFkgelMjKJ4l3vsTB/1fVHUTOYbw45D/qtlbY3oYtUyCMtS1FL+OCOmu2l4rqWw1AhPe4rOr
	PoK7o9jBpxr60UqYgsxebXmmKQfTvS5iD83Of2TTPXEo8Il/AAQSX/7evkCHIkOGSCSdJL150BR
	mr7
X-Received: by 2002:a05:600d:117:b0:495:549f:8a86 with SMTP id 5b1f17b1804b1-4956a631813mr47293275e9.17.1784752006510;
        Wed, 22 Jul 2026 13:26:46 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c631fdsm8705649f8f.28.2026.07.22.13.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:26:45 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	linusw@kernel.org
Cc: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	kernel@pengutronix.de,
	bartosz.golaszewski@oss.qualcomm.com,
	andrei.stefanescu@oss.nxp.com,
	khristineandreea.barbulescu@oss.nxp.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Date: Wed, 22 Jul 2026 21:26:38 +0100
Message-ID: <20260722202638.135277-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_132648_747349_F84654D3 
X-CRM114-Status: GOOD (  10.58  )
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

Currently, PINCTRL_S32CC selects PINCTRL_S32CC which needs GPIOLIB, without
selecting or depending on GPIOLIB.

However, other similar options in this subsystem actually select GPIOLIB
instead of depending, so I think we can do the same here.

This unmet dependency was found by kconfirm, a static analysis tool for
Kconfig.

Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/pinctrl/nxp/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nxp/Kconfig b/drivers/pinctrl/nxp/Kconfig
index 711c0fe11565..fab725f250ab 100644
--- a/drivers/pinctrl/nxp/Kconfig
+++ b/drivers/pinctrl/nxp/Kconfig
@@ -1,10 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PINCTRL_S32CC
 	bool
-	depends on ARCH_S32 && OF && GPIOLIB
+	depends on ARCH_S32 && OF
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select GPIOLIB
 	select GPIO_REGMAP
 	select REGMAP_MMIO
 
-- 
2.54.0


