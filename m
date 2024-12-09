Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB87E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eTa4RLSTyRHyCunQJukMhrz36f2ekSmipANYvSt/jig=; b=URga9RYirFzQjp
	CnL2P6MpAX0s62mk0jIU6pEeCVfdCF27ZcDljdvNDoZAmEtYNbmns2nMJomKI8JTrp6PUPKZxnauj
	VEgret40e+gG5psP7gordxbpgfhRDnwUB05Lc6LrUfrJH7nuj78W9B26fnZwufwxaaYPYaQs3wrLt
	QSyBlwS6/fLh1RLI7CixgwrjB1koGilB32IrndRX+oqShzeN+pgMiE8FTxWsl9t6sRi5cb8koLHhv
	1OTyp12hV6C5+FTdfwKZ/KmEu7n5bkpGSKOmM0x/rvHpKU1vOhlbvc4THzKKC+3MJyOAcBdhPOneW
	YzP1Sbq9SlmLBRy+FQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf5B-00000008Ghi-3qfJ;
	Mon, 09 Dec 2024 14:49:57 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKf48-00000008GTI-2TBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:48:54 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=omU85tSBO7Y1q8Jp3QkXwT+aCv1XLNNRnNDhMEk36Mctts3wts4Q9ocOoPdbLHhSiNcsorar1HeB2MCipsookfHTix9XiiKZahfHmSm6Gf+NclFawZGGxeBPG9WU91blZsjpMmjpkAPS0wrw7koDEJwbcK5okcJ1TBWXuMTU/pmFmVW15kWM0NlmkhLzdaVBe0VaOgSaMB8ZaA6V+RSIF1tU+kG/VELWlboGyWL7mxWxdapttCHEgqjSi60iH//tvQ83EJ3MH0A+S4C9DbyKV7GgtFc4bUM7ucWzOBVlFMelDEPod8poE517KXsVTjVe1lMi+2JAGgxljf9Y1+8m9w==; s=purelymail2; d=purelymail.com; v=1; bh=hh17fuoERmwRARxXBgfxrvHDUdhwDZCDEWgY13T37ps=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -291099510;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 09 Dec 2024 14:48:35 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v4 0/3] clk: samsung: Introduce Exynos990 clock support
Date: Mon, 09 Dec 2024 15:45:20 +0100
Message-Id: <20241209-exynos990-cmu-v4-0-57f07080f9e4@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIACV2cC/33MQQ6CMBCF4auYrq0ZC63WlfcwLkaYQhNoTYsNh
 HB3Cytjosv/Je+bWaRgKbLLbmaBko3WuxzlfseqFl1D3Na5mQBRHgUoTuPkfNQaeNW/uDxjjRK
 kwlqy/HkGMnbcvNs9d2vj4MO08Ums6y8pCQ68VEoZAwhaP649uQG7boroqEfrOusoxIMPDVvpV
 Hxyp2+uyJyACowiBGHgL7csyxvgLNW6CgEAAA==
X-Change-ID: 20241206-exynos990-cmu-58ada5056ad5
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733755636; l=1630;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=hh17fuoERmwRARxXBgfxrvHDUdhwDZCDEWgY13T37ps=;
 b=n3BbgPVNEwn1n+dt2NNprNcTmKWI55eTVgUHFTXMOkPkPjCCxxVMDf93F9LLt3h8pEOv/r1TP
 8/ttTbd6CPoB4sFnPG6Hmuh6ttsWaGrBvjCxmDwVmUFrH8KujfvLkTp
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_064852_788358_428BA1F6 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi all,

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v4:
- bindings: Use one-per-line convention for clock names. (Thanks, Krzysztof!)

- Link to v3: https://lore.kernel.org/r/20241207-exynos990-cmu-v3-0-20c0f6ea02f0@mentallysanemainliners.org

- Link to v2: https://lore.kernel.org/r/20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org

---
Igor Belwon (3):
      dt-bindings: clock: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1716 insertions(+), 2 deletions(-)
---
base-commit: ed74808ae420a2ae611738c2d62800ab157a9ee8
change-id: 20241206-exynos990-cmu-58ada5056ad5

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


