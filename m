Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD986CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GBaPp0u4Tgsx6RoTaJszoIAhk3SQlcR8pT28TWFVYik=; b=vQ1nc7cIev2IQxKI8yejHWRU6+
	1tpznliMVhjRiiNnpb5Qj+qOn57BR6btT3nLGt926i4OV+FmRQQpnqOo8MkS2f+YM4A3n0oEVVq9h
	PIYlqJpBPZktcWoyGkl62pgc2gJxQpnWyzlgPXrvfDZGE3gHi6tQtwXYZdghpSNgcToUkdCAXxudJ
	DZ9UBYNHil0yj9N8Uu8trcCLlcOK2JfE74mjkriXtVaODFN0lqRQPZPwlzmH6bpPaK6bZlJ8Rp+xq
	AeZw0hTH6qZZFttZwFLS/63+onC1w3VnSmY+LgFrJ1EZ8n0HunmurNqEifrNhujAXaWWDbCsovjHt
	3ahuAHUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyw-00000001wQx-2Bv0;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyt-00000001wOW-0BH4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:33 +0000
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c6f764f82so452952f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361589; x=1791966389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBaPp0u4Tgsx6RoTaJszoIAhk3SQlcR8pT28TWFVYik=;
        b=2IPEdL5eNTgJ4j5K7LZgAA4hlXFKlscYkcRE8yGVGnv8+t7YK8sgIQGr7fgIg+ojx2
         P/V0yvSMfJYnh+nls+2VoeOBMjFKjYcGjcu9KH+rj8c9kAaYGIoR+I4/SK1wiZKlPnJH
         WqJ12cJbx3Qz8X46liuI9BemlP3AtG4CtrkDs7xHyncv5kCKhJD+cJY7XzB5HrcSvWOW
         1s9EdXuBgUFNNTfVVlryZk4zuU9WfFItCcmFJofosrNeokWgy/AyyXzy9wO8hqQWnSGY
         GGOrgFXNQX0Y6MT8h2ROzkmw6SSVBKJ8tVSbM/c+Qzqbd0FzaFBG2NV99CEJ4O3SNH9a
         g+Mw==
X-Forwarded-Encrypted: i=1; AKwUvBwxPTn+K3pOQUX/5h4YYrSV/dBJRVycR0swwkqlIj/dO5Q3mw6t1eQxKvyxDmU8rrA0YBAElb+vLKLcTHkJ9jhI@lists.infradead.org
X-Gm-Message-State: AFq9FYJFENhQZpkarQZa+rRDp7cJwyuYa/CDRY48EUuIed4MUzA2wahu
	E1va/wy+CekVyc0lKCwQym1FjxEx8+hUHXdywHKkwQ26Z/PQoVgfT9aT
X-Gm-Gg: AYBFou3MLxssy0/rkqKoI+L2fSE3FkOor47NusdED2T9Hg5nr3LceGMt55l/eZ3+rN3
	bg5sTLP2UPu0c4L/pORNYCaoX3Jwmds6+WKUFGDRDXpJkebF0bYkc2CnPF7fuHoaSb9V+xOrI8c
	F3ysFOCyLsXOd6qTpnTj0fMMgFvAPDcEmIBLangj2nQ1JTmybg0g2j7LwOEB8il9V69icGf+F1l
	BGAUwpErY5fG/bJ/cJjwM2HSpP3RLQtak+tYtTO1FDMzpdfx8RF4TORHCO/9CyAwqYlDmm377Eu
	x9/aDUOMPTqlmMEAMrWOC/ThKIdaMjhGS4W17b1DuysyYlYkWcRrAgP89vGefatsLGiOTsEEkxd
	kCfI/egmPRi5wFgcn9Jj62ATL/MN4+TJseFb0UJ1lR2GmL9I843bzQt//30fZi7oVVcQAzWZS6n
	vdaFJcGebK0dbBQDUgmPZqDZmA7g/TrlNCdQ3tXVYCm8KoXnW8Ij33oqOLIHQErkwKbYyjoFTz+
	HQ93x5sNi8A4AKDZrRvdgjGfaDWKZFoYl6B8GFrgSRpSw==
X-Received: by 2002:a05:6000:178e:b0:48c:5358:f999 with SMTP id ffacd0b85a97d-48c7289d900mr2748455f8f.37.1791361589094;
        Wed, 07 Oct 2026 01:26:29 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:28 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 0/7] Add ethernet support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:20 +0100
Message-ID: <20261007082627.63807-1-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012631_122079_705F0E7A 
X-CRM114-Status: GOOD (  15.67  )
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
G12A has, but nothing described it. This adds the binding, the driver
support and the device tree nodes, and enables the port on the Khadas
VIM4.

Unlike the G12A, the controller reaches DRAM through a pipeline stage
with a gate of its own, sys_ampipe_eth. Nothing else claims it, so
clk_disable_unused switches it off and transfers stop.

v2 changes the RGMII delays, after review. phy-mode describes the
board, not which chip adds the delay, so this board is rgmii-id.
dwmac-meson8b did the opposite, and ignored the *-internal-delay-ps
properties. Patch 1 fixes that. The VIM4 needs it because the RTL8211F
transmit delay does not work here. Boards declaring neither property
are unaffected.

Tested on next-20261002 with "clk: meson: t7: keep the memory fabric
clocks running" (clk-meson-next) on top, needed before any DMA on this
SoC works: 935Mbit/s both ways for 30s, no CRC error in 2.59M frames.

Overlaps with Xianwei Zhao's "[PATCH v2 0/3] t7: add some nodes for
Amlogc t7.", which defines amlogic,t7-dwmac with the axg fallback and
three clocks. My board reports Synopsys ID 0x51, DWMAC_CORE_5_10, and
does not survive the clock sweep without the pipeline gate. I will drop
or rebase whatever overlaps once we agree. Patch 2 is the oneOf rewrite
Conor asked for there.

Changes since v1:
 - new patch 1: honour tx-internal-delay-ps and rx-internal-delay-ps in
   the rgmii-*id modes, and pass the PHY whatever delay is left over
 - vim4: phy-mode rgmii -> rgmii-id, and amlogic,tx-delay-ns plus
   rx-internal-delay-ps replaced by tx-internal-delay-ps = <2000>.
   Neil's Reviewed-by dropped from this one, the change is not cosmetic

Lucas Tanure (7):
  net: stmmac: dwmac-meson8b: let the controller apply the RGMII delays
  dt-bindings: net: amlogic,meson-dwmac: list the compatible
    combinations
  dt-bindings: net: amlogic,meson-dwmac: add amlogic,t7-dwmac
  net: stmmac: dwmac-meson8b: add support for the Amlogic T7
  arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
  arm64: dts: amlogic: t7: add the ethernet controller
  arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port

 .../bindings/net/amlogic,meson-dwmac.yaml     | 77 ++++++++++++----
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 87 +++++++++++++++++++
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 65 +++++++++++++-
 4 files changed, 234 insertions(+), 17 deletions(-)

-- 
2.56.0


