Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C5FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=afCBTLlzLOHDuBx94uI8KNEKbVqLnuqOfBh0B3tL2lM=; b=x+PxD+9xXMK0Sl
	9ITHERunGNPvm9J/8mq8/kga1rlNuFnN5A8tg6n9hVCF4Kcs/uS0wCQsQoNR7YH/pT3HBhvTy2UgG
	jcIvs4oJkkBLc2kAFu8PP3L54oayKTo8u6/tJFEKmylNTVU1R3ptCtzjQoVNTfjQ3T+c3v3bkrq5s
	SPcJCwkzymOSb8INVPGPz/XCeswV1Fp9Bk8QCyFNRg9yljm0ank/rcxLU0MS32ClRSMjX/msRRhph
	89O7IM+eR1tSB07RafllTozSYN/hX7YqAkW1GyWu6lMMDoV0ONhLNkt5d/j++5CJ3PN+COxIMXEVT
	6srrtCXIM0Le/L6eXFZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdak-000000055Ow-1wq8;
	Fri, 20 Dec 2024 14:02:58 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdOE-0000000534o-3o5i
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:50:04 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso1146634f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 05:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734702599; x=1735307399; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=afCBTLlzLOHDuBx94uI8KNEKbVqLnuqOfBh0B3tL2lM=;
        b=xMQLdxcqDxKoUKoTn4oQHGvs2vp7n63Ps1LinuHtsnfjFZqKkBBoii3uahTOW4o+v7
         SJZgFEh7UJcnGkd1Q7XDTPqwvG+b48XGdk/Y4VP/TC0wD7VZzpa3fliHNSB7vZ2J/HiE
         TV+d3dLYgPEoFeVCryR2D8Ei943WNPOrJdzo4Snp0c0+weF6hzWoEHFEN3tC+P9jHbSa
         sYo98zpVQNORQehRXpoENcXVfdBeJ8EZV7HVcFFIvwYnRVD/YYRMHVXsPo5S3lMgvSnU
         wcQZH+CsSq2ZZIOg7uSDT8Gmq2GO7ew3P206mJfCFsVF8lMMltjjsZK3F3sJkFM0E3+I
         oKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734702599; x=1735307399;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=afCBTLlzLOHDuBx94uI8KNEKbVqLnuqOfBh0B3tL2lM=;
        b=OPAhvl8zmYUJyj4cgHJiOka8GdO6mdIfEA6x43Fwx0AgDiVD9+Y7RQ8f1JQa2doy7E
         7kr0Z5MG1g/5jf9xaYJfAOF94+V4m2l74ywfxVQw60YyhKrOrJdddAaypNDgNALPPMJC
         jpFV/q/gLfZah1XehfwR7pMOfxjOhikRyMdxk271+elItnggM01HpF90v+9k0X7kfjQ2
         AUyhzvYekedLUjNcm3WK2wCPNlOxahYtPr66i37KBqTl+HjFl2GoJOljgTlLg0GeX+Nl
         VELzOcBL4gDCdcB2TIhpfszk/c4yOzO5HXuAzxMEQyGQx8mzev7B/5jBqWwGRvInxDEj
         YS2A==
X-Forwarded-Encrypted: i=1; AJvYcCWZvok7LlEnejSjo9yrBd3XOn5GR6ey1YEFUGtXXDGL9bO1cBPMT2ctlUYuGekGuVp0DNiggx3a2wjJ3lkYIllD@lists.infradead.org
X-Gm-Message-State: AOJu0YyTt4qSCWycdBwquJly+QM8C56BT3EYfBF1KJjZCPqs4LMI/ReR
	inktkz4ALv4M4P8qGgEsZm545eLGi0lAqjopWIxdp8/2GsHbconJv7KK90KRlUo=
X-Gm-Gg: ASbGncuNf5wYzAyh2xEDAbkdConxvcp4puZW0Mh0FdoPMkoHZKXCNP6sq93fUxUU7Ga
	Yqf/KaWkB3LgMP2PhVcv3Uzk7wO/ZJr9+lRKAryRu2YvNvIq/zzmmoXuICj5FrIakICJlWdrCy5
	8Rt4koK3+H0aFDO5Pcr0WAfAWkHnjVpT0SruARNWuMdJAvqi7WdN/jYBBE31qiziJiv3pcJdzve
	RfTWIEKf9emMBLHZ9AWANLdAXzzU0UBWuFOdKGSOLCIfhmYHjUkEtn14+hW2RuH9ajNU0kPsF5u
	mRBHoh7tZSCkWNbEetDkFu3hRFkXLbZ5QNAp
