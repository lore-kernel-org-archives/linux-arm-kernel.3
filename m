Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C22CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=; b=PyKPnoBaHx7tnQ
	wbEOT8vwWoit9yxGfWhR24jmnP2qjA8YHJa1+S3dbLJr6EsazjkY3xl2BACCldIfl52BPS/QoGnHQ
	vYJ49A2SYVVqMiwTIqQpHNWp87XNGQGdF9iFuBe4+KtLUcdgY2SsDwRUJ7s7LXzxF4URwLOPluOB8
	nO7MzlczjMYGodlpf2C/c/Bafvw8APWaym2hd5PtjSmijIlBctQmMWBZZqxMIFCVT7lTQdLymzuvR
	5JBtvQ97Ab4d2LbgI8BaBtrrIx8iTJqEbQSFFCxR2Keu6G8BwZtiCLDSKBE6YZ0XzKw23/xS3KGYF
	0TetrAiZeC/1IYI2ewBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDhy-0000000EFRJ-0jKW;
	Mon, 01 Sep 2025 23:13:06 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut80N-0000000DPEj-3dOy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 17:07:45 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f6f434c96so2390345e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 10:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756746462; x=1757351262; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=;
        b=KjTZ6pHVxlezJGznWBf2p0Jh+a+WO56+O9s9IUZJSjGJiIAOxWm+fWOUvyXuROXGHr
         zz3i2/zbTg5hM24jsI3FF4gudbJTmAO/NibplWE7xdPKsAVw/cYH3jrnWcBqxYNkM3+E
         uA49Cm9tKx0XJs39Q+5RSYXAe3Nnzpzq7+BVzAwdXiH/kIkysLVNuN+rgb/8HSegmCwE
         m1io+j8pzSh1MQfA1UzXWLLocIt5yzIvLHhAgZrP9RjeHwYs43/6jLkbneNg4luWcKIF
         iEapVFAflhSPE+n+THO0OZAv/ul5fBe6SZW49ZakWWfho4MvJ66q34lR0x2OvPrRs4ir
         Ai3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756746462; x=1757351262;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kL1xnjqe2uzC0tVKSkm6SdseVayTEiArpVj+WQ0yDk=;
        b=Ctr0LfGc28olGv3pOLsDomegWS4qj0cPxYvgcBw1V038nB9PV7e3R4iWmq6NJ+wQJM
         oEOCER6DZiTU4H8zIiDfgKSzPnmgedtK1+SdEVUMoA9F1bYeh5GWYCbJry5PxfUklEHO
         n5EKBZCyUSp8gqOIGzNJhZNslokr81x9va84KUGpvsVzJd6kncePKlwkYeLovozocfie
         7am6WHFSxQaQXnAKzAUuqMxQ5tRd9JLgoi+GrM1FOj/mqLVt3JY1oqEQ0bPHeyQwYWV1
         MBW0Pv43JQpWgvZD3hISgr+mFvyzi/xwR+SChKbAodc0PxQfZbRrz3CIM1avMlrkJMHC
         fI9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEUUGSQA9weAyngr0zFL+ASyq46cLAv735FEio5c7tZRgxOgWLSh9rcCoY20cAE0ook6N58i/YKBreFwyV8Q84@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd+le+4EZrMEmHJqF0GyziHru7N/LXVPMF6d74EHcNgGxT0GcX
	st3HxK4eI1k2544iicJIr6mXVCLK/TVpJu/VLfe9MmDCAKjFhvHg91lX
