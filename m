Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D6F4CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 12:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/X1EUZv6VZmBg89R97U7Jcn3hsaSlapQZa2iSHSv18=; b=fELwi0RVBublNI015tHRHFm+v3
	cRJ3YwEICeAveHV3iapvaEwVuxe0Gz7DJPDklR40jRRNBtWbk/xUw0MtvJbJo914snaP7uf91BnGR
	npsDxxSQCdXfqnNYviVKF7Qj2FEeL/10Ir38pMij+x7TE4qPln3oagOueRb86XsO/9QUF6sFqfcIC
	neynvkjq7trJocdXAt/RRYFLLL1a/CPZSCkErwayQjId3hz/rULoUHp33uokE6vjcKi9yipI8N6Sv
	gJMY5jYYVOmcqSrF/TP6Z9QuW9L+TjmxCgfyfr0G8idZHwu1nLL9/QrfhNkJRqVak/ZfeIEnwCxQc
	fYW1G+SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zy-000000096xI-07od;
	Fri, 12 Sep 2025 12:08:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux2Zv-000000096vZ-1VDn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 12:08:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1293744C25;
	Fri, 12 Sep 2025 12:08:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C488C4CEF9;
	Fri, 12 Sep 2025 12:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757678914;
	bh=Y/xLnOvWrgoYia/dvIuxe9JbBGwmEs4sMATELVf8sII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFpDf6/vXJKgu9C+t3HaXigUZGGBHOlHz7Kt1tfBpNYo90CyPwsvXk+ZKnv5g0nxS
	 OEJk14rnhZ2TgDVEYoZkasfjHCIpcF+JuivMSG2AlLHE5l4cCe0ntilyyr41pJOni7
	 LLUGQq1slpPr+CVVcHeGDtCNW2dPHPNrh+fD5xzCLa6VnXGLKyXHpin28SWfVFPRgy
	 1n7m8BYhTZZW1VGOuiIpNHGgbTNwE5DYdzpsNI//IbvH79GZsl2mhzwHgXoy1WBDDn
	 jbOS0Qnw6yvTTqW970lC51W87bWq9YQ9BexK+7WL9eoK12wmbV7q4J3FrouB6gLqKm
	 SwBh7DI8SCRSQ==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	Andrew Davis <afd@ti.com>
Subject: [PATCH v2 7/7] arm64: dts: ti: sa67: add on-board management controller node
Date: Fri, 12 Sep 2025 14:07:45 +0200
Message-Id: <20250912120745.2295115-8-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250912120745.2295115-1-mwalle@kernel.org>
References: <20250912120745.2295115-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_050835_426451_819E5356 
X-CRM114-Status: UNSURE (   9.61  )
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

Add the node for the onboard management controller which has a watchdog
and hardware monitoring.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../boot/dts/ti/k3-am67a-kontron-sa67-base.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
index 5755df689752..7f05df9111ea 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-kontron-sa67-base.dts
@@ -416,6 +416,24 @@ vcc_1p8_ret_s5: ldo3 {
 		};
 	};
 
+	system-controller@4a {
+		compatible = "kontron,sa67mcu", "kontron,sl28cpld";
+		reg = <0x4a>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		watchdog@4 {
+			compatible = "kontron,sa67mcu-wdt", "kontron,sl28cpld-wdt";
+			reg = <0x4>;
+			kontron,assert-wdt-timeout-pin;
+		};
+
+		hwmon@8 {
+			compatible = "kontron,sa67mcu-hwmon";
+			reg = <0x8>;
+		};
+	};
+
 	rtc: rtc@51 {
 		compatible = "microcrystal,rv8263";
 		reg = <0x51>;
-- 
2.39.5


