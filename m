Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F11C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 13:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZ7iWWTcW+hIa33iqBsIWx5XNMa7t+7Yu74P2Hlui0g=; b=jWbSuvroI+ChZ26sL8sugj38Lu
	aCvDc7rOUpT19RMXx7C3LzlW2EM48V04kPaixE6zb3dJnNzCyXg0Ph+ixAAfP30NFGiQxzZ/8zmYn
	z+IQ3azAkNrhZQr5WBaxaLWwMk0wC/x8oZ7c4PRw14zx5agFwlpmaDPUSAxGfCaVnOYPuc52Orrex
	Vvngzvwr31L2oE7RVaifga0+L19RCHUXLp0UvLjUoEWLtf6vzK9JzHfT9jXAOP9omNKpvTvFlUtX/
	WpL6LuORY8kZhDaVyBQJRMKfn6bepRA1jbool1tpMR6m+d6ei44LMWz27EbIDb5nBDc65zHG1okja
	FT3/18oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3E6k-0000000Dr49-04Pn;
	Fri, 11 Apr 2025 13:07:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dih-0000000DmXr-3wqf;
	Fri, 11 Apr 2025 12:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5099AA4AB06;
	Fri, 11 Apr 2025 12:37:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AC4AC4CEE2;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744375374;
	bh=4Ja56XexhMA1DCbBsQ1zoDOwfhujr3WsOePoWuHRSsc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=VhGa06pnAJjSwN1NSo8al7+LsFhxD+uf7+PY+TCvEWDXrdO1n41QSFG3HQa3+/ToQ
	 q51MS4KyRixR99YarxfmL6PwoUXNJyCyszkUhBZlBoIOgMJDPmzU89WJ40+9Br4Eop
	 HqeteyhhoDk/VAbzaT2PaSsuKJj9F1qW57XSm67UCuqJpvlnj5XViPB0aUUrt/+HtA
	 eOz4OMAR9rx5p95GqiJpTtYh45qI5tejplMyuF/cUGiLSKeGl27i8iTl+eI8QiQ+k2
	 lckBBwgAubxpHx69AgbnW7RSEoFxliOg/sU6zRBX1AO87v58uwYNdEBV/erJ3dzW09
	 Cju/CLmqIJXjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67832C36010;
	Fri, 11 Apr 2025 12:42:54 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Subject: [PATCH 0/7] soc: amlogic: clk-measure: Add clk-measure support for
 C3 and S4
Date: Fri, 11 Apr 2025 20:42:42 +0800
Message-Id: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEIO+WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ND3eScbN3c1MTi0qJU3RRj42TTxCQzIzMzSyWgjoKi1LTMCrBp0bG
 1tQD1zih3XQAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744375372; l=1025;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4Ja56XexhMA1DCbBsQ1zoDOwfhujr3WsOePoWuHRSsc=;
 b=hNqHwd8xj6la7bifCJfhTbVRhSovhfmFzrYyzc9dzFgcKEAMHEqsdY6+AhrxaJauQy/eae5NF
 PLtq085pFpjCsXqAkyeugg02kDsfGTyViS4F7xDX3inqsLT5CYxyQfk
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_054256_062837_2E838223 
X-CRM114-Status: UNSURE (   5.67  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add clk-measure support for C3/S4 SoCs.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
Chuan Liu (7):
      soc: amlogic: clk-measure: Define MSR_CLK's register offset separately
      dt-bindings: soc: amlogic: C3 supports clk-measure
      dt-bindings: soc: amlogic: S4 supports clk-measure
      soc: amlogic: clk-measure: Add support for C3
      soc: amlogic: clk-measure: Add support for S4
      arm64: dts: amlogic: C3: Add clk-measure controller node
      arm64: dts: amlogic: S4: Add clk-measure controller node

 .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   5 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |   5 +
 drivers/soc/amlogic/meson-clk-measure.c            | 399 ++++++++++++++++++++-
 4 files changed, 396 insertions(+), 15 deletions(-)
---
base-commit: 37021be47d02d2913d6767795a6f4c72b4e63a4f
change-id: 20250411-clk-measure-d33c5ab62669

Best regards,
-- 
Chuan Liu <chuan.liu@amlogic.com>



