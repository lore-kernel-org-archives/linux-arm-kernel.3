Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B32FCCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 19:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R3hXO0kohcojDK5N1gDQnbb7SNR3dS5AVJdqaUadyUo=; b=Ld6NCqtGGH2pnUJdNcr4iqDEAF
	28yHlqZWXkKUsAe42E1hg3B2Sful7aa5V5rMcOSNu2/21zsxjnBCmv/9EpKElSxMsg7HU2YZfgYoh
	UPabgM+h9mQrjzC+mUvcIua9Dhssm5KziqJ2bo/gi8NzbPayaCowh/AAlPVb12sU1H3Mjnd+MFhdX
	cnyjTHnjAHEBgZi79XmWKfWGGyb4rHUTzxC/lEozIGKVLNP8Fd6B3W5TNWouJfIJCumqgF4UK04g5
	rKZxWDJ+d0FkcSpXuK7V/+SUFIKqWceY8fR+ofoeiMz0eHJlje7GWHsTsrjOJTbb6vam5//nWvVqP
	J+R0FqQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0s-00000007gQO-17iY;
	Tue, 11 Nov 2025 19:26:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIu0l-00000007gPP-1qSG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 19:26:44 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2984dfae0acso796215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Nov 2025 11:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762889198; x=1763493998; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3hXO0kohcojDK5N1gDQnbb7SNR3dS5AVJdqaUadyUo=;
        b=H9HvR/JqguEh9ZOBOwuHGWD2bB4rWI5EpMJYq9RjIt4nGrr7R0C4eWyWPXOaKCPOSQ
         wSVp2DdDaGV5nu0edic6elaZxCU3YBBCnn4n3nORC48cblGL9wrSAOnxRdev441hs+gQ
         Oy35D8h1ik+wlsDZlkn1Ktivwx2GW23m64E4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762889198; x=1763493998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3hXO0kohcojDK5N1gDQnbb7SNR3dS5AVJdqaUadyUo=;
        b=v0oAveswgzi46PWBib/S1chcfX41zBa5wL55spkxMX7ZQ7CM9u4LK0uPQY4W1wLJxL
         gi/jpH86VMQhCMXYwQqb3NoS5VmeHirjkM/uu3h4w/pd4s9h3KHWtlkN7AA1lvp0oV1O
         j4dDowXb5bA3wXh2jnNrqpefoKe3MQItCVgAGByYXf/Rck7YH5XqKGvSlXEycXLtIlef
         7OdXYE3zHI/QgunRHlGVxXB2VTufHeOurEBypw7l+dubgapwPDuuXrBBo4//jIeVg967
         iNtYZMe5MYB79K4NtRjk4aOxzFHQbW4n3mHh6lbjwp4RFytY2H7/s8xnb8bsIXLxpAm1
         q3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTmJ04cOVumIiBn37dCd3TdaLh2xczdodOs5qzxa5JNB/FKiaB7jDKHAkAL7RjWHDCYvJOw44qkVFm/GdrmuaN@lists.infradead.org
X-Gm-Message-State: AOJu0YxE41ll6haL59NasvetRiTOSDWk/z1vA5ZPb6vltEifM1LJR0dQ
	+RtcnzHHk8GrWt+uR4V78ER2i4ZLnWzs45E5EpELuGKciCYY2bo1XPQ6JnBztWiUtA==
X-Gm-Gg: ASbGnctyE5X6gl+kN7OAqsjeEsYhRmUnZ1mwAcASlrOtCq2OLxVsEKTC+tdp6hQ2z30
	Q7S59Kb19jpAob+zf0y3Dh05aS3QxmPCzfX4VZniBBMnyjmYc5BdZHLIM2vqGbil+z2tRBrd4xi
	WH88+aVguoZqZufGk2b+v9v8Tr9JOuY2u+3hEcLHkVOrkkZZPRPIbPHiXD24M7UfTZiK8mdOxeC
	ppgXbvDhuAEIH5zEmdx0NZuOQQL4jhPJfl4OUTNY9a90+Cqndb2LY2wRwjj9VaH96tuk68lI6BD
	EbbVK8utvF+UNkNdduMIPoJOFsYdY/NpUYPypw01kH3AVl+3RQwGMA2bG6cecCE/kEYOIk3K6on
	ezVRgU5M75sdfSgb/z0VW6ZOgCBqlMUsK4xNuSlWJ2PBZSNDMt/fpWQNluL5vDYzyejqyAqwxQ3
	9JHuGc8QTYfKQ5w6bX/2HfpEPAZysnADhAt/WFHc47jGmSe1sx9yFwtJEc5pU=
X-Google-Smtp-Source: AGHT+IGzawljQPfuMSEdjKEu2O+TbUwNMNOGAm74gscUESQKCa416kMewGM3RhTWM1GA5ootFgKOLg==
X-Received: by 2002:a17:902:f684:b0:26a:8171:dafa with SMTP id d9443c01a7336-2984ed49524mr5944105ad.21.1762889198163;
        Tue, 11 Nov 2025 11:26:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:ba9f:d4c6:9323:4864])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dcd0974sm4861075ad.90.2025.11.11.11.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 11:26:36 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org,
	Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and mustang boards
Date: Tue, 11 Nov 2025 11:22:03 -0800
Message-ID: <20251111192422.4180216-1-dianders@chromium.org>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_112639_531464_68C779AC 
X-CRM114-Status: GOOD (  12.24  )
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


This series adds barebones device trees for Pixel 10 (frankel), Pixel
10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
bootloader these can boot to a UART command prompt from an initramfs.

The end result of the device trees introduced in this series is really
pretty simple, so it's expected that most of the discussion in the
series will be about compatible strings, file organization, dts/dtso
organization, etc.


Douglas Anderson (4):
  dt-bindings: arm: google: Add bindings for frankel/blazer/mustang
  dt-bindings: serial: snps-dw-apb-uart: Add "google,lga-uart"
  arm64: dts: google: Add dts directory for Google-designed silicon
  arm64: dts: google: Add initial dts for frankel, blazer, and mustang

 .../devicetree/bindings/arm/google.yaml       |  87 +++-
 .../bindings/serial/snps-dw-apb-uart.yaml     |   1 +
 MAINTAINERS                                   |   1 +
 arch/arm64/Kconfig.platforms                  |   6 +
 arch/arm64/boot/dts/Makefile                  |   1 +
 arch/arm64/boot/dts/google/Makefile           |  10 +
 arch/arm64/boot/dts/google/lga-b0.dts         | 391 ++++++++++++++++++
 .../arm64/boot/dts/google/lga-blazer-mp1.dtso |  22 +
 .../boot/dts/google/lga-frankel-mp1.dtso      |  22 +
 .../boot/dts/google/lga-mustang-mp1.dtso      |  22 +
 .../boot/dts/google/lga-muzel-common.dtsi     |  17 +
 11 files changed, 561 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/google/Makefile
 create mode 100644 arch/arm64/boot/dts/google/lga-b0.dts
 create mode 100644 arch/arm64/boot/dts/google/lga-blazer-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-frankel-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-mustang-mp1.dtso
 create mode 100644 arch/arm64/boot/dts/google/lga-muzel-common.dtsi

-- 
2.51.2.1041.gc1ab5b90ca-goog


