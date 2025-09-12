Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28217CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 15:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HD3ANW+/BT63gkCknofN+lfkL9Q8HADeIknYUxJB2Y8=; b=dwiofk6qq/T9He9jCLcm6I57Gn
	4tbX92uaAKIrEfU8Y7yZml3OzUcLbGYoIQPKNyTA+F0PQ8RsfsPNKaJeDkjr4UYSXyXExabq3Mu4N
	rXngYYf/T/7YstNQFHjgD2VYehKSMUBqq98M4jB/qLMZcYnj91TQwkSNJPEeZ07NlWBsoAHpIJFRz
	3LPyjVC5w2Ky/+3P/qovLXonl+y2MuS1wMNqVjQCzJxjsoi6uhGW1bYhno7xMxHhHtxLeSqdUiAYq
	bs4aV0jndOkHpPdh+JuXpQX17JXge/YtnP6Dh/CcT8sNTOIK5Z4rd/806bZME3q3XPjb9uTzRrgh6
	X5Lk/1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5ta-0000000AJkJ-3ZXL;
	Fri, 12 Sep 2025 15:41:06 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux5tR-0000000AJeA-1nH9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 15:41:00 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CFeiZC634623;
	Fri, 12 Sep 2025 10:40:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757691644;
	bh=HD3ANW+/BT63gkCknofN+lfkL9Q8HADeIknYUxJB2Y8=;
	h=From:Date:Subject:References:In-Reply-To:To:CC;
	b=Q9z7mQDiu/Y1+5kPT2vQkApITYc+PsSuS7VEcgtCuQBLs+8cUygYM++dNCe5BDfJY
	 fBdA2Bx1ZaOPlVmG+ykab/+3FoQJwJ28kj9HUvYTyPYDqC9rCeuca9zrczn00WlmBt
	 OjfSvn+pB178Vx24b0PlJgg5pfrQf1ceeQ4Dfkqc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CFehXK1398277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 10:40:43 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 10:40:43 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 10:40:43 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CFehca4123678;
	Fri, 12 Sep 2025 10:40:43 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 12 Sep 2025 10:40:40 -0500
Subject: [PATCH v6 1/4] dt-bindings: arm: ti: Add binding for AM62L SoCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250912-am62lx-v6-1-29d5a6c60512@ti.com>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
In-Reply-To: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew
 Davis <afd@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        <linux-gpio@vger.kernel.org>, Bryan Brattlof <bb@ti.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1008; i=bb@ti.com;
 h=from:subject:message-id; bh=qmMFYrd/PSzL8e6/VRTNiSiKrwxX8Xq6GZVbqDFar5E=;
 b=owNCWmg5MUFZJlNZSfnnCAAAXH///7/vn7v2/f/xMC6b/d437xU26o+P/me3X+38v178/tewA
 Rss2Q9Q0aNGjRoANDRptINABoNAMQ0DEAaAMgBkGgAyA0wEaNNMmRgjaaQyPUDJNA0NAAGhoBoa
 A0AepkAAaaDAEaaAeoD1DTQ0ABp6j1GgGQBpo0ZNNMh6n6kQ0YmJkGjQMjIGgNAMmQxNGhphAAM
 gyaMjTJkAZAyAAMmjJoaNBoaNAaY9UDBn0QgDpwsUlFvARtKmsiYq+F6chzhY8b4wrdEjchC61w
 Tl3xp0wdhMnkLeDRYZhxuQ4oQj08KKWsBDXc+GMCRdOeU/tHmDlfsKhzhoR+U5WgMgWs2LTcacI
 A/EJ9H12SANOzexSysNMqiQtWygF3SYQ5d+n64NisX5hHG78wxSYKHTrAmuhhLSLWd1QQ0ZnShO
 9kAEO/Hapbo1OH6ETo3rlXNS8x0QpuVdSzN2JMJ7v8/twd2hNYSTBxGq08rzXxqBDEYMmDoJaB4
 U3UD96vpa+RNO9KpmQTqaaG5Wth+Zsf+ZRJr7CRo7PzIYUB+HNLr+kryGBEKq422GiWT+RN/1K9
 J6YHxbgcL5/R+NSHivKMWuBG/xKSw8QRStSpogn7hFUvbIKC/weZEFYy9A6Lx/AAEr87/ErPknY
 jyBOHxAM4AyU/xdyRThQkEn55wg
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_084057_557440_6AF67B55 
X-CRM114-Status: UNSURE (   9.63  )
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

Add the binding for TI's AM62L family of devices.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan Brattlof <bb@ti.com>
---
Changes in v1:
 - separated out devicetree bindings
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index e80c653fa4382acef964e182ecc4ae5445088936..d916c627eb619d16124772df5aacac9354126808 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -37,6 +37,12 @@ properties:
           - const: phytec,am62a-phycore-som
           - const: ti,am62a7
 
+      - description: K3 AM62L3 SoC and Boards
+        items:
+          - enum:
+              - ti,am62l3-evm
+          - const: ti,am62l3
+
       - description: K3 AM62P5 SoC and Boards
         items:
           - enum:

-- 
2.50.1


