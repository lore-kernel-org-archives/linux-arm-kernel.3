Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3D4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKRLg92c6C6VQuMYXP20YZZyOfIPnqquJNnWGRCRNdM=; b=YZH/mXuTQ1OefE/InJZJ8kNxn/
	xRMxZ//A5yGaWkpnyVcXIjJlJcxsC1m5DeE49HcbgcO3Btfcc+qAtGZP9Kalwd/w1NNIJpPCfUP1L
	S1nJNI6uPVUT7zm+bwU6VcMF6ZubLCHkqduhUqLsxhZ8rKNMjy4bd4zfncFQ7tBEteFgFLsA3/4mq
	wxf0tKBKPsT2eDehQ/2RDv7p2R6hCoPysWzq0TI82ZHjmVdZ8YGLCmz3vHHIU8HLESoYqrNwFYqKb
	gGX6btbU3ollBcfL2xc54LplZi85yy7LldlJ/qH4kIzma68RDsp/XI5LATDsdns1hUxYXnyhNEdzT
	a8vyYGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trMA6-000000012kK-2bNl;
	Sun, 09 Mar 2025 19:18:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLoo-0000000110l-2Aev
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 18:56:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-39127effa72so260829f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 11:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741546569; x=1742151369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKRLg92c6C6VQuMYXP20YZZyOfIPnqquJNnWGRCRNdM=;
        b=trLjswOa9ZA/6/e7jnXDtAWFfUnsvOO396UfSZEZ8NyKncRs4IDe2RVeYAJ9hUsDvr
         JQAhdTeGGytWa2FSOAnveKqbPvBw2WFJaw3RtpSi7vJ3lIABDzHF12PRPChh1jvYxp9v
         pTlHUGK5cgbg0qQI9dITfzid+IIPbyUxqpIppVnXKuZuJ/ZozHgRfrR9Dgq7etGprUAD
         aLJRmZZ5ynpOvkm3hLadUZ14eUoOiwlP6ZdLTR1MaqsUu3HeH8FX93qWV/VIP1lEo+gD
         JHCOF4rIMWlTRbHRND8523q3lMU1w1jj2iHh+GhM7WhMdzFL3k4RjbMjAO9oIuIcuVEQ
         oFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741546569; x=1742151369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKRLg92c6C6VQuMYXP20YZZyOfIPnqquJNnWGRCRNdM=;
        b=rWCLeQpQw0FHAjgfMZ+1D0WSD0AOYIyvYHPz7+M5fZ7YaoDFzKgLk8PGSbKisoRzTT
         LpB9KiDDmUEpaNPuV7OAn31RpkONnz4MnIyltxEV3Yilyknu3ArZAhZOfsjsVLrQFM8A
         c5WOs7r5EpHXtpuk4rYTCtim5LJ9SR9CweyKx4XdOphRcL818Z4f5LrMb8grhwL2O94V
         qujQahHedWDA0W/zLguPAlyc0cD35kZz4TwR/5MNclSGvaC3Lc9OYH5iUycN+VyCMP91
         7AOX3NMRunJ4a+75iAdhIQZTw83Qe2jBKWFELUp6gJHrdbc606Svsgkv0qmnqHrpG70T
         bJvw==
X-Forwarded-Encrypted: i=1; AJvYcCUjTLyGae4g+chOjLlZJfZC2fQllsI6X224k3GTAhBDJ6LDtXrnyAV+mfWAdjBp46ommcahrWJPnmzekXGoMknf@lists.infradead.org
X-Gm-Message-State: AOJu0YzfJlim/taBJiPr5q1NXOLa+nP2lUCeuQj1kOcw3ZdqvwEYVwxo
	u1ZNbHW69sn65d8H+DdDp9emIXNobkvOSNV8+NrWwLOX/gnqqfOkvdIYxQ+fg14=
X-Gm-Gg: ASbGncuIWdaDzhsVRG6ZCa9skMsSU+HEkypxXW6+DR7xrTIctWHjK+Z5NrsAlm9rSnM
	Bdngoqf7aq9Qp+WmZ/fwjb5c3yeB2JQhDxu5uo/5FbQPrmQro83YJiSwZQfTStnxfl/YEErLgIU
	IBMq2aYF3jF+35lmQ9gWaXIuPfAvMzqX8Z7RNWJZSZhEvn/3Xbad9X/FOBw1BfRj+ramv86uBKq
	1ZR+cbYPlCfn1wDo5EN3LDK6/xzCeTWNiVK2Dyx06Jaebgra5wM6f2G+irDUoUWNhAxBE8LShKj
	VvyDPAyAD2azayhMNNluL95tu+TW5LfhUTLuk32hYZjleI0QR4HH28gBX/4=
