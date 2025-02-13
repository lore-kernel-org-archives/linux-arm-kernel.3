Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B519C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bEraBi59wANcLZn1tO53PfWT2ziVOrD3fPU9kZezwl8=; b=B3HGRuZW7+VLg35fn6kbubWNex
	J/K/W56dVSy+K1oLdkuAS8arP/Bwhkk2Fmj+00XXP5nAfyubN0QWQRFMzzhZhP8A1le+U39Mdo0Ai
	jK9K4dGaAIOPs/4leA9ABwcTS4BLnLH2uNKS+81+E0+49txDb9O2tRlOevn0j6xkF5O7XiFsRT5nT
	kCfxIIbVRbKdoj9PQydk1VC+wxsVkGkqAnftkd9LVRgfsi5QSA6Vj5XrDqK6pRGGe7qWchnq4vSKl
	hn0gsE5bPgV6Gr6AErkpMblxBN2t9DctULVM2xlZiiJrvcADqzfHu9ecpZ42uCX2Il0N58EwO8i1u
	mBdZglJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tig2b-0000000Ca6x-0rmx;
	Thu, 13 Feb 2025 20:42:33 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tig18-0000000CZMz-46ih
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:41:04 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5205d9da0d7so364838e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 12:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739479261; x=1740084061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bEraBi59wANcLZn1tO53PfWT2ziVOrD3fPU9kZezwl8=;
        b=gTbheqSeiT3CU2oyOUaRj3ctwm5En8Cpiy8N//X0UNpQpQJDm7qwPbzzhqC4/aeTMj
         /hd3Uqb5KexNMNx4eu3EDHCJkuVzdN86TS1GlP2hmAWbirTfxDQqhEA36I81oa+7+XSh
         L776UqxtrW53M+Cd8S6ma0nejuRZ6iK0a+SygtfJSVMG5a97JuqxJ4UIrZf3jgaLmMpm
         woQ6xsVaNJT62B7zbgIj3uVfJ/ni/ibzhF/DMGB78US2kCYQQkG7glMQ+1+P4cYsusaM
         3p0cSQV+GfFT2WAn51A0ip93NaioiP235nHNkrEgxK4wXcGnI7uXjXCGOnQ2kRyzOJuw
         R3kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739479261; x=1740084061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bEraBi59wANcLZn1tO53PfWT2ziVOrD3fPU9kZezwl8=;
        b=TADBaCqTXu4nb8zG1luaN/N9wx0EBVwc7oI84XjXRTqOs+YuAFecp01NGRiwqvRAAb
         Dtd9eYEKQ7w/z6Bm1FvHqjhw/CNGg33V+dk8kEZ7NVXBJBd+0+L8zQJhHPsPOWFuJiBb
         8eQAUa2z2heEELYSCkquwPXNGTzrCFK3nFD6CgWyGE+kbPALaXS8V7eWH6AA0YA6ycjr
         bn7WFKGK+LCBR17WH+0JjoXsq9bM3l2CEfIF6BcD8nhb/vtxhU53yD19RLeSqJ2kep8W
         m3arOIoPOOgUsvNICvT4ZOklQBpOHGva5+LQmADUbECyHb3tUZfUAemWqM7/HtT2PyXZ
         M2EA==
X-Forwarded-Encrypted: i=1; AJvYcCVaiZx5zP3gMY7oU3eqrIRR2o3BIQMAAwQK8URg0KPJiMrsCDTq1EtL8gXBAEYr1IOk9omZUHwiR0ddxZ839cXt@lists.infradead.org
X-Gm-Message-State: AOJu0YxcgsbZsu0zt87qa+o+L1klP8Lbu9QNXvuB5RtZV5cq3ke9QTQW
	ro33Ya1Fc+p2QJCRoEcBaTpQVHI5Jgy5ojyUqt2BNHyTdlx02Kza
X-Gm-Gg: ASbGncu2Cfe4QcTQI1tkCWd1pNgepWhAtBkRpMYVAp6Tz6svSxJx4ZVu2e2DoWWi//3
	/xVC3ftVd0TsaD+zusrp4TFDwO66Z01YVqYpZXw0EzfJaROscDgNuM/JzW0OfbEYRGZRptnJ+CI
	9Fpd1wP1RIsna24nbiXcBx9uFqez0JhC3H8TVdmVP6decs8GdnelD3q2D+411JaedhzgHB0rtzk
	G02SX5ncR9leABZ8kAjuPQ9OsJgDWJy7alG5cAKh7gQPaCoyfu7y9fxszqP1vZXCBNis8/sXFZr
	pfr0waCcJg/D4/1uU3BlmGk0SiRmRXj0GQpXmTAm3a0K9d4wGVDntYFQGSLcyItXMlT560ejaNC
	JMA==
X-Google-Smtp-Source: AGHT+IEbOrNmVdw5FcMzDyc8UAFIIE9JT0oKWoJ4F5Nc8EupSUynLsydmXg7ZIfzN8EgM3Q2HbhJCw==
X-Received: by 2002:a05:6122:8292:b0:520:61ee:c7fc with SMTP id 71dfb90a1353d-52077df02cemr4492003e0c.4.1739479261624;
        Thu, 13 Feb 2025 12:41:01 -0800 (PST)
Received: from localhost.localdomain ([38.44.237.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5207aa40088sm285572e0c.10.2025.02.13.12.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 12:41:01 -0800 (PST)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
To: andi.shyti@kernel.org,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v2 0/2] spi: s3c64xx: add support exynos990-spi to new port config data
Date: Thu, 13 Feb 2025 20:40:42 +0000
Message-Id: <20250213204044.660-1-wachiturroxd150@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_124103_014723_45B27DE3 
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

Exynos990 uses the same version of USI SPI (v2.1) as the GS101.
Removed fifo_lvl_mask and rx_lvl_offset, and changed to the new data
configuration port.

The difference from other new port configuration data is that fifo_depth
is only specified in fifo-depth in DT.

Exynos 990 data for SPI:
- The depth of the FIFO is not the same size on all nodes.
  A depth of 64 bytes is used on most nodes,
  while a depth of 256 bytes is used on 3 specific nodes (SPI 8/9/10).
- The Exynos 990 only allows access to 32-bit registers.
  If access is attempted with a different size, an error interrupt
  is generated. Therefore, it is necessary to perform write accesses to
  registers in 32-bit blocks.

Changes in v2:
- Added a default "fifo_depth = 64" to prevent crashes when "fifo-depth"
  is missing in the device tree (avoids divide-by-zero issues).
- No other functional changes.

Denzeel Oliva (2):
  spi: dt-bindings: samsung: add samsung,exynos990-spi compatible
  spi: s3c64xx: add support exynos990-spi to new port config data

 .../devicetree/bindings/spi/samsung,spi.yaml    |  1 +
 drivers/spi/spi-s3c64xx.c                       | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

-- 
2.48.1


