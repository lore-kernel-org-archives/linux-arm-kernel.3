Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B465CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=; b=g4eCNbhIPKbEdd9BkGMqf5tWX9
	O9SUnlmqTikZ2DWTZzqv5ZUmNI7fAIuLIAGsczb+TiunP15btoctAsHhgSeVZ6pMQFtmvT1NB/DyH
	R5nwI6l2Iq8Due0PsINXRKkxN2aOEHMhqFuBzwJi+bAZgB2cUwXxKidpAvyEzdB+4ctkM87vucvr7
	ItkeSqAuMGgsZmB1mtIovtJyE7aSGc8uCRoBAe0PAGbzypbZu7JRLicSjBOP153hCBRc8b5/q5Zjq
	fah1qlnKe0ZKR+cyoKukHv719g3nOIij6yk+d2rgQyWn64OlY1e0Bk4qgwRiZ9NhL7ZctLiGvaAxJ
	lm7GmF5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXb-00000006OX3-1FOx;
	Fri, 03 Jul 2026 08:46:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfZXU-00000006OJh-47CK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 08:46:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-493b77b150aso2269455e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068383; x=1783673183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=j5wRuCSO3bZp1aUcb6VxOX0/gVajsjBr+0ANMUQvr5ON/LcK4XYEeRVaCVgHsvPd1L
         zkw4Kf/fgnqG6blK2XHqkaCu28zT0qvtXQKHSpwMYU61fBxX+Y7gzYVrLDblnh+QXyxY
         PrYdkgc28qN2qS02Tr09UxYjHkAm00pVO/n4FtiYtUtUgUFbozOetffnOS9cZL+xiwTC
         o0wT+Wb+9sxqbgAnb+VY3S4ENGKWMqHchRX5SiZmVLzn5WF8YvedO1eQ4Mrtod9wMvE4
         gnUaFk/xONyxCqjWpv92VF9uBQz2+NLY3bj5vg+64X+DHHfWiS9YoaRctfKIkqlyvvT8
         JqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068383; x=1783673183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tphBelM3OpoRDnS0cz/tlkI5Y11yJVN2jJKRfJqazDM=;
        b=LzgiMwNp4w11TP9iOsDSwqZubL3N/WlRvQg/YyUsoAamtNjTSa3+ha5DeXcbuNCEVo
         U03sR3RzO9/uHbF1A2jpgKq1AnC3kfg+Qw6cuVly96od6Hdjdw3LPukPSX7pOGrzpaJd
         ke6ZxmxrQcYdPlDj/hyCfjAo/hA4TEGnpW5as5VrOspmOHHJbaYYXWg3ryvlWNWDIoZY
         qfRmT/pOy2E5MjQdT/zfnkE/XjFgOnJemj7Im+EGjeJmihkPUf1b3Pp6nHcK5+Gbpzca
         +/Du4e6Y1NxDWYU3yGjlzcuKIvYwkveGoGRNRzasKaHzaBOqKOYPisljQI85P4I4jk3e
         MP9w==
X-Forwarded-Encrypted: i=1; AFNElJ/1h5km0GuiYlVMNebNTBih4/CzLmhHmLJU15jkWM35oD4UNbZMe/lGf1BLl0mrbzelDd41XYqoiYYvEN1gGxkg@lists.infradead.org
X-Gm-Message-State: AOJu0YwOT3v/5cw5gvKCHDCieSU1VT3i8jDkk8OgBQefejF2P/XLH12o
	SVMos5bPZhqPnDL70IrgbI8GPcbJ3cE9T8JOFdOPei2lUk/hcwKP7H7b
X-Gm-Gg: AfdE7clXMnHFCk6pAU/l9V37ynt52j3M8chi96KIOUCFT8FPQCJyXjb/O8pBpnEoyEe
	aq6Jm45t2H782wakITZzGkjYeEirEl+WlRzacBh7gF0XbKZoeDFtRnFWLjhcUiNULa7FF+31Uln
	EZOGkgo6HiJUfXG326fuXwTyW5gbkVuvX4czKfA1dM7F7/P0p42jDlWZ67b3c6btjilWXCbszQv
	KnP1QFt2nbVGvEMNQjz2yud+WlDXzigk0BVJY1G9R91xqbf+OKsa8yNWeVDihzWXRO5HPUX5IUo
	svc6/mDCC32bojU+dSysx+DRYDKovaVEkA5X6D7MEHhiDy7rTJHpIlfYTybmQqy8cnwmZkr2XpP
	eCWeslVOOFCOod73o3pWxXEPJ8ta5iwuL+XbJ/FFXYSwortRzntFFWXXabS87U8nNcf3oYPqk4+
	KU25YN4tW54HWI0fxgY5IkobAzRpNEsiavVxQYc82nhPIbMMDgSjWhrFXjNFpupcL/myg4PIcBC
	hxW3tOtY7f1XJjhK+Jo//FR3A==
X-Received: by 2002:a05:600c:4206:b0:490:e913:656a with SMTP id 5b1f17b1804b1-493c3cf0d3emr72946345e9.27.1783068383286;
        Fri, 03 Jul 2026 01:46:23 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 14/15] arm64: dts: imx8mn-var-som-symphony: enable PWM1
Date: Fri,  3 Jul 2026 10:46:01 +0200
Message-ID: <e20d78ff8e242d3aa938776d435162cfdb7b1d66.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_014625_229994_4130C9EE 
X-CRM114-Status: GOOD (  10.87  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Enable PWM1 on the Symphony carrier board and add the corresponding
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mn-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index ddd4651b35d7..2afb5b438b68 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -217,6 +217,12 @@ &i2c4 {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
@@ -310,6 +316,12 @@ MX8MN_IOMUXC_GPIO1_IO11_GPIO1_IO11	0x16
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_SPDIF_EXT_CLK_PWM1_OUT	0x06
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SAI2_RXC_GPIO4_IO22	0x41
-- 
2.47.3


