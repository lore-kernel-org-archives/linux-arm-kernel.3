Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC3C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 23:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oicoRjD6gtaEj60f3J9lS1Htl40hJZixmpVAIyBkxLg=; b=3pAqvTSym+VFuyBwtgSTAdX5fb
	EF0wNnayTbV+bB1YItzOay+V9WjFvyTlh2qbUo2eogGv13DiijimC2z+ybtHTw+/qbTLvwEhoRBpX
	7KQ5Qiwq2TaCutznqwCr8N5Mc8y3V+DATR8+tDKCoKTfX54KK+YbndHpb16Ry478io9zpbEoF3hHk
	jFSSZCcws+5xDhDxcspi/EIkbHQLddDb0+G1jmuJc0rWKRKA8PNnVrvnE13yn+559GkcMBK6T4dPF
	hFSH6NwFOGG8RtHyg6OZbuqwBQ0HMUnYG9ZO+M9BCafzjy72wi98xUaE035TdcSec/WvOs5nQUzOv
	0LsCIWSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZeAu-0000000AFMe-2mbs;
	Wed, 09 Jul 2025 23:26:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdzW-0000000AES1-2D1L
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 23:14:19 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a53359dea5so276810f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 16:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752102857; x=1752707657; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oicoRjD6gtaEj60f3J9lS1Htl40hJZixmpVAIyBkxLg=;
        b=e4XIuspU14nVL8QaREzaQdzWxz+xMq8mm86HzfZuDTyHQmqPvAePyMuUHqGy1cPG9N
         r8lrVGM1wbxwdPHeqzMRgmcU6PBabn60kKtWdPrsNhREZm1EUkOeTP02dq7FDA6OgN22
         dfUnq5Z7r6+y+zgxJ3awuu0aMo9DUxI4WrD+qG+UvC0Pm7Iix3Wbv00tudmlPuEsvheo
         bfHvkJBt2UQO35VEQJDQvx5TfHSdC451nMfYeKlQMu62gdsmYat54mKyNAj9oFJCV4F5
         sRib+bkJ4cRidJPUx94aDD8Kx5hRfhLPPYyQRxOdhvvE5duOUBHad6AyWr1748SnckTX
         hCYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752102857; x=1752707657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oicoRjD6gtaEj60f3J9lS1Htl40hJZixmpVAIyBkxLg=;
        b=dx3WgdixwKj06RxJgTrJHoCL8MEMetuoHaqFCh1QWme4BffpouRnIPQCtGc5wkqkm4
         Z5e8H3ym2Bzc/DOX/MMBMzEhcgNH5kOwYp9HrmZLFed6VTtwSm5FglMekA2GjPAWoKyh
         /s90cyAtCLjRDUEx6QySiDRpqEhe10l86uhq+0d8jx3Q1cjVrHoX5pP6nng+Uj4JmIkK
         8B/tIo24b28BWPgzTAZXHNziK3AF98w9E1ehsvrg86aYRp8EVCwKFcqAHn45KeU2o27z
         8jax8UJOeQDtOKI4Nu4q2iADL7wrIZrZH5/SmgDVvg1ZIpN+2Sq95dl/QaHsPb1mT8CY
         FkgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVezwHgJ+G+Qy8huJ7hgDVDg0Nm7VhWu2OTSyomYTdTDfGiLG6WeV+YStMNHaTOZ9B/P5tzYc8oQPE/ML1PFydH@lists.infradead.org
X-Gm-Message-State: AOJu0Yym9g3fJZRU9rpv9uB1MKzk241c3waP5y+q5JUdD2Bl8Zai93KU
	yEPyeG/gets0Cz7a00LdYY9MJ6TE2/tkuT9YwNpCZSVrKasnPp0GeNfdSfcdRw==
X-Gm-Gg: ASbGnctk2Iy8EBkoeTxNL+1cohsZtGZuodD9U1p33U4WKioMQSWTv1zBTrLtNgMxZWw
	GrZaoZMCiDJjk8ObSntvCX+ApJTKNwC3Ri3fab4fjGaqduMr3wu+gt9s/rjyrLFhiO8YdQN8F1+
	VAZUMDwMNVHTQiO5wFmbSlPgqsmQp1XRbRLiJST5v9yPbMAA/HHEsMryg3pqUqeIcqs1gKdqlYz
	fkloBXSuwG5sy4ekC9B2S67J6kgMrB3iy4X2so/LlGFxDmkQWdrp6xJWVgfyhDlRRlYl22fYOMO
	8Yb1iXzF4SkLgvC0ouB2zB2fRNHtyW1MRQQwUSDo0xDfGVXpUoIXY9xnU+Av08OSO8RcIFW2npL
	CsxmdE2LXEzKSYYiprdUcAZFYzV2VRpezQwYGWdTIG6AsLKzlLFFuZ7+ApomIjoAQ
X-Google-Smtp-Source: AGHT+IEeIxIiPUuQMg+0LzXiKHb+lIgF9LJ9CFm6uIp861pwDP7vJsT4ai1T+DBcLw/2zhiAUXbu7A==
X-Received: by 2002:adf:9dc5:0:b0:3a6:d6e4:dffd with SMTP id ffacd0b85a97d-3b5e86721eemr393068f8f.14.1752102856956;
        Wed, 09 Jul 2025 16:14:16 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8dc22a8sm215669f8f.34.2025.07.09.16.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 16:14:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/4] arm64: defconfig: Enable Tegra241 and Tegra264
Date: Thu, 10 Jul 2025 01:14:01 +0200
Message-ID: <20250709231401.3767130-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250709231401.3767130-1-thierry.reding@gmail.com>
References: <20250709231401.3767130-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_161418_563227_FA164007 
X-CRM114-Status: GOOD (  10.49  )
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

From: Thierry Reding <treding@nvidia.com>

Enable the configuration options for these newer generations of Tegra so
that support for them gets built by default.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5abe148c35de..417c35fa7ad4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1518,6 +1518,8 @@ CONFIG_ARCH_TEGRA_210_SOC=y
 CONFIG_ARCH_TEGRA_186_SOC=y
 CONFIG_ARCH_TEGRA_194_SOC=y
 CONFIG_ARCH_TEGRA_234_SOC=y
+CONFIG_ARCH_TEGRA_241_SOC=y
+CONFIG_ARCH_TEGRA_264_SOC=y
 CONFIG_TI_PRUSS=m
 CONFIG_OWL_PM_DOMAINS=y
 CONFIG_RASPBERRYPI_POWER=y
-- 
2.50.0


