Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83981E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=; b=3NyNBdy80I2ObI4ZpGgNnIxE7f
	MMm4FZTZEGWx6H1E+WqcyDS50viTzUsxiyDE/RnZHsACEkBC0qbOJi1DEYPmVu8gUrdKzEYxebKA+
	RtVAPnhQfLEqqEFbRlj/uVzBJZ3CnZz1PYThfvqNvG9M2y3ieVNm2YmcLeQ/SCXh3AvEB+C6oQuHG
	3dLnjXz/yWMVAJtmrs+uBHEuKL9TZBWUI0g5fMwxx7zto8+89K3JgZZ+rxJkqCfHi+igm3S6kcCaz
	xTOJ2q3++rrwwJN1ZNI3NbR93/3R1fijVHSCtUiIoF2SNjqTZKMvyBAHMZdJSIvoLxyi6SdM6FY6L
	21VS2TZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXd0G-00000007vTL-40hA;
	Tue, 14 Jan 2025 09:14:28 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXcxS-00000007v0Q-0Dla
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 09:11:35 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so7984732a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 01:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736845892; x=1737450692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
        b=YQFPMyV1ZimBGKZ4sILdV4SjaNnMHGo1fSDVw7098IMit//P64Oraq75OyIIjtnriq
         y4IeFubAQy/yv4KYnafbubmAaqyMbxtBsFhPpfWtNz+GzNWB1HiYBArda6x932Efdbeg
         C2EdTRPKwr5nH+pWceoRuwfp+ofHu+MlN58q4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736845892; x=1737450692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tBJtngiebfYxaY6Xsqyz7X62QEYJt/s8BWutCfjsmVg=;
        b=NXjB4JhiduMwayLmfHYoXsqGLq1//+/ikw0NeDbVgYOYi+zi6wkZg/TyXo5BmgesmX
         PgOKgOOYGxjbcH4fMikz1/w42j4VPiv+FqQ54Bt5/S9OPF2nhS4zPkAKpV5VdQez4AHv
         cFTlY42qTTdbyMe/woEqO7hMzfkeISOwDPwpvWUW+Do47b3xPXnV5oe9nNnLCBaR4Cc1
         2pR/n7+EeekFGR6EmpcSjurifJH3beS5SRiHbtD/KLVsAIvr/K934XcDV1APLuzdeoHz
         rk8HfNp4TSXmWu0GB7bP3CnS5ejtXmgnMkpZ6zeZySctapPMrAY53Ao3bsXZ8O9XHXJB
         v0Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVgm/nggOQzLso6+Hi9PDbiWuKOoHSsQJNiKBYLDU7i5KDRHIP5n+uz90vWlScAfcV0af0IemvNTwh6dThwYH7n@lists.infradead.org
X-Gm-Message-State: AOJu0YwJCDADPcIPuJ3f6cvfXDK5BBweOW9DgYZVY6h+nQEUjzt3/i9H
	wv3JdMmNUGW4zwzvDWuMsV3Jb/wZ+axrVqaVfdz/fcSJ4qtcV/sUTOMgP8gOYKA=
X-Gm-Gg: ASbGncurq5BWHEDJRVEqEDPQTDqB+tSdyRjBxXmdqc9OWpleNZkfeBJ/yZUa+xObe4V
	fTyTSxrGRKdZ8m52jrk5Iwjc7fpVrgOJY9P1tbvKsSuKWKLzpVFwdQoSW1o01590kGUn5lxQyNr
	ytFRAvJ/oZd/otGzzyMP1ZCzouGd8Bkxr/JmhnAtGlK+mxxFWfNmXcnG0lym+WqqfyblXnZsceD
	qVyGTkY8LB0UJa9Nuwr0AZB8oMAAwIHQNjoQgySkGJHdTkpAMVIT5whusxNaXiS4tMU+2tNzSVq
	FjmxtANdIawicN3hENHbJQ==
X-Google-Smtp-Source: AGHT+IFP0NoB1nleymlyPhioCTpMBb5sIxJwE/HcZBxgMFsQqKGSpudKtOUDjpU6FXv2wGNPs8+Egg==
X-Received: by 2002:a17:907:7e91:b0:aa6:834b:d138 with SMTP id a640c23a62f3a-ab2ab6b52e7mr2115633366b.19.1736845892238;
        Tue, 14 Jan 2025 01:11:32 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.147])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c95b7317sm599640766b.154.2025.01.14.01.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 01:11:31 -0800 (PST)
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
Subject: [PATCH v3 0/4] Support spread spectrum clocking for stm32f{4,7} platforms
Date: Tue, 14 Jan 2025 10:11:12 +0100
Message-ID: <20250114091128.528757-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_011134_094968_8E7DD5B2 
X-CRM114-Status: GOOD (  12.52  )
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
 .../bindings/clock/st,stm32-rcc.yaml          | 147 +++++++++++++++++
 .../bindings/reset/st,stm32-rcc.txt           |   2 +-
 drivers/clk/clk-stm32f4.c                     | 155 +++++++++++++++++-
 include/dt-bindings/clock/stm32fx-clock.h     |   2 +-
 5 files changed, 298 insertions(+), 146 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.txt
 create mode 100644 Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml

-- 
2.43.0


