Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0393CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 05:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wiywbGUArM2TQ2jnZnO3jhnLS3BT0xyRgYF6NOHEeCA=; b=4+PH/GNvPm/YVs
	Cr7G+KL0QdRGxnj5YQ5lKsEgUPGXnHzvAk8iOfzkojQv1OC0KtCkYi8a15eABNJo1MdGF5xGQgKZ/
	7Lp+NUtaqNL7OmEaQw5I65h83EfVNIMRoj1CCvykkoewp8Ss1Ec4FgfMD6x8ooRMznDbTPTNbvb+0
	hyvBANX98sxFq7Sub+otHpOEUAiGCGV5+DI9E9yWzjjM94ieMBdAZCMIsonWTXOx7Agl4ddAQ7xeL
	s0P5d5VjSKe1Fr7QYLv3FQk3SAC2N2FePZHh6iIS1+BpFevHhJq7Y14xLsYppKs6rA7ts/nXFrWzK
	xY5M6nECawpIzewRFZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N41-00000007BZC-2FA6;
	Sat, 27 Sep 2025 05:01:41 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N3y-00000007BYW-14ag;
	Sat, 27 Sep 2025 05:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758949150; bh=wiywbGUArM2TQ2jnZnO3jhn
	LS3BT0xyRgYF6NOHEeCA=; b=iQ9cw2vI8QxFct2o8MH27UteoPUKwqq19TixtBcEwsWZGJXIdq
	W+IWQ6b6ojLpdK0cUC35hXWVxILAlAwTKm4/bbjKZq2zOLIaRHmboo8GLqDLyE5No9sv+4ymC7l
	xIF9FJ+CZPoa5Laeq15iWmphoRDV5oMClZe+xBcbUVs99YZRKO9VqQD4fBrLnQ53aTbUOEw5gwN
	DY0KP9dyR/zfc8/gYlrRoZ+QVR95Mw5pXN/UsuegDJj5vonh50vqkVLOckFIF6lCyR+X/UUDkWp
	dDsClMJdSAZ8sItP75yYspZbwUgBoIl9BcrEQXpbgd/NxtQkOIGOu0I8kW0uWyk1P5w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1758949150; bh=wiywbGUArM2TQ2jnZnO3jhn
	LS3BT0xyRgYF6NOHEeCA=; b=KkS437eXQbphejCILSt2qSlQaxkC4ms05KgUvohaEhHAKPGi8i
	72CND7y6VRqSAuMbiRKohE9wy+ieZje3FIDg==;
From: Dang Huynh <dang.huynh@mainlining.org>
Subject: [PATCH v3 0/3] RDA8810PL GPIO fixes
Date: Sat, 27 Sep 2025 11:59:05 +0700
Message-Id: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABlv12gC/x2MWwqAIBAArxL73YLZQ+sq0YflZgthohCBdPekz
 xmYyZAoMiWYqgyRbk58+QJtXcF2GO8I2RYGKWQvRtljtEbrRoQTXeALd37QrsOuuk6SIQUlDJG
 K/qfz8r4fb5qMN2QAAAA=
X-Change-ID: 20250925-rda8810pl-gpio-fix-db6f7442eae7
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=1382;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=DI2L0s38OFZ3kmt5elmBX6ywpaznAAhIuFMkreoguPs=;
 b=tEr871K0fXKTRnsUIazo974JxiDPEzxnp6VPDZtrqbXbUKfc9zGsgYwiW2Fea/Jsbw7OWuMQq
 p89UgMS1Gi+CCcTQXOf4Kd71tWBYkAF6BGp1GlwdVkBgI3ef72ZJr8C
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_220138_435721_46401522 
X-CRM114-Status: UNSURE (   6.42  )
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

This patchset fixes two issues with the RDA GPIO driver:
- Makes GPIO IRQ optional for modem-handled GPIO block
- GPIO output direction misbehaviors

This change should not affect any existing users of the RDA Micro
platform.

This patchset is considered to be a v3, as I did not tag the previous
patchset as v2 and is a split from both of my v1/v2 patchset.

Changes in v3:
- Use bidirectional direction register for dirin register which truly
  fixes the previous issue.
- Link to v2: https://lore.kernel.org/all/20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org/

Changes in v2:
- Update commit message for "gpio: rda: Make direction register unreadable"
- Link to v1: https://lore.kernel.org/all/20250917-rda8810pl-drivers-v1-0-74866def1fe3@mainlining.org/

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
Dang Huynh (3):
      dt-bindings: gpio: rda: Make interrupts optional
      gpio: rda: Make IRQ optional
      gpio: rda: Use bidirectional GPIO register for direction input

 Documentation/devicetree/bindings/gpio/gpio-rda.yaml | 3 ---
 drivers/gpio/gpio-rda.c                              | 5 ++---
 2 files changed, 2 insertions(+), 6 deletions(-)
---
base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
change-id: 20250925-rda8810pl-gpio-fix-db6f7442eae7

Best regards,
-- 
Dang Huynh <dang.huynh@mainlining.org>

