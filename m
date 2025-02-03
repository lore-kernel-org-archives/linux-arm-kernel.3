Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEB2C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 21:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1EYmoCYPdwrIiDvkXBVlYW7h5hQR6wXJyMHWL+Q5bWQ=; b=xzm0x3AsKpDEmN97+2wz0b010/
	z09yEJ7WiRgt8vsXB2exjMXZpfWbO0+PaSoFfRr4zdHkHIW9r6Y4YuIxUJPXT6hV1UGVgBFposKgG
	Obv9dJVBaSOqtToX8WtgYBGpQglfyMdyT2edut0MFqUsD9Jo7eUSOlLbewVlEF68C6/9Y/AXcQ0vn
	5/DfCPjLLcX33XkPp+HZtIyiL6OQm+meL9NwyckznosGhcqWnLUEn9Y6bXTZ32WcDIefkpJ+MuNOo
	g0wMdTnL33p+/xc6dgV+UStNxwDqK3JpSoyYv0xAqy4GnNjUwHUcmt1zQdgGuQ94f44XynU3g8HWE
	Q45EuU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3oE-0000000Gddo-2d03;
	Mon, 03 Feb 2025 21:16:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3LH-0000000Ga13-1LW4
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 20:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1EYmoCYPdwrIiDvkXBVlYW7h5hQR6wXJyMHWL+Q5bWQ=; b=Fb2TrX+hqZK1f0oJLF0dbhVi4J
	jcqUn/aHTYfS8o2G/X8YM9K+F7QDDDUpP57rnRa6lJRNTtz+Xm6/u6dygRiIW/fiPAeYDUIXYh0Fg
	tr0xI6LHDXzx8OxmLAaPzgy7WfKIW3yZx1duHPkYciENsmu0HcuSgvzDW0IjEk8pc8zY/2JxtLuh8
	Nu1T5V5D+ptNdy15NXSIs771kK5+TmL9twepXcswejkXU6crUF0e9swb+i8fsqACN+aukaa9MjjzX
	C375Da5e/5hJIL8geW6njlr0PLRpK0HR6YaAhFcPiIr5RRxhVxWJcXlj3Mlmz4stvvU90rv+aeW0d
	qAoyKDQw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3LE-0000000GBAZ-1KYQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:46:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 295A4258C0;
	Mon,  3 Feb 2025 21:46:47 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pLQQ3DGDgHbP; Mon,  3 Feb 2025 21:46:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615602; bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=mb55UjLpMBVt18MumxwuJGVw0vmZXovrLIgSYScCZfOqpE+vrVzYfMLF0rEbb7yn8
	 XX5CtRyQd4i6HwOm3V+sd3/6PIcjH6ZcpoipJ7I0B81KFLz16vwSh5tBHbfSXxblpD
	 kp1UQQc7K8uuQyMVBj7YBBlAgJOXrTFVks2uaGTJBlHMhlSr0uqss4gwJueV436RQy
	 4UpVygkeY/Su00V8tduor8XDvcHgmo0bQNTVbDV7EvLbRe98HdwGzxDHc/ayGtm20E
	 8D2qfqrUN54Hry9R+TbeE/ZRm8TQLj6y8fKboFUQ01XyZfLUnUbElqHgblKjLAxj7R
	 I3UJTMdg32JwQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:16:09 +0530
Subject: [PATCH v2 1/5] dt-bindings: arm: samsung: add compatibles for
 exynos7870 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-v2-1-56313165ef0c@disroot.org>
References: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
In-Reply-To: <20250204-exynos7870-v2-0-56313165ef0c@disroot.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615584; l=1423;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=cKeb4Q3zjzoX1lV2p6fkcHZ42nUiiWSUSr5T6FY95yI=;
 b=CPOzjj78CM2NDgBBM5irndthLOf8UFoFj+cJ2DF+tCfMTJp0Eao3BEceLOmGzqCnvpCairNmz
 axR+1b4jUi8CVtHyVgWydJQqSVAux7tGICawLf+36rTax+Gyx/9hZ3r
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_204648_518708_AD86D927 
X-CRM114-Status: UNSURE (   8.31  )
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

Document the compatible string for Exynos7870 - "samsung,exynos7870".

The following devices are also added:
 - Galaxy A2 Core       ("samsung,a2corelte")
 - Galaxy J6            ("samsung,j6lte")
 - Galaxy J7 Prime      ("samsung,on7xelte")

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index fab29f95d8e62f5ea75bb0819a9d514e54f88d3c..b3be184c7e563478aa37eb16a69c08ff7f70af29 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -212,6 +212,14 @@ properties:
               - samsung,exynos7-espresso        # Samsung Exynos7 Espresso
           - const: samsung,exynos7
 
+      - description: Exynos7870 based boards
+        items:
+          - enum:
+              - samsung,a2corelte               # Samsung Galaxy A2 Core
+              - samsung,j6lte                   # Samsung Galaxy J6
+              - samsung,on7xelte                # Samsung Galaxy J7 Prime
+          - const: samsung,exynos7870
+
       - description: Exynos7885 based boards
         items:
           - enum:

-- 
2.48.1


