Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A95BCD13CF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6MHSwghP2d14X8DV+0bLl36z/FEFxYOy9Zl9P0JXo8=; b=ON5qYV+/rISE9Hxirgj5dZHXYi
	6LaI9BbBBL3Sogx8D/zp6ozajRbRw8Gcq92Zqk8nLwP9ZChJ99ClgzjvMqPK9bYTMbV3JokH5LK+O
	GTufHumlm21xmOjpQrM9RMEvD49LqBqhcLkmKVcOgq/C3Uv1yI8LNpxbJjka7Y5qRtEnwhM8PdyOy
	jU0s/fvwyabjtE7GAE63vmBbAc3ZuPN86ItWW1L4XnULB/D/zdqZEbELb0i39qow1mQOQT3NJvChu
	h+XGhx283GrtX045fXWztGKLfYbmVZbA7WwmKr331Qnx5CEn6CAs9jE8JVosbJDnbTeX1EdVO/hds
	/1vzagkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmZ-00000005O6C-0ExF;
	Mon, 10 Nov 2025 12:14:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmW-00000005O4f-20r3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:14:01 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429ebf2eb83so337406f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776839; x=1763381639; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6MHSwghP2d14X8DV+0bLl36z/FEFxYOy9Zl9P0JXo8=;
        b=b7JfQnLMBcxxuBkO07Wf+HKFSZ0T2QmUKdUlbrNCBEByCK1U5eytwRqXWoywKIyeAd
         6f1g+2i1x5gkFov2nEBftppj9Gl2IV86jjCBzXdSjiHhG8XxYNY01blvTLw5DXQbM6hS
         k9Ncx7/sppDYAYr6Va48+qDd5q81xIAX8OBthxWxPtJoW4x/8VSZazs+gbRYQKoWQXCs
         8vq1OP9tQEw/r+5WoVdgGe8cZoI+T6503vGCdlvkyHUVx88dYbLEe08N+Lc05EnugHGv
         Eev2QSONUircNx/NYzBNCJusADNDQCm2CS28Jd97N6SAJ+CqUvE75MHXXxGEbjsss6Nh
         XU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776839; x=1763381639;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C6MHSwghP2d14X8DV+0bLl36z/FEFxYOy9Zl9P0JXo8=;
        b=Y+GGNSAHJ8z8MAJpINFRHBUOG8fMWaAsO7uQtkIh2gM5NajrDiSyKAeQGTkShZNpp7
         hjNKz502ClK057Hxh1UTtVZW/zP/EJnYhIS48L+vTUQPHl5vFYGYR7vo6m60z9xNSNHd
         4K4skv+0Y9khWBL0k8/Io5nTU9BdBerF7SpCnrVz3sYXu1h5NJy83Jve8btCdnej3Y5/
         HCF1/wd//a5qHt6zrUCGB5YRN/1EwEruf2ntssLpbneXzybkji7I2XJYimCxnSbDTUmr
         JlhCQ7hpMfzlzw7uaNnFnIzfgtLAF4qf54tqHjNl7BLFIpUV0eO/hUrUHbp+lvOEzFJk
         eQdA==
X-Forwarded-Encrypted: i=1; AJvYcCWL4w55s33qn26gQ41GcZ25cZPnpOGuhRdj9ExymrOUZtqhn5AwZNFqZjEUGQV2jXUmQTD5gveR4HnYu2LicomP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfq5gUe8XCWOmJRrx1hhUcLTY4JE869XEe5yyH7mX+zqRN0fWs
	OV+70nNYfkPYK638gF4Hi3LAcVrRRWCGRqPNuFcfJ1fQSkbk8GdjCx1jZHKBoyRawbWGxHmSqe9
	O6/KB
X-Gm-Gg: ASbGnctVdnUk4WZhwRw7WOpQbeclunhwF5vTLT6sI6pATAwsh0Csksc8s6KuJUGRre5
	AH06cz3kdFrEBXap6GCmFYGsQdq7KbmOPADZrJRp1iETte0t5FxQK7WOlZZIqDMJtruv5oaEOEC
	tXVz/GkZ3qHIYIuRxzhBFoLuLbfVD5Ou7RDNv4oolr72Abvdy2zBn6aDqdjFAFPfeeL8pqW9PfO
	DI7/SjP5R893m2fMigWiAU1XWWSl/aw5cCaRnNcV/8vm83fc4jar7CecJ6soco8cc95Dztw0Jnb
	kibEXKxwlKXmPSrGfy+QeKAHXa0PPcQXD+BfdT204tZoqBFOEIkUs8N0FhlmoA0THv6noEd2wEo
	d1sHZrHc0h0W3+lAvZwWAmLqHkow4shJrEw25Fwtn/ZDX8JmxnH4Ej9M15Z9SSehVbW0vAq5Zf0
	L5Qrsmqb/D1IY=
