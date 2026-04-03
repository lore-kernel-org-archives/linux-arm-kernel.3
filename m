Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD507D730AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 07:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Ro+gdRSxkKZsqBhuMAX/TnwJiyqZFyTBN8tQDODJGE=; b=hIfDN6KQ6YJjFqcaYEAazVYbSz
	U3Bzp5/14bweb3nTBqe2vEAsQuCzwz2OSItVqyeLZtY4WaLrkfQsm26gnD558nTvPQkJ/eII4owEv
	TziwGsNbcaFHdPJFvt0melg5o9IkCb3C3kjAqBwA8RjvEH94FxiiXy4dlkHPKHLbM9H2LJ9KAJOII
	bsPRts+7OPLNvdx3+8FWttqZe0ElGiYtz6lVuRnMyYkX5TXH5z4OTbNUpgG5Gfn33eOh2KSkxIc46
	B2J5RM+0n83fs+EpMHnikqg84LG9sKVoKU1/l29v4UD8NV43UC0+qqGzLv5F3/cfkubRrG+am3DLi
	5V+cV1Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YYf-00000001RbX-0CEp;
	Fri, 03 Apr 2026 07:03:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YYb-00000001Ran-2FUv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 07:03:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fb14227cso21844675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 00:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775199783; x=1775804583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0Ro+gdRSxkKZsqBhuMAX/TnwJiyqZFyTBN8tQDODJGE=;
        b=CGG/2u/NQI/DF4m8okvC6Ksxzr5c4RZbj61K83nv1fnBV1AIFyiJFn8mNie6Pe8aAw
         5QxOJn6zAREpb01Pq696DCr6gf15edNPG8fE4sQBnnc8G8SfBV2tqXDqluzaEQSMjvp7
         0PwP1G3WW05ja+XHJc6eZ15ex9tF4FxCSMqlHGCyhDjTrfT74G8VjaMpV9ZpdVd1P40T
         8PP3qM5r8lvdAjQbuXiUjc85Ukd4bn0QCd+DHYaTA1IXvPxGm6de05S2CMDuAvdlVKa1
         HOJQz1tiqM0XDafZtFTr3p4OJq2j2j8mESia4P3O6LLiwDp7pXEMtPCvIZQBgJY8mju/
         teeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775199783; x=1775804583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ro+gdRSxkKZsqBhuMAX/TnwJiyqZFyTBN8tQDODJGE=;
        b=d4+an9X33UW0jBo0tI5uYEGYV0VfqK8p+zqE/PgVdWte2KT518Fh5tc8QAPFSBJhsr
         DEltMOSs1vej4aW8FoGDHdK2o1X3yy+UO1FBcd5yy/M1uFla+6GV71B9dNfg81u+g7p7
         u0K5kv1dTMr//X9MtlVq0XVd/Qq/PvKNyYcCHUzIE3YAW8eRnF990pFS2Zy7U9PNnzwS
         XMirG8vKHSFqOkuJTAnJgoqYsi0rXcop0j4ak4a6X00ylmRfZgi9Dka4lik8lP0Jq2Ub
         mJjoPVtcMHQqT3BhQUVo8R+x+1Y98wOu0Z1ukyBk6BG8yw35H/R9ytMSq2udjHpZBzbs
         apNA==
X-Forwarded-Encrypted: i=1; AJvYcCUUniClyWCF3bPLdbKjSxe11n3zITKmB/UH39tIVT2GRp/w6G8kIqF0Ff4CT9X8U+gchFgXKv+cdZdw6hh3bqvZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzkZnKQPeHNmjwoS2DTyJjCURvwfLJwOZ8ciGATHv+ig95t5Hsl
	JevcnVHvQxeRy2JCPhLGNWBJf3Y9sh0NdBnZYanmvaBe1Lz3xZ66vwYOpnYFmXolSP8=
X-Gm-Gg: AeBDietIeaJWyggdIbPILJsv4RziZi6UgM2DPRiKGFyKhE3FXld+E7dWU066MRdpPxA
	Q0CtJiOrQ2u8SzzcLz/1HTmrhs20XFUsBv2AZWc6r4RFIVuWjyPKL8CheexcfE9JZnsh1v8dV0c
	5CU1oDZXt/P9hUrWMv+LbnJH07NEoykXfkneEoENB7UEkw3bX7M1K/Mrojutvr9e7Dup+oYaVRh
	Wyuu7CTzPdWOOJBX1LJySCAz1t/230WXvYIN5WkURK7HK4NXOoKle/buqcbo45TVDMOaTkW8qr2
	2+8PjZZIB+gcWtpuEc2eTJlAWPB6NFobs+BHu51JTw6reow7umf8MKpttSgldjJoU8vx4dHHy0s
	FqxivbXL7ma20zzanbl1XWO8WkyH+mWXqSWD2XXRapFFdLD/Ipy+Fv/mjr24jgeSGMgAoDoDawC
	RCgb7i91vudZU+1jB8/Xx66CJ08Fo520ulg/FhvaFI2Odx41fnXpXo
X-Received: by 2002:a05:6000:611:b0:43c:f8a7:3b09 with SMTP id ffacd0b85a97d-43d292c7739mr3320959f8f.23.1775199783531;
        Fri, 03 Apr 2026 00:03:03 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm14118803f8f.21.2026.04.03.00.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 00:03:00 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v7.1
Date: Fri,  3 Apr 2026 10:02:59 +0300
Message-ID: <20260403070259.2552626-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_000305_580679_729694A3 
X-CRM114-Status: UNSURE (   6.52  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-7.1

for you to fetch changes up to 1f17fce8bf19a48e5e5610c6da8f806eab81878a:

  ARM: configs: at91: sama7: enable LVDS serializer support (2026-02-28 16:04:03 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v7.1

This update includes:
- LCD controller, LVDS controller, backlight, simple pannel, touchscreen
  configuration flags required by SAMA7D65 SoC

----------------------------------------------------------------
Aubin Constans (1):
      ARM: configs: at91: sama7: enable LVDS serializer support

Romain Sioen (1):
      ARM: configs: at91: sama7: enable config for atmel maxtouch

Ryan Wanner (1):
      ARM: configs: at91: sama7: enable DRM hlcdc support

 arch/arm/configs/sama7_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

