Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D00CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 14:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lDTSx29sE7yGWUgL48SizWkNhxpx8cSnW73JxIctDwM=; b=Jgmk0kMqFymwBW
	4qmGcMkndl2LqqJFAPdRxFjgwpi7svJsBhKGVSqivF3isw2SZt4u4eowFVxinsdsunjwCf+wHF+rI
	2q+VNtQZ+pddUiH142WQPiKOTC5LiEPDfBXNnminobwnK1X+rXHg9mY4U1hf96QBAJa2xmJolhEiM
	gwPZqNqgby5BFzdF/uMTkksyAQCw6JsqFKl5p4TmcKfM5Nj2kWyROeSfhJaC5Hg5DPiryIRQDUwPI
	ih3fbtC2wiZQAzT26SqRv1htpQJI2DEsrY68Kl6dPr/R2okQHJdQbx1hjVGaXPjyZf5HnzNdDhnB6
	XfixP7n+lp44x9mYjz6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7e-00000003AfU-2OX1;
	Fri, 16 Oct 2026 14:41:26 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHj7c-00000003Ae6-0Ld4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 14:41:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so396805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 07:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792161681; x=1792766481; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lDTSx29sE7yGWUgL48SizWkNhxpx8cSnW73JxIctDwM=;
        b=xuti/Iu+uH1p20C7m3CsLq4glRnOHuo1PrK1ctHnXgmFl+EqRKUDp2h+h19yasghzK
         xXabWugHB4D9m+5luPDK4KVGthX1lJMzdnP4DCzRUxFu2E76wEjMkcW/52YZduK/XPgc
         oZT2ncooN/5MuaPOJGxGOGrbeyj6t6DErkKIY0+X5cEtdhyJemxJ+AX04pA/EVBchcBA
         o33jsNpRGxmIBlWvoCS0ale9Xd7l4jt7VDdv7ftxeL6Spuk/05u6pifLdUapwoOi5CFG
         nq5O3Oddvz0XfBrB1bkqHeAiOVYln04YDqZJjKxsF9iYWqo2ein53TMCyPQvoZ5P4Hrr
         kBxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792161681; x=1792766481;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lDTSx29sE7yGWUgL48SizWkNhxpx8cSnW73JxIctDwM=;
        b=feeTUkYRxeBsPsmJogsYSUf3Ho+ly8h+MkQ1RFteEX0jmgFzNFRTbLFd8u6ian1ZRQ
         ZU8MngUvLcPBlVE1WYnKNyzxSv0O2w/cshXWsk9kVjp1ztj2QO/jqyIULpp0E74B+SUZ
         ggrhEZ5F7CCWdsJgfcM/l8IJLbRpTrBxhrVdPw5yPDFwMMKql8l7Cvytjw9DzIILyK9D
         QYvMtL8zdUqILxvQrszrvUk0S1OZvg8DtX00OI9GVpDMzTHJVQfZ8TtOwKFT2qK6vKmE
         Wssy3M6iJAUfAjOQ9Ym6ffxbQYBAY+m6Gog4suXGDGESFLZzfhyI1rTuAb2ELccKMnEJ
         pzsQ==
X-Forwarded-Encrypted: i=1; AKwUvBz7Tmf7ATV3LlkAZb0W5/jIU8kMMw4ZL5JxDUvLU2RCHuhswr2gYkGgSpFBowDrWLECk5Tcbere8R+o1EwczQdO@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+B4ogWLKYMwoCa4j5vSqUOMaPcGIqfHimGes9j9GvNNbNM+fN
	Pkmq3NKh1yNPEONDE38FHtPmjtL+45ltwP2d/aYgbYAVCmzvXsBocnmpRchx01/5atY=
X-Gm-Gg: AYBFou0WBegDU0PFrLhATY9bGW+LxTpSzBNpCSFX8O6dXlAMcKu5UGAz11EsyQ/ZUgj
	FZZDYwwNOsZgCfov/FrCg8cpqktBfvrrtFRYADpgLaKItXjBrD+WbWLP1oKt8B2oe8V03jDcFxg
	3CWKOTWmk+I8ckRGpeeGS61diDJEEM4wFDnGZ+pkXwbuZX378cin9r/DUYCdiV0LC8U0UyBcmm8
	J0dHqXGM/8PnW1b+dU8665MH6ixM8Zd6skhiRjlzdmZNCZf0vSHHNy6vO+VnJKFA349GBCpMJua
	pJbaWdyP+N9rmd13Ph+O3g/CS9E40QxvnKN+KMWlPjLbx/422Bey7xWzByFEnyPNTKrHpIQoFuF
	TWzn10sbxVfnn+F7OgveCCszAa7Z51RNCpg9gRA5hwMtNxEzEszK6fIg8pTW75UJcrwxyc7Ci0H
	AF++9ljrFqGCt6K0SvbLNogZ/j3D3d0Z8Sa68b983WarKUqa2YiTRx12xaKGeLZVfxA2Wqbh/mK
	MJ38y+y+OUrYVaIvpLIxZdYhMr10BgiGFGaEUgAamjHi5d2Hs1XbEelOqA09yigvCFRYw==
