Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E83C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=; b=I2lgh0WyJgeueg
	AjvMPa3DCeRDHEclTJq9zJtbe8BZQSNj+MQAgXv7Erf8y170qaP5N6jXfR3E/UYsAyvkTnzTy7sbt
	ABGujtuVNctQX2UgR37v3/rZ5C8/ecaM2gHqClpX8YdfoCg3eUswWyDEoU4uB3EgMVjHXDt+vRpvL
	AsQt/nvGGP45okXezFFz2/jPLlw14gdEJCyUjPZWnfXziPoQKFbD8kzuWuIwA6YuSaCkpM+oQUEGK
	G4egdhJeyAv2EZaNymNp/gTNxhx18yMcdcJpNaCPLhoC1XfLHeJ+KvNJ2262BXV1QN4uCAMi5tpcL
	wiyVR4mei/PlVWe1L3Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJo-0000000Eaf9-2nh7;
	Mon, 29 Jun 2026 12:42:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBJm-0000000Eaek-1RrB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 12:42:32 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so21166925e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782736948; x=1783341748; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=kEYqy9LBW49yvBCUfXwiYxSTuKlr8qSMuXHeLYVWGEN6/UlRLAc5W0A94lw5UKFzWv
         Qd1RTNk1agBGP7UwQ0PmaPWuGHm6BHEjdVj/loyUKa50q63qGoEBvEeIoXLNk8vQ+zQd
         JlZvMOZiEXHkkLFNiM75HufOh+SDHlbMrCWzk73Zz0yraL1b1iNo5goPfFzvPuoTMfGJ
         W0RUCHW7INPmrqqs7p25M7sRjVjGNH49YsXfFp6GL5ZJHpYuZliXUp+m7+sReaigcl7x
         zZItg9u4hg4uKFU3J5LtruDL9kKTyMcBMLohGRMxrK6hVQ/0b1786pftQVPG2pV7q9Ys
         snWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736948; x=1783341748;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XQk6u/zxmHQYXaSkoQG9T9QM+F2QSnLo28ZDiX6Yck=;
        b=bh0EaUUUlcGFg7GL1MpNoB0zsHXII0D+enVq2DPkb8XbpglDUvAOralCEs/28wjOAG
         0NmRak43KigP3KPT5fcUFuqlGt7zjOJXpug/iQ3g7XhvPyhiomyzl3ilZz/PI+a74mAL
         +rIdLzwzzSeb28LlwWph6FVb3yy7PgZDlEp5bp3INm4sSTiZctJHWwQlAFH/E9gKn/kz
         VwPnXC9HXvjKBqqWUwt+frVaRZLRwravHe2b9N2F1Xq3rtR35THK4+7mHHOPdnlDE3zF
         45E+hxRswUOUibkEjqnAYTu7oU0zstHvOOtSX11Ej8SUCc937EfnfQ80mJ6ZCjkpxhYS
         XWoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wDA1GYLUt1VNTor+TXh5QI+ozxfJn6CcMC8nKrDVoeIeKvoi86ZiUhy3fEu+5enUyHSBuAJGe2JP4jhAp/oM3@lists.infradead.org
X-Gm-Message-State: AOJu0Yxox6fFisNs0ObXs+nH/rFSgIaj+DVTVLZt/ArtZmO/41E7uK9k
	qxwmoZqn/W0so571YFUIGn3gWyiK6t9seVTpYXJnepwcrpIdzRhpb8PDe+2fdZnIySs=
X-Gm-Gg: AfdE7cn8jfUMwOl3GbYTxj77HjgeWUUtNtV0vpvjZ3wXW+wUjHBOzLmBfrBT5BB7p7n
	VXb9GZ2inXejLL+QyHESvuepikPXhSYdp6Mb/jW4gj712/H7xTczez7rRS0LcubaRTkWVt44r3d
	P3MbKc4uo1lfkMTFvxgw/+V24be5abFezBRhgXZRZHrvqFfnZs6qPbc+/VBEyTpFP4svZXKe6nr
	rFSF2Yc/nFCZ40Dy+Rb3BY0kLHIlrLbZwc1Ug4qGMgcF1KMKAoRy80eDXlqhSL4NEDFYqWQ47+X
	/771B0v4yFzFF2aRKoncwlb0x0Uc/bdHwr5ZB1HSjd/UQKSr4YuHgIrwJRLPnWW+/1jdlpC0WAT
	NgGYJAvenQDt9hKSfJETMdl26kws5XzTmOk73Dh7eCQqozL2H+AneEXbWHNRursjXjPaqsM0Sdp
	YdrCZt8LEH0vA=
