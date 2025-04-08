Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329EAC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 15:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=; b=ZaJTcSzA1dBwhf2KpkoF+w3hot
	SsPxYVBgmfDvHvD9WBHW1LXJuDE1KW/QHvnm6if++B2SPU24xj3vrpw5hM5/6+A1vC1acjWQJw+6d
	VTLwm45ahDPN4rdvQXwGzjOaPmfh/WdIOh/QI2j84RtKq5RtMp3upkSZ7zj3v4L17Z3ElB1KnRt8e
	hLbPwYZamOGlZQ3D9/3c3DDuWMOvx3jFqTnFSY0ZZsettXA9xjHPUtLz2u3U8HtcGDVch8wHf7Fuo
	iYV08XE3V5ZCrHmRjLSN24J/WMLyRW2h91A50n5tPqQrmlK6IW5VZagtXTVe2whkExXYltz2oPyLl
	UE1uzM4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B80-00000004g57-2Z4o;
	Tue, 08 Apr 2025 15:44:44 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2B6D-00000004flT-1RxR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 15:42:55 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so45090525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 08:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126971; x=1744731771; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=VgfCn0YYR8CGiMW/XeOGRRepsPAoPApNByryV5vGFMVT9CtSbMRcb5TVAXHNq/zhN6
         /GfUbUTS71sS0mXVmbr9/8oGqMyR9HMVelycc3CE8DbsR9UlDwSFnn+d7DpDvlW1i+vf
         xKSOeTvQcBTT9MbPARwcfBTy2UBCg0i4CMPHLyVfGoj8R6Iu8e53pzKlaWjG9BljllbU
         yZ23cPLrRPtFgSibN/+YRIy4ov7kvVwkRP2QMmkoPtgzhKpILmfEgIkG8pXhm3bczlpJ
         YzOQEquv0lvR6Z248adoRjrGZtQc3OYDB79x2H3K5wo4NGUF1NqaNH2yRIZSD7NkA910
         ooEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126971; x=1744731771;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L/RZ+p4NJbk4dcC+rTyDYkbHqicPrFhMjMSCL9eOJA=;
        b=kAON9312R9ty7OVMJs1+G4b67aosenpG7OHGSl3M7WAiZ7DUNcllTgv0td5Ot/ymSg
         bCmcmO5WMzGMQu81T6tCzJpKvFVeEeu2QzsVMpTQ9BeLZv7lfyCUroP4XEOLuPgkd0YY
         /nUkvkssiJZ5+fbHX/Qx61dc5FOwu59JYFXDcRpfMuS+CTj5WTZhW1w8FG1sLEnEFa0W
         hjJH35iaU//zXLmoOgbH2ayLU6v/T1uf/LYCoemh7rCsVF+xyCtj+cQcgJgY/7ZXI8DQ
         6TJ/sH8AahtlsGTsoeub1yBfzgz5XSLkFfG65GV2nAhyRb2zXdDPLV0sdGYXCKb/NOuN
         Cuhw==
X-Forwarded-Encrypted: i=1; AJvYcCVMrwUHGAbSiApRsEdB/zz/ZgpWwvDlq45PCvLgk6D8gyQgKxys6qqpTzjL1w/53Plf1HJJf9y2Wt7c5gV6j/L2@lists.infradead.org
X-Gm-Message-State: AOJu0YzaZevBe1i8kGAX2AWZDeq7MJ/6axNI3w9jJFdmVheK65trHoIc
	1w7EFwlSM1jurJURGXOSrPkOBDewokAAGAWDRINqibjjY8uL8Dbl
X-Gm-Gg: ASbGncvBvisRt0UkQz1/aY4j/tVHJnZW/+yJPTh4/GvpWjRh+H+1GWapan5Hy37qI4D
	i8bb2S/U2W0XUC+DeUG5lO69sQAq0prTAumq3IrDxDQPCMk6Hr7s7Wt+n7gW4hGrTPfN198FbPd
	iXllJ+PGjEUdKsajUipB9KV+vxASXZm3Pvm7Q18PJVi/rjZDARdg6V8LUBDJ53aAlFAq8oS5qcz
	44qCH5eJz1qGXsYymBT/ZEqdzoP88QsFF4/RbdoHLOWJ8qktjisgXaepdrkKoFLaNODa3BIsFvp
	gymgOTUHsshbgJtizyVM7Y3qfgED7tp+UfQvpKAYiz5WjYUE8vuJONVB91ajVeBMf20EItEm5sI
	hoN0j3uc=
