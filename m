Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E893FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=; b=jj+rZhHGjD1RRz
	LgvEQLnOFMJDuXdQbCWXrdvXuJY+OfUAWp74Rb3+p8GrglK8ptUW5Ap1qXK44Z/bF1Gn7L0mkITNt
	bZQ559fBf5n6J8mHauuDBnyTo2JELE5yTZb7Vm/hd9W0yfv4/4xTKoEmKnqgwLAdgfg4XfmrUutZ+
	E8COx6zzImcV3Di9vk0L/vTRGFWfz5UgVCDYJs579XVWZCMDCses+ZQ/sKOsoyEZt1SGxnQAciHFH
	cO0xANC21Ki6zGL4J/a5l815h+5/yTLaxguPHyBhR43KgDj3ONIMhjDKdiQc8q3b+ducQwhiEDoWu
	URAZXL1d9ENPPoadl0rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgvW-00000005f5I-3Cpm;
	Fri, 20 Dec 2024 17:36:38 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgdM-00000005bVM-0hE4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 17:17:54 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43624b2d453so23332725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734715071; x=1735319871; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=lZdjOBFBc1e7ZXJQYEEaOI8bOM1yXT4xu9uDmelV19IBzkNTEkN0RaiXGBB+1wWeU3
         7JyRR0G+KkjS91lnA4sYc9Z4GVUOOh5eyfghJjGzUhZWI9rJNS99vQQBnSEu90AgGzDI
         nBU66SBggvu/Cp1ohpwSTGwBf+Al34rEC0nF14bYCDCBkLhpOD9oTDJYcSFp4pNwsHeM
         vKu6Jg+iSL/rHcikgVE/KFuwEJsnv35om2W3QFqidtFfzlzGuNfI77NvQ6DmNAPVusvl
         8+gbWBORbZ+aP5aJamcu8aws9wRIoYzCUC17aHujAuIQO1qOO3i/Ci3mY6b3qW2GfClh
         1FGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734715071; x=1735319871;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdbZD6VJJqkFEO21ymFS5qOiPFzyVaYTPvnIpLlMFG8=;
        b=DrcaJmGOgrASvl9GgzuEzcklfV0UkZh54NDrDrDpXFYSHkYbGTA4+6OHN3AQprN02g
         6zqQFxzKU3pTJ4LSpyGdOnZZsyyRzwjdSWNLTPXAeFvVRlcmOckcqT5S+g+ENjYgW9vF
         ow696yJEVVXF8UveJwn+wBmNpJnA6vK6vgdmhcjGyZ3K9c+bx9+Va+2DvK8eFt8MfU2v
         pRc3+pNHxeXaN5AWU936Pki/N8h0ravk6n5s83+7YgDxVBeh9xYdRlG4BXNykrR5/iAE
         IrslCBdi+ZL7zXx8M/KspyHe1JFLTFJsWtzQYEn4fQaqQ0MYfrWwuf73FCIaCfPbdc+E
         9DMw==
X-Forwarded-Encrypted: i=1; AJvYcCUCCSDqxy9yRw9E8hOnM3umQy7+Hq/W5FYI06VaIE4lflHqQWwSqfbl9t8FQT4MD0nej6wEQXiF0dq28/SFbQnR@lists.infradead.org
X-Gm-Message-State: AOJu0YwKyT+Vpqf3XkxkfU3nz0Qd+694eE58uRA8kifqSANYRFVtT2Vi
	Bcxm9WtO6yr4K5mQ6Y9Zf3WD6RTrWUG4+i56n6daV+YrEpjL5zT0rhvSn/x949WVaLJuEbTwen3
	4
X-Gm-Gg: ASbGncvibJhWmEjjev4lYdK0qJGQBGTDKjxGB9LZf6wsscsYlXMy9MEgltisLv8yUO9
	eg3DUYlmL+i4HXtTNDTK6das02f4Es/TATtBkdkf6H8z4cKvslaS19K8u4egwuSFSII3uNoYGS4
	9FHr7vrGJpY4Mn7mqKcaknFtZ0WoGvLL4vrv+zDfcwFSVfrHtsjMUj6Ja2kVbqVY8x0WJE2Qrlz
	84X8ZmsYOZdX86Q2fi3slQoet+LTh7/4zzzndI4egXWDuV7Z8omcDijEyhV8r6Dqm4N8DI=
