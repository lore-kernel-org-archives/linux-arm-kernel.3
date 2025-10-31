Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD30CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 12:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cbj3gKZ0mzSwdkwPXRoDa/eaYfVSxFDtUK1SIosiT1M=; b=A65S3TbN8Ayf2q
	UzKYJ44inHbT2DenJeboSXtE/O1QSAs2obtodQNcpPEe7Tn81ECEZJjCwQecst4mZ2qLC8d+RWcEz
	M3YrRJONRawXJtna1xYVn1TLvra5WN/lkp8f1WjlMe9ztUnDPGlDfgHDc7s0e9pv5HgRR4fAnzV6A
	dX16bO+MQggcQJsWfCZm806YKyuJ8+jK9OWnWVD0E+ZFXlM4kqPmLo0vd6i9iSdLPZwzvH2lx27N0
	OS8DkeQZwIqFjnD6CO/du2bp/oz1xWjkkmn1C5Rei/ZNpqDWw9YcLXvQgHE8zVLaT7QXFYhrYGGep
	wezYyUXjSrLt9fJ5qFSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVN-000000065qG-3cuf;
	Fri, 31 Oct 2025 12:45:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEoVK-000000065o5-3t6I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 12:45:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-474975af41dso16128545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Oct 2025 05:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761914717; x=1762519517; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cbj3gKZ0mzSwdkwPXRoDa/eaYfVSxFDtUK1SIosiT1M=;
        b=uLGY9KeIr3kkP+jzUeTtHD2WMC4/DeieCiEFRFQ7UbBvmmjVvQ5p4xOp+QWiPVmRNT
         9pbQMWEZXsWV/TYP9X6rdtI9EEh5G2PerqidSzmqLfU03uAgzeYwbFJpfBlUlcfj17zE
         yrYPr4S4RLtIo5R6mbwC6c9Y/01mMloV7DPKFWWTaaIqtP4IvuSyjJkYGyZBkA9/3/kr
         4ev31YUKleBQqsfWjv50oqbzlcT1LKrkYKfNpsyf//Ijj3aG/XQhwgNONFftFZ3iwf1W
         1J37SbFRj5BBSiEM09nh+cyP9moP16k0OZ5ikAkkjZXu2l/boFEwKPFPPOtprBiYmRGB
         bjtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761914717; x=1762519517;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cbj3gKZ0mzSwdkwPXRoDa/eaYfVSxFDtUK1SIosiT1M=;
        b=gpjFXmuIzNKCZXaizy303jZgkApBCqpG/didbEAmhcMI+POEqplulmfkWJt47jlYnf
         UvPWu4K9WDqtXQ9bPRlj28Wa4BqeA4ld20VuZTszdp2syUMEZN4Mi2q+Kj2UAC8xmZ2b
         wZ7Q6UCGlq2z9wvJ4sT5zOHetzNsdXow00aZ7Mlpp7Nhy3Jbn/B4aH1oSa2Z2Ju99h81
         IzgXkv0YArRfl8/7q+gYmPKV6WBbJtdX5qMkR0P/j1kOy8OlmwtRdeycDAq0M41zLUSC
         jkBm0ooVaGFRn9iqNWoUyj2OCn/jUJO98r5n+7lwWTkQr3wjCE2oVgOmlkDucCy8i/IJ
         AP/g==
X-Forwarded-Encrypted: i=1; AJvYcCVnwEld17752E1/DL+Ne0QQtZGqD1YNPT1FDp3fRPt4Y7vehDXZ3fcXk2J3Nr5yofjDAgbQ5VJ2NvJ2tPgk0NJh@lists.infradead.org
X-Gm-Message-State: AOJu0YzN6Ca7htXB+moiAqgOVpfnh62EjkI/goEu6quyyfdrjpxeVmnf
	6n2IduRpxGnLOhYTb3V10VnBE0IfloWC5t+ALxz6FPFVFOqPX4Kqgq3WdV2YLqosOR4=
