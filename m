Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7B3D3569F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 04:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAPh78XXAIfxfDgXO+YnEHKlcDWVZdI7PWnVmQSgPQU=; b=RureSVMM1H7wsJGTg/2RK+r/jW
	FCxAFATSUqMcO7k5+fv9i1TaPK/d1fjF7QcPZlib49eMA4GstF8kb45oM+YiHSQFzdzxmbU1mQBsj
	i11FN+c1ipndT9acBAaP7rrxAXbS/+0DPJ/ST1FVz9rIe95F8as+1KtOlaoqaf8Q3P2b/jIUx4fVY
	Z/wjAh84yVZDgrbQ+YkVu+x3UpmmvSEUKJfBq365W5+Ym2icWertRkdxGc13xlEPfXXjg8hXzg2w0
	3lP0J2RE+KaUSVXMFesDYqPX0uzHDzDI6+N0MnyzejpdT0ZYnwhBIjmtI9APLCrrrgBoQGqKIICiT
	vS2QkHWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHp-0000000HDUG-424R;
	Thu, 29 Jan 2026 04:05:41 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlJHo-0000000HDTu-1I6D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 04:05:41 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a7a23f5915so3119095ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 20:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769659538; x=1770264338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAPh78XXAIfxfDgXO+YnEHKlcDWVZdI7PWnVmQSgPQU=;
        b=A3cV6FehhYC1aJWNgmOk6c+oVuSHgcRhcMl4UDosFqx0WYG+4Yfgw2wY3kj17w2Qeo
         LT3Fgd4AyPfUCI2esmeBirVDGkdYKTxD3x82380d6s7PG3C/3r+YsHvYVLyYqSv6g7Ec
         Drjd8U3qfxgKn3yn1HhaWCGB3a6SfGbRooWdj6KqWG28kFeg8z7MDb/zVpBW79+tzNlQ
         uyYTMf5aK10PzK7sxDez4g5vtTebw1B/nQLRpvHSScL8/0YXgR/9yy+NX7HDjC9rkH/D
         NU3fRxgIuKIy0U54FnO3Wiegc3uzeSZ8gI3rZRBW6oKWuaKPHhMvGLZW6mOxcjogzCDb
         PXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769659538; x=1770264338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAPh78XXAIfxfDgXO+YnEHKlcDWVZdI7PWnVmQSgPQU=;
        b=Gpiri0LaiMjw5seYl6ad52RK76Iol70cPp/ERzIs5QuMODFoFwKxR2PbAj+BRSQSVo
         2vCfIEX/Mbg6Zx6RQeZ2uelJ5oas8jyUSSpQD4emV7UtAAaYYYx1/NtFgaxz8T80abC2
         aNfRcn88soO7u8rMY6F4F1/rAsWcN1ce1duKpPKkral1Lv1N5y7nw0nyDtyIbEjV9Dwv
         0dQi0o+tL2nXuUIh09iU+ZV0YGj2BSjBL35n6CYuRzekuyp7TrbdFD1KfmB/pKGuHumP
         sRzBDCjH5QpYC7YO5OI8KCl0DIroBch7aDZGArOT4ZgZjykzJMRfuj08El7vMKd9paFn
         XVVw==
X-Forwarded-Encrypted: i=1; AJvYcCX+cFSa6AI4arg+Ec+TPUOFaVKKaleo5Fkc1ns2wqI6Qm3kLkKsJIiihkl2699m+nneDJcOLCVlw1OKjt9cPNuw@lists.infradead.org
X-Gm-Message-State: AOJu0YxQxDS/oJmAxD2A1o9coZHgtTcQMJnqG2TljNP3BUTKQj7VvFKb
	NA6OgtuxdSCsjDEHKtuFzVWvpFppU6KF2sQtXLqZFe21ZPDJYzQ7kQMG
X-Gm-Gg: AZuq6aK0Mm2Dl9PhFtZvUD54M3p1PVKxW1T7FOKr1NSU0ayrOIrJ+y18uNMewy1D6Cy
	cX6Xw3jO997QvXex7Dld9jo3R+61Fe83zgWWeC0yeoN5SgZ0bfK/kL9HUzCn+jn2WiSbYGXODgn
	+Cj56M4ZhrCWo2gybcdmfzc5FDPho5sjR5E9e98hbA2epWTlZGyctDZ7F6LSw7DOXhmw/W2FHQ5
	/JeJyNaetWMLmnD9kl3qxo+bKfWGCVwEH7X79qLfZHm1ZJwruuIEIAhskD8wKe7m993C6WTA9ET
	PBjLaojUOSK908r0Lwuf9PJenz8ug1fujxoqzS1Yf/unqtKeaVInKO2W3N8+F5wcAmLCdDl1DiL
	FXMbr5zvWO0K8aBYBDcx0RrgZ/xQBkiuFENu5fqdeErNgKFCB8M/Q1v5kerdMeBTAT6V6h+v6b9
	EHpL4dOQBb8jh4vdWCAxI65isagTKSrM/cY2ind/EGqXoFmxIL+Omr5nQc9zWC1HPXYxQi1KEHI
	YTVltXdCxA=
X-Received: by 2002:a17:902:ea01:b0:29a:5ce:b467 with SMTP id d9443c01a7336-2a870e0490bmr82121145ad.54.1769659538253;
        Wed, 28 Jan 2026 20:05:38 -0800 (PST)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c22672sm3857721b3a.51.2026.01.28.20.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 20:05:37 -0800 (PST)
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
Subject: [PATCH v2 0/3] drm: nuvoton: Add MA35D1 display controller support
Date: Thu, 29 Jan 2026 12:05:29 +0800
Message-ID: <20260129040532.382693-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_200540_352927_DDD4B822 
X-CRM114-Status: GOOD (  11.82  )
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

This is v2 of the Nuvoton MA35D1 DCU DRM driver series.

v2:
  Driver changes:
  - Drop custom CRTC and plane properties and switch to core-supported ones
  - Switch to memory-safe DRM-managed allocation helpers
  - Fix several minor logic
  - Fix W=1 build failure on non-ARM architectures

  Device tree / bindings:
  - Fix dt_binding_check errors in the YAML schema
  - Update DTS/DTSI files to follow proper hierarchy and port modeling

Thanks for the review.

Best regards,
Joey Lu

Joey Lu (3):
  dt-bindings: display: nuvoton: add MA35D1 DCU binding
  arm64: dts: nuvoton: ma35d1: add display controller support
  drm/nuvoton: add MA35D1 display controller driver

 .../bindings/display/nuvoton,ma35d1-dcu.yaml  |  73 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  56 ++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  14 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/nuvoton/Kconfig               |  21 +
 drivers/gpu/drm/nuvoton/Makefile              |   7 +
 drivers/gpu/drm/nuvoton/ma35_crtc.c           | 372 +++++++++++
 drivers/gpu/drm/nuvoton/ma35_crtc.h           |  67 ++
 drivers/gpu/drm/nuvoton/ma35_drm.c            | 371 +++++++++++
 drivers/gpu/drm/nuvoton/ma35_drm.h            |  48 ++
 drivers/gpu/drm/nuvoton/ma35_interface.c      | 193 ++++++
 drivers/gpu/drm/nuvoton/ma35_interface.h      |  30 +
 drivers/gpu/drm/nuvoton/ma35_plane.c          | 603 ++++++++++++++++++
 drivers/gpu/drm/nuvoton/ma35_plane.h          | 115 ++++
 drivers/gpu/drm/nuvoton/ma35_regs.h           |  88 +++
 16 files changed, 2060 insertions(+)
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


