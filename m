Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4896DEF8FE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lw259pcYxSLiNSL1/jRGj80sakZ8LNO4UKiJX/RHt8A=; b=B/FA+U3qh1p8gE
	LESIB8WhArC9ZjoTdEXW7RE92k5xHd0hCQupnuCw/z3I2WZyvIPpDtE4745+UoUElQZyzDSVQDxYf
	1bcGy6VSQICJSvaiaAIvTeiRM510P1eeQvg5YmAl5UrlVOawGGwYL7FnVkXJpaWpo4TzV1MevyszH
	Fo+hzQQMXUIYCx3ciq0FhXf52LfB7ozMWwIQz4L8T48tHZWGQRxr9FvJ4uIrhGrdWYOwXvrwyvyiQ
	0bSzKuwVorNZoLXjlAKmvwcV7g3VDgkjQI8S6cPaX5BoLPg8MW9bEFsE4FIoirMMLv01fRYovnrzE
	Rkr80iteaDwQgVvE26bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRY-00000002I3T-0Ms6;
	Thu, 05 Mar 2026 17:25:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCRV-00000002I2b-1heY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 17:24:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48374014a77so100606355e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772731495; x=1773336295; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lw259pcYxSLiNSL1/jRGj80sakZ8LNO4UKiJX/RHt8A=;
        b=Ix9OrS5Xxid2xaF6d5x+xHTJBHDCOODG6uOOIqQuW2c4FXHSZwi8FZocnfbsSVizV5
         UaPopZUWnr/iZzxuoMu3BlkubC5bVcKrY/lbkRs9Gfqymf3CShyl1X1r2pDAaHs3oRtg
         Oq+GaJqTu+0CsFgYIdL/byHyb4yvf8WanBY4jEYS4UIEOSBSplTa/OzgUfwapT8Zmr+u
         4VC2LLBKbNAWdzkQnkmjC6bG+ibLXihubAkl/gdUIF7MLDkSEAIDB8RBpD0Jh4VrX0Vb
         sxk+1bTP/1e9PoCyyMV3vcMHrY4DuWaK6myNCY35aJHn+6yIkmkBrBpWfSFRAtRJ84p5
         u0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731495; x=1773336295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw259pcYxSLiNSL1/jRGj80sakZ8LNO4UKiJX/RHt8A=;
        b=e99YSZKuKzM8WQGk0eB3AWJ7XpzZ3xw4heeY5SBp8lX6KbdGivYCS1FklYf+cQLZ17
         4FvXE/Sq98szL4ttmkdVzfJkz63/Oq9Wq5vr7Ol4uVhZ+fPoj3UyARLj69qY71sQtcbG
         Y6vm9odtJSFymsXti7vQDazfUQEaLbExztY2O4/V4PIHOnZnukiy7movjh4BEtZyRkeH
         eWtoWY+KMuhKkbbPOcxQbVdjmD1nou4qYXvfY5Wb/K4enKf6Q8Q4gwAu1zcoq+5i+bG7
         vHg41x0Mv2IJ8z8//YUnPJB8eiEpFB9ZM9/ie22jFHyj5ZiaqDwJuu8RujyZqqhOpOGe
         S4Rg==
X-Forwarded-Encrypted: i=1; AJvYcCXmJwlYlBXu66RRPuE7p1GofQhNnj8IKmfHTUccnwH4Z6jHD3bWAJdj75AFgOtYdlfHMCIZhnE5WjcodrQ9+pck@lists.infradead.org
X-Gm-Message-State: AOJu0YyufDpBTvLNQmf5oRJp14Kc8mVGDpfUOVJmFKD+MdTjebwHgsoA
	gVR5+uzLFtqI85vxg4kf2Sn0i9h88hsJkJ6nZLLw2Cp6P12NIL589DOk
