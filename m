Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3280DC5B558
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=; b=ERSHWapkNvnAfB/rb1mVyNEvLz
	2PpNdrUx1dNa1nRx8jCL/4Ac2QaTngnfqHkwGlaMLv1UMCVyNlWSoE6u57R+aIoAkRsgd2RcZFrjS
	J4ANMhxu/PqTzbVGuST9bFnQJUhQ8VraoQ5Ov9svmgHXHh90nTpWB3NHAAUel3Wv4U/GMVijC5fLT
	NItYiEd90aO7v/QjEK0Z4aT3s7e+pWa9MnUpsiMNYzZRTwaZXnFbWWBSMx6aaYgqjwjHWNqtNy7IP
	VTpNO3hGD0bpAOX3GPlWQXfh1pTopfbKjXG4weSugcyXHgvtss5pISnkoFec56Fs93Hb+H/rqqjw7
	7nUDsDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZ6Z-0000000FJDW-0HR0;
	Thu, 29 May 2025 08:59:15 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYgN-0000000FG62-1Nlw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 08:32:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad88d77314bso118176066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 01:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748507530; x=1749112330; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=ltb23WZEWjQqfWMPZfHbB8n/izIeSzw5LUpiO7EQfxXFMS0BXV8AVb+cmliV5rEODE
         x1VQMK9E4kgTpYfPRFbzq3imakn/7KhK8FGdQ+aho4rSziU26v0UqcAUgmInGxBxCBvO
         1Kp2SITXz4dSUkLgWNYlJGLo36DgoIqS9gmO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507530; x=1749112330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLld78XiVd+nLe8SAk0vnNkUleLC+2Mse8SgdBs27No=;
        b=DN6WoIZEjBf3DS1P3f5ZZ1wYxEKyOQu8Pn2MVhHQTW4lkqDwmu0exFJBTwP3IRVDi1
         OfR6GT7bH06dU0iFILf67+hqYef0v5+kKKMxdw0WZk6CMnvAKCONwGI45bcVIo/Z3j5K
         5R1BKL8OMmvplVuDzv6cTOXnWqa4ehnFkufY7fI7kFqLhQUCQeRviueu3/qKCuGu6jiY
         vn8Perbd8U+Rlsh6oXKMijpElv7jTJXCyyqv9W7IpU987PMKL3IgLKojHl/Xnjw3ByEo
         jFD1qGZV4OY7/Lap9icXi54K3vsq5yMBYkfkcoFP0czOcELdE06bIfvoRcC8kpl5d7fU
         Sahw==
X-Forwarded-Encrypted: i=1; AJvYcCXUg1APfayuHbXXfY2eYnUAJZFAGBvPA1HIAM38EgbZOGbwyBGy1FwZ2Al0gM3ZKR3RHECNj3Xs0XRj9uUrQhD8@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa2/U8u+VxbAVWinPPwoFNoaZdGwHFTAK8P2TZgvtEvV0SXPw2
	HG20wo/buYK40w1pSqmiEcvXHNr/K+xgntVhYtRtyaIJb6kq9wVgxuNZFrm4Y7JSu/M=
X-Gm-Gg: ASbGncuah6/HTGUep50Pdl6D5kDVUeMYNQm/GBvofEdLRAnfBotRS09a1jdcGZ/A00C
	s25UzVrEklZG9//oyRhCbzstuI/8dwbyHrYD3fTQg8XPH6FNnI0IGGoiUHMKZx19Nk2vLDqgdSo
	53iHg0UYPZrLxj0jY1Wvn2bNnbmmOkzKHbuECFfXAy1is2Zv8bhrMpFlU6Mxr0js7Mc/vYRrg/7
	qBTMNFUwejE50Q2DP+GLY8PGVpJcptawyiQ7YxRxMr7OPdzWcUB4tQP4h2BJ0llEFmGiuCxZUXI
	4sT9VwXXSXC5UIaJeOYqZvqUr4eqpBGv3DDZaa0ZXxEkMCaZC+FbTEgDTTOyn2ia7X7LFxQ8XOu
	jIqfZwYxy5qP1/Zjd98TM7itVadg=
X-Google-Smtp-Source: AGHT+IFdikkmzQilN7TiGR565IDIriKeCOFiTpijPBoqeaSwXu+CGLn9Jz9Qio+NdGj3viXD7/eBzw==
X-Received: by 2002:a17:907:6d11:b0:ad8:8ac5:c75e with SMTP id a640c23a62f3a-adadf2a2945mr112016566b.60.1748507529623;
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e87esm100609866b.63.2025.05.29.01.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 01:32:09 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Thu, 29 May 2025 10:31:05 +0200
Message-ID: <20250529083201.2286915-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
References: <20250529083201.2286915-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_013211_367204_9A368251 
X-CRM114-Status: GOOD (  10.35  )
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

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


