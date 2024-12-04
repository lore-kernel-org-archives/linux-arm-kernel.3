Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64CDE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrvwlR04qm2r6yLtEcwqQfocqUOn+5+kugRB+ZXnHmk=; b=LZOmRaqDBomJIekhDlRNcgcnFu
	9tK4CbPGZCAhvA3+7y2xnUUDvVkhUa1WphIA0wOXVwJz/17tjWmKnhPc7TRRGM00+UupaZ+AKuOYZ
	5VpZPX4/ECNYAFiaRP4E+3bewuvd7OiMvrbut6WSlhMk8e35EZMhDAJACeBg3D7kVKXptOxs23R5C
	iXRo2pTxJJMpQ22ico+b0Sr9/N6u6xcurTJKWP/vO2Hnyj4KlCsK/GMnpknrsbPcJJ5VTWZatarSz
	Se22DiM14CK+nIQzT83+XjwYpvm6GOtKFySHjPxstCCvlxoe03wI5+xpPkJvfHUWL/pV0FqMr0A5+
	y3BYy54g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqtw-0000000Cved-2WN5;
	Wed, 04 Dec 2024 15:02:52 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIqr0-0000000Cv0W-2xd2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 14:59:51 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y3LKG0FvQz4wVY;
	Wed, 04 Dec 2024 14:59:46 +0000 (UTC)
Received: from localhost.localdomain (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y3LK710qhz8sWX;
	Wed,  4 Dec 2024 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733324380;
	bh=BOopPzcToEprpdw2LIS55Y82go8hBPaS/MvQht0hXKk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CXJSZNLBlXP7xJOKeyw91iiFtUVza9hZIAr2xPPcF3+PDekLkrwDiNJa+LY1c54vl
	 D/noGHbrxvO2Oels2LpVvzzqJw0/xZAfWvMz9cxODtccoCeoEbiXlxgN7RUUClfui4
	 GLeXHMCp5BWVF8wfq1VrswtdR7pjzPoEAmuwkzqBrGkTAQMU93fj3bJgfWGtHlk7R7
	 lSuaIcVQJ8Q6hn65uOxoSXtr1AoRL+3NvVOYMp84JbogPuoC0F9ebPok8FOblq3j8P
	 Oy9RlbJ8uQfSTJxk3ILitflezCUYLKi6LW78yLJFNZzSwN9QIx2wTBs8kQiSU4Fp/f
	 ikjpsNqC3IkQg==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] arm64: dts: exynos990: Add pmu and syscon-reboot nodes
Date: Wed,  4 Dec 2024 15:55:59 +0100
Message-ID: <20241204145559.524932-3-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
References: <20241204145559.524932-1-igor.belwon@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_065950_774567_6DF97773 
X-CRM114-Status: GOOD (  10.74  )
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

Add PMU syscon, and syscon-reboot nodes to the Exynos990 dtsi.

Reboot of the Exynos990 SoC is handled by setting bit(SWRESET_TRIGGER[1])
of SWRESET register (PMU + 0x3a00).

Tested using the "reboot" command.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index c1986f00e443..2619f821bc7c 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -227,6 +227,20 @@ wakeup-interrupt-controller {
 			};
 		};
 
+		pmu_system_controller: system-controller@15860000 {
+			compatible = "samsung,exynos990-pmu",
+				     "samsung,exynos7-pmu", "syscon";
+			reg = <0x15860000 0x10000>;
+
+			reboot: syscon-reboot {
+				compatible = "syscon-reboot";
+				regmap = <&pmu_system_controller>;
+				offset = <0x3a00>; /* SWRESET */
+				mask = <0x2>; /* SWRESET_TRIGGER */
+				value = <0x2>;
+			};
+		};
+
 		pinctrl_cmgp: pinctrl@15c30000 {
 			compatible = "samsung,exynos990-pinctrl";
 			reg = <0x15c30000 0x1000>;
-- 
2.45.2


