Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4363FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=; b=WLBkVCvvVS3IH2ZcO3sj8GxKhF
	5pRB6qZNpekCGPZAYlYeOVH5shqr2UdVz1m3GXALnGG/WnSYDvtxf++WhdusbTbJr3+qwIyDpkMkq
	1bvwpJJfhsPXrlm3ulwOcpI5GEHWY6ePCsH4VgQ3fbxRSAteei/G+8tNi7NW7IzJ2M0Bx3/cpWM3l
	2ig0/Uk695x9aeJ6mz3HUNBQ5BhAnDAPHUhHkaSHFA1Q3mCiRiQDlIGzk88Rj05gCcV2i8TAVaUMv
	R87ICXX2PeOIueD048lu63tw6gc0RgIXQ8qZvkqDOkMUHpmIDvvD5RzI23jI5OSYrcSElXBd7AIwX
	c6DPR+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmeI-00000009Y9q-3tnL;
	Tue, 14 Jan 2025 19:32:26 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlWd-00000009OkT-1EgH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 18:20:28 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso60420945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 10:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736878825; x=1737483625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
        b=EZ//X4EdmW6qJUBdBoEJsnw9NcTz34Wt5nMJfnEi99MADoYv6jlgc9UxVM6uHk3hTW
         wmzxDc7IVAg33ve7z7cWsfI2hVvMRs/CNJDXoo4wfdTeBY4zZQ08vwWudAsm9XiX1e3U
         Rv4B9bdnoGP8pGXdbcQ4OAjnJzLcQUUUDhkkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736878825; x=1737483625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GeNVBB/i2U4Nsgj/JNEuuNrVAFqI6yjOJA02Gh323ro=;
        b=DiBgTtLK6e2JqgRheT5Cx2mBoP0bzlzfxpBY1PNReAo8yDBhoUvmjv31QL8dn7gbYX
         s5XTjjprwWC2tUzNRNlbsmhdHOTVAgf4ULf8Q5qejEEj8tr8ncp67p7oGpaiAoMgEPxn
         U8OmC2utu8vn68AHvAii4fA+b456w7RjeV/0a2kJnr1N0HxFM6P/AfNJatgHwEGGFL7/
         DPcSbEdq3HZkXW3UJlQHhRQWXA8H/KqxjwdJyKfFCjVQzTg6ToYYdnWR0Er5wqzvMfNr
         6nfVPXsnx4sHmOb6H2tHRe59f4KfC/dgbrinLwPWx1+BVQq4E9kl1ZUaiD8ZI+LMFyOU
         FrgA==
X-Forwarded-Encrypted: i=1; AJvYcCV7lbbcKDuAV47lC90nA0cOKjv2nRJYd7noBYQ0BXuE7ctJiCzJkBXf8S/zzzA94mentjWcPtHNQnz0t5a41Vk9@lists.infradead.org
X-Gm-Message-State: AOJu0YzoeU/qr49az6Nc+JuJX8ySHwOWvmtXwjLTks648aMAR++2ZJBE
	pFR80BSaSOt2DTrB6QPkL89JBZmKFQVyOQb2HkPDiKZraohMWtr3iffvtoQjXy8=
X-Gm-Gg: ASbGnctGg40iAalPZIC+X7QKkqf5nwUHcFwW+nmQ2wQIMmSipOYjg6CBhz8qe7k1ckm
	fXQj6EuutoLSRRG0NyQhgLrtaqoqhjox4GezxJ+Iu68G/f7ZNE5IFaIUXXD/s3W1rbB5fWLghJS
	RoK6ORPMSs1D/YhWgYThlVq7neIDfpQZoG1epagM4C6N76n1YveiGTPW5DHf4AVawnWXsHcvn5O
	nZeIkSkuS5RTBw/coqe3BYFGlWCcgAhHqnj2VUxKuxXQmtGZYQL++kI2iKgdviZrkEJ/QHUpYGD
	xVmuZ8xYTXVt2/A5X4oCVg==
X-Google-Smtp-Source: AGHT+IF0OmB7x+n/pD4cD65liw1i2aC27PQyOn8ab2eaRaudsoa2gu0gSMltwYB/uF3S1FkWb2D2yA==
X-Received: by 2002:a05:6000:2a2:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-38a89066f45mr26441005f8f.38.1736878825526;
        Tue, 14 Jan 2025 10:20:25 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38be66b01c7sm278970f8f.22.2025.01.14.10.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 10:20:25 -0800 (PST)
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
Subject: [PATCH v4 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Tue, 14 Jan 2025 19:19:45 +0100
Message-ID: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_102027_359113_676695D6 
X-CRM114-Status: GOOD (  12.70  )
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

Changes in v4:
- Improve the compatible property in patch 1/4 "dt-bindings: clock:
  convert stm32 rcc bindings to json-schema"

Changes in v3:
- Changes to patch 4/4 "clk: stm32f4: support spread spectrum clock generation"
  according to Stephen Boyd's suggestions.

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
 .../bindings/clock/st,stm32-rcc.yaml          | 144 ++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 295 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0


