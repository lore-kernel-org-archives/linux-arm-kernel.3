Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E7AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eKH+aO2rjY7GmUAztpIfNiK4qIgC0rzf6T7b5auiuAo=; b=UEbSx/EbydZA74olnLlllOMuAe
	KInnBwnCaiQ9U9tCW+aXNWPv7lccMtPxxtm7s0WpNIy3swG19Es2F+vZhZT7aFSFUceFR0DDvQ0SN
	5g7Xlmxf58QJQiPIP6u6l+ZQgAHsjQR7+CQktFRA04PcmPXqzmnI0zoFhSSzeW8aCUUhhtzzSCtWs
	3g0r4/X7IR7sIzR+hhl5mdNarVlZTb6FuHr0eLmd9STv7T8eMlnhRuPrFwFvBc+ZUYMV2HG9rJWzo
	MtZU20wBZ75Lppj9xkckraWn11Ap8fQjSAxP5SZIHDFnhpdxaKr64eGhnnXQQseshR18ZF4yoAY5h
	uPr1pBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmz4-0000000BEbB-19zg;
	Thu, 10 Jul 2025 08:50:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlo5-0000000B1oa-2Jli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:35:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-454d730fe9aso219945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 00:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752132899; x=1752737699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eKH+aO2rjY7GmUAztpIfNiK4qIgC0rzf6T7b5auiuAo=;
        b=hLDam1hQHMXryLGUYHGZ8MsR+Q2WDcFrn4jlOjxZ8JoVDKidPpWeZQ/R2mmHI2aR4g
         kRubB3TFp8O8YuQ27bLoG2JRkO/+GmCwTNglxB2vYGqc8tvCQoytM9V5IJPG48fj1A6H
         D81PdQ6c2+CkrixDWq2yYR20daprxE4zm0A8KBjClphQgjoPLFNkxGw6PYheVnejSVuR
         s68PWVcQzYpjC+8wBUhrY4xoYtxHGE1xn9nN2MXs74s+AO8RLHDvMtHyu1HMVEtq8zzF
         LcET4743R92KAU9gZyIBzh0m9XDjhYaWq06xK6KsZ2tzBfgrnmeNowb5MAEp/Ix2er08
         TAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752132899; x=1752737699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eKH+aO2rjY7GmUAztpIfNiK4qIgC0rzf6T7b5auiuAo=;
        b=uqnEO8LaSCmjuffHhlhvlwc3M4xiCjR9cDuaGqI1G1/ITAmXQAQgWx9ssD3gYRPsfV
         mdgVFSBpYbr59blZcTxAKhg+FznKmid4L21yNVnrTGwyFj4KSIRs1vZVlhCGY4qq3oGG
         Ea2cd+eWWXYWVyyOcaryM4PLnaYXS5GkZrvGcTdV8/q5Rn/69HC4c4LDP7stGg8x6RFO
         KYWVFjQ3BMmNhN6DdLDCRl7Iwa19GDFZv8suCdlq2v2U61M0nxoTQ/FKpEpqZhXFSQ6o
         0pyzUC/01bN4CZmR8SJIq23ZG1Evfsvd6LXqYX2Ck8myp7qu2ChmbGtYErI5QbvOUBAk
         y/+w==
X-Forwarded-Encrypted: i=1; AJvYcCWwlO5Isec1bHYbWZpQ2FBeOdVo+xQOQxFLg/9RVtumzye+FlLAJYVJZ0G9QhyySxSXbMSCZKzKC7/jWW03M9lL@lists.infradead.org
X-Gm-Message-State: AOJu0YwzY/fhI4HMoMO15d/w8XCLZEe0p9BNNSPJzenu8lIk/dmEUcri
	D9O0GLTHhUj8JtP/kSgLE9uTBO6KSS5F6oVuZUCH380vf40tLNONxNULqapMpKcCM+M=
