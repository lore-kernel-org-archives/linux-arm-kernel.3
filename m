Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC29EC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 14:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r2SD1OSUWdCldoQhvBnkDEM/QjZ2T8xhHE0qihkTzOs=; b=tlEPQ0N+sNXZUCzhMIs+auGVc9
	l/Nsmlzy2BzKBntr76fiC5t+5t5uezEMrjGZ0jsIWCciXfqbr6ww5spZUmSrnf4aZEq8pDdlBdQhO
	U1wHXV7f4/Tlp+n/rhFV7xSXnKXHy/wBi28ZOEXIC9OtnyzudEe7sQu+wVkZs+QN+PR0Gxc+9fZL8
	mUt/Gen6FbJXQgpGI+bVH3wzr68qc6jmrFvDqMyacHxkrwCybW2RIx7cFNovynV1w/JUaS8lHODIN
	wPNDhQn0i+k7ZlbhCPyYW4Xa4TGWVtIoYJ6BW0XQNyA2QXGvBgccX3pJnDDk0IOO8fc7KxMkdlNy1
	ISnuuGAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Jri-0000000HPIg-2aS3;
	Fri, 25 Apr 2025 14:17:18 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J5k-0000000HH7G-1Doz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:27:45 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3085f827538so2951837a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587663; x=1746192463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r2SD1OSUWdCldoQhvBnkDEM/QjZ2T8xhHE0qihkTzOs=;
        b=JJf+sgxom5mm+SHG5LulbL82JG1v9aN6Z6VOzqUriYlMoWRiqP5/vTSCAa2YvZGhEN
         1+YAg/KHzWWX1LihFh82tGKAZLEMRphGLFLxc4peWo/3UmGl0cv4z0yru7fiTVhp6Xmc
         N+Y7+ykkd/5o5HqOfek1/x8AlRJWnzSJRwsRlq4w8fOLAujIeHH4ERDXNDyFBb3F+TAV
         h54RhtgQHSytvMZXdZ/6CgXh5WMDNnt1h72RkPbh5V0KPuiKHpVdcUMOpi0m2YkPfgHG
         1k13SaATTxPKDlTA4ujlklWBDFrCV+qHT5SR1323Q3NE2UsQux4dDw2fG9UQLriZ8tWK
         hJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587663; x=1746192463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2SD1OSUWdCldoQhvBnkDEM/QjZ2T8xhHE0qihkTzOs=;
        b=IhoWn01ybM4ERgSVWpFKpH4tUljrD22eWbbpJGj9+seQOWDXBkqT6rdJ6T07kq9hDl
         ZeDXzwPFw2pY4GKJmI+P+a47n8eugKTxEYZ3+5URe4yugYZdfm0huoYP8y4R6vCqEg4K
         ZdWDMuTcpkLWNzgSJQDmE8OP2Xm1g+uLIOzzX+Y8w4GqMyPsN+UyuqeadDygpuis4UdK
         I1nmweEnB8FvpGmllg3Ap3/Vn40c78kGZBzBZOmEo/okdhdPaPf6fX2wC/xZC8HgonQf
         6heihUBkiIBBQmKLuNtnwfmUrABiEWyIIe5mVFAq6H6+r39GPk3lajQz2UNiU2IMJCc4
         8yVA==
X-Forwarded-Encrypted: i=1; AJvYcCXgtR7sU4CAZI7Lu+BrQC041LeNLmNqNu10XH4zIVQ+YPD1WzKg5lViWqmcOUWEcIft5Cq5bG+9OQC8ud27a7HD@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/ZTS85iOkyh0Hxh8nViWWEinAfxd4Es2bq5i2F1ubdIICmvb6
	N1dVz5Ag/JG+9PmSMJklWB37kFQ7/8HizacXvLa7bbmAvnrqG/5G
X-Gm-Gg: ASbGncu7QEcLPl+bktvYW3PAaRuwZ96VijELdg54dxD/s4T3gYIFD3nindg0Dlp7Ycc
	vBBrBu0X2sl7tUgWDdw25TTi3iFhFVWcitRK1lkHnOUgEqBOWl47hgX8/rN/OCa/RRY/ZnjV0E9
	lQNbu9WOYVAI+1hX8BYbAxU1+5XXQrc/sTunf6pBsVwagQ6bFQhW+Qd8SZxc2TBq3JzuCvU8nkF
	QIT7tUnJ1q/aS9DqWmrwtGGdvehw4FZBSPZz6VGnk7bi6r3fr+PKtmswLF8Wf0nQHjfLHPo2qlV
	pRbpbZFIAHMmKlR5jDkFw8yhUzRWOcak9AcMQSaORa27aABVQLMYoA==
X-Google-Smtp-Source: AGHT+IGUB9p8QXy80D1gjG9EUjUhadcx0Mg+hVe8ZgGUVZ0uSDDJqvE79n62bP2uhHNnrtRUSn2xgA==
X-Received: by 2002:a17:90b:3d45:b0:309:f53c:b0a0 with SMTP id 98e67ed59e1d1-309f7e6e981mr3905427a91.24.1745587662858;
        Fri, 25 Apr 2025 06:27:42 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:27:42 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 00/10] Add rtc and suspend to ram for Maxim MAX77686 PMIC
Date: Fri, 25 Apr 2025 18:56:20 +0530
Message-ID: <20250425132727.5160-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062744_330834_D81B3585 
X-CRM114-Status: GOOD (  12.51  )
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

The Maxim MAX77686 family of PMICs supports RTC crystal clocks.
Device tree bindings have been added to enable this feature across all
devices.

Add information which regulators can be disabled during system suspend.

Regulators which can be turned off during system suspend:
        -LDOn   :       2, 6-8, 10-12, 14-16,
        -BUCKn  :       1-4.
Use standard regulator bindings for it ('regulator-off-in-suspend').

Tested on Exynos4412 Odroid U3.

Previous version
v1: https://lore.kernel.org/all/20181204194025.2719-1-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (10):
  dt-bindings: clock: Add RTC clock binding for Maxim MAX77686
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 Odroid
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exynos4412 Odroid
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 Midas
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos4412 p4note
  ARM: dts: exynos: Update proper regulator states for suspend-to-mem
    for Exynos4412 p4node
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos5250 smdk5250
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exyno5250 smdk5250
  ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for
    Exynos5250 snow
  ARM: dts: exynos: Add proper regulator states for suspend-to-mem for
    Exynos5250 snow

 .../bindings/clock/maxim,max77686.yaml        | 48 ++++++++++++++
 .../boot/dts/samsung/exynos4412-midas.dtsi    |  7 +++
 .../dts/samsung/exynos4412-odroid-common.dtsi | 63 +++++++++++++++++++
 .../boot/dts/samsung/exynos4412-p4note.dtsi   | 31 +++++----
 .../boot/dts/samsung/exynos5250-smdk5250.dts  | 63 +++++++++++++++++++
 .../dts/samsung/exynos5250-snow-common.dtsi   | 55 ++++++++++++++++
 6 files changed, 255 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/maxim,max77686.yaml


base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.49.0


