Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CB1D31A0E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 06:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ph6IxAnp6q3+uLiFT21GgPymCv9JqfeKX9RiduzDODk=; b=XdEQLkNokUykK79sTTyXkrn/nw
	RmHr4JSK7C20+fdWJ+Cbj6ZYU1ITKaZeJPc/DkJ8+tHV0Ri5Ov1/ea4Uizt++9zdDA/rS+Vw1kKFY
	LMXJP1MVLXB6dINcaNrdJGxbQFseoLyflRpFafUQlcW9eFLfqWW4UsNicpJbwdzWsbfU76jte69bV
	F5LbCZHUf1x+T4Smzy/wdUxYfc3Lqmci1EpolMzszDCM9vMfCQRMHIn4xfPI8cYShy489cEndJblN
	x7ITEQtuzdwUS1D8u1ulJPQFLcLcX5PqGh17SgWvdxYPSKBfwVy0Vrz1/9Dvhi6L3Jr2mYipoaN++
	G6wTrsEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKZ-000000087Mn-2W13;
	Wed, 14 Jan 2026 06:26:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfuKX-000000087Lu-1ZGh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 06:26:10 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-34c24f4dfb7so4439906a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 22:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768371967; x=1768976767; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ph6IxAnp6q3+uLiFT21GgPymCv9JqfeKX9RiduzDODk=;
        b=jEHAsgf6CVHvpX9Z8+GI4fk5P5hmYt87csSnknRdhs4fXglMCzz97ule4z4joywNYf
         +AeQr3n3z24b97amycGFnrpxhoYOqxGwKv3tVK7NnTYLfmGsXy7X/4U0AhRpvaf5zsQd
         VH3c07jns0U4maitIqpdgPHBxHC3lutFPS8ox0QG6gqCeJnlDhC1Y5klNy48qUksGwN1
         PY1fmSpBDiuwjRY4G9iLpxkb0PbLZCA71cN2JzBV6hEJzDrhzD+CpcMthfeQtxD4Bt8x
         HLwlSpE7hWFGKJJcb7xOnTRRolqRoH5kAMeXTLbbZsOBUfgSBZscLjjIgSb0cCnzm9I2
         jktA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768371967; x=1768976767;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ph6IxAnp6q3+uLiFT21GgPymCv9JqfeKX9RiduzDODk=;
        b=PTaysD8IgONwtPG1EhuZvY5Afk+IHY1FUEwbzKoaEQmlJBhiNphFVQX/3DsNvHSGSo
         MXxvgiwVFe+kiN/guoZ4E4BYUTKqLXWBy1uWZm5SDEynoYag7CdgO+cgnunkj1sOz5wl
         y1OAqT7XFPASQEPa4ZR4d3LF4nZ/4LRYnArFIsRQAUPtO6PgamUZSD/YzbfVLgRWvIy7
         AQKdYPxLVBEJnYpjFqiVM0baaWvaQPRfSz+cszmmcvLFWXGc5Q2ESQqAdm/qAzi6/BmB
         tRLUOnyB1D+agG9c8L73lw+pPn/eelpW1Gf0H/TNGmqJ5GvW+F/SD/k+Dm1RCzQcaX+M
         s2bg==
X-Forwarded-Encrypted: i=1; AJvYcCVBWEp/4s3k8kFFempm/2VCzD6epj1MOLDu9GkPGgjsg3OCA/IaBKr+sO+nrkCZuxl1ZUu8qicp15aybU81Cu9I@lists.infradead.org
X-Gm-Message-State: AOJu0YwP7DYQeGqXjFL/kgRaecMBiX6aZsHGFA2xGSO9vE/kQxMFruun
	O6ks/dZ23GergJLiDT728JPGHCsL8Fa4l56nAk/zXV1H/AALnD30OipNt3D5evVKf9PbGsPq
X-Gm-Gg: AY/fxX4xqpv3faV4Q0WvsuKRKPGGGB1SM9BGqMOeAEpvj0wV5KdGHSeixUCSpqgWacu
	YUQ5KvXaT2rD3umFmQM6A4DKfwPpuHwYDaDQvwxlKJ+RooWQn9OzZ0Q4KZ+eTS20RQxXDE0uYGV
	9Kh7shV/LD0Z+SDvMMFW+J7bEAUJ6FeiazsNQjeFtbi/1BCe4+XkmZQHWosqMFU6Ku6DY3c11za
	2X0pQV+K74nSzSHAfYDuBXQCNbs5GhQcIF+F9cLK4XlKt9PE7zyZ5ZezIpT4K1RF9ReZkB4EXho
	nyNvFutnB3kdbUSo66BWQfA3i5VMnJDdgvTPR/p+bM22Nw0ou86mXIROfQVtv13aKiGQ8d1GO7Z
	UeF2P9nWpZgaumcnC9wG+TaiIpC7epwbIAY2eDAB41GC4i/ji2ZK7WdXWlLjJYJp/2KQOQTje9R
	TC7J/LLJo=
X-Received: by 2002:a17:90b:3d8f:b0:32d:e07f:3236 with SMTP id 98e67ed59e1d1-3510915bb29mr1745385a91.22.1768371967515;
        Tue, 13 Jan 2026 22:26:07 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35109d88f0esm891791a91.5.2026.01.13.22.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 22:26:07 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: xianwei.zhao@amlogic.com,
	christianshewitt@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	nick@khadas.com
Subject: [PATCH v2 0/2] arm64: dts: meson-s4: add support for Khadas VIM1S
Date: Wed, 14 Jan 2026 14:25:47 +0800
Message-Id: <20260114062549.68954-1-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_222609_412420_728AAF2A 
X-CRM114-Status: GOOD (  12.19  )
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

This series adds initial support for the Khadas VIM1S single board computer.

The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
It features:
 - 2GB LPDDR4 RAM
 - 16GB eMMC 5.1 storage
 - 32MB SPI flash
 - 100 Base-T Ethernet
 - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
 - HDMI 2.1 video
 - 2x USB 2.0 ports
 - 1x USB-C (power) with USB 2.0 OTG
 - 2x LED's (1x red, 1x white)
 - 3x buttons (power, function, reset)
 - IR receiver
 - 40pin GPIO Header
 - 1x micro SD card slot

The first patch adds the devicetree binding, and the second patch adds
the board device tree.

Changes in v2:
- dts: fixed dtbs_check warning: removed unsupported 'enable-active-low' property
  from regulator-sd-3v3 node
- Link to v1: https://lore.kernel.org/linux-amlogic/20260113090951.35928-1-nick@khadas.com/

Nick Xie (2):
  dt-bindings: arm: amlogic: add Khadas VIM1S binding
  arm64: dts: add initial device-tree for Khadas VIM1S

 .../devicetree/bindings/arm/amlogic.yaml      |   6 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 190 ++++++++++++++++++
 3 files changed, 197 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts

-- 
2.34.1


