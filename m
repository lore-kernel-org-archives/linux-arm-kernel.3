Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F2CCAC59F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 20:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I0fHAE3B++7vPIWUw59myjDCPk+7GWM24JBNBMS+y7M=; b=XUanxS/OVghDjqGHjkAn0mywrY
	+j+OKd+Kri7g7FkmW7yrbCaI1o1tRj9Xwo7AwNl4btJ1TOO1x+AQLzO8pteqGyHqVdHEHt/wcLIWS
	rlkUNHQf+xKMjd7c6w/s5wQx2buJd3gEoFLZcFrIIUZhxd5PtXEoOwWTbCddpkpQ+ePmn7p4KAoW+
	ZQQHD/p6ptmmC6Z9ZEfbWWkyW3i9jHwQPQe695NeXlUl7uiNCPHAq64TRmnzo3L4qUzKNciYQG4N7
	vvritAhwvZGBoNRrcs/vkpbpAQLiTopt4ae4UqVFzZ5xJ8Uuc3MPBtpLwbBfx6XWYbAolvJaZDBiC
	4krSfppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycFT-000000091M2-0AUE;
	Tue, 16 Sep 2025 20:25:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uycEw-000000090iJ-1sa9;
	Tue, 16 Sep 2025 20:25:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 90B9444D17;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25CB5C4CEFF;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758054325;
	bh=xub1/tI9O5DTgQhmhRBbs4Xjsw6qwKviTq2SxNAQ5VM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fcl4xDz1ZHp5+J8K8HjCWy3jmZaXLcIIwdfJFBIleSSBefPR3RHy+ZQxUO0sRA6fe
	 fF4AW4NFW0VxJy6l1lYy0EM7Z/t5WqXyDlchlqYcVavBi0dvxncUhgtGTeMdFRVUyp
	 KdUcPPHpjmmMz8UksyEbyFWty4ehkw05D1s22im+BUA191x0KwOXkd+S66zF5qPd27
	 eQVEw1E0m7NY2hU8517TDEpLUUWKLyJv7NivdyTFGD5gJ+kSXgdNEeaM/p/fSdQsKi
	 RMrReUg5FWlBW/WdHLdXLoRPYWLogCrGj8QDpo0ohoa0OVFRyT28akLURoTMJJMdUk
	 x0EZCWfQ0uLFg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F37CAC592;
	Tue, 16 Sep 2025 20:25:25 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Wed, 17 Sep 2025 03:25:00 +0700
Subject: [PATCH 03/25] dt-bindings: gpio: rda: Make interrupts optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-rda8810pl-drivers-v1-3-9ca9184ca977@mainlining.org>
References: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
In-Reply-To: <20250917-rda8810pl-drivers-v1-0-9ca9184ca977@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-hardening@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758054322; l=767;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=Ifgj24X3WuB4jA0+A119cFjcjAjN444atKSTzNtV5QI=;
 b=w5Dv0+XyivOW8fKisHFtboYipMhkeJG5JlSdgVYg9JCFW0dK+AUye0klaEHuhYZkbKF8yFV3d
 bbnf7sXd5NlDsF+1JmkU6i+0CfwfvX/taK6GSxR2IwyVaLwjD6ceHsT
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_132526_515124_DBB3F60A 
X-CRM114-Status: UNSURE (   8.00  )
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

The GPIO controller from the modem does not have an interrupt.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 Documentation/devicetree/bindings/gpio/gpio-rda.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
index 6ece555f074f84b396537917d7149d4061724dcc..dbb73b4d33ed39aa65024376b1af0c4e2fb896db 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-rda.yaml
@@ -41,9 +41,6 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - ngpios
-  - interrupt-controller
-  - "#interrupt-cells"
-  - interrupts
 
 additionalProperties: false
 

-- 
2.51.0