X-Google-Smtp-Source: AGHT+IEsYOAvrRYx9U7RkXBzKdYrz1m/zDGUfOXgzDK4kgV+9jgyDCOg9AoAc+QioVKMgn9BFwQyuA==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr180587605e9.13.1744126970824;
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:50 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/6] imx8mp: add support for the IMX AIPSTZ bridge
Date: Tue,  8 Apr 2025 11:42:30 -0400
Message-Id: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_084253_388303_A7AC29D9 
X-CRM114-Status: GOOD (  23.55  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The AIPSTZ bridge offers some security-related configurations which can
be used to restrict master access to certain peripherals on the bridge.

Normally, this could be done from a secure environment such as ATF before
Linux boots but the configuration of AIPSTZ5 is lost each time the power
domain is powered off and then powered on. Because of this, it has to be
configured each time the power domain is turned on and before any master
tries to access the peripherals (e.g: AP, CM7, DSP, on i.MX8MP).

The child-parent relationship between the bridge and its peripherals
should guarantee that the bridge is configured before the AP attempts
to access the IPs.

Other masters should use the 'access-controllers' property to enforce
a dependency between their device and the bridge device (see the DSP,
for example).

The initial version of the series can be found at [1]. The new version
should provide better management of the device dependencies.

[1]: https://lore.kernel.org/linux-arm-kernel/20241119130726.2761726-1-daniel.baluta@nxp.com/

---
Changes in v5:
* merge imx-aipstz.h into imx8mp-aipstz.h. imx-aipstz.h is
currently only used in the DTS so it can't be added as a binding.
* place 'ranges' property just after 'reg' in the binding DT example
as Frank suggested.
* use the  (1 << x) notation for the configuration bits. Previously,
hex values were used which didn't make it very clear that the
configuration options are bits.
* shorten the description of the bridge's AC cells.
* shorten the message of the commit introducing the bridge's binding.
* pick up some more R-b's on patches that remained untouched since V4.
* link to v4: https://lore.kernel.org/lkml/20250401154404.45932-1-laurentiumihalcea111@gmail.com/

Changes in v4:
* AIPS5 node now only contains a single memory region: that of the AC
(just like in V2). 'reg-names' property is dropped.
* AIPS5 node now uses 'ranges' property to restrict the size of the bus
(1:1 mapping)
* change the number of AC cells from 0 to 3
* add binding headers
* link to v3: https://lore.kernel.org/lkml/20250324162556.30972-1-laurentiumihalcea111@gmail.com/

Changes in v3:
* make '#address-cells' and '#size-cells' constants and equal to 1 in the
binding. The bus is 32-bit.
* add child node in the example DT snippet.
* the 'aips5' DT node now contains 2 memory regions: that of the
peripherals accessible via this bridge and that of the access controller.
* link to v2: https://lore.kernel.org/lkml/20250226165314.34205-1-laurentiumihalcea111@gmail.com/

Changes in v2:
* adress Frank Li's comments
* pick up some A-b/R-b's
* don't use "simple-bus" as the second compatible. As per Krzysztof's
comment, AIPSTZ is not a "simple-bus".
* link to v1: https://lore.kernel.org/lkml/20250221191909.31874-1-laurentiumihalcea111@gmail.com/
---

Laurentiu Mihalcea (6):
  dt-bindings: bus: document the IMX AIPSTZ bridge
  dt-bindings: dsp: fsl,dsp: document 'access-controllers' property
  bus: add driver for IMX AIPSTZ bridge
  arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
  arm64: dts: imx8mp: add aipstz-related definitions
  arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'

 .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
 .../devicetree/bindings/dsp/fsl,dsp.yaml      |   3 +
 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h |  39 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  12 +-
 drivers/bus/Kconfig                           |   6 +
 drivers/bus/Makefile                          |   1 +
 drivers/bus/imx-aipstz.c                      |  92 ++++++++++++++++
 7 files changed, 253 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-aipstz.h
 create mode 100644 drivers/bus/imx-aipstz.c

-- 
2.34.1