X-Google-Smtp-Source: AGHT+IF9f/T14X1AvJnEvREcpdS8/52lUJw/ZwFZojh7k/RDOYI+PqbwwQJ/BIYRcYtgDvOajktM8w==
X-Received: by 2002:a05:600c:3b13:b0:436:488f:4f5 with SMTP id 5b1f17b1804b1-4366864420bmr36545735e9.19.1734715070689;
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:c000:46df:1e3e:983f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38a1c8add5asm4432847f8f.107.2024.12.20.09.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 09:17:50 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH 0/3] clk: amlogic: drop clk_regmap tables
Date: Fri, 20 Dec 2024 18:17:41 +0100
Message-Id: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALWmZWcC/x2NQQqDMBAAvyJ77oLZNlb8SukhxjUujSZsShHEv
 zd4m7nMHFBYhQsMzQHKPymStirm1oBf3BYYZaoO1NLDELXo1piCePTxg5OmfIFyWF3GrxsjFzQ
 9Wz/bJ91tBzWUlWfZr8nrfZ5/bBey9XQAAAA=
X-Change-ID: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2325; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=0/1MgQhSTo4SZ2txed9gv05z9rFjmcWl6hwe7WthPg8=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBnZaa6K8PagUSRbBXNIVgWlwByGMO32kVHibKpo
 b8WCFcc5WuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCZ2WmugAKCRDm/A8cN/La
 hRnnD/9f3l83yXUjaKaPT3xakf3kCxkgRh9K6gtDX+UCd3ss7AQ48yYzWirHLZeG5I72h1v7rg4
 +kscCCA+mueRs2+syySFdvGCU1P5EYPn16fO38x5L6n1X7DyDHJtKvpOrireORtgu/WzTETV4Vx
 2uVGKKW9kJNkVGci9iTGNDkEjfKnILkArM5Ogobc/IRnkMgj/ePaQtwzxhRD5SISWa+qChE+Z8u
 cfRfqluWWkN4DTFoG7plqgTBDWLxVIOAHFSxQbvh4pZwsfcqIp5W+LqYkHUzIyvfnQcHWacZOnL
 fVvkWLFh85YYdUKEqq2dhvjqybkiB95jK4wgtqjwnRRSoK/MfmvH6NhFYFPxMWpzke2B/kY0d62
 ai+kR6LbuavihtRF0beq1zJBQ61K0dwsze/Z+M7IDuZ3oCELF5dGgwJatOmqdrC8TJ3jYXO2Szm
 POUns4BVhVQrle6Knpfxz7fZ8eUsrGNdx1dUEkoff0M53YCWvWQ28Xledd8petrrUguM6qiRm+y
 m6/9d6A29thmvYHki1E7HVz4BKO+VDM5GXB3Ao1G/6z2AZZS9iM2YKQlbQuZOn/WTvCxDm0uPVA
 8o0n5uwNq1xGZvI8siNMytDCiq50lIIMkuJ7hls9TbtPhyQPu/awUrQclDEYo81D7w28OdxNyFC
 44cpl3+jhYGv6+w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_091752_477225_FDCCE230 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

This patchset removes the needs for clk_regmap tables in each clock
controller driver. Those were used to populate regmap with in the regmap
based clocks.

This saves a some memory and ease maintenance a bit.

This is the 1st step in a series of rework of Amlogic clocks, to clean-up,
increase code re-use and ease future maintenance.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
Jerome Brunet (3):
      clk: add a clk_hw helper to get the associate device structure
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/clk.c                  |   6 +
 drivers/clk/meson/a1-peripherals.c | 165 +-------------
 drivers/clk/meson/a1-pll.c         |  18 +-
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 435 +------------------------------------
 drivers/clk/meson/axg.c            | 131 -----------
 drivers/clk/meson/c3-peripherals.c | 212 +-----------------
 drivers/clk/meson/c3-pll.c         |  34 +--
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  88 ++++++++
 drivers/clk/meson/clk-regmap.h     |   7 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 261 ----------------------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 393 ---------------------------------
 drivers/clk/meson/meson-aoclk.c    |   7 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   6 +-
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |  11 +-
 drivers/clk/meson/s4-peripherals.c | 343 +----------------------------
 drivers/clk/meson/s4-pll.c         |  33 +--
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 include/linux/clk-provider.h       |   1 +
 30 files changed, 172 insertions(+), 2093 deletions(-)
---
base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356

Best regards,
-- 
Jerome


