Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BA3C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 14:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yS0nd8EccXnywEAFii931dQBir56Rj9cTv3wnrjM0qE=; b=ArJodHji0M3y8F
	Mv1PrwRXBUZpgxRHjM1Qidq19gZhkdRlj3VKZFX6Qdlv2rJ4h3hbUgKbNTWX5NrYdNp3Ni00q2BgU
	oFPhhh/eV8xvmerAViombMm1isxZsI92gUnJ7AM4R3BJBbZjUQnu1s62rU8vilBKjXX/pe3aud3qG
	w/74aFDPhLEahfbkhOJgH/XLZOQ2WxBkaGXBRKftTXHypKvxtNtzK5XPkH6CJ7KdeEc7yY4sEykTD
	gI2n9uhVMjXEGEz0YLoPp1NRF5kMp9dEn6PlhbRtmK5YS1hL/2l3oujeEZ2B9aRJemiOzq8JrxVHz
	9fGzV6zcaoFw3+4zMTlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIC-0000000BKvr-1XuE;
	Thu, 13 Feb 2025 14:34:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiYu5-0000000B5lY-2yVJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 13:05:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4395578be70so8899915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Feb 2025 05:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739451916; x=1740056716; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yS0nd8EccXnywEAFii931dQBir56Rj9cTv3wnrjM0qE=;
        b=U7c+gL2dYkZ/1pDFSiCKF8vxRiJUF1p0gjywLDjy1eJVtEa8atgmdXAiB7skHXAmSj
         DQtPVPptWNSgnN5bEvdiGLgy8oUPyISCTOoRAPB0VhaeoRmUp4JaNtzYrLt0/RTynXlN
         fLUSq3i/H0mAqpd2HP+sjoEmGJGgsmTIQeMwuNe8zxjs7O70be25d/cyBl5q+bFRk2pJ
         9xU5ZPEQXk70ffqR6cdrcf2Ibc6TftbpxToreUkyVL9jfr5S1mNDIoTtXtfwdhqeaNs1
         KkkYu4pD1pguWhMahCA5qTbW54AxmUFNMdZj7KphpK4t/ugw93sVlDGKIQ0XTYsBFiXk
         bKqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739451916; x=1740056716;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yS0nd8EccXnywEAFii931dQBir56Rj9cTv3wnrjM0qE=;
        b=SMxHjvuhdn6u6gI/bfnVP9AH8vt2cZFfxxkJg0FHttxXQJPw6ckYCFe6JeCbNrTuIu
         sEWuqvM62GWYkcrjqMc3DnxVZiqBpZ/1FpdLwzgVikksaFtaS5wa5o9J2lCr7uYSG59A
         l1McV1MdOG4y7KpVY8rN0IGiQvvswrmiF2Ct3WY8eWhOpmVEXP4yJHdKpkfIt89Jw5NN
         wvichBY0v5LD6HthQqOIQAI8irpQ096xHhaDshqc9fbQ7SF3HrWpl9e31YmA1PADjYCN
         elvM0CizwhLpWwj4YZg4sOZhFiN/tzAgfS500u3Vam1lU97MexXcJvhS9ncRN1krrcN0
         HC/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtGBjmplhRtu/xfeM5onA2g6RjsQkB+2he1ezuLopp8Jg233Hr6UUuenjHf4M6WoasmVx9seI6uBxAehGB6Eo2@lists.infradead.org
X-Gm-Message-State: AOJu0YwoIuPF80ChT6v1U5vISomY7aiJn9iqj3a5OdFN3EgWgxToF/oj
	Dwt5H7eRxRYoDmUkivf8nV0BTasdzA+EFbv9GNWTkDvbAhjenw8nD60vRyRbdzs=
X-Gm-Gg: ASbGnctzgTJuFPgeNM1Dd+JJ2m9Xm1ah1fouGLZ9As8x7HRUVvj1UFP8CrCvzjlVQ6w
	1eFurbUG4D6ik9n4o8eRTroRzSd0kX/Ju0/KQeFYjcP7k43HZzhj1YrVQ+G5Wf0tz83SNPCttW7
	SlkU3hutMMU9CGmEiCrWb3pRaAwlebuOUHWLbbnL3fEZClGc1wHHSo8dCC0wBJbBOrzXm5R/9Bj
	2ssO8Qb3ofACxYudE/JwW6Q1Amo/+owU/Qh9VJFk3Yn1/FFmXeSxyQX3VEcbmVFRVMVMPdn69Wb
	JGAz7dxHfo0ody0AQIaOehORTsFKwqZtq01GYp+Lehnoqu7/xaFgo+Bos6JH7CAcZ1s1NIU=
X-Google-Smtp-Source: AGHT+IGSf38YmDlCYGCcEl+oolpquFZLEVpgwlwKkPRKxqQrzPQzV6gHrX+1nVir/2rtM3YCvDv0ZQ==
X-Received: by 2002:a05:600c:1e1f:b0:439:45ce:15e9 with SMTP id 5b1f17b1804b1-439581b94c4mr64442645e9.26.1739451915842;
        Thu, 13 Feb 2025 05:05:15 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43961884251sm17004025e9.31.2025.02.13.05.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:05:15 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v9 0/3] firmware: add Exynos ACPM protocol driver
Date: Thu, 13 Feb 2025 13:05:13 +0000
Message-Id: <20250213-gs101-acpm-v9-0-8b0281b93c8b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAnurWcC/23MywrCMBCF4VeRrI3MTHNRV76HuEjaTA1oWxIpi
 vTdjYJo0eU58P13kUOKIYvt4i5SGGOOfVfGZrkQ9dF1bZCxKVsQkEIikG1GQOnq4SxB2Q2R88p
 oJQoYUuB4fcX2h7KPMV/6dHu1R/18/2ZGLUEqJuMt+4o1706xc6lf9akVz85o3lYDoplZU2yoH
 AV0FYCtf6z9WAI7s7ZY5sZ6Yo/ahR+7/rKIM7suFrABZE3UODOz0zQ9AI+C0adZAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739451915; l=6508;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=0xvlbveU53QfgFe308AzTrrEyAYHzEnCLInr1C5Wvwo=;
 b=IW7xtrZj9iPFrC7HklVBVVQYy0EwS1feN/JXtKM+sGHehyDidLtolbAhhTp0J/TRVok7Ym28c
 qMNAlSsaAqODCFKi+/M+FEscoexFFUlqMjMUjGEkvV8C/ScXuloCrOI
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_050517_759671_70433CE9 
X-CRM114-Status: GOOD (  22.43  )
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

Changes in v9:
- use "GPL-2.0-only" thoroughly, don't mix it with "GPL-2.0":
  - bindings: update SPDX value to "GPL-2.0-only OR BSD-2-Clause"
  - exynos-acpm-protocol.h: update SPDX value to "GPL-2.0-only"
- drop stray module info from exynos-acpm-pmic.c
- exynos-acpm.c: explicitly include <linux/device.h>, it was implicitly
  included via <linux/mailbox_client.h>
- Link to v8: https://lore.kernel.org/r/20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org

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
 drivers/firmware/samsung/exynos-acpm-pmic.c        | 224 ++++++
 drivers/firmware/samsung/exynos-acpm-pmic.h        |  29 +
 drivers/firmware/samsung/exynos-acpm.c             | 769 +++++++++++++++++++++
 drivers/firmware/samsung/exynos-acpm.h             |  23 +
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  49 ++
 11 files changed, 1174 insertions(+)
---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20241220-gs101-acpm-047922ab4654

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


