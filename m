Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155E7CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 20:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=; b=XamtqlwT5zzw35puxnqfxhxh3p
	LtLcyPi68UdoERJEPxAzyfMAWUgsWN+rHpXAa/JKq0dhUp4bqxNLQPOIiEzDcZBtWtWcU8QDKJqWx
	p65/z3+jauSkK7aFf4wC40QxK9Aeqkb5mRHcG02DZ+25BpdXxvWitI156kch5zHYJi81iCoEB2CKu
	PNxYPdajuPNakJy4ylWGryquFuvc/EfPdJGR9WL8hfaMQlj1AFduLJrtfKNcUPtJUc4iWVaDAkaij
	3c7ulFgguUlFla3XxTIRQvG7SeqY+ynHO266EuSQcz1C8TpiN9qxnpxABAcng+xaTKXuzpUGXjOrA
	GMjy6yCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8TZ-0000000BYM2-36a5;
	Fri, 12 Jun 2026 20:27:37 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY8TW-0000000BYJG-3YWM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 20:27:36 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-45efa80e0afso1094423f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 13:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781296053; x=1781900853; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=awnQ53CJXBqYzWw+mXXe0Qe6vYicNGzBNULokgBPpeh7+XCEpwIzXg/BhSXGOndyd8
         2qLoojNfF1WzG8yRfkKGa8MV23YgiNRTfv0j8PyzQIuhpoN9YnHRrdFVA0B4usTRnrHK
         W5mMdARTl9DXvJa+4zSeSi5ZodSb3iHcrVmmcCFqaEgewG+nUxYSClwppJHd6vRHHy3t
         S9P9QbQ+C8/yRpGLhP1tM74QRBaOr5wiTcx6Fg+hnP+8dABaTxOvv+QHvskg116GSHpU
         shDhFEGA47j+fO/2c8LJOWKWR/1aHvOunDC0TKn+JK2eGTACGpWqmv922N+a95eDbPqC
         76ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781296053; x=1781900853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2uiu84fLHByfY8NkkF/LaIKJoh0XbICVZ1vVfqMiiSs=;
        b=pWJLGvz1KaBp6C4R2mZz6f02eDFzyCBRal76TVenkkTOD/ayPWmd8YfOaqAE7wrV5Z
         98+5lwqzbrUlJlZMzJk/enrY+65oV/Nb3/Rjb8cK8hvJKfBzMLN7qh+PYaQOUXEghqWJ
         L6Pz4sUYjcf6bwXM+1KOckgUq5i5JmIcWFY7LkWhek9qBfzULyO4BzJBoqcxTALCcvIk
         uGX4ETIE98x7VpTtJMamOP7hv0Ifc9016+J9e2mAPwchu9gMjlBoW0WapHXVU5kGo9EJ
         B0VeiD44itxs35lnXXjWHaD1Ytu9VZ0NhRr1GKAcHkxrOThMZ219BiaqWSAaHhwfg7p4
         TaYg==
X-Forwarded-Encrypted: i=1; AFNElJ8Mfm75VlavsqKKkkBivZNs+r+l8qmZg1r3BJlNKA/cm1XlvRtEXbVahzlYwU1iTbsgfKnb/OuXzOli84pT1RbL@lists.infradead.org
X-Gm-Message-State: AOJu0YybycLT830WVG0o8Leps4BieZFUlTn7Cf6H/YF87VQg9W+IqUgS
	pWUCldK4RDp5UXXyKGWZxtWYyz92+WgkdR0NuuBaNEXyqKTeC3QIc2bV
X-Gm-Gg: Acq92OHwz5nGty/UqNtkdeZ1gS3YhNcBzWW2U+Vi7XavfNAEp921bQTN5fN2zutMO8c
	/qBHvf8itLzmmmDXrXul36+Mmu7bLiqwCtVSRmIh7IHV58inqx2cJNv0Ef3aYicqUJ/ek02mKVV
	I7CKNBpjOtbNJy3/olNdLH17B7ytZU5QfLQt2NXZtRiERAIQE2mmSijrZKpyc7J1FlQpx727ad/
	SnuAb0wGY3Qef8JsL+/2qin5DXI8jPsWgjmhMkV4sf8R5yB3z7qMN3xuiZIhWx4Fr18E3KqdWOH
	9qj0RPfk3x6LsKgv2NHHlHLmEjKXAe61ACYYLtWLTiRLUDi8XPZ3dh/++lOLa+UckiimVsara2q
	8sIBGCqhh3E6pixtm4t/qnLZzjuOrJ2ZhOZ9Sr8khdlvrd6o45bKI64X2mtCDXN63koudu0bh4l
	i/QvsTVV75otVIxo0p
X-Received: by 2002:a05:6000:428a:b0:45e:edcc:f6dc with SMTP id ffacd0b85a97d-4606db9667amr6456265f8f.6.1781296052923;
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm9173261f8f.1.2026.06.12.13.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 13:27:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: mediatek: Add MediaTek MT6392 PMIC dtsi
Date: Fri, 12 Jun 2026 22:04:12 +0200
Message-ID: <20260612200717.361018-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612200717.361018-1-l.scorcia@gmail.com>
References: <20260612200717.361018-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_132734_901490_B0BDA9EF 
X-CRM114-Status: GOOD (  14.09  )
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

From: Val Packett <val@packett.cool>

Add the dts to be included by all boards using the MT6392 PMIC,
providing support for keys, pinctrl and RTC.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt6392.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6392.dtsi

diff --git a/arch/arm64/boot/dts/mediatek/mt6392.dtsi b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
new file mode 100644
index 000000000000..b8d943e47816
--- /dev/null
+++ b/arch/arm64/boot/dts/mediatek/mt6392.dtsi
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ * Copyright (c) 2024 Val Packett <val@packett.cool>
+ */
+
+#include <dt-bindings/input/input.h>
+
+&pwrap {
+	pmic: pmic {
+		compatible = "mediatek,mt6392", "mediatek,mt6323";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		mt6392keys: keys {
+			compatible = "mediatek,mt6392-keys";
+
+			key-power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+
+			key-home {
+				linux,keycodes = <KEY_HOME>;
+				wakeup-source;
+			};
+		};
+
+		mt6392pio: pinctrl {
+			compatible = "mediatek,mt6392-pinctrl";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		mt6392rtc: rtc {
+			compatible = "mediatek,mt6392-rtc",
+				"mediatek,mt6323-rtc";
+		};
+	};
+};
-- 
2.43.0


