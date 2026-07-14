Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C804BC44507
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 05:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uLqt9oBztUbvRv8OAQ6eZQm+Ad2L2smZE47dXioClZA=; b=TwLzYhUnfcv8Rsgih698LP8+zr
	U86tNOSXOZDqhy5l53FkmWodONEVrz2HdJXHUUW+t84WNLrthyxGhudLZ0a02RQIkh2lzl+LM9bOf
	tp8Ht8LMy6ZdLwt3KIG5JdZvtw7VY65sEJrcIo+qyLtYkuhFDYNDOh0HzTjmwWoJnZg1gAkx4jEUO
	9ieM+ZcRnUGw66Aue1+EpZGso2fzW3WskNL9oUpsnH5Gwg7XIJuK5cDlw+G9z7Jt/6LntJJ8Nn0aL
	axHjTlbozaRD3rH+yhPeMCEDXKtSZDk9faMHoEijZ3z/t5pL+8KIxMU1e2RdDLfR9DeF13J81epQg
	BRGEqevQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnE-0000000AxH9-2rOd;
	Tue, 14 Jul 2026 05:34:56 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjVnA-0000000AxDT-3ZUo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 05:34:53 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9aea40d799so263300a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 22:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784007292; x=1784612092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uLqt9oBztUbvRv8OAQ6eZQm+Ad2L2smZE47dXioClZA=;
        b=OMW4o2a/FNkHrh5nH5CDDMJinnMBRfDZwW4KrlcMshonvCsSWff1Tes9P8cwCccwBW
         /vHQorWhrSdQUwxt0RGDemtJwt5Q23UR5AjbaK0JqdEEirhBs2IxK8g5MNHjwZEBc9uK
         hdaoG+nIjfpohRi057hT7zNDLwFKjnkQGN+Ltgmue0A7gBB9XXjdTAnnGMy+xYXja3g4
         7EqNgWEj23VAy9/5FmJQPj6myuzHQJNJj3He8XK/N2xozQkjWR2ARDlswmlwqOAFAFnI
         qH09A7ebi51F/H9hd76/t4tJgw5V7zklqnwozjCz0/33nkLU5aT/QU8v1hqmRqKAZTLa
         tA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007292; x=1784612092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLqt9oBztUbvRv8OAQ6eZQm+Ad2L2smZE47dXioClZA=;
        b=Njmg66v4cj8ul4iKTjM6aCBrsNDczA9Sm7luvXA9mwlciLUBKOjzYO59Aemsz/tRkD
         apwk1eMV3CGKMZx7/CC/NxHama9apqtmgtNHOX9mq8ZbNWoRJsuyH6ocwe+UjVWrwese
         pqgzt0LV8H9jqdICPxoIOcg66jG24ejRMDhIjQ8nIV4RaIfnSa8Hgz+yVnHFBpdsWjKE
         EFjk8mlwHg4jS+tCxgptQC9PSSNsba1iuk9cg7jUd/hE9/BDrmY6qyUHmtafL95hN1Hn
         BVWLUNVyTlhF0hJDxsa1U2aFhqoP8aCIPybPNRfDd+y4NRmCYhfg/Mnoohv7/ggk12xH
         z3TQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPMClJ51zTNsgLCCUzRUvZXHEA6jhoN+aHRYQc3o2jOs1y0PtVWKBf+xxkcGcvKK8uIbhfmgEhkggQhYozu3Pj@lists.infradead.org
X-Gm-Message-State: AOJu0YxVFc7l5u2WguyMjFxvXwsc0skYB23NVJhzn9154HReBrOKPEbz
	CnZd/2KozBf0VicefpRyPGILB/25SLXVO1taKU3F7g8E0Vcu9KXWZT2U
X-Gm-Gg: AfdE7cl4F3M++E9seuIrnHv/q9buPwlwYwHepnQTZIXN3gWueNZjc8L3OhyoQnatNES
	ilAyby4/MZCOKPd8khUycpgMoWAWbCXDCVDH6darPJ09H9l3Lle1PjCmFQbHglJ8l9bLWuwL+gh
	uzJSmdVVQ7rk6XmvawWp3yUFdaOceUhyXOfHqz7MpjtfEmFALcS91CILaDTT7I08ot5V2m0U60y
	yHFoqVjsAppTfEsgFPkcvVKxRSwgYJwveUf6Sy9KbPE0ZFDa7zubF4aqj3dJ2+SSssbem1O7oNF
	T+0e/PFyMiZLUUYPPyhfyWC8LV7MmIVZjdak03RB2U+41LkmMqJv2r9SAFRHDR4u7SzNrRNxBFT
	rhxAO3I/7eiIwMFE0FJtLYwHEDAOFoSeZGRVC2Hcs4xzBQCZOfVH+Bp6o2t6Vsdv/MfcrYlcpb4
	Cby5p0i3lGUQlh59MPEOha
X-Received: by 2002:a05:6a21:b94:b0:3c0:9c1a:8950 with SMTP id adf61e73a8af0-3c110b34e5bmr12358936637.72.1784007291897;
        Mon, 13 Jul 2026 22:34:51 -0700 (PDT)
Received: from i386.168.1.127 ([2402:a00:163:2ce9:6882:91b7:8e79:7958])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm131882715c88.14.2026.07.13.22.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:50 -0700 (PDT)
From: Hrushiraj Gandhi <hrushirajg23@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hrushiraj Gandhi <hrushirajg23@gmail.com>
Subject: [PATCH v3 0/2] arm64: dts: rockchip: Add Vicharak Vaaman2 board support
Date: Tue, 14 Jul 2026 11:04:37 +0530
Message-ID: <20260714053442.265587-1-hrushirajg23@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_223452_901131_99BE6FEC 
X-CRM114-Status: GOOD (  11.86  )
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

This patch series adds device tree support for the Vicharak Vaaman2,
a single-board computer based on the Rockchip RK3588 SoC.

The Vaaman2 board features include:
  - RK3588 SoC
  - eMMC storage and microSD support
  - RK806 PMIC and multiple RK8602/RK8603 regulators
  - Real-time clock and status LED
  - UART serial console and SARADC

Note: This series is generated on top of the Vicharak Axon v8 series.

Changes since v2:
- Moved 'compatible' before 'reg' in the PMIC node to follow DT
  coding style convention.
- Verified with dtbs_check: no warnings.

Hrushiraj Gandhi (2):
  dt-bindings: arm: rockchip: Add Vicharak Vaaman2
  arm64: dts: rockchip: Add Vicharak Vaaman2 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-vicharak-vaaman2.dts  | 547 ++++++++++++++++++
 3 files changed, 553 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts

-- 
2.47.3


