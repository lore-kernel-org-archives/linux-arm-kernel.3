Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297F5C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 14:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ws4SAtnqVk3JJRFt8cX2ALHU3VzFIfyLR+RfsV5IUkA=; b=Kod/z5RPIBaCy1
	smcQPD9stKJqjdDfUN9SDGkC6O8FbdRwtDrHhd6kSP4mvFbuXaIeEBZr1lcjgEIRXJfukJQpt6BQ7
	eo0LRVfzdk51PKPs4HPCtGRBrJCkPY8PVTYWtG/ZjDC0FC6/Ym1xeez3ooX7aICikRBAC6qyM77T1
	KA0uG+05o/6hUch1IzXDlWfnQp8tHZKBMX6pujmi7oXrKtQmFJ6VmdiCasqvCjYF8KxsT9mcslfN0
	WsvRp0KCjBB/HLS8fGlWH5zzfP88QDNUD9sH7nsZTYDmMLvEcO3jrO0ihR3T93BYGRMiP7yQVN4yb
	KJN980qBdAPEODP7ZQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQS3-0000000F55d-0ayp;
	Thu, 16 Jan 2025 14:02:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYQQd-0000000F4kz-3Jvd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 14:01:01 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-385dece873cso593257f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 06:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737036058; x=1737640858; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ws4SAtnqVk3JJRFt8cX2ALHU3VzFIfyLR+RfsV5IUkA=;
        b=FzYGoxtVoLycWwGRL9YBUK9OfedokWI985pBKN7K15IrDXk6sM5biCTsUgLl5Ri2hV
         68OQCuXwVhKF2NUthu3mjzWry0gLfQTSiBg8FjuSNkbk0ZY6ZgpDClku0Ola+9NB1uX5
         pKTBcqwFWTBPsHMGzQtCVpnfDy2NczAuMAvOJxJKlXZnY0vPPjKemZbXpkD5froiwbZf
         XesDtIDaA9rcJAQP12SfCorfTu675Fyf0vLRxCk3dYiHnNoOQ8OKbbTihp9PUmaJoeRG
         OBEajnqwbSGn36RVau35g5O08evJO9VSL5DEk3p9h8mEhLfX6HouPEuQY3OONjYDalJl
         +ZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737036058; x=1737640858;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ws4SAtnqVk3JJRFt8cX2ALHU3VzFIfyLR+RfsV5IUkA=;
        b=WL8zdPwCBATSD5rebJfOoAOXyX9M76KMC7/MiXE45s9ho5zC1R9ZbmyqpbH4V2zjkr
         OwtI/+USPxYlzCyo+cjFN0vdjE85ZdsEItq8S9ti/aLbgl8SJXVYs69BxryJpOo0GmX4
         Q5nprGh+/mTNGr08QwCqZVsozB1JK/Um6LJwhUvSOW8b5yycPEWOUUNF9YBAPYOB9AXy
         xCfd9eIDIEjdzIq+NIQLmDnb7dp7XbRdH0JFpQAUr69CjtYjS7lvMoCAbsn+3zdWR5UX
         b99tytkCxkkORHGUIlM2cmfPt9VwU2a0Cf0zloJa2PtEj4oWXa8h7Safcw4vhDnYBRie
         Fdng==
X-Forwarded-Encrypted: i=1; AJvYcCU+ROtQ4a8KB109oU5OEJwXiosUWvOVLW2IICReWfPlaXBM7epyRlNfQqND4BbBGl5CmwVsHJ6DNa1SvUu5lydA@lists.infradead.org
X-Gm-Message-State: AOJu0YxSH7yUISEYBm7RfPr1IHpkzHdfor+MxK4S27y73Wfb4lJVZRCA
	s0ykAM3AxamNqg7WggDW7tw+TUV7g/DwJRnK3fG9Bg8Y84TVQQLR0QMbNiJvh7E=
X-Gm-Gg: ASbGncsTGknWP8iP9Z7VRvMVjc/nW7k5Cbmn4gLD5CmGaabIVrUhl7jNsJVFZjQ779Q
	UDtWoSDJQbrLR7lHXFrHsZugM+Ytc1wdGJ5FmwbJ96QqIUcfzlYyK8LmPAwg5HQlTz7eyQXoIfX
	MsUKmrXBqq3m/7EHCDx3lFn0UTRdZUSsvlG2Q0LBXedyunIaYfW8ZLcEV/k41yKra8nEuXcL4Vg
	s6GcxIpoee//WGC/BP0avVD/G8s7a3qgtmAbkSNnJvzPrHwu1WUrvgWVA5Fc5yanSfB/rmQqLnx
	PFYQHtuQspOm+w6FltTBzh7q6k3g7vQftoio
