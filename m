Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C3BCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 11:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5qeEcgplDhumVXCH8BSWxsAV7lDTMA49CGGu0SDBqCI=; b=fknnweuigdkVFi
	0eOE8D9+W5UWw3X6bKDrMfqZekV3GTpqvh6SOoAI3IfIJ8oMd/kLWstpfXAYwYmjRV3CxTTQI2WUe
	oIFmHgSe9hw9rW+uDmKpAGGYRgrLoN0HsSHXaKh6OphF0g5zNY2VEJi7L7NrluvIJsPAlgJX+uoiQ
	EjqPxez47fQlCuzthRDiEZgyzwelVxHrd8HxIgLe4nssq/xbZ93icAwMyqo95WyP12uAshYDz2ofx
	B5P0m74Xfattpe2PyraZoYYUSHFUJyft9i8mbWVwFUKrDAtX4GUB1dVN8riyOj7QoVqYhYQ+vw6AT
	kbjbw3PJWnmM3n4OXvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFD2-00000008fFN-2Xhm;
	Thu, 01 Oct 2026 11:44:20 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCFCz-00000008fDV-1KWG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 11:44:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f63546c3so4993099f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855055; x=1791459855; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5qeEcgplDhumVXCH8BSWxsAV7lDTMA49CGGu0SDBqCI=;
        b=YUUlD3woEIDbW94HaB/jGQo64y8K+OQgnz91rnJf58Nn76KPglBwTBdy22gy09NqjI
         PEtNaOk7NxZ7L5jC8dl9dvYTVhTPzZ/VBihiP2LNi4+gaVHu473cpkSiHavNiEorZnK7
         U7ReiENH2YFWNqEiqRFTKRW7vttQlObW++jaV6MjafYOV/PeCeZWtqJsNK2vp4+WK78i
         GO273x2kekirT37zCkbn33uZTx53vxcflGrIV8ebFkEI8L2BoFewmUFdZQNHhINy5uny
         TsoeY6LWZYHRJ04ZZv7a4x3RoRrAdDyEXPyhOKk9doHvKWuwsSFcG8GWjP0PRCA8nTVn
         capA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855055; x=1791459855;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5qeEcgplDhumVXCH8BSWxsAV7lDTMA49CGGu0SDBqCI=;
        b=1on3yG0Tif+zG9bf7aiEQBZN1xAfGbFN1gs7hg+wBAVaUXh2DMlbpWV9ugWHv3BeuL
         4tUfopiDCDIbNsmVv4CrG1/7rThCNvPLQXwr2fk7JlNUNZgAsqlbo6dTSGm/prd5YWTB
         VwM4dDRPHVzW+9ZkRSYs4f6RwA89EfMTEqDjsj6cof76ka6lxKB3vyftLG6RshcdWuby
         dNPyY/qyu8MqgI3nnLz2SJ1/gJxHRRSclaLbs7k5a7vj22GJnqcsPCv+yGwo4tKYg5QF
         9KeyS8p9FXW+3hnqlUkm9ik8ZvSNW4lk038WBAG5ERuA6SVb1CR1sUG/ftCWh45zlXJ4
         Enyg==
X-Forwarded-Encrypted: i=1; AKwUvBwXoMI5KjHxnyAcDthKoJZP8+Pml/9jj3NKVD+ayYDI6+auDhNk1J1crwsJ8N88JL3K1xJauBJiptaa4sb2vgHb@lists.infradead.org
X-Gm-Message-State: AFq9FYJTbEdZcogF5Yb9ES9iFKFyiZCOlzDALtVf6yCkZ0QAGtnlYLRC
	eyOGcKXy62Ry2UWBoObAjxera0CQzB9SNA0s3eTECwlif3mWiLoVnmwd
