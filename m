Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2927DC28B23
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 17:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2C3Q4X0ItteLgwsYwLeWkV0M/heHOWfCW36IRAvXlAU=; b=xC19m4n+eOyr5X
	lJOcMzzLSL5oBkmdLoQt7TtW7fLPZBZyiZS4E+WiWYidM9oH2VR+1y+uwu6niUtUxzUHZs/CBQjFi
	bZrklT2S77y73s51VY21fwi3kQMN03gRbQ7YkLzTCljC8iyg/2Ae3RrvhDiysnYDAwixXaXnXcCCh
	r5LB2wkXsjBV79fO7SKXvpWgD9jSg7k7ks/wvbPYG29KuonX41U21YwYPl9dAuUr2EY3S/wg9Ep/T
	bgtmrg/Ez32C10bEgcTSK8a5ct1zggJkCREETJarQ6FlhYrM9cby+I5DnHoBUgC7RzmuwNqdlhlTx
	5D58lTkzslwvJd9P9FjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbFz-0000000F1CY-1MXP;
	Fri, 07 Mar 2025 17:13:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqbBZ-0000000F0Z4-30Z0;
	Fri, 07 Mar 2025 17:08:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E86BA5C5944;
	Fri,  7 Mar 2025 17:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACEDC4CED1;
	Fri,  7 Mar 2025 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741367312;
	bh=rDDTdWoW3F3zLKcm1y89ZgAulGu1KIWL3Ub3VEnBd1o=;
	h=From:Subject:Date:To:Cc:From;
	b=sz4TdbAYn8qfnLpUX2pMwFYNhjck5ipk/K0NTtOi4DHV78+SLm3CWDoNwth6erWWz
	 Jd9yPAs/mynFZzCGf2yHr+y6NlBrX7WyH9W5pKSW0K4px0/+TUTk19+s9XuAEVoJsN
	 /RPRo7/Vf93OgCwzCSaYuoud8SRT/s8F6Lzkl/XaAUFF6HQh7CpD7SYFizvEd0aDVC
	 eU1N/8xaYKL/+oPxRZxcgBiTEjBXfKE05sYAWaOmwfwRwmvgUJQJRt3G9fnQVPOeab
	 sv7Sfl7fAgmR66QIIaZDcqFU9AZCW2jgJf16fSSiiDQ5rUIu0Q3TBGPdjO5CwjVt61
	 vmb9izOLHOavQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
Date: Fri, 07 Mar 2025 18:08:18 +0100
Message-Id: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAIoy2cC/x2MSwqAIBQArxJvneAHsbpKtCh72tuoKEQg3j1xO
 TAzFQpmwgLbVCHjS4Vi6CDmCexzBo+M7s4gudRcccMwGL0I5hNFlofgLF6KW4PSrtC7lNHRN57
 70doPPuGuwGMAAAA=
X-Change-ID: 20250307-en7581-gpio-range-fceb30c7e2c9
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_090833_817847_6907E544 
X-CRM114-Status: UNSURE (   6.77  )
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

Introduce missing gpio-ranges property for Airoha EN7581 evaluation
board

---
Lorenzo Bianconi (2):
      dt-bindings: pinctrl: airoha: Add missing gpio-ranges property
      arm64: dts: airoha: en7581: Add gpio-ranges property for gpio controller

 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml | 3 +++
 arch/arm64/boot/dts/airoha/en7581-evb.dts                            | 4 ++++
 2 files changed, 7 insertions(+)
---
base-commit: a8a297e8bb3dd304cac77f7c435a4983d885a657
change-id: 20250307-en7581-gpio-range-fceb30c7e2c9

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