X-Gm-Gg: ASbGncuKB7TRqwDNbP7ZAAaevee5851kIBZ4S2laIdFqCSxcP7U2Mqa20UX7+Ccx+vS
	qqcF/b5Fud0VsGyK03YREsomCunCAzcbs1TztDFqw6m9F617+UxCg8nkbtwJbSqID3esauyrRon
	LjvdCYjVpZo9PfWahSBiefrq1FCGW8EijQjDrnqkMw/8QkVvl25Jsj9T2t4hB6MKlT0Nq67i0hC
	XGDhwYVVZZJc+QaenNne4uttSjUuWLWkEAP1TGGcjO+towdskgzLAKYs/WdAnpKDrnk6pDA2NW0
	7EC9cy4+ddik7C7mkaYP9XAgncdgW/5arLiZkUD76oQoDysGkggDjxq19FjL2k/mbH5EHtUHIbs
	=
X-Google-Smtp-Source: AGHT+IEABgTHpJuOVHfeR0LW6JPSlCNNGz0kLe9NhwWkBaf3MGsAU8IXDfncPgdRLsTmveiPVUe0Kw==
X-Received: by 2002:a05:600c:4503:b0:451:df07:cd00 with SMTP id 5b1f17b1804b1-454d54022a5mr18146195e9.7.1752132899555;
        Thu, 10 Jul 2025 00:34:59 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454dd466154sm10826555e9.12.2025.07.10.00.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 00:34:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: tesla/google: MAINTAINERS: Reference "SoC clean" maintainer profile
Date: Thu, 10 Jul 2025 09:34:44 +0200
Message-ID: <20250710073443.13788-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=d39nBvEBYdC3uHEcBXf7x3j1kWB+ksaAnGiURALeQcc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBob20TKRivgecVWAUhUenDgNDULB4gEgAPU26Mz
 5fZljgJzDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG9tEwAKCRDBN2bmhouD
 10KdD/0aQJmtgD0v956KA9gKqa8XetCl7cuwD54IaMQfP1htmD57xwa2jvS8tZdCHn7HLEBj+tK
 MpkP2fLJMyLrSMrKHi1NG/5AlVFrnOyAwsXaMXm+m4r7vyREzl+B9ta1AmqbDUQIqwWJNwym/u0
 +Y/zAIXcNAl7zoI1/Iv+a1WSlMQpopcv7FU2HHlvQq7P9vT6GUzfZDWdL937RaC/e+x3k2Y75IY
 XO+oS4rRB5fREV8x50kbsSWcvTXUK2r8W8N3ozpCUtgYo2n+SVMTKfknG5zlLyzntbcShhtip+7
 3X5cEwDCwoFvPIS1Y2rYEj7kru9V5pbLCi2/fzD5WEcDafEXHcAr/IxLYJ5kNGVH8gAiqGlOA9s
 wEtTLSiy12iadzaj7wUr0PYydrId/41LlgSyIKe/KBIl/bBqxr4FFDPUsDiYyk/qjhrtE7sgvhT
 tcn332YxguO9xtOYJyAmw9qA62ioQTJ/bT7a0d+FOfDFIpMm3RUI0KNrfjIjTgfPii2M+c2BGao
 xmQaJnZOMstXfwTYVZMYeAidtlltrahVqY+aWe6++rXM+9i6aQkoH37HLsqt6ou4rMRokUyxJ4m
 UTjduzAq0FxJNxJE3UDy5AP0I1VrIl+WpqStqgE0nZX0lE+NL/eaLkFhA3APnjbbPg2ek0+xIDx oH0QHIARAWGWjLQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_003501_599946_E643F214 
X-CRM114-Status: GOOD (  10.43  )
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

Effectively all Tesla FSD and Google GS101 DTS patches go via Samsung
SoC maintainer, who applies the same rules as for Samsung SoC: DTS must
be fully DT bindings compliant (`dtbs_check W=1`).  Existing sources
already are compliant, so just document that implicit rule by mentioning
respective maintainer profile in their entries.

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: André Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efba8922744a..4073f7ac978f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3392,6 +3392,7 @@ M:	linux-fsd@tesla.com
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 F:	arch/arm64/boot/dts/tesla/
 
 ARM/TEXAS INSTRUMENT AEMIF/EMIF DRIVERS
@@ -10317,6 +10318,7 @@ R:	Tudor Ambarus <tudor.ambarus@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org
 S:	Maintained
+P:	Documentation/process/maintainer-soc-clean-dts.rst
 C:	irc://irc.oftc.net/pixel6-kernel-dev
 F:	Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
 F:	Documentation/devicetree/bindings/soc/google/google,gs101-pmu-intr-gen.yaml
-- 
2.43.0


