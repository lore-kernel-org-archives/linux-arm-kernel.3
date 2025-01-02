Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D6EE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 21:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0kWXWi44B3HrD5CUe09lNd7VBLNzzP0xqVwo/jsaRdY=; b=BKYapMwlY1g/NetDQB6Sc/gAOy
	zvny1177QzlwFQrxpoGm1xUpm1j82T1VhAYH8oVQ838S83jnGJKv1XBLBIj5gehiFL473F9fj5GZB
	/Zo4IOH7e0m3Bi+li6eaFanhFWKTTqXNnFiREteg6RCvI/+wDX77k2ug/wyfDiLCJkrOylteRGad1
	lPri+9COI0VoP1h3nsbkGhKx1vS5wtLjsN7xGDkfn0TI8g/DkKzrEESrS08C1OYaCNhTWlbTs/L3g
	WsdmSWoc9TTL8t04GFdOSA54X3UNkyy7r2HWK7kNhD1Evh1rM/9h2R03p1IwUF+S55fbgJdssygXf
	bC4p2y9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSIj-0000000BS8M-0omm;
	Thu, 02 Jan 2025 21:00:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTSHV-0000000BRow-03r9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 20:59:02 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d41848901bso22424256a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 12:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735851539; x=1736456339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0kWXWi44B3HrD5CUe09lNd7VBLNzzP0xqVwo/jsaRdY=;
        b=fFPYBXnFSTVHTpWVq5CicZdgCQJjHHpU4/MJ2zdqjtjjyh5VDWNbv2qmHiWaC7upS0
         4hcgQtSU1uwKah7iwKFF4iUxDbhh3kz4yCPlySov2fd7Ax2PUb/MRa8IQ/UGxlxeB7TB
         kOv+WqNxBoPA1jxcsGyfKggG8DINNLj9Ov8J5/LmLFSDh8oE6t1kxtG9EJIQSRViePR2
         m7qcr7RDQIqG05oQm/6BZtzwtAuZuEKQNVdycDBXtxkdzCCv9zMm9VjkqgNsGIuT35Ey
         rEX4OSsKDozSAnuUDkLkChIANdE1YbtNpCv82XRKlQOJ/J882G2wYvoyYx2AIo7Rn6pO
         ZJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735851539; x=1736456339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0kWXWi44B3HrD5CUe09lNd7VBLNzzP0xqVwo/jsaRdY=;
        b=NNhvXa/k1TlBoGiUgZ3o1gIchl+7GRAmazdZl0al4+xXiB4RiX6uVTOCAMMFivkl05
         fhCduiwtZjtd67zKAgO/uLLZeVGRBJDUrQJhtjt1TCroFUjAqLEuNXJTaqsEVfVR+b7p
         11LTMJPdPKdRtcxUShS+3qgeRg7u0qWKMIoL7TMvoxO+TQJX02sodsmqasjNSeeOnRlS
         dFgGp5zVEYuSbIEPJni2QoWTHXAp07OH3z2jk6WRM6AhBzrdr3FB9fG4h8IK9/MA0lt2
         dmiQXstg+9u6FRf8zGfF+axz75s0HAKMJo+I7kVrUzbvdSyVOTpwOhWroN4ArOCIyC1x
         h2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVVMdx1rv/faOdvcvQSdG/uT4jURvQZ+6YINaeuq9lXZzxAd6X4nsX7LTd2g0pmYcFWmUEYHOkeu4FK/yKPV87L@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/XruT/Pwc9REGhzTFQHkAB7Xj6Uf/LOysi2b7KeoZTbL1wqtF
	d1WhxJonat2r/Mp41L2KbehXLWzTcaPWQi//SuaF0KRONdMYBcye
X-Gm-Gg: ASbGncvWpd0u2XSGUFmHmQVAWj/UltUpFYuquNmuiDv1QVN/4uGzDaKfeNVMgSbmdzp
	YskFCPJKxxybNnXT9g3tQgJTAaNTcOOCd0MB2+Ho4EJFKDVciBzYgOE02MpPLwG5l8bG4lZVeLc
	N45WPacQMzijIIC1eYSQaJs/81ATygRKjPwVME861uR4fZesxMBnqWPIMBrGxBzFnVuO7k/NSrI
	xRTE35DT02zT1XWBPPYUAUeyW4fXj2Q0uPxHHtuMsZEqWnG4BvNSTtYPtFZpfgOF31gCs4fWAkQ
	RUpC6cqc0Js=
X-Google-Smtp-Source: AGHT+IH1piG7mdo0z8tlBALc36OjUwXqC1PidNSuEDYBGYwirYC4nN4TmpY6pCEYB6gUtkCJFaDu0g==
X-Received: by 2002:a05:6402:4010:b0:5d3:f617:a003 with SMTP id 4fb4d7f45d1cf-5d802388f09mr47523330a12.4.1735851539030;
        Thu, 02 Jan 2025 12:58:59 -0800 (PST)
Received: from ivaylo-T580.. (85-118-76-61.mtel.net. [85.118.76.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80676f397sm19231026a12.22.2025.01.02.12.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 12:58:58 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jaehoon Chung <jh80.chung@samsung.com>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] arm64: dts: exynos8895: define usi and mmc nodes
Date: Thu,  2 Jan 2025 22:58:41 +0200
Message-ID: <20250102205846.223955-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_125901_053607_4F34929D 
X-CRM114-Status: GOOD (  10.71  )
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

Hey folks,

This patch series adds the required syscons for controlling USI, as well
as defines all USIv1 nodes for Exynos8895 and adds support for utilizing
the external SD card storage in dreamlte. Due to PMIC not being supported
yet, we'll assume that the regulators are pre-enabled by the previous
bootloader for vqmmc. (in our case uniLoader).

The patchset relies on [1]. I also expect the exynos mmc binding
maintainer to pick the specific-compat patch.

Best regards,
Ivaylo

[1]: https://lore.kernel.org/all/20250102204015.222653-1-ivo.ivanov.ivanov1@gmail.com/

Ivaylo Ivanov (5):
  dt-bindings: mmc: samsung,exynos-dw-mshc: add specific compatible for
    exynos8895
  arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
  arm64: dts: exynos8895: define all usi nodes
  arm64: dts: exynos8895: add a node for mmc
  arm64: dts: exynos: exynos8895-dreamlte: enable support for microSD
    storage

 .../bindings/mmc/samsung,exynos-dw-mshc.yaml  |   1 +
 .../boot/dts/exynos/exynos8895-dreamlte.dts   |  39 +
 arch/arm64/boot/dts/exynos/exynos8895.dtsi    | 906 ++++++++++++++++++
 3 files changed, 946 insertions(+)

-- 
2.43.0


