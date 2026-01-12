Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C877C9EC94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 14:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wi9ORL6/u5L+ri+CyR1PVolHDXmhzE6rUlvUG8jfWHo=; b=rdR9ye8ed2R8h3
	qE79GTr/Vktcdg6BIp9/5j3IhJBZ5s/1XfZO6NomSS2nGyFEmEdi0Od3UCrzJgiBObidxs42rkQg1
	sk2JyMmjqikSQYWxFBXxY+j3/wMNi6Yy6MZgNqW1S19OPWtQyQ/fYbYqQHdfi+pvPizZXMGHOw72Q
	0TVlTCIqZaYdvSfPucdI8wwvr2oVEeM9mnhFA+tTDs2y5VbI1qGr1A1O5tZAjFwV1Kgl0crVbdiMW
	BVz/Xe/magH0nM0HJzEzymBxEvZTS9VYnqu+cvVpo4Wl1L5xidPqjdEBc2ezSGG4tvGdaevWR4juH
	8tT6LMDPIfeoIx/1mv1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIjA-00000005VHz-2rJt;
	Mon, 12 Jan 2026 14:17:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfIj7-00000005VH0-27m9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 14:17:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-42fb4eeb482so3667031f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 06:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768227419; x=1768832219; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wi9ORL6/u5L+ri+CyR1PVolHDXmhzE6rUlvUG8jfWHo=;
        b=yuoPIbNmVlx3dRM9TWXt4YppbnUA5gG6UNuvJkHnN3M4YOePB1D7+YLflv01BP+HBe
         zj3BKO2Vc9HrOAipuM0Ft+ntGfKnAXfkNNW3gq87nPH9bo6gIx5YpfNLJH63xSc15Ei1
         uzvMHo4ijqo9w9NS60vkyuaOPFBBNl/EplIv6HvBjKK2t/FRbmXCU7aFWvyxGdXMDytW
         ZB8yf0IMuhpzByfLSu/EonsXjJZFVAMqLnfCLFNjg9vsHaFWCEzRA+Rq7WlKu3fFahHq
         z1hWeie0bZcXuT7g8uhQNQK2CXiyYFtX97dE6VpdCKxYcYkkqX/lOtfmsT6NypauP9zG
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768227419; x=1768832219;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wi9ORL6/u5L+ri+CyR1PVolHDXmhzE6rUlvUG8jfWHo=;
        b=t2xohKfGeWsKqwEYuNlxIHI7zd6o/Vdzp3EEFhViTPUHD868aK2+IRQsCtsC0xlu6X
         5fv1nEox1xuEAEDV2M9+481yZDpFMylKLaCPBMJQLX0gpWGZv3vbJrn3xKi6+8iW8l04
         HkWGh1iXCupL3bqwXY6anjAjNowmV7sqIG0ZTvxjdn7PxAK0pUzUeK5lL+PVaUZ33geJ
         BJQN+rufxsAremaEtuizYl3oblC5i/r2mRw4EBq9HAH5JJODHOjaZM138G50ZJ6Wv0lr
         u6H7OV4UB2KDrRym6G2vvxL/uHbtcfmHZN1vM/LxuLztghnDxRRSziDIWwsIuHqsFn/i
         gf+A==
X-Gm-Message-State: AOJu0YwULTFEnKvCQAPyg7WrqKspUA6ZBs/6hSs+3K5avka2bbSzl2pp
	PnNzc7k+VcG1BCCDtwZvfi/DhKtVpPhk0IiUo3ujEamsCBajEkxxMP+1lgFmjBucQBA=
X-Gm-Gg: AY/fxX6KpWwsy2ShIqjoMwFtw9FQhVM4HHP2PhiPZ57iXE2lnsveCxdGuWXNmINJujA
	TtmUaGShL4FZa72wt4QaYMXTk8CtcSWQN/KMkR6xTCWicOZzpeyYue+aVGkrDPthHL8vnv6edvW
	UMpsFmi2oJbhuHmAQZ9CzGDcsp/0/GCkEKqw18exYQYVUb8TvcYJjbMr62Nr8efPqFYPczPVFKX
	teMurQBws2GxdEOjv0kG62NLGfbhVe1rpl2G7f/ZcdOKOglIwp92+xahvtO4xUqHeYKmFzFw7f7
	E6U+iQZ0vqOAAS/KYcleCuY6KonDTftRiS//vF+Ne6pyreXiMbf0drg1a19HMRp2Dgkcz9wZf0E
	tpofWxTh6Vwp9v3vagcoMsLFbU/IZyu1+cPn4Xs9fLheXZ6owJoKPBCQ63njzNAzww7lElySvT4
	u3k6d6mCpA6mdfKOXAqb1uk7ZC9Nkw21Hhiq4Pz2/n4W4Sd0JzVQeZmj0=
