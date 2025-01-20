Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598F5C02181
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 17:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mbB8qm0bkBEJ3fYSZMX1yugmevQ3Tpm+Yk5pP0ec+Jc=; b=G8JvDQZhv1ZnAF
	+mHD2AgxP8CY2Nem1lq7LPvyIeLfCiCwmU5tEWoRpJhGpI39g1ZKWYpuuUl/TgvW/tCIFY89PLJI2
	BbeWRMm436VlMNi3hWj/5wPLyLAQI8aFvUn9C2bwIBKBPstORfL915G48SPPME9qsmuPbl1etsTg1
	ecV5GqzRz3YbT5VPsXX2UUih+CAaSZm4wcSqS6z5TwoYqNThoIwNTxRXrxC8XZZcP5fOqGGoZ37bP
	molhNaH/SfmaWC5a3yi5IXZUO4LW5qmiFkzvxT7hTYbV4FR7MwM5LoUSsgIWvWeOpXlh7YhX9wr3S
	2JapFodozhyiEFD+v8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvPc-000000066Sa-3eJu;
	Mon, 20 Jan 2025 17:18:08 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZvOJ-000000066Am-1GlQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 17:16:49 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43635796b48so30328205e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 09:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737393405; x=1737998205; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbB8qm0bkBEJ3fYSZMX1yugmevQ3Tpm+Yk5pP0ec+Jc=;
        b=Y5wa66SeCeRBhKHREJUdEvz9Jftt7mivxRfKTHuh3Jr203igrjhWTYTmhtH9G1rXBQ
         dpiNfUI0sfQTOmwrBHRM5ClKr/qQg80CLpdBfMO6Ewe7OGtzP4Eres3dfgjdvXRbMfGx
         0HXJaedOdm7iC+aOuudfv+q3uI2sxwW5jk0tz/lk9cRDp9/AXNbdcaiPofdG53D/Smpo
         jos4tFN/Hok0oDlXdiHIGfVA11i+tmcndTEON7W66aW1C1qS5BIulyKoXjIbiToi06oE
         sGJlKjruorlQflshQCPMIbB3sBhErL+cRVP8q5LeRb51VBFtBegRi8GN7FXEQGDlP9dj
         1Wqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737393405; x=1737998205;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbB8qm0bkBEJ3fYSZMX1yugmevQ3Tpm+Yk5pP0ec+Jc=;
        b=j/U5LkwCeA859Kp1oCtcfoHQ3nUA1RgAEDAfrVSMN7azxWN1KwzVMU8h0SbJqOwOho
         LoYR4o0ygH3FoqJEkb0Bopw19EAN+hWC8H0AdfwZdd7RYvgRYS7vJdh/lMJMLggW9TqE
         XzueItkkBiT01iiOk00Er0GzCDrZguYj/7XQFV+FNknUbfbX85btzt9UVgAZpUWZ+gzy
         DARdZ7ypjs/uV/lLabdtfeDVFMwJqZZ+VZnGkgglrmPVM6AAZVllzc5OakNCsDztGrN7
         qc9TI+oExBR2mBMB7jc/P4Ruy+YfUZdvumhP+LEJdgdRp9JOZQo4RjXEoC5z2wg7vBOx
         uNwA==
X-Forwarded-Encrypted: i=1; AJvYcCVhmQBE8wyvzP6GNUGedM6F4FKvXzZ+WpMBVWbiLrDtHa7r8beWURSw1DvTTfTWwN05Mx/VeydmC9HuGLOqsrBQ@lists.infradead.org
X-Gm-Message-State: AOJu0YxyGJNc9Qt0OJjPQ7q+Xd8ZFgCn5aU2EiS+zjCHGqw7xQhGn6So
	lPUWw0Lc2XkW3trWqsp/Lj06x1Dy4CM1/xtdpLjhumczQY8iQaEd5Bpljjw9YKo=
X-Gm-Gg: ASbGnctjBblKbLGzuouMfdLmNCbvBhhz1Kgs35mvAGupoBYV4TxE6triKY3CFZqmzVK
	bH/5xqCXHeg18Shp/G9tfr6yZkpxJnCt7hHSa6OJr/1qSwp0rANIC/If1NVrFUJOPT7Bg/y/wZz
	NTSiftrPuFzu4xw1Xo7qsZn4A36u1m3AvXrY8jFOhvOjkj+oeyZ/Pe/WQH3B0cLopjJ1bVF6vEw
	O10QoE0zpkOLbR/8zSU6UWETQ0rNvtrN0FOLP5SlYG8jPDuSpA9lcc8wQN68ejAIoXQuV9qDam1
	l2wz2RTN
X-Google-Smtp-Source: AGHT+IG5o4k9tK/Vhm1L7A9XvrUAF/5ZROZXG66cuSFDp1cGjAPzlnO10DMoMkcNakTaJusKA0zDvw==
X-Received: by 2002:a05:600c:8712:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-438918d9008mr128996795e9.9.1737393404184;
        Mon, 20 Jan 2025 09:16:44 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:66cc:1b13:f78a:5738])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-437c75298adsm208629865e9.30.2025.01.20.09.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 09:16:43 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v3 0/4] clk: amlogic: drop clk_regmap tables
