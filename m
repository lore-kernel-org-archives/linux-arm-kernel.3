Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D784F01808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHxI0KcvC0hQHUY3xCuzQ7WDC7Rb9FIALcH71AKbnJ8=; b=nedWrlhjy8QkNvRKibi5StJBWB
	xX7Rr7HR5pqI62ASlkhZB++h9j3QwWxMmOKsX0XhRJyRcRtjRmZEHPjwq71H2DboU858Zw9z8BUIm
	nmVBqGcIsc+CS9BoKeotAWaXqTCNWKFU74fPH/MUWafKRQXkrhnY2N7bGWRfV1r5hpzOr+L5nGTLw
	WM48lkjBwkNNzvfZ6x0Pwv30iw68AfXNJRuSrhjaVQYKhks23qolkiacug4Y0IX+pQ0+EO9jtvYHN
	GrRPYPiRq6yHoIO/PIFyst0kNaZcFJwDGkAfVOgSH/8FqFtoKsppE7T6emv5rKYALUmhciDjpV1+L
	I1QOlzzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1x-00000003Bgr-2CzY;
	Fri, 06 Mar 2026 07:55:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1s-00000003Bah-26KE;
	Fri, 06 Mar 2026 07:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WHxI0KcvC0hQHUY3xCuzQ7WDC7Rb9FIALcH71AKbnJ8=; b=CYEPhhL/1WxHYDDCATK8XcgR/e
	9/lICo7z0a4E1ZSUC3Wr1T78S244ExIJ3J/8o+UNYAkcRkYAS9bJIzUN+QLZbOFKxmq1nFHEw4Lyj
	drrkzJdz80QOt4c0/Z5ShvLXjzy+zvhxo+ImrzwRzKqTsvgbNe1ZOXIzhYUaWSg4NGR1IDe27mZFT
	TIIMahwtB8sxSOzFo1LI1WgAnXOkcQTSnEXF83qT21HsnoUGk1utEtbgUNFbAsxHPZfyJ8I1B5tNu
	X3q1nlsToVZ7OKSfdHhjMLiCtEGkMuYb8u+8KjlvC7L+YbBDnIc7Rsh/ORq5n6OF+qfNIROo2kMrU
	QwKm/SkA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyQ1m-00000008EL1-1N0K;
	Fri, 06 Mar 2026 07:55:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 6267qlOhB2977167, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1772783567; bh=WHxI0KcvC0hQHUY3xCuzQ7WDC7Rb9FIALcH71AKbnJ8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=T8M9ivXcSkwLljPsk62OYcbEefHZJKiw9hdEsJRRv22kgZb8lchnT9gjCAAkauSaa
	 HiPOrcepSzEKcU9CBhcwmKVACu5M/yydjt0+jaTuFiaXvHKnUOAEC+lr1svKHlqCLV
	 RDBwNRcZPKEljXGj3nwBQ9ISrg5+dKMUe61L5X9jLwnFeuKhEEw9yxACJIx/LqO4X8
	 Z9MOqvFROG4nkecn68HJggp2618ZSNwosarY4obmO/VH9ov3QxsOeMPNVPH774XKJh
	 uLvTYva8QvXZjyeboiwFj+FQKpU54xBM4+rWXcIpc7lp6J5cZBHbVWGBj2h2j6MkkG
	 1yftpoZvpS/Dw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 6267qlOhB2977167
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Mar 2026 15:52:47 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 6 Mar 2026 15:52:47 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 6 Mar 2026 15:52:47 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <linusw@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <bartosz.golaszewski@oss.qualcomm.com>,
        <afaerber@suse.com>
CC: <james.tai@realtek.com>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        <tychang@realtek.com>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>
Subject: [PATCH v2 09/14] dt-bindings: pinctrl: realtek: Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'
Date: Fri, 6 Mar 2026 15:52:39 +0800
Message-ID: <20260306075244.1170399-10-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260306075244.1170399-1-eleanor.lin@realtek.com>
References: <20260306075244.1170399-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_075519_461512_5CC1B0F3 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Tzuyi Chang <tychang@realtek.com>

Rename 'realtek,duty-cycle' to 'realtek,pulse-width-adjust'.

The previous name was misleading because this hardware block is not a PWM
generator. It does not generate a signal with a specific frequency and
duty ratio.

Instead, it provides a fixed nanosecond-level adjustment to the rising/
falling edges of an existing signal.

Signed-off-by: Tzuyi Chang <tychang@realtek.com>
Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml       | 9 ++++++---
 .../bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml       | 9 ++++++---
 .../bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml       | 9 ++++++---
 3 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
index 90bd49d87d2e..7b3888b2cea8 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1315e-pinctrl.yaml
@@ -133,10 +133,13 @@ patternProperties:
         minimum: 0
         maximum: 7
 
-      realtek,duty-cycle:
+      realtek,pulse-width-adjust:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
index b6211c8544ca..3b9e50ebd49b 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1319d-pinctrl.yaml
@@ -132,10 +132,13 @@ patternProperties:
         minimum: 0
         maximum: 7
 
-      realtek,duty-cycle:
+      realtek,pulse-width-adjust:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
diff --git a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
index e88bc649cc73..6246f1693a64 100644
--- a/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/realtek,rtd1619b-pinctrl.yaml
@@ -131,10 +131,13 @@ patternProperties:
         minimum: 0
         maximum: 7
 
-      realtek,duty-cycle:
+      realtek,pulse-width-adjust:
         description: |
-          An integer describing the level to adjust output duty cycle, controlling
-          the proportion of positive and negative waveforms in nanoseconds.
+          An integer describing the level to adjust the output pulse width, it
+          provides a fixed nanosecond-level adjustment to the rising/falling
+          edges of an existing signal. It is used for Signal Integrity tuning
+          (adding/subtracting delay to fine-tune the high/low duration), rather
+          than generating a specific PWM frequency.
           Valid arguments are described as below:
           0: 0ns
           2: + 0.25ns
-- 
2.34.1