X-Gm-Gg: ASbGncsXeM15kK97UBGYeAM2w9OTCT3KURTb9wQc7YH8KPRdEjtjXRtmvjh2qQ1Oa6L
	YbLVBPnhpHGG/NZ4U7pGwpZ5VcODy0OaJvYp6e2LG63cuLdurZ/2HSAjAEHzyY+Z+iwuFQagzPX
	+qV/2Koq6/Yt0Df/EJY38jQuQLLEJo6vLggSh9KGlBXqSi7gT940tzqW6Xpx6wmCQL6q6PJNGE9
	fmVCNECEbsZAy8GIEQQH/JaVLl6v7ODYzQVrWAkSqwj5T4/J81wtDZgXqvOJFADxhic7ByySj1j
	ozSE0Vj1r4dWN2tGfyCbA7h/x7WHKfboLlfxfWF120AwCjDyrWHPnb9Td7lSwHcUP/DQAS6JG+9
	rx6+QKWzWpYig+4dc1P59hFjKgfVDBWHOx1OZ3eUWzmyzEg==
X-Google-Smtp-Source: AGHT+IHWg9rkJXFeOAyLPfI6Jq9upYbCl3QgUTbnRIZyklmbPgPwlM7YtvDYF70o6nvmJLdC8tIBxA==
X-Received: by 2002:a05:6512:230b:b0:55f:5172:474f with SMTP id 2adb3069b0e04-55f708b50c1mr2491179e87.17.1756746461551;
        Mon, 01 Sep 2025 10:07:41 -0700 (PDT)