X-Google-Smtp-Source: AGHT+IHQ2+tO7amZ1Hd3lau7QeebQejhPMBwIfPvu9lcXcu5kw8U72PL8snBAclb+6f2qXS65G5ttA==
X-Received: by 2002:a05:6000:2586:b0:431:752:6737 with SMTP id ffacd0b85a97d-432c375b134mr20238261f8f.30.1768227418552;
        Mon, 12 Jan 2026 06:16:58 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:3122:c601:4c43:39e0:348c:a72e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5dfa07sm38705096f8f.25.2026.01.12.06.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 06:16:58 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/5] gs101: Add support for Display Process Unit (DPU)
 clocks
Date: Mon, 12 Jan 2026 14:16:47 +0000
Message-Id: <20260112-dpu-clocks-v2-0-bd00903fdeb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE8CZWkC/22NQQ6CMBBFr0Jmbc20saFx5T0MiwIjTCQUp9BoC
 He34sKNy/eS//4KkYQpwrlYQShx5DBmMIcCmt6PHSluM4NBY7U2qNppUc0QmntUZe2MbdE6LD3
 kwSR04+ceu1ZfFnosuTn/ZM9xDvLaD5P+2L/tpBUqrS06tCfytbsMPHoJxyAdVNu2vQHcK/OAu
 gAAAA==
X-Change-ID: 20251120-dpu-clocks-7b825d05807a
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 kernel-team@android.com, Will McVicker <willmcvicker@google.com>, 
 Juan Yescas <jyescas@google.com>, Doug Anderson <dianders@google.com>, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=JgfZ7b5grfSFrY2uNGn7XAOdObSUV8Hdp8wFhFtHqAs=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpZQJUgcJ1b1TNz39ppcyhnd3oPqJ4xJI7Lt6DD
 I5Z+HiKa4eJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaWUCVAAKCRDO6LjWAjRy
 uiRZD/4uni/IFLPMrxZSAE+mLtncreOXd32tYdFVDOlRFulzcXvfJdY1b//zNAbEf5c1WZLk/m5
 TA/sVbReP0+peU9IAlVlSLvkdHhtAWsvkyHlzTENmIv2TUwJY0+/nbefuWNvLUwv98d8ZwJiXRo
 iNrbrqy7mn/zwsRR2WSmji9Tx/dE/tCZB5Q9EbD3w5yACc3DNJT78YFX9QKIgQozwM9JV6yZAiE
 cQyeok8cqr9Zz2S9tKfoxfKIWAxAjCDhiDPX+Nb1sOEDxDxuqV8NXTYCiC+efQC/cMttsnBLh7M
 i+3JqDtOcWPN0WnnBUAD3hB7QO/fWGJRG5zGbH7pPNyLauaAF9D14Thz1yywZ3hUN71oI0XS3kP
 +Zq9jMz7LkQGAwzpFgQwnCau1K9j3KxNPcW5WY6T9/3QQ0iCGfWLg3pB4Dy7+Q56l+IQJegI2bF
 OPpyighroZX36Wh8S1qoFTxfqrElMz3jgdPZu65vnrxzSrjjXDP5gDMRRZ8Zft9gz2Qdkre81FU
 rivsDSPvxBRI//sZ3Py2MXzQRCkADN5ApC7YsBZcFtK4HMPWMgq/c+Xfo3s9vdUOT8Eneg2TkHa
 8ib8hXHMdavuwNAE0hSBWLp2BER4E9FPn7o1mLDoQz7yig9vBTl8CZYuX7hqolfQHXfFWpQ0Gdp
 vj5nzkmRDIFB2Sw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_061701_581339_DB590EB0 
X-CRM114-Status: GOOD (  12.14  )
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

Hi folks,

This series adds support for the Display Process Unit (DPU) Clock
Management Unit (CMU) aka CMU_DPU found on gs101. These will be used for
the IOMMU and display enablement.

As all the patches will go via Krzysztof tree it has been sent as one
series.

regards,

Peter.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Fix alphanumeric ordering (Krzysztof)
- Update gout_dpu_dpu_pclk to gout_dpu_gpc_dpu_pclk (Peter)
- Fix dout_dpu_busp parent (Peter)
- Rebased onto next-20260109
- Link to v1: https://lore.kernel.org/r/20251120-dpu-clocks-v1-0-11508054eab8@linaro.org

---
Peter Griffin (5):
      dt-bindings: clock: google,gs101-clock: fix alphanumeric ordering
      dt-bindings: clock: google,gs101-clock: Add DPU clock management unit
      dt-bindings: samsung: exynos-sysreg: add gs101 dpu compatible
      clk: samsung: gs101: add support for Display Process Unit (DPU) clocks
      arm64: dts: exynos: gs101: add cmu_dpu and sysreg_dpu dt nodes

 .../bindings/clock/google,gs101-clock.yaml         |  25 +-
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   2 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |  17 ++
 drivers/clk/samsung/clk-gs101.c                    | 283 +++++++++++++++++++++
 include/dt-bindings/clock/google,gs101.h           |  36 +++
 5 files changed, 360 insertions(+), 3 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20251120-dpu-clocks-7b825d05807a

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