X-Received: by 2002:a05:600c:5298:b0:493:8391:919a with SMTP id 5b1f17b1804b1-493b71ad007mr9854285e9.16.1782736948492;
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d21:f5d5:2d3c:23a7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4926f94f213sm276368785e9.12.2026.06.29.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:42:28 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Mon, 29 Jun 2026 14:42:04 +0200
Message-Id: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1oQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMz3URzY2PdopJk3WRTQzPzlDRDk1SzVCWg8oKi1LTMCrBR0bG1tQB
 8LVc/WgAAAA==
X-Change-ID: 20251226-a733-rtc-c5167df14e6e
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=Jpxu3JhIRQUn0r/J9h/BIiZQMvK4hOfLEjUDM7I8VOM=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqQmgsLZoWjG/cvgZlCtaTSQlyh40bTtBK3tPuD
 /vjZphmkpCJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCakJoLAAKCRDm/A8cN/La
 helPEACuIP0X9qjYFDqGAzbzDm7fgzSYec6JBjtuY8SIhaIYa+FNc9lGF1OgsEkoQzgfbdkOP7L
 zI+/prvEt2N7oqAaLUTLfEW6LGKu+bcrYgmFudS/f6O5MqMTUYzHm9/j36vQLvhydzF4f9Y1Pne
 mZZ8IoXTrAkhvwsa4JQhR0k2qI1wLA0yHyJY32k50Pfqvvr5UG8GDsWkCfLQABKIboBiolOpxQ8
 KTDpRZH/G145BUKyyagMGkeVJjIqHPGI97EieDJVkl4ozgdKCGPUbW9jKEkBbO8UXq5odYObgpx
 +g4ZNaU81kT23qb/G1MLK8wPSFSEVO3qP/JGIIrGMzbKcUrYISZHERVQmdnwuGDWetI0M9CdX2z
 g4Ls5cXglJRTatUUltpxUvfiJBP8UZiX/tPpfCsS1fXIWRRg2rsz3wHgegXmlO4YSkulE/8AgmT
 8jg8MIJ4I1EZj7OD7ZeVRrwCwpmEAC9ZanJpYpN7k4rgtjOcLgE5ns3gtuH2nKdi9s4LNzIPUqX
 FKIm/DC8C2DUEP7bUd+6P9M44r4sf31b/c61qZ3Tu+wqxYNjrCvJIdR6zl8bOuC1JRfKoyIHlwY
 YSpRwTACAPjGg8h7icf7N/6/xOe+3B4gBFtqLpqloNeIvlYEN6wkpek8vLlxSHunLzuaLec6hv5
 yTkIJm/l07vOsMA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_054230_437146_1DB908D4 
X-CRM114-Status: GOOD (  13.32  )
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

Add support for the Allwinner A733 RTC and its internal Clock Control
Unit (CCU). Reuse the rtc-sun6i rtc driver while introducing a new
SoC-specific RTC CCU driver to handle the hardware's evolved clock
structure.

The A733 implementation supports hardware detection of three external
crystal frequencies (19.2MHz, 24MHz and 26MHz), which is represented in
the driver via read-only divider operations. Implement logic to derive a
normalized 32kHz reference from these DCXO sources using fixed
pre-dividers. Additionally, provide several new DCXO gate clocks for
peripherals, including SerDes, HDMI, and UFS.

This was tested on a Raxda Cubie A7A.

Changes in v2:
* Changed DT bindings as suggested. Those have changed significantly
  since v1 so I did not pick up Rob's review trailer
* Support added in the existing RTC CCU driver rather than a separate driver
* Added DT parsing clean up of the existing driver
* Xtal detection exposed by RO divider rather than a MUX.
* Dropped conversion to aux device for now. This is not strictly related
  the a733 support and will submitted again later on.
* Link to v1: https://lore.kernel.org/r/20260121-a733-rtc-v1-0-d359437f23a7@pigmoral.tech

---
Jerome Brunet (5):
      dt-bindings: rtc: sun6i: add sun60i-a733 support
      clk: sunxi-ng: sun6i-rtc: clean up DT usage
      clk: sunxi-ng: div: add read-only operation support
      clk: sunxi-ng: sun6i-rtc: split main oscillator div and gate.
      clk: sunxi-ng: sun6i-rtc: add a733 support

Junhui Liu (1):
      clk: sunxi-ng: sun6i-rtc: Add feature bit for IOSC calibration

 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml      |   1 +
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c               | 124 +++++++++++++++------
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.h               |   3 +-
 drivers/clk/sunxi-ng/ccu_common.h                  |   1 +
 drivers/clk/sunxi-ng/ccu_div.c                     |  11 ++
 drivers/clk/sunxi-ng/ccu_div.h                     |   1 +
 include/dt-bindings/clock/sun6i-rtc.h              |   4 +
 7 files changed, 109 insertions(+), 36 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20251226-a733-rtc-c5167df14e6e

Best regards,
--  
Jerome


