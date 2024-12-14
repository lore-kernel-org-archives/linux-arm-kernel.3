Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBB4E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Dec 2024 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3Pk7g3pQspO9VmDHlEH1a+IKv291+qN6GSVn3ge65Ds=; b=YG1yxyyxdzKc68
	9+4DmEwEVIHNwxdJpqHVRwbogX9CsqQLNrIOVL4TBlC3f3xzwjfk8AM7jYEA7bBpKO+JJMo2oi3kU
	bqgSOssQrgDNUb8BlrTc9dpf02jTObC7T1G1ToTkU76/lqbYmnSX1z8H4cU5WchRcjvgKF59kWKtR
	Nosb8X7YRwaF9z0TmRpN8kTfsDoLgVZ5CI5e5VQxoz3KLMGxbewIXDokFZLQ3JqhuDSQO+HPtz1rT
	VUnlXnGc6asE6cbL4Z0ER7x/OroXv9TbxY8g51JZjm5196jcE3mm/8lyI9zj6GT/1XKLrXLnfJnln
	apgphFS4LpkwhOD5+69w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTar-00000006W2A-1GIb;
	Sat, 14 Dec 2024 14:58:09 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMTZi-00000006VrC-1ahg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Dec 2024 14:56:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3f28881d6so3393714a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Dec 2024 06:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734188215; x=1734793015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3Pk7g3pQspO9VmDHlEH1a+IKv291+qN6GSVn3ge65Ds=;
        b=Ric0+V5R2U6g6SrGRAEGb3+CWUlNjQQYHecVFo+cxAcTz5xolr5KzIpkGlMs8CSi3M
         I/ZyQDSuGM7ihcxJrPc1rNsvKgbSMvV3Mm3OjH9AA6P3Px3PhymRN/oJZOYlFOERVLsN
         llk4hlHxz9qE4K/8ZmJK5iUJYla3ypSZtRJA+6QbILzd1Q5eHtkn/lU2Yp9J78eY2+ue
         5ILO2FgiUWTe08wglgDQNx8C2cKzdXp9txcEAIr/5uAfIAiSSyA+hTlSy1QhbqfKdYX/
         Hl7rLW6JivHvgOI3/+jAN/2jt8QUul455sCCu9XDODlOSZNFzcXa/lWArP5W8nWbzpP/
         Gryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734188215; x=1734793015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Pk7g3pQspO9VmDHlEH1a+IKv291+qN6GSVn3ge65Ds=;
        b=SrroGo9dDkpKTb6T9hksEXBnJngPxiuv8vlXboFleUDooISdYyUX0wmRuO9qBvLHN+
         /vcpYFBN/iL7kG8L/L2I1968KuXoQVxV78IpDaU9kxUOuWflEklj9sx+GcEfnI4CNIx9
         cpS+/dojtDXyNMoC2PP4aP64e8LvMFazvoUpeIHm/eow04grlkbNwF2XdybxZEvqQ2T0
         eJKzQaDYwRUzhLuC9dA97VCVT5kc5awDFSAd6Go4kaiPOfu4fys/3orZR97Y1b//PK1E
         5Ind9hYewtLTHIOHjbSRgQQVGIPduLOmlP8+G54g8B3Wj3BO58n4ovFo0vn4mZ6kGSJf
         i0OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8LaYeI8vW7WuSjLBwNmrAV+zQp8h/wvx21uhILfUws6KZTETqSwVwxHoSAqRI+TYgbIQv551pj0ba0x8yb8u@lists.infradead.org
X-Gm-Message-State: AOJu0YxqiVklp5FXr1vN/xUsTOrL9IIQopr2iZf225l9pd6wf7mZmieO
	x9Qk6eagWjkywLMZ2311LsmpPfblY//lQ3LsBrBOXAOAhzEBRmHHVTz9TQ==
X-Gm-Gg: ASbGncvHJZ7FQGcBLnbspMKujNAjmiykKhmplM4fAWVapu567BhC+9zl++kAqWNPKZp
	fiH65sngLWYtfpwMxC+e9cahfA3hm8uPbxvj4Sqcg6Y9ARS0vCLVUxgSzNLFPOMiBl8emaliAuW
	EvZuIp/pYTD2/N+Mn2p1amQ57QhUyJUJvC7LUO7G89kV+ELsW9Lll82iPGWCni8oscs2xGVwD+c
	UWvIEm9Lw+/9wCU7n1kqSJcLX4Yg3UAuNA98Gd5ctvY7kl8lcnFI1ClPg6kDfYfcNGy
X-Google-Smtp-Source: AGHT+IGlc2KM+T4wRDPFeJUNWICS4zV9hyHb4SSOC/OGn2gaI4XQmGyiy+GVnvwzWstR1+w27/xS7A==
X-Received: by 2002:a05:6402:40d4:b0:5d0:e73c:b7f0 with SMTP id 4fb4d7f45d1cf-5d63c405fbbmr15854962a12.28.1734188215208;
        Sat, 14 Dec 2024 06:56:55 -0800 (PST)
