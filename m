Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C82C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t6OWY0fos10iStOF5H1IFYgZ2IDlUZVRYgpKLYkqEuc=; b=V5M/XfzZDfZn8u
	KLVhtQucSVDuV1eVZg2ZgUqYI+CPKxu2AbQZPrxO23KTwPfHtmjQUgrffy09vE2C3VBx512tTFYJH
	S7eyQ1QGKy9UFjZrE4Q8wTIF0xCwGOA5br1d0Xpwqz7M7kbz+lKgM4CdbKfA1Bms8T409j7sCXoES
	rJUxb+lZyrHemMLIN5eFBNQujBQ31T97F22mQrD1d8nKbfwG/2+lMwKLA/bHb0v7646KvulBkKexp
	+MwNdhW/ZrRkVoGnLqJUb6OHzk7dvj+wrmvUd87baqGyYT1sT/ZIWnJ7dLUNGM4DsLiylBcFOYQg/
	qClMkYmhBKc26d4TS4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thm2W-000000034wC-0A7P;
	Tue, 11 Feb 2025 08:54:44 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thm0j-000000034Vi-072a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:52:54 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so2670403f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 00:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263971; x=1739868771; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t6OWY0fos10iStOF5H1IFYgZ2IDlUZVRYgpKLYkqEuc=;
        b=foXkhFAQfpXUVuCoeEPu2PsUrj+NJhs3LqpJRomqXMkAjr/7NjambZuTIvvur1egvX
         7C6+o0Lw0oNgK/G9ZX4fmkjl+z3poxbp/vP2PEKQpnclguxe2YshV7y/r99XisFzEpoj
         UgGmOuQIh1+QV3FdkyECFGuugwMVt6htDFp/GevOO0FOxRddTu12oOCR7gtpoPLBERRh
         Zqr3MsXmStO8rs9WXS6rD5Ko3QG/SC1M8c1oEq2SeeePRA8DflcydEFBgwianV0/WE+f
         EU0/LNCpbLaW5uyziWcTW5W3dpHEn2Z336WfXnu0hn0VgiRJ1zwArgFLhuxcGZs4WUFS
         mO+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263971; x=1739868771;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6OWY0fos10iStOF5H1IFYgZ2IDlUZVRYgpKLYkqEuc=;
        b=t7kAqJfHJNLTgT52lp+0wWk9gzt9vDeiftqWyeSt6/HEaA5AIu+Ij4rwZrxWd6IN3N
         JUYsRfRzincQgM05ytfTGXmaMrxho9EJVMDLfXTjotoUacA2Me3S63Tc0OetYQZggE01
         JS+ASOaipBGtWdHmeJxuqOzWX2SJCTqcCXH2etL1i7zdVNZo5h3Xiam7JhzQ2HmHRVmK
         nlvUmr4zp4wuChD9i3YxzqdBwG3tliNao8XC0c6F+Tf+fU+qr23k/oOhgBtcVRPTgguE
         FfMh6yRkDhZxEXNR2AjSHv6o1IsZibZNCIfOjZn7BjGY5NMn3jQunoODSiyMEOPXFTnL
         w01g==
X-Forwarded-Encrypted: i=1; AJvYcCWijx06+FliDDpVU12ZX60Ms1WGH24fFKCaFh2Cd2akKBfYVld6FxcCkbOCMQNbcPDfcLxjJF11wIVokXoHy02X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+6ho+6GCf2KxsEK/9EL4kN1SWLbJ71p0KbM6F5BwtDsp8TIsC
	Df2X4Rc0+pQoGg2NQpFFkBe/3fmAhZt1pi/2SaHlE25Xmh1FSkzLcl8R6lSjqkI=
X-Gm-Gg: ASbGncvpwf8qRZ3OxfS52btb01esYHkbdQ54scEUqBv8YLGfxT7pFNHJRgUMNQsIwom
	fig6IXNhQbR1nqUyVezrKlu65ebeNTvmqpfZILEfvhpVM/rAEvt95M1/LLFtjEKMuGi3xi9uc8g
	xvxy5vVpjMF4h6uNnnLt/28HPEknKODVjlXunnfMkfOzsmCDRrRkT6cXBPqBMl590aFNnznFuQQ
	NXKuagD8UhLfA8cQ+xgBPe4omPfIZrpF0SwldgRuW+eWRDgT0MeQWKtr+jnNuxOEUx2LWqFlGq8
	dF10Pmr4ng+cRxnpYsHrzUoKWjoW0K/35T2kfSfOF4E7l79/cf2s5czOFXglewjhoSoBlvM=
X-Google-Smtp-Source: AGHT+IFiFaaPLBLJBEAY8+WoDJJ3p9o8HeMoJbNg623UugXDEowbfXM3r+JsQUAhLtZreuBj1aDFNg==
X-Received: by 2002:adf:e981:0:b0:385:f7d2:7e9b with SMTP id ffacd0b85a97d-38dc90e1758mr10123478f8f.30.1739263971130;
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:50 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v8 0/3] firmware: add Exynos ACPM protocol driver
Date: Tue, 11 Feb 2025 08:52:48 +0000
Message-Id: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOAPq2cC/23MSwrCMBSF4a2UjI3c3OahjtyHOEjapA1oUxIJS
 uneTQsiRYfnwPdPJNnobSKnaiLRZp98GMo47CrS9HroLPVt2QQBOUME2iUGjOpmvFPg6oioDZe
 CkwLGaJ1/rrHLtezep0eIr7WdxfL+zWRBgXKH0ihnaifc+eYHHcM+xI4snSw/VgBjcmNlsbbWa
 JmuAVTzY9XXIqiNVcU61yqDzjCh7cbO8/wG7tCoaB0BAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=6041;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=CvGiVKhIZswP4wKgAQsjHEPJ6nFC0lHhIDLbODeavE8=;
 b=eZXGXagF/HzbBDBvktDYnY2EL5nXxgWg7z3jGAjTjxyplxJ287FnSOEYf2qD4oZPMAiORl8f3
 0Rg/RsP1v/eBBVtH2lqJkJUljgTvXrDY4hwwq5ieKSE/yFXwzdCd8rV
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_005253_072226_664714D8 
X-CRM114-Status: GOOD (  22.68  )
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

Changes in v8:
- replace the open-coded mutex handling with cleanup.h guard(mutex) and
  scoped_guard(mutex, ...).
- fix kdoc warning
- Link to v7: https://lore.kernel.org/r/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org

Changes in v7:
- drop device_node cleanup because it missed initializer and didn't make
  things much smaller. Call of_not_put() after we're done with the dn.
- pass the property name containing the phandle as argument to
  acpm_get_by_phandle(). This lets consumers define their bindings 
  later on, when introduced.
- fix typo, s/acpm_dvfs_set_xfer/acpm_pmic_set_xfer.
- now that the exynos mailbox driver is in v6.14-rc1, use the
  exynos-message format for the message passed to the mailbox
  controller.
- Link to v6: https://lore.kernel.org/r/20250116-gs101-acpm-v6-0-e3a2e1a3007c@linaro.org

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
 drivers/firmware/samsung/exynos-acpm.c             | 768 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 11 files changed, 1178 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-047922ab4654

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


