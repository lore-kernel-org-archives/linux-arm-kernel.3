Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 302FEC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=; b=p2IeWZBWHGaYWG
	AatQV/UbQAFhqt60FXsXkY3NSEangCjhlSw4r+xWFS2zjPP3Jb4rnED7QGCd8v7CkSKQbhx2EhjTb
	W1f8rC1OMfCqhA7d09brD6xs9Ilqd8VRC7zBNwYc0LI1XYNhmSjZfGvQYxDiwLk/WDc7LLXHBcLx3
	TYR+SNj6syQsDlMuPzZ7AJGhs22reyG+wqDiKtrWtzdkcRBwsSi1KONtkqzam9T8INCMV44wJEfF/
	HZII2JzNl7/ZjVviTcUqDNEy1T3TsSQPOiC0W3f94XEjxjtQbub9bLYX/pOOdpKdyBNr2kHGy2+T3
	1Vh0MafwbVbav6/L4oRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqo-0000000EogO-1PEK;
	Thu, 10 Sep 2026 15:38:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqm-0000000Eoft-40ne
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 15:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=; b=f1PLuaZB4FVvbXu+ucXuuRKDNj
	jQhHkmh/jVjUsc58gQnBdUeKLILhstaUm/zKfMQ/rn5Y93N4AWP3SHs+r+zEf74Jnz5YfUBkv9Dwq
	m/JZkSUKdjojTDkrBlWjEhQPvtBCaLwKqQnsxLxpSBo7g4fzLiwTAxSo4poQh9hA9yRnwl7upTBhM
	g0RNanj4/m3ByzKHdEUBFgVIgSWNf4LTvDhRhJFEudI3X2M8xuPApAl+5H+d6qBhiLB61wlGhRdV9
	IawUtVQCJoBouEEtUlmk147pfdKnwuZY0vSIwqK31L6WpIJEZxUo42IvciU9lIAxtrQK1FmqCSiJe
	V2Vp6yrg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4gqj-00000002gVQ-3nmc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-485850cbac3so4570735f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054684; x=1789659484; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=OjcCzZo+f5Lk4jxmlTNk7UA2Y+zG0THpjeJk1wJi2+sXh4F6MmIOXBReQ7hEdKhk+m
         QhyPPWSBHCP2Vnp1NDkM6S9S/zH1f9THEbYqSJ5oi+IOZz9xRHC4Rwmp4tAD1RT/ZtOM
         e4wvrmBtdGaTC8CsTiL3HTCylEnxB3ah6esg5XWoc/xZfes3RBhZC7B/0cURTPEYcmel
         nAoyUDBeln4+uO9F8scHfttiFHbH1MS6cDq82wWiKgr/iIZQrzj63deSumISfmCG1qaE
         O3xRwvzu7Mz3breTMyOLsts0Cdq10i7veWmapF+WhSfdx5PXcXM1d536p3KCSOdtLyKJ
         LoGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054684; x=1789659484;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a6TUluCt1yzi2qBs3y3iyPDqTRTHUpFGWhITcM2KmZc=;
        b=aOr/ZD/UZF+7bTxRnOczlpslruOYH6eSKCBms0tdJeaN5J08Lu2dsodAWzZY5tY5a7
         oQ9UQQCZGgeXKX45G+imvMN3fY70pyd3FMJ+WzAX+Muyre9Hf+Qu2LqNe5MHkRxVnaWW
         FGdo2rdm0EarZ9iPdnvlhaacV9/lnGSQHakwN4b/XYlBJ2/7a1mz98tFTBk7ajrvfBXm
         Yt0rShConvo4aiyaxEG9dFU/ZOZ3eSvDIlySq2HG6aW8wDNsRww+wAx1KkPUOBsoq4jJ
         Ryy8kLmxFNDxmEG0uOrm0IJcHRBOUygJUr5WqORDVmqgF1lSJFFVx/+Gg1ARLp98stn+
         Aq2Q==
X-Forwarded-Encrypted: i=1; AKwUvBxIgyqxTaDY44vC+LNzXTlXa3bikZK0JJ0UDekpSSxDQ70cnwO1rbYDz/iy4b73ydhNudd0EwKoxFu2EP2PIGU/@lists.infradead.org
X-Gm-Message-State: AFuF++nnfEkYUKcDFGFzDwf3jTHgOcyBxXqlvUNfI7RRaZw+f2d2L/u9
	Af+OP5lMGGhcfNdVuBRu+biNixBWNyYg6b4qQNn2zed4PnroroC1IUIR
