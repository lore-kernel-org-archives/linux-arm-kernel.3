Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01402C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 08:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oQ9aFobDUemcPRrLlp/PuTWIeXOZx5LQW0AdEMjMZ8c=; b=Cc67Tvx+HafFTWgCTgQsZBCRlI
	Zt7fk+N6HRghy5vA51R3EYLBTSyA/a3+DODsduOJi45qB94I0/6fS9wxqBI+OzR2aqd7gBHBNSKmg
	2o71g8ZKELZ7c2/92+NEndlwWmsAGtbN7HGesBinK4RVMCRuyxgUQYdRpKBY9mrppOROCs8bjGkZe
	ln8awpkLBeJx9FXqmucMhB6vD216iPPVX5WPDDA26/tW7ayYY9iR78XFSBNCnRz9KoxaGfN9jJVkl
	KgbR6E8MIPatJrSgI9agVQf8yH7/YEjtWfm+53F5t/MQqc2mcSiUjXgwsypPaQPAGgn8YuYdG/UBq
	6RFenW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRL-0000000C8rM-2VFP;
	Mon, 26 Jan 2026 08:59:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkIRJ-0000000C8ql-0EYa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 08:59:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so3737961a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 00:59:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769417956; x=1770022756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQ9aFobDUemcPRrLlp/PuTWIeXOZx5LQW0AdEMjMZ8c=;
        b=QbNizm2aq7u6Zv3lA2lqR7d468h/7XarUNWeuna1EryBbYAi6/Gwxp8Akn1HSKJAMK
         2TxFwj/KT6EbW0G3tKl/5Pw0E492bjlaQcZXEeXbvR6yHX9HPskkdOEUahVOG1NQKSr3
         zYWrOIig3hr+wKdeMv7KGKPaWpPobl21sCUhyxwwzKN9INrIx9OSyfaxzSIEjWAQboI+
         vfS1z3RIIca5Kx7m6pDGSw81rZgD2HAq0L3W79d0R7UlFwlnyE5TUe5NNfHaPCO4r/vs
         s07oKSEcL15tVVI/7V3lgUNdtWzRd4uCfYw5J14qCsCa1dPuq8X0oI2MbpNLuBEk4owq
         rLcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417956; x=1770022756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQ9aFobDUemcPRrLlp/PuTWIeXOZx5LQW0AdEMjMZ8c=;
        b=KszD9a+5eeL9oSLJOxtIL+Gs/kFbhAjGF2sv1eLjJOqy9Lr+z+/9TIVVgzN23OTN5O
         sLxyk2PlrX+SLOh+fUrRNJojsLAm97fh3kFk0wqRxMxFDFIXcD3UejXKPSKvgo/dG1hE
         MrBsbe7hxHI9s1zVzrl4iOzbZIg5WT1H+Z37ebf0hIIlC3j7FhGM7YaoQMQqLfdqARZs
         QXl9VOenCZg6q18/YCxsiFdGpl4pD2pyx0UgdFB0IPWWSfBAo9uYZylR25whbEZTg7aT
         sh6VusjDRhi49Q3p+ZH8chKx8UVV6TFk0PvsA4JjLt92E8uwbM2mRm+I0frfipZ7RTpP
         YDOA==
X-Forwarded-Encrypted: i=1; AJvYcCVHdI29YEveyhfdbGuGs/toUs/kBhsG6h3PLdUpVFxQK1swntMaQLxoxGiSE3faCmaeOb84Et3ScDIXHQkVVqQg@lists.infradead.org
X-Gm-Message-State: AOJu0YxFwxPAheCBwL/uLaGPjOiBeERVYJRqJDtZeKWqrinsR8oJhXtG
	C4lpHLos7aDdPx+5Yn+U514nZg0JrGX62nqmxPMt2et8fHfrVUAdr9m4CO1JbLJb