X-Gm-Gg: ASbGncu9uSLnxwCW4EC6pzVHTO6evKTwRy0Iym5N9G9BPqW55OZ4gO+UzaokLYMQV/m
	+Cg98uBts+orK19JIdFUC4RLxMx2Ur8h5Jif5usj+RkTiqBd7i8YWbGAbY/BlttfsSBmNfhan/k
	3SsrZy7dG3FCXTm0nfD3hVJOISMgroX9dZ5HflC6PoWJSejOm5mPiv8sy+XMuRXrdZOKy92oOPR
	bTFlD6chwNSWvpkvsvIo0Q05hbXL+GWyfT/a3N1X2VZl3kXNNHzxkiwogZM2fuFQCzOle80uclE
	OnQb2Ik8bL1V9ljzLYKsg3SrZmlDAfXkHbQrqc3xMrvITG40WSjnCai68qIUGam3B/cMtXLvO2m
	cJUhtrv6Y8XUlArSdcwvwJ/nT4hCYVoOFWlWrLwjpEffQ6qs7Yw2HUoFjyrwhRdtz3M7u2eMNmc
	Hc0AAwu0QZ5ZaRKPM/I2FHYnD84Mu7kx4h3geWLiix3W0QdnfXC8Ml
X-Google-Smtp-Source: AGHT+IHqy0NvjSEdkC5QA4dlobMBtMSys4ERttR9A7YfgXRw5s+9LrWnpqc3fCglT5Vt6XnCw3B/fA==
X-Received: by 2002:a05:600c:4687:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-477307c1f24mr29666305e9.12.1761914716741;
        Fri, 31 Oct 2025 05:45:16 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732ff7fdbsm31077535e9.16.2025.10.31.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:45:16 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/5] nvmem: add Samsung Exynos OTP support
Date: Fri, 31 Oct 2025 12:45:08 +0000
Message-Id: <20251031-gs101-otp-v1-0-2a54f6c4e7b6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFSvBGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA2ND3fRiQwND3fySAl2jNGOLVIskkyRzS2MloPqCotS0zAqwWdGxtbU
 Av8ZwdFsAAAA=
X-Change-ID: 20251031-gs101-otp-2f38e8b4b793
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: semen.protsenko@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761914715; l=1825;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=eShtlJ8Q5lLAIYL5hn7v+uZe4nyW0U4dTV2Vv/o37Is=;
 b=Cav6xp6EkVef+kR5+xm0NcqzjGfCB8JtxlbVHdTW7e4KMSsgOBlOfS4QS/NSWUZKRyXAq0Ff3
 4hPYHB6jVi2BPtPgXa6/b8DGjvet/fG+YJ7cfBVavtwrAhttcx6A8OS
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_054519_030038_9C262BEA 
X-CRM114-Status: GOOD (  13.66  )
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

The patch set has the typical dependency of the DT patch depending on
the bindings patch. I propose thus to have the bindings patch taken
via the Samsung SoC tree, if not all.

Add support for the Samsung Exynos OTP controller. On the Google GS101
SoC, this controller provides 32 Kbit of OTP memory space that can be
read/program/lock using a specific sequence of register accesses.

The OTP controller register space is of interest as well because it
contains dedicated registers for the Product ID and the Chip ID (apart
from other things like TMU or ASV info). Register the OTP controller
register space as a nvmem device so that other drivers can access its
contents using nvmem cells.

Support for the OTP memory space can follow and be modeled as a
dedicated nvmem device.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (5):
      dt-bindings: nvmem: add google,gs101-otp
      nvmem: add Samsung Exynos OTP support
      arm64: dts: exynos: gs101: add OTP node
      arm64: defconfig: enable Samsung Exynos OTP controller
      MAINTAINERS: add entry for the Samsung Exynos OTP controller driver

 .../bindings/nvmem/google,gs101-otp.yaml           | 68 +++++++++++++++
 MAINTAINERS                                        |  8 ++
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       | 17 ++++
 arch/arm64/configs/defconfig                       |  1 +
 drivers/nvmem/Kconfig                              | 10 +++
 drivers/nvmem/Makefile                             |  2 +
 drivers/nvmem/exynos-otp.c                         | 98 ++++++++++++++++++++++
 7 files changed, 204 insertions(+)
---
base-commit: 73f7017e663620a616171cc80d62504a624dc4de
change-id: 20251031-gs101-otp-2f38e8b4b793

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


