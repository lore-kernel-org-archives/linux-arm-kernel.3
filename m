Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51287C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 23:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tO98iZ6qt69jUEbguy5HbBMQSIcZbgLgv2m3GdQZx/0=; b=OywuoBMpHtqN7CdllGR0TjXrF2
	0rlAZmpqsfmcHpZ7cWvvfRTs3S+qrENFkacamkzb1jOgBT7AwP6YiqA/4SREaKojQjXYbM2o6ZTLp
	Rw5RYiJsY/1ny/zy8vt8zt1ZYbiPAwSZ39z9Vv8wTR/SwOkvCXycG7OCuDF/l6Od4em2FbmBngBuo
	rGpBadnePMjhj+wbUr0plnzy57AGkiz7hUfWQpqUl/953sBfPbBL8fbZA83wkp9BHpDcfH55fJ+ck
	VmiJgVuTj9FbTfDPzFXVQb/utVuRNcuQZTcrgMdGJ80b3k5coX8wi0EyNn9QKTw4XBSg4k65JXkp+
	nWWJZ9Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueixB-000000069qE-1e54;
	Wed, 23 Jul 2025 23:32:53 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueiuj-000000069HQ-0jgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 23:30:22 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso510731a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Jul 2025 16:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753313420; x=1753918220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tO98iZ6qt69jUEbguy5HbBMQSIcZbgLgv2m3GdQZx/0=;
        b=Yt1X8ijF+nlOwfQwWA8Invf0TXrCEBKTVF5PNVUwwN5fqvU3/o/OuyFpdEPAQqj1tF
         IcN0qu6dzx7d99v1MzEjX50HUivFpTOdammDeXk312c3mu9HUaKlXxS+SxgR6K2V21LW
         PzkGR6XQ3m1QyffnXKGtw+y9wCiXfEMtzbpDL50l45w01FeYzoDk2AyDkBEsn6Dq4unq
         XL9iw0T82aTxHxo5C/ERvI1BXq/7J/mQ/onN7i+fJBWY6q3qnU+fT2cw09qNAbvzB/c1
         yc1xNA+cISwG3Y6UnkDKDm3dgjPLY9lJTDQWYIcQJfxRdApKCPu3ZYFuGJrx+/D5jaqC
         M2Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753313420; x=1753918220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tO98iZ6qt69jUEbguy5HbBMQSIcZbgLgv2m3GdQZx/0=;
        b=JhRLHg7CPF7v8xtqpP56D9n2iU+CO9kLjJK5UI7/1ITqqucFpGxZ5UWTzPfcTW0bao
         eiBWDzxyxsuwNOgPSEANTxKRphxVuwDoKIr/JYMLCADqH3oteUYP9cwegOOkRH9EF8Dm
         K3cm0qskm3WJuEDl705pFXvGwSWxv5ULIWG1/+UxnNQmMmOYH+KuaTwZmTSdpKy4rmJe
         Fn0ZMjY/rlv3oAdeYvuyZMIuyYny2XCTqDBK/qmhZzy+KQEfb4KMEsauFdUXnATMi2na
         YwKPkTqTdFX8mP29YH1VaewXEIIE6fX8BY/8BoTCnIayo0YMS4U4DaeHcQpvvqaVkDMR
         ZyRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbOXj799N2HE7HEk5KDXQTH7OIHK5SgE43jPZPWu7X3LVMqHceeJJBh7FmjJMLU4Q9U+uLGLXdjzucdm0+CDzg@lists.infradead.org
X-Gm-Message-State: AOJu0YzMcxN7g50/P4sv00cU1b2TYhpWlFEczjcfg7gTccb6dZ0RMCOO
	EmwQ7TnK/cUiEcfXqYtsQztIMk/UACk47yCmUEImRBBXtDFbqs1iPYnM
X-Gm-Gg: ASbGncuMEVqjOGRHs/FV0c2q9G+eD6S6b0mTHR/lQMh/L42TuWGfA1RSlIrdYF/WarT
	TZUAfBTNKPaVD9RA8kT39hqZiLPEaud+Chk6lKe32NnLEnNlOC8QIOf6HmUYnWfK7Q9uglciMXk
	8lHd1wKYwsSHz53EglYbkcrPDQKplAERSC74J2U5tPz2aQ7CTFAnck8F99woUrIXirSrpdMADmh
	5PJCGSzYh4QfkAB7h8pEfLTgflD6bMLqHYqxA1xp8BOPvaIcq7fm5YsEogN0H9vTRdbgkHSjH6n
	ex2RLyM9/ByTvrqZx/WcXjERyNe3buW4UMWhWtU6788Fq15acSHHbHXEK2IH1rsyD9VnJRrRFhe
	AJfjEdmKqO0jJT4hdwAkBn9feF3KxJ2i6zM+yZuRZNO5ljpvtbtRuvV9Q+YuKCMlmNtJvqjnpzE
	4=
