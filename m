Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC1EC5B55D
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=; b=4HTYoCCphOmplZ0hhEzgogtEDU
	Q4P8oYc2eedm/6ISAOSDj9fEIXnCecIBroIGHCPFPcYgMj2uyNzxVTkimwnR0UIAoPXFMXEJ9i13k
	Z9Ws1gRT2MrJF/3z0zmnm22vQYA1ebgQAzGcJeGQpUTaUxfY81Z+CX9vehsWX7Yp6y8G6J97K31I7
	0MSz5/bhK/LOGNAFn/IHSdiCndMv2Kggl8YQi4V+Bvr3dPb3kFtmYwf9fF2zhrtPs1Q0i3Zaavlou
	hAug0dw78zo7Vt3hSkFMKnKGgFoQ93vX3KIh+C0wzwGXXYgApyS0AAI8bjLersQC6w0WmE9aUVik0
	GdXGQH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63R-0000000ATJJ-07Y5;
	Sun, 09 Aug 2026 16:07:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63L-0000000ATBV-2ZL6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12333115e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 09:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291630; x=1786896430; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=;
        b=Qq2sqb67+4x1tTo56Q+v2VPBn1m9dag5E1FsmIPcJZFYBi++19AiBuypeU1Syv/cCX
         TsF8HExlOCQB1nQSnqI9gbkvY/+HpL8xXnopo07eYfV/r+OlxMjsDw9pBUm8zKX1GI5N
         X/EMk0edkcQxkfdhD77brC3x8zVdHnWauaRXDm1Cnp6+rt1CwV8iBSlhtBX9TfDVs2Li
         6R485TP3eKI8GJAM8lMx7Psa9d8HUzkpYaOxHrl9t/hAz3JUi0yZbDF9a1Z18iA9MQB8
         MeUR7DPZ4dWrQxiSjwrU4rC0jd35PCS7AM1Wg+zDtkJIk6mmUh9GS/2njX4Ey0KXy4jB
         xWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291630; x=1786896430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2aw9hTPmVRYTxrK4RYL+auuCIDdNPlQ7RBPHnUIWSno=;
        b=Jx2xX1bPV3LNdFp9xFEqW6+AEwVXCAUSZOYjLMXnvhfpIEla16UOP2gpROXSBBYvf1
         XA86RdWmnOFSsNedE1DygOpidxdKjbAkptywEQplqT7f1qZRkvBSCjSbfjRx7UFZDY2R
         TecZp78SdMANpvmDCGsZ8AY2GfMoKFOhaq0KCNIXxucEYRFjBxtcSo8OWwqXpt/tWARR
         dHsfNwkcbI+Sm+VDXoINS+qWgHgDNNQZP87OTfElywGYfBzSK69dSm6fuCDxG1tpTr7B
         mcRuEJDHJZ7pQd/79te9Fc57xKvGeRGola1hE8PXZmFBjtXnUdiQ9jvysnsNwmtXmlF/
         Ukxw==
X-Forwarded-Encrypted: i=1; AHgh+RqKHb71S75ZM2WaDNIP70IW/xbhFG742B8YgdnlkMZPf7XgJeGE9tH4r9MOgXBqzWpRppXdyKmJOHptBc4tRwTw@lists.infradead.org
X-Gm-Message-State: AOJu0YyFHcEq3xcdEGJdKeYKjzg3x0OQRI5C91AFXbw6Lfi1n84fXLHI
	fAE6XL1ZBnlqUN5HA9SVHU0v5HLpfulCZomMQmP7XgBL8fkCjrGzrHhWZtAX9+44BJy7aQ==
X-Gm-Gg: AR+sD138SaA8O3R+3hQgd4zK5WPt8da+VbBiT8FZUYkPnOLwAZBvq3OI+1WGQFxi+6i
	u5YG4VuWKF2v9FAQKZHqeRdWmgcY7ZLLCUNXoZYgNOELhnOhDpqJXEOew0yE5L74C+YsNtXv41g
	VPHxbSE5ggDFJA4vllGztIw9rYq/lHeQ3wqMcVEB0NZ+jHgG/bhsAySQHHrfE8oszpcSBhaSSxX
	0GPARgCrSFt3JCI5e/+D4LVJCh+O4lTAf/x7pcL9HKnd7FgTc6tIXmoUlb/DgHeQp1O9bD9X1au
	Tkf8VejlmWeiPllRHMe3ToTFbVf6k/a8nSXtDHDLjfikVyh1hM9wv+OX987NNltAKJM99JisjA+
	78LUZtltroaEl6qvDQ9LI6CI3OAP+LvQkaFygGTYcW/XH4k5ihttKaMG4yWByR2g2dv2nG9CJ97
	jwPNgq+q8M6je/yuk2tNc0Rp6WuaI7r8IdQSBP+69CKHrpthZGsrubBg==
X-Received: by 2002:a05:600c:3545:b0:499:52dd:c1f0 with SMTP id 5b1f17b1804b1-49952ddd05amr374922395e9.1.1786291629734;
        Sun, 09 Aug 2026 09:07:09 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:09 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Sun,  9 Aug 2026 18:03:27 +0200
Message-ID: <20260809160643.33991-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090711_661452_536FEE35 
X-CRM114-Status: GOOD (  12.09  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..181d1b1ed9b3 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mediatek,mt6589-resets.h>
 
 / {
 	#address-cells = <1>;
@@ -147,6 +148,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