Received: from tablet.my.domain ([2a00:f44:892:8a37:6b0:21e7:549b:225b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f7abf7abesm1137666e87.55.2025.09.01.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 10:07:41 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH RESEND v6 0/9] clk: bcm: kona: Add bus clock support, bus
 clocks for BCM21664/BCM281xx
Date: Mon, 01 Sep 2025 19:07:06 +0200
Message-Id: <20250901-kona-bus-clock-v6-0-c3ac8215bd4d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Alex Elder <elder@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alex Elder <elder@riscstar.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3153;
 i=aweber.kernel@gmail.com; h=from:subject:message-id;
 bh=me8EWh422YPo3cERqnPRxnV9qzRXPkVz2TeOOkHXTbc=;
 b=owEBbQKS/ZANAwAKAbO7+KEToFFoAcsmYgBotdLIi6PhSFeqmMBEQRv1HVm0Y6me6yRuQg9zb
 h0pGkVQqemJAjMEAAEKAB0WIQTmYwAOrB3szWrSiQ2zu/ihE6BRaAUCaLXSyAAKCRCzu/ihE6BR
 aMimD/0cI/DWnNL3uvNnof3spp9UvWC6z4WyZGJpVBYGjAlnati6sOENPcj/H2kMAsGSktW2oka
 D2mm5n0Vcfr1wfJv1l762pW9G4GHJQH2f7RG2Bs3L4tgOHhBhoC7uVgczKSNK46t2zWEGRd8UMb
 ZwRHgpDoIdAaiq2EW2112cWmBeO/Zg0eJLpBlQ2AGruC087SH+ww2o7850ev2HcWG0Lxc1lweC9
 eQ9/HjQ1gN3nJw85OJUVGLqaZLgcnAEwc5GzE2khBG1bUDGP69L9kFWOjrSfNpZlEgaviDNVCZ5
 a6WzZSQjD+Zim+vmGhWkoofoIfLyZvYcl7SgW73kRzVEWnpamHJhp+UUL10er39DevgozHFga3Z
 qpHaQXhEgn/LUYo9ca64MBT3XZqXFGJBO3UwalRzjFZpSSAa8j0jEymJmjOJw6TgxSrZwhsSDB8
 55fOA0pr+4Tsw+2zxq9MUqHe872NBfJa8Y6IHSjGXJisZmBRqwmdH6lYrg6h1rkRoo1PVCuALdr
 gA4pj+VxDOYdGBHSGW1l8lYnlCpITCA755atn6ion3NyEc8xpiImvSfUoyEuRkS8n0J2iW8vGLx
 xb6bZdLKNzNf7YAn1EBHjaQAS1AYllXZZuSDAv7qYARlTW7iXT9esNRbTFb4xnVrtya6U4daI7B
 DgOG6vCyeG85p0g==
X-Developer-Key: i=aweber.kernel@gmail.com; a=openpgp;
 fpr=E663000EAC1DECCD6AD2890DB3BBF8A113A05168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_100743_913729_7920E16A 
X-CRM114-Status: GOOD (  13.55  )
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

This patchset does the following:

- Introduce support for bus clocks. These are fairly similar to
  peripheral clocks, but only implement policy, gate and hyst.

- Add matching bus clocks for BCM21664 and BCM281xx peripheral clocks
  and update device tree bindings to match.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v6:
- Rebase on v6.16
- Make kona_bus_clk_ops const, add a new commit to make kona_peri_clk_ops const as well
- Link to v5: https://lore.kernel.org/r/20250430-kona-bus-clock-v5-0-46766b28b93a@gmail.com/

Changes in v5:
- Pick up Reviewed-by trailer from Krzysztof on patch 3
- Rebase on v6.14
- No code changes since v4
- Link to v4: https://lore.kernel.org/r/20250318-kona-bus-clock-v4-0-f54416e8328f@gmail.com

Changes in v4:
- Rename moved CLOCK_COUNT defines to CLK_COUNT to avoid redefinition
- Squash BCM21664/BCM281xx bus clock DT bindings commits together
- Link to v3: https://lore.kernel.org/r/20250308-kona-bus-clock-v3-0-d6fb5bfc3b67@gmail.com

Changes in v3:
- Fix DT schema example in BCM281xx bus clock bindings
- Move CLOCK_COUNT defines from dt-bindings header to the driver
- Fix BCM21664 UARTBx_APB IDs being out of order compared to clock
  driver
- Link to v2: https://lore.kernel.org/r/20250303-kona-bus-clock-v2-0-a363c6a6b798@gmail.com

Changes in v2:
- Drop prerequisite clock patch
- Move clock/bcm21664.h dt-bindings header change to dt-bindings patch
- Add BCM281xx bus clocks
- Link to v1: https://lore.kernel.org/r/20250216-kona-bus-clock-v1-0-e8779d77a6f2@gmail.com

---
Artur Weber (9):
      clk: bcm: kona: Move CLOCK_COUNT defines into the driver
      dt-bindings: clock: brcm,kona-ccu: Drop CLOCK_COUNT defines from DT headers
      dt-bindings: clock: brcm,kona-ccu: Add BCM21664 and BCM281xx bus clocks
      clk: bcm: kona: Make kona_peri_clk_ops const
      clk: bcm: kona: Add support for bus clocks
      clk: bcm21664: Add corresponding bus clocks for peripheral clocks
      clk: bcm281xx: Add corresponding bus clocks for peripheral clocks
      ARM: dts: bcm2166x-common: Add matching bus clocks for peripheral clocks
      ARM: dts: bcm11351: Add corresponding bus clocks for peripheral clocks

 .../devicetree/bindings/clock/brcm,kona-ccu.yaml   |  49 ++++++-
 arch/arm/boot/dts/broadcom/bcm11351.dtsi           |  33 +++--
 arch/arm/boot/dts/broadcom/bcm2166x-common.dtsi    |  28 ++--
 drivers/clk/bcm/clk-bcm21664.c                     |  99 ++++++++++++++-
 drivers/clk/bcm/clk-bcm281xx.c                     | 141 ++++++++++++++++++++-
 drivers/clk/bcm/clk-kona-setup.c                   | 116 +++++++++++++++++
 drivers/clk/bcm/clk-kona.c                         |  64 +++++++++-
 drivers/clk/bcm/clk-kona.h                         |  14 +-
 include/dt-bindings/clock/bcm21664.h               |  17 ++-
 include/dt-bindings/clock/bcm281xx.h               |  24 +++-
 10 files changed, 540 insertions(+), 45 deletions(-)
---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250212-kona-bus-clock-4297eefae940

Best regards,
-- 
Artur Weber <aweber.kernel@gmail.com>