X-Google-Smtp-Source: AGHT+IFgAZkZaPTg34kk+B+P+zg3fnOit9vmY6MmBLyv17DTPt6JikKSZWSxHbdBl0XNWFJgN8f7ow==
X-Received: by 2002:a05:600c:1da2:b0:439:930a:58a6 with SMTP id 5b1f17b1804b1-43ce6ef2478mr13617275e9.8.1741546568817;
        Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43cee22c13fsm44263945e9.40.2025.03.09.11.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 11:56:08 -0700 (PDT)
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
Subject: [GIT PULL 2/4] arm64: dts: samsung: DTS for v6.15
Date: Sun,  9 Mar 2025 19:55:56 +0100
Message-ID: <20250309185601.10616-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_115610_557218_67A7A08F 
X-CRM114-Status: GOOD (  14.67  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.15

for you to fetch changes up to 056106b030b73c7d53749469bd1cdbc89b4d2daf:

  arm64: dts: tesla: Change labels to lower-case (2025-03-07 16:05:35 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.15

1. Google GS101:
 - Disable GSA core pinctrl because its registers are not available for
   normal world.
 - Add APM (Active Power Management) mailbox and the ACPM firmware nodes.
 - Add new boards: Google Pixel 6 Pro (Raven).
 - Enable framebuffer and reboot-mode.

2. Exynos990:
 - Add PERIS clock controller, MCT timer

3. Exynos8895:
 - Define all remaining serial engine (USI) and syscon nodes, add MMC.
 - Enable microSD and touchsreen on Samsung Galaxy S8 (dreamlte).

4. ExynosAutov920: Add UFS and CPU cache information.

5. Various cleanups.

This includes two topic branches with DT bindings, which might be shared
with other trees depending on needs:
1. for-v6.15/samsung-clk-dt-bindings with Exynos990 clock controller
   header constants.
2. for-v6.15/samsung-soc-dt-bindings with Exynos USI serial engines
   header constants rework.

----------------------------------------------------------------
André Draszik (7):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

Devang Tailor (1):
      arm64: dts: exynosautov920: add CPU cache information

Igor Belwon (3):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      arm64: dts: exynos990: Add CMU_PERIS and MCT nodes
      arm64: dts: exynos990: Rename and sort PMU nodes

Ivaylo Ivanov (6):
      dt-bindings: soc: samsung: usi: add USIv1 and samsung,exynos8895-usi
      arm64: dts: exynos8895: add syscon nodes for peric0/1 and fsys0/1
      arm64: dts: exynos8895: define all usi nodes
      arm64: dts: exynos8895: add a node for mmc
      arm64: dts: exynos8895-dreamlte: enable support for microSD storage
      arm64: dts: exynos8895-dreamlte: enable support for the touchscreen

Krzysztof Kozlowski (5):
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/dt64
      Merge branch 'for-v6.15/samsung-soc-dt-bindings' into next/dt64
      arm64: dts: exynos8895: Rename PMU nodes to fixup sorting
      arm64: dts: exynos: gs101: Change labels to lower-case
      arm64: dts: tesla: Change labels to lower-case

Peter Griffin (1):
      arm64: dts: exynos: gs101: disable pinctrl_gsacore node

Sowon Na (1):
      arm64: dts: exynosautov920: add ufs phy for ExynosAutov920 SoC

Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add SRAM node
      arm64: dts: exynos: gs101: add AP to APM mailbox node
      arm64: dts: exynos: gs101: add ACPM protocol node

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 .../bindings/clock/samsung,exynos990-clock.yaml    |  19 +
 .../bindings/soc/samsung/exynos-usi.yaml           |  99 ++-
 arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dts |  72 ++
 arch/arm64/boot/dts/exynos/exynos8895.dtsi         | 956 ++++++++++++++++++++-
 arch/arm64/boot/dts/exynos/exynos990.dtsi          |  92 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     | 138 +++
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +-----
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi | 294 +++++++
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  66 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |  26 +-
 include/dt-bindings/clock/samsung,exynos990.h      |  21 +
 include/dt-bindings/soc/samsung,exynos-usi.h       |  17 +-
 15 files changed, 1721 insertions(+), 379 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-raven.dts

