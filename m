Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD78FC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjlSL/XILbi3kwKJAgYk9svt+oaypPyLoMPUzXAfvac=; b=wNXVxuB20lTXWEYCCrFil/MPru
	sOw05jin4i045rWO9aMhBnC1/aoybKVBWQ7ZZNcrJWP2r2rsfFZBDX+XuxL408Q2akmN3ghiQm8xv
	EMivKRHaL9YNsfa7n4aJwtckBOlMfMVvc7km8XTZt1YWaNm7jg8mHo7IsWXdKZDhcTseTBJq3hLh4
	3U00ypeVS8g09WEQXrSzOS8FsZb1tpZXLlP7Db0w86WOKbAt11PtvjGhnkUzEXT7/WhRIqNYthybj
	QwNTWa6O9pfKiuawSjrcbBKIQXnjY5o4tVcYAdEak1oYyPBKlHtOsTT5n1vUCmKU3ZP0+19EA5XYL
	KSiHBgNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVjg-0000000AVoe-3SL1;
	Thu, 13 Feb 2025 09:42:20 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiViG-0000000AVR6-14sz;
	Thu, 13 Feb 2025 09:40:53 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5450475df18so646797e87.2;
        Thu, 13 Feb 2025 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739439650; x=1740044450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjlSL/XILbi3kwKJAgYk9svt+oaypPyLoMPUzXAfvac=;
        b=FEiNtGfsa/Br3JjQu1ixDKQQ81v0P38WwVmat1dg6zckioEUwUu8AjLeuIxkBqxyBg
         FzlA8/NtdCUbYSufj7AALjQq42FMr9gFQmdEpkcxiqM2S3kFzemvMqggLBe30QjKME5P
         8KqHbrzUiUF7ac6zrf91cKQmH2pbBlbKIzLDa+O+wBTpz0lYd4ysM8ue9vo7l50o8O4u
         AZIMWThcOgGbIP6I/7t9dE6JD974v3QvNudmMhv6PHyGRqn1OxK4BJgDVd71sPAIKXLB
         MllR4hcdIlNcEQY/jGM/LesTDnuCFCXAXXOqkz4G5l6lCawpBhEpN99vO1KXDgKE6v2C
         FMzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739439650; x=1740044450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjlSL/XILbi3kwKJAgYk9svt+oaypPyLoMPUzXAfvac=;
        b=ASDtk/rTEMRLTjW5HS02w5pwsZ/eVk+a9CpaZknxge5OPy0f7bnOo/Q50PZpKf40sH
         qChSHkjvaqGY4kPs32DFYySgVY4M9OwnujSoTO8FTXYediZDmLuyCY2sj6UslX2y6VnT
         FOfjXb8eD80w8YjNaDZWi5YvjX/BsseU6ZgIta+TC2E4AVUafWCDJb8t98huW71IwbYB
         UBe4SkzsXGZObbUjtzesxvm4v5bTlqvm90MvsefhJZqC6y6vwOJu/JMiqvH0l2MtheH7
         aI6KVIxttfQTDc47b5yX1v6//mwUvqZTzHP6WORVyGWFlNSWa8GxNDnWRQAOBmXs3HCQ
         BEMg==
X-Forwarded-Encrypted: i=1; AJvYcCUPM1TK158Y8etYKg2xwkHAXXJJJMqPtP6jb2zHgKsDVdvEnZ3eFT+slELvAdkqOwz5S+gAn360JtqIKU/Yziok@lists.infradead.org, AJvYcCVXpCfQ7+r1fKnpFTwVav93IsDZwbbRDFSJII1trlvdv0IUgxCPaWJp3dO1erGBZRirp911O7czyXBL+H8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyPkEKBN8urjJ6rucilwRcIMEHJ7MmGy3VzOyuNFh374CNLgjXp
	Ukt1jTJAsLfWs3gkN87W2w4oogO9E/BmBZaAieKHNZXff2azx58=
X-Gm-Gg: ASbGncsmxcaVbnYLA7Gs24jH3MkgxJ+NnXfV2L3sKd6EZM9FAR9YrdOvS7t1rfz6kAm
	LNJ6UsV3MCOPMaR0nq0zGxy+e5j5y3rMgUop1X7VdLUvFFLbehKJEZYT6rQtl/9ak7dO5JDCXlL
	4Y5lsXgg1niym1mLFt8+I9eFvrulosREnurGY2Gvy7L8pAT+P+ZNK7wd2vD/YOiVJFMMP0qOSWP
	NgN59QFhM7HXGWVQ1cSLA+CtDYH5gOfVLQG2HohAgn3eo4YZnoXhazaBqVvagkuX8cKLUpWtEVI
	1gRVX8h42//Yp7r4v7wYpNj3Xu5QteM=
X-Google-Smtp-Source: AGHT+IHvr3T6WF3qrEPOE/ncpkXsxhpveENebSm/95rH45l46XCcOYPEGrJRKlNkH6Z2V9/FiQs2Ew==
X-Received: by 2002:a05:6512:3e14:b0:544:1093:ee3a with SMTP id 2adb3069b0e04-545181165a8mr2484582e87.24.1739439649595;
        Thu, 13 Feb 2025 01:40:49 -0800 (PST)
Received: from localhost.localdomain ([178.176.176.188])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f10cae7sm119518e87.183.2025.02.13.01.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:40:49 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 13 Feb 2025 12:40:11 +0300
Message-Id: <20250213094018.134081-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_014052_296476_A6F7221B 
X-CRM114-Status: GOOD (  11.09  )
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

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

v11:
 - fix a remark in the driver
 - fix compile driver for 6.14.0-rc2

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 370 ++++++++++++++++++
 5 files changed, 477 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


