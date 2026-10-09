Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49B4CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 09:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZJ4Upg1kLDpt6VtqbRdlMoDn76OY0lfMTsNgv+VL3nw=; b=skfnkbzL5udNmwW5ih1U6YSBn0
	Bk5FSgT41D/RiyBBab5zzhB53PhSV4BeLNSnAcugt9xS6+4rj+dt3feWp57IB7HLQDDicQ3gJHGPG
	wZLn+ZGwOoBz6Di4ohuXr3f2tHVMnr2Lzo3Uhp4rNLjuEXbYTnqXykQ6ffJCk3bsfQIkz4W5rlzs2
	drBJ1ny2eCENlCRIxq2RQ0du6ae1HLStBP/9oU0aO79Xamd6+kp0dt1QujZXI1ub/4Q9m8/f7GGL3
	jkPJCtGjziElVW24j8LVyzqRfl9vKx0glR5q0F6vMdHoAip9CtT86UqRTMtKEFSf35IbgTE3cLAPk
	sdF4fhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF72a-00000005w5K-274Z;
	Fri, 09 Oct 2026 09:37:24 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF72X-00000005w4h-42Ic
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 09:37:23 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 1E01B240101
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:37:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1791538639;
	bh=ZJ4Upg1kLDpt6VtqbRdlMoDn76OY0lfMTsNgv+VL3nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:From;
	b=j+35i+9g+vIo8mtvMkFjgssgQweIQ4rbKev6iZUT/IbdetWJjamLpD5AB8F3z/xBM
	 0U9Juam73h2l3wkDKQyQwWySBPT2NC3Y//VuDMI1L3Q0PXE8YBY+FTkuLCcnEQD8rB
	 ZGvBhZBKmaeua7bpAM+z7alb5E0ylu5M0xznr9dem2DGcaIZRl/OMIejSkMPdJIwJj
	 d/UUqo7Yf82JlAZuqLgX1JJxEl7/YguIVTnbymMkNmCZR/jChv7BoRz3IRd4fsBH+u
	 Wk1qIawtYlemKqwElR5Gn7no5I4TZ6xzz5wyGsd7MAufFKeNGL+PWQVWFbfwGolKLh
	 3tTbCbP4lrMlg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4j1MG45kllz9rxD;
	Fri,  9 Oct 2026 11:37:16 +0200 (CEST)
From: Mateusz Nowicki <mateusz.nowicki@posteo.net>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Valentin Caron <valentin.caron@foss.st.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mateusz Nowicki <mateusz.nowicki@posteo.net>
Subject: [PATCH v2] arm64: dts: st: add thermal zones on stm32mp251
Date: Fri, 09 Oct 2026 09:37:18 +0000
Message-ID: <20261009093709.19907-1-mateusz.nowicki@posteo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_023722_180755_20F9669C 
X-CRM114-Status: UNSURE (   9.51  )
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

Add a CPU and a SoC thermal zone for the two DTS sensors. The sensors
have no interrupt, so both zones are polled.

Each zone has a critical trip point at 122 C (Tj max 125 C minus
3 C sensor tolerance).

Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>
---
Changes in v2:
- Set critical trip to 122 C with 1 C hysteresis (Tj max minus sensor
  tolerance), as suggested by Patrick
- Add polling-delay-passive, the sensors have no interrupt

Link to v1: https://lore.kernel.org/r/20261004121200.64034-1-mateusz.nowicki@posteo.net/

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index b624f998b87c..da75e02f7c8f 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -158,6 +158,36 @@ RET_PD: power-domain-retention {
 		};
 	};
 
+	thermal-zones {
+		cpu-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 1>;
+
+			trips {
+				cpu-crit {
+					temperature = <122000>;
+					hysteresis = <1000>;
+					type = "critical";
+				};
+			};
+		};
+
+		soc-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <1000>;
+			thermal-sensors = <&dts 0>;
+
+			trips {
+				soc-crit {
+					temperature = <122000>;
+					hysteresis = <1000>;
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


