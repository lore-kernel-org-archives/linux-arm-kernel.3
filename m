Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5778FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 21:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=; b=OErcY8jwTT5pz2GTQPvJjuUOm6
	daeIfAfwsguc69n7w23jDFYMW2mTjzEZMYYKAUwc4/K32ysMMc2oLB1bHi/P8rAWuOp5uuRS3M1o7
	p1vOAiK+DRlnSJ3SCAlVdcvEPXyCJ/Wy5lsMDKo0csJ7a3HCPxtxHoBuA8U/amO7KvK0h/fz0Vf+1
	C+rBg18PLcowyJ7yObiAgFiNbSFDWYbByB2d3d8z3nMO0UoeWWG9yOvYH2wWY5yAbOasHd649X/Ex
	3ypAzWdkfj7EhE2vC0U2vCOqSM9c6dHvlxvhyJTJJnLpWynFUxkULgQZqoyZNhUdRd7c10iJcndJ6
	K90yEmmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzxP-0000000DLoy-2Tye;
	Thu, 09 Jan 2025 21:20:47 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzvv-0000000DLPO-1vYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 21:19:16 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5d88c355e0dso2269594a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 13:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457554; x=1737062354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
        b=EY7LpFqTJAzH/iL5U7AXXD5/5oxjB1GnFpXVqgzOh3dJK9niROYTrOo+8xhx002PaW
         FwSfIDz7t7LR92ZfkcdeEA0NR36sxX3ZipLXNv5yBpTVBnCKp0pay1iuKFyjo335tgbl
         bbKV+mRnxeFA9xSZwdRs3mw5FJKNBuD0g6yRI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457554; x=1737062354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYWwEHMv7Pi4/aMuIfIEd0m898Lr2Kb8/a+FILyxHPY=;
        b=P0CI1/mpmQYeQBI26pePOs0WChzWmYlj1qCmoI+5gttRND3mVa2gPXhdt3QsPHfHoO
         LFs4zXNvBEKaLO6h2iTZSL7W/I8xNXiCM1ER8n6XtgaZh59foDYb4xt9XV8/pGxdndQu
         F0TgKKOQZY2PlFfJJeEw+hUqsBZ4KlVlShr7BkO1O0JG6jsAqG8ks9+t31w7J8SheJrE
         v8N7FYVXmrhNeVLSwKONgl3w6QUm7vrJohvud1Z/02PbISScqAR9Gm1W7F6LyW57FI16
         tmXmU/AI6L8tXAKdI/9+dgKWm+nK8M0ejTWpC2rNREzzUZo04HoUwpT/jD1JJqGXHMqZ
         q/zg==
X-Forwarded-Encrypted: i=1; AJvYcCVS/+9po1Uy8Imkf7XM5tBZbmFpA1ub+ZYNK3uNbWyyQSdo1RvnM1/sju+P5yEXMhfGxps0wPEFDwezhdmYTY4P@lists.infradead.org
X-Gm-Message-State: AOJu0YzlThwYVtnCgVY193p+S7cGDhlNW81LLhPzUmyhAx1zSmZnNthA
	L5zgSG4+xzgCVGSPxjSC8JQjf/MjGBYfoXcyeIllCW/HEk+B5w2dQHLUpgF4lfY=
X-Gm-Gg: ASbGnct4jYbxROM/KnNCd7uYQG/1NZqMO5aQmxPwo4Aiy6/43KweN0SQJih4sBmrOzk
	k8Zy7CeF2Cnyi2uqGZFM6QyZ4JF0vLI3uHGHzhZtQgqyIjN2hHreTMcI/CvUqPwQ92qnEAeGf4y
	jHHMMx88vzoK7DP7chjSuX1wN6Qp6Bu9KPRe0aAaDIKGrdOFxZG7tZJiUmcT1daevQemw9Okq57
	5CJ6TYPfSHsa4KNIeWv7CU62c4Su3cY6Qil2nsqc/hcq705ItRyqRKLoWhysILCqd1gUJpymUU4
	kimdETCXAC7g3VfGsdvuRD9c+l10qB0iv+KW8JO3kTXIuw+SybmGNmZYoXFza8c1112i2VAm7VR
	jrvhJBvmlOQ7m7J6TvA==
X-Google-Smtp-Source: AGHT+IGDVisAyEQwSigpcUtiYjGMdYnHM9AmzlwjHAKTXZuLBmm721gRf+PfVKaw25o+OkloXI5uXA==
X-Received: by 2002:a05:6402:430c:b0:5d3:e45d:ba7c with SMTP id 4fb4d7f45d1cf-5d972e7148bmr6635147a12.29.1736457553855;
        Thu, 09 Jan 2025 13:19:13 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-79-41-6-15.retail.telecomitalia.it. [79.41.6.15])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9900c4b56sm925567a12.32.2025.01.09.13.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 13:19:12 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Thu,  9 Jan 2025 22:18:27 +0100
Message-ID: <20250109211908.1553072-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_131915_494644_260FAD42 
X-CRM114-Status: GOOD (  12.03  )
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

The series adds support for spread spectrum clocking for stm32f{4,7}
main PLL.

To achieve this, it was considered necessary to also apply patches to
improve the documentation (conversion of `st,stm32-rcc.txt` according to
the json-schema) and the code (use of FIELD helpers).

The series has been tested on the STM32F469I-DISCO board.

Changes in v2:
- Fixup patches:
  2/6 dt-bindings: reset: st,stm32-rcc: update reference due to rename
  3/6 dt-bindings: clock: stm32fx: update reference due to rename
  to
  1/6 dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: convert stm32 rcc bindings to json-schema
- Changes to dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking

Dario Binacchi (4):
  dt-bindings: clock: convert stm32 rcc bindings to json-schema
  dt-bindings: clock: st,stm32-rcc: support spread spectrum clocking
  clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
  clk: stm32f4: support spread spectrum clock generation

 .../bindings/clock/st,stm32-rcc.txt           | 138 ----------------
 .../bindings/clock/st,stm32-rcc.yaml          | 147 +++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 298 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0


