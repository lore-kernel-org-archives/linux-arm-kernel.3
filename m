Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DA1CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 12:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZYqRjVaj12Rwfz+YvwhOeiNPIo0M3pzZ+YRjVz31v4=; b=cHQ1pwj0NZ0ebbei6kp0sHlipX
	j0qUiUuwgzEmUgs2NMteJiJmBlrUxdIVUdQ+r/0HZqG0AbcKFBlZIAO+WwOqtDKYcRvghE7x409RY
	x5cB8m0QoTuU6fSxi+MMj/Irp4uN+sAUETmVjMs8+6dKj1nfCY3hIPHRrPJ1ngYpAWfnG8F3qResA
	6Cx8zoavOmUiiWpR2UzCUKlv32yOZsCsA9dsFiweQvTmHotoz4RBxlHfFDLJuuiT2AJsuSiY3n+/q
	MW9pPRi+/vdRmYehIJ4Kmi0FfY91lMA343H/EkHnpZBpbxU1Np2DPPB46UFDislga3WZJxAiA8lQY
	eQ28NjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmc-00000005O7g-1cSq;
	Mon, 10 Nov 2025 12:14:06 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIQmY-00000005O5G-080e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 12:14:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b305881a1so177133f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762776840; x=1763381640; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZYqRjVaj12Rwfz+YvwhOeiNPIo0M3pzZ+YRjVz31v4=;
        b=N8FBY3eLN807uR7siE6ZKKZ/4J1OtQSZC0zmfLsWYNnWLpWhs2+MbVbWHianc3b+I2
         W966lvrhwkg7hLOo9wDp3TkRzPJZUR/TZxCeIwwoafPJOhDXliQ7IzBdtf2rdbubEJhC
         9D2zEtamMI2qP8c3HNx6VOE/px2c/hwF4AaxvG7stCzqsq1JkYzMnkuSGtbYdEjfwh5n
         PKeZYOtE9aaGc6Dlj1Cr8HId+vgMjCD+ckvJ4EFGJ0KhljAeWgj0gxS9dNn3TFPB12S0
         dMoWECyf4jopzr7qCDucTLOoQJOaLaOCFmaT+iNZi6ESFX6lTRM++ovUhBLd5BNa2OMO
         wUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776840; x=1763381640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gZYqRjVaj12Rwfz+YvwhOeiNPIo0M3pzZ+YRjVz31v4=;
        b=XXsotnYFD5H2mNyxjMudrGlxbik3DledaSg1fNbQbbjD4t9lfvXxHtqnYccVoM5ZNE
         5zzL46CiHvf+K98wcT5OAxKc+6tQF3az+x4JD1rSMWvcFOX409+vn48BIs92DtVX80RE
         WBKIdbEizZd5P8EA2mSvB3I95oHEj65qqyOU8al26zp0l2SME6AudQGwY672iaNquMxL
         c3wDuQsRX/0L2vNH80fKSnSW9e/MaQMjd4YTQhK7fC3xMgvyCYIKXAqK/K5largYYYVm
         YjfpdJcUHAO/PhMH2GW7/yBLyqzZHQ/Wv4/0MaUpQAzp/wtAKN3ASQlwtwB5v3yEnbdU
         Mt9Q==
X-Forwarded-Encrypted: i=1; AJvYcCURO/MlIpjR/q5/5ahVKOx8hAC26Wz6z1Hdsj5fHYzFivZ/jGqBntL9C1RxZgZbKpEygD1kdKE7WiUdpFNkRFf/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2vsAyd8nn7T+2V+hlNSSngktJCmHmRGHvbFdQBCS1+AjWwtyU
	sKbJozxHvi+VZsX0wt7lYKc1WEWDRPwRElBwsJsNdgGajwVJWp6NtpN17U2n+Hq+I+s=
X-Gm-Gg: ASbGncvM/pdNxOFCtGdhN2vBEd4HwTmTAu0VYq2rAj/nbh3umNq06cREq0Jx3mr1anW
	UKtA+ilXJKDgD7qg9h6R52taE6+cKJbhSG2iISaji04TIdO8mvA2lp8yCa+bKj+Wht3vV5S+fVH
	qJ+1Gf0QVw6TTTHtiLqq6/xJvMoe9aaFBe/hCgHcknhpwE5GTqUvmieseMRV96y19rP9GKwJLyc
	axGf4kK1NF9PB3p0V7xNQho0H/QnvukY8qGNq78I58j4YvTp2vQigEhO4KxeMaaqwxnnob/t0/l
	dWqORkK4nIVql7Ck6zDq94neh86Qizaw32Y4IiuuEiJ3qbzhGUCIwJjxsEAD4w4FBU55iFPGuqJ
	qUbtf2jzRM7zfYp3ryvkMyKKUN9bg7JuBxrDR8HrBq4TSXkayq09ngtR69WKuVRXP9P1hsURkvm
	Skcqa+LqIHi34GNGX0Qb1+Qg==
