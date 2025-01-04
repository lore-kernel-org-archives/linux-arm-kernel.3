Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CC3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s5FuPgxSNd5WQO6u5D7FObKsOukhH8f/iKXH/2j1kzM=; b=0VXrCCvgjZK7gs
	cIh/+p2WFwAFzCXSrh5+8KT3nnTXqTwmAhXj60HG2LW+88Ss1mh7qbp3yjKKgJ3rd2aOLP1ov37IF
	1RwajtqUKVWEtO/nrt21wkB12TLRZ1ud9N1GmB2uBt19MatmOY9NGvQ5neDVzexnhIur90tIZOXVs
	gfZvC9YMJ0rSTx63nhGFmXiWKytmf872qzYtSbbjd7RG30gnZCEQdmdSpmLYcxEC5rYeiSl4PTdmi
	YMoGkS/9GV9yXcWWhik2YfSRKELtgFOJl/WTFvcyAqkW6o+Hq0yM5G2zgtKk4rurQ6tS9PwXlXjJ0
	rXhlEJsXgYzWzfbguIjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUARc-0000000FVEh-2jLY;
	Sat, 04 Jan 2025 20:08:24 +0000
Received: from [34.202.193.197] (helo=sendmail.purelymail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUAQR-0000000FV3P-2xPU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:07:12 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=wGES/bLDuWb3tSuPnT5lWt1j0C/PE9M/8w4fM4wxatWPGLejd4YlgCPDzEkb47TwbuwEquFXVlSxC9/UeXJIorV8w6AhWmK2edLKTuB/mrYaRO141a2Ja/UNKGS9bTlXD60d4MvH+v+JBjYwbvNXchu1uvUahJDlwhPcdxb/98C7a6eSRaDQIGuQkU4JShOSX8Ym4nDfQFXMe3Ct5FItmGs+8jhQIfJTbavLlfbAUhyuNmb8nWVtK9XtE1PFetWpTr2CmwD8FooZAjGmaqmb2VaoZ3J2vYkCtghcFYOg1Sj3MjfTfnjabR4PSqnNUw8fGSAzYzWBPb7++gr/6nw71A==; s=purelymail3; d=purelymail.com; v=1; bh=V/nUDPrqehsYT2yC9Qo0YHujbwIxs8k3Tqn1Wb9VDTE=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1683504375;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:06:26 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] Add CMU_PERIS support for Exynos990 SoC
Date: Sat, 04 Jan 2025 21:05:55 +0100
Message-Id: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKOUeWcC/x3MQQqAIBBA0avIrBNUdGFXiRZpU80iDaUwxLsnL
 d/i/woZE2GGkVVI+FCmGDrkwMAfS9iR09oNSigjpNAcyxtitlZwf97cSdQGlXROK+jNlXCj8v+
 mubUPGeh/zl8AAAA=
X-Change-ID: 20250104-exynos990-cmu-b1e45e21bb42
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736021184; l=773;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=V/nUDPrqehsYT2yC9Qo0YHujbwIxs8k3Tqn1Wb9VDTE=;
 b=zxHYCpPh2K1jFvPOnpsX72dwbnGlZ/N6TzwpwkPXkA1n9ypOs/OuRhG+K3ANsQ2kEd16SSA9V
 WoK/bk0Sn0eBhyxa9V7ruX+q2qgyiwvDbvwLj/tiUcG3ajwuu+pg+G+
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_120711_893346_388AC4A1 
X-CRM114-Status: UNSURE (   8.25  )
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

Hi all and Happy New Year!

This small patchset adds support for CMU_PERIS for the
Exynos990 SoC.

Best regards
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      clk: samsung: exynos990: Add CMU_PERIS block

 .../bindings/clock/samsung,exynos990-clock.yaml    |  19 +++
 drivers/clk/samsung/clk-exynos990.c                | 180 ++++++++++++++++++++-
 include/dt-bindings/clock/samsung,exynos990.h      |  21 +++
 3 files changed, 219 insertions(+), 1 deletion(-)
---
base-commit: 662de07504eff1a965b43a0399d6ff3fbdd6f7e3
change-id: 20250104-exynos990-cmu-b1e45e21bb42

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