X-Google-Smtp-Source: AGHT+IGvPpadg+sm2kz/lWWsYo0WJDEriL7Nq/FH6l40zZe0/JitnmHWqWE3rExPsJ2BeJZejP/++A==
X-Received: by 2002:a5d:47c4:0:b0:385:ed16:c8b with SMTP id ffacd0b85a97d-38a87309d21mr13252241f8f.23.1737036057866;
        Thu, 16 Jan 2025 06:00:57 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1f2esm20608846f8f.98.2025.01.16.06.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:00:57 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/3] firmware: add Exynos ACPM protocol driver
Date: Thu, 16 Jan 2025 14:00:46 +0000
Message-Id: <20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA4RiWcC/23MQQ7CIBCF4as0sxYDI9DoynuYLqACnUShAUM0D
 XcXu3b5v+R9GxSXyRW4DBtkV6lQij30YYB5MTE4RvfegBylQOQsFMEFM/P6ZFyOZ0RjpVYS+mH
 NztN7x25T74XKK+XPblf1W/8yVTHOpEdtR29PXvnrg6LJ6ZhygKm19gXM/SBZpQAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737036056; l=5682;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=LteApP4zcbsVRTQ1/uJvfFgoPA64q2wMDamS3o6c6HQ=;
 b=mvqtpSWI4vh5OK6pHgJO25ZAAu0w2S2HUM/W7V627Vh/ETlHIteDoj7ATOvHSqSRmwPFJw28K
 PWxuhzyDwRNBjFz+j6Nq4CybhFiDvppnqWSipBJPXz3cMVzWbvV/HqL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_060059_847086_46E8F6B5 
X-CRM114-Status: GOOD (  21.75  )
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

Now that the channel identifiers are passed through 'void *mssg' in
mbox_send_message(), this driver needs to know the message format the
mailbox controller expects. In order to not introduce a build dependency
on the mailbox controller message format, I chose to use here a
temporary 'unsigned int msg[2]' instead of 'struct exynos_mbox_msg'.
Will switch to the message format struct after both drivers get in
Linus's tree.

Description and change log below. Thanks!
ta

Alive Clock and Power Manager (ACPM) Message Protocol is defined for
the purpose of communication between the ACPM firmware and masters
(AP, AOC, ...). ACPM firmware operates on the Active Power Management
(APM) module that handles overall power activities.

This protocol driver provides the interface for all the client drivers
making use of the features offered by the APM. Add ACPM protocol support.

Changes in v6:
- Kconfig: s/depends on EXYNOS_MBOX/depends on MAILBOX, build time
  dependency.
- exynos-acpm-pmic: constify tx buf, make acpm_chan_id unsigned int,
  u32 cmd[4] instead of u32 *cmd on function params.
- exynos-acpm:
  - drop acpm_memcpy_{from,to}io32 wrappers of __io{read, write}32_copy.
    Right now unailgned accesses can not happen because the only
    protocol implemented (PMIC), uses on stack u32 buffers.
  - constify xfer to make it clear that the caller keeps ownership and
    must ensure it is valid memory through the entire xfer time.
  - rework acpm_get_by_phandle() and use try_module_get and device links.
    With the device links, when acpm is unbind, its consumers are unbind
    first. Thus the acpm drvdata will be destroyed after there are no
    consumers alive, there's no need for kref. try_module_get() is used
    because we'd like to be able to delete the acpm module only when
    there are no consumers left.
  - make 'struct acpm_xfer' private (move it in
    drivers/firmware/samsung/exynos-acpm.h). Get rid of 'struct acpm_msg'
    and use 'const u32 *txcmd'
- bindings: add Krzysztof's R-b tag
- Link to v5: https://lore.kernel.org/r/20241220-gs101-acpm-v5-0-4f26b7fb3f5f@linaro.org

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
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 229 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 767 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 11 files changed, 1177 insertions(+)
---
base-commit: 5bc55a333a2f7316b58edc7573e8e893f7acb532
change-id: 20241220-gs101-acpm-047922ab4654

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