X-Google-Smtp-Source: AGHT+IHquOPa+liQqhO69zsGDdk2cs5CLA1oks7YvYmwOswhNilXRFUh4ud2Z4J4AOjCHvVS5OHHPA==
X-Received: by 2002:a17:903:1b4d:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23f9812b6c9mr72043025ad.4.1753313419923;
        Wed, 23 Jul 2025 16:30:19 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48bc6fbsm1260765ad.120.2025.07.23.16.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 16:30:19 -0700 (PDT)
From: rentao.bupt@gmail.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Tao Ren <taoren@meta.com>
Cc: Tao Ren <rentao.bupt@gmail.com>
Subject: [PATCH v3 00/13] ARM: dts: aspeed: Add Meta Darwin dts
Date: Wed, 23 Jul 2025 16:29:56 -0700
Message-ID: <20250723233013.142337-1-rentao.bupt@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_163021_231905_71271B41 
X-CRM114-Status: GOOD (  12.07  )
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

From: Tao Ren <rentao.bupt@gmail.com>

The patch series introduces the initial device tree for Meta/Facebook
Darwin AST2600 BMC.

Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
ast2600-facebook-netbmc-common.dtsi.

Patch #4 moves eMMC entries from ast2600-facebook-netbmc-common.dtsi to
each BMC platform because eMMC was removed from future Meta Network BMC
platforms.

Patch #5 introduces new BMC flash layout with 64MB data partition.

Patches #6, #7 and #8 add "wedge400-data64-bmc" board. "wedge400-bmc"
and "wedge400-data64-bmc" are identical except BMC flash layout.

Patches #9, #10 and #11 add "fuji-data64-bmc" board. "fuji-bmc" and
"fuji-data64-bmc" are identical except BMC flash layout.

Patches #12 and #13 add Meta Darwin BMC and updates devicetree
bindings.

Tao Ren (13):
  ARM: dts: aspeed: wedge400: Fix DTB warnings
  ARM: dts: aspeed: fuji: Fix DTB warnings
  ARM: dts: aspeed: Fix DTB warnings in
    ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Move eMMC out of ast2600-facebook-netbmc-common.dtsi
  ARM: dts: aspeed: Add facebook-bmc-flash-layout-128-data64.dtsi
  dt-bindings: arm: aspeed: add Facebook Wedge400-data64 board
  ARM: dts: aspeed: Add Facebook Wedge400-data64 (AST2500) BMC
  ARM: dts: aspeed: wedge400: Include wedge400-data64.dts
  dt-bindings: arm: aspeed: add Facebook Fuji-data64 board
  ARM: dts: aspeed: Add Facebook Fuji-data64 (AST2600) Board
  ARM: dts: aspeed: facebook-fuji: Include facebook-fuji-data64.dts
  dt-bindings: arm: aspeed: add Facebook Darwin board
  ARM: dts: aspeed: Add Facebook Darwin (AST2600) BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    3 +
 arch/arm/boot/dts/aspeed/Makefile             |    3 +
 .../dts/aspeed/aspeed-bmc-facebook-darwin.dts |   72 +
 .../dts/aspeed/aspeed-bmc-facebook-elbert.dts |   12 +
 .../aspeed-bmc-facebook-fuji-data64.dts       | 1264 +++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-fuji.dts   | 1245 +---------------
 .../aspeed-bmc-facebook-wedge400-data64.dts   |  376 +++++
 .../aspeed/aspeed-bmc-facebook-wedge400.dts   |  366 +----
 .../ast2600-facebook-netbmc-common.dtsi       |   22 +-
 .../facebook-bmc-flash-layout-128-data64.dtsi |   60 +
 10 files changed, 1804 insertions(+), 1619 deletions(-)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-darwin.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji-data64.dts
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400-data64.dts
 create mode 100644 arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128-data64.dtsi

-- 
2.47.3