X-Gm-Gg: AZuq6aL3ck71MocmpN0zQUYpq3vDOsNuW+GxZ3bzW+Cjnwez02ramGEYidWCms1rrEY
	nQF4/mWciExNpdTGMUwpnlG0FtM+gN2m493OwhOtcnHPs9Gw+LygjpKF/fPzYgfhwAJCI4qrcOe
	rI7d4RLNm9f32U+n51KU7j6p18IRl3xG7lxRZiIrzXxCRxpmM2jvOozzcYJb4Q0jyjMYevz1Alk
	rR7bbG4EXNdswHRVFfwYCoUGELPhbCuVLXefOr/E36wCy9xh6n0HjAooNR1IYSfHTNerFLiVKbs
	J2N2x+thKzuBI4V2RRLRhekPI92RX8wXkz1MLsFPDcQpUrdm3Hbx5jEz5KZFGSz7qdGmqUTYsaq
	JdlL9J3GvQaPkUd7Ytcr4jAfAUtCpTmhaS4oL5SA94/AzH7l4zvnWgjF/1ayeqGllEJTTqTcgKF
	+ijqEENWt0NDLILbBZXfN2ekGNHf5387GK2JO/p1Xau33oKZ/lCh0Q2PCrxBWv0WYCFMnTZXMJ
X-Received: by 2002:a17:90b:4a11:b0:349:2154:eef4 with SMTP id 98e67ed59e1d1-353c40b84dfmr2930111a91.5.1769417955671;
        Mon, 26 Jan 2026 00:59:15 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3536dc3e0ecsm8251798a91.10.2026.01.26.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 00:59:15 -0800 (PST)
From: Joey Lu <a0987203069@gmail.com>
To: airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	a0987203069@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm: nuvoton: Add MA35D1 display controller support
Date: Mon, 26 Jan 2026 16:57:24 +0800
Message-ID: <20260126085727.2568958-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_005917_100622_A2BF752F 
X-CRM114-Status: GOOD (  14.22  )
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

Hi all,

This series adds DRM support for the Display Control Unit (DCU)
found in Nuvoton MA35D1 SoCs.

The DCU is a DPI-based display controller intended to be used with
external panels or bridges. The driver integrates with the DRM
bridge framework and supports atomic modesetting.

The series consists of three patches:

Add Device Tree binding documentation for the MA35D1 DCU

Enable the display controller in the MA35D1 SoC dtsi and SOM dts

Add the DRM driver for the MA35D1 display controller

This has been tested using modetest with a DPI panel and verified
to expose modes and perform atomic modesetting correctly.

Best regards,
Joey Lu

Joey Lu (3):
  dt-bindings: display: nuvoton: add MA35D1 DCU binding
  arm64: dts: nuvoton: ma35d1: add display controller support
  drm/nuvoton: add MA35D1 display controller driver

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  74 ++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  42 +
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  26 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/nuvoton/Kconfig               |  21 +
 drivers/gpu/drm/nuvoton/Makefile              |   7 +
 drivers/gpu/drm/nuvoton/ma35_crtc.c           | 445 +++++++++
 drivers/gpu/drm/nuvoton/ma35_crtc.h           |  78 ++
 drivers/gpu/drm/nuvoton/ma35_drm.c            | 389 ++++++++
 drivers/gpu/drm/nuvoton/ma35_drm.h            |  48 +
 drivers/gpu/drm/nuvoton/ma35_interface.c      | 192 ++++
 drivers/gpu/drm/nuvoton/ma35_interface.h      |  30 +
 drivers/gpu/drm/nuvoton/ma35_plane.c          | 904 ++++++++++++++++++
 drivers/gpu/drm/nuvoton/ma35_plane.h          | 226 +++++
 drivers/gpu/drm/nuvoton/ma35_regs.h           |  88 ++
 16 files changed, 2572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/nuvoton,ma35d1-dcu.yaml
 create mode 100644 drivers/gpu/drm/nuvoton/Kconfig
 create mode 100644 drivers/gpu/drm/nuvoton/Makefile
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_crtc.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_drm.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_interface.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.c
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_plane.h
 create mode 100644 drivers/gpu/drm/nuvoton/ma35_regs.h

-- 
2.43.0