X-Gm-Gg: AYBFou0uPVDXhwVdSAHAEky0tKUPzlbjgJmmTf8zjVlnI3fxx5fWWDneawRNLSn6Ql9
	wHYyjrfj1bjacL0f3smPJKBWwoHZeRQnsdJwo6fxFnscP8VBeQmmRiTNBGWk8s/lvnEYFlI9aYl
	vNH72a6+cVsvpfp5TJ96DZUAdfDTlLjbfMzP7C8k2cth7H87/nUvnSCYm2m2bWFLDSFYXNBENWp
	NyUV7MaiDmEWZ1v8KpCGakupY99RwsA6hTCqPB+2IxJirq6GHooRWtoQ6kUf1w/tnlbyc9A2umU
	mTMDVRJr1Jg0y3ahNOFu1JLK6OaagbmWeddGA7gYGfyipCBD+hzJxlCQ92R5eQUqe3GUcZrdPHy
	ts86C9LpLtPHNmzT6Xk6sIwZF4MqlVegWuEvoNmJeLITQuV+axIRK9AKkkenuxY518n65Ndnbpf
	yA4+SDrFvWFrXEJ+gY1qXiAypMsIMw8blyg+NMqdF6LuosTMIOJ2yezU0/Jqly283sxxlMZ4zn0
	xlS/5vy0o9SGQkqX7XdrMTqfBbEcld1QaSA51AiEQjgQQy7aByC/RlBzSOFfFtremFBKsn8mQc/
	j34K4jbP
X-Received: by 2002:a05:600c:4f43:b0:49c:fc6e:a3d9 with SMTP id 5b1f17b1804b1-49cfc6ea7b4mr421096065e9.24.1789054683558;
        Thu, 10 Sep 2026 08:38:03 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:02 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH 0/6] arm64: dts: freescale: Add Verdin iMX8M OV5640 and
 Verdin iMX8MP M7 support
Date: Thu, 10 Sep 2026 17:37:56 +0200
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANTOomoC/x2NMQrDMAwAvxI0V6CKYJx+pXQQttJosBNkCCkhf
 4/pcMMtdyc0ddMGr+EE192arbXL8zFAWqR+FS13ByYONFHEXT1bRStHLBsunSRFXdBV8g8D5RC
 FZ+KRoUc219mO/+D9ua4b/aa3anAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_163806_010753_80600C27 
X-CRM114-Status: GOOD (  16.36  )
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

Describe the Cortex-M7 remote processor and its RPMsg memory regions for
Verdin iMX8M Plus, add shared OV5640 camera overlays for Verdin iMX8M
Mini and Verdin iMX8M Plus, and support a second camera through the
Verdin iMX8M Plus Mezzanine.

It applies on top of the recently submitted Verdin iMX8M Plus overlay
series:
https://lore.kernel.org/all/20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com/

Add the Verdin board description and RPMsg reserved-memory regions,
following the Verdin iMX8M Mini description. A small overlay optionally
reserves Verdin UART_4 for Cortex-M7 firmware.

The camera patches are the follow-up promised when the OV5640 patches
were removed from v2 of the Verdin iMX8M Mini overlay series:
https://lore.kernel.org/r/20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com

Verdin iMX8M Mini and Verdin iMX8M Plus can use the same 24-pin camera
connector on the Verdin Development Board, Dahlia and Mallow carrier
boards. The connector's sideband signals are routed to different GPIO
controllers, however, and the two SoCs use different capture pipelines.
Describing these details directly in an accessory overlay would require
a separate camera overlay for each SoM and carrier combination.

Following feedback on the Verdin iMX8M Mini series, introduce a binding
for the connector's sideband GPIO nexus. Add connector mappings to the
carrier descriptions and stable labels for the SoM-specific CSI media
nodes. This allows one pair of OV5640 overlays to be shared by both SoMs
and all three carrier boards.

The binding intentionally covers only the connector's GPIO signals.
MIPI CSI-2 endpoints, I2C, clocks and supplies continue to use their
existing bindings and are connected through stable labels in the Verdin
device trees.

The unsuffixed camera overlay describes the current camera module with
its 27 MHz oscillator. A separate overlay supports the legacy module
with its 24 MHz oscillator.

The Verdin iMX8M Plus Mezzanine exposes the SoC's second MIPI CSI-2
interface through another 24-pin camera connector. Its camera control
signals can be routed through either the default or alternate GPIO
jumper positions. Reuse the connector nexus for both configurations so
that they share one camera and media-pipeline description. Provide 27
MHz and 24 MHz variants for each jumper configuration.

The default GPIO routing is intended for a single camera because it
shares control signals with the native CSI_1 connector. The alternate
routing permits native and mezzanine cameras to be used together, but
conflicts with the Atmel MXT touchscreen GPIO.

The shared 27 MHz overlay was run-tested on Verdin iMX8M Mini and Verdin
iMX8M Plus. Both shared camera overlays were compiled, applied and
schema-validated with the WiFi and non-WiFi variants of all three
supported carrier boards on both SoCs. All mezzanine overlays were also
tested both standalone and in the dual camera use case on the iMX8MP.

When fw_devlink is enforcing probe ordering, camera probing depends on
the GPIO nexus support from [1]. Without it, fw_devlink can treat the
connector nexus itself as the supplier of the camera regulator instead
of following gpio-map to the underlying GPIO controller. This can leave
the regulator and camera waiting, for example:

  i2c 2-003c: deferred probe pending: i2c: supplier regulator-camera not ready

[1] https://lore.kernel.org/all/20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com/

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Ernest Van Hoecke (6):
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 86 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 32 ++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 ++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 +-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 ++++++++++++++++++++
 .../dts/freescale/imx8mp-verdin-uart4-mcu.dtso     | 14 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 40 +++++++++-
 19 files changed, 588 insertions(+), 2 deletions(-)
---
base-commit: b0d182093ef1e0693db6e40f576c6b6f5a52aead
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


