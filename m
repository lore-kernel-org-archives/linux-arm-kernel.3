Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93992CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 05:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c18qqKgWjk5aiDXdC9o8HGKjorA6BtduRucu/rNzeDw=; b=L03vfLcQ64q2SWEeOxrDh0qVUA
	Gw/fmoyo5VillGqiivr9JbvGpbLF2ypKs/8AyBf0WkvLRYIwEdkIWknXRAkMOJE9FLOAM7PnivWmS
	cthfQ7szoSJToh5hQ1GhWzwblu+gRh2OoeGLZzAwp85vCS5QRZa+o+lT8FszSh14Bm1+MQg03lGuh
	dBX18zw+DEafd71RT0jKlwLqYCDUNHX9kMeIii8Nj8LT1OzN7pkkb0P1XqNNJRevKOUa2AKlY4T2u
	OaGuQgyP/Ky6l3+om8Aw46vee/esuIYRQAFZOJt0rB1ROIvP6MXfrfDDnyUHZpW/QTZ3j8wUfzXNH
	gk6nq1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N6N-00000007Cf8-2ucY;
	Sat, 27 Sep 2025 05:04:07 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2N6K-00000007CdM-2lr2;
	Sat, 27 Sep 2025 05:04:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949153; bh=c18qqKgWjk5aiDXdC9o8HGK
	jorA6BtduRucu/rNzeDw=; b=KU3bfiRDXJVcsJii/saVSictpZ2Uz2F8/TkU+jR6trsb6tu68B
	X6ho1FdRQh8hI+VonUi7b/9JcRoGNRtrDF2kbvTAKuNvTsnx5lnOEKTTBQv/wJZhfieIiOJugNC
	2pEU0sN8evuGn581Nr59Y+B7s2K5Mqjd4dPjcmz0THy1F/L5uSYCzokfWgMSqfBZJ8ojOWplmem
	HcU9ksBzKAu/zU+Tym/8cR/9srpD3/mgppqu4Z0+XLS0GofsGmUTEf2Pdpz2BaV6f+qrh+uv+n6
	7At3hPJJnwOxWOCJDi4OG+iWuTwiMD55SRZbH7LbV0rKpq19CZV6P/evRy65r7gclew==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1758949153; bh=c18qqKgWjk5aiDXdC9o8HGK
	jorA6BtduRucu/rNzeDw=; b=7CAWdH0n9zArBrqedy1Ccxmiay/4i7xMM/1GSS537Og2ARDj34
	dYiWZUHJpzGq6kLrbcHE2stxG+uYUmcLXpCQ==;
From: Dang Huynh <dang.huynh@mainlining.org>
Date: Sat, 27 Sep 2025 11:59:06 +0700
Subject: [PATCH v3 1/3] dt-bindings: gpio: rda: Make interrupts optional
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-rda8810pl-gpio-fix-v3-1-3641cdcf6c1e@mainlining.org>
References: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
In-Reply-To: <20250927-rda8810pl-gpio-fix-v3-0-3641cdcf6c1e@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758949147; l=820;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=2bdyJSmNfA84cD9RwcJK/nl1FiNGvBo/u1np6F84KKc=;
 b=/pETpb90BR9sxZwYvfrWFybr1R2zT8RGeGRPqw3DI+yfzFsPZK7Z6Qe5ZOhhVDkT2izhuYnop
 WKcAw9HFDHQC9Xs6P47SEXF/2JWiS4/XEp4puuT6y72vjYeKEfXfT94
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_220404_844601_2CF176BD 
X-CRM114-Status: UNSURE (   5.75  )
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

The GPIO controller from the modem does not have an interrupt.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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