X-Gm-Gg: AYBFou0Vpo2VCFgu7XqIzYXsLO86RQIAqgSalwS6NV5kD3cgPRKRU2EipHlnyxQF4hD
	QUobGSKjoKaN1VLAXrZ2TPvF8LkapSFabCgDsYAIVwQBkjVeiqWVTaSlntkXLtjEbRuPFysQ8KK
	87HFQlgoxLi7pT/EtTLJ0jh2WUHkbjrbDKOeTpnxKVe69lRLKFLEzEeK/rdmYEZIOoCdoAYlYaF
	j0q72J70l4o4D76VmBSrkNxgU9abhm+uHLTxe50DI9pyVvDpuets1ZO8EKmr+hoecTgsHiE6/qG
	Gra0yZ+Nrwfs+rotZ0DmYMLfngfEoZznlFSi3Vcb6IFkMF6t6rib1P/yGTk0NUex3RhUVzeXnDf
	Wibk3D4aZ1dgscE9fgi5Wj8jKueqh5vbDJkl5wKdeM3seE3LeLpdLQbeLBdqSnxhfAS4teMxo7p
	OUTnQeVCxQZqXs2Z3ZdBkhJ5Y0BnXS84YNXpPwr4W1SxpwO0BklCDGVTlKoaNIrD8KOI/c24rM/
	nO4z95scqnAJFKKQ8aKutiUhAmqv0veN87vJMNjNg31IhrNsfP24DcwzSuzKMTx1PTjrU+dHQ==
X-Received: by 2002:a05:6000:298e:10b0:48b:2a1:dfe3 with SMTP id ffacd0b85a97d-48b02a1e30dmr6435138f8f.41.1790855055140;
        Thu, 01 Oct 2026 04:44:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:14 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/6] arm64: dts: freescale: Add Verdin iMX8M OV5640 and
 Verdin iMX8MP M7 support
Date: Thu, 01 Oct 2026 13:44:08 +0200
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIhHvmoC/4WNMQ6DMBAEv4KuzkXGIIRT5R8RhWMf4QoDOkeWE
 eLvcVD6FFvMFjM7RBKmCLdqB6HEkZe5gL5U4CY7vwjZFwatdKeM6jGReJ6RQ+7DilOZs4HEopD
 1G3bKd73Vo9KthiJZhUbOZ+AxFJ44vhfZzl6qv+9PXat/6lSjwsaZpjXk/NOM92KynvLVLQGG4
 zg+Vl/XTc4AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_044417_430889_2BACFD05 
X-CRM114-Status: GOOD (  17.31  )
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
Changes in v2:
- dt-bindings: Drop the unrelated GPIO controller node from the example
- dt-bindings: Describe the physical connector (24-pin, 0.5 mm pitch
  FFC/FPC) shared by Toradex carrier boards, following the discussion
  on the compatible name
- Keep the toradex,camera-connector compatible, the all-ones
  gpio-map-mask and the absence of gpio-controller
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com

---
Ernest Van Hoecke (6):
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 remoteproc
      arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7 UART_4 overlay
      dt-bindings: connector: Add Toradex camera connector
      arm64: dts: freescale: imx8m{m,p}-verdin: Add camera connector nexus
      arm64: dts: freescale: imx8m{m,p}-verdin: Add shared OV5640 overlays
      arm64: dts: freescale: imx8mp-verdin: Add mezzanine OV5640 overlays

 .../connector/toradex,camera-connector.yaml        | 81 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/Makefile             | 32 +++++++++
 .../dts/freescale/imx8m-verdin-ov5640-24mhz.dtso   | 17 +++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtsi    | 78 +++++++++++++++++++++
 .../boot/dts/freescale/imx8m-verdin-ov5640.dtso    | 18 +++++
 .../boot/dts/freescale/imx8mm-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mm-verdin-mallow.dtsi   | 17 +++++
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |  8 ++-
 .../boot/dts/freescale/imx8mp-verdin-dahlia.dtsi   | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-dev.dtsi      | 17 +++++
 .../boot/dts/freescale/imx8mp-verdin-mallow.dtsi   | 17 +++++
 ...-verdin-mezzanine-ov5640-24mhz-alt-jumpers.dtso | 19 +++++
 ...din-mezzanine-ov5640-24mhz-default-jumpers.dtso | 18 +++++
 ...imx8mp-verdin-mezzanine-ov5640-alt-jumpers.dtso | 38 ++++++++++
 ...mp-verdin-mezzanine-ov5640-default-jumpers.dtso | 42 +++++++++++
 .../freescale/imx8mp-verdin-mezzanine-ov5640.dtsi  | 78 +++++++++++++++++++++
 .../dts/freescale/imx8mp-verdin-uart4-mcu.dtso     | 14 ++++
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi   | 40 ++++++++++-
 19 files changed, 583 insertions(+), 2 deletions(-)
---
base-commit: dc1e94bfdd3530e2fa75ae8fecaf8edb64813c3a
change-id: 20260908-verdin-imx8mp-hmp-camera-ready-60d68a2f0242

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>


