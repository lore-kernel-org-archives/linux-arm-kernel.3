Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC517CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VaTXxl/rE8HFkzzKKmqnaZrWWCZtpV0ev/8QevFoQa0=; b=jkP6m58qQyGCJQ
	UyLhWolTckyMWK5s6BRc1/OlKqgZ985obdDLChe2gULn9f2x1beQXaL9pFkNvZZFDwmVjz2T4aE7m
	k8Vvtt0DklLZITXhyTjxH3jykm8KnzvuIzfD7eYz97hGOMe22HyO00Fju6cdUoS49DRe6yTP6diB0
	HFqE16upVd988gD586U8EhGb0Sb/Xsx/4LoDKdGOOp9nfocBOsnE9E/dU3CTO5zdgmbGlVkWGSntr
	jnbCF4BMygyAUXJ6PeHPdO6fz9bGe+5HFxmzDBDeoDqkySsqam9hOuQpecQkgixAaVkj9YUERQcIY
	YvzP3LHBYZfh+7coLtBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJFo-00000007Pw4-3WSb;
	Wed, 24 Jun 2026 08:46:40 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJFl-00000007PvH-3eML
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:46:39 +0000
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-36b95eb4bb4so535570a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Jun 2026 01:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782290796; x=1782895596; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VaTXxl/rE8HFkzzKKmqnaZrWWCZtpV0ev/8QevFoQa0=;
        b=qENcih0kVNJjhubf4d1tfGfDC91Nl2Fm2BR4qFuB0R+3Sh58XVvbatuGn8iODyFqfo
         Kl9Y7deKQaDIwkstNV4J95QK5EjXBsl2WEmWGsIKkEUE2PPdXpRKzhi5ftt/yBDspImZ
         rgXYem6aJQd8uW6m2CaO8nasMAZa1rALH/JUjuW7HYjBgE9YQjgqRHbKGppt5Bf8nNEU
         XKWN51zKTyH9MKkjusUSDQ/iPDt3rJF5WI6zO8+tv4T9JRRVuW/OAziOqAzAHNXcQGZr
         JBaqadOejQLhOS9zTN39qHO5KnyQHDLfqDbURZ7pFsFHk+wcj+xjugwGl5veXT0SfSue
         A+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782290796; x=1782895596;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaTXxl/rE8HFkzzKKmqnaZrWWCZtpV0ev/8QevFoQa0=;
        b=UNA6LS+HaF4EWzJ2b+i69i5GN3P6HIKVIQyvvW2EZyyy3Dym5uA2cWxIt6Y6QMVKB4
         NDqHi9jj6tZC/I2Nrp1GFYfnMak8N5nIWzvz9nf/q3SapGb4jQyUsv1bAOeeGTRv/z6L
         6sXW/somHyBrx1lM4b1UZ3wSsDd40EhNZL5CFQY0MwX9vtQRRuH4fHBR+amGh20nm/J3
         C5vXFCo4d0x0P+Jcm+OWtpfoTKIOCiivBpby0Aj2P9FGr6G11bbB82EfErIk9Bg+UA4x
         8iAkw0BaSAcmZlyhLCC99eptRlcqRiF7BTkukLnXjfIjAjIkOonEGm62zM1bDhh5i/1O
         OPpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoIsjB61mFZa1ITGdGqHSrqAIqO9Otc1RY0yVwAuXXwHHO9V7cA8qsdaUjvhMbbgplRMQBV5aelGOvAxxl4hZUh@lists.infradead.org
X-Gm-Message-State: AOJu0YzukBgJ4fG1jn31ddacy1ZLSoNGPwWDM3pHgWkIFeUDMBniFl3k
	BYbMWEigwoZcsvq0uVJim2fjotW5TxtR+tP8QHNXHo5Q9oLA252FoY9/
X-Gm-Gg: AfdE7cmdF+KPGq4E/kf3sg0LdSYkQDmkwLF3FGxKG2PQUt4X2dd/uLq8lSRQ8L9uHkO
	IdR1IZ97q2Zwbh7/xQcVIdn1Nrp6wFkppWWPPOw9IdqoJUbjJHgK8tfwOvlh1YWDiyAw0H4rb6H
	O8F+c6KP5vt2OijHlJYDbsz53OdRzWZCRpqPWQJSVKv8Hgal81K98xfDZia7MfcUiub/R1fr84Z
	IAPGETNgqP8h6LN8CK23wBzxRarYkNnAjAk6JqYyTbRHe7n6Kg3lRuD8F6YbCxyufNN3eTAqIlw
	sj05WgvQDL9V6s037CbnRTyPA0//elbYZZ02schiwsv7rLl+7YGCpuZWbtxSNAJ5Vild2w1F2RG
	TD/8kLthCAzR2vuIyTPUGaB/g0d/uPYlxhJu/L6r6hEr/yuuedWcoXLxq6igSnbLBVpfFJ1Qn2n
	NSI1Et/6m6T/X629xght8xpxd1
