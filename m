Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B12C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QqgJo74r0WlqLYuhJtnv7gtY0TWn0mA5ZdqgU3JWC3s=; b=eyi+COtDKXoUo0m1h9HVSfr+3m
	FKaq2fNwi+q2NnEDnA6gTJaRGQlRlCUop2CYPOugTISFAW0WuErvDfqCgN1nz0VDGKRCaDlydqoIe
	+z5ax4eGAUwswUPyeX6pH5VzyNHj2PdYxfj4ald10n9Px1DnUYnzH1UWftUznkCcfIAU5CYsNgLSI
	1NCTxaSeQh51AAk2kKJnapgQX/rxid4n3CMYWsR91ISYSe1UuO39Vv9zbRaidvMBBifZ1NhYhwe4p
	OxUCLCG2i7bTc7LfVn81FtDIy+t/NNTcQJu8PeB/BV/rGDJbL0W+o+E0sM4hCUfNGqLtdb1SUuvBJ
	+spGzw9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwFe-0000000CjVz-1CYX;
	Thu, 10 Jul 2025 18:44:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu7x-0000000CQhb-27Qh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:28:08 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3b45edf2303so1167787f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752164884; x=1752769684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QqgJo74r0WlqLYuhJtnv7gtY0TWn0mA5ZdqgU3JWC3s=;
        b=HL5hQm1ZTYQpfwmptHVKSlX9PxyYEUuB5HCE64+kxhZYagd1XZUddTuB3g5xMenjg0
         n2vJ6apZCUWQoQStjc/PJgQdF0bfhKp7NdAA2TiKW5lAIXepqeaJmtLpjT9tmRm1e7lx
         2VLhh4ZfWT9LZxvreBIfBMleHc4ZTDQM+m9u10+oVNriwxbnLYzgCX86StOQXN/Re9JI
         Sz5Sv8VqIwbnDfXU2Q6+XvzLHroSgKZt8ELso6EV3beuYggKN52GJOPb5m0aW5Vs7YHd
         8cXM3yiKEPaRRfpY4lBBhgQXGmZZQbUX+7aLUhMP8CunmMoWw9+NwcVSjGbWdOg3B9Tr
         Af6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164884; x=1752769684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqgJo74r0WlqLYuhJtnv7gtY0TWn0mA5ZdqgU3JWC3s=;
        b=uZbV3aEY6InoPeDFPdQTsS9V1qIQeSoP0Ktp35AdXyI2SHS9cH76pvEqFHLmD5Bdmd
         lR7QEaw0KGvM2INH5q7bDhcB22xxxtbgmIyPM6a90fKXEshqHJoIU21qoGA1XRfxUCZe
         w5RFtIK5kQGr+4DCHJqgnhMfKbLa79mQLzQ+13O+3tJeZ8I0sB0xt5rCFHot1Uxdeaa3
         yxSdN2WmgIKmXuSmSq+56HgDMpZWWtGZRhciw2ffiRaCrLV15uc59jXtOoSwEN1Jd0xS
         nFWdI3/GZ47N2DkQQh4ArJ7QHU2xaDdV6Gr7dRj1r8HAcgQsMKcCtJUNitU2dpy2J0J1
         glJw==
X-Forwarded-Encrypted: i=1; AJvYcCU0nDVbaS8I0uLx1R2I8RDOANlmUh0QOSCjCtppEDaXiCdQX+x8HF3NWQhhS7ALxyxoIt0xou/ntFU20fcvFb7g@lists.infradead.org
X-Gm-Message-State: AOJu0YwaMFLFNHvu8sIDtVscfXGMNujXoxRKsShLibcOK9AZEMDsNxcT
	9NAUPdGaYxrgkXADiEDvk2bbQ02d5ut94A8x62++Qa/G+INyGzl4fzx4
X-Gm-Gg: ASbGnctrbwV6Gm7S7NmRNppoHeYjoOYjJaHWCEui+eZyhZq94dMqOUvjqhpdEF/aNJv
	uN2GwVs3PIP0KKHppvBR/B9T7sNT2CsijVqIWt6mAemvjWwwElYkzB0Ng1ZUrXGYoA5+N6TVaiZ
	lsNyl6fNoNjz6xijg+axBdPAGG4nl5tt09BKQoBI5wtgiAn/GLG05RxDQ+ZPoenFhexogt5r8se
	AMPiEVzctU/IViI6tsaTOP96wzfFrCvHxnhzYIoXcV+/U1DcmuQlw1D2PM2ytDYfuK4HptPOGGx
	EBLAN3NCQ5RPs+QyowLCyLrV5pq7hwDoOLaK/Eyyb/mCU0pYS7u5tl2UfoQmcp3pHvt4ho1Ur/H
	OZGb9SHzuFUMabgiyElLTpHk78i4448Z/TeNbLfl1uvw90/PPdkOn1cgY
X-Google-Smtp-Source: AGHT+IHrtN2JJU7KZ/wvcGRYLftLYCliwG5hu54F4E+Tiy0PBPMifAGYKDrE8/6gfN/VqdB9UfZ4sA==
X-Received: by 2002:a5d:648c:0:b0:3a6:ec41:b9df with SMTP id ffacd0b85a97d-3b5f18a8282mr144662f8f.49.1752164883400;
        Thu, 10 Jul 2025 09:28:03 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d50df125sm60871005e9.19.2025.07.10.09.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Thu, 10 Jul 2025 18:27:25 +0200
Message-ID: <20250710162737.49679-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_092805_667035_4F97DAE3 
X-CRM114-Status: GOOD (  13.69  )
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

This patch series adds support for the Variscite VAR-SOM-AM62P system on module
and the Symphony carrier board.

The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
peripheral interfaces. The Symphony board is a feature-rich carrier board that
showcases the SOM capabilities.

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern where the
SOM dtsi contains only peripherals mounted on the module, while carrier-specific
interfaces are enabled in the board dts.

Tested on VAR-SOM-AM62P with Symphony carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
  arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony
    Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 562 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 370 ++++++++++++
 4 files changed, 939 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
prerequisite-patch-id: 7e8493f8ed01ee319f827119ffdac7531afbbc4d
-- 
2.43.0


