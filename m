Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81E2C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 05:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=; b=eOXII4c++rDTQe
	mlNiO6/j+ef42f9FA0eivohqEzhQROdGrp9MUFn73L+KePJvzHGSx1AGTH49aYyy71tAnoe25o5yQ
	p60qDiSEwSmJl2QjIXDHK92IA4ATly9eVJH75yw3N5lHU2Fl9jagWgBF1mfWl3OvojYNMQm7m6XOr
	orjmhhCgjlFVDKcRGP13ozhV0mZUY+55Sq6n3NO4UHqjvI7XlHSELorPkwM/n+AkEDq9P/Zk/4LKO
	3nksUcCWAVVXjiW8xtKUhVXB7OhaB3+iPJl07N8/uXmWxOUkKVPH2GDc+z63Ubqm4I7ajmIOrHE0I
	gN94YosWmu5e4C0TgYaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhOb-00000005K43-1d8W;
	Sat, 24 May 2025 05:26:09 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIhKG-00000005JhM-1Lo9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 05:21:41 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6016d401501so840606a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 May 2025 22:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748064098; x=1748668898; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=xRjxeqMymvQZCJnrfSkM8g3MfOZ40ju3vAttVgtxMV+1EK+xDWcuiT6gc8AB1xIBHU
         MBx4QlEuWtQ58bQJucggSQD+TDWNtoPx3WYSuSRnewJxg3M3XAbvi4f02+ib2MXXvrJQ
         jdu82L/Lz9KfadEjhFPB0l//4gYTT72sts5+l6FVLCpsp1eexlKLEG6Ej9X2sF/55Qll
         QP4Enso8vafRsAXwlhcgwjcfy6VXxI/a5YP7h0H1mMS0OIa2xGFlj/tJnQL62zSNI+QP
         tFFN4tLzf3ICRZRkCqeuwzUg90A3MKo99u66zJWNn36FH9yat8CwhHR4kDT4FsShRy1Y
         URAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748064098; x=1748668898;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVLgX7oZgKgmp7JBYszc+Lbf8YbgAmX++SIMz1uljwM=;
        b=AXOTnd5c6L+qgge5YkNmK4xENAIax65EzsG3VZiEBH3licj/qceET59MqS/I9oNUhJ
         Z54QO/JkLUq75AUc8EpRSVvq3jufYkRXxk0tUG9qS59j7kT6aZcWmjJ6V2PkHsr8gn0w
         GqwVuemkYwae9jaFwGoP+SBB14OjRh3HGSzh0X9cQL5dR0/JbdtuD+YtmMi27L+CyFte
         bL/GJUWu2+srZE3/9ILlzdGlNMyqN+RnRGuMtJj2TBeY1c3P+E5uD/O+pBB77HjEcSy0
         I4B4f5R1XLix/gzpn+SVaRs6ahamr5DanhhWRPAYdXDMfs6MKVaAgNtblpk2qEnskiQS
         59nA==
X-Forwarded-Encrypted: i=1; AJvYcCVjhRKlFps11tYIfCcPe1CJ0cI4MLrR7J2wFKCZhQyu6R5zU6ngza/kwm5hRFTmUWcs0SZlUpYAKbT/0J+xS7dx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8xLks7qKteNIN8iVQoGqtjXVDQVWavcI3PLdSelx45JlODKqj
	xdvTk+ORjD1FFHhTUtp4EZ5Mk9g1suOcPprQY3G1TE2mHotM9rPWyeQjZCKc9BzShz0=
X-Gm-Gg: ASbGncusQ+be0Kfs46R7B+acbcbiDDzmcxwFO5feC/dfsVFJ5SwSjThWZS9rlzaNAj0
	rBRlGjzofDGmIQQBhbfkzqU4wzNn5/dUo/I+ZK9FDGsb+x6dYxcYYgxz4jJIMkNc9TMOEq6Y65F
	hmWzSoRtdCmBkj9+0odA/gStxsX1Hwv1zSX6jovemhVlY0ipVHjEZdbj3aq4N6Xtv0ARSBfVFMD
	YMlEgtOiv78f+u8WtczfiRKfTdr2YpZNm2dcvYf+gPYI67/fjHMQLpSi5O9eFPvbbudupkHcBum
	zaDSzAvN04igshQf2eiZpZU1sBfCd0nu5pzyNtb+NOiM08geHrOTS6I9HeiAgUYdqh+yZU54d/W
	lMfbginpeTHuoh0Dkwl4y4PxTsG/dCNbtvNM=
X-Google-Smtp-Source: AGHT+IFwfRfCw7b+i30fDVsYjamnwABVc4tlq1MkutzLjfaI4FhpNhFaGTjcBmSVXr0eujU+xxYGNA==
X-Received: by 2002:a17:907:9688:b0:ad5:7499:2644 with SMTP id a640c23a62f3a-ad85b2a4f94mr135383166b.54.1748064097988;
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad5572f6402sm1106778066b.178.2025.05.23.22.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 22:21:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/4] gs101 max77759 enablement (DT)
Date: Sat, 24 May 2025 06:21:27 +0100
Message-Id: <20250524-b4-max77759-mfd-dts-v2-0-b479542eb97d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFdXMWgC/32NQQ6CMBBFr0Jm7ZhSpBRX3sOwoHQKkwg1LSEY0
 rtbOYDL95L//gGRAlOEe3FAoI0j+yWDvBQwTP0yErLNDFLIWlRCobnh3O9N09Qtzs6iXSM6o7V
 RgzJWCcjLdyDH+1l9dpknjqsPn/NkK3/2f28rUWDrSBtBRpeyerx46YO/+jBCl1L6AjRlJpK3A
 AAA
X-Change-ID: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_222140_382074_841D9C0D 
X-CRM114-Status: UNSURE (   9.14  )
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

Hi,

This series enables the recently merged Maxim max77759 driver and
updates the DT for the Google Pixel 6 / Pro (oriole / raven) boards
accordingly.

This gives us some extra GPIOs, and enables NVMEM which is used to
communicate the requested boot mode to the bootloader when doing a cold
reset.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- rebase against next-20250516
- add dm-verity-device-corrupted to reboot-mode (nvmem & syscon)
- update commit messages slightly
- Link to v1: https://lore.kernel.org/r/20250306-b4-max77759-mfd-dts-v1-0-9fe8b0eb8123@linaro.org

---
André Draszik (4):
      arm64: defconfig: enable Maxim max77759 driver
      arm64: dts: exynos: gs101-pixel-common: add Maxim MAX77759 PMIC
      arm64: dts: exynos: gs101-pixel-common: add nvmem-reboot-mode
      arm64: dts: exynos: gs101: add dm-verity-device-corrupted syscon-reboot-mode

 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 76 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  1 +
 arch/arm64/configs/defconfig                       |  1 +
 3 files changed, 78 insertions(+)
---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250306-b4-max77759-mfd-dts-fb88b6c6bd60

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


