Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483A7E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PJ1G9FJURC0vj+02+bBkZMtqPIlFDTc13cpNiilTLfU=; b=bOYo8vYXW4jl7D
	4xFSd4Ln/cemFTLJmOcr1Oz053dU9BuSlbZPdO/7/PD3F8ApvHSeE1jIn5hXMzWZ5NA2nLeWOJzX9
	u71WCZhwSJYhjONzSCPT27Il/aUUt7OmdUgfsiJ9xQTqLTadOLAKnsah/xLNb4pnQzH3obXIfOJ95
	DxijIZsnxiK3EZqEYBe4egfB+frRnHIlykWny8YEUPElnrFelqfPdtFY89Sd9u0AVq24BBkMlL6gB
	fBFWK93/Pn872b1U2ljVkqKuLwlzf+IfhRRXvQT/YPq6iVAJ/LroKkaI5QtBjHdZzRJGI6FacT0OL
	UD1vTpwCmEjBH0/aWLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe66-000000059p8-0J6R;
	Fri, 20 Dec 2024 14:35:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOe3n-000000059RR-1xAM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:33:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385de59c1a0so1291640f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734705177; x=1735309977; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ1G9FJURC0vj+02+bBkZMtqPIlFDTc13cpNiilTLfU=;
        b=C1SNDdVBxiVuA/aH0KfXTCej2MUsZWOzWJpGy12ThFZrjdOjySHqIW66wTiqOQ69Oh
         ciH0lnwmo2VVxZsmiPsVGOVzPX9wMjkVtUYTRmkHNwGYiHMpj78RPY9f01VS9/jojVDt
         Y5+V74wciZmS3cV2rbHMvmbfUXYsyEILnE3DLIy85bBY4LyQpdFhbueMxHZ12JIy3mN6
         N4w7HWbXpOXCCNVK/HdAMcEc5/tDTblMCzKxRDXtPG/ijGcZZy0R7QfqvzqbG12Pm9T3
         G3QG8Zd5KTe3z3oK/Xf/Z5ILSH63CTjQ7DdzU2oW5EkmyyfUaBAkPloxy7Z3yPzGM/0P
         vqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734705177; x=1735309977;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJ1G9FJURC0vj+02+bBkZMtqPIlFDTc13cpNiilTLfU=;
        b=M+9oa74bftYCVigQltmlc+iyGVW1Cd445b3u5RNtKoXwINuzUr9KpXjSAQFBM6EyUo
         tVfALVFbWU1shkfe/TcDbia/RJGMbHcYxHideiot02L1pSGQjPma97xLCkyyPLpT4MOH
         ltGNP3t3XJ9gokCWlZtOpngBcxEV2LTKQWesoAfLZSgsX0FXUTP7w2cyZeY+0AbDrts5
         80W0s/6mrqQ5CaMaKVYEMxApA7XNsJeCnRYTa9S7EXL65ablfC6OCf/KxsVZkEvQABbP
         IAlAegBZPNAISySIYPu+r8S5/SfpYyB0sd/yZ0XdKEbJ9WrmbC4NtSpCWtQwjtrvHDdK
         aK0Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3wozLCB69BQpfqEVIrjR7i8/iPbhxVNGEVtRU/VQUJgh+/W7cNCUkjCfOtz2TKw8K6Yd/tkUXcNeTTRK1WM8v@lists.infradead.org
X-Gm-Message-State: AOJu0YyZTK0vctcszdUnFsGjEGUEDOaM3D7K5+X76Xv4yInzC6LYZ+vT
	wVQZgisOERjslFrYuFRxBSaMqULBKBOsK5rie2fDQReehsRhJy/RS5n2YrkSjCE=
X-Gm-Gg: ASbGncsgshcVY1jXalqp4Q5glcerXlJwNqKSRa/PeaBV+o+Ah3rkhDvivNJe10EVPt5
	DJUndEldRESXIPOiVWbXtdk4n1ZjVZCch0WVrDYyFJXOEw0TCzZcz7iCOlvMo7vwtMQj4MiE3gz
	0saaOhyUzabOGQ/choN4RdXj5b93MSXn5Bo20dBRSCM+DsBy5wnFsb7dvXNfG6hFdgOK1EmL4wU
	gpm23pDdglK37WZ1YZFFRtx6tWqIbpZmCOAxdhNBjWd26jsyNGZwyz0RH6LUHbkuHfMOiiwgKPJ
	NYD95vOHAn1Ae+rbfeN6WKqIjLjhseCCsui0
