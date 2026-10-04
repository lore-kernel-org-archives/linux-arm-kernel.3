Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A308ECA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AG556z8R1LKXoPo0/Jo0pWxC6V+wNFmVQqR/a0fBV58=; b=Zj0Zxq+IeQPl64vkZAhn9Zq2l0
	y4hOabja4oFIRmnacwRUyd3Qjdj5n0JuQK38r1WncFM8CfkG/JKakC279t+U7x+Flm57auqlGDjB2
	82ReSujA5BBhd/jWdectH1cIN66cBnZOm8yY/ECMRpznuOkivpPFSWzeasmQNbt6A+Up/3AHZ2TXA
	IFaLYGkxiiQlBEQBRwxVHJSHMg5bJkBDWyBU+BsPzFWTHigEvCYlUQWihs0cnBNJIGJy2i3S7GASh
	l9Rs9n3FrBG82yF27+hRNy0Dw+ZPTkekmLmkwGNsVR60364TLJun+R/FKxjlbMno8k9UTPyi+2wRv
	T4mv3aJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL4m-0000000EmSJ-2H69;
	Sun, 04 Oct 2026 12:12:22 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDL4f-0000000EmRv-33Yq
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 12:12:17 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1FD35240103
	for <linux-arm-kernel@lists.infradead.org>; Sun,  4 Oct 2026 14:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791115930;
	bh=AG556z8R1LKXoPo0/Jo0pWxC6V+wNFmVQqR/a0fBV58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=PgC0y9P6AL+Hjdl2vXEQ9pAQyYhK/vtSmQr3DJC5nfDEEaKkk+QZVAms1zRQZM2GP
	 Fse8GY1m0GVQyc414aEn6EUo8OW5c5+lLDlcVDJLKxaBl2AtN+5HOHKW4101t0NDlM
	 tZsX8+E0dSUKiErG9KPiFTHjcxyk7NGVdkKyv+gCKlscE/vlNbk7ztQshlXs4kcm8s
	 whyNdUJtQEMSWKparH5cM8QeNRN7Tc2x3c9eptObx/2lzs5yDkKyg2WICT4J/6Qha2
	 Zgf6sj2ExdgDqq60PPMWnt+xFerSEA8rLaYoquGwix1H44WAwFghXpo5BTSVUFTh3z
	 h4ACwWWVVYvVA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyLx45Qn5z9rxB;
	Sun,  4 Oct 2026 14:12:08 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH] arm64: dts: st: add thermal zones on stm32mp251
Date: Sun, 04 Oct 2026 12:12:09 +0000
Message-ID: <20261004121200.64034-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_051214_104179_EB9A7695 
X-CRM114-Status: UNSURE (   8.02  )
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

Add a CPU and a SoC thermal zone for the two DTS sensors, each with a
critical trip point at 120 degrees Celsius, below the 125 degrees
Celsius max junction temperature of the STM32MP25.

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b624f998b87c..fd174c88b26d 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -158,6 +158,34 @@ RET_PD: power-domain-retention {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		soc-thermal {
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 0>;
+
+			trips {
+				soc-crit {
+					temperature = <120000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&intc>;

base-commit: f831584128ac2a36fb4fa62fe106793d08c2dbf1
-- 
2.56.0


