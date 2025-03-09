Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2873AC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 05:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8b1/uzHkmLRM1y/RYzrMjDEcfh/Uu5cXz1HbOjoZlx4=; b=VpEgjB9ZMki9e+UlJioS6OdV8I
	mUe5vrDPGSghyev8nlU2yk2C77m3roDO/vKA1KaCGWbIKzvQPD8gWX7xzlSy5ACq+mZ1Yg3q2w86D
	JwMP9PDlrG9VRxkjjnoEiC+PeIrniAMDOKMbFJEXWk7TKZeHewVhH8DA3S6vHdKFYxlrZiBb5SmS9
	9skNvw8Udk8BgME5prG61A0uDL3lD76GPn2YAzer5deUoEUvKidgp1n7NOVxNRJrWzUjptratoqyO
	6kp3r792mMXBo3vR5gdZitT7ABW2HEqkbufCtJlis6HVVC5JJP6M0ZIuFI0X6BWbQ3W1MTDD0nSE0
	QHVP1utQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tr9fT-0000000Hacr-1vhd;
	Sun, 09 Mar 2025 05:57:43 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tr9cL-0000000HZy9-2TQS;
	Sun, 09 Mar 2025 05:54:30 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 244DF25E18;
	Sun,  9 Mar 2025 06:54:24 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYC5q1AZTQE1; Sun,  9 Mar 2025 06:54:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741499663; bh=+LUmQPB+tURq91r5Yr6zdu4bs85M0PK3opWSYhnifBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y4dQ0MC1iW5vwk4PZITQHYD7bb6cinpFFPTeJAu29CNLRgt0Gm/XHTTqJNyr6zKPU
	 MCsmxEFVH9KXsIdubaojSyKEZVR4zvtCaeXq6a9FR2zj2AgibOWz7FZ+UYdhZEhoyN
	 5pUZUhxhgH6lgETzR436fN0vzbS5BAzFIow5HYIhD+Gb12S9yil9QxzrvszbB+VrVy
	 4IZxspKhM7yJW7mNMP7oqahmBQobzxoeITDjmAwXDPKUODqTwyVgzypgQ6wKjj3AGO
	 Hnn1k48TC9HOzBoiKfzpZwkyDgYiCmva2QS78L1geR1tokX/TGHJaDOl1UsBF/QKtb
	 Ku1wTUzT9uuow==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v3 1/6] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for RK3528
Date: Sun,  9 Mar 2025 05:53:43 +0000
Message-ID: <20250309055348.9299-2-ziyao@disroot.org>
In-Reply-To: <20250309055348.9299-1-ziyao@disroot.org>
References: <20250309055348.9299-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_215429_753956_F4D5096D 
X-CRM114-Status: UNSURE (   8.11  )
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

Add RK3528 compatible string for SD/SDIO interface.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 06df1269f247..ea0feb733e32 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3328-dw-mshc
               - rockchip,rk3368-dw-mshc
               - rockchip,rk3399-dw-mshc
+              - rockchip,rk3528-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
               - rockchip,rv1108-dw-mshc
-- 
2.48.1