X-Google-Smtp-Source: AGHT+IHEd8nZjNA0zksARbjw0PrTkWPT8L56szVOaWlhb9dBQElJR9u7Z9rtolUN4RnI8j0Kd7HVsQ==
X-Received: by 2002:a5d:6408:0:b0:42b:3ad7:fdbb with SMTP id ffacd0b85a97d-42b3ad800efmr1071471f8f.3.1762776840218;
        Mon, 10 Nov 2025 04:14:00 -0800 (PST)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac6794f6esm24922667f8f.41.2025.11.10.04.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:13:59 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] arm64: dts: samsung: DT for v6.19
Date: Mon, 10 Nov 2025 13:13:42 +0100
Message-ID: <20251110121344.120785-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3279; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=qREVua0utpq+YZvmhL+Ya7K6Nf0fn3TdphYcl7/IDE4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEdb7uVM/PXGAmzuyeG8EiCnmVpLqyqKSsroUj
 d4lkN24alyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRHW+wAKCRDBN2bmhouD
 1xEwD/4wN4mbAz3TmG8Uj2sBGcutI7Unb9l7WLt0y4YvC1DQ46/hGZBDpUg9FYM5ikoyYyk40Lx
 bWpMPS6r2UoFbvdbB8unHQ4mFOrNmaIXe6ae7qXotQg4zx2Cshidw6xwiWfmxb7+qnx4dpK90ib
 51vCNOH5TcTk4FEHfhDa4dzWTEYWjWGudP7ph4OmCUq7syBkI0M7LCv22zeobctueoBS9orqH73
 N8hAXpuzcCaxkaTTNk7tyehHN9cK7CNUmOexoYlbnBnWSRAElltaR57uw6dJF/JzyDc99cvu+3O
 C8qwOgswZklHgy24jZ7c6Z76k0Px+LrxcHuYruhkl668A5JrlkXHqWAOx9U+PsPImWraLTC8Fm+
 pkaLsRZUH3cEjzCMfJLCOudP64x7wkz5F5ZTW6WmvlDJJqdK6Xj46UH6BFDZ6EkMXJ7Tsk0uzja
 1vNGW3T8SWzkptfY3oTNnS8rOsHbdjKT3cLqaJmULk5WkCecU9RBJquVnwCyfyN0Y/KEYcUSTK5
 J1BUDCtobDWXoKLqQHIiFekal9FQ6HiioyzYRf97UrLVUCZI0m+3AIP+sSFzEVULNrojKu3JWVk
 cizhMB+tB9UiTP3cNr+j09PlXRFOfxayyEmlxr1UyeTTACxlSn2X/4mqgYcXjrgNrgtK+b/mycD 3yWl7WfKySy1INQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_041402_093014_5C853919 
X-CRM114-Status: GOOD (  11.14  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.19

for you to fetch changes up to cad767a9af055c921e29b7b268f99e83c82baab3:

  arm64: dts: exynos7870-j6lte: enable display panel support (2025-11-05 08:23:56 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.19

1. ExynosAutov920:
 - Add more clock controller nodes.

2. Google GS101:
 - PMIC clock
 - Mark ACPM (Alive Clock and Power Manager) firmware node as clock
   provider and use its clocks.  Add also Devicetree binding headers
   with clock its clock indices used in DTS (kept as separate branch).
 - Add more SYSREG (syscon) regions.
 - Correct several blocks address space sizes and APM SYSREG's starting
   address.

3. Exynos7870:
 - Enable display over DSI and several display planels.
 - Few cleanups.

----------------------------------------------------------------
André Draszik (1):
      arm64: dts: exynos: gs101-pixel-common: add node for s2mpg10 / clock

Denzeel Oliva (1):
      arm64: dts: exynos990: Add sysreg nodes for PERIC0 and PERIC1

Kaustabh Chakraborty (7):
      arm64: dts: exynos7870-a2corelte: add bus-width to mmc0 node
      arm64: dts: exynos7870-j6lte: add bus-width to mmc0 node
      arm64: dts: exynos7870-on7xelte: add bus-width to mmc0 node
      arm64: dts: exynos7870: add DSI support
      arm64: dts: exynos7870-on7xelte: enable display panel support
      arm64: dts: exynos7870-a2corelte: enable display panel support
      arm64: dts: exynos7870-j6lte: enable display panel support

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.19/clk-dt-bindings' into next/dt64

Peter Griffin (3):
      arm64: dts: exynos: gs101: add sysreg_misc and sysreg_hsi0 nodes
      arm64: dts: exynos: gs101: fix clock module unit reg sizes
      arm64: dts: exynos: gs101: fix sysreg_apm reg property

Raghav Sharma (2):
      arm64: dts: exynosautov920: add CMU_M2M clock DT nodes
      arm64: dts: exynosautov920: add CMU_MFC clock DT nodes

Tudor Ambarus (4):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  58 +++-
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  39 ++-
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  58 +++-
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  84 ++++++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  12 +
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  26 ++
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |   7 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 315 ++++++++++++++++++++-
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 ++
 10 files changed, 585 insertions(+), 51 deletions(-)
 create mode 100644 include/dt-bindings/clock/google,gs101-acpm.h

