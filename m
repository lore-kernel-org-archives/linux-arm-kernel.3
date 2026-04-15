Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7517FFA0C50
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 08:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ypih+aujNTMXwY+ixUhR1RTw+q9rzvFO8odULR6YTqY=; b=h3Q/6P272Uxu+1MLBROfYNVZpg
	AhnCtBi/IA34TSGA36iC757neQ0qGaPgpOSPB5VS29Ceyahs/fGsCnOVYd3vp26pkYFK/rShm4D6r
	FxC83+5kBiKZncfFqiFus0oLXDMFF6T4l7cyupC2uZzAbYsTAWEjSlrydqMy1WS76fSOYdOL2BUVo
	QDkW9RmMm1BhX3DahYZlwR6ZKBMmxBM/Iqs+0nyv5+sXKvWPahYJh9Bd51Hn9YcwVb8RLZ9dQG+ei
	OeyCjwjU4iLVuhVelF3NzsOOO7biPtNX2JgN8DTlwkoJIyvhCIPc2IDPQyZ+7a4iQF/TEE0DTm5gG
	1fJzAihw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhT-00000000p72-1mvU;
	Wed, 15 Apr 2026 08:34:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCvhN-00000000p2s-2dNs;
	Wed, 15 Apr 2026 08:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ED67C442E5;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C36C6C19424;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776242051;
	bh=awWIx1f9dR7GIP2hxnIcbP5W1aryibgP9I+hBEGcbjU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Aa3ZEw3XEWrUemWRn1AexKJeZj1H8Uui4nPAdFKJSSzpD5NsxcKfmgT8W3lVo2XN6
	 08alNmioHz3w6XjsLoH8TgUcPF6yTQFN9XxXz2L0yKP7Nd0+XJQX0E0I79npboarLC
	 FhG7/Ama69goGItjgeWK6kRMxElsSV4/NxpISjoSivWmGKqHaISN2mwDd5RN64jQ6r
	 4MyTHsofU2dI+tQeeY9hiFtXnwRtI4ANqpUDO8lY4OgowkUymwR4PIr9G/IWyazBEt
	 zeRkNHNe89vNOyRyQK4xh5C2RhSip1ur7aicQOlIvCTjvt+ULUgCjB9SJLa9MqYGbS
	 3rkUhhcUZSONg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE360FA0C38;
	Wed, 15 Apr 2026 08:34:11 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/4] soc: amlogic: clk-measure: add A1 and T7 support
Date: Wed, 15 Apr 2026 16:33:40 +0800
Message-Id: <20260415-clkmsr_a1_t7-v2-0-02b6314427e6@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGRN32kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDE0NT3eSc7NziovhEw/gSc11LCyMDSwuTFIPENEMloJaCotS0zAqwcdG
 xtbUAqpd5oF4AAAA=
X-Change-ID: 20260415-clkmsr_a1_t7-9820984d0af1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776242050; l=1104;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=awWIx1f9dR7GIP2hxnIcbP5W1aryibgP9I+hBEGcbjU=;
 b=lFxpNnrVZaBBtu2+PyhMAD8jPnDZsB51zmR7K2E4pSd6jpoRRgvpHYZt7LRJreDOXR1UEHg33
 4Qx8jsvTlacBFUuD4UiAHWO74DXB1vKl6V98L2sGqBeiEEw3Hp59A6w
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_013413_703691_6762508F 
X-CRM114-Status: UNSURE (   7.69  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds Amlogic clock measurement support for A1 and T7 SoCs,
including binding updates, driver additions, and device tree enablement.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Add const for a1 and t7 clock measure table.
- Use b4 to send this series.
- Link to v1: https://lore.kernel.org/all/20260410100329.3167482-1-jian.hu@amlogic.com

---
Jian Hu (4):
      dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
      soc: amlogic: clk-measure: Add A1 and T7 support
      arm64: dts: meson: a1: Add clk measure support
      arm64: dts: amlogic: t7: Add clk measure support

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 272 +++++++++++++++++++++
 4 files changed, 284 insertions(+)
---
base-commit: 401e5c73eedde8225e87bd11c794b8409248ff41
change-id: 20260415-clkmsr_a1_t7-9820984d0af1

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