X-Google-Smtp-Source: AGHT+IFVI3Xlug85tV4rBO/UFKQXj9r2d/ofSITIKky8mI4773TM7o/3BAQMekG6blf+o8eGkUmgxw==
X-Received: by 2002:a05:6000:704:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38a221f2e42mr3327105f8f.3.1734702599540;
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
Received: from ta2.c.googlers.com (130.173.34.34.bc.googleusercontent.com. [34.34.173.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c832e74sm4044313f8f.30.2024.12.20.05.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 05:49:59 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v6 0/5] mailbox: add Samsung Exynos driver
Date: Fri, 20 Dec 2024 13:49:55 +0000
Message-Id: <20241220-acpm-v4-upstream-mbox-v6-0-a6942806e52a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAR2ZWcC/4XNQQ7CIBCF4as0rMUAgm1deQ/jgsLQktjSDJXUN
 L27tCtdGJf/S+abhURAD5FcioUgJB99GHKcDwUxnR5aoN7mJoIJyQUXVJuxp0nS5xgnBN3Tvgk
 zrWVVcsmYbJgi+XZEcH7e3ds9d+fjFPC1v0lyW/+JeWCUCVdZqIVx2l0fftAYjgFbspFJfTLlL
 0ZlxlhuT7XiDir5xazr+gYjZI3VAgEAAA==
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com, 
 willmcvicker@google.com, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734702598; l=4158;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6TWIHezHv4FF1GCXzi2P0OdCIA/CiwYW9/ITn62N+lE=;
 b=qoUNrXlM1bh5TrIe5JvK1TOR2yxyEB+ORbRWykfdMg09NzeXljxBL7Yrz06wfb9Yo3eH0VNSa
 +nT/vc/kjxPDxF5xVL5anw8+FTIfDJ0nlJVlxjSI4Xhwzt3i5hUY8qt
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_055002_958750_F76F4044 
X-CRM114-Status: GOOD (  18.95  )
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

The Samsung Exynos mailbox controller, used on Google GS101 SoC, has 16 flag
bits for hardware interrupt generation and a shared register for passing
mailbox messages. When the controller is used by the ACPM protocol the shared
register is ignored and the mailbox controller acts as a doorbell.
The controller just raises the interrupt to APM after the ACPM protocol has
written the message to SRAM.

Changes in v6:
- mailbox: add support for clients to request channels by arguments.
  Used by the ACPM interface where the channel identifiers are
  discovered at runtime. Passing them via DT would be redundant.
  Initial version sent on its own to gather feedback:
  - Link: https://lore.kernel.org/all/20241219-mbox_request_channel_by_args-v1-0-617a6910f842@linaro.org/
  - the patches differ from the initial version as they allow #mbox-cells = 0
- bindings: google,gs101-mbox: update description, make #mbox-cells
  const 0.
- mailbox: exynos-mailbox:
  - replace exynos_mbox_of_xlate with exynos_mbox_xlate, the channel
    identifiers are discovered at runtime and passed as
    'const struct mbox_xlate_args *sp'
  - in the xlate method, the first argument is the channel and the
    second the type, as channels can be configured either in DOORBELL or
    DATA modes. This becomes an example for when an exynos_mbox_of_xlate()
    method will be introduced.
  - make exynos_mbox_chan_index() inline and directly
    return chan - chan->mbox->chans;
- drop Krzysztof's and Peter's R-b tags from the google,gs101-mbox
  bindings and the Samsung Exynos mailbox driver as they were updated.
- add Krzysztof's and Peter's R-b tags to the MAINTAINERS patch
- Link to v5: https://lore.kernel.org/r/20241217-acpm-v4-upstream-mbox-v5-0-cd1d3951fe84@linaro.org

Changes in v5:
- fix dt-bindings by using the correct compatible name in the example
- drop redundand "bindings" from the dt-bindings patch subject
- rebase on top of v6.13-rc3
- Link to v4: https://lore.kernel.org/r/20241212-acpm-v4-upstream-mbox-v4-0-02f8de92cfaf@linaro.org

Changes in v4:
- rename bindings file to be based on compatible: google,gs101-acpm-mbox
- specify doorbell or data mode via '#mbox-cells' dt property. Update
  driver and introduce exynos_mbox_of_xlate() to parse the mode.
- s/samsung/Samsung/, s/exynos/Exynos/
- use writel instead of writel_relaxed
- remove stray of_match_ptr()
- Link to v3: https://lore.kernel.org/linux-arm-kernel/20241205174137.190545-1-tudor.ambarus@linaro.org/

Changes in v3:
- decouple the mailbox controller driver from the ACPM protocol driver
- address Krzysztof's review comments

v2:
https://lore.kernel.org/linux-arm-kernel/20241017163649.3007062-1-tudor.ambarus@linaro.org/

v1:
https://lore.kernel.org/linux-arm-kernel/20241004165301.1979527-1-tudor.ambarus@linaro.org/

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Tudor Ambarus (5):
      dt-bindings: mailbox: allow #mbox-cells = <0>;
      dt-bindings: mailbox: add google,gs101-mbox
      mailbox: add support for clients to request channels by args
      mailbox: add Samsung Exynos driver
      MAINTAINERS: add entry for Samsung Exynos mailbox driver

 .../bindings/mailbox/google,gs101-mbox.yaml        |  70 +++++++++
 .../devicetree/bindings/mailbox/mailbox.txt        |   3 +-
 MAINTAINERS                                        |  10 ++
 drivers/mailbox/Kconfig                            |  11 ++
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/exynos-mailbox.c                   | 174 +++++++++++++++++++++
 drivers/mailbox/mailbox.c                          |  60 +++++++
 include/dt-bindings/mailbox/google,gs101.h         |  14 ++
 include/linux/mailbox.h                            |  17 ++
 include/linux/mailbox_client.h                     |   3 +
 include/linux/mailbox_controller.h                 |   4 +
 11 files changed, 366 insertions(+), 2 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241212-acpm-v4-upstream-mbox-948714004b05

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


