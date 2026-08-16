Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA48C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 21:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJt7Jm9dS7j9+nHkmEwZyfgLjpjrq0IoWW70XFyDFMw=; b=pQQEIUpCxstuEUfi9bkT1KM8Sj
	zfVqvnhvRq4rFFghkLAFgQpLFUCTgO3nFluiiNJY2GBUA5k5ycKKXessU2r6wECBukvC8jpi59V6X
	LRRylyY0jf+z1UwuOytV2A91wWE+XC0U2DWgZ2PN7TDEOxwCwUBcCOGQZB2drSKbF5kakAdEw0pS9
	UIFhiHegyGC8+tQFrb2nddcor6GUM1S5n6lyR1exKmgttOU/vSXDFzDcI7RqyuEpoeS3A0H65mxYI
	O+6EKw7SMenGioXSj9wiyxV+5KfLnsXlZkFnbMlYdKU+Ze1nrefJutmgODDfEiPBx3SyDN48H6YPd
	BkvayBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviZk-000000057F3-12R6;
	Sun, 16 Aug 2026 21:39:28 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wviZf-000000057C4-0Gpp;
	Sun, 16 Aug 2026 21:39:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02E5611C1E9;
	Sun, 16 Aug 2026 23:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1786916357; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jJt7Jm9dS7j9+nHkmEwZyfgLjpjrq0IoWW70XFyDFMw=;
	b=JlmMipJYWFu50hMoEGIywKogQMbyPOoDgARWAYc+At18F4h07+HOt3ecGckmHhuBZb33oW
	TBLYWAM9eLJmAQx8JMo2uH5uxEEAYnIoEt0vMphwLPh0DNQnS6kSBh4095nSlnKBLgQpqW
	hAT8mY/6UP64AyzAT02vPMRXJpMW1iuVndThS0BUa1mCBNmMBZUn+P8P4faSDxVO+kG0LH
	mZgJrLoXjxl7DHSe7F+NP2yKDtYvBojl3fAkJlCdCjmlFFDH/goc9jS5S2vlaw7IPSZxAN
	zu+WBC6bZ8epiClcbWA0aU3WbEO5uyJDJG03ycUp3XkK/O1dfjW3TeTF6cQX3A==
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
Subject: [PATCH v2 3/9] dt-bindings: usb: generic-ehci: Document access-controllers property
Date: Sun, 16 Aug 2026 23:37:05 +0200
Message-ID: <20260816213849.1044073-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260816213849.1044073-1-marex@nabladev.com>
References: <20260816213849.1044073-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260816_143923_250173_5C038B08 
X-CRM114-Status: UNSURE (   8.80  )
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

Document the access-controllers for EHCI USB controllers in case
access checks need to be performed to use them.

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
V2: No change
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index ae9fb70d0212c..6bca56681cdfe 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -80,6 +80,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  access-controllers:
+    maxItems: 1
+
   dma-coherent: true
 
   interrupts:
-- 
2.53.0


