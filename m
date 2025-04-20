Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2D9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Apr 2025 17:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLSTm2eAkY0GGbHRw8VQP7KYnuUYCyjh+76myopty7g=; b=Ph2yrGCjrn3ox3amcgaCU0cD0P
	xp4ACg8m6lAcmPLOdSfYbdFAqXvuLp6a9GHw3aN+aJVDOYHA4UZWeO1d3rc7f1DhTSLOWUwBxTIWW
	ks8ExWffsQwAIunTBy1+sC9PzUMzjlQ71NnVbjvK76mc5yt2LoqOrZx2f3gcGj51ozjPrjYHKKf3n
	UrOreDsCANaLcA+QrxmI9UU9YWVvTBRJoY/NfP10/DKPs6EJTCryT4UQDQQn5bTCesYgoHSGYkbfq
	CLgRbxFlQgMTG+xsmPw/oyZ+CxxNlQz4tRoJ9pjUvsz/aKwUOqm6sSfaay+o/oOSvXmQaGVhKMsHI
	Apf+IlDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YhH-00000002qsy-1ISN;
	Sun, 20 Apr 2025 17:43:15 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6YdV-00000002qS9-4B8w
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Apr 2025 17:39:23 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ZgbN55QxGz9t72;
	Sun, 20 Apr 2025 19:39:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLSTm2eAkY0GGbHRw8VQP7KYnuUYCyjh+76myopty7g=;
	b=WP8Ty9zgDEPJPjjgJfUI6a9Zo0jSm+sC5xSJQynbtc+5h83NOWaZO+uRP+FNAKDWAS3HqC
	WviBXRMzHyoB4woL3Kd0F7TWdkirA4L6uZIQsC9fb7jaJdcf8dBvCQPuDzl3vnnxmmiXut
	1T4i3iAOFF6LRHC3EYDdjZxMw5Oa2O1hwvzMUH8cf6n9/nVvbmaIcZ6dO992ZMhIjK+CZL
	Mcnuv35T+4xq/fmAxyFqMrpg14uar5B+v1mThMpGSYg7L7VsXZ4DY+NBNUEuGglrC4+quX
	w4YDAgPqG4rcaOmGUpOOvp/K5AGcvdKBsTsBRSxVyXJsCf4vbdo+fwVP6rPckg==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1745170755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KLSTm2eAkY0GGbHRw8VQP7KYnuUYCyjh+76myopty7g=;
	b=BZcbMBrgar3ZHd+5I5TjGbywYr1hEUGLl0v4BvCPlzpy13A2iJbARKTWi59RN64MBvFpav
	eq6FF7U2EUU/memo2SD2v0L+OZ9Q22RJo4/HsVEYs8His9Eo/u/tUzmv0QzxRCDfeOJ2/V
	aDL9WgTrXmqzqJT+0P1U0tddzu7hUlrd6kGiAWp6uOCLRcHhOJ9ZohAayjZ/TaIfchC3Vk
	kJoUiT9ZqH8fopfB/c1Til/M4rUYzWv3vLrSOpQLZ8ociXtKC/En5NMly0AWNoiL0LoKI1
	6O4SDEvzk2RZ9TkybhhKrLErBKk9QEIkq89nXjiJKdVDXgL/ZnrphC4ZaZb4Ng==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: vendor-prefixes: Add Retronix Technology Inc.
Date: Sun, 20 Apr 2025 19:36:27 +0200
Message-ID: <20250420173829.200553-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org>
References: <20250420173829.200553-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 3dcd1b8fa1fd642b3a1
X-MBO-RS-META: y4gyayeuk88anxeym8ykb3wbk9orzzkc
X-Rspamd-Queue-Id: 4ZgbN55QxGz9t72
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_103922_175782_996C0447 
X-CRM114-Status: UNSURE (   9.19  )
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

Add vendor prefix for Retronix Technology Inc.
https://www.retronix.com.tw/en/about.html

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kw@linux.com>
Cc: "Rafał Miłecki" <rafal@milecki.pl>
Cc: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Junhao Xie <bigfoot@classfun.cn>
Cc: Kever Yang <kever.yang@rock-chips.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: - Add AB from Krzysztof
    - Add RB from Geert
    - Add TB from Niklas
V3: No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index c2753656ae8be..836b446132686 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1264,6 +1264,8 @@ patternProperties:
     description: Renesas Electronics Corporation
   "^rervision,.*":
     description: Shenzhen Rervision Technology Co., Ltd.
+  "^retronix,.*":
+    description: Retronix Technology Inc.
   "^revotics,.*":
     description: Revolution Robotics, Inc. (Revotics)
   "^rex,.*":
-- 
2.47.2


