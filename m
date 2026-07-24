Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286E6C53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=; b=WS6/C91Ii4r0XKzZzTVlUoDsJx
	8rVNdF8UMI5nMkTKFRdroJyOaT7gru80XPkMCJNcl7QyVdmS1HTRTn7t+XVE69+Ml/7aZXszxzSdS
	Mw5GkK5KpO/3I9PZkG9k7woZLsv08YJzF+kJ42aftxJKEvGHu2t+Atq8DFR2M5QuyIJuL0v3Ow1Le
	s1BVSgnZS4tRFDoaK/LuRmLV8FTYJIaa3R/xWNgOAycHlk9fU+nF6Zx72j8RPXz12vByWuKxCrN+P
	Mf/HOgQlX/nihYU7hK/hJ3Kl451rP5k0JbjGZtFELuG0Pu/tIvjjGbJ5Ih7na5taFgKahgvak3hac
	UWVkPxMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhg-0000000GpcB-0ySJ;
	Fri, 24 Jul 2026 16:24:52 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnIhd-0000000GpYS-3jvm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 16:24:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so580395f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 09:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784910288; x=1785515088; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=g/9aJy9jrCEfoWgRCnfP5gww9C9oQKlije2N/qi0yq+FJW1dBdJZ3XjE5qMHM1nzo+
         EQvVMrX9BZMKZ+jej+N73WGxGNMytNRejFUF/LeLpO0LKBtpDiqFc/W5qSEjY9f5ex8j
         4CKXKEOo8gqspB+2vjEh/slXUh/N0qtizf+5YZD0zme5UezPsRHkfeSptG1SSFhSp3Ba
         6A5ZYfyaqXxfIoHyqiQKa6JGvqPP8Dnr6xfYYoxKvWhtDqlpTs/62VFtjTCIiroZV0Yb
         4ofYOvqsoJm4UragBu4L/zHbBv9rr0v0sFq6SsZZJqiDSOwEJrr7DkEaEHnZKdyCWGA2
         sJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784910288; x=1785515088;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=NwPQIczf/OOMzeAQJx1CrLmyZ7tYdrBzzb4nvtubXUOy7ykSqkiMCB5zw1QO+YbrD7
         f5SLEgTKp2KaKdswsqBmmtYLnMglm0Bk6VMfXrcA1CKWR35i8al/2r2uPwLlfDeHPlHp
         97Jw3EDid3UhXsOGZ/dfUa3IAcQCVIWOuq9JOVSc7Nti3coM7b40FNjcgyBUuRbY/df0
         ST4Ij2UCSzGSm/dekcUxPV9wOCuXQPoatAsJBfwTlcWkr02oNG9si1iupSgwi4R4dO7G
         wUhOdCt04P4Y+YDaKsrj2pNs8dt7uQZK9eihyotr5yB9Lg6lHqv88tjoPYFlwMPg00sC
         KI7g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4EICOenRrQAqOrrTUr6kySykiIgDG0RJ7fgEKeyWcn+mtX5eE5bOaW5AUi1oyO/e/rNz+/gWyUqI/GlpYqLoJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9ZNcmWROsjf4Qba6r80fQUXdwK9mIOvzLBiQvlcWWhXXnidTF
	vuvJw5zboAtk4JHfi3/zAcDwXx2HPR1RGZKctIhAMZbsQugt8NEkE6QB
X-Gm-Gg: AR+sD128qikHXFZF5QiO8XwJgaY32xuIqisaI9QgTxPYPEqv5sEWF9dV7T3s9PF2fIq
	Lg9uGu5+JiV6lPumY6G3f8idmYMfcE5n0Yu1ofZigYJvTwCJ4r2kVcVmwyGOtLlEcLgiPD3fOu/
	u8Lh7s1zEKC/kzXlS072Wu6PfvQ/9CmrzlI0JNv+UorCFKgtqxGatwnmOL38Bdn3i5NLVVWoYha
	CFI+IGkhIlxOPDxdQQkDyekgA5d4ztm1aSyxXXiHMOV93olcWEAcbIwE2fRCwFzKpkFE8gQ92B2
	u55waiYi8X/dQSYQJJJqsq1cAZW9OFT6Sswjjnc8HBbhC9VtRB5/8mBjsWRnhpamTXENlvJwmbf
	QiYAqATzOlmHQK4DqdjJY3xREvOPviAqlOYFbZu7nuRiPNNpM2Ce/Z8WPbd3z8QbFpvvQDsagVY
	82iQb8R8grmZhxpPZ1Fml98fJXrKPXeFip/8/hBj10VqmkCZskftUia8a2Io1S0HhEoA+M6d0qt
	7TErA==
X-Received: by 2002:a05:6000:4287:b0:47f:8192:b451 with SMTP id ffacd0b85a97d-47f8d770474mr10555881f8f.55.1784910288031;
        Fri, 24 Jul 2026 09:24:48 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5d9sm24366255f8f.5.2026.07.24.09.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:24:47 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 24 Jul 2026 18:24:32 +0200
Subject: [PATCH v2 6/7] arm64: dts: freescale: imx8mm-verdin: Add
 Cortex-M4F remoteproc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-v1-verdin-imx8mm-dtbos-v2-6-9d7988bd76f6@toradex.com>
References: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
In-Reply-To: <20260724-v1-verdin-imx8mm-dtbos-v2-0-9d7988bd76f6@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_092450_013412_3FBC9EE3 
X-CRM114-Status: GOOD (  10.47  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4F remote processor available on the Verdin iMX8M
Mini SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fc177f589cb..ac450fc6cbfb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
 		status = "disabled";
 	};
 
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
@@ -164,6 +176,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0


