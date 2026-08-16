Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9620CC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9gDiM6QYxKqsu9piMSKyZoacoS5srL/I072hg/wVSw=; b=o4L+82XW5Z65gs9RrldwmEwPHm
	7yLN/yPRfRwXRP4yMDMn71SJeiAC8BoL8leyIeNZbZCpC0/uHxb66kGzib4X/RQFKTdvU1VjOqsCb
	1B5tZBq1OfMh+iSCEZSL8veIXBpeXMkb/cem+KXHgcLu3DgqdOm7rMwbP2FiRp2/90larrVpsY4aE
	QW1DAfSafhmsqmup2YLHU8qnxJqnJ/HB66nbP8jciPPMWRwU2nc21TPwxYTECEKUKy0H1BTDWasF4
	bcyBJB3PDTA3FLdEtKkMFpol+wz+HW2yN7qhPGl9Wd/Y4Kq9HVSp6K2S/McF8x59zwZv5yLESgj69
	UXHln1+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvia4-000000057VG-1cx4;
	Sun, 16 Aug 2026 21:39:48 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvia1-000000057S8-0bNB;
	Sun, 16 Aug 2026 21:39:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81DE511C1F8;
	Sun, 16 Aug 2026 23:39:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916378; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q9gDiM6QYxKqsu9piMSKyZoacoS5srL/I072hg/wVSw=;
	b=JREXHs+O5VqJVUtcQDAD8mewPHR0G15PUgucUQkeebLlgllxiG0zrNrcCsShLMdr8EsSXN
	sUUuORcEQFBQaMbuByzxm2ZLB4FwKjoUFO+3eEu9dw+gjueNAO+kkfEcC5KZthuOzlXahJ
	lMC3aW3WZPyYB9hjqoueze8VPvuX/TGcsu5RqoFxpbhoh3OkRDvKWQMunWW2lj4yN4CovT
	UFtv4AsTWx4zxynMTW0acRtNLcQn+cdKeEIsJH5OXDbGxafen1aKLFvnELsMpANBPBxGjg
	c6wnRpl4Kx0Fp7Y8QAgr69/yemFDoUwuLKNX79FNhyOh7GZQUdGcEi6/eh9mlA==
From: Marek Vasut <marex@nabladev.com>
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Rob Herring <robh@kernel.org>,
	Rosen Penev <rosenp@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 7/9] dt-bindings: arm: stm32: Switch st,stm32mp23/25-syscfg into simple-mfd
Date: Sun, 16 Aug 2026 23:37:09 +0200
Message-ID: <20260816213849.1044073-8-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_143945_456086_DA7384DD 
X-CRM114-Status: UNSURE (   8.17  )
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

The st,stm32mp23-syscfg and st,stm32mp25-syscfg can have subnodes, which
represent the USB 2.0 FEMTO-PHY. Turn the syscfg into "simple-mfd" so the
PHYs would get populated by the OS.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christian Bruel <christian.bruel@foss.st.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pankaj Dev <pankaj.dev@st.com>
Cc: Rahul Kumar <rahul.kumar05@st.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-usb@vger.kernel.org
---
V2: New patch
---
 .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index 95d2319afe235..ef640443dd239 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -22,11 +22,12 @@ properties:
               - st,stm32mp151-pwr-mcu
               - st,stm32mp157-syscfg
               - st,stm32mp21-syscfg
-              - st,stm32mp23-syscfg
-              - st,stm32mp25-syscfg
           - const: syscon
       - items:
-          - const: st,stm32-tamp
+          - enum:
+              - st,stm32-tamp
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
           - const: syscon
           - const: simple-mfd
 
-- 
2.53.0