X-Google-Smtp-Source: AGHT+IGT+SD3LglrI8lzDg2St6Rzhi0uZfTSjC4sOCIiRM/aFfnWVpMxZlH0WgmfXqA82J8sp1Q7tA==
X-Received: by 2002:a5d:5f4f:0:b0:386:3329:6a04 with SMTP id ffacd0b85a97d-38a223f5b4cmr3017171f8f.39.1734705177371;
        Fri, 20 Dec 2024 06:32:57 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c829235sm4140321f8f.15.2024.12.20.06.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 06:32:56 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/3] firmware: add Exynos ACPM protocol driver
Date: Fri, 20 Dec 2024 14:32:50 +0000
Message-Id: <20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABOAZWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHUUlJIzE
 vPSU3UzU4B8JSMDIxNDIyMD3fRiQwND3cTkglxdAxNzSyOjxCQTM1MTJaCGgqLUtMwKsGHRsbW
 1AHcQTY9cAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734705176; l=3939;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kZ+FzEPGUMS4phZ2Jtk/FUZScTynx9S1UuCttKbGgSI=;
 b=yMaAPSs4Bon5tzS2JaDecaGvCVCJEdNL/EhW5qKtZqVzxAdmmCG82r0aPlO9FvRTDy+ZY5hjV
 kCUpU1JlK8qBuafy3FFdKW4+Gbcqss4DKi6Z4txnfv/QdMxYr47jg/E
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_063259_519976_FBC652C8 
X-CRM114-Status: GOOD (  14.94  )
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

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

This protocol driver provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

Changes in v5:
- depends on:
  - Link: https://lore.kernel.org/all/20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org/
  - it uses the newly introduced mbox_request_channel_by_args() API
- dt-bindings:
  - drop redundant binding word from the commit subject
  - remove extra blank line and update example with by complying to
    #mbox-cells = <0>;
  - drop Krzysztof's R-b tag as the example was updated.
- driver:
  - channel identifiers are discovered at runtime, use
    mbox_request_channel_by_args() instead of specifying them in DT.
  - don't call mbox_free_channel() for PTR_ERR or NULL channels.
  - introduce common method to init xfer
  - rename guard name from __EXYNOS_ACPM_MFD_H__ to __EXYNOS_ACPM_PMIC_H__
  - stop exporting devm_acpm_get_by_phandle(). We'll export the symbol
    once a client is introduced.
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-firmware-v4-0-3f18ca64f1b9@linaro.org

Changes in v4:
- rename bindings filename based on compatible
- bindings: drop nodename
- bindings: drop mboxes description
- bindings: remove initdata-base prop, and define it based on compatible
- bindings: move additionalProperties after the required block
- bindings: drop firmware node from examples
- bindings: drop unused label in examples
- bindings: rename node to power-management
- driver: switch 2 macros to inline functions for readability
- driver: add checl to avoid shift overflow on these inline functions
- driver: use ktime_to_ms(ktime_get()) to record ktime
- driver: use the default non-relaxed IO accessors
- driver: remove atomic handling
- driver: remove stray of_match_ptr()
- driver: move header in include/linux/firmware
- driver: make sure to, from are 32-bit aligned and count is a 32bit
  quantity before calling __{ioread, write}32_copy
- driver: reject IRQ channels (not supported yet_ at the top of do_xfer,
  instead of when waiting for response.

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's eview comments
- add ACPM PMIC protocol helpers

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (3):
      dt-bindings: firmware: add google,gs101-acpm-ipc
      firmware: add Exynos ACPM protocol driver
      MAINTAINERS: add entry for the Samsung Exynos ACPM mailbox protocol

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  50 ++
 MAINTAINERS                                        |  10 +
 drivers/firmware/Kconfig                           |   1 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/samsung/Kconfig                   |  14 +
 drivers/firmware/samsung/Makefile                  |   4 +
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 224 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  24 +
 drivers/firmware/samsung/exynos-acpm.c             | 805 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  15 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  55 ++
 11 files changed, 1203 insertions(+)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241220-gs101-acpm-047922ab4654

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