X-Google-Smtp-Source: AGHT+IFtCJoEa3fPjznfspradex1PtTFo+De784I9+Mj7ZLYALTxzZRy9e27nwxt5XfS02ZIFIavUQ==
X-Received: by 2002:a05:6000:26c8:b0:429:c711:22b5 with SMTP id ffacd0b85a97d-42b2dc13946mr3574288f8f.1.1762776838835;
        Mon, 10 Nov 2025 04:13:58 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:57 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/4] samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 13:13:41 +0100
Message-ID: <20251110121344.120785-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=7eCwQzIdJ0n4Jk8cIEMb6dznrr42scKRI9w59K+VWtk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb6Lys/nhK6FyF7WpIVe24IhpaXO7tRMwX2q
 ee8mfep2SqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+gAKCRDBN2bmhouD
 13kvD/0ZXTLuTwJf0e2y11S5cpAeAyPebJadjrmUuAPIXoOOz5cBL6EcopBvNIIW6WqyzuabIOG
 iF28TE+A3Ks1JNt3Ow1Oq9H1nLb3/xdqkVBBjh28w0gtxEgoD/qJyE9zhEclB7uom4Lo7YcDutu
 vM3VjnnBJcdQyIVVZVwyUBPjrYgdc8fhiIgAlwjfXvG/TYDmnvTv1V68gN/seAfwOEQvzJgVouK
 Oj0oFbUz9gloMokC8iEI09F2mItSf0456QaxpE19cybMEg0kFnLYOB838bAKW9RwrCiuAw7peZF
 gGpkMyejtk52dYmkQVhYaZ1QrYfRwoqINBK9DUjR+f6q2G80mEnTXjOqqX5p3sOkv47ngp+JnGj
 J/u3KQ1px1sgyI3VoRFIhLRU2mHYXYIuQkHa9bVB7epZMabMoOt2V8u8gmI0jax9xvCD2BPfR+H
 ljdfF5YBzysI0zoVREXr3KIb8oyF39TVyxBHZh7isjgWDuU3ab4ahHO8RuOTp7uklh5j8cZ3qNs
 m3BJ8H1jU5pY76dszctetAiza/z6fgw7waI+siH/Kc+lvAawwQKYyCKhc/wk+9qIShklQBsPe0s
 P6DprrLIC13CTefnYCptD+EnAh5VTIgB4J0ib8UjCgpepPRUD7Yd+3mvYgmfk3ENWbFCHXPghtb J7qrPJTJjcUQSDA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_041400_551242_3CA5B020 
X-CRM114-Status: GOOD (  14.29  )
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

Topic branch for Samsung firmware and clock drivers.

Best regards,
Krzysztof


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-firmware-clk-6.19

for you to fetch changes up to 6837c006d4e72d6add451411bcf407e0dea4ad25:

  firmware: exynos-acpm: add empty method to allow compile test (2025-10-22 07:49:38 +0200)

----------------------------------------------------------------
Samsung SoC firmware/clock drivers for v6.19

Extend Samsung ACPM (Alive Clock and Power Manager) firmware drivers:
1. Add support for passing DVFS (Dynamic Voltage and Frequency) messages
   to configure the clocks in ACPM device.

2. Add Exynos ACPM clock driver, which exposes to Linux several clocks
   handled by the ACPM (firmware).

----------------------------------------------------------------
Tudor Ambarus (6):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      MAINTAINERS: add ACPM clock bindings and driver
      firmware: exynos-acpm: add empty method to allow compile test

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 MAINTAINERS                                        |   3 +-
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  80 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  19 +++
 11 files changed, 384 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/samsung/clk-acpm.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.c
 create mode 100644 drivers/firmware/samsung/exynos-acpm-dvfs.h
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h

