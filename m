Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47739CA0FEE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 14:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otjlY6toMvtDur39V533kXrimoOF8Sx2+lN6J5uegpE=; b=pgpcEY3XM69gHzFGcAjibaLB+S
	mTtTtPC9bApi/w+RZ+8YztON3RbPiddWshnl/DMEQZ3DWGY5ODAXF4LQAK3clL6ze3m1+n0FATsTK
	Z8AQfjDv5a8itiKWfUdGBCB6JUn0yJaEqzij4bfMQTB/Dlo8rZUVyXSZflz4ldlY8aSLGuWklS0pD
	QvewNQiHoRHz1li0u/p/LXXXCW1AaV6FzYZWJTk2ZeHltr31QxTd2wOaUW2VUneKYF3gbD+3jDGvS
	1VmR1m11GTT9R+13xxQgcUfAlrOgE3JaZoY6/Rmep6dvQBIGkut8pt9NbVIxWxF0Q8bHyrFCqGWn4
	eqqhEvKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upSaj-00000002k7M-2xgF;
	Fri, 22 Aug 2025 14:18:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWw-00000001bp0-2H1l;
	Fri, 22 Aug 2025 05:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=otjlY6toMvtDur39V533kXrimoOF8Sx2+lN6J5uegpE=; b=nNKf+uehXTUGRdCvug1D2yz7im
	MLUbyojWOISmvuzY6rj9qrnS6EOwz1jIoCVOUzWhdRBisHuM9N4+vn5wWdQovd3QpV0aAd4wOJdrg
	eneZAxk82w1QUplzzoj42NwVE/AkQ72PLBfhmdqk9N3TLwO4yVE3c9fi8kck038I0qwVodEgGQd7U
	Qx8tdnx24eXx0d1sJqaxNdDyPL5NnqNFG0zT3AJQiGaZ4VLUMV8WBcJ5b8l5WFrQtJ8WdYGv53+VN
	tHhX72y3GMmeBXFTyjc4v38opKJTnkG04frzbgGiAJSM5ETxuBe88GF8bmgHDA74MImj9E18BnPUs
	ehwz8ppw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKWs-00000000qYN-2dGb;
	Fri, 22 Aug 2025 05:41:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 983515C6D2B;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A6A8C116C6;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755841289;
	bh=jf9fstk9wE+vQeskkAEyhsMSu0t2e6OAGeuGQ8JCH94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UBIRVmQRBEwi//GZN3lGsyqtkKQPW4jvDDlniRORX7SrUNwDGCDwjaCsXBM6I7mv6
	 qJnrj5AOcCtjJhcacJd6HAhX+Al/aw+uqx+S/cOcl3vcVzmR0nPg3+y4VmcaEg544o
	 1L/r4zmSMrMz1sfwI/gZizMnR+aAUz21sKN9mrQTtZ5zoxaihTYllOQAqZjAAIsGu8
	 4PK7uLLbiLDmkb0y/Vj0icgcjRdQ7V+E+t/kd3odvf8yVIriHcacVdLFGKPilJUY5i
	 JJ8a+A5z5jyvDRQ3Q5t7p7RHjyDZ6+R1AflRU99/2hmq3tXPLlzMKNlrkLa5IgjObE
	 wxPPqo0rI2vsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10966CA0EEB;
	Fri, 22 Aug 2025 05:41:29 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 22 Aug 2025 13:39:57 +0800
Subject: [PATCH 3/5] arm64: dts: amlogic: s6: add power domain controller
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-pm-s6-s7-s7d-v1-3-82e3f3aff327@amlogic.com>
References: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
In-Reply-To: <20250822-pm-s6-s7-s7d-v1-0-82e3f3aff327@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 "hongyu.chen1" <hongyu.chen1@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755841286; l=1145;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=kaj5R8JXVNmN1FRoL5Yj/r2ULPjPs0Piqs4W5hS0JIc=;
 b=mNWwLLgu/xNH88+Fcp2R6hiHPFt3qyqtax1tCkA5cWc5xDTGy40bxgHirv+0PdP4kSNEpHllh
 ErUZY0ni+izBFCMmB47LG4bOyeAuJGPyYKWMyELiZbj6DppovDMfviA
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_064135_007898_94F92E18 
X-CRM114-Status: UNSURE (   9.35  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "hongyu.chen1" <hongyu.chen1@amlogic.com>

Add power domain controller node for Amlogic S6 SoC.

Signed-off-by: hongyu.chen1 <hongyu.chen1@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
index 5f602f1170c0..0dca64a2ef9e 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s6.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
+#include <dt-bindings/power/amlogic,s6-pwrc.h>
 / {
 	cpus {
 		#address-cells = <2>;
@@ -41,6 +42,15 @@ cpu3: cpu@300 {
 		};
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+
+		pwrc: power-controller {
+			compatible = "amlogic,s6-pwrc";
+			#power-domain-cells = <1>;
+		};
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,

-- 
2.37.1