Date: Mon, 20 Jan 2025 18:15:29 +0100
Message-Id: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALGEjmcC/5XNvQ7CIBSG4VtpmMUAlaJO3odx4OfQEmlpoCE2T
 e9d2sTFSbfznuH5FpQgOkjoWi0oQnbJhaFEfaiQ7uTQAnamNGKEnShjBMveh9ZprP0TmxjG/Yj
 Q9nLEk1QeEqZn4NpywWreoAKNEax77SP3R+nOpSnEed/MdPv+xWeKCb40xjRcaGWVuSk5e6ciH
 HXo0baQ2UflhFLxk8qKaqgVxSRC1PClruv6BmtMy0stAQAA
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3282; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=k1IIV9DSBPIvFUEiqJP0rcFyaxltvdBOco23nV5sRPs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnjoT21CjqOGkbh6UgB0iHVHF6VxRL1Eju3Abzw
 36s8sm6zmSJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ46E9gAKCRDm/A8cN/La
 hbhkD/4nQv0cuGLB9720y41tXquDMo13LTUI/XLrUPOll1ojBZRRsgY36hT0xbruXlGGSrokoDN
 G8pepnfvHtAG0VgSRngUhr24dnWPGaKV/CjHspTIyp5iOEqm6BGYn424RhCV/yHn+Ju89WZeTTg
 QxfPcxAQnp/BEaWSW4bOxLQLF+fgYEtQVWBs08wBc5rt+sAdbTcdI5WkeQW9je5EIho0iE+uw97
 qwMTQJzzMu3/Xb5xRHRP89t0wC5IEUCE1uVXdADjQ23TBdTXQjL/LNyUE21TbMU5NAOOSsUS5Xt
 pm8vh6TfmZRnGhU2dchGSa/D7ZPJj9cnKPdp9kWzEghM55JUIIfusc7Ky1oH6NQC+xkQgQSq2GG
 tsbUDC4xvQxAwBXt0D4W98JWwhuq3k6ilLnaPcuXRETIvLwdaxOq1QXGSCcZn33x5S5WAkRRAf8
 yor86t/nBkjLwtgNH25tPYbc5NE5c+MVyAth5Z+31mQR/I2M3q4nfd2adm22s8nkAVdAvOikIKx
 y6oFW4XoKiShi0IcUkzvqyJjpR7j8AC9ll+7xTxHXICi24pePfnRG8imcL9ptYrIlnQoi4xMv9t
 rRWQYgk1aml5UTmDQQz4lwVzC5hgdeJyHJm+aJhrd12gGkOO6csjUNgRFi3VrztlgCX+b9mKx56
 s7ZuISeQXvOIxCg==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_091647_495885_6360D540 
X-CRM114-Status: GOOD (  13.29  )
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

This patchset removes the need for clk_regmap tables in each clock
controller driver. These were used to populate regmap with in the regmap
based clocks.

This saves memory and is the 1st step in a series of rework of Amlogic
clocks, to clean-up, increase code re-use and ease future maintenance.

Changes in v3:
- Fix some typos
- Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com

Changes in v2:
- Add clk_hw_get_of_node and kunit tests for the new helpers
- Split patch adding the .init() and the dropping the table
- Drop devres based solution and something temporary but simple
  while a more generic solution to hook controller init is discussed.
- Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (4):
      clk: add a clk_hw helpers to get the clock device or device_node
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/Makefile                    |   1 +
 drivers/clk/clk.c                       |  33 +++
 drivers/clk/clk_test.c                  | 116 +++++++--
 drivers/clk/kunit_clk_dummy_device.dtso |  10 +
 drivers/clk/meson/Kconfig               |   1 +
 drivers/clk/meson/a1-peripherals.c      | 163 +-----------
 drivers/clk/meson/a1-pll.c              |  16 +-
 drivers/clk/meson/axg-aoclk.c           |  22 --
 drivers/clk/meson/axg-audio.c           | 433 --------------------------------
 drivers/clk/meson/axg.c                 | 131 ----------
 drivers/clk/meson/c3-peripherals.c      | 210 +---------------
 drivers/clk/meson/c3-pll.c              |  32 +--
 drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
 drivers/clk/meson/clk-dualdiv.c         |   2 +
 drivers/clk/meson/clk-mpll.c            |   6 +
 drivers/clk/meson/clk-phase.c           |  11 +
 drivers/clk/meson/clk-pll.c             |   7 +
 drivers/clk/meson/clk-regmap.c          |  49 ++++
 drivers/clk/meson/clk-regmap.h          |   4 +
 drivers/clk/meson/g12a-aoclk.c          |  34 ---
 drivers/clk/meson/g12a.c                | 261 -------------------
 drivers/clk/meson/gxbb-aoclk.c          |  19 --
 drivers/clk/meson/gxbb.c                | 393 -----------------------------
 drivers/clk/meson/meson-aoclk.c         |   5 +-
 drivers/clk/meson/meson-aoclk.h         |   2 -
 drivers/clk/meson/meson-eeclk.c         |   4 -
 drivers/clk/meson/meson-eeclk.h         |   2 -
 drivers/clk/meson/meson8-ddr.c          |   9 -
 drivers/clk/meson/meson8b.c             | 200 ---------------
 drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
 drivers/clk/meson/s4-pll.c              |  31 ---
 drivers/clk/meson/sclk-div.c            |   5 +
 drivers/clk/meson/vclk.c                |   2 +
 drivers/clk/meson/vid-pll-div.c         |   1 +
 include/linux/clk-provider.h            |   2 +
 35 files changed, 239 insertions(+), 2320 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