X-Received: by 2002:a05:600c:4e50:b0:4a0:1ea2:10c6 with SMTP id 5b1f17b1804b1-4a1d7600357mr109635e9.17.1792161681292;
        Fri, 16 Oct 2026 07:41:21 -0700 (PDT)
Received: from z13-ek5.local ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm5949648f8f.27.2026.10.16.07.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:41:20 -0700 (PDT)
From: Ettore Chimenti <ettore.chimenti@linaro.org>
Subject: [PATCH 00/10] ARM: dts: dm816x: fixes and peripheral updates for
 DM8168 SoC
Date: Fri, 16 Oct 2026 16:41:15 +0200
Message-Id: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTtJp9KmehXjAtpBRiOQTjUkh
 LtbdfkW/2+gnIUVzs0Gmd+iMk8VdGggjt10Y5RUDdZYT4YcLl2JI/KjzNlhegbyAVNRtG1/dDE
 YOg0ear1kHmT9nS/Xv/XV3zmW7w72/QMPW1QjewAAAA==
X-Change-ID: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6
To: Paul Walmsley <paul@pwsan.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>, 
 Andrew Goodbody <andrew.goodbody@linaro.org>, 
 Linus Walleij <linusw@kernel.org>, 
 Rouven Czerwinski <rouven.czerwinski@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>, 
 Christopher Obbard <chris.obbard@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792161680; l=1767;
 i=ettore.chimenti@linaro.org; s=20261014; h=from:subject:message-id;
 bh=1fzbjOZRndfB87fivaUbcLVWuyZChYe1cIR0MU0Y99Y=;
 b=c/xAc8G0qC65I2XNar40/+2zImigpn/uTTDF3dZn5BMSqPFymPmfzcSOUI6tdaHJ9aRtkU296
 KILAivamL85A1EvitrGzqXoQSSI9sfjEmI+hWkMKrjghp8c2KNVL8ob
X-Developer-Key: i=ettore.chimenti@linaro.org; a=ed25519;
 pk=wCaUblFVaqhuBTQt/hAtysafsAaEsqj/yOD9SPlz6NM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_074124_175480_7556C754 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

This patch series collects several fixes and peripheral enhancements for TI
DM816x SoCs and the DM8168-EVM board:

- Pinctrl: add correct pullup/down enable defines for DM816X SoCs, which
  they appear to be inverted respect to OMAP2/3.
- SD: explicit pullup disable in DM8168-EVM SD card pinmuxing.
- Clocks & Timers: Correct sysclk5 frequency definition in DT.
- Storage (MMC): Update MMC node settings.
- USB: Update MUSB node, enable multipoint mode, and prevent USB idle issues.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
---
Andrew Goodbody (7):
      ARM: ti81xx: Prevent USB being put into idle
      ARM: dts: omap: dm816x: Fix pinctrl range
      ARM: dts: omap: dm816x: refactor and align MMC node
      ARM: dts: omap: dm816x: Update USB node
      ARM: omap: dm816x: Match up capability flags for USB
      ARM: dts: omap: dm816x: Correct speed for sysclk5
      ARM: dts: omap: dm8168-evm: Correct SD card pinmux

Christopher Obbard (1):
      ARM: dts: omap: dm8168-evm: enable MUSB multipoint support

Ettore Chimenti (2):
      dt-bindings: pinctrl: Add devicetree bindings for DM816x SoC Pinctrl
      ARM: dts: omap: dm816x: use dedicated SoC pinctrl

 arch/arm/boot/dts/ti/omap/dm8168-evm.dts     | 17 +++---
 arch/arm/boot/dts/ti/omap/dm816x-clocks.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/dm816x.dtsi        | 78 +++++++++++++++++++---------
 arch/arm/mach-omap2/omap_hwmod_81xx_data.c   |  3 +-
 include/dt-bindings/pinctrl/dm816x.h         | 20 +++++++
 5 files changed, 84 insertions(+), 36 deletions(-)
---
base-commit: 045958acaa75205b31578cb22c4345e28dd2e4bf
change-id: 20261015-patch-ektor5-dm8168-dts-24b35c8019f6

Best regards,
--  
Ettore Chimenti <ettore.chimenti@linaro.org>