X-Received: by 2002:a17:90a:d005:b0:36d:649a:39f7 with SMTP id 98e67ed59e1d1-37de42bb597mr2631365a91.22.1782290796126;
        Wed, 24 Jun 2026 01:46:36 -0700 (PDT)
Received: from [192.168.1.101] ([218.194.36.79])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37de3d152f4sm2138146a91.14.2026.06.24.01.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 01:46:35 -0700 (PDT)
From: Yanan He <grumpycat921013@gmail.com>
Subject: [PATCH 0/7] ARM: rockchip: rv1126: Add support for Alientek
 ATK-DLRV1126
Date: Wed, 24 Jun 2026 16:44:37 +0800
Message-Id: <20260624-rv1126-alientek-dlrv1126-v1-0-5aef608a3f64@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3M2woCIRSF4VcZ9nWCSon1KtGFhz21SyzUZEB89
 7GZLr8F62+QMRFmuEwNElbK9I4D4jCBe5h4R0Z+GCSXiiuhWapCSMVMIIwFX8yH/+LPR2O9m/V
 Jcxj3T8KZli19ve3OX/tEV3496H0F2yK6+nwAAAA=
X-Change-ID: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 David Wu <david.wu@rock-chips.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 Yanan He <grumpycat921013@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782290789; l=2033;
 i=grumpycat921013@gmail.com; s=20260618; h=from:subject:message-id;
 bh=iJnYjsvlFEQcTUEBJKIAHZNJZeAQoRS5+2RUTfWmdhc=;
 b=eAmpN/LKqYFNFMAnnsJDd9ohedM5OOImfapRIiKBxmQZmuQsg34keypt4x4eW24GHkC/Y1ECB
 nUQ/RXKU2rtBBikIZF9qoSlbOOUqSmnD3bfzpThwHvlNvdNsa/IGU1a
X-Developer-Key: i=grumpycat921013@gmail.com; a=ed25519;
 pk=oWrY8KwXIunZWlYBV76NG2A3V4p1bJ+aD45Mr56ErTw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_014637_924183_EC46A4CF 
X-CRM114-Status: GOOD (  11.72  )
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

The ATK-DLRV1126 board consists of a CLRV1126F core module and a
DLRV1126 carrier board. The core module contains the Rockchip RV1126
SoC, eMMC and RK809 PMIC. The carrier board provides Gigabit Ethernet,
SD card, AP6212 WiFi and Bluetooth, PCF8563 RTC, ADC keys, GPIO LEDs and
audio connectors.

This series adds the Alientek vendor prefix and board compatible, updates
the Rockchip DWMAC binding and driver for the RV1126 GMAC reference
output clock, adds missing RV1126 SoC description pieces, and finally
adds the CLRV1126F core module and DLRV1126 carrier board device trees.

The board was tested with Ethernet/NFS boot, eMMC, SD card, SDIO WiFi
enumeration, Bluetooth LE scanning, RTC, ADC keys, GPIO LEDs and RK809
audio card registration.

Signed-off-by: Yanan He <grumpycat921013@gmail.com>
---
Yanan He (7):
      dt-bindings: vendor-prefixes: add alientek
      dt-bindings: arm: rockchip: Add Alientek DLRV1126
      dt-bindings: net: rockchip-dwmac: Allow 9 clocks
      net: stmmac: dwmac-rk: Enable refout clock for RGMII
      ARM: dts: rockchip: Add RV1126 GMAC refout clock
      ARM: dts: rockchip: Add RV1126 I2C5
      ARM: dts: rockchip: Add Alientek DLRV1126

 .../devicetree/bindings/arm/rockchip.yaml          |   7 +
 .../devicetree/bindings/net/rockchip-dwmac.yaml    |   2 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/rockchip/Makefile                |   1 +
 .../dts/rockchip/rv1126-alientek-clrv1126f.dtsi    | 277 +++++++++++++++++++++
 .../boot/dts/rockchip/rv1126-alientek-dlrv1126.dts | 258 +++++++++++++++++++
 arch/arm/boot/dts/rockchip/rv1126-pinctrl.dtsi     |  10 +
 arch/arm/boot/dts/rockchip/rv1126.dtsi             |  18 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |   6 +-
 9 files changed, 577 insertions(+), 4 deletions(-)
---
base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
change-id: 20260618-rv1126-alientek-dlrv1126-d94abdcf8580

Best regards,
--  
Yanan He <grumpycat921013@gmail.com>