X-Gm-Gg: ATEYQzziP5SbUEtaRXYLQFLgQ9y+lz7psp/DTeebPida/dV8NyDiieB3DcY76Noe/5n
	6cO+D15DzOhc/lDHVdsglNxkPKlT06PEwxSMXve9YnXqz/oRaEEl1eLnPsR6gVbTAL34bESuWss
	pFtrC/GRQAjsOFNS2IUM/C060i0FpEnaZNOTZL+9qCHZAbtCcLq1cjS8TE5xdkYK3yDeBWJRmLm
	5rrxTKT0xYv0JO2vWlg9AHxcpcSOreS8xUKu9ouST7fr5T+HjYXlqNfE9hBLQC1rOitnHLFR19W
	VVkTaCoL5BSFxRAAEDrWUUSBwTQNC2olqeuMK/z5CugHPWERujCrYjFFYhNPi0dKc4PLphh75K2
	HWZd20qM74G1yYSq+3jMzy+9eTijjvLHOpReUAnNLUwRsENbc/h06rteklbo1D4/atnwUul3d24
	BL5zYcncztbJLy8SjN4crfXhPXRNGsYa7/IRxSDjdT/u6lEc9F/dHeWn1+GvaPHdjpxvae0jE0Z
	zGDmg1wOiKObTeY2AP8fEp9Igw=
X-Received: by 2002:a05:600c:a51:b0:47e:e20e:bbbe with SMTP id 5b1f17b1804b1-48519889928mr109001225e9.25.1772731494781;
        Thu, 05 Mar 2026 09:24:54 -0800 (PST)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fafe4c9sm67153495e9.15.2026.03.05.09.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 09:24:53 -0800 (PST)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/6] arm64: dts: freescale: add Verdin iMX95
Date: Thu, 05 Mar 2026 18:24:28 +0100
Message-Id: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEy8qWkC/x3NQQqDQAxA0atI1g2MllTsVUoXmTG2oXUqiRVBv
 LuDy7f5fwMXU3G4VxuYLOr6ywX1pYL05vwS1L4YmtDcwjUQLmK9ZtRx7Qj/k88mPOJgnD/4VYz
 sgpFajl2biFINpTSZDLqel8dz3w828f/ZdQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092457_467678_DD34F873 
X-CRM114-Status: UNSURE (   9.62  )
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

This patch series adds support for the Toradex Verdin i.MX95 SoM and its
currently available carrier boards: the Verdin Development Board, and
the Dahlia, Ivy, Mallow and Yavia carrier boards.

The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
interface, one LVDS interface (one or two channels), and some optional
addons: TPM 2.0, and a WiFi/BT module.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/de/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
---
Ernest Van Hoecke (6):
      dt-bindings: arm: fsl: add Verdin iMX95
      arm64: dts: freescale: Add Verdin iMX95 support
      arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
      arm64: dts: freescale: imx95-verdin: Add Ivy carrier board
      arm64: dts: freescale: imx95-verdin: Add Mallow carrier board
      arm64: dts: freescale: imx95-verdin: Add Yavia carrier board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   24 +
 arch/arm64/boot/dts/freescale/Makefile             |   10 +
 .../boot/dts/freescale/imx95-verdin-dahlia.dtsi    |  270 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-dev.dtsi |  250 +++++
 .../arm64/boot/dts/freescale/imx95-verdin-ivy.dtsi |  515 +++++++++
 .../boot/dts/freescale/imx95-verdin-mallow.dtsi    |  223 ++++
 .../dts/freescale/imx95-verdin-nonwifi-dahlia.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-dev.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-ivy.dts     |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-mallow.dts  |   21 +
 .../dts/freescale/imx95-verdin-nonwifi-yavia.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-nonwifi.dtsi   |   16 +
 .../dts/freescale/imx95-verdin-wifi-dahlia.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-dev.dts   |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-ivy.dts   |   21 +
 .../dts/freescale/imx95-verdin-wifi-mallow.dts     |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi-yavia.dts |   21 +
 .../boot/dts/freescale/imx95-verdin-wifi.dtsi      |   50 +
 .../boot/dts/freescale/imx95-verdin-yavia.dtsi     |  217 ++++
 arch/arm64/boot/dts/freescale/imx95-verdin.dtsi    | 1162 ++++++++++++++++++++
 20 files changed, 2947 insertions(+)
---
base-commit: a251f9ed77f01f16adaaa1b3d2f568fc1b5acbfd
change-id: 20260305-verdin-imx95-upstream-frank-li-base-b57ab97c55c1

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