Received: from [192.168.31.111] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d652f35b5bsm1057698a12.89.2024.12.14.06.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Dec 2024 06:56:54 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH RESEND v4 0/2] Add support for Exynos9810 SoC and Samsung
 Galaxy S9 (SM-G960F)
Date: Sat, 14 Dec 2024 16:56:45 +0200
Message-Id: <20241214-exynos9810-v4-0-4e91fbbc2133@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK2cXWcC/23QsW7CMBAG4FdBnjG6s02UY+pQVgY6IoYkvoAlk
 rQ2jUAo784pLAnt4OF8+u6X/odKHAMntVk8VOQ+pNC1MrjlQlXnoj2xDl5mZcA4lKf5dm+7RDm
 CLi2zJ1qXUJIS8B25Drfx2EHtt1/b3ac6yv85pGsX72NGj+P2v3M9atDs0XnwGXjIP05NES6rq
 mvGM72Z0vWMGqFEVWFrixkbfKd2SrMZtULLnDyTc8jFn1Q3pfmMOqEZEtbkoYJ6ljq8Con88yu
 lXl+tHIfhCWSMaHJyAQAA
X-Change-ID: 20241024-exynos9810-b3eed995b0b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734188212; l=3140;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=mRczhs/xzX2xQZ8w0m2HvG1tEXpyCuzUCo8FCVrqwpI=;
 b=5H07vo9fmg56LQhkrkIqroP7x+EHwJtbOB0K0CyVnK3eTY8ZM4f/Yp6tC3DVj5DMQ4Sj1iopv
 aQobjV68walBkb3KFj7WrH/fKAHvSMOsy+4wh4MOnstMsGbBT62AbAu
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_065658_474874_A7461181 
X-CRM114-Status: GOOD (  17.06  )
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

Hello,

This series adds initial SoC support for the Samsung Exynos 9810
SoC and initial board support for Samsung Galaxy S9 phone (SM-G960F),
codenamed starlte.

The Exynos 9810 SoC is also used in S9 Plus (star2lte), Note 9 (crownlte),
and perhaps more devices. Currently only Galaxy S9 DTS file is added but it
should be fairly simple to add support for other devices based on this SoC,
considering they're quite similar.

The support added in this series includes:
- cpus
- pinctrl and gpio
- simple-framebuffer

This is enough to boot to a minimal initramfs shell.

The preferred way to boot this device is by using a small shim bl called
uniLoader [1], which packages the mainline kernel and DT and jumps to
the kernel. This is done in order to work around some issues caused by
the stock, and non-replacable Samsung S-Boot bootloader. For example,
S-Boot leaves the decon trigger control unset, which causes the framebuffer
to not refresh, so simple-framebuffer wouldn't work without a secondary loader.
Ideally, there'll be a kernel driver for the display subsystem some day to
resolve this issue.

[1] https://github.com/ivoszbg/uniLoader

Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
Changes in v4 RESEND:
- dropped applied patches
- Link to v4: https://lore.kernel.org/r/20241028-exynos9810-v4-0-6191f9d0c0f1@gmail.com

Changes in v4:
- make DTS build again [typo, misplaced ;] (krzk)
- lowercase hex in pinctrl (ivo)
- removed the perf patchset from dependencies (krzk)
- Link to v3: https://lore.kernel.org/r/20241026-exynos9810-v3-0-b89de9441ea8@gmail.com

Changes in v3:
- fix a blank line between tags (krzk)
- align with the opening " in eint-controller (krzk)
- sort the memory node (ivo)
- drop the \n (ivo)
- drop the perf patches into separate series (krzk)
- elaborate a bit more on dt-bindings (krzk)
- Link to v2: https://lore.kernel.org/r/20241025-exynos9810-v2-0-99ca3f316e21@gmail.com

Changes in v2:
- sort the pinctrl nodes alphabetically (ivo)
- move the interrupts from pinctrl file to SoC dtsi (krzk)
- move the wakeup-eint from pinctrl file to SoC dtsi (krzk)
- sort gpio-keys pinctrl-0 and pinctrl-names (ivo)
- rename the bixby key node to "wink" (ivo)
- sort gpio-keys subnodes (ivo)
- sort pinctrl_alive gpio-keys pin descriptions (ivo)
- fix the Co-developed-by tags and add a signoff (krzk)

- Link to v1: https://lore.kernel.org/r/20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com

---
Markuss Broks (2):
      arm64: dts: exynos: Add Exynos9810 SoC support
      arm64: dts: exynos: Add initial support for Samsung Galaxy S9 (SM-G960F)

 arch/arm64/boot/dts/exynos/Makefile                |   1 +
 arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 503 +++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos9810-starlte.dts  | 119 +++++
 arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 273 +++++++++++
 4 files changed, 896 insertions(+)
---
base-commit: 1b2ab8149928c1cea2d7eca30cd35bb7fe014053
change-id: 20241024-exynos9810-b3eed995b0b9

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


