Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24867E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 20:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zAzNRdf+8/J9KdcDA9FBbNL/9MobuNkjfz385V8S/F4=; b=BuZD2450HolfVM
	L/gpVmpE51a5F4Kmllag2OZhIriaKuMf9Wk9Sg62tniRhSiA60CNOyQu4MUVvh3FvWqd67GrTWqdF
	/0idrFxXuybnB1e7fkxafXdNpIUYM4f+dOOGVn9imVWmqBq4AiEjeLurDaRo/FAsa0nirlSkvc25b
	ZNg4zuWdewifPJkX0buv0DMQt7o8y/4RXBQI9+aRVVWF9C+C0M8Oiw++HTofyAvnMJcC5Lm4fzUUE
	vYyRls4ClhJlJ7AQgcztxZBXv0OXQRlO4pivlNVRmTSYKWSrDgJaWDf/59otSwYKm+yDgeZClrBP6
	ixPjsxcANq+VGEKqcNmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBCg-0000000FbJg-1mOi;
	Sat, 04 Jan 2025 20:57:02 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUBAL-0000000Faft-3JEN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jan 2025 20:54:39 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=2kDknmXQOVXsYODL14SC1+Rd7+fXsrD+Vao+W0vQxxUUW8aCIIe+kpvS2Qs313iqeXY5poIkNyvm0inALrK/7Z1P0Ibey4MP2Mz4Jo5Z3Nnb4wHT/dY/EG95CqKr8/CuqZiqNG2U5ORJ6W7cvku2sSg/JsN264MzzaO0XER5BWplKdtZp5PIMcQQt15/N7sAs+rwiqng0NVz6asEO6IaMzzwdBQJ5yymQlh0Gj0z3bln547KS8awdg/ULvbeTAiA+ktjiabDVVaxhlZ7VbIdkbGY0fTDXH694Y1LE1o2GD5bCPOMfCVc28rOzDzN70SKI3+rcMwOh/9XOFQ5ECQoDw==; s=purelymail3; d=purelymail.com; v=1; bh=mGxD6iwFtmjZyF9cnW1NHIRS1yBMvIhooC1Hp1N/A2I=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 166263896;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 04 Jan 2025 20:54:28 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH 0/2] Enable CMU_PERIS and MCT for Exynos990
Date: Sat, 04 Jan 2025 21:54:15 +0100
Message-Id: <20250104-cmu-nodes-v1-0-ae8af253bc25@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPefeWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQwMT3eTcUt28/JTUYl3T5LSkFPNkS9M0QyMloPqCotS0zAqwWdGxtbU
 ACd3DA1sAAAA=
X-Change-ID: 20250104-cmu-nodes-5cfbd7c95f12
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736024066; l=944;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=mGxD6iwFtmjZyF9cnW1NHIRS1yBMvIhooC1Hp1N/A2I=;
 b=LN5tCyllQr3iJxSVRPhsL675StndfBt+aJFQf4pOgfuMeV6WzfdYJPn6cXJKE9W9aT7IpnHMm
 ROR/6QbhmqkCz4FMJ5YYr2BFTLED1tEjdCfCaEw0KksNBU8XiYbiqGO
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_125437_903519_CC7D504C 
X-CRM114-Status: UNSURE (   7.80  )
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

Hi all!

This series enables a new clock block and the MCT for the Exynos990 SoC.
The MCT design is reused from previous SoCs. It generates 12 timer
interrupts.

Compile-time and run-time dependency:
[CMU_PERI] https://lore.kernel.org/linux-samsung-soc/20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org/

Best regards
Igor

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Igor Belwon (2):
      dt-bindings: timer: exynos4210-mct: Add samsung,exynos990-mct compatible
      arm64: dts: exynos990: Add CMU_PERIS and MCT nodes

 .../bindings/timer/samsung,exynos4210-mct.yaml     |  2 ++
 arch/arm64/boot/dts/exynos/exynos990.dtsi          | 30 ++++++++++++++++++++++
 2 files changed, 32 insertions(+)
---
base-commit: 77c5a1c131c3e0c955965b94365e0e7727b37dc5
change-id: 20250104-cmu-nodes-5cfbd7c95f12

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


