Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5238CC71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 10:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=; b=1gOpQZ+8s5RgU9DCz3FrKGkKDQ
	jdtY5CU6dWLSslaqOB4Er4PMovR0RiZJXTLyeiM7PdwkE2pQJQFj2M1Zk40eN/jo5QCkjpqCNQsNf
	78v68dUwbHyztBoZU2uijfeGGqHrdksd4AaQ1TykU3n9eyNgpG8VzM+YXhxr1jnFb3u5WV5UPb4ve
	aEZ9uaX373b0h6gEmA2c2ReLImTVwvYBmuEw2qrVd7l6bvO0gBl4aaUzCA5b3Dn8DiRVBl1NYrmoc
	VnnFmu3972AI1pweSk/C+RX8vonnqIWxTwAtcYWHoja2QqkI4Xkuv1UJLp9c6KnPGJ6+4dAJOQcqZ
	oOw7CCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRqFY-00000009pHO-1XlO;
	Wed, 18 Jun 2025 10:42:36 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpaK-00000009gmz-3A3h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 10:00:02 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso3098556a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 03:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750240799; x=1750845599; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=BopUbuWuMrxTPv8mIPomkl6d/VTcwtX5Ci6euCwRxASWxtUufUdEAqivRihQrwbSZo
         50B+NQevc4nvtFzyhKBm7rBN+SaXz8L9WaNBKMefqCVmnxIZ1aw2b+QNukXazOIhpm4O
         GuW5pcm/c9MiBfm+CoTaeaeCS7UnRKgB/bRC2U4jI7/dp6SP+S0O8VmOODGI/TdPTwvb
         M78WJik+HgE1tfpQE5Diq7tRIcy3zs/mTgQdIabWdvJYX+6MiuT12IwoQpbgVpAoDA/M
         CNZBgNE6f5oxYFqn+IfEitNADZ5dfJcLj9+CZD0i/Kmf7WnAArfXra+caztZdihqce6w
         t4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750240799; x=1750845599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81HfN+4Jk8ZhDwBd0SjZBE23LsqPoqzRdiRvC3t8CZc=;
        b=RrVrrpGqVocFAO+bMU2Gxp9X55I8Z2eqomXi0bBBvcMdKxtFX2Q8Q2xReJM/ThQ6bq
         jQE9hKQx+WU7cvqOGI1UL645ONzetStgv8iomtTB9GFVp5S35z30yFM/JnBmQsGPkj19
         q9Z6o1qREYjXcQ3SG2dCuhWn/iZLwYGGPulDLxptxB11MVZQfziPr1O0kuMbAwtQG2pB
         Ml+dAo+m9UdNnHkh/buNDW5+fPt0ptRsdjiAgtutJmCMe2xRhsR+eKgXbl1I405X4iyK
         iudH5EE3b3xwG8j4bPr4zcgh08IX7VPVmcjI+yMZObZm95DvEOsB9cddk3GtBeH/L05i
         stiw==
X-Forwarded-Encrypted: i=1; AJvYcCWSomrnqLm/TtXzoleVUhLVfdkc7Swkjx27jDPv874WYPHuraUsLLWlzTKwifwy/k+3FE122OFfVUzYZ9DMNb7Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqo9fliYQDlzFYCH3DnKnZWHoWlilElv2fang3+ZkPTqHoMGoP
	Qzs6sti0NvjuGRShvBPspifena5Pl1pMmhnXnOZxrDGv+sPnz/eV1k1W
X-Gm-Gg: ASbGncuYfFacUxz8YkZ4B1FLqoPQ8EsISPhDZoXMSJ5wjUxCbtNj+EffzLBtzRPcpac
	n1K1FyJci9QeCqmfd3ePtisT5+2KLzvzyhE2H7f/659YPZ780o2SV9dAFHP9601E1078fsUGASz
	dSBACTh7diAp41YqhSBW9mrOQvWeBoEMInu34ByFb6Mrl606eNNHkQ4T8yiGlo5Hu0aHZqJO5WU
	m0fnfyy7D+xhrYXrGf+7M2nPlqW1JU/ky5Iq5ehUZSJPeov7xdX57JrEepEsgZEZ1YBi5BUib+h
	5ryBjMHcbVkFXiX3PtU0W67jCEDCt6ZgWzD7FB4GWtHFrfsHxHTbj5t4vSJCRMvvlnu58KQ+EUY
	=
X-Google-Smtp-Source: AGHT+IEOr9zNV44WWLFTuOxIUvg/uRqUB3RWX2y9R/qoxpU2YJx9EhRm+2O/OmrkiW4wu8vIyE0epw==
X-Received: by 2002:a05:6402:2708:b0:606:f836:c656 with SMTP id 4fb4d7f45d1cf-608d0948348mr15115181a12.19.1750240799157;
        Wed, 18 Jun 2025 02:59:59 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.131.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93b03sm9384691a12.54.2025.06.18.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:59:58 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org (open list:MAXIM GMSL2 SERIALIZERS AND DESERIALIZERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-gpio@vger.kernel.org (open list:GPIO SUBSYSTEM:Keyword:(devm_)?gpio_(request|free|direction|get|set)),
	Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v4 16/19] arm64: defconfig: disable deprecated MAX96712 driver
Date: Wed, 18 Jun 2025 12:58:52 +0300
Message-ID: <20250618095858.2145209-17-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618095858.2145209-1-demonsingur@gmail.com>
References: <20250618095858.2145209-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_030000_840252_DFDF7B91 
X-CRM114-Status: GOOD (  11.16  )
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

The staging MAX96712 driver will be removed as its functionality has
been moved to the MAX96724 driver which makes use of the Maxim
GMSL2/3 deserializer framework.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a9..6f4254f562da 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1300,7 +1300,6 @@ CONFIG_GREYBUS=m
 CONFIG_GREYBUS_BEAGLEPLAY=m
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=m
 CONFIG_VIDEO_MESON_VDEC=m
 CONFIG_SND_BCM2835=m
 CONFIG_CHROME_PLATFORMS=y
-- 
2.49.0


