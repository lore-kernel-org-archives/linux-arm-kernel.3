Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C782CA5FF7
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 14:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rz6cs/vR0NyABn879K1Wzb/x9NhXjaOpqMscA8F5jZQ=; b=UJvN2gFWQ5kews4/WjAWTRmhVH
	0iG2T5YLWb6qjoShZMzCzO4Nbg51C6NniaARurpJVemanTRZTaFaArqq02BNGVwRf4X39ZYjTaac0
	Kw+rRQBnj6++M4J3T+XR1wJ5OHJDpvhnhi61bzKBZfpLKf5fjZ6jsh+bQrQ97IOr/hcEsIS7VMVjL
	WLwpdRJC/+tgcpc6PgIVxyjxKwx9nvXJWO1nPT5otwjr11kQXbk9M9tlm829foFWpJZarWmpwwfyM
	QjFvdibl6f4SG7VgQ3CYvEAkST32ijHtnTbBkzmHQ3/ogxJS0XiqeKtjIUZOTxK5uSbsF7TCTklpm
	iAGkpGSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOW-0000000EvEk-3mqf;
	Sun, 04 Oct 2026 14:40:52 +0000
Received: from mail-wm1-f54.google.com ([209.85.128.54])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDNOU-0000000EvD1-1867
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 14:40:52 +0000
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1725291acso104175e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 04 Oct 2026 07:40:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124848; x=1791729648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rz6cs/vR0NyABn879K1Wzb/x9NhXjaOpqMscA8F5jZQ=;
        b=ibiMgHiJwP+8mwRADQ5bJH1PVnTNY9G+DTUK7A7kZhdUNvFy8QucDLcYC3ZB1YNyOi
         HWsBwlHLZTkr7J4VP8xq2fEX4Q9gegvmC1xFMNVzykFicwSMJczK9ZNGiEBRCcw5SJ2B
         gys2H2l195r8XEMuL/PHsvSF2Cnwf6nC0cP+gGTsnWtIAT63eLms/s6m3xJBHgejvLWA
         D2BUngx1TGseLhf7REPNqGNauRTnHa0QHcZakW77tbx4m6NGMvCaZIApeBEFL5ybDZDb
         aOvOy/a2mnpoVfKWnH1k0F7q/P0ExNBwnDEFvjC8DSOHGJZep/pnaDpSO9lbS8TnPcuu
         giQg==
X-Forwarded-Encrypted: i=1; AKwUvBzatt7ouVIDnwOKCt2V/75KXNs07I/o5lSz01ACdseYhkHYpVy2JjDJYF0lZSttNKLImP2I0xdU20PfMemsLki+@lists.infradead.org
X-Gm-Message-State: AFuF++lJlHQKV0rmBJlctEv8tuxdaWnhCOd40Sdmq2bIOZWjVQR4DXEo
	c601j0b9Fpm4YZdSqhndstz6fRxJUlY9gtiYd5jOBU/3Psh3/2NPIrWf
X-Gm-Gg: AYBFou0UxoxS5TiDWiwYWRMiZlcz9MgGwcKQT6o3WG4eDXxM4+xPK0aPr9/qs0JwxwK
	Z8l5kFIeiUnhLbhIouYZAp+c1A4YH72WTlb9bj5xxYCXr9oH6Db1RZ2koY+v6Ov+KW+EyJt5RCV
	D0hAv8FqYxC6zqTXg9jQwGbm2ys3MzyPZ9QJ8oN3D1orGb2a1L8I/sjieibuK3T0L9RsKWfJRhc
	AZv9JfeN6ATYp+MU4EtdmqtR1YyDv1RgyCWCMqxwWGz771ZXHawapO2qA7xwdrmDpsvm4cFZ9Yb
	4RRfvhq8dYlG8WNY30ixs5VCQEkGFkuoy5aNZV/0EcE4k1PgDww9SiZ4i/lEQtAZIDWPCwq2DuJ
	pq46DE3oXmM+C/sTTpyLzZST9cacx6e9EQsXWxBvGmggwfeRLAU9UrwoxU/BbC4ZE7qIJIMf0v/
	NXRsDnUvj19gTLxzM5eizYI/GLN9CQuXJvE4AmPmHa5Ozd2Z3pmznQI4MZ24F4CR6WQU+KS1jUM
	u6L7GoXA1ELt9AVP9RXpH2z1iWpIMdzxQ==
X-Received: by 2002:a05:600c:b90:b0:4a1:62b8:9aa1 with SMTP id 5b1f17b1804b1-4a1680b5402mr88402605e9.2.1791124847899;
        Sun, 04 Oct 2026 07:40:47 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:47 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 0/6] Add ethernet support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:40 +0100
Message-ID: <20261004144046.391444-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_074050_330213_31115399 
X-CRM114-Status: GOOD (  14.97  )
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

The T7 pairs a Synopsys gigabit MAC with the same glue registers the
G12A has, but nothing described it, so the port could not be used.

This adds the binding, the driver support and the device tree nodes, and
enables the port on the Khadas VIM4, which has an external RTL8211F over
RGMII.

What is not like the G12A: the controller reaches DRAM through a
pipeline stage with a gate of its own, sys_ampipe_eth. Nothing else
needs that gate, so clk_disable_unused switches it off and transfers
stop. The T7 therefore gets its own clock list, with the gate as a
fourth entry, and the driver requires it. The MMC controllers on this
SoC have the same arrangement, and that fix is already upstream.

Tested on next-20261002 on a VIM4, with "clk: meson: t7: keep the memory
fabric clocks running" (clk-meson-next) applied on top. That patch is
needed before any DMA on this SoC works. With unused clocks being
disabled normally, the port comes up at 1Gbit/s, 930Mbit/s sustained
receive, and no MAC error counters move.

This overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback,
snps,dwmac-4.00 and three clocks. On my board the MAC reports Synopsys
ID 0x51, which is DWMAC_CORE_5_10 in common.h, and the port does not
survive the unused clock sweep without the pipeline gate. I am sending
this so the code is on the list, not to race, and I will drop or rebase
whatever overlaps once we agree. Patch 1 is the oneOf rewrite Conor
asked for on that thread.

Lucas Tanure (6):
  dt-bindings: net: amlogic,meson-dwmac: spell out the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 77 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 28 ++++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 87 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 ++++
 4 files changed, 196 insertions(+), 15 deletions(-)


base-commit: f0406245cb9855e6318335a8a223551354291a46
-- 
2.56.0


