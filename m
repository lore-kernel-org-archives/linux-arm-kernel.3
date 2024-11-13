Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C1D41C18
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=; b=qTqqOPeprf0DEKLii0SIKZDCm4
	tkxmGJNNgGMs6M/DLtAO6AJBQ6EMT5FR1gbgIK9EJmBamMMaRToQfBqinvLwEj97QquKF4oKJuAZv
	mquNC+RpOliceqfvONXK5DdFw7sHCL8JF9QEgtjukY2V4bvgHNjXfZqmX+LX8gAJw4PRq432H+E3y
	kWMu8JvgjRJCOuD0GuRinL97efsfghJjMdEKaLz2cNM6LWUhqWpqMDCykJ24KkyQllyRsbfFTewPy
	iGYy0TN07qj7Do9BP+Bpyxh3q0NjKNmCA6srJP7g0T7/rEYmGVaJOAe8GpVyxiQMCCDUx/gdqkoI7
	mM1cbk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tB9CM-00000006APv-1Eye;
	Wed, 13 Nov 2024 08:58:02 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tB98r-000000069oE-0OKl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 08:54:28 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2e30116efc9so5390226a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 Nov 2024 00:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1731488063; x=1732092863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=Cpcb39sjgA1SEAsPQNdHBXBYgkbCfhGZypUTBgjOeEFQRAxKn7CtegSQoqPnbFue/e
         IglV1HgNAqv0b5WYNfLP71zpzJXWR0y30aduBZ9CosvwfwkkotdW9h4hFVDN4JJqT8NV
         a5m761Y9/TDCDqRec+UCrnkrlk2OwvtbxQYt3A8QeQlZAJtUGCoJeybV7u91DFwYHB8d
         sU6cUbcnnPRruszCmSVoxOiGGr/GYBQF3TmyLkSWMirQO1/qRNkYph3yt1azuuZne8q9
         sGNR+9Myx9tUkvIJo95iVYWFTBN04PjWWPrkh3SkMfsO+ud85sOE5CQ3Vy8PsdLU+Uz7
         04mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731488063; x=1732092863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L+rrra6YcHTyGPDT2kFoo1nrPsWAkOb2wY+PkJ4JfA=;
        b=B8JnZJiNzotPtXfisSz1AmnNCF53Z/10jlnoUNLnI93AYIveZz8nDUjuUxqmXIeN6b
         hOj39waNS55DA/tLmuNt1x4g+slZ3lS5IDes+FyvnAI2HgIOb60QtQOKCrjRbf19Vo2d
         gyaqfylQNuhFpGklvQTGlc2VKST1JRgNVz/1PIvkrity0oUGcuUyPBsj8Js/2t72sByn
         yMjXLBoJPT9k3qa+MWL5jfaybZa46b6j/MRttZgQVxouJpS2uvAefmIMp6Nh/KLFv3DQ
         sZd8Z8uXDmbFtH6Ur+jFKHkqE+qDL4zjIY9HaW9mILr3y1JmphY67HurvEgFWcwYE/nz
         bZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1HZwOUYAizZW43qNcXAg78keb4KZMCylV+LvHvUGsvoXT3uRVVhXVYVAD+T0aYzpJVpGi0LypcJIZfyVs9OK0@lists.infradead.org
X-Gm-Message-State: AOJu0YwS6OS+ebjfRKFcb7Rt2MAFDtqHI9BbUwGNSlTfAlvAHAoga1nJ
	wjrRNtNtBk8o91PdsfmTqK2jU/kwr1pE1SdMEbTyLr7hIkaQsvqM9++jbiyp2qy6Q4yO07+jxA=
	=
X-Google-Smtp-Source: AGHT+IE1mBLN35IJhMVQm6eou9wLzp1bNB4yK6xl5v6c0Y8AKWezVqTcxycvcqArYyozh6RgCMxn9g==
X-Received: by 2002:a17:90b:248e:b0:2e2:dd25:9b00 with SMTP id 98e67ed59e1d1-2e9b1741130mr28464867a91.22.1731488063521;
        Wed, 13 Nov 2024 00:54:23 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:a83:68dd:5f1c:4ed9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9f3e952e8sm953160a91.7.2024.11.13.00.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 00:54:22 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: linux-amlogic@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 0/5] Merge RTC Haoyu HYM8563 into RTC PCF8563
Date: Wed, 13 Nov 2024 17:53:50 +0900
Message-ID: <20241113085355.1972607-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_005425_363540_A2A0F156 
X-CRM114-Status: GOOD (  11.47  )
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

RTC Haoyu HYM8563 has the same hardware structure as RTC PCF8563, and
operates with the same device driver. Therefore, since we do not need
two drivers with the same function, this merges HYM8563 into PCF8563.

This series was tested with PCF8563 and HYM8563 on khadas vim3 board.

Nobuhiro Iwamatsu (5):
  ARM: multi_v7_defconfig: Add RTC PCF8563 support
  rtc: pcf8563: Add support Haoyu HYM8563
  dt-bindings: rtc: pcf8563: Add Haoyu HYM8563 compatibility
  rtc: Remove HYM8563 RTC driver
  dt-bindings: rtc: hym8563: Remove hym8563 binding

 .../bindings/rtc/haoyu,hym8563.yaml           |  56 --
 .../devicetree/bindings/rtc/nxp,pcf8563.yaml  |  18 +-
 arch/arm/configs/multi_v7_defconfig           |   2 +-
 arch/arm64/configs/defconfig                  |   1 -
 drivers/rtc/Kconfig                           |  11 -
 drivers/rtc/Makefile                          |   1 -
 drivers/rtc/rtc-hym8563.c                     | 587 ------------------
 drivers/rtc/rtc-pcf8563.c                     |   2 +
 8 files changed, 17 insertions(+), 661 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/haoyu,hym8563.yaml
 delete mode 100644 drivers/rtc/rtc-hym8563.c

-- 
2.45.2


