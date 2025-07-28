Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E0DAC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFS8WLhu5nncxHWvLqslWdzfrwNohIejybeTSzxXKkQ=; b=cIUINyAnHDSA8Gns2fGHXcBri2
	tAjetI1TxQvv3hBLoY7KjYfe6DCdDFRtYBlntIyssFMjVSjX54m0Q0iJd64/AxykgRWfVq1eEzUZj
	QtW1b9hZ7ffZGR3th5cMx6LfOhc50Vt/zZb52fxDsivy3rLo+uBMYhT6ttxEjMSx9xuCOKXv27F54
	UeCL/Qp48TDvM65ZSxmelgLYwOQcDI9uxBdHr+xbrYXSqc2alvowvD22vh1ezhsO/U7sQPYeEbmRj
	tgE+WBe7QP9nCiBe6XD8dkiLs9J6aMFbzf42zyLsfd1LW0yp5+71Ss1udf194U4HaAfRvsMBYaTEG
	ydR2rFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugLF7-0000000EFWn-3VSW;
	Mon, 28 Jul 2025 10:38:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL86-0000000EEkI-09yR;
	Mon, 28 Jul 2025 10:30:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bFS8WLhu5nncxHWvLqslWdzfrwNohIejybeTSzxXKkQ=; b=JQzc0bFMOfnO6l1+CzHOC8xVRn
	v+XSxrO9tDZ5uabEGqBBOIPRhTGqZ9PCYmSRXlySGGlzywLj/Ppx8uJ3prW6RhydUaHaPqw0B6f+x
	pTC6s7zXitHftqVQK1pUvKTTlDqkFSitlYhFMNp29i66CVkcU8b1GCVsnF9PlP5d6F5Adk7/iiZsT
	U2JybX1JT7c31A/3pY5hPy/iYU2iQU2Aw5xwWbOkLgm+7z2gIkE6aiPd76Luc4vWgl2Cmpx5SnmWt
	tNyCKHzNLGNViYkE+nSPxJGZNX+RG1yLwLuvoSnoiC6FbYcTVYEhBw18S8lPREK6N3WCSMMhQPXdB
	elVY0nvg==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugL82-0000000CRUs-0iN6;
	Mon, 28 Jul 2025 10:30:48 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 7F4A420543;
	Mon, 28 Jul 2025 12:30:44 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gwt0ajRAJT6O; Mon, 28 Jul 2025 12:30:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753698643; bh=qBq1mAbqPGcYbgpJSKXM1JGiaWrzbRbM/TI0PBE0xY0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TUchOU/SQEB9L4HSGKdfTXHX2uvc99PVC0fxVj0a+JJIdSxcTldtffVCTJCs9RrDR
	 mIajvxVZ9IRcn0Lwwle3hMQP0Vtc4Oo+Dpe4nAnunD8BKTV3Ekc6d6/Wl7uEwSdc0L
	 Hzq9xapTQwd3XnVaHLtFWoPaW/dfVkaF5QZh4RDbkCVyJmssQCHpSzK2lzBBTWnR3w
	 xMVTIFSmV3t3s+OXhASb1HDuEu1uI7bja8wX5Quq4nuqjcIwUF5x8zl9qPPxg4AnLQ
	 /6eFhhX5rRbJgKsjtJkbvnQ6KuTjOlHb/4IiJvg5r1K9d0hRF5tutOWzWoMYKBjDOQ
	 NWeh9mz4Rlw1A==
From: Yao Zi <ziyao@disroot.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Yao Zi <ziyao@disroot.org>,
	Frank Wang <frank.wang@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/6] dt-bindings: phy: rockchip: naneng-combphy: Add power-domains property
Date: Mon, 28 Jul 2025 10:29:44 +0000
Message-ID: <20250728102947.38984-4-ziyao@disroot.org>
In-Reply-To: <20250728102947.38984-2-ziyao@disroot.org>
References: <20250728102947.38984-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_113046_399355_732468FD 
X-CRM114-Status: UNSURE (   6.62  )
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

Though isn't described in existing devicetrees, most Rockchip combphys
belong to a specific power-domain of the SoC. Taking RK3588 as example,
combphy 0 and combphy 2 belong to the PD_BUS domain. Document the
power-domains property to allow describing the information correctly
in devicetree.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index 3e101c3c5ea9..db293d2fbf1a 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -45,6 +45,9 @@ properties:
   phy-supply:
     description: Single PHY regulator
 
+  power-domains:
+    maxItems: 1
+
   rockchip,enable-ssc:
     type: boolean
     description:
-- 
2.50.1


