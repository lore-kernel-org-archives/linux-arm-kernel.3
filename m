Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED01C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BH3aXRPDtZZz9bN5AoHSMjbqzIj/NyvWxAh/Zcap9hc=; b=k/YqIR06wkT/sg5oZi8WG5NIND
	9RjGcONuN5yYTA2pA2etkexstrXbt9LKB3G7Qj0KsPz5At9KM9pfYzcJoS+qkizg1k0j8R0C9WFYO
	WNTTimJ8/9peKsAguyhX6ffGLJtTjBFiERKhtrncLRP5B9SoR5yUNpB+2ZIps8qvWob8cs+i2nNeq
	e8YpmmR3ph/lUjcgeX5bdFKHFj/cF3q4x3OT3RsTuHXtNn+OJ42utmlPQazm5Ga0dnLEU98u6LILt
	of03dMeApiGtY/Ay+FsZwzy/+Nm8h601p2Zxy3z7Hr18I6u9G9RIcmCMuZJ4mJfu03P3Wh6bf93/w
	NsMR5mvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey57-00000002Zez-2vsy;
	Wed, 01 Jul 2026 16:46:37 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wey54-00000002Ze3-46fh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 16:46:36 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2c9afadd78eso2759985ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 09:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924394; x=1783529194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BH3aXRPDtZZz9bN5AoHSMjbqzIj/NyvWxAh/Zcap9hc=;
        b=a2wKkcyPCVPnEOUyzQOP6lM9GnxOh8dr1jwbJ+au9h7vmYvHerl19o9f76H16okzbF
         f1h1gbvIQP0TPVfRXmMmE4Slwc0EBolX8U92GEEYUkGIULYffgsuPfLKuj+imcKenpIi
         gVXrwb1ub8S81DkEkIKBS7psHazV32rJ1K37h6xhaCZODmVkWFD7zVNRbP/8jIMFgI8b
         QwF4mGA7jcQ0/LhVcP3HfF8FM1+8lfUya6ioA9znEtjBgcBFMefsClimPIXBAQYD+wOo
         YSEOqk5dQXGlAk5f2oHJw+N3mqh1P3YG61OLpYgl/QtlmPoIYIsFO1ahXBtkMuVZOLhY
         Dq+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924394; x=1783529194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BH3aXRPDtZZz9bN5AoHSMjbqzIj/NyvWxAh/Zcap9hc=;
        b=oxvo5aPtjtq8ZjgNZUvXSIr4QL8VtNwGmIQeJpai+LjHzSrDnGr7GOeZGZsPu6XiD4
         i0TVcPQ/zEAC+asrViio1R8S8+0MFdNv6DVualAay0fTY3OMEUOblHFk2eB2qgg4W7qL
         fnjSg4ZKyWcY3bma7/Cirj9wNwbVY2anlYkhK9KQcIdl2oHXri/72WNBmiIHyPhLshCi
         buKTQnO1uSgfFYcGXBep3OtPbHFJA96zTEHPF8FZZyR3anAwyv5RtnQVdwkkUwyUQ5Nu
         JsYvVyZO4WRB0N5NOoJCuc3UpxlNz8/Artp4EAEeNYastNOfQWZ6E/2lZeFgulKt573y
         VyjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqccfHuPS1RbrJAdRa1MSFcPQvC+7cXuziDiQDNQ0Atryx3GNLcnkGPj6OcirKATPGHSNle02RdbpJYXWjDVK2u@lists.infradead.org
X-Gm-Message-State: AOJu0YwpCXNtUjrcFKd8USsyJ5KKhuXstCW0HxliSFVzeoTcGeg8kKx1
	IerifG8M309ZSig/NlcPSdxwVO1hxF3YA7ta1piAv7/Y1VCCmbPjDNLO
X-Gm-Gg: AfdE7ck9GezvJoZNtAcuHQZD36JB5uMs3i/mWsvcNPaaP0bBYdoyJ0uxNf0DGi75Lv/
	20cpkR+y+He5zIzIdLT93Mb5QllJ2dlXFPW9gwCeDHPeQ9XTUgWs+X81ckGLvwX0nT+J0m3R07x
	thzP64cenkUzUgcq3FgLE4Y9XCXZm4zAO9USbIi/9+LtLoUl9UEH6A54/M6EKhBkXzioWEYrlsG
	JdPdEUoCIcTqXoqpLmgpxa8OTq4mMQuZfIRW3KbNEEasE6BPms4zwo2p6BlfUu2LcC2KQqZOikY
	yvzNsPD8uUOWeBuyBbNYP4xDWY+Kpdhz6QSjUr5AINy5IHe4KjKA6GQ4HShfr/Z2w7Se3R+3e7t
	qLUAHpJbAsoABm+CxtK9CYl0jJgw6a45wpY7MIxD417vXjJO9q52zLMW5a5EfC3BI075vBr94rU
	IpUjc51tCntaw=
X-Received: by 2002:a17:903:19ed:b0:2ca:594f:feb8 with SMTP id d9443c01a7336-2ca7e942459mr25214065ad.47.1782924393632;
        Wed, 01 Jul 2026 09:46:33 -0700 (PDT)
Received: from server.lan ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a911f4csm985015ad.29.2026.07.01.09.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:46:33 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Coia Prant <coiaprant@gmail.com>
Subject: [PATCH v3 0/3] Add devicetree for the Graperain G3568 v2
Date: Thu,  2 Jul 2026 00:45:41 +0800
Message-ID: <20260701164543.3967388-3-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_094635_008279_51FD08C0 
X-CRM114-Status: GOOD (  12.75  )
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

Changes in v2:
- Fix trailing whitespaces and other formatting issues.

Changes in v3:
- Picked up Acked-by tag for patch 1.
- Fixed text wrapping in the commit message of patch 2.
- Replace the legacy 'gpio' label with 'gpios'.
- Add the Bluetooth UART child node.

Notes/Unchanged from v1:
- ADC keys have been verified with evtest and works fine; kept unchanged.
- The 'regulator-off-in-suspend' property for vqmmc-supply is retained.
  This is a known issue shared by most similar boards and should be
   addressed globally later.
---
Coia Prant (3):
  dt-bindings: vendor-prefixes: Add graperain
  dt-bindings: arm: rockchip: Add Graperain G3568 series
  arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3568-graperain-g3568-v2.dts    | 931 ++++++++++++++++++
 4 files changed, 940 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts

-- 
2.47.3


