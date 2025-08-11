Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92AC87FDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiIt8rDf9PzwkCULipFjt5F74mFBlv9AMUVadk/6kZU=; b=jPCW33om/YpmhFbXZHxdfM2TOE
	YLkLxteU/3NOWKKOuTIcKxSxAkt8R+w//21dqWRB+HVnWuBKuZZwlnhkd72LjcNsrxJSn3gExNoQA
	2K18yYmitHjIhPsS0fxRKwhDXfO7kVHnG33cRq+JuDAcazrZfodyzmQxsR2M/4xW+wDO8zEiagjoc
	+uH/ogspre4p7eeNedpgG5prbe0MSNlJq0ITazHXZF3zna5tzVrXAEpQG6/nhIy2AG4nyZPs9QbaP
	CITjC8oiOZ0n8F5+82GgTvuJ3d9MMFjpOx1NXdP3VCvbSFghaMWq3Zvo6DLzvd/C5U80mj0soZh9f
	kOzqPoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN65-00000006j34-2094;
	Mon, 11 Aug 2025 07:37:33 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulN0y-00000006iNB-01bo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 07:32:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-24031a3e05cso26581775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754897535; x=1755502335; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TiIt8rDf9PzwkCULipFjt5F74mFBlv9AMUVadk/6kZU=;
        b=k5+wxD5LD/FRm9qkHpOYxBbrSL3s71Snjq5zAXy3Mv9Wtsu37QiqBfq9R+uHiBhWtN
         8MvK3aj9a3SiOFhHl2FQ24Pdy5nOj3tLEvd9tUq18nyLoPYm6NqMcmWUjOTswF4UKREp
         hbfBs8UimEuqRYQnAb51QWyIzoY8estk8F6Fsrk9x/ZJj5+U3P1g1dga+rw5//Zi3yw4
         WftLJ1YvAPR6IWSEPWdlARc+RlDSyOXY8G08k/bIktUKNiJdUImSRK05f3v42Vy6y1IM
         hLgkMF9yQfQp49OAYNRoiV7gVI9DeD3vWk7XyZrvfTQtA6NQLm/11BI36XXaUhlMTB4t
         3udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754897535; x=1755502335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TiIt8rDf9PzwkCULipFjt5F74mFBlv9AMUVadk/6kZU=;
        b=lc5JwRlpSXd7dqFintMOHauCRcV+IT6hSTuzEuLPyKI0q16PvowmZYGNt/DBDewJCR
         HBBXAZlJzLJXuPp+4H9FkOdtxArAeRifYx5VkRhchtUQz1/mpwAFIsWFv8KigUqMm+6N
         AjPKUD+LuLiXPJs8nv9JXZQcg2K2eclqlBi0wzXbWDLWZWMOu7JYbTrcEMfAQILPFURc
         +p7RFyGRAlhyuf7tjJh+5W+PcPE+JiBi2ydUiIeaMaiOQA4zQegJp6eJ+lVu+PJK4lM5
         9QSEpmIwZ0+5gOB/JapitMzO9idLcuKlx1+Jp+8DMyXBZdF86LfJBSHTjco05rypzfcl
         FMOA==
X-Forwarded-Encrypted: i=1; AJvYcCUBfmRWWHc0egrFJy5Sx98Uo+e5Qs8qzq5QIegNFEjN+3LGXxX//UHaVp+hnvCQ0pqXlhbkc6ADchiqHg1xKie8@lists.infradead.org
X-Gm-Message-State: AOJu0YyYTyWU4+W3sBbrN4S9skXWII3N8U+gcWAvqErXeEYpOccCC0VD
	UlDFKnD5BSc7iv8mv+/am44xqq2I1pdkd+qIeFtTuaWNkcQRqYFi9gHJ
X-Gm-Gg: ASbGncuHA3C34jMaZqr9FKF6QjgVGx3CQavM8FiZRi2olr6tN6vauAH3h+jr9OHAFgE
	UyAqnfOb8p95dkBdRFBR0PGFTeG+asrE0i0wWFgnRC1Dsl8bfR0cZviCPjbf3ILfwSbmGsnvcdm
	2FwEixv+ezYCSpCC9lhAB06L3Ilx3azXj/zDtmKbOxrYRD7M1zZQ+8eckCV9wdNhmw1kSKz+kHs
	KlX6WVlSnlB3QEQ9pwQI3pG896r/C19ncbDJcAz7twEac/GlxxcGBbwmKCv7JyHgsJJPiNyBJIl
	aXBoI2biuboMl3PtgY6QZyMiHtjJMMTWmzSBomY5JfzRbHoQ2asnjfwuhVEVcWP9AgmgHuy8Jdj
	5IAwdUKcPU7WREi2Ix9pL5a6PVbbu0e7gfpl2UQWPyafaOVVTbNRMFpAeB7/szeiWKaisffE+Ch
	ZaVjdo/t95G8csYpMUds0qBA2NYC8f
X-Google-Smtp-Source: AGHT+IGQHxLvRHaO5AnELd5J7hy0PgS8cem/4j+c/MAN4VOfDSifl4layNco3O50N4UNoO5r58BnCA==
X-Received: by 2002:a17:903:1acb:b0:23f:c5ba:8168 with SMTP id d9443c01a7336-242b0466eb6mr250081165ad.0.1754897535067;
        Mon, 11 Aug 2025 00:32:15 -0700 (PDT)
Received: from peter-bmc.. (2001-b400-e388-d3b1-e90a-ba63-d547-4584.emome-ip6.hinet.net. [2001:b400:e388:d3b1:e90a:ba63:d547:4584])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1ef59b2sm267624575ad.7.2025.08.11.00.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 00:32:14 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] ARM: dts: aspeed: harma: add power monitor support
Date: Mon, 11 Aug 2025 15:32:06 +0800
Message-ID: <20250811073208.787063-2-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250811073208.787063-1-peteryin.openbmc@gmail.com>
References: <20250811073208.787063-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_003216_044932_A80CC9F4 
X-CRM114-Status: GOOD (  10.68  )
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

Add INA238 device on I2C bus 4 for the PDB board power monitoring.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index b9a93f23bd0a..741d2d9b6d03 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -373,6 +373,12 @@ power-monitor@40 {
 		compatible = "infineon,xdp710";
 		reg = <0x40>;
 	};
+
+	power-sensor@45 {
+		compatible = "ti,ina238";
+		reg = <0x45>;
+		shunt-resistor = <500>;
+	};
 };
 
 &i2c5 {
-- 
2.25.1


