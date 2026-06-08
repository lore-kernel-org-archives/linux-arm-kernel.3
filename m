Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3126CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=; b=RVz875SmyX9K5dSIU3qwkRfLoa
	YDp6v9UD1cmjOEdCr/8FUsB/UMmGWuDAOKxWl9HxJkwLJYKw/YDek4c29b3YcCnTXYeo0qHTJ3O76
	W0k8n+XJh2nt6WP02t085T3ulCtsoMEwQ9c3XexZsXmFFLyDuGFD9mGztkgfKgjBbYetxww0CpcXV
	LsZGnKjJFNpSrrjiPEMZlT1i3j+ii9ANgAnuIuTxZ7xbvMNUm4u8dqRpzov65WqtMN/Eh8BzQ610d
	8uHVw4dNWc5/w1rA6w+stpboMPG6Bd2eajqOSB74vo0hhqMo+b6a6/hV6Ei+jJssLZLYoIFvj5A15
	SGuTyGKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvl-00000003I6b-1i7J;
	Mon, 08 Jun 2026 10:10:05 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWWvX-00000003Hhb-2BF6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:09:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so26477525e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780913390; x=1781518190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=nW2KEbgIykQ/Ll8pEJRqVwuYk5MYnsrqLdxvexqRof75pxbjLqA/PrqbuFge5c9+Oa
         T748EXTctpZEDzTfUMNLu7P0/i7fpL5fgOebdwodrDHhcfIy9ZcVJfW+mxpcoDuKFV2b
         J0za+XczuV9h4zkjPyBIj4wwDG0xRZ91yibav/sxlJEE+kvIyy7evnGEfSTano2uwu50
         e/kmYvDN05no727qqO4NmvJuvn2bzHe/Nw3Qf7xkpE+Js9WndDnnyHTvkE03xZGBFgH2
         U7NNJ9AiepIDrf1RM6An55gD30hd3TxAGtyhxbDCBXF0xvotThun123SgCaNGo2A4afG
         Tcvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913390; x=1781518190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fjp2VWCoSiDFmRFZVwMPT0HHzuaUx5cVmqiNgG0trik=;
        b=IPWli08eKQeEUuOHsZ9BVOyWIM0OC305mPeMpfPS8Coc7ZWAaWTPdRHg4r21pS63pG
         OPcIq4RXn1AYqWXHZTFg6LeNjRDVMi4PNaifCSZDzeTuBJK8GKedtK6KsdrOqme311JZ
         kYS1YJQhRlDKVnGGGDNwlw5pyXnGQSj7Cv0ql3w93qZhTZ0yEgU5309vcq/ubP7rV6w5
         iIn9aGImsxxc6ce/X8Lbl4iZqpgYmw+vrFN5EZL3FCHwFy5aMRlB0qvbjWi2zNbcJx2n
         efW7MIQ54EYftZdBuOBAK3qt6tUfYHFWY/t9Mqy0qMvMllB01CY0RbPT8I/SJyvde990
         Zu6Q==
X-Forwarded-Encrypted: i=1; AFNElJ8DkBFE9fHmCYF/cHLOjnN1q5pqhrYkAi7trgdwvUwb4WZYfJCyX7u8rJtmffdYExbG/nsST+TI/Y9iyHzzQSgh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/42C/7YwBAAQAu43efOvOZfmfqSdFYgTaf5+O5HdYE5au8zPA
	v1lZYXKzpxKTr5p3zuwDMGJOwaalHTxNhtHKEjpLsdKYp49pP4iTy1Ig
X-Gm-Gg: Acq92OENxUsxjfuMQKydjL0jgCf47FPWvQZeBTr88jTM4nvHSMpjpG4rFw6ZTWdc+yB
	QV4Vohb2snybHtIToMHEXsEIUkXSTefSGGOpfntbGr0+JKa+tQ4n2ereSimJIBbON86VUHIV6lF
	/d0pFYNCBmRh/ptu02iDqdpJynWAr/aWyKjp/1WsOiGlVcEO3KvyFNgXyORhXkd9JS+pdu1AdEl
	P2RMqqIkt6pgZAe7Qwv/fSYi+Gkh39uu9ShzgAvsIW4xq3zhXg6VsdZeU+fM7kxvMKuRteNN5St
	9L6jMvO/MISw5165fcYD5DyiE2MS7R9gYgHFX6JKL5iqOJTdtIAKmWiQJ/9XRPzCWZv4VDgjP5v
	a1xRHqLDOqfUFUVVIWfyRI9r9QLypu46pfgfrURgUqNgccOBRjYgd457yAtJ5Ad8nm73RO2ZaGm
	a/axqCJk9XhK1h6YbIK2fsxrv1g2+4dDaIn0mG0T1n5aS8RTIqkymn4sHye46QYT/+dWJZYfmTD
	hTAkf7NiwOyQIh+dYynOewBkNg+4zmfDcPQ45uSWN32qF57
X-Received: by 2002:a05:600c:34c3:b0:490:5e2a:f924 with SMTP id 5b1f17b1804b1-490c2599e11mr270847475e9.7.1780913389760;
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4602cda3651sm39503219f8f.32.2026.06.08.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:09:49 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v4 11/14] arm64: dts: imx8mp-var-som-symphony: enable PWM1
Date: Mon,  8 Jun 2026 12:09:29 +0200
Message-ID: <04c6b83abda0bac71b14f3d7f96315a1dd843f53.1780912893.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780912893.git.stefano.r@variscite.com>
References: <cover.1780912893.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_030951_593866_04A0B2AF 
X-CRM114-Status: GOOD (  10.86  )
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
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mp-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 4f1d61c55ffb..e1b78ed167b4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -247,6 +247,12 @@ &pcie_phy {
 	status = "okay";
 };
 
+&pwm1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pwm1>;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -400,6 +406,12 @@ MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05				0x10
 		>;
 	};
 
+	pinctrl_pwm1: pwm1grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT				0x116
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART1_RXD__UART1_DCE_RX				0x40
-- 
2.47.3


