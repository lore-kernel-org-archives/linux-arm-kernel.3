Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6308C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=; b=VCWV4IHG4Xj+L1Qwf5jxHhp2nd
	Ux2Ye1YZmQaLMtvwd4xFiRADT6pTMsETpB3qk+Krdm6q4JmQKbU7jYn3ki7mceKWZIBx6iokimNJw
	G1Lmj6RK75P89VKDK+MXnw/MaX9HnO7AF28StmSqTe5Gt1GIbJtEjdy/Pvafm7l60h9zv5ZSKoYwu
	JyJ0ZTZVyrUsGP8k2w4b9aAqTqzrgS/0T0f06mgDdnhzaf/yu+i10HkBETbtOdy2+qvpD0BNYmCRy
	3YMjx0FCA4O+ppArxSL3uKcr0Sy1DoudnzA2RlVVIV5wAlz8EdJoawrSWa3n865i83VrJ5/fkhihS
	boE2yJLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumdC-00000002Clh-3E71;
	Fri, 14 Aug 2026 07:47:10 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumd7-00000002Ciu-31Ux
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:47:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-47de0093c42so591166f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693624; x=1787298424; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=SMTz9tofG0EYazdMaLT4aIjOmdTEZia2MqzqvFRiYVytPE+ftYW39IHIHUdz99ELOE
         2mL2a3xaX4Oib5fRC+cEJ08TTomh0GyZ494/9/fJy9KXtThpbT6OeciTt2j3FYe9oAvN
         phRgWtZGo2Hs/l7XGo0nrbR/tI6y+exbnRZOeXqAP4ERNZujUgI8cyGf3Ma3XgIdnfTI
         CYGRpU73euwUhClR2kOd1CH8RfegUvqc3w2K2HZKCoN2ORmDOCGSoWsiLzhdTlnLJmZy
         7fKCm5M4tziZ20mmypabeU7jFuTMGBAySu6Po1EUnmMso0nycycQd7U4oS9QH5DWszya
         euTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693624; x=1787298424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAHvpFbJ0JtpWCk4HMUeYX5OKhCmyGZq7qNeYbuxFvs=;
        b=U0+TfNKGnGqDElU9jptxbjvJy4I/xfaP8MkyCjh757XS63+4QpJTEupnGeUU0t6G0d
         gIrfEKdLrnMcHr3FMbA7AKdlWcmtryY0H7pwxtdFTuGzD9+MolxTCDXaesfROxqVgVar
         Vavd68ZBQokS/ZUcquk+LbuA5XTTJTNgm3fdXPvoQEpEELoTS1uYd2JahokVf4ZHufTO
         DFWD0orLWCnCMC+WqsCxy5D2B1pMSh3UWRk0wBlHUMeIpyzD/gpjyfWhxLtMPBBy/ilQ
         oPlH7vcgW3t+JzFcysw5WcA5pHDHhPmEwzWF9xnMknDFXfHNt+RG4qBuOIROR0WL/1nP
         e/qA==
X-Forwarded-Encrypted: i=1; AHgh+Rok90x8yKKSK7aFpWmE9W3bIDEGnvzZ2NrALg/I38GT3ct5euHoSPKR5uBnqCImcG1lSoqiQ5o18ZD8iHxjMpUp@lists.infradead.org
X-Gm-Message-State: AOJu0YwKS/GU1qGYBw/hEFCRhj7zD6h0UxLCWXpYIH0+/jpbrdZHH6YQ
	g8X5KJY99CkQ/qZFVrfb//k0uzK8+oXOFeQ11bX7Bdjk9uWMkqPqpR6WQ9hVK4x3
X-Gm-Gg: AR+sD11Md7ruxLK4ZHZPUEqTzPw1++wj7z4LAac+4xIEu+fwHrIFlt27TRyaaVkylkw
	MHZAemDCllHzHzu/TBVdgeZXGj2KFH10Z4qiYA5PIHAZkOrwS4DYAWTWU1iIR5hG90h/4XS3Ma/
	KSLZ+hdQaOwReZlH03WuPFiRAuVOKQQcO8K2fov+RvbfLcH21AD3l0o/uS1ekNLArAL4mezknrl
	ZEG2S9re7K6+y23AaqdeHLjQK/69ueJ5X92HUHVDkIzwPVaQP2PSotH4gsFYH/Z5EfEZQRvkWzy
	CJgkzsYkrWWbl6ogTnY1H2gCJXN8D1k7FqhVgPM4sXOLQFZxonk0T743z6HrHGl7edumopsZZZf
	6VLVfKtk3lHFHT7LEx5AqGD+ErcGQOldVncob7ootjmcY7sX2NVJ0wphvKOhIgi4iSu5KHh+jFN
	KtUF0eiYKwvlvg4jR1lXAngc3G4vbrO9JPqMR7+sxACUUbnyBVEtHN3lSTZFjok++ANfI/jri4F
	sqj
X-Received: by 2002:a05:600c:5494:b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-499879a52aamr48387325e9.14.1786693623509;
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v5 1/4] ARM: dts: vf-colibri: apply the EXT_IO pin group
Date: Fri, 14 Aug 2026 09:46:57 +0200
Message-ID: <20260814074700.2491256-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_004705_773284_45FDC989 
X-CRM114-Status: GOOD (  11.40  )
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

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

pinctrl_gpio_ext describes the three Colibri EXT_IO pins, but no node
references it, so the pin controller never applies it and the pads keep
whatever mux and bias they came up with. It is the only pin group in the
Vybrid Colibri device trees that is defined and never used.

The three pins are GPIOs on gpio2 and belong to no device, so hog the
group on that controller. Referencing it from &iomuxc would work too, but
the pin controller would then depend on one of its own children, which
fw_devlink reports as a dependency cycle.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
index 98f9ee1b0030..74afc7b0d74b 100644
--- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
@@ -170,6 +170,15 @@ &usbphy1 {
 	status = "okay";
 };
 
+&gpio2 {
+	/*
+	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
+	 * than on the pin controller, which would depend on its own child.
+	 */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_ext>;
+};
+
 &iomuxc {
 	pinctrl_flexcan0: can0grp {
 		fsl,pins = <
-- 
2.54.0


