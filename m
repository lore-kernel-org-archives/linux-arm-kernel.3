Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C5CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 00:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TvlzBRZmcfQZqiC8OpRLt5DZkcEUBfxEVIIuGLShicA=; b=G/fkzb4UPx5KH82CCViFCACKZx
	Kz1E8fhygVCvKUeqsdD0vL0aHXzmf9mxT9KDax+WEQ2kKmfbHNp0RDhmlqNmlcHFRRAZtQJJkkfhw
	E776yCXasvMKtN7V9NQPeiRrwJirxPB4MlrAdB95iZRALWqaAaeJz/R8+tAloIcWB4qW98LY+/TE4
	4leZxJ+Fu4nNnkk9+ApQVDNxAlbNmK04QcrCN4kFgvcWDOUHfog7VJQMNExwRGMlj0oE4etltrymz
	1c592Te2RjXQr8V7IVQKLlnq9Q5S6Wk7FRoJUr31xY18KklN3zYXYFv2lS0N0U4jeC8H1tz4t+/LC
	PTUcNOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32Tk-0000000C9mr-1YYe;
	Fri, 11 Apr 2025 00:42:44 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u32QH-0000000C98I-1kTv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 00:39:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-30bfb6ab47cso11781991fa.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 17:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744331947; x=1744936747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TvlzBRZmcfQZqiC8OpRLt5DZkcEUBfxEVIIuGLShicA=;
        b=byM0LCUqFzNeqT2/SQmnESiS0XBFWkORnAfHdvMwvSMv/1P755sIjJ0eAStX15jZrS
         NhavYuqhgv4BvTojXafLlXHYY3gN0nXwy3EMfHTG+PvBpHjHkYsAj59hWuewo3Ia3KhH
         sAN/KZTLnxa6ENIEl6D+CEiPJ7H2UXXokKQv8lse29z5bhGKHqDykdyR2UtE4V49pzTz
         FdtgGhIDOmGFLiTuUgConvnNQs5+y8dgBZvXqitDQWpdOGXj19DPq+kdH3Fa5clfaxy6
         cq6ndqtKn/I3FXv9PwVRHDilrVqOhz8k09N3SIXe/yHdk5rj/Flfp6A1VO9tk9Ofron4
         j5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744331947; x=1744936747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TvlzBRZmcfQZqiC8OpRLt5DZkcEUBfxEVIIuGLShicA=;
        b=LbmYCSYBMNRPIM7fpeJn/9lZWO0JBrhE74UoQGIFE6fDi1Aytm5FD1BOc73J13Sx4G
         g8m3FHgfew2BhxK4xhYjRwJL8Y6Z3kVVTqqHXfGS8LKen45hsIXM0xKSC5TMNw1iQGcV
         ULjbajFkDEhmjBEu8sdj2dK2S2G/5rnEGaVtpeBlGgcAYf5lMFAxiguG6YYBEdUsGx2j
         CIVU3WTbrR9Z8Iz3WaAsaUYLYe/jeNAzIDp0gV/3dC/Ks8NceUAVouEnr4sytzKyW7Ll
         HiTh4+Oj8Qce4DbxITGDgsfJlBDa2XJFh/evBuSiUGyNh1OUz0tnrG4rhs1GbqgEuS7+
         6HKA==
X-Forwarded-Encrypted: i=1; AJvYcCV7FYLgJuZuYit48RPBcqx82E6Ng06aQu5ZM3pvogti5/wSgMFnqfy5ULY6b2sbfI1hOHttLSK1JjWLrdE3eQ8Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ3Q5RbSHY0M9ljYSjlY61rdqHQQsjwr1N4ukXLbIVCAZVCkt8
	X70tqdmLtMpZkzDRDNH2+/sQJeFmAeRtPuR48taTWrsF+hsSK4dx
X-Gm-Gg: ASbGncvkSRA+lmaCTFU6x+wAmqY53z70zhdRnf0QWvuG5+X1fGds8Ff2HjUM8qgMKYP
	GzsrZERuRLkagkUs/eUbkIUMlBvnhZDQ0Dzed82z19fCPXVFOecxC+KdN49cPVM9hS0feVNJdvN
	sBxbrVQhkZYnIkyY9SxujN8ZaeAAFciX6FbnsfM6HMZ0sbZOv3gyCMbHbewMcehYrHRjKP1tT6q
	9niSn1MOrZiF/EhVuSaLAkmTy2wCGOVXvjqgPC3xgm88T5RWeXf876W9sdWPin4UKdeFGnH3seK
	kf4JBJfpV936evXo3hCuyeO3tN877NrEYznrmUZSF8qK1sQ1Cfth4bhoBpOF
X-Google-Smtp-Source: AGHT+IEN5mMmLvML1RixznmVQhwUVwoYFg/6bDCB7jcePQLJIp/PR0tcJr9jJQCpqbPiczh3txeYEA==
X-Received: by 2002:a2e:be88:0:b0:30b:fe19:b07a with SMTP id 38308e7fff4ca-31049a8085dmr1938891fa.25.1744331946976;
        Thu, 10 Apr 2025 17:39:06 -0700 (PDT)
Received: from localhost.localdomain ([176.106.241.81])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea5c6sm6344251fa.62.2025.04.10.17.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:39:06 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Subject: [PATCH 0/6] Add support for A523 Thermal system
Date: Fri, 11 Apr 2025 08:38:20 +0800
Message-ID: <20250411003827.782544-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_173909_455059_E63BD55A 
X-CRM114-Status: UNSURE (   8.90  )
X-CRM114-Notice: Please train this message.
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

This patch series adds temperature sensor support for the Allwinner A523
family of processors (same die with H728/A527/T527)

Mikhail Kalashnikov (6):
  thermal/drivers/sun8i: add gpadc clock
  thermal/drivers/sun8i: replace devm_reset_control_get to shared
  thermal/drivers/sun8i: Add support for A523 THS0/1 controllers
  arm64: dts: allwinner: A523: Add SID controller node
  arm64: dts: allwinner: A523: Add thermal sensors and zones
  dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers

 .../thermal/allwinner,sun8i-a83t-ths.yaml     |   5 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 145 +++++++++++++++++
 drivers/thermal/sun8i_thermal.c               | 154 +++++++++++++++++-
 3 files changed, 300 insertions(+), 4 deletions(-)

-- 
2.49.0


