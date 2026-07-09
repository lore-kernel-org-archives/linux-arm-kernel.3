Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9FFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 08:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=67AqKQKJW865PkYXEOAEfQKn2vCruFW+ONJnhj/PZxY=; b=gzAEOOk7bFewPw1wUdhPZ/MW1d
	3H9W27zCLEWU0asme1tCbjAYsY8NLmXNZIz18cXsEqcA+XbHDvKpdU/MKGWcGp0bVs1jp+eFJHt+e
	HSkeHeh14MXOFoT2j5kiRHzfPzaWM73gO7jgyuZjxmvAiB27AQ1hrzJ6p6QkMx/uSw7Zv/qRrlV1/
	uJngE1226BO8JX1dQrYJM3g4cUNtsnPSl4AWn6dPXgkdOUO0QAmBCdcSMzN/Lja7FDShuHv50r8Pv
	6u8QMUv0O+3Eg4Zmi41OVbLCZ8hGi8gX8ZJWz25zOX8kH44owzEtqUiNY5j+9p11+Sbr/b4MA81+d
	aWweAuZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5v-00000001Phd-1hX8;
	Thu, 09 Jul 2026 08:26:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whk5t-00000001Pfh-1Srm;
	Thu, 09 Jul 2026 08:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B029643D23;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CC88C2BCC7;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783585612;
	bh=H3w0l7hrjjW6pdWG0bib0lwIpaQgQQxF1dBATULlBpk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mmmhD2ZqmLsQssTB6R9fn+yETQFaJ4/weHKnnXgWXewI6nAF7nvGgKSL/ko3rh0EU
	 EmVlPAPpnPnxt8TA7ltnWMsI6FiNI9h/MKL4FpmqDPheIBMi8gDaZvhRYRhKcpMmkK
	 Dz0wki97eGPxp9FuaVdoCploB/+qCPJAQm3kMJF2XVNxyxkETI3aDwAF2Gm6sYz2/7
	 Tnn39xAKAWFzciZEd4wWxSExiISVoCFIndKsCzGlUENB/tQQM1BJne7B4tbTNAXdAB
	 hEZrru9qPOUDzILMrPpy3PV72cLAKMSc9P/pFP0dNvjF41dxMQ01iY1913mwNZG0kD
	 3Mi4MLqAUAz/A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69E98C44503;
	Thu,  9 Jul 2026 08:26:52 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] reset: support reset for Amlogic A9 SoC
Date: Thu, 09 Jul 2026 08:26:47 +0000
Message-Id: <20260709-a9-reset-v1-0-fd7cf039b853@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEdbT2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwMz3URL3aLU4tQSXctkY8tUi7SUJAOzFCWg8oKi1LTMCrBR0bG1tQC
 MfgGxWgAAAA==
X-Change-ID: 20260706-a9-reset-9c39e8fdb06d
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783585609; l=933;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=H3w0l7hrjjW6pdWG0bib0lwIpaQgQQxF1dBATULlBpk=;
 b=dKYqDjYW0xtchgfDyokC7WrSeQ1iXnOt2qN3/i3l28AB/hNGg8tUAE9McgzMVqe7fT5ApDir8
 Xa/ZDc6NLucCYu4hq/u+kBIe30tg+1iQR3B2nYbX1OLRUkhAN1qrt7W
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document the reset controller compatibles used by the Amlogic A9 SoC, and
add the reset configuration and compatible entry for the Amlogic A9 AO
reset controller, and add reset node for Amlogic A9.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Xianwei Zhao (3):
      dt-bindings: reset: amlogic: Add A9 reset compatibles
      reset: amlogic: Add A9 AO reset controller support
      arm64: dts: amlogic: a9: Add reset controller support

 .../bindings/reset/amlogic,meson-reset.yaml        |   5 +
 arch/arm64/boot/dts/amlogic/amlogic-a9-reset.h     | 247 +++++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        |  14 ++
 drivers/reset/amlogic/reset-meson.c                |   9 +
 4 files changed, 275 insertions(+)
---
base-commit: 4336e970ec6890fbd424128c352564a9c1dd514a
change-id: 20260706-a9-reset-9c39e8fdb06d

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



